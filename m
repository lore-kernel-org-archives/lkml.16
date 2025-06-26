Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49431277813;
	Thu, 26 Jun 2025 11:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939013; cv=none; b=qVa89O36L5ezbHBUw40I/2n1R52VI1RizFp3ZL+g6GqxUMYAe/Q9DjT9HmnFmi2xTnpQyjWSOm27RIjxad/k/V+cDR5YUd46MypoVQ5QFmL8idl4Z9xDoXK15iVxrul0uJCYV4CRZ1I80T4eRgqfLGrKHd18A6TP6N0epyaEUF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939013; c=relaxed/simple;
	bh=m7ZCmsBWx9joLgTBbsXcXZoMZ6FZ1RJC72uCOzQGhG8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rfMfVRC669n1NZORR5N7G0+eeb+jxCgQIQcdYRLxBZZEgSc6QdBkk5wtEHFl5LlW5JrMQjQkM1L46Z44ehX41Ir66esIBkewRwFfMa4lPnskjKEUDDqkt15bZ7rnhYo5+M0HYPXYiH+qvOxEfQHY3P8uo5y8DK4YV0PkgtdXikw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=J1RQ1nFK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="J1RQ1nFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939012; x=1782475012;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=m7ZCmsBWx9joLgTBbsXcXZoMZ6FZ1RJC72uCOzQGhG8=;
  b=J1RQ1nFKrwOadsW0n5ub8toLx9DASYDctEyhZ+Xr8EpyXQJ2VI4SQeBS
   U9zOHPTQ8BrKuuI8XWrKKDOaX38VAjdJ0Ikz8OMOTcIkmXVKfTbgLYBwu
   o+rfpNmLE51eIA55DfHLVxant++ruCIhQbK7CdtE93+JAOPM4bd1OMP0a
   +rhcNIRA1L8AzLX0qsCEYrBWYzmOmGWC8ZO5z2CMg5vbu6nSvbonlKQtt
   MDjrKuwQGrrxqmzDzFzinqIzAJvQ5ETHq/pLoPzEMEF8zAA/g2rD+7BpB
   ABGPmeZOT+iMLmBdFn+gEP2w3s8WOni2mqm//LnlGXEj3NNJQi9qKOCbt
   g==;
X-CSE-ConnectionGUID: c/nd4nn6R/aFQzzxhs0F4A==
X-CSE-MsgGUID: 8SQIB3m1Q5ONA6+bomtxhg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304544"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304544"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:52 -0700
X-CSE-ConnectionGUID: zr8xLsxqQ5+LREamJLbVAg==
X-CSE-MsgGUID: LwwBO3GWSgCwiNlWJI09Lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800574"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:50 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 04/15] ASoC: rt1320: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:14 +0800
Message-ID: <20250626115625.536423-5-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt1320_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1320-sdw.c | 32 ++++++++++++++++++++++----------
 1 file changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt1320-sdw.c b/sound/soc/codecs/rt1320-sdw.c
index 015cc710e6dc..e4b208be492c 100644
--- a/sound/soc/codecs/rt1320-sdw.c
+++ b/sound/soc/codecs/rt1320-sdw.c
@@ -774,6 +774,7 @@ static int rt1320_update_status(struct sdw_slave *slave,
 					enum sdw_slave_status status)
 {
 	struct  rt1320_sdw_priv *rt1320 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1320->hw_init = false;
@@ -786,7 +787,20 @@ static int rt1320_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt1320_io_init(&slave->dev, slave);
+	ret = rt1320_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt1320->regmap, false);
+		regcache_sync(rt1320->regmap);
+		regcache_cache_only(rt1320->mbq_regmap, false);
+		regcache_sync(rt1320->mbq_regmap);
+	}
+
+	return ret;
 }
 
 static int rt1320_pde11_event(struct snd_soc_dapm_widget *w,
@@ -1183,6 +1197,8 @@ static void rt1320_sdw_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT1320_PROBE_TIMEOUT 5000
+
 static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
@@ -1225,6 +1241,10 @@ static int rt1320_sdw_hw_params(struct snd_pcm_substream *substream,
 			return -EINVAL;
 	}
 
+	retval = sdw_slave_wait_for_initialization(rt1320->sdw_slave, RT1320_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	if (dai->id == RT1320_AIF1)
 		retval = sdw_stream_add_slave(rt1320->sdw_slave, &stream_config,
 				&port_config, 1, sdw_stream);
@@ -1485,13 +1505,10 @@ static int rt1320_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT1320_PROBE_TIMEOUT 5000
-
 static int rt1320_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1320_sdw_priv *rt1320 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt1320->first_hw_init)
 		return 0;
@@ -1499,12 +1516,7 @@ static int rt1320_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1320_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
-- 
2.43.0

