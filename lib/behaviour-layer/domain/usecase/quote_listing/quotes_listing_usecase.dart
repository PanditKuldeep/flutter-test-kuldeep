import 'package:common/behaviour-layer/domain/usecase/base/params.dart';
import 'package:common/behaviour-layer/shared/model/app_error.dart';
import 'package:common/behaviour-layer/shared/model/base_error.dart';
import 'package:dartz/dartz.dart';
import 'package:common/behaviour-layer/domain/usecase/base/base_usecase.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/entity/quotes_list_entity.dart';
import 'package:srijan_technologies_assessment/behaviour-layer/domain/repository/quotes_repository.dart';

class QuotesListingUseCase extends BaseUseCase<BaseError,
    QuotesListingUseParams, List<QuotesListingEntity>> {
  QuotesRepository quotesRepository;

  QuotesListingUseCase(this.quotesRepository);

  @override
  Future<Either<BaseError, List<QuotesListingEntity>>> execute(
      {required QuotesListingUseParams params}) async {
    return quotesRepository.getQuotesListing(params.pageLimit);
  }
}

class QuotesListingUseParams extends Params {
  final int pageLimit;

  QuotesListingUseParams([this.pageLimit = 50]);

  @override
  Either<AppError, bool> verify() {
    return const Right(true);
  }
}
