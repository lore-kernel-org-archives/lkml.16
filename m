Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC711221265
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747843466; cv=none; b=cVbWGBlGSxdfY5SVhTwyCsK62usGtAYHycTCHARTLC02QkDtAm+sr1KDZF8RXQJ49wQ4gG1fRwSlX47SEwS/610WaJ4v8IfCiKhiMMFtmICiCfKXoKdPsSmv0J3w1g3KTllf0jo6L2FyCtipRJI7WdMDw9HJL1k9/+gqHWCW6DE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747843466; c=relaxed/simple;
	bh=rywf19OsznyC+v7V4zAzSM3BjlccRhSLtmaCmitX/Dg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=KR6/TJOzD5tr5+AQzotGrRKZDYWjsoN7uZUExuWKF1fGEXJPD30Mg+Mp2t2OJ+Hz+gisyAy+WWFTGdrRs9XH7rYLjvRaCmaO9Rg3j8/4XgFzZzlz8UX8g/FBS+0lFOWwSqv7G0n8dU1CEadNe8g27aMrUK8gd0D1L1Tdf2+vgZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a1wREfmJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a1wREfmJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08EBBC4CEE4;
	Wed, 21 May 2025 16:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747843466;
	bh=rywf19OsznyC+v7V4zAzSM3BjlccRhSLtmaCmitX/Dg=;
	h=From:To:Cc:Subject:Date:From;
	b=a1wREfmJir1pOx2iCobdRb1DIDyAgPtTxED+OvaqDLjW5q3YhHJQckxBzMQKdiQwP
	 Zkd5Knn9olzOSxC6xFLTPpwyhk8/6ERckuXflpOHJjUOCox7RXmP72dFF3rbIJfLkD
	 IvJVidp8XUhAnqzESMBqUkBcRdYcvwDdcyuHNzvneVG0IS3HwsNnP1eUGvpfPu1ULQ
	 MgW0h19jYnsDwJz/ISoUL4Di29k41KlDWAr0nyofe+Ic+GzvB/HL3B/7f0i7xAvtKJ
	 6YsD6CP1hgjeW2vjq9ZWevHuo1ccJmJr7kaKgzUcGwNcK/xJvpDPfmEK/bfvDbvhvi
	 eG3TeW84AJnSA==
From: Arnd Bergmann <arnd@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Coiby Xu <coxu@redhat.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Christoph Hellwig <hch@lst.de>,
	Sagi Grimberg <sagi@grimberg.me>,
	Chaitanya Kulkarni <kch@nvidia.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Breno Leitao <leitao@debian.org>,
	Jens Axboe <axboe@kernel.dk>,
	linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] crash_dump, nvme: select CONFIGFS_FS as built-in
Date: Wed, 21 May 2025 18:03:19 +0200
Message-Id: <20250521160359.2132363-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Configfs can be configured as a loadable module, which causes a link-time
failure for dm-crypt crash dump support:

crash_dump_dm_crypt.c:(.text+0x3a4): undefined reference to `config_item_init_type_name'
aarch64-linux-ld: kernel/crash_dump_dm_crypt.o: in function `configfs_dmcrypt_keys_init':
crash_dump_dm_crypt.c:(.init.text+0x90): undefined reference to `config_group_init'
aarch64-linux-ld: crash_dump_dm_crypt.c:(.init.text+0xb4): undefined reference to `configfs_register_subsystem'
aarch64-linux-ld: crash_dump_dm_crypt.c:(.init.text+0xd8): undefined reference to `configfs_unregister_subsystem'

This could be avoided with a dependency on CONFIGFS_FS=y, but the dependency has
an additional problem of causing Kconfig dependency loops since most other uses
select the symbol.

Using a simple 'select CONFIGFS_FS' here in turn fails with CONFIG_DM_CRYPT=m,
because that still only causes configfs to be a loadable module.

The only version I found that fixes this reliably uses an additional Kconfig
symbol to ensure the 'select' actually turns on configfs as builtin, with
two additional changes to avoid dependency loops with nvme and sysfs.

There is no compile-time dependency between configfs and sysfs, so selecting
configfs from a driver with sysfs disabled does not cause link failures, only
the default /sys/kernel/config mount point will not be created.

Fixes: 6b23858fd63b ("crash_dump: make dm crypt keys persist for the kdump kernel")
Fixes: 1fb470408497 ("nvme-loop: add configfs dependency")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/nvme/target/Kconfig | 2 +-
 fs/configfs/Kconfig         | 1 -
 kernel/Kconfig.kexec        | 8 +++++++-
 3 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/nvme/target/Kconfig b/drivers/nvme/target/Kconfig
index 4c253b433bf7..4904097dfd49 100644
--- a/drivers/nvme/target/Kconfig
+++ b/drivers/nvme/target/Kconfig
@@ -3,7 +3,7 @@
 config NVME_TARGET
 	tristate "NVMe Target support"
 	depends on BLOCK
-	depends on CONFIGFS_FS
+	select CONFIGFS_FS
 	select NVME_KEYRING if NVME_TARGET_TCP_TLS
 	select KEYS if NVME_TARGET_TCP_TLS
 	select SGL_ALLOC
diff --git a/fs/configfs/Kconfig b/fs/configfs/Kconfig
index 272b64456999..1fcd761fe7be 100644
--- a/fs/configfs/Kconfig
+++ b/fs/configfs/Kconfig
@@ -1,7 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0-only
 config CONFIGFS_FS
 	tristate "Userspace-driven configuration filesystem"
-	select SYSFS
 	help
 	  configfs is a RAM-based filesystem that provides the converse
 	  of sysfs's functionality. Where sysfs is a filesystem-based
diff --git a/kernel/Kconfig.kexec b/kernel/Kconfig.kexec
index 4e7cee4e4ffc..e64ce21f9a80 100644
--- a/kernel/Kconfig.kexec
+++ b/kernel/Kconfig.kexec
@@ -134,12 +134,18 @@ config CRASH_DM_CRYPT
 	depends on KEXEC_FILE
 	depends on CRASH_DUMP
 	depends on DM_CRYPT
-	depends on CONFIGFS_FS
 	help
 	  With this option enabled, user space can intereact with
 	  /sys/kernel/config/crash_dm_crypt_keys to make the dm crypt keys
 	  persistent for the dump-capture kernel.
 
+config CRASH_DM_CRYPT_CONFIGS
+	def_tristate CRASH_DM_CRYPT
+	select CONFIGFS_FS
+	help
+	  CRASH_DM_CRYPT cannot directly select CONFIGFS_FS, because that
+	  is required to be built-in.
+
 config CRASH_HOTPLUG
 	bool "Update the crash elfcorehdr on system configuration changes"
 	default y
-- 
2.39.5

