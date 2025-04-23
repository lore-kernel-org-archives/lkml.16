Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5EEE27702E;
	Wed, 23 Apr 2025 08:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396970; cv=none; b=AZJmu8TroM96h9Ldcq+4A5shmbCGX0wtK4et31YWxr919yQVYKtIGxinMnptvQsUj3E85hs/71WTV9KRlAzwOWYynd6tOnLPlYBCHEM/Utn5dDgdCctKEKAK0QNrgLD2Vi1gF5sdZdyiHkXe32JlJ5abIUAfa1K6GPtXrTqRda4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396970; c=relaxed/simple;
	bh=cus0OmFcFt1BXBWMT7QS3EfOZuq5LaYdJToDhh6P5BQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RDrxcGXYyK2zvBhasvI7+yyTIl2z7vHdj+B5OqaDB1rh+h/HorKvB9cyiqmO04zWtCFIeHnrDR0TVIdSUpSs8Sxl19r9AfMAz+XlVBFg5e+Ou7juV1wS4/8eOaxKzq2iuImeW4xkdw9pPIADHEg43e4NkYNM6CVjB5DJwVDD0Gc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cWQwT6gE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cWQwT6gE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 77668C4CEEA;
	Wed, 23 Apr 2025 08:29:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745396970;
	bh=cus0OmFcFt1BXBWMT7QS3EfOZuq5LaYdJToDhh6P5BQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cWQwT6gEnVuDT2CpWyI2ghYNQq5Z0uSbmCQF1c57iSWkSIF6BNDVohvHg/51A76vV
	 xQXmJNvO30+rLiD8gkQQPCB3X184WK4IWtw/2Gz4SCz1+YKNyIquFPqq6wiJL5R5PP
	 TdIl1F5RkS2wmrsaIXlXstE7Th8ZXNousOs8zbPIXg/RjgAKjg+ETw7xD2WfWwTBsi
	 yLDrqxE9Vl/Mm59IHupv8pNZbLWGIPnd+toXI9NVth/SAw37HnWLDaakSIuoNbl85L
	 a6naGRooH8Se99TPRcEwF5NMfTu5irPq50IHJNEGJeuCtGWbqMIfm780//SAJBHqmZ
	 8XuwDGjlkdGjw==
From: Philipp Stanner <phasta@kernel.org>
To: Cezary Rojewski <cezary.rojewski@intel.com>,
	Liam Girdwood <liam.r.girdwood@linux.intel.com>,
	Peter Ujfalusi <peter.ujfalusi@linux.intel.com>,
	Bard Liao <yung-chuan.liao@linux.intel.com>,
	Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
	Kai Vehmanen <kai.vehmanen@linux.intel.com>,
	Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
	Mark Brown <broonie@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Daniel Baluta <daniel.baluta@nxp.com>,
	Philipp Stanner <phasta@kernel.org>,
	=?UTF-8?q?Amadeusz=20S=C5=82awi=C5=84ski?= <amadeuszx.slawinski@linux.intel.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Damien Le Moal <dlemoal@kernel.org>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v2 3/4] AsoC: intel/atom: Use pure devres PCI
Date: Wed, 23 Apr 2025 10:28:58 +0200
Message-ID: <20250423082858.49780-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250423082858.49780-2-phasta@kernel.org>
References: <20250423082858.49780-2-phasta@kernel.org>
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
 sound/soc/intel/atom/sst/sst_pci.c | 58 +++++++++++++-----------------
 1 file changed, 24 insertions(+), 34 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index d1e64c3500be..eadcf24cbdc3 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -26,7 +26,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	int ddr_base, ret = 0;
 	struct pci_dev *pci = ctx->pci;
 
-	ret = pci_request_regions(pci, SST_DRV_NAME);
+	ret = pcim_request_all_regions(pci, SST_DRV_NAME);
 	if (ret)
 		return ret;
 
@@ -38,67 +38,57 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
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
-	return ret;
+	return 0;
 }
 
 /*
-- 
2.48.1

