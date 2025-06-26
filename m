Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24167279DA1;
	Thu, 26 Jun 2025 11:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939025; cv=none; b=iXOc6Jlic3tXSzuakENnr6X73UyEjyPciFj2bPJFZR0XVfj0YPgNQ9GBvjSmmVRtKkdAau6bSD2iuDs7tG17bQsY1CC2HV+ni8JwfDR2tDDORd2AelTeDiqLTrDz+AAllKXqjo8H1Gx9hDPLtuvhMtXoso7K8TMjyfzFs2qXPno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939025; c=relaxed/simple;
	bh=OmM1T9hWUO+dqLyl32oQNz02knbaSsAssuvbQZaFCjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pXnS45wP4LjUMSc7MaqECuJN06KN88mpoSXor2u3e94MIB7yM7ImjUgY5EUblUkHE4aFyENKZ3s0Ma3CnTd4hJ/FHL8lK3+AI9w6xCPFB+5VsdLNRzTGL+h28YUJfIb+tO/FIzcfkJEfgKJI+xky0kWjvlvRdJNP4gFgY9SU33Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PNXs/ZXT; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PNXs/ZXT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939024; x=1782475024;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=OmM1T9hWUO+dqLyl32oQNz02knbaSsAssuvbQZaFCjM=;
  b=PNXs/ZXTy4YfUp8wUgjgZxhrxc/u//ML7bfYZsv9tlZAp69Hqx06nUCy
   OVAOCm7IwFHIDPkiIqvOQd3WQv8RGdmuZHF//VAZgAjkeo3HWwSlPQqmd
   HmMzdivX7Z67yfklFbTvdGk1gbCwwa5PMJJPnKeyshWDlBn5r5PJXqXg1
   xJNBNw2d5ucxTfq2uGxRrjEitIik2CJOlELBu39BWN1TlhmOznCXkIZVa
   tsNo68w/i7l4Uhwfdo9sIru1Iun4JCyaYoAQksatYvvbNmMTICSZhumHi
   9P6CQ4FaooVv45yxPolVqH5bQCSkNT4rkL5fbg+ml7z5hXH8bdFOFOrH6
   g==;
X-CSE-ConnectionGUID: UITMB03HRieR2PbT2fAVaw==
X-CSE-MsgGUID: VVhf0JNdRUWxZ9XTxhvS8w==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304576"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304576"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:04 -0700
X-CSE-ConnectionGUID: Tx14iqVMTT6RvR9XINE4xA==
X-CSE-MsgGUID: Yqu+3/lFRjOHtzhI+uWLyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800597"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:02 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 10/15] ASoC: rt700: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:20 +0800
Message-ID: <20250626115625.536423-11-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt700_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt700-sdw.c | 27 +++++++++++++++------------
 sound/soc/codecs/rt700.c     |  6 ++++++
 2 files changed, 21 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt700-sdw.c b/sound/soc/codecs/rt700-sdw.c
index 44543c0da177..dd775788c2ee 100644
--- a/sound/soc/codecs/rt700-sdw.c
+++ b/sound/soc/codecs/rt700-sdw.c
@@ -314,6 +314,7 @@ static int rt700_update_status(struct sdw_slave *slave,
 					enum sdw_slave_status status)
 {
 	struct rt700_priv *rt700 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt700->hw_init = false;
@@ -326,7 +327,19 @@ static int rt700_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt700_io_init(&slave->dev, slave);
+	ret = rt700_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "I/O init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt700->regmap, false);
+		regcache_sync_region(rt700->regmap, 0x3000, 0x8fff);
+		regcache_sync_region(rt700->regmap, 0x752010, 0x75206b);
+	}
+
+	return ret;
 }
 
 static int rt700_read_prop(struct sdw_slave *slave)
@@ -518,13 +531,10 @@ static int rt700_dev_system_suspend(struct device *dev)
 	return rt700_dev_suspend(dev);
 }
 
-#define RT700_PROBE_TIMEOUT 5000
-
 static int rt700_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt700_priv *rt700 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt700->first_hw_init)
 		return 0;
@@ -532,14 +542,7 @@ static int rt700_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT700_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt700.c b/sound/soc/codecs/rt700.c
index 434b926f96c8..4a5338f7ad92 100644
--- a/sound/soc/codecs/rt700.c
+++ b/sound/soc/codecs/rt700.c
@@ -893,6 +893,8 @@ static void rt700_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT700_PROBE_TIMEOUT 5000
+
 static int rt700_pcm_hw_params(struct snd_pcm_substream *substream,
 					struct snd_pcm_hw_params *params,
 					struct snd_soc_dai *dai)
@@ -934,6 +936,10 @@ static int rt700_pcm_hw_params(struct snd_pcm_substream *substream,
 		return -EINVAL;
 	}
 
+	retval = sdw_slave_wait_for_initialization(rt700->slave, RT700_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt700->slave, &stream_config,
 					&port_config, 1, sdw_stream);
 	if (retval) {
-- 
2.43.0

