Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2E94278168;
	Wed, 23 Apr 2025 08:29:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745396975; cv=none; b=HoiDJjNpSWJrokKj3dHNmY+rmHlXFf2R/awqk+gejSxMNcJ2Hps1hAk9twkHqiNDvRSdy91mpVLuaMN4q97/qeRpS619gc3F1YEO00L4W2Nm4Fg+6/p4YL91nWu65CvLRZRFVlF7LnVDeU40Xljas5iakwQGDzomxd2TeixVSik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745396975; c=relaxed/simple;
	bh=5iBHc7VgEn5shkIz3z0HxP6l4p3zz5y59kKncMVQ9FE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=N59fEtSEYjpWuG3obcM069HKadn/jfS/aIzMQQSgAqaY0GqnWR1NYVHrR7OVaVI2uc+VupAbY7Ggjqx6lGSR0jqeKWsliAHZnFn9ZYjc3UOEKLBfe6D9digD2xtmXIVwfzI+NMsuNPoKIkAnFKSKUg8nWfaw/XXdrea6GSVmLXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MWEp5iG8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MWEp5iG8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A351C4CEE2;
	Wed, 23 Apr 2025 08:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745396975;
	bh=5iBHc7VgEn5shkIz3z0HxP6l4p3zz5y59kKncMVQ9FE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=MWEp5iG89G9HmLH0sN+9p4XixP1rEH2MtZ0lV+xfbZ+tWOIJdrUeFL7wJMzhrawFU
	 wkPZVJIL+G5RzSQbCmoAwP1NpsjMb7jJ4a6QBkkoCTti1UZi7Tmw8DS3ZhEzU1GbET
	 8z4xRKpWLURGC4txZBj8na4YABwkrq8C5qPs9KBgI6s+0UhCCFLa8JEHveNchiL5NN
	 eNYjaZm++cKad1d1NSRrTfvtdkKdxwok/3tiEQffsFQL18KjKAq/qW6uODo0vIHaf8
	 czBtfCW9wSjeSuTRf2kXLbN5+T2xeVhHyPipKEmX+9l52TErgdrwDYka2xNs1o9LoQ
	 h6pQ772/T4iSw==
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
Subject: [PATCH v2 4/4] AsoC: intel/atom: Return -ENOMEM if pcim_iomap() fails
Date: Wed, 23 Apr 2025 10:28:59 +0200
Message-ID: <20250423082858.49780-6-phasta@kernel.org>
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

The error checks for pcim_iomap() have the function return -EINVAL.
-ENOMEM is a more appropriate error code.

Replace -EINVAL with -ENOMEM.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
---
 sound/soc/intel/atom/sst/sst_pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index eadcf24cbdc3..edc86519816d 100644
--- a/sound/soc/intel/atom/sst/sst_pci.c
+++ b/sound/soc/intel/atom/sst/sst_pci.c
@@ -49,7 +49,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 
 		ctx->ddr = pcim_iomap(pci, 0, 0);
 		if (!ctx->ddr)
-			return -EINVAL;
+			return -ENOMEM;
 
 		dev_dbg(ctx->dev, "sst: DDR Ptr %p\n", ctx->ddr);
 	} else {
@@ -59,7 +59,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	ctx->shim_phy_add = pci_resource_start(pci, 1);
 	ctx->shim = pcim_iomap(pci, 1, 0);
 	if (!ctx->shim)
-		return -EINVAL;
+		return -ENOMEM;
 
 	dev_dbg(ctx->dev, "SST Shim Ptr %p\n", ctx->shim);
 
@@ -67,7 +67,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	ctx->mailbox_add = pci_resource_start(pci, 2);
 	ctx->mailbox = pcim_iomap(pci, 2, 0);
 	if (!ctx->mailbox)
-		return -EINVAL;
+		return -ENOMEM;
 
 	dev_dbg(ctx->dev, "SRAM Ptr %p\n", ctx->mailbox);
 
@@ -76,7 +76,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	ctx->iram_base = pci_resource_start(pci, 3);
 	ctx->iram = pcim_iomap(pci, 3, 0);
 	if (!ctx->iram)
-		return -EINVAL;
+		return -ENOMEM;
 
 	dev_dbg(ctx->dev, "IRAM Ptr %p\n", ctx->iram);
 
@@ -85,7 +85,7 @@ static int sst_platform_get_resources(struct intel_sst_drv *ctx)
 	ctx->dram_base = pci_resource_start(pci, 4);
 	ctx->dram = pcim_iomap(pci, 4, 0);
 	if (!ctx->dram)
-		return -EINVAL;
+		return -ENOMEM;
 
 	dev_dbg(ctx->dev, "DRAM Ptr %p\n", ctx->dram);
 	return 0;
-- 
2.48.1

