Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829021940A2;
	Wed, 16 Apr 2025 13:13:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744809200; cv=none; b=KcRhVpLezwxDePrSTcIC7P43k9nJORwk9jQdX4xJJ6Ttwfb1x6+pCHokNPmZ8QpTTHuGoEfS3zPmuTmpKxYq59Aok4PNj/emNbZlwB+nOv/F5qLyfVeyicouOT/H+9gdAZStYv4M4YFEsx4lYrjW3OeWg4SCZMsg8w/oy5uoAaQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744809200; c=relaxed/simple;
	bh=JJqlW6rkxVse8XmNftPjMwgYAiaTh4ve0xsdKDggTuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WcYWIM7jOCw5pJC4lwY/PQXWNtXCSuC4ZWwiMF4XyYfVIzwbS8qEeEGJJ2TZY2koHZDeT3WPyFiQxBcg5sG4RQyICcPd64k3t9EV+WhnlQnPF/xR1Ci/Qfy0H3opNX0CgeOvDZ7+tuyUV2LpD5gfSR5qkdxQx3I/S8n4cyg9wTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u6yPGwFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u6yPGwFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A945FC4CEED;
	Wed, 16 Apr 2025 13:13:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744809199;
	bh=JJqlW6rkxVse8XmNftPjMwgYAiaTh4ve0xsdKDggTuY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=u6yPGwFfozHiDTT4YXOFdHZi0cqoPPAsxvzvgbnfVxiVdmK8LTrEX4OAiGHRn+Cls
	 YimDTBmKW0T8MmpWO/rBS1uQhEVM0wFXhcqzmdTDLtavGxaqHfeIO1yZb8ZR0TBaTZ
	 0P/5LAW/uWJBwumVS+lAZCK2oy7M9jWbUbV6DU+k5Qq0gtgN6rX2YHDV9hEIijH9TC
	 u1zODr4blu/w0CZ5qYIiv0x+gRVL3baVggamnmUZ/JPTAheyAMEi1SLn1ZTx61OH+K
	 Ip5ei/bpS7yruBgzbQg3qy7c0HMvtg7Wdhd46YagDzvP3Hn2L/squSKbZkpKd42Rbw
	 YPc5t3zhDztPg==
From: Philipp Stanner <phasta@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Jaya Kumar <jayakumar.alsa@gmail.com>,
	Clemens Ladisch <clemens@ladisch.de>,
	Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Colin Ian King <colin.i.king@gmail.com>,
	Philipp Stanner <phasta@kernel.org>,
	David Rhodes <drhodes@opensource.cirrus.com>,
	liujing <liujing@cmss.chinamobile.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Andres Urian Florez <andres.emb.sys@gmail.com>,
	Oswald Buddenhagen <oswald.buddenhagen@gmx.de>,
	Thorsten Blum <thorsten.blum@linux.dev>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH 03/31] AsoC: intel/atom: Use pure devres PCI
Date: Wed, 16 Apr 2025 15:12:13 +0200
Message-ID: <20250416131241.107903-4-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250416131241.107903-1-phasta@kernel.org>
References: <20250416131241.107903-1-phasta@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

pci_request_regions() is a hybrid function which becomes managed if
pcim_enable_device() was called before. This hybrid nature is deprecated
and should not be used anymore.

Replace pci_request_regions() with the always-managed function
pcim_request_all_regions().

Remove the call to pci_release_regions(), since pcim_ functions do
cleanup automatically.

Pass 0 as length parameter to pcim_iomap(), which is the standard way
for ioremapping an entire BAR.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/soc/intel/atom/sst/sst_pci.c | 56 ++++++++++++------------------
 1 file changed, 23 insertions(+), 33 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index d1e64c3500be..102d4b0e6125 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -26,7 +26,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	int ddr_base, ret = 0;
 	struct pci_dev *pci = ctx->pci;
 
-	ret = pci_request_regions(pci, SST_DRV_NAME);
+	ret = pcim_request_all_regions(pci, SST_DRV_NAME);
 	if (ret)
 		return ret;
 
@@ -38,66 +38,56 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 		ddr_base = relocate_imr_addr_mrfld(ctx->ddr_base);
 		if (!ctx->pdata->lib_info) {
 			dev_err(ctx->dev, "lib_info pointer NULL\n");
-			ret = -EINVAL;
-			goto do_release_regions;
+			return -EINVAL;
 		}
 		if (ddr_base != ctx->pdata->lib_info->mod_base) {
 			dev_err(ctx->dev,
 					"FW LSP DDR BASE does not match with IFWI\n");
-			ret = -EINVAL;
-			goto do_release_regions;
+			return -EINVAL;
 		}
 		ctx->ddr_end = pci_resource_end(pci, 0);
 
-		ctx->ddr = pcim_iomap(pci, 0,
-					pci_resource_len(pci, 0));
-		if (!ctx->ddr) {
-			ret = -EINVAL;
-			goto do_release_regions;
-		}
+		ctx->ddr = pcim_iomap(pci, 0, 0);
+		if (!ctx->ddr)
+			return -EINVAL;
+
 		dev_dbg(ctx->dev, "sst: DDR Ptr %p\n", ctx->ddr);
 	} else {
 		ctx->ddr = NULL;
 	}
 	/* SHIM */
 	ctx->shim_phy_add = pci_resource_start(pci, 1);
-	ctx->shim = pcim_iomap(pci, 1, pci_resource_len(pci, 1));
-	if (!ctx->shim) {
-		ret = -EINVAL;
-		goto do_release_regions;
-	}
+	ctx->shim = pcim_iomap(pci, 1, 0);
+	if (!ctx->shim)
+		return -EINVAL;
+
 	dev_dbg(ctx->dev, "SST Shim Ptr %p\n", ctx->shim);
 
 	/* Shared SRAM */
 	ctx->mailbox_add = pci_resource_start(pci, 2);
-	ctx->mailbox = pcim_iomap(pci, 2, pci_resource_len(pci, 2));
-	if (!ctx->mailbox) {
-		ret = -EINVAL;
-		goto do_release_regions;
-	}
+	ctx->mailbox = pcim_iomap(pci, 2, 0);
+	if (!ctx->mailbox)
+		return -EINVAL;
+
 	dev_dbg(ctx->dev, "SRAM Ptr %p\n", ctx->mailbox);
 
 	/* IRAM */
 	ctx->iram_end = pci_resource_end(pci, 3);
 	ctx->iram_base = pci_resource_start(pci, 3);
-	ctx->iram = pcim_iomap(pci, 3, pci_resource_len(pci, 3));
-	if (!ctx->iram) {
-		ret = -EINVAL;
-		goto do_release_regions;
-	}
+	ctx->iram = pcim_iomap(pci, 3, 0);
+	if (!ctx->iram)
+		return -EINVAL;
+
 	dev_dbg(ctx->dev, "IRAM Ptr %p\n", ctx->iram);
 
 	/* DRAM */
 	ctx->dram_end = pci_resource_end(pci, 4);
 	ctx->dram_base = pci_resource_start(pci, 4);
-	ctx->dram = pcim_iomap(pci, 4, pci_resource_len(pci, 4));
-	if (!ctx->dram) {
-		ret = -EINVAL;
-		goto do_release_regions;
-	}
+	ctx->dram = pcim_iomap(pci, 4, 0);
+	if (!ctx->dram)
+		return -EINVAL;
+
 	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
-do_release_regions:
-	pci_release_regions(pci);
 	return ret;
 }
 
-- 
2.48.1

