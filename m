Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30B5B201032;
	Thu, 26 Jun 2025 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939029; cv=none; b=jqi+CTHTG16JaWSPHnn8YCwKJIQO4x8WLnErX4jYb9Mh8sQvOhWr9KgIGSTkUT+QqqQf/8d3hOMwrDGLwRjy84ngYLO6YQd28oqmWvew1rJT0gnktHGjIBpxckQA8UpAqfgKiU/7s13gPCWrlq+mkFQIJnvKGIH/qpwVojRgsSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939029; c=relaxed/simple;
	bh=E9Rpvrr0CpHmEEwtw+RJAnsLHU+bYZ7CR7ZMtb4SiIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AOviUJGzYloofeQ4+6/tLbmrt8eUQuovKyy8YwaSo2lEHD80gIVyF9/ziwb3kUeT5KbH2Mee661JxiO1Qf59krH1nVLBpZpTTs45oVRCkqD3YVxWgsJStgLdegQLzKM5pr73h9bqFsnYO3IkzyEnP0gubqpNqJUpYwatt0uyiPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UOEJ7gu8; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UOEJ7gu8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939028; x=1782475028;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=E9Rpvrr0CpHmEEwtw+RJAnsLHU+bYZ7CR7ZMtb4SiIQ=;
  b=UOEJ7gu8TMxQhaESG74QiCsMioO2ERUqkIC2MEigsa90+EJyIs6EhC9m
   NIZaCIakan59M18LIdls01m6yiYsluO8mye6Q1bn/DqsRZmTVjqS4mVnQ
   6+5WVPYTxNFjlA9QCUinebfy2RVMSsWzX1KSlN2/8rwpmmzTKTKRHIokX
   vXOMXe9igrZSU76C7BgrcpsBuCZj4/FIwqUmzFHutuVqDMXkJbdZSYb3s
   VVIe0Wm6nocvzjCqF16Tq2ReZh8kpzSUrY4ekrV9FgdZnnaNpGBV9awdL
   XOpCfs+CJJNkNG3sUAB8El22V8UhK8E09bILUo4+5pnHm/7/R4rROCrOJ
   w==;
X-CSE-ConnectionGUID: KohYNJpSTI6PBf7z99hrVA==
X-CSE-MsgGUID: 0LKpIb0jR/S1cCeUDfKXjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304586"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304586"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:08 -0700
X-CSE-ConnectionGUID: L65eif+nST+S/myfP52/TQ==
X-CSE-MsgGUID: tSCIp5T9SCW5aRu6AOrPOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800611"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:06 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 12/15] ASoC: rt1318: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:22 +0800
Message-ID: <20250626115625.536423-13-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt1318_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1318-sdw.c | 30 ++++++++++++++++++++----------
 1 file changed, 20 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt1318-sdw.c b/sound/soc/codecs/rt1318-sdw.c
index 4eb636e0c9ed..6add687b5f6a 100644
--- a/sound/soc/codecs/rt1318-sdw.c
+++ b/sound/soc/codecs/rt1318-sdw.c
@@ -445,6 +445,7 @@ static int rt1318_update_status(struct sdw_slave *slave,
 					enum sdw_slave_status status)
 {
 	struct  rt1318_sdw_priv *rt1318 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1318->hw_init = false;
@@ -457,7 +458,18 @@ static int rt1318_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt1318_io_init(&slave->dev, slave);
+	ret = rt1318_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "%s: I/O init failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt1318->regmap, false);
+		regcache_sync(rt1318->regmap);
+	}
+
+	return ret;
 }
 
 static int rt1318_classd_event(struct snd_soc_dapm_widget *w,
@@ -560,6 +572,8 @@ static void rt1318_sdw_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT1318_PROBE_TIMEOUT 5000
+
 static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
@@ -603,6 +617,10 @@ static int rt1318_sdw_hw_params(struct snd_pcm_substream *substream,
 	port_config.ch_mask = ch_mask;
 	port_config.num = port;
 
+	retval = sdw_slave_wait_for_initialization(rt1318->sdw_slave, RT1318_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt1318->sdw_slave, &stream_config,
 				&port_config, 1, sdw_stream);
 	if (retval) {
@@ -818,13 +836,10 @@ static int rt1318_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT1318_PROBE_TIMEOUT 5000
-
 static int rt1318_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1318_sdw_priv *rt1318 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt1318->first_hw_init)
 		return 0;
@@ -832,12 +847,7 @@ static int rt1318_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1318_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
-- 
2.43.0

