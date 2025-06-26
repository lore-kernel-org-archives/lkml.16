Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A13FC277037;
	Thu, 26 Jun 2025 11:56:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939012; cv=none; b=eVNfc6PB5jiAU67FTK7Pd/UrStL6GWS+dkb6YF0eOvbe609l5mMZuGqefxdFHSJsMpKkkQZgucy53NgyHClexpnrp36eLeM64QkQJGfevO5mIxSpcO9EkWODm7hwppnXlxjwPLaUVFHmtbg8AmJJeiZEB6iyWuTQPSeY088GWZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939012; c=relaxed/simple;
	bh=C5153B8UtFaAK7n/Il+dkdVqAthL8X05VqsljYUjuSo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pMg8Ytc6bo2Wn6gBIR+p+3/gL3qmQVIwaejPW/r/dMSs0Rc7+ZmPqM/u/ubIXehq03j3kCoztV483G+imxVbQIzhDRSBYydKSkvuw4TLzT3t7Rsuo78JfgbyXUu/wIMXdafGyDRrWWMQL9HRp8JPIw30AZogkHd3BbwCAGPpNPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=l21c+qdA; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l21c+qdA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939010; x=1782475010;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=C5153B8UtFaAK7n/Il+dkdVqAthL8X05VqsljYUjuSo=;
  b=l21c+qdAwF6z2HupGyiqYTjFL5RYzfzHAmGIVwMb2Jce+wRotXFEER6u
   mWEyU7JPBxsNuFkZdGBQzr3l+XQ+bInTN1qSt+TsQX9u8Mb2hWQ4vCT6Q
   mNbrzhHH5CyZ1HZR2Qxxuq45uN9ATxTnS53X3IIvGBrLCl1VBeDprCOi5
   JwPIVorgVDsy/X7oL1zVTRX0Ij35V2Bc/biqOs2PqmKF3cfsdPnMy0Sz7
   rq8Ouc06ATcpwaJbBzLri0HptNOXzPoOaYmxVObHgI4ZTYkarEkIixRsY
   gJYQRhhJZN3/rqbn3hEwy+3LZMKXTq0CddxiaEF9GiYjSb8jciR5NVksf
   w==;
X-CSE-ConnectionGUID: xtXBaCf3Rl6AmNuvBUEMQg==
X-CSE-MsgGUID: EcUHXNl3QIuwb8+ayqREPA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304539"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304539"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:50 -0700
X-CSE-ConnectionGUID: xPnfdJXYS/ed7A36+MA57Q==
X-CSE-MsgGUID: JKB81f38TiSYdE+Xn3TnDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800563"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:48 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 03/15] ASoC: rt712: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:13 +0800
Message-ID: <20250626115625.536423-4-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt712_sdca_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt712-sdca-sdw.c | 28 ++++++++++++++++------------
 sound/soc/codecs/rt712-sdca.c     |  6 ++++++
 2 files changed, 22 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt712-sdca-sdw.c b/sound/soc/codecs/rt712-sdca-sdw.c
index ea07131edfa2..183496505e90 100644
--- a/sound/soc/codecs/rt712-sdca-sdw.c
+++ b/sound/soc/codecs/rt712-sdca-sdw.c
@@ -157,6 +157,7 @@ static int rt712_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt712->hw_init = false;
@@ -184,7 +185,20 @@ static int rt712_sdca_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt712_sdca_io_init(&slave->dev, slave);
+	ret = rt712_sdca_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt712->regmap, false);
+		regcache_sync(rt712->regmap);
+		regcache_cache_only(rt712->mbq_regmap, false);
+		regcache_sync(rt712->mbq_regmap);
+	}
+
+	return ret;
 }
 
 static int rt712_sdca_read_prop(struct sdw_slave *slave)
@@ -446,13 +460,10 @@ static int rt712_sdca_dev_system_suspend(struct device *dev)
 	return rt712_sdca_dev_suspend(dev);
 }
 
-#define RT712_PROBE_TIMEOUT 5000
-
 static int rt712_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt712_sdca_priv *rt712 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt712->first_hw_init)
 		return 0;
@@ -469,14 +480,7 @@ static int rt712_sdca_dev_resume(struct device *dev)
 		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT712_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt712-sdca.c b/sound/soc/codecs/rt712-sdca.c
index 570c2af1245d..c8c68fda5c20 100644
--- a/sound/soc/codecs/rt712-sdca.c
+++ b/sound/soc/codecs/rt712-sdca.c
@@ -1451,6 +1451,8 @@ static void rt712_sdca_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT712_PROBE_TIMEOUT 5000
+
 static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -1505,6 +1507,10 @@ static int rt712_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	port_config.ch_mask = GENMASK(num_channels - 1, 0);
 	port_config.num = port;
 
+	retval = sdw_slave_wait_for_initialization(rt712->slave, RT712_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt712->slave, &stream_config,
 					&port_config, 1, sdw_stream);
 	if (retval) {
-- 
2.43.0

