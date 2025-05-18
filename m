Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CDBB21A44A;
	Sun, 18 May 2025 10:51:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565494; cv=none; b=pbmlTjj+2VaX7f0hbypuT18e0QxFIDVz4HkOKdGS2PwCxKHWlVW9LNO7ivP7VYrx9x/X/a1GCQsc7cczHDDQuoPtrM53AUJwEt2Brr2xb8WybMp5WRun5RhYRBllseHPNqrNY189rDz//2ZESrBAViVVOOgWS4bTZaMBI+6Fo7s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565494; c=relaxed/simple;
	bh=u9dzxD0Sr+I+nYLHqPgn3dGTmdfcK9R2zDI6wYeixNM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rk4ydA7HY1s5O/nwmanYaPR/MRt9jzYoTW7uLxSHUhqfikIKaCltvbk+YxusBulkde7U0tr5JCyfkY0kaq311ZwPr6cNftNDtuB8nSWmguBXkbkTgPWoky+fCVwtE1+gX0LZ7Dh32q90IzwlaZ3riGWfl50O6K+2s9JwQHSRF50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjrmsPWk; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjrmsPWk"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b26c5fd40a9so3654614a12.1;
        Sun, 18 May 2025 03:51:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565491; x=1748170291; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g0zNbrAF22yEU0zbb+HKw5CmLrhpARa5+ZZ6Pk25Cv8=;
        b=VjrmsPWkPz16Xm+RObdlXJ7CEjAapEqiywPj8iFCPZ/V+he8n8o9vHhGAErY9GzGJu
         kbP3eAs8rDMQwgcaOO0P713+PdNzKnuQHdoy/nhZrV45Pl48DIMtCqozdZbs/7Qntqix
         gzmIpLDYNcuUTY4SSns8klN6QJjYhSE5IvihRYnF7dLkEK/Q/BQlQFHiq5rXZolytuTN
         5Xs5y3HetT7oJmw5DRHMOubc8+s3gnMzvrmxWE2Fv1SM37gIJv7MZPUNguCL3AKjNQBt
         o0Kc+7rOM/FumAvGvA/URbV5hcVTutquWOpvoJ3m1fjt742PX6nRY7ruvYgTglHXancY
         vuSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565491; x=1748170291;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g0zNbrAF22yEU0zbb+HKw5CmLrhpARa5+ZZ6Pk25Cv8=;
        b=fYnyjqrPtyM6zak6zooP8NFWun3lNOP2LIV7KppnJACJiJDGLWf+MwFsiAQKiDJixp
         4pVoq+h/Mi80JC2/jmI4O69HKHTNTaigKWtYG+0fFEt6v3lWnYmagXfIZCbWnaTKSOXI
         fHzSbbD0jMeQe3aKuxV6v46dQbqyJyPpsK6cPyvpBvRadER5ZITMEQY6fGYdlI3WYeyq
         FniYAjRHHQ6FrmlOLdQr+eoZnyJpfeDnJDHH3GRwgOFrPkJW79Fe4/odjjApYUAj1CPc
         WUZ2alDmhkOpAe3iDgrIUkai6/3szud81vWClSCwviZGIDq/T5HbU+gGrVrTo9TRNEWW
         YWcg==
X-Forwarded-Encrypted: i=1; AJvYcCWLfzAVWyGBPOohFDY6uB/wRrnmdOz36NuhxwS2fKh0EoxQkns4TyP14oaRBSHU02d39WAurDzX7iM+xwY=@vger.kernel.org, AJvYcCX8scfSf0J7IrnwEUPOneyCjeZBzApP/OVJ3XaWoBexed79Y30Vcg0fM09qbMfh/kM0+LsxkunhOViB8Yo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxuXHcUVSGYAQGh07Xlgl/l19bdUmXcDhHUni2quAc4fouK7x0Y
	yJQyw8FUPCYSN0nEsVBaM5HqOjGq6mUu+wUp+Wow/ulfyHOTzMoInb4lxSP2rA==
