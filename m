Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF92521A421;
	Sun, 18 May 2025 10:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565490; cv=none; b=pICD3lI/Rl3hJdMmeZSckgjq9KOtGbXmRR9WNy15I25P+6lBgdJYJzUAe45RHsqwXm/QlN7TSmM+1+642U78ihoP1lukzEgVjpFs5fjbFK6JeapabRP9jXAtYEX0fAJPWI7Tcfl1g1IU4S3ChqlmmTBvVvtjf8cPm3wGMGVL7ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565490; c=relaxed/simple;
	bh=F82kQo5jF8NNEa6QNxcYjn5L6vQFnbATljVK6E6zfSs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YD6Ww6sJl85GEUQku2vunhNKeX/yDkwmWyZ/0eQyuOm1tZ6rALD0CoUPbR5yIkMnR6mYw5q5Kao5iWcMs7ECsa3C98dJy7YJhYV6QmSe03AIqTLIRUx8JmZHGTVdl1cAyxQX9eKVu6bhESyfd/VZ9SHeyBchPJPeagvfKYTxvaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=frxJcX7R; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frxJcX7R"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-22e033a3a07so34592465ad.0;
        Sun, 18 May 2025 03:51:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565488; x=1748170288; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g+n3AQ8sePKLocQfLg1pUdFDlZnS0WtD0qj/lH0MVs4=;
        b=frxJcX7RcvO2b9f9FreyowPOf+ctsxbfgep2EM+gsSisArgkhqPNLOIKYwHioQHuBj
         Gr76ep+Q3FnP00/rkNQ/RGD+SPBWFDueOzurMH+VUS8QyE9kABb2f3egQVCompse5TKO
         bJ85KvG6sZT7turxgRAYmNaaCt/gBJJr0BQcvgj9CLrkDVPu46aV8W2e/5vEr5ldEd6p
         snu3C9Kb9M1GvHK3bUhBIOFj1J/+8uV808n4sm8+xhYhWS2h9qFYDyYXmhS42KSd2HDg
         k2oBr0X4qKyA42+C9IAcrMt8u9bM+Tq+3TZt+BAKLrtV9lFvZKi2GwIWNMBrRct/FlVR
         LPVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565488; x=1748170288;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g+n3AQ8sePKLocQfLg1pUdFDlZnS0WtD0qj/lH0MVs4=;
        b=htpYVjZTdjoscRMCIh5XB2LG6zmoKg1WzIykVsqxTlvaAwYrjN/gNpJ9CzGZrAn7aY
         lvqXx4Q7fD51Os5mMmrHZvQfy5o5bEdQMVfO2W1FMKP43NsUbKxjbz8Z8hO2r5DbT19g
         U97PX1OmTyZ71CrtYbj/QDAhLKNG9IKTHzmXf4sd7AXSN1AJ2JF4c+HbU2lVCZ+JtEXE
         xp1Zo+U9/WvePfwuskxW/Jl4/APXnMkHcCYMRlY+llcKySXHcCFqOuJIOJ+Ods5NWrSz
         tuwZm9FKsg8UxIIFRIjETRDMaZj5XoeMVIjkDVL8zHC0KxqwSHbL0l48WnmYT6V47MD0
         B0oQ==
X-Forwarded-Encrypted: i=1; AJvYcCV21KrMpnKBR/rT80h7YB1ZlrldDfOtLMYFxwqJuKMPYiMj8U09ow5c0lhbdgm3UOy6pzxYAlBAMS9dmfM=@vger.kernel.org, AJvYcCWhW5SHzG+yIBHeA4fYWN7jsG/90nzPA8JJ8yXIZTZKp36r2xkMCSug8g1gS5TdHCKdP78QxXRwabwLveA=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywg8lWMCBSdyHT3UJEEJvH53vBnWVoSk7G8fKRl/5Wzl5bHvWRD
	Jg5MmQpwahCtdjBPiuCLMg+qq3ufxSBfR9jSC//JBA8smS9wVJC9UUF8PvvQCQ==
