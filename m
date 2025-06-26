Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 000EA27602D;
	Thu, 26 Jun 2025 11:56:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750939009; cv=none; b=e9R+wbZPE1O+ctTMT+S6/jR+2m08CHuKrWFkxuhLn6Qs5hLewgDGN2B9B7GmMALVv07dIp1AR9XM7bKS+G/0CxuOZz9kzeDZCk98Rema3j6zNpSErgLReeDYhKbahS566leNi04yN5bKtC+4YYY1Hspn2Ha9JrPZnSkJ0jI2QwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750939009; c=relaxed/simple;
	bh=l+ZULz+E396e6z9/WSxS48MyUWRhmnshGr5hszYnAgs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tjq3oAYwNPJr2KEQZj9cU2KgPCSwEsrcgSJpMNcaNg48Sf3eep2vtFio/M5TLvHhOv083fHBueeyUMFpqwwcMzX0/8sv2lNuxUbWOp91eQN07J0GGwK5soUNGf7JE3CnFv/ON0uFdTlRxjconxFzEzPRANP7xjbjRIImIzSMkso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aVk02BSa; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aVk02BSa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750939008; x=1782475008;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=l+ZULz+E396e6z9/WSxS48MyUWRhmnshGr5hszYnAgs=;
  b=aVk02BSaaRQ57/5+IVhhkDEG3uHoWtINIV0qJSuai8S7yuI1BQUqgERD
   i7e+aLNFdff/Mcyl161eHDcjuymbR74HeajM7e2pLigjfNBLSW6x2EqlG
   /Ojb99WtMZUIZWe5s3WuUpeCSlvp6rr04wf2iVnI6hvKJ6UsXTTGkPFfA
   OWlYKc2k0+1p9zG02c6rChM91MvcIpxREf269JStmeWgD2Ft1X6pa98RQ
   OOXPu7FjFacXW8AqMJeb235hwa+pU4wFHTblN0tnBImjYLqDcbBTVI5/i
   XDvSM2WGG/oJ0Rt8YyDYXd9ENbkCHcmwP16REt04sUnsvLleXLAy1tyV4
   g==;
X-CSE-ConnectionGUID: 1BgDA/kpSCGXHTqt4tPrcA==
X-CSE-MsgGUID: NWwEcTdnRQ2yM8POZaEgsg==
X-IronPort-AV: E=McAfee;i="6800,10657,11475"; a="53304534"
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="53304534"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:48 -0700
X-CSE-ConnectionGUID: qZSmPC6lQB+1M1Siq7gHSQ==
X-CSE-MsgGUID: hyAruiDWRTa7kyFlo5BRxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,267,1744095600"; 
   d="scan'208";a="152800559"
Received: from yungchua-desk.itwn.intel.com ([10.227.8.136])
  by fmviesa009-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2025 04:56:46 -0700
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: broonie@kernel.org,
	tiwai@suse.de,
	linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 02/15] ASoC: rt722: wait codec init in hw_params
Date: Thu, 26 Jun 2025 19:56:12 +0800
Message-ID: <20250626115625.536423-3-yung-chuan.liao@linux.intel.com>
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

Move regmap sync to rt722_sdca_update_status() when unattach_request
is set, and only do regmap sync in resume when no reattach needed.
And move waiting codec init to hw_params when the codec really need to
be initialized. The change can shorten the resume time.

Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Shuming Fan <shumingf@realtek.com>
Reviewed-by: Charles Keepax <ckeepax@opensource.cirrus.com>
---
 sound/soc/codecs/rt722-sdca-sdw.c | 26 ++++++++++++++------------
 sound/soc/codecs/rt722-sdca.c     |  6 ++++++
 2 files changed, 20 insertions(+), 12 deletions(-)

diff --git a/sound/soc/codecs/rt722-sdca-sdw.c b/sound/soc/codecs/rt722-sdca-sdw.c
index 70700bdb80a1..b72d169bf15e 100644
--- a/sound/soc/codecs/rt722-sdca-sdw.c
+++ b/sound/soc/codecs/rt722-sdca-sdw.c
@@ -209,6 +209,7 @@ static int rt722_sdca_update_status(struct sdw_slave *slave,
 				enum sdw_slave_status status)
 {
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(&slave->dev);
+	int ret;
 
 	if (status == SDW_SLAVE_UNATTACHED)
 		rt722->hw_init = false;
@@ -236,7 +237,18 @@ static int rt722_sdca_update_status(struct sdw_slave *slave,
 		return 0;
 
 	/* perform I/O transfers required for Slave initialization */
-	return rt722_sdca_io_init(&slave->dev, slave);
+	ret = rt722_sdca_io_init(&slave->dev, slave);
+	if (ret < 0) {
+		dev_err(&slave->dev, "IO init failed: %d\n", ret);
+		return ret;
+	}
+
+	if (slave->unattach_request) {
+		regcache_cache_only(rt722->regmap, false);
+		regcache_sync(rt722->regmap);
+	}
+
+	return ret;
 }
 
 static int rt722_sdca_read_prop(struct sdw_slave *slave)
@@ -495,13 +507,10 @@ static int rt722_sdca_dev_system_suspend(struct device *dev)
 	return rt722_sdca_dev_suspend(dev);
 }
 
-#define RT722_PROBE_TIMEOUT 5000
-
 static int rt722_sdca_dev_resume(struct device *dev)
 {
 	struct sdw_slave *slave = dev_to_sdw_dev(dev);
 	struct rt722_sdca_priv *rt722 = dev_get_drvdata(dev);
-	unsigned long time;
 
 	if (!rt722->first_hw_init)
 		return 0;
@@ -517,14 +526,7 @@ static int rt722_sdca_dev_resume(struct device *dev)
 		goto regmap_sync;
 	}
 
-	time = wait_for_completion_timeout(&slave->initialization_complete,
-				msecs_to_jiffies(RT722_PROBE_TIMEOUT));
-	if (!time) {
-		dev_err(&slave->dev, "Initialization not complete, timed out\n");
-		sdw_show_ping_status(slave->bus, true);
-
-		return -ETIMEDOUT;
-	}
+	return 0;
 
 regmap_sync:
 	slave->unattach_request = 0;
diff --git a/sound/soc/codecs/rt722-sdca.c b/sound/soc/codecs/rt722-sdca.c
index ac9588284a95..68ba252467d0 100644
--- a/sound/soc/codecs/rt722-sdca.c
+++ b/sound/soc/codecs/rt722-sdca.c
@@ -1114,6 +1114,8 @@ static void rt722_sdca_shutdown(struct snd_pcm_substream *substream,
 	snd_soc_dai_set_dma_data(dai, substream, NULL);
 }
 
+#define RT722_PROBE_TIMEOUT 5000
+
 static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 				struct snd_pcm_hw_params *params,
 				struct snd_soc_dai *dai)
@@ -1168,6 +1170,10 @@ static int rt722_sdca_pcm_hw_params(struct snd_pcm_substream *substream,
 	port_config.ch_mask = GENMASK(num_channels - 1, 0);
 	port_config.num = port;
 
+	retval = sdw_slave_wait_for_initialization(rt722->slave, RT722_PROBE_TIMEOUT);
+	if (retval < 0)
+		return retval;
+
 	retval = sdw_stream_add_slave(rt722->slave, &stream_config,
 					&port_config, 1, sdw_stream);
 	if (retval) {
-- 
2.43.0