X-Gm-Gg: ASbGncsnWoHE9JMkjiUuxCD7GeKjviKzA6WedkvPIhlYCNloZ2cWpqo6bqdTNgSCreF
	ESgZ7ainYBvA46VHLepVL+Yg/Dyzr7+qGhvGcChpLORk9fvwRT2SgBsvLEyi8QPUZO09/oxBIV9
	t2vIvgDyWvJiYxfYN0PVVos8tm3CeGyOESiHeT2Y4uUGbGBGhpdOyRByI4WPqecvUMQxfvYQulh
	tEigthG46Zxcmnav+hbuc2IcE6b3Kr1XYJKHQ7iqFKp1iNyRIrpRBtQbF4wy2NYZwSUWOop9KPR
	Qay/p9HpKBpdcrzA8MW2KcujBHf3Ji1/dSqH2LUcHPQvE+CKwHjIFajFYZs8a1y6KOcIBnXh/n3
	2a9rI5SRckk9PKZBqkgU9aHwLkluQdVMKC5WLMljxBFgLAw==
X-Google-Smtp-Source: AGHT+IEPpGn5Ti3sVQIvYHDOxmHfa9LJcnppVCLw/tNRCU6lwQ+mbbiAKZ3icAU5v4D87BrN7dh1yw==
X-Received: by 2002:a17:902:ce91:b0:232:219c:2a4f with SMTP id d9443c01a7336-232219c2f99mr30793775ad.1.1747565491454;
        Sun, 18 May 2025 03:51:31 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:31 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:51 +1000
Subject: [PATCH 6/9] ASoC: apple: mca: Support FEs being clock consumers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-6-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6882;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=ekJFShdsNEaG7NlFWenUFGCCo9i2eZnSb0pcLx/Hnbs=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2csrSs9fEnsn7Gi64y6WR4LPjSlc5dHXW8I3rVm+
 cp1jV+8O0pZGMS4GGTFFFk2NAl5zDZiu9kvUrkXZg4rE8gQBi5OAZiIbwsjw8noq49TZoS1GN62
 XVR3+LOYeR/b7WtHziZvCQwOnfnXr4bhn91f+dN8/cbB1Qm5heL2kb31C0L+7Vy1Y370suDDzyM
 7WQA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Support FEs being I2S clock consumers. This does not mean we support
accepting clocks from outside the SoC (although it paves the way for
that support in the future), but it means multiple FEs can attach to one
BE, one being clock producer and the rest clock consumers.