X-Gm-Gg: ASbGncvnbxuSn8LIqQdZu1n+BcMkXwpPA1a5vor4ALbEQNHRn2N4xbs0nKciCmv222a
	Q9tBLvrG6HId9enCmmGdmkZHGjSsycxVhBVU5F2dG3jZNG3B41z1DhKhW+COY68ztw99ywqRWJA
	0lRD5G1aVsogC24L9KRWU1q63YxqEaWEZaY5tBvtKgtkn03R73aepy6nmOEvB7MXu+D6k7b098R
	n79iGyLYvL6n2wfUqAKSidXFvMI0p6iWLDDUC/FPmoMIl7h7HVEOex4VJkMuHykCJr9zCTBsKFN
	WOF/pXNROeUbFaZ8IfM67A96hYnIph6qSKdRTPOqgjSmVPjoKlhdD+QkaWHDEGnckxsqkmIZpkT
	KRg9gPTuAg77TcmHvUxKgvZSWxo64ZskgtGXH2teLCrJKdA==
X-Google-Smtp-Source: AGHT+IHz1CUXiqVS3egmECCEkJqx3r31A55/yZ+UXHJFRte0jXT7/LwmZSh1hlx8ZcidOHq3veEF7A==
X-Received: by 2002:a17:903:94f:b0:220:ea90:191e with SMTP id d9443c01a7336-231d43d9ca1mr139134145ad.4.1747565487726;
        Sun, 18 May 2025 03:51:27 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:27 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:50 +1000
Subject: [PATCH 5/9] ASoC: apple: mca: Factor out mca_be_get_fe
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250518-mca-fixes-v1-5-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2041;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=H3hg2zGOBIXuTqTCzYB8ehtSLQVdcKQ7HsDaPyG6XSw=;
 b=kA0DAAoW1DYy0VH3eWAByyZiAGgpu5ihWW9iOjqZV8eX/aFNeavdo2h8sCgH0vLg0aycMfjZM
 4h1BAAWCgAdFiEEsIISSJsyBtmPFHm91DYy0VH3eWAFAmgpu5gACgkQ1DYy0VH3eWDZfQEAnb5c
 k0M8EQp9jlrrt+p4DEiwvYbFn8rvjKC7uxU4UPQBALLzPInhnXhWlgdLBFrcSDZYTO4276mjxYB
 ElNVvBzwC
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Martin Povišer <povik+lin@cutebit.org>

This is a function that we also want to use from within mca_be_shutdown,
so factor it out.

Signed-off-by: Martin Povišer <povik+lin@cutebit.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 31 ++++++++++++++-----------
 1 file changed, 18 insertions(+), 13 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 39713c378ba10910b0a3ac3d804844b25dfa2c94..7c3e1eae8b963ff593fdcf54e4a1f2e5f64a63c1 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -702,30 +702,35 @@ static bool mca_be_clk_started(struct mca_cluster *cl)
 	return false;
 }
 
-static int mca_be_startup(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
+static struct snd_soc_pcm_runtime *mca_be_get_fe(struct snd_soc_pcm_runtime *be,
+						 int stream)
 {
-	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
-	struct snd_soc_pcm_runtime *fe;
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_cluster *fe_cl;
-	struct mca_data *mca = cl->host;
+	struct snd_soc_pcm_runtime *fe = NULL;
 	struct snd_soc_dpcm *dpcm;
 
-	fe = NULL;
-
-	for_each_dpcm_fe(be, substream->stream, dpcm) {
+	for_each_dpcm_fe(be, stream, dpcm) {
 		if (fe && dpcm->fe != fe) {
-			dev_err(mca->dev, "many FE per one BE unsupported\n");
-			return -EINVAL;
+			dev_err(be->dev, "many FE per one BE unsupported\n");
+			return NULL;
 		}
 
 		fe = dpcm->fe;
 	}
 
+	return fe;
+}
+
+static int mca_be_startup(struct snd_pcm_substream *substream,
+			  struct snd_soc_dai *dai)
+{
+	struct snd_soc_pcm_runtime *be = snd_soc_substream_to_rtd(substream);
+	struct snd_soc_pcm_runtime *fe = mca_be_get_fe(be, substream->stream);
+	struct mca_cluster *cl = mca_dai_to_cluster(dai);
+	struct mca_cluster *fe_cl;
+	struct mca_data *mca = cl->host;
+
 	if (!fe)
 		return -EINVAL;
-
 	fe_cl = mca_dai_to_cluster(snd_soc_rtd_to_cpu(fe, 0));
 
 	if (substream->stream == SNDRV_PCM_STREAM_PLAYBACK) {

-- 
2.49.0

