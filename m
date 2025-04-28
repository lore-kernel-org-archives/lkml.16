Received: from albert.telenet-ops.be (albert.telenet-ops.be [195.130.137.90])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA00225DB1A
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 11:56:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.90
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745841408; cv=none; b=Oc9LDZcBzyuqW2QsAIZ7KPxqQpfgMl83Kthvl+jGO9VvoW3KGQGvShmylk1RIRLH16DFAwMWUNPhER1i6ERBi6UjHN1oIWYiE93KX9MzfEdR1zbyx1I6AOl9O0SUoQ0VD2XN/GCOKkiTSaJanydMwLQXjFcGo6mRuUvYouvjd5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745841408; c=relaxed/simple;
	bh=wzm1eXQ1YFCUhGLq6tOsKVMzw5DGOSWMdTKgN5XiChM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YlJqzg5EaqByPQr8/7KpyI+lVIJczDGwy1E2IyHhI45BeRJetZOkhDDVNArkKfB1jxKlygTcUiglYjDpXiQYYLJlnKAiHbKwiBXpn5JXayAkzqoBSRU7jaitanLC6rzK5Diyhy2NHFkl6/z2Hi4ieGYPzzoOixrdk4GFOCTicGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.90
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=glider.be
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:b9c4:1670:abc0:a1fc])
	by albert.telenet-ops.be with cmsmtp
	id ibwc2E0084Aed8c06bwcF2; Mon, 28 Apr 2025 13:56:38 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9N6B-00000000F7M-0bTd;
	Mon, 28 Apr 2025 13:56:36 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u9N5x-00000006xI6-3POW;
	Mon, 28 Apr 2025 13:56:21 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: Srinivas Kandagatla <srini@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Arnd Bergmann <arnd@arndb.de>
Cc: linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH] nvmem: Remove unused nvmem cell table support
Date: Mon, 28 Apr 2025 13:56:15 +0200
Message-ID: <edc7373f33955f6dc4c9e6268afcb1a40566b39b.1745840884.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Board files are deprecated by DT, and the last user of
nvmem_add_cell_table() was removed by commit 2af4fcc0d3574482 ("ARM:
davinci: remove unused board support") in v6.3.  Hence remove all
support for nvmem cell tables, and update the documentation.

Device drivers can still register a single cell using
nvmem_add_one_cell() (which was not documented before).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
---
 Documentation/driver-api/nvmem.rst | 14 ++----
 drivers/nvmem/core.c               | 68 ------------------------------
 include/linux/nvmem-provider.h     | 24 -----------
 3 files changed, 4 insertions(+), 102 deletions(-)

diff --git a/Documentation/driver-api/nvmem.rst b/Documentation/driver-api/nvmem.rst
index 5d9500d21ecc4254..790e2dc652c00c3a 100644
--- a/Documentation/driver-api/nvmem.rst
+++ b/Documentation/driver-api/nvmem.rst
@@ -59,10 +59,10 @@ For example, a simple nvram case::
 	devm_nvmem_register(&config);
   }
 
-Users of board files can define and register nvmem cells using the
-nvmem_cell_table struct::
+Device drivers can define and register an nvmem cell using the nvmem_cell_info
+struct::
 
