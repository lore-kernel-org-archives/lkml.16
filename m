Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A43422A4ED;
	Wed,  5 Feb 2025 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745147; cv=none; b=b7iEl59OF3+hTDiiTqSRQXdblyNWIFahUKcC5r/DjJklPe3QfjQzryXKkXmQ4Nfq/veRVp5dwGHkhaJ3znxG8aQe+jCTK+wv90YXNCmU7er3+XAU52OFiiIG6fIUcTWd2PeGuYv6Xpr5/Z/GFmUCCHNf6UDJrEYv+nEJtS+xbK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745147; c=relaxed/simple;
	bh=yO8ZoEjG8RPfzRB+f7vQddzWqZToJXZjanbvSQPN3Lc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=u1Tw7UBlI+Y4ATOZk5lRCABj+vXe5K7KmrKN4xK2+8kXh0y+B1+JCQsHZe7ilj/u/dYaaR1se62AJjujbY+RUzYNrRVK3WjkbmZc+izX27YuiAIrAAcBZOlMKCMaQFv4QlsT+GR0rF0Ica+opep7K6SAwE2S5gEi0/kWuF9U3OY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cFNaSFj6; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cFNaSFj6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745146; x=1770281146;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=yO8ZoEjG8RPfzRB+f7vQddzWqZToJXZjanbvSQPN3Lc=;
  b=cFNaSFj6AJLbAKqYQ8YeP4rH6eAgoay5fuZ8jCAzvqB88n+g+9gbrnpk
   3V4I7BhhfPze2fW6QT0gd268Seiv5X0dT6SK6TUvKXJL3Jf+p/t7BPU4l
   5Wx3lWH6WagncFgz90gYLknzQj2zrVTPZgNevzyVseKkUn7Yn4aTKyDyO
   XNTbhaAG+83iWBXYZY1EEp9uqXxsoELhPYFBOGMYe7T9C4MzPpNhWCFkO
   NmPdtVT3KSvga9XVLNKSNHPVvi+92ykIxbcnXYbOivjSeM/rn5T1bdJnh
   NfpLFVRqBmyA1uxRDf4Q3TRRJUSczygK4dmMqTe5TiptBBeG9J/uNfoTp
   w==;
X-CSE-ConnectionGUID: BYo76Z1XQG6qG9Gbfmyu7A==
X-CSE-MsgGUID: bqsu1zueQAeDMSbDjjQ+AA==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532502"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532502"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:45 -0800
X-CSE-ConnectionGUID: dZloKoJ6QluD72z4TnGD2w==
X-CSE-MsgGUID: 4DB2QUucRUG8QRfqUzN36w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887821"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:45:45 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 04/16] soundwire: stream: extend sdw_alloc_stream() to take 'type' parameter
Date: Wed,  5 Feb 2025 16:45:18 +0800
Message-ID: <20250205084531.158763-5-yung-chuan.liao@linux.intel.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
References: <20250205084531.158763-1-yung-chuan.liao@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>

In the existing definition of sdw_stream_runtime, the 'type' member is
never set and defaults to PCM. To prepare for the BPT/BRA support, we
need to special-case streams and make use of the 'type'.

No functional change for now, the implicit PCM type is now explicit.

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 Documentation/driver-api/soundwire/stream.rst | 2 +-
 drivers/soundwire/stream.c                    | 6 ++++--
 include/linux/soundwire/sdw.h                 | 2 +-
 sound/soc/qcom/sdw.c                          | 2 +-
 4 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/Documentation/driver-api/soundwire/stream.rst b/Documentation/driver-api/soundwire/stream.rst
index 2a794484f62c..d66201299633 100644
--- a/Documentation/driver-api/soundwire/stream.rst
+++ b/Documentation/driver-api/soundwire/stream.rst
@@ -291,7 +291,7 @@ per stream. From ASoC DPCM framework, this stream state maybe linked to
 
 .. code-block:: c
 
-  int sdw_alloc_stream(char * stream_name);
+  int sdw_alloc_stream(char * stream_name, enum sdw_stream_type type);
 
 The SoundWire core provides a sdw_startup_stream() helper function,
 typically called during a dailink .startup() callback, which performs
diff --git a/drivers/soundwire/stream.c b/drivers/soundwire/stream.c
index e9df503332bb..b88d5332c7ba 100644
--- a/drivers/soundwire/stream.c
+++ b/drivers/soundwire/stream.c
@@ -1805,12 +1805,13 @@ static int set_stream(struct snd_pcm_substream *substream,
  * sdw_alloc_stream() - Allocate and return stream runtime
  *
  * @stream_name: SoundWire stream name
+ * @type: stream type (could be PCM ,PDM or BPT)
  *
  * Allocates a SoundWire stream runtime instance.
  * sdw_alloc_stream should be called only once per stream. Typically
  * invoked from ALSA/ASoC machine/platform driver.
  */
-struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name, enum sdw_stream_type type)
 {
 	struct sdw_stream_runtime *stream;
 
@@ -1822,6 +1823,7 @@ struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name)
 	INIT_LIST_HEAD(&stream->master_list);
 	stream->state = SDW_STREAM_ALLOCATED;
 	stream->m_rt_count = 0;
+	stream->type = type;
 
 	return stream;
 }
@@ -1850,7 +1852,7 @@ int sdw_startup_stream(void *sdw_substream)
 	if (!name)
 		return -ENOMEM;
 
-	sdw_stream = sdw_alloc_stream(name);
+	sdw_stream = sdw_alloc_stream(name, SDW_STREAM_PCM);
 	if (!sdw_stream) {
 		dev_err(rtd->dev, "alloc stream failed for substream DAI %s\n", substream->name);
 		ret = -ENOMEM;
diff --git a/include/linux/soundwire/sdw.h b/include/linux/soundwire/sdw.h
index 857b670eb9a5..ba58e2a52322 100644
--- a/include/linux/soundwire/sdw.h
+++ b/include/linux/soundwire/sdw.h
@@ -1019,7 +1019,7 @@ struct sdw_bus {
 	unsigned int lane_used_bandwidth[SDW_MAX_LANES];
 };
 
-struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name);
+struct sdw_stream_runtime *sdw_alloc_stream(const char *stream_name, enum sdw_stream_type type);
 void sdw_release_stream(struct sdw_stream_runtime *stream);
 
 int sdw_compute_params(struct sdw_bus *bus, struct sdw_stream_runtime *stream);
diff --git a/sound/soc/qcom/sdw.c b/sound/soc/qcom/sdw.c
index f2eda2ff46c0..875da4adb1d7 100644
--- a/sound/soc/qcom/sdw.c
+++ b/sound/soc/qcom/sdw.c
@@ -27,7 +27,7 @@ int qcom_snd_sdw_startup(struct snd_pcm_substream *substream)
 	struct snd_soc_dai *codec_dai;
 	int ret, i;
 
-	sruntime = sdw_alloc_stream(cpu_dai->name);
+	sruntime = sdw_alloc_stream(cpu_dai->name, SDW_STREAM_PCM);
 	if (!sruntime)
 		return -ENOMEM;
 
-- 
2.43.0

