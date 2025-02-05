Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FB9222CBDF;
	Wed,  5 Feb 2025 08:46:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738745163; cv=none; b=DuNMtMxhnzQyp+rfXH5kT8mxEVBK1JT3pqAK7IxotJLj4thLBYdqo1HtjxyM7u2yZjOHxEg9A29Fi6hXvOyDdwLcGW66oRWee1jgbw57sCqg7B1vS7L5MRR+0bbCvl/fn0NZloipe/kbMRYD93+Ni206+L1cAoiVaRazXD+6StU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738745163; c=relaxed/simple;
	bh=SZeVBt+69Nd4V8+BZIwQWsTVX6HxGvI6ouZBD9EwvZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=PRBB/MCvBMu7dg8oyUEWCJ7YGjNxlZz/WlpBpAGoGI7vAokr+LvyepYdH14Aj7MBXrerM/DJMv7s650+gRySGUhOVi3ugT3+frnAhbqlnpHlLcW71VpObIxOZR/y4V/+QwEO+PDTZRBq54hxYaJMkmafaA5FQt7Hm731l5bF634=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=none smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RO0s82W2; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RO0s82W2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738745161; x=1770281161;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SZeVBt+69Nd4V8+BZIwQWsTVX6HxGvI6ouZBD9EwvZ8=;
  b=RO0s82W2ir9SmuaPWmy/5FiZvbj7WL1oBS+4QzQNfAaf2wp0V20/nQfJ
   LXh/BRDixxArOluCyVraCbIU1tqPP0SN0L+1eqr/1rshZZF7Bhn9Pz+lr
   BZxPL2dMS3QDOftJbUlRLBM5g+jRBQLhgewOgqRHnDT/VqeQHTkocec3F
   szTaA59QhnVdEIByb5S5EVL/Ap4RVZw0rCXaUFK7ePwop6OdelGe+5gWu
   qvmWd8XvyPn0gmokuojB4LTW1kHa4QJdSm8AV+4EvVVmDsafFCU9NEAmw
   SCT658kz8ljsmSiY10V82mU0hPWA3nZWWqWEMRrWquknYhzmRvUpzUjcr
   g==;
X-CSE-ConnectionGUID: 7kKAdxkRTCmaeTUEc7Hkig==
X-CSE-MsgGUID: PSsREt/cQfu/JAO1qqQrEQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="38532557"
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="38532557"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:46:00 -0800
X-CSE-ConnectionGUID: SRXxjLWaS7u7Ioe9lIvL+Q==
X-CSE-MsgGUID: lfS88BdHQOWGrF7KbA2l2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,261,1732608000"; 
   d="scan'208";a="115887931"
Received: from mdroper-mobl2.amr.corp.intel.com (HELO yungchua-desk.intel.com) ([10.124.223.241])
  by fmviesa004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Feb 2025 00:46:00 -0800
From: Bard Liao <yung-chuan.liao@linux.intel.com>
To: linux-sound@vger.kernel.org,
	vkoul@kernel.org
Cc: vinod.koul@linaro.org,
	linux-kernel@vger.kernel.org,
	pierre-louis.bossart@linux.dev,
	bard.liao@intel.com
Subject: [PATCH 14/16] ASoC: SOF: Intel: hda-sdw-bpt: add CHAIN_DMA support
Date: Wed,  5 Feb 2025 16:45:28 +0800
Message-ID: <20250205084531.158763-15-yung-chuan.liao@linux.intel.com>
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

When the firmware is involved, the data can be transferred with a
CHAIN_DMA on LNL+.

The CHAIN_DMA needs to be programmed before the DMAs per the
documentation. The states are not exactly symmetrical, on stop we must
do a PAUSE and RESET.

The FIFO size of 10ms was determined experimentally. With the minimum
of 2ms, errors were reported by the codec, likely because of xruns.

The code flow deals with the two TX and RX CHAIN_DMAs in symmetrical
ways, i.e.
alloc TX
alloc RX
enable TX
enable RX
disable RX
disable TX
free RX
free TX

