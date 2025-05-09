Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7216B290BB4
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 12:25:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793501; cv=none; b=YXqX4B3rgM7ETo/KTNAoJmy29if1JoKys32iLuLfl3AgUHZYlfrIplMfJBAwkFb9V5wbQth28SfAlBiEstg1OAipZafq4H3RQWNaO+e4Ce/LmvVXEa53rlj4GCIoCuDvSq5wMCUvtKFB9fgeeJkn0qYm7MuUelqsnR2t+KFE0gE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793501; c=relaxed/simple;
	bh=8tiCEG/Ty13jXmzt2yqaeYzw3QEM8nhZilKHFPi1Kfg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jrOOmpO+1xETwWm8UdJaoIg16Yha1COHQudVCTXe4KTy9KAQ/isPntjfRTsg80bHO7ZgC0/29YdSaYtrk2LogkR0dOBprC8Qb28uQK48HDX6f2k28BLCIOXx1NZACOnBKhhW4IflOpvEh0r63htKhmB0G9OGJ0yU3663ZJgHCCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hOD8bXDz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hOD8bXDz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E31FDC4CEEB;
	Fri,  9 May 2025 12:24:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746793501;
	bh=8tiCEG/Ty13jXmzt2yqaeYzw3QEM8nhZilKHFPi1Kfg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=hOD8bXDzRcvgrYOc1Zue/J/ESvhXwILq9gYKuEAc3tJycVXHPZdPNucJv6YM+gi6Z
	 EB+NtSm5lgg+TN+bVtafWtLBQ7uwhMWaLXoQTidYLhvgq+8GCbXTYth9iPhfzj11zR
	 KRj8qq2Ty8V4aOYakKdefOXG/vR1EycrX1TpBmG0e1pQJPD/1TvoXHHYPmCkXMUlt7
	 rEEcIcTMW3hCrqSeyxTN0tqey5LGiO56HYaOmhLpe1Gl8FG9k1BME66JxA6EugFGae
	 6SJrbAVdW+agRkHc+23bPdO0JON7fwlLBeN3uCGCYXe/h/Qpwg7//YnFs7vjt5a25N
	 eD2f3R/K8Z5jg==
From: srini@kernel.org
To: gregkh@linuxfoundation.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>,
	Srinivas Kandagatla <srini@kernel.org>
Subject: [PATCH 1/3] nvmem: Remove unused nvmem cell table support
Date: Fri,  9 May 2025 13:24:50 +0100
Message-ID: <20250509122452.11827-2-srini@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250509122452.11827-1-srini@kernel.org>
References: <20250509122452.11827-1-srini@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Geert Uytterhoeven <geert+renesas@glider.be>

Board files are deprecated by DT, and the last user of
nvmem_add_cell_table() was removed by commit 2af4fcc0d3574482 ("ARM:
davinci: remove unused board support") in v6.3.  Hence remove all
support for nvmem cell tables, and update the documentation.

Device drivers can still register a single cell using
nvmem_add_one_cell() (which was not documented before).

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Acked-by: Arnd Bergmann <arnd@arndb.de>
Signed-off-by: Srinivas Kandagatla <srini@kernel.org>
---
 Documentation/driver-api/nvmem.rst | 14 ++----
 drivers/nvmem/core.c               | 68 ------------------------------
 include/linux/nvmem-provider.h     | 24 -----------
 3 files changed, 4 insertions(+), 102 deletions(-)

diff --git a/Documentation/driver-api/nvmem.rst b/Documentation/driver-api/nvmem.rst
index 5d9500d21ecc..790e2dc652c0 100644
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
index e206efc29a00..fd2a9698d1c9 100644
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
 
@@ -719,41 +716,6 @@ int nvmem_unregister_notifier(struct notifier_block *nb)
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
@@ -1040,10 +1002,6 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 			goto err_remove_cells;
 	}
 
-	rval = nvmem_add_cells_from_table(nvmem);
-	if (rval)
-		goto err_remove_cells;
-
 	if (config->add_legacy_fixed_of_cells) {
 		rval = nvmem_add_cells_from_legacy_of(nvmem);
 		if (rval)
@@ -2151,32 +2109,6 @@ int nvmem_device_write(struct nvmem_device *nvmem,
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
index 515676ebe598..615a560d9edb 100644
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

