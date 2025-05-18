Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42600217F26;
	Sun, 18 May 2025 10:51:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747565484; cv=none; b=H3EDd7ZViknnKiFCZIN53mcgVBqn2aX4aS+1ZPX/ukDF6nrLRfcy28bPSpa2hrHPMDD6ZPEA7v5Jij90Zg7/9W0mT53KSmuZ0r1jluSPvhMh4Ece/RNCTi4jlJuGdoiUA+JcYVt2vjZeGwqvoCPlnRPxgloPknqQ4vm2SyKpSoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747565484; c=relaxed/simple;
	bh=gbENVBK1BFW0CzyBus2+j7Ha8BltCeIsW0M2RXAVOMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eXjuOCF/7Bc5wztZ4+U/nKTAAHwD3Mq1lL2fUrwjUUsH70pCeyrPsQMmTls5r2/VcLI2fMIvyWAoGmRoQaZnkCqPlR+TlcfGzMcnRgPl1rPyhWC1v6xy2yWDyBqyzmivTSiDNhK2lRJa+r7oYw4hI8OqLaQeJzWfgqB9mQ4zrXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z35JfvYo; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z35JfvYo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-b200047a6a5so4049233a12.0;
        Sun, 18 May 2025 03:51:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747565480; x=1748170280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=my6qC1AyKNURS4m2hwq9ZP5siboUqjBS4bBWhJCQoJA=;
        b=Z35JfvYor9GypHPfb4zoJCos+s+G8GnaB9ZkQXqLRDUvL7pyAiFooYTIabYashexHp
         ZXzBm/P8HL9xJAJtPqeazpnF6xzZZ0WH8oBs+QobuJNufbrSBcd4HkH+1yLq6xx2eDpj
         RxLk1ik/O7+Jn7El3ipHrbU7pMENjlvXJFaaWyYyeZeclEonTE9TpUCD4TSzKo0draRZ
         naf6fceOp0nihuxL4El/Wqc9RLchGeUPjxChQRsx7pMwz9Q59TUU13e0eRXyx0LHfser
         MJEzGoLuUPTKt23c28lRofnunxlfNuIMJm9qNOZp/hr0N2Y0LEJXr6V8ffMshgEOTp31
         73gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747565480; x=1748170280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=my6qC1AyKNURS4m2hwq9ZP5siboUqjBS4bBWhJCQoJA=;
        b=o/83JLHbckXq5fSfurE24kGMcfCbVsfyM+gcF7DkfB+7LTtlV/yWNoP+OTXMpNN3qf
         PVG5lF20zoeAVz4bGQwMN8JhLKNPPtMtcvggYa2UXoPxkB58lEJPo56jVHwv98C6nVZH
         Uoh7QPPgPYlyd6LPkpWqyn6dY2kjC/ULRn9hm32MRfNDMK00u3ZbeMX8gKtNiwon08ca
         9kex3UvnWMHM5KN8JsOuQ8iigMLgaact4KJ/On4ZJRLC19OstTMtm87ujvXOf1W3iEJy
         pc2yGIMGETxA3jntmeSUUVTS/4Q+Fb+4GiQOp7HBqEQqtXCeN6C3fgvn4QMYt+9XeOAV
         kt4A==
X-Forwarded-Encrypted: i=1; AJvYcCVbtiyG7k2qCpKtEfvm0kVwh4GK40EldC6bfOAS3Oqzlc1jspdyNtrlLNB5/c7nXlaTihCgaW1LmX0HNTM=@vger.kernel.org, AJvYcCXxOz31F6CEZTMjo7rhHdnDqJCq0RBfx9a0zccBA92b0O59ggVHjfC4+cezXdQTtEhdvzE/tOkB/MdWt3U=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywcn2jImnOjdjBoBpnrXp2i5inEDqGuUzEHwP4p/pHBhgL4SPSN
	JAIwJx0XOl61c6MEHFbAulNlhIkRvR8pybYJA1m+WeSojj+GfapgRR0nmt5IPA==
X-Gm-Gg: ASbGncsRawb6MLMvPtD0/fw1+z+x1lUZopWWUNGGdv2n6xhNOr+bVQdaKsndQ6Pnfyh
	0xKDl1YueOONdRpDxra2bT1wlJakSOz62WWTTvFzxSA2J9eej2fYFyBLh0YlXiAeQKB4x+AfRiA
	VAFlMhgXM6RB4iwf3ibgJmr2lonea02IeB4sEW52nS5fh3unWY7U4Tva3ejY0SzLC7pgrdr2UoY
	tzfbIktXzd0rINR1kBZ+u+smfIgR/LeW/mlAJBv2ReqQ1rRufn/kuVwi1UQFWXtvln4utuHBqjI
	RaaHw1i7+wKh2spxLtDA4pXHTW4o7TIXvWdmL8q0gdQwrl9E5V1unmU3i78iWNPTvFGY67r9Gf0
	O44f06CArvcfb//GEJrbqLnr23ItpHaZYjXxqMYLOAhnYFg==