Signed-off-by: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
Signed-off-by: Bard Liao <yung-chuan.liao@linux.intel.com>
Reviewed-by: Péter Ujfalusi <peter.ujfalusi@linux.intel.com>
Reviewed-by: Liam Girdwood <liam.r.girdwood@intel.com>
Reviewed-by: Ranjani Sridharan <ranjani.sridharan@linux.intel.com>
---
 sound/soc/sof/intel/hda-sdw-bpt.c | 126 ++++++++++++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/sound/soc/sof/intel/hda-sdw-bpt.c b/sound/soc/sof/intel/hda-sdw-bpt.c
index f75a7b39293e..ba10259fe262 100644
--- a/sound/soc/sof/intel/hda-sdw-bpt.c
+++ b/sound/soc/sof/intel/hda-sdw-bpt.c
@@ -14,12 +14,80 @@
 #include <sound/hda-mlink.h>
 #include <sound/hda-sdw-bpt.h>
 #include <sound/sof.h>
+#include <sound/sof/ipc4/header.h>
 #include "../ops.h"
 #include "../sof-priv.h"
+#include "../ipc4-priv.h"
 #include "hda.h"
 
 #define BPT_FREQUENCY		192000 /* The max rate defined in rate_bits[] hdac_device.c */
 #define BPT_MULTIPLIER		((BPT_FREQUENCY / 48000) - 1)
+#define BPT_CHAIN_DMA_FIFO_MS	10
+/*
+ * This routine is directly inspired by sof_ipc4_chain_dma_trigger(),
+ * with major simplifications since there are no pipelines defined
+ * and no dependency on ALSA hw_params
+ */
+static int chain_dma_trigger(struct snd_sof_dev *sdev, unsigned int stream_tag,
+			     int direction, int state)
+{
+	struct sof_ipc4_fw_data *ipc4_data = sdev->private;
+	bool allocate, enable, set_fifo_size;
+	struct sof_ipc4_msg msg = {{ 0 }};
+	int dma_id;
+
+	if (sdev->pdata->ipc_type != SOF_IPC_TYPE_4)
+		return -EOPNOTSUPP;
+
+	switch (state) {
+	case SOF_IPC4_PIPE_RUNNING: /* Allocate and start the chain */
+		allocate = true;
+		enable = true;
+		set_fifo_size = true;
+		break;
+	case SOF_IPC4_PIPE_PAUSED: /* Stop the chain */
+		allocate = true;
+		enable = false;
+		set_fifo_size = false;
+		break;
+	case SOF_IPC4_PIPE_RESET: /* Deallocate chain resources and remove the chain */
+		allocate = false;
+		enable = false;
+		set_fifo_size = false;
+		break;
+	default:
+		dev_err(sdev->dev, "Unexpected state %d", state);
+		return -EINVAL;
+	}
+
+	msg.primary = SOF_IPC4_MSG_TYPE_SET(SOF_IPC4_GLB_CHAIN_DMA);
+	msg.primary |= SOF_IPC4_MSG_DIR(SOF_IPC4_MSG_REQUEST);
+	msg.primary |= SOF_IPC4_MSG_TARGET(SOF_IPC4_FW_GEN_MSG);
+
+	/* for BPT/BRA we can use the same stream tag for host and link */
+	dma_id = stream_tag - 1;
+	if (direction == SNDRV_PCM_STREAM_CAPTURE)
+		dma_id += ipc4_data->num_playback_streams;
+
+	msg.primary |=  SOF_IPC4_GLB_CHAIN_DMA_HOST_ID(dma_id);
+	msg.primary |=  SOF_IPC4_GLB_CHAIN_DMA_LINK_ID(dma_id);
+
+	/* For BPT/BRA we use 32 bits so SCS is not set */
+
+	/* CHAIN DMA needs at least 2ms */
+	if (set_fifo_size)
+		msg.extension |=  SOF_IPC4_GLB_EXT_CHAIN_DMA_FIFO_SIZE(BPT_FREQUENCY / 1000 *
+								       BPT_CHAIN_DMA_FIFO_MS *
+								       sizeof(u32));
+
+	if (allocate)
+		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ALLOCATE_MASK;
+
+	if (enable)
+		msg.primary |= SOF_IPC4_GLB_CHAIN_DMA_ENABLE_MASK;
+
+	return sof_ipc_tx_message_no_reply(sdev->ipc, &msg, 0);
+}
 
 static int hda_sdw_bpt_dma_prepare(struct device *dev, struct hdac_ext_stream **sdw_bpt_stream,
 				   struct snd_dma_buffer *dmab_bdl, u32 bpt_num_bytes,
@@ -46,6 +114,21 @@ static int hda_sdw_bpt_dma_prepare(struct device *dev, struct hdac_ext_stream **
 	}
 	*sdw_bpt_stream = bpt_stream;
 
+	if (!sdev->dspless_mode_selected) {
+		struct hdac_stream *hstream;
+		u32 mask;
+
+		/* decouple host and link DMA if the DSP is used */
+		hstream = &bpt_stream->hstream;
+		mask = BIT(hstream->index);
+
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL, mask, mask);
+
+		snd_hdac_ext_stream_reset(bpt_stream);
+
+		snd_hdac_ext_stream_setup(bpt_stream, format);
+	}
+
 	if (hdac_stream(bpt_stream)->direction == SNDRV_PCM_STREAM_PLAYBACK) {
 		struct hdac_bus *bus = sof_to_bus(sdev);
 		struct hdac_ext_link *hlink;
@@ -63,6 +146,8 @@ static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream
 				     struct snd_dma_buffer *dmab_bdl)
 {
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
+	struct hdac_stream *hstream;
+	u32 mask;
 	int ret;
 
 	ret = hda_cl_cleanup(sdev->dev, dmab_bdl, true, sdw_bpt_stream);
@@ -83,6 +168,22 @@ static int hda_sdw_bpt_dma_deprepare(struct device *dev, struct hdac_ext_stream
 		snd_hdac_ext_bus_link_clear_stream_id(hlink, stream_tag);
 	}
 
+	if (!sdev->dspless_mode_selected) {
+		/* Release CHAIN_DMA resources */
+		ret = chain_dma_trigger(sdev, hdac_stream(sdw_bpt_stream)->stream_tag,
+					hdac_stream(sdw_bpt_stream)->direction,
+					SOF_IPC4_PIPE_RESET);
+		if (ret < 0)
+			dev_err(sdev->dev, "%s: chain_dma_trigger PIPE_RESET failed: %d\n",
+				__func__, ret);
+
+		/* couple host and link DMA */
+		hstream = &sdw_bpt_stream->hstream;
+		mask = BIT(hstream->index);
+
+		snd_sof_dsp_update_bits(sdev, HDA_DSP_PP_BAR, SOF_HDA_REG_PP_PPCTL, mask, 0);
+	}
+
 	return 0;
 }
 
