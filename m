Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B7B5279788;
	Thu, 26 Jun 2025 11:57:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939021; cv=none; b=KjoNQ9ywCFhHXCJDo2Hw3G4TaEj8205ScEI8Srf13eNum9781QmzKTfmZMaQP466go0aDiV/qZglwgVx38cYTq0CjTnV8LVgEzcdzFh27JtODYo5QPjuOgYPsSdLW1KJdZOH5lKR/qnLtUUEtyESE9pHOLi6o7b9/13TyQeTfAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939021; c=relaxed/simple;
	bh=eU7x8frBuSwQFvHll0qVmRtpN09qhwLKzwemVusSCB8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V+eCWX61r7lLONGPcyQB+JedY5/C4ZjrBOylnCM/fHq/m4VcPXFUajsoOHUKtSmnCrhcLYxowg3GvBjIRtW16A46uOwqvCScDnSG8ytkDWVxBbpz37S7Jcgvsay5uUvRUlQCKgVZ0yXN7x+qKNczBs5dR6G+XMerYSUmiqVM8fc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I4a6fa9/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I4a6fa9/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939020; x=1782475020;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=eU7x8frBuSwQFvHll0qVmRtpN09qhwLKzwemVusSCB8=;
  b=I4a6fa9/E9NyMnY1pQ5hXI98xSnX3WYhz3osH1cUwDSWRrxsn7jBKf7/
   iSC6zHQwvtYWuWFrl/Ss0kSRPvPZCXbUflTyI1D5To4d3ampPOkEsqRHg
   jPAh6Y5FIX7XGwRKpI9ucQ821MI6fCsHenAvz+Iu+YhKYW7bEV8Dcsi9E
   nad1IURi99z2FBbu85zw/oyw4Bo9GCDP5C3J9sQMOjz83ReDLpI7qZ675
   g499d62y40opZ6z5UgB9HSik5n5gJ/Poe0KlH3U27GAn+jpi0yp8U87TB
   c0yedJIRbcAC2yGwLD885Hf1rQj0Iqew2P5+1boYj20SliZDOU5xjbhsP
   A==;
X-CSE-ConnectionGUID: WCgM2EvtQ+2h3m3ovHE2Tw==
X-CSE-MsgGUID: jikVIaweRKqDf4oGIYdlLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304564"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304564"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:00 -0700
X-CSE-ConnectionGUID: 1hlgPCflRQq0NslWZGczpQ==
X-CSE-MsgGUID: IkAC6jETQAqa6DyruWpO1g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800589"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:58 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 08/15] ASoC: rt711: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:18 +0800
Message-ID: <20250626115625.536423-9-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt711_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt711-sdw.c | 26 ++++++++++++++++----------
 sound/soc/codecs/rt711.c     |  6 ++++++
 2 files changed, 22 insertions(+), 10 deletions(-)

diff --git a/sound/soc/codecs/rt711-sdw.c b/sound/soc/codecs/rt711-sdw.c
index 93a5a89a96b1..884206850b46 100644
--- a/sound/soc/codecs/rt711-sdw.c
+++ b/sound/soc/codecs/rt711-sdw.c
@@ -320,6 +320,7 @@ static int rt711_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt711_priv *rt711 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt711->hw_init = false;
@@ -332,7 +333,20 @@ static int rt711_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt711_io_init(&slave->dev, slave);
+	ret = rt711_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "%s: I/O init failed: %d\n",
+			__func__, ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt711->regmap, false);
+		regcache_sync_region(rt711->regmap, 0x3000, 0x8fff);
+		regcache_sync_region(rt711->regmap, 0x752009, 0x752091);
+	}
+
+	return ret;
 }
 
 static int rt711_read_prop(struct sdw_slave *slave)
@@ -526,13 +540,10 @@ static int rt711_dev_system_suspend(struct device *dev)
 	return rt711_dev_suspend(dev);
 }
 
-#define RT711_PROBE_TIMEOUT 5000
-
 static int rt711_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt711_priv *rt711 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt711->first_hw_init)
 		return 0;
@@ -547,12 +558,7 @@ static int rt711_dev_resume(struct device *dev)
 		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT711_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "%s: Initialization not complete, timed out\n", __func__);
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt711.c b/sound/soc/codecs/rt711.c
index 5446f9506a16..2fbd7c0227ff 100644
--- a/sound/soc/codecs/rt711.c
+++ b/sound/soc/codecs/rt711.c
@@ -982,6 +982,8 @@ static void rt711_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT711_PROBE_TIMEOUT 5000
+
 static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -1017,6 +1019,10 @@ static int rt711_pcm_hw_params(struct snd_pcm_substream *substream,
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