-  static struct nvmem_cell_info foo_nvmem_cells[] = {
+  static const struct nvmem_cell_info foo_nvmem_cell = {
 	{
 		.name		= "macaddr",
 		.offset		= 0x7f00,
@@ -70,13 +70,7 @@ nvmem_cell_table struct::
 	}
   };
 
-  static struct nvmem_cell_table foo_nvmem_cell_table = {
-	.nvmem_name		= "i2c-eeprom",
-	.cells			= foo_nvmem_cells,
-	.ncells			= ARRAY_SIZE(foo_nvmem_cells),
-  };
-
-  nvmem_add_cell_table(&foo_nvmem_cell_table);
+  int nvmem_add_one_cell(nvmem, &foo_nvmem_cell);
 
 Additionally it is possible to create nvmem cell lookup entries and register
 them with the nvmem framework from machine code as shown in the example below::
diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fff85bbf0ecd0f63..5070390c9f076a63 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -47,9 +47,6 @@ struct nvmem_cell {
 static DEFINE_MUTEX(nvmem_mutex);
 static DEFINE_IDA(nvmem_ida);
 
-static DEFINE_MUTEX(nvmem_cell_mutex);
-static LIST_HEAD(nvmem_cell_tables);
-
 static DEFINE_MUTEX(nvmem_lookup_mutex);
 static LIST_HEAD(nvmem_lookup_list);
 
@@ -705,41 +702,6 @@ int nvmem_unregister_notifier(struct notifier_block *nb)
 }
 EXPORT_SYMBOL_GPL(nvmem_unregister_notifier);
 
-static int nvmem_add_cells_from_table(struct nvmem_device *nvmem)
-{
-	const struct nvmem_cell_info *info;
-	struct nvmem_cell_table *table;
-	struct nvmem_cell_entry *cell;
-	int rval = 0, i;
-
-	mutex_lock(&nvmem_cell_mutex);
-	list_for_each_entry(table, &nvmem_cell_tables, node) {
-		if (strcmp(nvmem_dev_name(nvmem), table->nvmem_name) == 0) {
-			for (i = 0; i < table->ncells; i++) {
-				info = &table->cells[i];
-
-				cell = kzalloc(sizeof(*cell), GFP_KERNEL);
-				if (!cell) {
-					rval = -ENOMEM;
-					goto out;
-				}
-
-				rval = nvmem_cell_info_to_nvmem_cell_entry(nvmem, info, cell);
-				if (rval) {
-					kfree(cell);
-					goto out;
-				}
-
-				nvmem_cell_entry_add(cell);
-			}
-		}
-	}
-
-out:
-	mutex_unlock(&nvmem_cell_mutex);
-	return rval;
-}
-
 static struct nvmem_cell_entry *
 nvmem_find_cell_entry_by_name(struct nvmem_device *nvmem, const char *cell_id)
 {
@@ -1024,10 +986,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 			goto err_remove_cells;
 	}
 
-	rval = nvmem_add_cells_from_table(nvmem);
-	if (rval)
-		goto err_remove_cells;
-
 	if (config->add_legacy_fixed_of_cells) {
 		rval = nvmem_add_cells_from_legacy_of(nvmem);
 		if (rval)
@@ -2127,32 +2085,6 @@ int nvmem_device_write(struct nvmem_device *nvmem,
 }
 EXPORT_SYMBOL_GPL(nvmem_device_write);
 
-/**
- * nvmem_add_cell_table() - register a table of cell info entries
- *
- * @table: table of cell info entries
- */
-void nvmem_add_cell_table(struct nvmem_cell_table *table)
-{
-	mutex_lock(&nvmem_cell_mutex);
-	list_add_tail(&table->node, &nvmem_cell_tables);
-	mutex_unlock(&nvmem_cell_mutex);
-}
-EXPORT_SYMBOL_GPL(nvmem_add_cell_table);
-
-/**
- * nvmem_del_cell_table() - remove a previously registered cell info table
- *
- * @table: table of cell info entries
- */
-void nvmem_del_cell_table(struct nvmem_cell_table *table)
-{
-	mutex_lock(&nvmem_cell_mutex);
-	list_del(&table->node);
-	mutex_unlock(&nvmem_cell_mutex);
-}
-EXPORT_SYMBOL_GPL(nvmem_del_cell_table);
-
 /**
  * nvmem_add_cell_lookups() - register a list of cell lookup entries
  *
diff --git a/include/linux/nvmem-provider.h b/include/linux/nvmem-provider.h
index 515676ebe59875fa..615a560d9edb84d1 100644
--- a/include/linux/nvmem-provider.h
+++ b/include/linux/nvmem-provider.h
@@ -137,25 +137,6 @@ struct nvmem_config {
 	struct device		*base_dev;
 };
 
-/**
- * struct nvmem_cell_table - NVMEM cell definitions for given provider
- *
- * @nvmem_name:		Provider name.
- * @cells:		Array of cell definitions.
- * @ncells:		Number of cell definitions in the array.
- * @node:		List node.
- *
- * This structure together with related helper functions is provided for users
- * that don't can't access the nvmem provided structure but wish to register
- * cell definitions for it e.g. board files registering an EEPROM device.
- */
-struct nvmem_cell_table {
-	const char		*nvmem_name;
-	const struct nvmem_cell_info	*cells;
-	size_t			ncells;
-	struct list_head	node;
-};
-
 /**
  * struct nvmem_layout - NVMEM layout definitions
  *
@@ -190,9 +171,6 @@ void nvmem_unregister(struct nvmem_device *nvmem);
 struct nvmem_device *devm_nvmem_register(struct device *dev,
 					 const struct nvmem_config *cfg);
 
-void nvmem_add_cell_table(struct nvmem_cell_table *table);
-void nvmem_del_cell_table(struct nvmem_cell_table *table);
-
 int nvmem_add_one_cell(struct nvmem_device *nvmem,
 		       const struct nvmem_cell_info *info);
 
@@ -223,8 +201,6 @@ devm_nvmem_register(struct device *dev, const struct nvmem_config *c)
 	return nvmem_register(c);
 }
 
-static inline void nvmem_add_cell_table(struct nvmem_cell_table *table) {}
-static inline void nvmem_del_cell_table(struct nvmem_cell_table *table) {}
 static inline int nvmem_add_one_cell(struct nvmem_device *nvmem,
 				     const struct nvmem_cell_info *info)
 {
-- 
2.43.0

