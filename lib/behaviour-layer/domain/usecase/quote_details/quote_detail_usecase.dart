import 'package:common/behaviour-layer/domain/usecase/base/params.dart';
import 'package:common/behaviour-layer/shared/const/error_type.dart';
import 'package:common/behaviour-layer/shared/model/app_error.dart';
import 'package:common/behaviour-layer/shared/model/base_error.dart';
import 'package:common/behaviour-layer/shared/model/error_info.dart';
import 'package:dartz/dartz.dart';
import 'package:common/behaviour-layer/domain/usecase/base/base_usecase.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/const/usecases_error.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quote_details_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';
import 'package:common/behaviour-layer/shared/utils/validator.dart';

class QuoteDetailsUseCase
    extends BaseUseCase<BaseError, QuoteDetailsUseParams, QuoteDetailsEntity> {
  final QuotesRepository quotesRepository;

  QuoteDetailsUseCase({required this.quotesRepository});

  @override
  Future<Either<BaseError, QuoteDetailsEntity>> execute(
      {required QuoteDetailsUseParams params}) async {
    return quotesRepository.getQuoteDetailsById(
        selectedQuoteId: params.selectedQuoteId);
  }
}

class QuoteDetailsUseParams extends Params {
  final String selectedQuoteId;

  QuoteDetailsUseParams({required this.selectedQuoteId});

  @override
  Either<AppError, bool> verify() {
    if (Validator.isEmpty(selectedQuoteId)) {
      return Left(
        AppError(
          type: ErrorType.uiSelectedQuoteIdEmptyError,
          throwable: Exception(),
          error: ErrorInfo(message: UseCasesErrors.requireId),
        ),
      );
    } else {
      return const Right(true);
    }
  }
}
