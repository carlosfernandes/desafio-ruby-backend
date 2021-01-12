class TransactionsController < ApplicationController
  def import_form
    render :import
  end

  def import
    count = TransactionService.execute(transaction_import_params[:file])

    redirect_to import_transactions_path, notice: "#{count} transactions imported."
  end

  private
  def transaction_import_params
    params.require(:upload).permit(:file)
  end
end