This is useful for grabbing I/V sense data on some machines, since in
such a scenario the format of the sense data on the I2S bus differs
from that of the audio data (the two formats differing in slot width).
With two FEs attached to the bus, we can split the responsibilities and
command different slot widths to the two.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 125 ++++++++++++++++++++-----
 1 file changed, 104 insertions(+), 21 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 7c3e1eae8b963ff593fdcf54e4a1f2e5f64a63c1..be6ff55203121808463846bebda682cdd97fc42d 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -134,12 +134,17 @@ struct mca_cluster {
 	struct clk *clk_parent;
 	struct dma_chan *dma_chans[SNDRV_PCM_STREAM_LAST + 1];
 
+	bool clk_provider;
+
 	bool port_clk_started[SNDRV_PCM_STREAM_LAST + 1];
 	int port_clk_driver; /* The cluster driving this cluster's port */
 
 	bool clocks_in_use[SNDRV_PCM_STREAM_LAST + 1];
 	struct device_link *pd_link;
 
+	/* In case of clock consumer FE */
+	int syncgen_in_use;
+
 	unsigned int bclk_ratio;
 
 	/* Masks etc. picked up via the set_tdm_slot method */
@@ -262,11 +267,32 @@ static int mca_fe_trigger(struct snd_pcm_substream *substream, int cmd,
 	return 0;
 }
 
+static int mca_fe_get_port(struct snd_pcm_substream *substream)
+{
+	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *be;
+	struct snd_soc_dpcm *dpcm;
+
+	be = NULL;
+	for_each_dpcm_be(fe, substream->stream, dpcm) {
+		be = dpcm->be;
+		break;
+	}
+
+	if (!be)
+		return -EINVAL;
+
+	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
+}
+
 static int mca_fe_enable_clocks(struct mca_cluster *cl)
 {
 	struct mca_data *mca = cl->host;
 	int ret;
 
+	if (!cl->clk_provider)
+		return -EINVAL;
+
 	ret = clk_prepare_enable(cl->clk_parent);
 	if (ret) {
 		dev_err(mca->dev,
@@ -340,7 +366,7 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	int ret;
 
 	if (cl->port_clk_driver < 0)
-		return -EINVAL;
+		return 0;
 
 	fe_cl = &mca->clusters[cl->port_clk_driver];
 
@@ -361,6 +387,57 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
+static int mca_fe_prepare(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_data *mca = cl->host;
+
+	if (cl->clk_provider)
+		return 0;
+
+	/* Turn on the cluster power domain if not already in use */
+	if (!cl->syncgen_in_use) {
+		int port = mca_fe_get_port(substream);
+
+		cl->pd_link = device_link_add(mca->dev, cl->pd_dev,
+					      DL_FLAG_STATELESS | DL_FLAG_PM_RUNTIME |
+						DL_FLAG_RPM_ACTIVE);
+		if (!cl->pd_link) {
+			dev_err(mca->dev,
+				"cluster %d: unable to prop-up power domain\n", cl->no);
+			return -EINVAL;
+		}
+
+		writel_relaxed(port + 6 + 1,
+			       cl->base + REG_SYNCGEN_MCLK_SEL);
+		mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN,
+			   SYNCGEN_STATUS_EN);
+	}
+	cl->syncgen_in_use |= 1 << substream->stream;
+
+	return 0;
+}
+
+static int mca_fe_hw_free(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+
+	if (cl->clk_provider)
+		return 0;
+
+	cl->syncgen_in_use &= ~(1 << substream->stream);
+	if (cl->syncgen_in_use)
+		return 0;
+
+	mca_modify(cl, REG_SYNCGEN_STATUS, SYNCGEN_STATUS_EN, 0);
+	if (cl->pd_link)
+		device_link_del(cl->pd_link);
+
+	return 0;
+}
+
 static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 {
 	while (hweight32(mask) > nchans)
@@ -486,9 +563,18 @@ static int mca_fe_set_fmt(struct snd_soc_dai *dai, unsigned int fmt)
 	u32 serdes_conf = 0;
 	u32 bitstart;
 
-	if ((fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) !=
-	    SND_SOC_DAIFMT_BP_FP)
+	switch (fmt & SND_SOC_DAIFMT_CLOCK_PROVIDER_MASK) {
+	case SND_SOC_DAIFMT_BP_FP:
+		cl->clk_provider = true;
+		break;
+
+	case SND_SOC_DAIFMT_BC_FC:
+		cl->clk_provider = false;
+		break;
+
+	default:
 		goto err;
+	}
 
 	switch (fmt & SND_SOC_DAIFMT_FORMAT_MASK) {
 	case SND_SOC_DAIFMT_I2S:
@@ -545,24 +631,6 @@ static int mca_set_bclk_ratio(struct snd_soc_dai *dai, unsigned int ratio)
 	return 0;
 }
 
-static int mca_fe_get_port(struct snd_pcm_substream *substream)
-{
-	struct snd_soc_pcm_runtime *fe = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *be;
-	struct snd_soc_dpcm *dpcm;
-
-	be = NULL;
-	for_each_dpcm_be(fe, substream->stream, dpcm) {
-		be = dpcm->be;
-		break;
-	}
-
-	if (!be)
-		return -EINVAL;
-
-	return mca_dai_to_cluster(snd_soc_rtd_to_cpu(be, 0))->no;
-}
-
 static int mca_fe_hw_params(struct snd_pcm_substream *substream,
 			    struct snd_pcm_hw_params *params,
 			    struct snd_soc_dai *dai)
@@ -687,6 +755,8 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.set_tdm_slot = mca_fe_set_tdm_slot,
 	.hw_params = mca_fe_hw_params,
 	.trigger = mca_fe_trigger,
+	.prepare = mca_fe_prepare,
+	.hw_free = mca_fe_hw_free,
 };
 
 /*
@@ -740,6 +810,9 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 			   PORT_ENABLES_TX_DATA);
 	}
 
+	if (!fe_cl->clk_provider)
+		return 0;
+
 	if (mca_be_clk_started(cl)) {
 		/*
 		 * Port is already started in the other direction.
@@ -769,7 +842,10 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			    struct snd_soc_dai *dai)
 {
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
 	struct mca_data *mca = cl->host;
 
 	if (cl->clocks_in_use[substream->stream] &&
@@ -792,11 +868,18 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			mca_fe_disable_clocks(fe_cl);
 	}
 
+	if (!fe)
+		return;
+	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
+
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
 		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA, 0);
 		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
 	}
 
+	if (!fe_cl->clk_provider)
+		return;
+
 	cl->port_clk_started[substream->stream] = false;
 	if (!mca_be_clk_started(cl)) {
 		/*

-- 
2.49.0