@@ -95,6 +196,20 @@ static int hda_sdw_bpt_dma_enable(struct device *dev, struct hdac_ext_stream *sd
 	if (ret < 0)
 		dev_err(sdev->dev, "%s: SDW BPT DMA trigger start failed\n", __func__);
 
+	if (!sdev->dspless_mode_selected) {
+		/* the chain DMA needs to be programmed before the DMAs */
+		ret = chain_dma_trigger(sdev, hdac_stream(sdw_bpt_stream)->stream_tag,
+					hdac_stream(sdw_bpt_stream)->direction,
+					SOF_IPC4_PIPE_RUNNING);
+		if (ret < 0) {
+			dev_err(sdev->dev, "%s: chain_dma_trigger failed: %d\n",
+				__func__, ret);
+			hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_STOP);
+			return ret;
+		}
+		snd_hdac_ext_stream_start(sdw_bpt_stream);
+	}
+
 	return ret;
 }
 
@@ -103,6 +218,17 @@ static int hda_sdw_bpt_dma_disable(struct device *dev, struct hdac_ext_stream *s
 	struct snd_sof_dev *sdev = dev_get_drvdata(dev);
 	int ret;
 
+	if (!sdev->dspless_mode_selected) {
+		snd_hdac_ext_stream_clear(sdw_bpt_stream);
+
+		ret = chain_dma_trigger(sdev, hdac_stream(sdw_bpt_stream)->stream_tag,
+					hdac_stream(sdw_bpt_stream)->direction,
+					SOF_IPC4_PIPE_PAUSED);
+		if (ret < 0)
+			dev_err(sdev->dev, "%s: chain_dma_trigger PIPE_PAUSED failed: %d\n",
+				__func__, ret);
+	}
+
 	ret = hda_cl_trigger(sdev->dev, sdw_bpt_stream, SNDRV_PCM_TRIGGER_STOP);
 	if (ret < 0)
 		dev_err(sdev->dev, "%s: SDW BPT DMA trigger stop failed\n", __func__);
-- 
2.43.0

