Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE1B218ABD;
	Sun, 18 May 2025 10:51:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565486; cv=none; b=tYQNprLucy3eNDli/rmKYSs6by3Hfmg6TGCY25ZBXENWitG0AGBo7xbg9CzerK/4B3NzJz9NFqKYSEHzsR1o1KUVzvfdBWx+bbm8/T3EdjAiYa4ZtYnD084PHVSdwA26SvzPgducf3y0SqTUxvudosP9UqG9dAvp2+mArA7hleo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565486; c=relaxed/simple;
	bh=WHKqTa4OI7H0tsaMNmaewILqLC6gPu0/Bub9Q9xEKy8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nTE0JVg6wt8DtM/Id93nuzEgUeUg71RJLSa+n+9pIt4kvlQGf9YnL46hNRoOIUv8PURn7H9RDFUr8cxuwi3ay+C6tD2Wav60cJmgzlGV9g8E0RSXCSuW/rgKGXWvjxr4KsDGaVvQ+LYS6NN5S5c7NvW0tZ6mkoNXmSAK2Y9r6CQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JskH0yoj; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JskH0yoj"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-22e09f57ed4so47544895ad.0;
        Sun, 18 May 2025 03:51:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565484; x=1748170284; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFDiS0lWhEbyZuQaVA80Oh8M+rJLhBawrvjn5pFhSDI=;
        b=JskH0yojgy7TMA0lU1OwrVLAmWsfMaz9WW2lL83SEJ9vf+uezybFRcNlrnrkOGWg/z
         QkxzdXBMAgYbjP86F0kIzbtLlwqMFiVWKSqcrzBnfPinjpGUGmZsRalYD2kTY+cokYxE
         wPYzt3bs1EfqeQqklc9EjmoJhPsDvW0uyRTGwzgB2KjsYjR0eRsq/+Au5BRVJ1zCpZsM
         TAyZq1SWgE9ccuAkH92EMHkSy9EVI3Ey7Fmw0NYQ2sTDbd3LGKXo08EVpsTa1KTnSd/H
         PwICcPnRzq3F18/MqDRrmSeOUfFLgPkGSoc2Itc0U0M6vnUlmSWUz3J1TlOZO9JDXiJJ
         Q9jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565484; x=1748170284;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFDiS0lWhEbyZuQaVA80Oh8M+rJLhBawrvjn5pFhSDI=;
        b=jNzg8qEGpNKfy76nnv6RJCeGIJ7uF3AASL8+zXxlzpvKCsj+onJq+rHsDeNE7H7x0W
         2w82Mm6ZgWqM4nLn5hkf6QAS3evT+yAowJrsKYIPGhGnVRMbnXm9p4HBBPQhsWQ6aRI3
         /7HEoDhddgimx4DnH4qEybfySBkvqqkrwe7hSwBPXRcWqqtVrXyvXE3edsII2eqCZ9z7
         CBLwiTMoy53PmzdvheAYvFT3+/kt/CTd7qo9iXGTP7kvhySLYtbrj8c/ZL45ktqKqfJW
         o0VsW5WN82Umq6dTWg40+C8U+w3nZ2xNvG+yMNzMXHyOa8PmuNsz3mG5GsC4QEyqXtM6
         Frjw==
X-Forwarded-Encrypted: i=1; AJvYcCVypNlApk5NA7qX5NMTkWC5GT6XbP5fnCEdw0ZwwviAbesW1fP3tCHfbGT4+B6p3H6u00qKmmqTY+mnvec=@vger.kernel.org, AJvYcCW3dHZadZ2WkgFXIZexZZluinf5DWUwKCJWeN2KLjhGY0gS+zsHsxw6U1Sh4qLksezi8valbI5rKfyObLg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjdLgyRJ0JfIkJhatI0G9v3E8uxXZcUoN9i+qM8Lzg9j6JNMah
	yQ2XY2d7+/zZEDr9HbKjfIEbs9lCCC2r8CVtXfblAl0DCnhgrhd1IX07hP0gfQ==
