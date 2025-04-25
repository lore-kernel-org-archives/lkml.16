Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD5E2356C7;
	Fri, 25 Apr 2025 08:18:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569087; cv=none; b=VLjLY8KBDn/62Ofg7OL57teHjvSNy0Zrbr3TDjj9EmX1rhdJIBjkQ0x2lHbRx/f0ZW161rOZC9M25OcaVTpowMLIVzqd1PBAdzcbANmJNnyLgGr8ZhXoxfQgquEKsBZcofA60JZw3JVpP1T5PRl0ytuo6H3zi+DKbriL58n8yY4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569087; c=relaxed/simple;
	bh=awlsyWniRYN33HA6T5LMHEhBqINnT7MkKK/HVcaeYj8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EjGY0UBPjNpIBJRk6pWbQiNL+uvwDW9/2jSy/XEE+643+H62Qpzhlf65yukBVALgyOC306Nyk64iWAIGaRmd/1GPdoHGUPN0ZFGi4dG/r5ORzsqwA+PUw8wptJs3ahFS5md4Rqc18yfi4Gr2KzpcaKladvnYEyFY1vOjft7Q9aM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XEmReszk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XEmReszk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DF87C4CEE4;
	Fri, 25 Apr 2025 08:18:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745569087;
	bh=awlsyWniRYN33HA6T5LMHEhBqINnT7MkKK/HVcaeYj8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XEmReszkyNQwwmdAO5OadikL0bbOX6qLbQ3PfET5+lVL7L61pg2k2P6+aE9Sh8v/s
	 RGJlz+t+W/hwrAgsTjwlyRH5dovYPo6yJrsmD/JPF6UzB7++rJ8Y4QPfWj7nb37UJl
	 cq1VUjvN2RwSmaagRT4LMg5jAIlIM4Tq6UHNaoSGe0ROnTJBG2NDFHyVXIhtThe6ZU
	 mNn8wUkQqLY+JliOCYM5EYyWm+CM8IWOxFVgLv9f4/E5jwdWJFs9KyWwcR+560iIqh
	 wcwDx0O0M/Om45LH4OmF3ndECHT9jjGICtvvQJaPDu2Q+whpEdoa07T+ZU0UO9SWgO
	 1Oguy2HM0Ngdw==
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
	Damien Le Moal <dlemoal@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	sound-open-firmware@alsa-project.org
Subject: [PATCH v3 3/4] AsoC: intel: atom: Use pure devres PCI
Date: Fri, 25 Apr 2025 10:17:42 +0200
Message-ID: <20250425081742.61623-5-phasta@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250425081742.61623-2-phasta@kernel.org>
References: <20250425081742.61623-2-phasta@kernel.org>
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
 sound/soc/intel/atom/sst/sst_pci.c | 59 ++++++++++++------------------
 1 file changed, 24 insertions(+), 35 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index d1e64c3500be..bf2330e6f5a4 100644
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
@@ -167,7 +157,6 @@ static void intel_sst_remove(struct pci_dev *pci)
 
 	sst_context_cleanup(sst_drv_ctx);
 	pci_dev_put(sst_drv_ctx->pci);
-	pci_release_regions(pci);
 	pci_set_drvdata(pci, NULL);
 }
 
-- 
2.48.1

