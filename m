Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8558427A907;
	Thu, 26 Jun 2025 11:57:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939032; cv=none; b=V2ikHhwlB2DeO5sDELC6/ohKbrSNLIJi7wGFJbQPG/DzjiApwSEJJFMrPWuSaB2eXIBYGr3UYEjpXuoU/4mv+TWTVg5zEitBW6kqf5QgLU8h8r9bTDmcNcmLbYE1+xjBmbJr6SvebWOxZ2H8VCX42a07KNwnq+Rg1Gm44fox6gc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939032; c=relaxed/simple;
	bh=nWcrZvoV1+svABIlRXMeL+tQfv2icpx7I30IN1cI5KA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I7cW1nMIMrp2g8e+oeF+wpv1Ph1SzLjoQNi/+t5bmmjNU8yheWr/I3Y8zjHy54cT4W/q4RJR/n0QN1Zfk45RTVHYyXM9P7gs3siVG6idysSjuaQl04NH/aj0b86kXe76D4qMBMJvp+GLc0ma/WOhKtVH/17kIxqFwnfVx7MYCK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EIvQjZha; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EIvQjZha"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939030; x=1782475030;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=nWcrZvoV1+svABIlRXMeL+tQfv2icpx7I30IN1cI5KA=;
  b=EIvQjZhaybw7Dzpe6chgMb577N/bQauyTxoJmwVF8HNi+a/JreYa44ZE
   DfT3XTOUp6xeqtTMximOxwnr6GgBPeECL5I2b5sfBxXoOLZoVB2SM6WCX
   e+oVSG7UrVYkrIXW9FErAhNUS1P3oVyhmVuNcd/LLAq5D7FeeIkLB/mfC
   G24vOaal+eklFoKuqi+uUmJehp4ff3EqqaQPKTf9R91X5mazfo6zuiTzU
   wdtKPCI++7Yx3GZ0gSEWCKmnixh08865XWSZ8RK6bYff56yq7PB3biqXK
   bPZAPHwPAhOuLUsYcLaYW8n8f/8TcFipM6os/HXPiT0W2Faq7ytss9RL/
   Q==;
X-CSE-ConnectionGUID: NkUXZrbASSO3jSb1aSJWQQ==
X-CSE-MsgGUID: 1BEAsESKRXCLuFLoe2544g==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304591"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304591"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:10 -0700
X-CSE-ConnectionGUID: PEQIN+hfTzS4lclNhwLS8w==
X-CSE-MsgGUID: xBO0qHFMRbuxkXknOyZSMg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800616"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:08 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 13/15] ASoC: rt1308: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:23 +0800
Message-ID: <20250626115625.536423-14-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt1308_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1308-sdw.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1308-sdw.c b/sound/soc/codecs/rt1308-sdw.c
index ea708068f0e8..3579189b49b6 100644
--- a/sound/soc/codecs/rt1308-sdw.c
+++ b/sound/soc/codecs/rt1308-sdw.c
@@ -303,6 +303,7 @@ static int rt1308_update_status(struct sdw_slave *slave,
 					enum sdw_slave_status status)
 {
 	struct  rt1308_sdw_priv *rt1308 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1308->hw_init = false;
@@ -315,7 +316,18 @@ static int rt1308_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt1308_io_init(&slave->dev, slave);
+	ret = rt1308_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt1308->regmap, false);
+		regcache_sync_region(rt1308->regmap, 0xc000, 0xcfff);
+	}
+
+	return ret;
 }
 
 static int rt1308_bus_config(struct sdw_slave *slave,
@@ -526,6 +538,8 @@ static int rt1308_sdw_set_tdm_slot(struct snd_soc_dai *dai,
 	return 0;
 }
 
+#define RT1308_PROBE_TIMEOUT 5000
+
 static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
@@ -560,6 +574,10 @@ static int rt1308_sdw_hw_params(struct snd_pcm_substream *substream,
 		port_config.ch_mask = rt1308->rx_mask;
 	}
 
+	retval = sdw_slave_wait_for_initialization(rt1308->sdw_slave, RT1308_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt1308->sdw_slave, &stream_config,
 				&port_config, 1, sdw_stream);
 	if (retval) {
@@ -765,13 +783,10 @@ static int rt1308_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT1308_PROBE_TIMEOUT 5000
-
 static int rt1308_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1308_sdw_priv *rt1308 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt1308->first_hw_init)
 		return 0;
@@ -779,14 +794,7 @@ static int rt1308_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1308_PROBE_TIMEOUT));
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

