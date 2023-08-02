#include "hash_table.h"

int main()
{
    ht_hash_table* ht = ht_new();

    ht_insert(ht, "H2-102", "Nikola Davidovic");
    ht_insert(ht, "G23-GDF1", "Noblice");
    ht_insert(ht, "MA24-FAF", "Dzivdzan");

    ht_delete(ht, "MA24-FAF");

    ht_print(ht);

    ht_del_hash_table(ht);
    return 0;
}