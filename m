Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553A279331;
	Thu, 26 Jun 2025 11:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939019; cv=none; b=PnQcQgT41TIn4uNkp0V7qz/ZzXcneiyrZrpQ8vwyZ5H+XyqD3c+4JWBYavBuGKmMDizk56x7CfG9fK9ub4yE9J951fc+L58rxfsd9R3gMq5u7Tkd6q7OhJ6vRWVejVRVPw7E538eF2KOm3jswegFgk3vZB+VIaDdZOoc4Ca1Jlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939019; c=relaxed/simple;
	bh=ur3iJNC/prPNA/VGCtNu1nPwmXw0oOudMWBo6/Ic2h4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Qtdf2ynQRU4F9vywRSvxT370GFN8xCFjeQNXHuA8PuMAD4g0Eps641Z6kq0fZTh5LOSEjj2zSEVp6AwGpyuzmsa8882pcyhKwi0IdTYv71LwKvkleGuO1B3qEwr+vv0b27pwz828Ds4gUu25h5h1v882mOy9LbY8UHI3I+4jzzc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hjUGiUR5; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hjUGiUR5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939018; x=1782475018;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=ur3iJNC/prPNA/VGCtNu1nPwmXw0oOudMWBo6/Ic2h4=;
  b=hjUGiUR5PpZuCsjDM9090m6RICouKpgUMtiwJVJqCStWAV7UINkYKAIY
   +QfA0jYfPCf/IlF9DjQ06xgyS63sQ4TCs2S6bdSVWL0AjyuWVbCzgO7Kc
   XND5RiMMRM7siYdud11YIwi4cuuwR5rwEFZ3a+qSLT3nx1aoVajGVGKNC
   nhJDLPDZXsXGJS31EpOjDWQ6nfLkkxHb6SKPVy516d24BU4eaYIjlGDaZ
   P2tbWWdd2Il0uAER65N9DaLnLS2ea06pmYOwH4d5Dhy3y6Wi3wWujZb0+
   N/c9A1SRr9J4dOcmG6IKSJ4XeHoFmj4FY66t8xZ33yTjxefj/zWmuuN19
   w==;
X-CSE-ConnectionGUID: EEA4aNc1ScahJqWYW4xoIw==
X-CSE-MsgGUID: cwXRo62RTM2gZr1EpAMRLw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304559"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304559"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:58 -0700
X-CSE-ConnectionGUID: BSd9wuZfQ+OY0bIsUy5XOA==
X-CSE-MsgGUID: IIxyWJarR3WIMnHBRwk8sQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800586"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:56 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 07/15] ASoC: rt711-sdca: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:17 +0800
Message-ID: <20250626115625.536423-8-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
References: <20250626115625.536423-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move regmap sync to rt711_sdca_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt711-sdca-sdw.c | 28 ++++++++++++++++------------
 sound/soc/codecs/rt711-sdca.c     |  6 ++++++
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdca-sdw.c b/sound/soc/codecs/rt711-sdca-sdw.c
index 6eb05871db37..ec11e0033a28 100644
--- a/sound/soc/codecs/rt711-sdca-sdw.c
+++ b/sound/soc/codecs/rt711-sdca-sdw.c
@@ -142,6 +142,7 @@ static int rt711_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt711->hw_init = false;
@@ -169,7 +170,20 @@ static int rt711_sdca_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt711_sdca_io_init(&slave->dev, slave);
+	ret = rt711_sdca_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt711->regmap, false);
+		regcache_sync(rt711->regmap);
+		regcache_cache_only(rt711->mbq_regmap, false);
+		regcache_sync(rt711->mbq_regmap);
+	}
+
+	return ret;
 }
 
 static int rt711_sdca_read_prop(struct sdw_slave *slave)
@@ -434,13 +448,10 @@ static int rt711_sdca_dev_system_suspend(struct device *dev)
 	return rt711_sdca_dev_suspend(dev);
 }
 
-#define RT711_PROBE_TIMEOUT 5000
-
 static int rt711_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_sdca_priv *rt711 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -456,14 +467,7 @@ static int rt711_sdca_dev_resume(struct device *dev)
 		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt711-sdca.c b/sound/soc/codecs/rt711-sdca.c
index dd6ccf17afd4..a4027796dafc 100644
--- a/sound/soc/codecs/rt711-sdca.c
+++ b/sound/soc/codecs/rt711-sdca.c
@@ -1327,6 +1327,8 @@ static void rt711_sdca_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT711_PROBE_TIMEOUT 5000
+
 static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -1362,6 +1364,10 @@ static int rt711_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 	}
 
+	retval = sdw_slave_wait_for_initialization(rt711->slave, RT711_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt711->slave, &stream_config,
 					&port_config, 1, sdw_stream);
 	if (retval) {
-- 
2.43.0

