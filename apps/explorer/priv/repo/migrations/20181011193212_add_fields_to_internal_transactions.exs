defmodule Explorer.Repo.Migrations.AddFieldsToInternalTransactions do
  use Ecto.Migration

  def up do
    alter table("internal_transactions") do
      add(:block_number, :integer)
      add(:transaction_index, :integer)
    end

    execute("""
    UPDATE internal_transactions
    SET
      block_number = transactions.block_number,
      transaction_index = transactions.index
    FROM transactions
    WHERE internal_transactions.transaction_hash = transactions.hash;
    """)
  end

  def down do
    alter table("internal_transactions") do
      remove(:block_number)
      remove(:transaction_index)
    end
  end
end