X-Google-Smtp-Source: AGHT+IHH7Q0q1k2r8EQN7M/10MYOXWvJ9RooDtnb4q22ZpNK1DQFpTMs3CFKGH/+4OBP/2z+0MphJg==
X-Received: by 2002:a17:903:2acc:b0:21f:6ce8:29df with SMTP id d9443c01a7336-231b3938027mr180930095ad.3.1747565480287;
        Sun, 18 May 2025 03:51:20 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4edd259sm41956115ad.256.2025.05.18.03.51.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 03:51:20 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sun, 18 May 2025 20:50:48 +1000
Subject: [PATCH 3/9] ASoC: apple: mca: Move clock shutdown to backend
 shutdown
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-mca-fixes-v1-3-ee1015a695f6@gmail.com>
References: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
In-Reply-To: <20250518-mca-fixes-v1-0-ee1015a695f6@gmail.com>
To: =?utf-8?q?Martin_Povi=C5=A1er?= <povik+lin@cutebit.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: asahi@lists.linux.dev, linux-sound@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Hector Martin <marcan@marcan.st>, 
 James Calligeros <jcalligeros99@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2767;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=9Jn21G78Usgsal/23fmc4fU3vpff2g8Y2ySE4kB/1w8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBmau6e/Dt8avaGyyE724eafTifz+duklaaXGmslpdlt6
 bvGOHFjRykLgxgXg6yYIsuGJiGP2UZsN/tFKvfCzGFlAhnCwMUpABPhm8DwT2vbrOkKl5/LNEk+
 ++WQyit/6YinpcBbT84+h6un2m4s/srIcCMlR1Cdi89vlvSPW+o8vUrRe9NT9rz8vbhvNUeFdWM
 CFwA=
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Hector Martin <marcan@marcan.st>

Codecs are set to mute after hw_free, so yanking the clock out from
under them in hw_free leads to breakage. Move the clock shutdown to the
shutdown op, which is late enough.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 sound/soc/apple/mca.c | 48 +++++++++++--------------
 1 file changed, 20 insertions(+), 28 deletions(-)

diff --git a/sound/soc/apple/mca.c b/sound/soc/apple/mca.c
index 7113da4bdea7b687c0d44d2bbf3a511b8299056f..69f2e852d4aeb2d53eea5d7fee400b2337a09065 100644
--- a/sound/soc/apple/mca.c
+++ b/sound/soc/apple/mca.c
@@ -361,33 +361,6 @@ static int mca_be_prepare(struct snd_pcm_substream *substream,
 	return 0;
 }
 
-static int mca_be_hw_free(struct snd_pcm_substream *substream,
-			  struct snd_soc_dai *dai)
-{
-	struct mca_cluster *cl = mca_dai_to_cluster(dai);
-	struct mca_data *mca = cl->host;
-	struct mca_cluster *fe_cl;
-
-	if (cl->port_driver < 0)
-		return -EINVAL;
-
-	/*
-	 * We are operating on a foreign cluster here, but since we
-	 * belong to the same PCM, accesses should have been
-	 * synchronized at ASoC level.
-	 */
-	fe_cl = &mca->clusters[cl->port_driver];
-	if (!mca_fe_clocks_in_use(fe_cl))
-		return 0; /* Nothing to do */
-
-	cl->clocks_in_use[substream->stream] = false;
-
-	if (!mca_fe_clocks_in_use(fe_cl))
-		mca_fe_disable_clocks(fe_cl);
-
-	return 0;
-}
-
 static unsigned int mca_crop_mask(unsigned int mask, int nchans)
 {
 	while (hweight32(mask) > nchans)
@@ -785,6 +758,26 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 	struct mca_cluster *cl = mca_dai_to_cluster(dai);
 	struct mca_data *mca = cl->host;
 
+	if (cl->clocks_in_use[substream->stream] &&
+		!WARN_ON(cl->port_driver < 0)) {
+		struct mca_cluster *fe_cl = &mca->clusters[cl->port_driver];
+
+		/*
+		 * Typically the CODECs we are paired with will require clocks
+		 * to be present at time of mute with the 'mute_stream' op.
+		 * We need to disable the clocks here at the earliest (hw_free
+		 * would be too early).
+		 *
+		 * We are operating on a foreign cluster here, but since we
+		 * belong to the same PCM, accesses should have been
+		 * synchronized at ASoC level.
+		 */
+		cl->clocks_in_use[substream->stream] = false;
+
+		if (!mca_fe_clocks_in_use(fe_cl))
+			mca_fe_disable_clocks(fe_cl);
+	}
+
 	cl->port_started[substream->stream] = false;
 
 	if (!mca_be_started(cl)) {
@@ -802,7 +795,6 @@ static void mca_be_shutdown(struct snd_pcm_substream *substream,
 
 static const struct snd_soc_dai_ops mca_be_ops = {
 	.prepare = mca_be_prepare,
-	.hw_free = mca_be_hw_free,
 	.startup = mca_be_startup,
 	.shutdown = mca_be_shutdown,
 };

-- 
2.49.0

