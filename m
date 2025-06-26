Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66854279DCE;
	Thu, 26 Jun 2025 11:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939027; cv=none; b=nSu6yuyHL2iMQK/vRwJJj8B4BJNhVn/WjEDwMnZc7RL1jOWndHTvjrfz6R4v9vlAyInBX3SGomZr4grQTfR8Fx4V7Yh2OcslwDx3hrjPwwmLvfGQGsL7GI7zODPfOk4CFt02e0XD1o8QUtBJ6eFwyhxg7WvEjPwI2cj9F+UPO5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939027; c=relaxed/simple;
	bh=+D1L+UgJ1oRYpPjCQTasQ3CZ3xlr2ukMC6moP9xH+E4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXRJQ8cbg/gdlGUhP/qJ34Ip0jey/vHefnHCYTlKYITDWNeV06Cv+wp68bfyaNTfwpA/MQ2OZnC3PAr9M6s50TD2UpvcnNTGUd+GkG+UnjiuFJQjqanSUirvb75Z8JDgRaKAlcM+p2etFTFfHQNCA+0453YLtjRtqrg2j2/vvk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LAHm/cXP; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LAHm/cXP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939026; x=1782475026;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=+D1L+UgJ1oRYpPjCQTasQ3CZ3xlr2ukMC6moP9xH+E4=;
  b=LAHm/cXPb8ZEio9C/QtOT6BmjOUx0dyijEzCPQEGldjO5PuAmD8TvRn5
   5ziQGacws9EPIGYpbHpET+a1ExlWCNmWLkpmTsMqvkoMA99HD8GXV3r55
   nmCb1k0SDXB8fKykgLhXkg55GXRtDf9dYLw1kgcQvi1r5UEzjlRs55H5R
   mfYfxcoCZ56tPo329sdbMriIusIyJWnVN3VZbBKnVCId0FZwr+UVFPMX9
   m06kujLRK80IUm+6GSUXp/p+NEILOGGwN7VA+MmUKSAzrPovSyfmV9g1n
   56TzfC9TEykTdz4Oov50wXHmRgTFG2hCsePDtwHGtWdnQjyljg5oabYDO
   w==;
X-CSE-ConnectionGUID: d+pLoeyXQxCF/KhzN836Ng==
X-CSE-MsgGUID: vl9+U5VlSOy2EN/at9Ijnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304581"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304581"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:06 -0700
X-CSE-ConnectionGUID: z08VM/haQLu6cgL8vGHIAw==
X-CSE-MsgGUID: yBSrh46PTqu1eZycNwRvHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800602"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:57:04 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 11/15] ASoC: rt1316: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:21 +0800
Message-ID: <20250626115625.536423-12-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt1316_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt1316-sdw.c | 32 ++++++++++++++++++++------------
 1 file changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt1316-sdw.c b/sound/soc/codecs/rt1316-sdw.c
index 960b6c4f5a66..56e82c0f648d 100644
--- a/sound/soc/codecs/rt1316-sdw.c
+++ b/sound/soc/codecs/rt1316-sdw.c
@@ -313,6 +313,7 @@ static int rt1316_update_status(struct sdw_slave *slave,
 					enum sdw_slave_status status)
 {
 	struct  rt1316_sdw_priv *rt1316 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt1316->hw_init = false;
@@ -325,7 +326,18 @@ static int rt1316_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt1316_io_init(&slave->dev, slave);
+	ret = rt1316_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "%s: I/O init failed: %d\n", __func__, ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt1316->regmap, false);
+		regcache_sync(rt1316->regmap);
+	}
+
+	return ret;
 }
 
 static int rt1316_classd_event(struct snd_soc_dapm_widget *w,
@@ -505,6 +517,8 @@ static void rt1316_sdw_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT1316_PROBE_TIMEOUT 5000
+
 static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 	struct snd_pcm_hw_params *params, struct snd_soc_dai *dai)
 {
@@ -534,6 +548,10 @@ static int rt1316_sdw_hw_params(struct snd_pcm_substream *substream,
 	else
 		port_config.num = 2;
 
+	retval = sdw_slave_wait_for_initialization(rt1316->sdw_slave, RT1316_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt1316->sdw_slave, &stream_config,
 				&port_config, 1, sdw_stream);
 	if (retval) {
@@ -742,13 +760,10 @@ static int rt1316_dev_suspend(struct device *dev)
 	return 0;
 }
 
-#define RT1316_PROBE_TIMEOUT 5000
-
 static int rt1316_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt1316_sdw_priv *rt1316 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt1316->first_hw_init)
 		return 0;
@@ -756,14 +771,7 @@ static int rt1316_dev_resume(struct device *dev)
 	if (!slave->unattach_request)
 		goto regmap_sync;
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT1316_PROBE_TIMEOUT));
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

