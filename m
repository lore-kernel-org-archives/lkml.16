Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1027F278751;
	Thu, 26 Jun 2025 11:56:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939017; cv=none; b=nhIDZZtjO2mGhD37p/BDrgkBKx9sVRBh0muR3hhmNSiUiv0/ZcCDHs+ib4aWJwCWfTQUzsw49iU89n3kAqNDxUWW94wsvvyhRvQH9SydpjzbSOf+OUKQCh51dNJNKH4WXh9n5ZHEg/Mp3W404txUAkGS/nxNogXYC3xWel31c04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939017; c=relaxed/simple;
	bh=qVs9DePQwfSoblYKyo+N6IEiqpEFOUwf77UEU2hz+qc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iX8pUpCrnlgRL42g4X4EqEQNpPUxb3akvDqxMXNHMmZXtwrg5CHg6+w5wVzzcwr3SQM7L3Niem5lR7hERFTF85508+IKnTET999oi9R93g5Gd7HPXSOj7Q+fkUB5mWCKyellqMIwfF7ZyQLOlgm7ddkFz45Y4K2s85cPU3coie0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJPmScIV; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJPmScIV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939016; x=1782475016;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=qVs9DePQwfSoblYKyo+N6IEiqpEFOUwf77UEU2hz+qc=;
  b=kJPmScIVHFX9dO9QAuyKZdSoHXZXz1xp5LEwv1sEuQxypd9OmnbOw4E2
   i5lFuwDw/LVuz+aP+6f1ZXNg4/b8SHiYae+MESJit82Pa5TZiUy2Z0nSL
   xrsMPiK/9R+9asev7t1OxGqAa37MC4JL1l+QTDfpQ1uChJwTADCJqQkZg
   DbRApLSsqZ7gWKjhal46ia+a8b/fcJbztQPwQALdohlNF8wNmqxYvFWFo
   KaSqJlYCxb7MET1y22yTI518sXLGaEJ4YNXQBIXxAcSKVsUAkKHKdUlPj
   UMFs5QSZHFI69OAC0dhToYwDuzJXtL7NgU4gh7UEdCDdJreyw0Y91nSKc
   Q==;
X-CSE-ConnectionGUID: il5QX3+vT/yPODoZmOtJFg==
X-CSE-MsgGUID: TiX6PrP+Q0OopqKhRbfIjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304554"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304554"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:56 -0700
X-CSE-ConnectionGUID: /pmaB/OTRV29UnKooCxsmA==
X-CSE-MsgGUID: 4BpQSyPHR32WE2Y3pBrRCA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800583"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:54 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 06/15] ASoC: rt715-sdca: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:16 +0800
Message-ID: <20250626115625.536423-7-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt715_sdca_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt715-sdca-sdw.c | 37 +++++++++++++++++++++----------
 sound/soc/codecs/rt715-sdca.c     |  6 +++++
 2 files changed, 31 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt715-sdca-sdw.c b/sound/soc/codecs/rt715-sdca-sdw.c
index ce7d8955efc3..ed0e230fc009 100644
--- a/sound/soc/codecs/rt715-sdca-sdw.c
+++ b/sound/soc/codecs/rt715-sdca-sdw.c
@@ -120,6 +120,7 @@ static int rt715_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	/*
 	 * Perform initialization only if slave status is present and
@@ -129,7 +130,29 @@ static int rt715_sdca_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt715_sdca_io_init(&slave->dev, slave);
+	ret = rt715_sdca_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt715->regmap, false);
+		regcache_sync_region(rt715->regmap,
+				     SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN,
+						  RT715_SDCA_ST_CTRL, CH_00),
+				     SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+						  RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00));
+		regcache_cache_only(rt715->mbq_regmap, false);
+		regcache_sync_region(rt715->mbq_regmap, 0x2000000, 0x61020ff);
+		regcache_sync_region(rt715->mbq_regmap,
+				     SDW_SDCA_CTL(FUN_JACK_CODEC, RT715_SDCA_ST_EN,
+						  RT715_SDCA_ST_CTRL, CH_00),
+				     SDW_SDCA_CTL(FUN_MIC_ARRAY, RT715_SDCA_SMPU_TRIG_ST_EN,
+						  RT715_SDCA_SMPU_TRIG_ST_CTRL, CH_00));
+	}
+
+	return ret;
 }
 
 static int rt715_sdca_read_prop(struct sdw_slave *slave)
@@ -220,13 +243,10 @@ static int rt715_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT715_PROBE_TIMEOUT 5000
-
 static int rt715_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt715_sdca_priv *rt715 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt715->first_hw_init)
 		return 0;
@@ -234,14 +254,7 @@ static int rt715_dev_resume(struct device *dev)
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
diff --git a/sound/soc/codecs/rt715-sdca.c b/sound/soc/codecs/rt715-sdca.c
index 7fb02654c16b..c2a08ae8df95 100644
--- a/sound/soc/codecs/rt715-sdca.c
+++ b/sound/soc/codecs/rt715-sdca.c
@@ -792,6 +792,8 @@ static void rt715_sdca_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT715_PROBE_TIMEOUT 5000
+
 static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -830,6 +832,10 @@ static int rt715_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
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

