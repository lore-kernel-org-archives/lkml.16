Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3724E27A907;
	Thu, 26 Jun 2025 11:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939036; cv=none; b=dKL1TU/Sph+RJAdmSWCBNgLDkCGugeTJG/u04mW8o7eBFss1DFKgRask9QVApJb50vAyB4nidN7cenKsuRA/S4jgM9SEmOQspcEFPzdEw3F45ztXHo74k7yNX5h7vOClH7K6Xz7Trj9GC3v83GOBUUyZQH2495DHKeIn3CknVuM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939036; c=relaxed/simple;
	bh=0g7jBut0nG453ouvreWCxKiKGtz6IISQ1QPJOEG8E4w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XykW4zmkFtiHhytnyipq1w2fE+yjjpK2HIkjOJmdWNhyoLfjnbSQqej18Y94SQfXkgX9luddMrZMfdRPdjPQolR83oRe7IIUEhkUQdUurA3cyG7xOFc8Vo5HXSeXTtPuHRCKb/GTZOcNvyVyLmcrcnWNQBkafpG0wdFp1CeSkxc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Mm5CUn+4; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Mm5CUn+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939035; x=1782475035;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=0g7jBut0nG453ouvreWCxKiKGtz6IISQ1QPJOEG8E4w=;
  b=Mm5CUn+44LplNnHza7GeKZy21WQ7VyyPI0VnzPzIkKdId7aKYbU9wJwr
   tcDjNup7jOUE/vLN02RB6LREsKkm6JTXSWhGSONrRlSKjtXGkvf1aXiyp
   pE6IWiahXC+kmFWCZVs4EeVpBBd+rX/Aox9mC+e7V+ed3Mm12sPsWPZod
   4z8oWR5jdO7l+bykNkyTMe9pHFEcK524zDw3emc2vfuR9u4Sv9hXpnOSO
   S0IPs1bNvnnEqL/tMRmI1gNVKM0065uqScOWabV3aN6l87o60j3NGuvOs
   0LVA5iEWnkaFCZiUVyt0IfuvpceqrqmYEdZnR6Po4qZsspYJiKuttBlql
   Q==;
X-CSE-ConnectionGUID: /o8XktcHStSF1ooMrtMZAw==
X-CSE-MsgGUID: pAukafH9TfivmTN2RdOPog==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304617"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:15 -0700
X-CSE-ConnectionGUID: 87vwFAgURaiSTyTbdWGM0Q==
X-CSE-MsgGUID: X9Mx4DxOSiyLCOtVoycZsA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800626"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:13 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 15/15] ASoC: rt1017: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:25 +0800
Message-ID: <20250626115625.536423-16-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt1017_sdca_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1017-sdca-sdw.c | 32 +++++++++++++++++++-----------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1017-sdca-sdw.c b/sound/soc/codecs/rt1017-sdca-sdw.c
index 88fc23a4999f..bd9eb1854aa5 100644
--- a/sound/soc/codecs/rt1017-sdca-sdw.c
+++ b/sound/soc/codecs/rt1017-sdca-sdw.c
@@ -373,6 +373,7 @@ static int rt1017_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct  rt1017_sdca_priv *rt1017 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1017->hw_init = false;
@@ -385,7 +386,18 @@ static int rt1017_sdca_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt1017_sdca_io_init(&slave->dev, slave);
+	ret = rt1017_sdca_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt1017->regmap, false);
+		regcache_sync(rt1017->regmap);
+	}
+
+	return ret;
 }
 
 static const char * const rt1017_rx_data_ch_select[] = {
@@ -569,6 +581,8 @@ static void rt1017_sdca_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT1017_PROBE_TIMEOUT 5000
+
 static int rt1017_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -616,6 +630,10 @@ static int rt1017_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 		params_rate(params), num_channels, snd_pcm_format_width(params_format(params)),
 		direction, ch_mask, port);
 
+	retval = sdw_slave_wait_for_initialization(rt1017->sdw_slave, RT1017_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt1017->sdw_slave, &stream_config,
 				&port_config, 1, sdw_stream);
 	if (retval) {
@@ -770,13 +788,10 @@ static int rt1017_sdca_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT1017_PROBE_TIMEOUT 5000
-
 static int rt1017_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1017_sdca_priv *rt1017 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt1017->first_hw_init)
 		return 0;
@@ -784,14 +799,7 @@ static int rt1017_sdca_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1017_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
-- 
2.43.0

