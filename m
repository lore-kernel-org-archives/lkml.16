Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EE64C8F;
	Fri,  9 May 2025 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746751062; cv=none; b=gTE6ouSJ4IrvuaoXwNCuS3SoZE0Oc81gIE9ua90up/Q0LiAN62vIEnvpNsmqq2+Vxtlig5IrE/x+nqJq4YyGjcbv+emK9F4IhPWiakX3QTcjjBaAFFUyqV0e8/zHNw2APjPpu5QXQl6rzrE9cqU1XqJMaG5gMiZtDhBRp/eqqI0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746751062; c=relaxed/simple;
	bh=Pmvr/01kA/XO5bbEuBc/3xzSBvGclEt4ULR2KdSd+8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ekt5QT/umrU5Fs08YDmg+BZE8PdjquJvRGR3/Hnx4XRawmdpnm06FcWvRr5RS4GuC3k6W7Apnzry9D67rmn9dNKxThmZpcxsUsunJLcXRTL5N9enxCvKkcQVKx0dY0NAhZAh5tuJ2Q+/SO6opBm21GIqNJpzsiqMSzGP7VRB+TM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=IXMK8/lH; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="IXMK8/lH"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=K8KorZFrEW29ctrgZeDc7yX8DoxhiVN4Ho2cXKf35FI=; b=IXMK8/lHBbI3HpRU
	qlLxa+Tr499ffRcPg+E8IvP5ar7fiknsGeOPegdXW3tdqrWht9PNFznbBdel2VBQ1IIflsVOFuD+F
	7y9zZ5cXhnuFAmQaky3W2vWhD6nHtX8ttyz39cNsn647BjIS1rzGIqm0DSm2fL7VFSa5+xo5Om1Pw
	ffJnvzPE8zxK/QrmafNXwF6DwfKX+MQXW/uc3qeWBWVQ1Ul33pdkA9jDDOEpXaEuOwrhllPfAQAdj
	DlRojU7/GsT/DrwSj946ueRJdbfpggAPI+HpWUUmJruUmbQ3/qxNO3idwMbWmMEjloseELKquPmtr
	AkztkWhEqC/5GAlptQ==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uDBjp-002Wh2-1l;
	Fri, 09 May 2025 00:37:17 +0000
From: linux@treblig.org
To: cezary.rojewski@intel.com,
	liam.r.girdwood@linux.intel.com,
	peter.ujfalusi@linux.intel.com,
	yung-chuan.liao@linux.intel.com,
	ranjani.sridharan@linux.intel.com,
	kai.vehmanen@linux.intel.com,
	pierre-louis.bossart@linux.dev
Cc: broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: Intel: atom: Remove unused functions
Date: Fri,  9 May 2025 01:37:16 +0100
Message-ID: <20250509003716.278416-1-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

sst_cdev_fragment_elapsed() was added in 2014 by
commit 7adab122a57c ("ASoC: Intel: sst - add compressed ops handling")
but has remained unused.

sst_get_stream_allocated() was added in 2014 by
commit cc547054d312 ("ASoC: Intel: sst - add pcm ops handling")
but has remained unused.

sst_wait_interruptible() was added in 2014 by
commit 60dc8dbacb00 ("ASoC: Intel: sst: Add some helper functions")
but has remained unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/intel/atom/sst/sst.h               |  6 ----
 sound/soc/intel/atom/sst/sst_drv_interface.c | 24 --------------
 sound/soc/intel/atom/sst/sst_pvt.c           | 33 --------------------
 3 files changed, 63 deletions(-)

diff --git a/sound/soc/intel/atom/sst/sst.h b/sound/soc/intel/atom/sst/sst.h
index 126903e126e4..c43946c5ecee 100644
--- a/sound/soc/intel/atom/sst/sst.h
+++ b/sound/soc/intel/atom/sst/sst.h
@@ -443,9 +443,6 @@ int sst_set_stream_param(int str_id, struct snd_sst_params *str_param);
 int sst_set_metadata(int str_id, char *params);
 int sst_get_stream(struct intel_sst_drv *ctx,
 		struct snd_sst_params *str_param);