X-Gm-Gg: ASbGnctNy1p21ihrC5F2jKsOL7NTg55J1WgItFATEj/+cKljvzX2USc350cCVVFE1gW
	ytTROncIaObv7GHdB8OsjbaBUmy5oFyUNAOEmNCyDRvrO5lmyX9anO9uHQHAXN5tdvVaj5Ck1bY
	j+3AtS7Tl7lCchq/xlIUWFC+Z3Iqp1VopoRdmVoKeNbn41eDf6tTYn+vr1L1uQjNxo1g8eGrf5t
	46W7aUXfKC0g3kTm+pV60A9aAF8TcOCK3XwzCQbCvr7FjPCUGwoVKuqTzONko2NSEe3TguDU9EU
	G6BwrMdTICn3c97jPoR3E2FkMViJrUQTiSTrtrEmG2/D4a09g+ORV3uYZgDNmKWn0TqZp1Bj9oP
	c+AREuXKeU7qIRwXHj9WXNuc/We3J+tE5EZtroq90yrPjbw==
X-Google-Smtp-Source: AGHT+IEg2ObOzCEclBARUO3SK7EvQFwnxfiABcx+/MtSC/IQoVV/c/YSB8ejej1qcF2CxQQVxRrB7w==
X-Received: by 2002:a17:902:f543:b0:21f:1348:10e6 with SMTP id d9443c01a7336-231d4d2041dmr139071415ad.13.1747565484007;
        Sun, 18 May 2025 03:51:24 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:23 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:49 +1000
Subject: [PATCH 4/9] ASoC: apple: mca: Separate data & clock port setup
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-4-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6128;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=maKc9rdznQhyMiZTaCGBUlWtsoeHi/4QFpgyaypjIB4=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau2f8SrBf9Nv/xvxfyX/Yt6wrV5t7ob/0t3vPROXLb
 olPG68f6ihlYRDjYpAVU2TZ0CTkMduI7Wa/SOVemDmsTCBDGLg4BWAiDTsY/sfUBRzV5t52dsPC
 xxf83sb+fX3f/4D5M6dbEn4fZl1st7RlZJjf/zg40Na/cnrXQXfhdxK3o7bdzdtTvvRx6JdMJ9v
 S0ywA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

Up until now FEs were always the clock providers -- feeding the clocks
on any ports (BEs) they are attached to. This will soon change and FEs
will be allowed to be clock consumers. Once that happens, the routing
of clocks and data will to some degree decouple.

