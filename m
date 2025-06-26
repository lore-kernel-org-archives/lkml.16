Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F02798E6;
	Thu, 26 Jun 2025 11:57:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939023; cv=none; b=CFEsavj+FyPrBKe2MMdr26CNUzLFK8NIo4wCbNasOZA8Z2g00MGR3O/E3/7WYiSPK/JYvLpNtjMRwn8m3X8n23EZTr4iJzbwpaVmbVbS7dF67rV7qbGHNaJkx8FoB73D9+Qp8Sgreixg6oP2cWNUU74h54wuMgg/5Xjk9Ra3n1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939023; c=relaxed/simple;
	bh=8CgsMgzTzBzKoVm0nE1uhNwdkfF5WSMH/9ug8+qb4jY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FBM87szj4U+rSyAYJPxtZQWjiBdrQqzvPTSoe5K7OKQ+8JAj0UC10kHjLFJNmthA5GgV1v3P+RpjZkNSXVEB+/Ip5NA/To8UETO7tTfOfR0L3kG9CnXMTOsiFu56pKkQN9UA/lBf0ye4qotIMWMUJGL8/MfX3Dmg8wZB1XfvA9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R1SKWJPU; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R1SKWJPU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939022; x=1782475022;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=8CgsMgzTzBzKoVm0nE1uhNwdkfF5WSMH/9ug8+qb4jY=;
  b=R1SKWJPUp4JTMBMa14s5VyVebsBLnl/6laI8y/0kvDMMoOEBvXEv4GfB
   TvJny6gpOp04ARQtlbOeqe3QCmjRV3NPXxbQDYFx9ZmMeMLhhI7X6ZRGR
   woC+EXfx27otW5k1lFzqQ2fzbWk6AL21kQ7eJZu0WmA4GXTf2pbXIbJSb
   Dg6r+rSVhGy0b9HGVaPir91SLpGlVJyNevMZArRMovKwIqUyKxnpKgTRt
   0ToKp9ei7nSxz888XxYM+JzqAmJaHxRFRK1s3H+VxMMrZk5zgl9nQ42DZ
   ExRuA9LZTQOeG0B3UitXwNq37nV24alXf+5dmMMoj5E0l4PM7BLZusMyw
   g==;
X-CSE-ConnectionGUID: 1K7qUprJRGy4nqFIXyZbBA==
X-CSE-MsgGUID: KCU6a/bAQh+JWikF2GKhNg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304569"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304569"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:02 -0700
X-CSE-ConnectionGUID: 3l95awnQTjqf4Pn4N1Qzaw==
X-CSE-MsgGUID: wUCsTs/YRciOLwu76pqVgQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800593"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:00 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 09/15] ASoC: rt715: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:19 +0800
Message-ID: <20250626115625.536423-10-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt715_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt715-sdw.c | 27 +++++++++++++++------------
 sound/soc/codecs/rt715.c     |  6 ++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdw.c b/sound/soc/codecs/rt715-sdw.c
index a3df4bbedf86..8276ff9958c4 100644
--- a/sound/soc/codecs/rt715-sdw.c
+++ b/sound/soc/codecs/rt715-sdw.c
@@ -376,6 +376,7 @@ static int rt715_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt715_priv *rt715 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	/*
 	 * Perform initialization only if slave status is present and
@@ -385,7 +386,19 @@ static int rt715_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt715_io_init(&slave->dev, slave);
+	ret = rt715_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "%s: I/O init failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt715->regmap, false);
+		regcache_sync_region(rt715->regmap, 0x3000, 0x8fff);
+		regcache_sync_region(rt715->regmap, 0x752039, 0x752039);
+	}
+
+	return ret;
 }
 
 static int rt715_read_prop(struct sdw_slave *slave)
@@ -497,13 +510,10 @@ static int rt715_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT715_PROBE_TIMEOUT 5000
-
 static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt715->first_hw_init)
 		return 0;
@@ -511,14 +521,7 @@ static int rt715_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-					   msecs_to_jiffies(RT715_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt715.c b/sound/soc/codecs/rt715.c
index 2cf461852091..bf523a39bdcf 100644
--- a/sound/soc/codecs/rt715.c
+++ b/sound/soc/codecs/rt715.c
@@ -822,6 +822,8 @@ static void rt715_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT715_PROBE_TIMEOUT 5000
+
 static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -858,6 +860,10 @@ static int rt715_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	retval = sdw_slave_wait_for_initialization(rt715->slave, RT715_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt715->slave, &stream_config,
 					&port_config, 1, sdw_stream);
 	if (retval) {
-- 
2.43.0

