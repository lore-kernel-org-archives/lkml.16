Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93B252356A6;
	Fri, 25 Apr 2025 08:18:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745569092; cv=none; b=mSlfMQWe60+ZeaWF0mTXiCxwTB/F8JKoFfb6F6u3V8GJDU5+Rv/m1m+zf/09M3udsh17XIfpVKl1nQ5z8IV4GLWx+GPaHsfhca23Cup3qLIoircdCeZa+hLw/HBBE4NAa0v41nRH05srVe3qWeJTl5LDYeF2dGERLz2ewOBrtio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745569092; c=relaxed/simple;
	bh=vBvwTngtF1y3gEmzsBG3Ole+k2+llV0wO5j1OWtz3cU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Av4jdjC03x1ReIOKARbBt3loTBM4SiFEZi3gKu4Hw145bLGA1z+M0hQ12Y1ETP6Ezjlv7M9YOo1wPJo6riz0fL6FVUSW4P1G9Rmbv8ZkuO29WBTy+9aJvv4EW+paynFfMQ925BcMPXQHRMTPF15UB8KQbQcYsqoUat3esojJ+eA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s2dqp/1Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s2dqp/1Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB43CC4CEE4;
	Fri, 25 Apr 2025 08:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745569092;
	bh=vBvwTngtF1y3gEmzsBG3Ole+k2+llV0wO5j1OWtz3cU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s2dqp/1ZtDMF0/3m2Sgj/JqnJpL1j3Fa5gTBKgtpqy4pAYukdZiVnJcPm95z067J/
	 gVTGpWxG6Om5uwtxnptI1fV5MXhajBk3q1WvLCU6oZXyLidfIp9BDLKhn3St0IuxVM
	 gNvRHn3xhRsNLqx/M6/WxEhN1IWtXWjldZq8fqf9y/NVL7XFcISVYh0ceu0rGLxcIs
	 RoVsiYBS1bGEP3VdHJ9Rg5h4b+qw4VvVkzVZ4arssf7HxFflWioLqg+mipGTW35drH
	 ZIu7ntFfgIDynQHBgsD6dsDKj76aLkrCa1kiRpVvXXznTtQjpvHGr9SBZ5WnqksS49
	 v7cF3FaDRbbXg==
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
Subject: [PATCH v3 4/4] AsoC: intel: atom: Return -ENOMEM if pcim_iomap() fails
Date: Fri, 25 Apr 2025 10:17:43 +0200
Message-ID: <20250425081742.61623-6-phasta@kernel.org>
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

The error checks for pcim_iomap() have the function return -EINVAL.
-ENOMEM is a more appropriate error code.

Replace -EINVAL with -ENOMEM.

Signed-off-by: Philipp Stanner <phasta@kernel.org>
Reviewed-by: Cezary Rojewski <cezary.rojewski@intel.com>
---
 sound/soc/intel/atom/sst/sst_pci.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst_pci.c b/sound/soc/intel/atom/sst/sst_pci.c
index bf2330e6f5a4..22ae2d22f121 100644
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

