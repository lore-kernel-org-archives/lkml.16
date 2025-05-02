Received: from mx.treblig.org (mx.treblig.org [46.235.229.95])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25775213E6D;
	Fri,  2 May 2025 23:52:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=46.235.229.95
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746229947; cv=none; b=JAbU1AQhEvatAAwzfyOYMEwR1kgd1FFzUZYKbI/weU1dVB0PaZtxCitzMZFjsM95vH2Vf8lQLRIYfoGQZ5Xn5AHg49goF52Ro4XxldVOnHLUyRjTl8xloDPQjfWOYKVhI4va63zJbNt2/nBmw0MFm53IOfNYOZYzUfnJw8lDmZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746229947; c=relaxed/simple;
	bh=h0NXm4EeAEuLfFAjmxP0ZulxojsR4s/BCdjlDr3/p8Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jbfmOn281x2LR5D6D51LZg3jHhOMQglEF+RJxY0ne/r6smHCwfomszkz6YBgtRLrlPYRFbhST+2lRzQvl/fS9xDlEnfLAw1hDMy3M3YQWnkejOqGBtMmkc9kXwSmFoHKJUhrM3Lc06buEqs06rK8bhQ8HIfOFYUC4r8ilYvOlYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org; spf=pass smtp.mailfrom=treblig.org; dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b=L+C4sJws; arc=none smtp.client-ip=46.235.229.95
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=treblig.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=treblig.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=treblig.org header.i=@treblig.org header.b="L+C4sJws"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=cU7PYvl7ywL0Qq3Rit2A1bW2uoggjy3UStcxE/MjAYc=; b=L+C4sJwszERQta2q
	bqjDi1oCNtoqF3xuSq40yo6vUnjFnITj7qTofPkFvCTjr5Pttk1Zp8UAP75iUsroqI3PVj5RduDiS
	P4Oj7AP+CVwJ+VU0vy/XqOa/6M79idrgjJ1B0pMdodDZFosPgzC22ClgRxQ9wXcTlpnReaxQ717eU
	KvDAEOzGS/k2SjQPP6QthzFGmFbVCwUyS/4cKBryQg6Piji/Yv08LSGCeXlCU121mqf3oTllrR8fH
	81eZshA6LPY1ABA3kt1DrhusUObWeKdfTNwUrx5rpt0vCcP6ChdJrf8oCAQCJ/pNGZajgXjdMG6hs
	Fpj8xUfvyzRAyK+ypg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1uB0B3-001BML-16;
	Fri, 02 May 2025 23:52:21 +0000
From: linux@treblig.org
To: perex@perex.cz,
	tiwai@suse.com,
	linux-sound@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 2/5] ALSA: pcm: Remove unused snd_dmaengine_pcm_open_request_chan
Date: Sat,  3 May 2025 00:52:16 +0100
Message-ID: <20250502235219.1000429-3-linux@treblig.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250502235219.1000429-1-linux@treblig.org>
References: <20250502235219.1000429-1-linux@treblig.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: "Dr. David Alan Gilbert" <linux@treblig.org>

snd_dmaengine_pcm_open_request_chan() last use was removed in 2022's
commit b401d1fd8053 ("ASoC: pxa: remove unused board support")

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 include/sound/dmaengine_pcm.h |  2 --
 sound/core/pcm_dmaengine.c    | 21 ---------------------
 2 files changed, 23 deletions(-)

diff --git a/include/sound/dmaengine_pcm.h b/include/sound/dmaengine_pcm.h
index f6baa9a01868..1ef13bcdc43f 100644
--- a/include/sound/dmaengine_pcm.h
+++ b/include/sound/dmaengine_pcm.h
@@ -38,8 +38,6 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 int snd_dmaengine_pcm_close(struct snd_pcm_substream *substream);
 int snd_dmaengine_pcm_sync_stop(struct snd_pcm_substream *substream);
 
-int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
-	dma_filter_fn filter_fn, void *filter_data);
 int snd_dmaengine_pcm_close_release_chan(struct snd_pcm_substream *substream);
 
 struct dma_chan *snd_dmaengine_pcm_request_channel(dma_filter_fn filter_fn,
diff --git a/sound/core/pcm_dmaengine.c b/sound/core/pcm_dmaengine.c
index b134a51b3fd5..72040964b6fd 100644
--- a/sound/core/pcm_dmaengine.c
+++ b/sound/core/pcm_dmaengine.c
@@ -328,27 +328,6 @@ int snd_dmaengine_pcm_open(struct snd_pcm_substream *substream,
 }
 EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open);
 
-/**
- * snd_dmaengine_pcm_open_request_chan - Open a dmaengine based PCM substream and request channel
- * @substream: PCM substream
- * @filter_fn: Filter function used to request the DMA channel
- * @filter_data: Data passed to the DMA filter function
- *
- * This function will request a DMA channel using the passed filter function and
- * data. The function should usually be called from the pcm open callback. Note
- * that this function will use private_data field of the substream's runtime. So
- * it is not available to your pcm driver implementation.
- *
- * Return: 0 on success, a negative error code otherwise
- */
-int snd_dmaengine_pcm_open_request_chan(struct snd_pcm_substream *substream,
-	dma_filter_fn filter_fn, void *filter_data)
-{
-	return snd_dmaengine_pcm_open(substream,
-		    snd_dmaengine_pcm_request_channel(filter_fn, filter_data));
-}
-EXPORT_SYMBOL_GPL(snd_dmaengine_pcm_open_request_chan);
-
 int snd_dmaengine_pcm_sync_stop(struct snd_pcm_substream *substream)
 {
 	struct dmaengine_pcm_runtime_data *prtd = substream_to_prtd(substream);
-- 
2.49.0

