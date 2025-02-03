Received: from riemann.telenet-ops.be (riemann.telenet-ops.be [195.130.137.80])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6047205E01
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 13:38:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.130.137.80
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738589923; cv=none; b=I+qbGoZ5T2dkwOsDJ9w0E/xK3cc4TLbOO1En7UrqhiZrVj2eLfVR3otfr/xp4XtEHNR0pBMlGQCWcqNOPtz2m783fTzTnCP58/eG2lwp1W8ZA/UlWlg0YG4H9xrIgfq96jJtE6A0yvsxL0NRxUtCbFVZS6SucdboXGVRJgiebDU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738589923; c=relaxed/simple;
	bh=t4UMeabOUKxzvLuOSc6k1xPgb0/5QTRcn63YibAF5e8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YYRskdY1UZzb6KgAilPxOWlChisb16kC1dOZ+XxEOI90Es19dbXGadavKM6h1M9q/xI2IWCYpb9RLShxk75I3Lz7RMPUO1Ieo+SjXWuQ4fyFSCJzEUAesXmb+ZgL3Lt1NGMa26O3mMoHIzwz84z2UclLXpLfgXxWNUie9WJuAHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=none smtp.mailfrom=linux-m68k.org; arc=none smtp.client-ip=195.130.137.80
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux-m68k.org
Received: from albert.telenet-ops.be (albert.telenet-ops.be [IPv6:2a02:1800:110:4::f00:1a])
	by riemann.telenet-ops.be (Postfix) with ESMTPS id 4YmndN4GnYz4wwkn
	for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 14:38:32 +0100 (CET)
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:d465:743d:7f2:30d8])
	by albert.telenet-ops.be with cmsmtp
	id 91eQ2E00K4UDnen061eQsP; Mon, 03 Feb 2025 14:38:25 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1teweT-0000000Fclo-1MEK;
	Mon, 03 Feb 2025 14:38:24 +0100
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1tewee-00000003Lba-31IT;
	Mon, 03 Feb 2025 14:38:24 +0100
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: linux-m68k@lists.linux-m68k.org
Cc: linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] m68k: defconfig: Update defconfigs for v6.14-rc1
Date: Mon,  3 Feb 2025 14:38:23 +0100
Message-ID: <be6ac546f7b98eae352584daacc42a58577dc224.1738589762.git.geert@linux-m68k.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

  - Drop CONFIG_DM_KUNIT_TEST=m (auto-modular since commit
    55b7aee990ef7862 ("drivers: base: test: Enable device model tests
    with KUNIT_ALL_TESTS")),
  - Re-enable modular build of MD Linear (append) mode (revived in
    commit 127186cfb184eacc ("md: reintroduce md-linear").

Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
---
To be queued in the m68k tree for v6.13.

 arch/m68k/configs/amiga_defconfig    | 2 +-
 arch/m68k/configs/apollo_defconfig   | 2 +-
 arch/m68k/configs/atari_defconfig    | 2 +-
 arch/m68k/configs/bvme6000_defconfig | 2 +-
 arch/m68k/configs/hp300_defconfig    | 2 +-
 arch/m68k/configs/mac_defconfig      | 2 +-
 arch/m68k/configs/multi_defconfig    | 2 +-
 arch/m68k/configs/mvme147_defconfig  | 2 +-
 arch/m68k/configs/mvme16x_defconfig  | 2 +-
 arch/m68k/configs/q40_defconfig      | 2 +-
 arch/m68k/configs/sun3_defconfig     | 2 +-
 arch/m68k/configs/sun3x_defconfig    | 2 +-
 12 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/arch/m68k/configs/amiga_defconfig b/arch/m68k/configs/amiga_defconfig
index dbf2ea561c855130..f2e5e12cc1d03c3b 100644
--- a/arch/m68k/configs/amiga_defconfig
+++ b/arch/m68k/configs/amiga_defconfig
@@ -299,7 +299,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
 CONFIG_PARPORT_AMIGA=m
@@ -336,6 +335,7 @@ CONFIG_ATA=y
 CONFIG_PATA_GAYLE=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/apollo_defconfig b/arch/m68k/configs/apollo_defconfig
index b0fd199cc0a4e7b8..1180f137443f31bb 100644
--- a/arch/m68k/configs/apollo_defconfig
+++ b/arch/m68k/configs/apollo_defconfig
@@ -295,7 +295,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -316,6 +315,7 @@ CONFIG_SCSI_SAS_ATTRS=m
 CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/atari_defconfig b/arch/m68k/configs/atari_defconfig
index 51d8e9cecf40f699..5afe7d08b703da23 100644
--- a/arch/m68k/configs/atari_defconfig
+++ b/arch/m68k/configs/atari_defconfig
@@ -302,7 +302,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
 CONFIG_PARPORT_ATARI=m
@@ -331,6 +330,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/bvme6000_defconfig b/arch/m68k/configs/bvme6000_defconfig
index 8315a13bab73baa1..3e629428fd6607d3 100644
--- a/arch/m68k/configs/bvme6000_defconfig
+++ b/arch/m68k/configs/bvme6000_defconfig
@@ -292,7 +292,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -314,6 +313,7 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_BVME6000_SCSI=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/hp300_defconfig b/arch/m68k/configs/hp300_defconfig
index 350370657e5fe94d..62722d7746aacf8d 100644
--- a/arch/m68k/configs/hp300_defconfig
+++ b/arch/m68k/configs/hp300_defconfig
@@ -294,7 +294,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -315,6 +314,7 @@ CONFIG_SCSI_SAS_ATTRS=m
 CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/mac_defconfig b/arch/m68k/configs/mac_defconfig
index f942b4755702656f..c1dadb797cc646e9 100644
--- a/arch/m68k/configs/mac_defconfig
+++ b/arch/m68k/configs/mac_defconfig
@@ -293,7 +293,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_BLK_DEV_SWIM=m
 CONFIG_ZRAM=m
@@ -320,6 +319,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/multi_defconfig b/arch/m68k/configs/multi_defconfig
index b1eaad02efab92dc..3934e101a4abdfd8 100644
--- a/arch/m68k/configs/multi_defconfig
+++ b/arch/m68k/configs/multi_defconfig
@@ -313,7 +313,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
 CONFIG_PARPORT_PC=m
@@ -363,6 +362,7 @@ CONFIG_PATA_GAYLE=y
 CONFIG_PATA_BUDDHA=y
 CONFIG_PATA_PLATFORM=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/mvme147_defconfig b/arch/m68k/configs/mvme147_defconfig
index 6309a4442bb3f962..f7b5c669b789644a 100644
--- a/arch/m68k/configs/mvme147_defconfig
+++ b/arch/m68k/configs/mvme147_defconfig
@@ -291,7 +291,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -313,6 +312,7 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MVME147_SCSI=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/mvme16x_defconfig b/arch/m68k/configs/mvme16x_defconfig
index 3feb0731f8142d0c..82d6fb7cc6842cd8 100644
--- a/arch/m68k/configs/mvme16x_defconfig
+++ b/arch/m68k/configs/mvme16x_defconfig
@@ -292,7 +292,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -314,6 +313,7 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_MVME16x_SCSI=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/q40_defconfig b/arch/m68k/configs/q40_defconfig
index ea04b1b0da7d4661..17421379e4b114bd 100644
--- a/arch/m68k/configs/q40_defconfig
+++ b/arch/m68k/configs/q40_defconfig
@@ -293,7 +293,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_PARPORT=m
 CONFIG_PARPORT_PC=m
@@ -320,6 +319,7 @@ CONFIG_ATA=y
 # CONFIG_ATA_BMDMA is not set
 CONFIG_PATA_FALCON=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/sun3_defconfig b/arch/m68k/configs/sun3_defconfig
index f52d9af92153dbd3..906cb3e18d265294 100644
--- a/arch/m68k/configs/sun3_defconfig
+++ b/arch/m68k/configs/sun3_defconfig
@@ -288,7 +288,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -310,6 +309,7 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_SUN3_SCSI=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
diff --git a/arch/m68k/configs/sun3x_defconfig b/arch/m68k/configs/sun3x_defconfig
index f348447824da930f..b15b807600383c95 100644
--- a/arch/m68k/configs/sun3x_defconfig
+++ b/arch/m68k/configs/sun3x_defconfig
@@ -289,7 +289,6 @@ CONFIG_NET_IFE=m
 CONFIG_DEVTMPFS=y
 CONFIG_DEVTMPFS_MOUNT=y
 CONFIG_TEST_ASYNC_DRIVER_PROBE=m
-CONFIG_DM_KUNIT_TEST=m
 CONFIG_CONNECTOR=m
 CONFIG_ZRAM=m
 CONFIG_BLK_DEV_LOOP=y
@@ -311,6 +310,7 @@ CONFIG_ISCSI_TCP=m
 CONFIG_ISCSI_BOOT_SYSFS=m
 CONFIG_SUN3X_ESP=y
 CONFIG_MD=y
+CONFIG_MD_LINEAR=m
 CONFIG_BLK_DEV_DM=m
 CONFIG_DM_UNSTRIPED=m
 CONFIG_DM_CRYPT=m
-- 
2.43.0

