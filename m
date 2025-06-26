Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443FE277CB3;
	Thu, 26 Jun 2025 11:56:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939015; cv=none; b=XJzzDvKYyitv5yuHZs6unB3FMMAvaVJZgPjP7xPjh1mcSM8qQYPYhOtw+kEqu4QlOz1zYDcr8Z8O83zSzaUka+OZ6wJmYTFDXsZFCOA1AfJJdEYBc5aCISW8HEUWQjmyv125Cx14jZcQCaG+4al8zu/07/eTEeqPXqf9fASLxFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939015; c=relaxed/simple;
	bh=VgHMTkjrtCxJDcgekslfeeg2G7Yluwd9NMReHQFzwvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q4O0ZGQOLoJCsW5hEkevpxzg1pi8Jqxp69X8gpAmr5UujU1gPUkfbK4AdSW5UY1I4cgFTaTucBLJTAcc+U/3JIqM+WExHKLVEjEYvZ5aUQNXCVqugmSykdqC0BLXtjpM2I8sD3fJhvDbfkc02SeY913U7P5E6A9fggfXfaskw7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NHLmzgYn; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NHLmzgYn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939014; x=1782475014;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=VgHMTkjrtCxJDcgekslfeeg2G7Yluwd9NMReHQFzwvo=;
  b=NHLmzgYn81Zj59J81IU0eS9xZ8ruZjVjP7yEKZBWh+zYdIckeb293Kkn
   Jc4LaaPDcFI1FZbWPuo+Yu3AkDISFZSWBxOhPe7+O9dEfZXO3tl/6EiL8
   yjk3rOmsxfqbR4YTy8rN/4kFSXCyOocvtYyJLDT6Bvouo+k9/Iy3ClOT1
   CL/2gtk8BZ0VQ3Lq8Y9V4i1+njRjD/hZcUSCEWoKG6ON+bv2UEdvmVGPm
   HVyhXFuZaSI5RUGktXxb0io19CdekmumpbZQf0Nls7r86WPu6d0V8M0bN
   xX/7Tlk+uUsrPvEvPCpM/SbRlZrU5Jmyb/OVjh6f0aBPFcIInBuuFkDHn
   A==;
X-CSE-ConnectionGUID: qPWB2gUxQ5+gu1iv3S3R6w==
X-CSE-MsgGUID: PwXE+Ah+TWWYzB5Sf8OMqQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304549"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304549"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:54 -0700
X-CSE-ConnectionGUID: OYPnU64iRF+7siS+I3a3wA==
X-CSE-MsgGUID: Lu0D8iJXT9y95Fi9/KHZLw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800578"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:52 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 05/15] ASoC: rt721: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:15 +0800
Message-ID: <20250626115625.536423-6-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt721_sdca_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt721-sdca-sdw.c | 29 ++++++++++++++++-------------
 sound/soc/codecs/rt721-sdca.c     |  6 ++++++
 2 files changed, 22 insertions(+), 13 deletions(-)

diff --git a/sound/soc/codecs/rt721-sdca-sdw.c b/sound/soc/codecs/rt721-sdca-sdw.c
index 582b47d69278..342a55116771 100644
--- a/sound/soc/codecs/rt721-sdca-sdw.c
+++ b/sound/soc/codecs/rt721-sdca-sdw.c
@@ -190,6 +190,7 @@ static int rt721_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt721->hw_init = false;
@@ -217,7 +218,20 @@ static int rt721_sdca_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt721_sdca_io_init(&slave->dev, slave);
+	ret = rt721_sdca_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt721->regmap, false);
+		regcache_sync(rt721->regmap);
+		regcache_cache_only(rt721->mbq_regmap, false);
+		regcache_sync(rt721->mbq_regmap);
+	}
+
+	return ret;
 }
 
 static int rt721_sdca_read_prop(struct sdw_slave *slave)
@@ -483,13 +497,10 @@ static int rt721_sdca_dev_system_suspend(struct device *dev)
 	return rt721_sdca_dev_suspend(dev);
 }
 
-#define RT721_PROBE_TIMEOUT 5000
-
 static int rt721_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt721_sdca_priv *rt721 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt721->first_hw_init)
 		return 0;
@@ -504,15 +515,7 @@ static int rt721_sdca_dev_resume(struct device *dev)
 		mutex_unlock(&rt721->disable_irq_lock);
 		goto regmap_sync;
 	}
-
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT721_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt721-sdca.c b/sound/soc/codecs/rt721-sdca.c
index ba080957e933..91a7b6f672c6 100644
--- a/sound/soc/codecs/rt721-sdca.c
+++ b/sound/soc/codecs/rt721-sdca.c
@@ -1261,6 +1261,8 @@ static void rt721_sdca_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT721_PROBE_TIMEOUT 5000
+
 static int rt721_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -1315,6 +1317,10 @@ static int rt721_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	port_config.ch_mask = GENMASK(num_channels - 1, 0);
 	port_config.num = port;
 
+	retval = sdw_slave_wait_for_initialization(rt721->slave, RT721_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt721->slave, &stream_config,
 					&port_config, 1, sdw_stream);
 	if (retval) {
-- 
2.43.0