-int sst_get_stream_allocated(struct intel_sst_drv *ctx,
-		struct snd_sst_params *str_param,
-		struct snd_sst_lib_download **lib_dnld);
 int sst_drain_stream(struct intel_sst_drv *sst_drv_ctx,
 		int str_id, bool partial_drain);
 int sst_post_message_mrfld(struct intel_sst_drv *sst_drv_ctx,
@@ -461,8 +458,6 @@ void sst_post_download_mrfld(struct intel_sst_drv *ctx);
 int sst_get_block_stream(struct intel_sst_drv *sst_drv_ctx);
 void sst_memcpy_free_resources(struct intel_sst_drv *sst_drv_ctx);
 
-int sst_wait_interruptible(struct intel_sst_drv *sst_drv_ctx,
-				struct sst_block *block);
 int sst_wait_timeout(struct intel_sst_drv *sst_drv_ctx,
 			struct sst_block *block);
 int sst_create_ipc_msg(struct ipc_post **arg, bool large);
@@ -470,7 +465,6 @@ int free_stream_context(struct intel_sst_drv *ctx, unsigned int str_id);
 void sst_clean_stream(struct stream_info *stream);
 int intel_sst_register_compress(struct intel_sst_drv *sst);
 int intel_sst_remove_compress(struct intel_sst_drv *sst);
-void sst_cdev_fragment_elapsed(struct intel_sst_drv *ctx, int str_id);
 int sst_send_sync_msg(int ipc, int str_id);
 int sst_get_num_channel(struct snd_sst_params *str_param);
 int sst_get_sfreq(struct snd_sst_params *str_param);
diff --git a/sound/soc/intel/atom/sst/sst_drv_interface.c b/sound/soc/intel/atom/sst/sst_drv_interface.c
index dc31c2c8f54c..8bb27f86eb65 100644
--- a/sound/soc/intel/atom/sst/sst_drv_interface.c
+++ b/sound/soc/intel/atom/sst/sst_drv_interface.c
@@ -55,19 +55,6 @@ int free_stream_context(struct intel_sst_drv *ctx, unsigned int str_id)
 	return ret;
 }
 
-int sst_get_stream_allocated(struct intel_sst_drv *ctx,
-	struct snd_sst_params *str_param,
-	struct snd_sst_lib_download **lib_dnld)
-{
-	int retval;
-
-	retval = ctx->ops->alloc_stream(ctx, str_param);
-	if (retval > 0)
-		dev_dbg(ctx->dev, "Stream allocated %d\n", retval);
-	return retval;
-
-}
-
 /*
  * sst_get_sfreq - this function returns the frequency of the stream
  *
@@ -430,17 +417,6 @@ static int sst_cdev_codec_caps(struct snd_compr_codec_caps *codec)
 	return 0;
 }
 
-void sst_cdev_fragment_elapsed(struct intel_sst_drv *ctx, int str_id)
-{
-	struct stream_info *stream;
-
-	dev_dbg(ctx->dev, "fragment elapsed from firmware for str_id %d\n",
-			str_id);
-	stream = &ctx->streams[str_id];
-	if (stream->compr_cb)
-		stream->compr_cb(stream->compr_cb_param);
-}
-
 /*
  * sst_close_pcm_stream - Close PCM interface
  *
diff --git a/sound/soc/intel/atom/sst/sst_pvt.c b/sound/soc/intel/atom/sst/sst_pvt.c
index e6a5c18a7018..5d08f7d803f9 100644
--- a/sound/soc/intel/atom/sst/sst_pvt.c
+++ b/sound/soc/intel/atom/sst/sst_pvt.c
@@ -69,39 +69,6 @@ void sst_set_fw_state_locked(
 	mutex_unlock(&sst_drv_ctx->sst_lock);
 }
 
-/*
- * sst_wait_interruptible - wait on event
- *
- * @sst_drv_ctx: Driver context
- * @block: Driver block to wait on
- *
- * This function waits without a timeout (and is interruptable) for a
- * given block event
- */
-int sst_wait_interruptible(struct intel_sst_drv *sst_drv_ctx,
-				struct sst_block *block)
-{
-	int retval = 0;
-
-	if (!wait_event_interruptible(sst_drv_ctx->wait_queue,
-				block->condition)) {
-		/* event wake */
-		if (block->ret_code < 0) {
-			dev_err(sst_drv_ctx->dev,
-				"stream failed %d\n", block->ret_code);
-			retval = -EBUSY;
-		} else {
-			dev_dbg(sst_drv_ctx->dev, "event up\n");
-			retval = 0;
-		}
-	} else {
-		dev_err(sst_drv_ctx->dev, "signal interrupted\n");
-		retval = -EINTR;
-	}
-	return retval;
-
-}
-
 /*
  * sst_wait_timeout - wait on event for timeout
  *
-- 
2.49.0

