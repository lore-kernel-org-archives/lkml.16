Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A16BF27B4E4;
	Thu, 26 Jun 2025 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939034; cv=none; b=NP7CRNonz2r9p2ZrBEWkIBxzEujvfHdkGmoLMcrf/o35rdvAykzvNX/iIdZjWVbwxO6bcioVNQ0+vUSDS5vflT8YqVJHODwyMOTBbEGKrDBaWlarQfMDshxLzi8972tAezaRHcRlXuxE89unYlBvWMXPxpRMWnxgUPjtU+cnRo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939034; c=relaxed/simple;
	bh=leZ46mQPLqgNhxXzPhKOPF0xiVc/gRGHXsPgaRDY0Yg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=agVC6xIf6vNUddJrLSyKKIVmFe1BoZZBZeraCfktKAurXRPEROHkSHdf5VB73euTl+nS/UYh6yYcTCKAFiWFk6yMQOmr9gVrZxkxdSzBKxmgjf2WipdtRCZdzNHkZ7Kvp4Sk4AqRZb+z+s3C4FtMBy8yTRfenFTx5U28C8TMs3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fMQh6jOu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fMQh6jOu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939033; x=1782475033;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=leZ46mQPLqgNhxXzPhKOPF0xiVc/gRGHXsPgaRDY0Yg=;
  b=fMQh6jOuQx2NaHnP58NCofMNWLMViy2WzCP9ZzOcGUbgEc3QacO7f7M/
   5WlXKN6UvGHdS7z5DpBbjLm6AtkXExNEj9eigLixwMAJ9xjlXGqzZuJZm
   cywWSRWIgM7dumabxiDh+cS6LMP+FHHqfV6pGF2ZwloxRJ9i/kAZaG9LN
   xevsLEUj5Na0fxNAahxvsA0HYKRQgMy5trNFEVFaay+YS/UGmUZ+g9hXG
   qr1fkzJqpfG8WYQTUiRCNQ3gWYxWXhbfD5olN8c6QF2/3DALreFLNMK/h
   re1Hhyo/Yx3+H3I2ED4ZQ7mTOv6/RQP5MZKIQEBLjXTXFqz5D0sVtl542
   w==;
X-CSE-ConnectionGUID: qTvtdnWgRaOjJkiFDh0TZQ==
X-CSE-MsgGUID: Rhx3YRgSQVeZVk0W62c7qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304602"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304602"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:12 -0700
X-CSE-ConnectionGUID: 1E9prHQ2QwifEE0td92d4g==
X-CSE-MsgGUID: gWkU89LGTfOojOdp5Qu8qA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800620"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:10 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 14/15] ASoC: rt5682: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:24 +0800
Message-ID: <20250626115625.536423-15-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt5682_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt5682-sdw.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt5682-sdw.c b/sound/soc/codecs/rt5682-sdw.c
index aa229894129b..1c140691945f 100644
--- a/sound/soc/codecs/rt5682-sdw.c
+++ b/sound/soc/codecs/rt5682-sdw.c
@@ -129,6 +129,10 @@ static int rt5682_sdw_hw_params(struct snd_pcm_substream *substream,
 	else
 		port_config.num = 2;
 
+	retval = sdw_slave_wait_for_initialization(rt5682->slave, RT5682_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt5682->slave, &stream_config,
 				      &port_config, 1, sdw_stream);
 	if (retval) {
@@ -513,6 +517,7 @@ static int rt5682_update_status(struct sdw_slave *slave,
 					enum sdw_slave_status status)
 {
 	struct rt5682_priv *rt5682 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt5682->hw_init = false;
@@ -525,7 +530,19 @@ static int rt5682_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt5682_io_init(&slave->dev, slave);
+	ret = rt5682_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init Failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt5682->sdw_regmap, false);
+		regcache_cache_only(rt5682->regmap, false);
+		regcache_sync(rt5682->regmap);
+	}
+
+	return ret;
 }
 
 static int rt5682_read_prop(struct sdw_slave *slave)
@@ -757,7 +774,6 @@ static int rt5682_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt5682_priv *rt5682 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt5682->first_hw_init)
 		return 0;
@@ -772,14 +788,7 @@ static int rt5682_dev_resume(struct device *dev)
 		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT5682_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
-- 
2.43.0