In advance of the change, make preparations:

 * Narrow down semantics of what was formerly the 'port_driver' field
   to refer to clocks only.

 * On 'startup' of BEs, separate the clock and data aspects of the port
   setup.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 67 +++++++++++++++----------
 1 file changed, 40 insertions(+), 27 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 69f2e852d4aeb2d53eea5d7fee400b2337a09065..39713c378ba10910b0a3ac3d804844b25dfa2c94 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -134,8 +134,8 @@ struct mca_cluster {
 	struct clk *clk_parent;
 	struct dma_chan *dma_chans[SNDRV_PCM_STREAM_LAST + 1];
 
-	bool port_started[SNDRV_PCM_STREAM_LAST + 1];
-	int port_driver; /* The cluster driving this cluster's port */
+	bool port_clk_started[SNDRV_PCM_STREAM_LAST + 1];
+	int port_clk_driver; /* The cluster driving this cluster's port */
 
 	bool clocks_in_use[SNDRV_PCM_STREAM_LAST + 1];
 	struct device_link *pd_link;
@@ -158,7 +158,7 @@ struct mca_data {
 	struct reset_control *rstc;
 	struct device_link *pd_link;
 
-	/* Mutex for accessing port_driver of foreign clusters */
+	/* Mutex for accessing port_clk_driver of foreign clusters */
 	struct mutex port_mutex;
 
 	int nclusters;
@@ -317,7 +317,7 @@ static bool mca_fe_clocks_in_use(struct mca_cluster *cl)
 	for (i = 0; i < mca->nclusters; i++) {
 		be_cl = &mca->clusters[i];
 
-		if (be_cl->port_driver != cl->no)
+		if (be_cl->port_clk_driver != cl->no)
 			continue;
 
 		for_each_pcm_streams(stream) {
@@ -339,10 +339,10 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	struct mca_cluster *fe_cl;
 	int ret;
 
-	if (cl->port_driver < 0)
+	if (cl->port_clk_driver < 0)
 		return -EINVAL;
 
-	fe_cl = &mca->clusters[cl->port_driver];
+	fe_cl = &mca->clusters[cl->port_clk_driver];
 
 	/*
 	 * Typically the CODECs we are paired with will require clocks
@@ -689,12 +689,15 @@ static const struct snd_soc_dai_ops mca_fe_ops = {
 	.trigger = mca_fe_trigger,
 };
 
-static bool mca_be_started(struct mca_cluster *cl)
+/*
+ * Is there a FE attached which will be feeding this port's clocks?
+ */
+static bool mca_be_clk_started(struct mca_cluster *cl)
 {
 	int stream;
 
 	for_each_pcm_streams(stream)
-		if (cl->port_started[stream])
+		if (cl->port_clk_started[stream])
 			return true;
 	return false;
 }
@@ -725,29 +728,35 @@ static int mca_be_startup(struct snd_pcm_substream *substream,
 
 	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
-	if (mca_be_started(cl)) {
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
+			       cl->base + REG_PORT_DATA_SEL);
+		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA,
+			   PORT_ENABLES_TX_DATA);
+	}
+
+	if (mca_be_clk_started(cl)) {
 		/*
 		 * Port is already started in the other direction.
 		 * Make sure there isn't a conflict with another cluster
-		 * driving the port.
+		 * driving the port clocks.
 		 */
-		if (cl->port_driver != fe_cl->no)
+		if (cl->port_clk_driver != fe_cl->no)
 			return -EINVAL;
 
-		cl->port_started[substream->stream] = true;
+		cl->port_clk_started[substream->stream] = true;
 		return 0;
 	}
 
-	writel_relaxed(PORT_ENABLES_CLOCKS | PORT_ENABLES_TX_DATA,
-		       cl->base + REG_PORT_ENABLES);
 	writel_relaxed(FIELD_PREP(PORT_CLOCK_SEL, fe_cl->no + 1),
 		       cl->base + REG_PORT_CLOCK_SEL);
-	writel_relaxed(PORT_DATA_SEL_TXA(fe_cl->no),
-		       cl->base + REG_PORT_DATA_SEL);
+	mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_CLOCKS,
+		   PORT_ENABLES_CLOCKS);
+
 	mutex_lock(&mca->port_mutex);
-	cl->port_driver = fe_cl->no;
+	cl->port_clk_driver = fe_cl->no;
 	mutex_unlock(&mca->port_mutex);
-	cl->port_started[substream->stream] = true;
+	cl->port_clk_started[substream->stream] = true;
 
 	return 0;
 }
@@ -759,8 +768,8 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 	struct mca_data *mca = cl->host;
 
 	if (cl->clocks_in_use[substream->stream] &&
-		!WARN_ON(cl->port_driver < 0)) {
-		struct mca_cluster *fe_cl = &mca->clusters[cl->port_driver];
+		!WARN_ON(cl->port_clk_driver < 0)) {
+		struct mca_cluster *fe_cl = &mca->clusters[cl->port_clk_driver];
 
 		/*
 		 * Typically the CODECs we are paired with will require clocks
@@ -778,17 +787,21 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 			mca_fe_disable_clocks(fe_cl);
 	}
 
-	cl->port_started[substream->stream] = false;
+	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {
+		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_TX_DATA, 0);
+		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
+	}
 
-	if (!mca_be_started(cl)) {
+	cl->port_clk_started[substream->stream] = false;
+	if (!mca_be_clk_started(cl)) {
 		/*
 		 * Were we the last direction to shutdown?
-		 * Turn off the lights.
+		 * Turn off the lights (clocks).
 		 */
-		writel_relaxed(0, cl->base + REG_PORT_ENABLES);
-		writel_relaxed(0, cl->base + REG_PORT_DATA_SEL);
+		mca_modify(cl, REG_PORT_ENABLES, PORT_ENABLES_CLOCKS, 0);
+		writel_relaxed(0, cl->base + REG_PORT_CLOCK_SEL);
 		mutex_lock(&mca->port_mutex);
-		cl->port_driver = -1;
+		cl->port_clk_driver = -1;
 		mutex_unlock(&mca->port_mutex);
 	}
 }
@@ -1094,7 +1107,7 @@ static int apple_mca_probe(struct platform_device *pdev)
 		cl->host = mca;
 		cl->no = i;
 		cl->base = base + CLUSTER_STRIDE * i;
-		cl->port_driver = -1;
+		cl->port_clk_driver = -1;
 		cl->clk_parent = of_clk_get(pdev->dev.of_node, i);
 		if (IS_ERR(cl->clk_parent)) {
 			dev_err(&pdev->dev, "unable to obtain clock %d: %ld\n",

-- 
2.49.0

