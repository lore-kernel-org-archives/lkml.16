Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCAD028DF08
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713951; cv=none; b=WTfaMOlrwFRhxGEG23VYcpFlFarm2lsKJ7SR/c3UQ6swiAp9XbuUoV92pAe43SFSc07RwZ7cqLWM19lHQxid4fxvww4SRAUt0KP5HxenZkNB1X2iJfbkQ3uAwZjv6IUHI9TzC6Pt1TjPqwfJ8gqfpGq0PR0S3RagxhIVDjz4Rag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713951; c=relaxed/simple;
	bh=MkCBu/XB5S4UUYAmw3Gyngrhm/WGqXfyy/Hj2WV/rQE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QZ0QE+ogYvST2oAZomfOwb2m5Ptrk9LIh+PLznUpeBfcZw6Wdouvu6gq3GPaWTkPN29Q3i4CV8qxlZDa+gYWdIn4EZhrVuFfxNeo6P7P09b/KKT7Xqa7fQ6Bdfm2tvhzq3DxFz97PhGeJFT9L2QcLFqO41zIaFVtupMCZcjzCXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=InTuCRu+; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="InTuCRu+"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43cf257158fso38161625e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744713948; x=1745318748; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=InTuCRu+3SX/lQAxKFv0mXZDuqoOH2r1OVTXc7UJn/DTOPEuFlDT28J9+hpgHOhYDv
         qcbI1LW7C6rtPWPqQGtaKMn2vlRSyLlmsIZFjUDI3uw/v6G6J5IQ3fCYyFyUfVAM6wOa
         QPYw4bCyMKkUySYLRISRq/9vPP1mqzYmvTR/k6kS4Uyt7LRuBuh7HxX4LIjbrolcAJCI
         VkHJKoRlxR49QYtNa/c38Zyk8szu7030Q1UgMmv0Mwn2n0axiXoV2DJo1KCN/ytQ/sO9
         KMYChaIObe2IArzW8/Cm2hYlZPqzLMeHYR/2suDXVzPPrq+wy/4EZPH2BFldhkbTJJp6
         vl5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713948; x=1745318748;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=xfLErGzwKv4hpi/TJi9E3D/+txmgLZVczCQXE26h5hU=;
        b=HHBS/eMZYKL7ve4WcWA1WzXYLcwNKmzMKCF3CaGSponS7+AFAl/N3gAvOBUwKVOTyq
         TV2QrZHZlQm/fq0Bko2rtT9LCAgU8vZ5CcJrSpGNI0PQvCQydSFR130WV/JNLvIGPW+V
         nnzxlhHBEPgLoiS45mkYKsos6Z97kT15gh+LVzEU4jSShs2udmEeK8013GyL7hy6NtFw
         Hwq9zAXnkmWAjc51+WqOeOIjgrXRnLBNkN8h3cG+shyi+1W/5sYcZLbRzWNZi3/Ifu+9
         MOJwWSuAj6RXtvU3setnC+29HCD5SLY/Sw13wIzCK6+g8GsYJ8Ym+/7bu/GEqgCZdrzt
         SzFQ==
X-Forwarded-Encrypted: i=1; AJvYcCVySGGGp9Kp2xoAJ97f2L0sLiLzPuRkuN8Vvmkwz9RAZ1zFUZGO3kCWe+1f9263Oa76so77zexxk1Uigrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkkS62YFSLR+v/Rb2h3LVLE/65umagwEe5dty8dzUTVwlIGv/k
	72QDjFZaFASuIpByVdymQBPTXgJ/e/xo1Uj9pRS6OjDpBm98JoPNYxMOVQY0N7Zou9PAFx0VSsk
	c
X-Gm-Gg: ASbGncvT8CnWNeBo8MZst77qSvNSBXkvewicjPGyxpac9qQdnznLX49MtM0AQs95jsV
	iI7dNbU6m+JdUxDQoviRA0t5NC07/p9bYddbHZa5I8z+DokacBKdlB1o8dsB1w1NzVjg0Q7gsnj
	tOwx00UMvwBw7axTdNiGtSpt+ykzIkXY2Q6Wejryby6BElalQxWBbcG5KgLCxbtWmg2zTN+2Zbv
	zb8PHJMh07YCxTNaTmjxsuXoOqWUEjseQ1za222H4cPmcShBQ3xyq+VyN/PnyjtWJUQ04LjYy6w
	s+wOTCXgzPJHUxzfVLzyl7W921QSv3A2+Q4L4lrz6caCAQ==
X-Google-Smtp-Source: AGHT+IGCbFvyMPpLY+0TGJvec6wuV9t2NMPKNxUjFnVVx7rsRSV6GaToQxyKYgw2SV0wouSpipDAuw==
X-Received: by 2002:a05:6000:210b:b0:39e:cbc7:ad2c with SMTP id ffacd0b85a97d-39ecbc8a256mr7695306f8f.25.1744713948166;
        Tue, 15 Apr 2025 03:45:48 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39eaf447777sm13613520f8f.100.2025.04.15.03.45.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Apr 2025 03:45:47 -0700 (PDT)
Date: Tue, 15 Apr 2025 13:45:44 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Wesley Cheng <quic_wcheng@quicinc.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] ASoC: qcom: qdsp6: Set error code in q6usb_hw_params()
Message-ID: <Z_442PWaMVoZcbbU@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

Propagate the error code if q6afe_port_get_from_id() fails.  Don't
return success.

Fixes: 72b0b8b29980 ("ASoC: qcom: qdsp6: Add USB backend ASoC driver for Q6")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 sound/soc/qcom/qdsp6/q6usb.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/sound/soc/qcom/qdsp6/q6usb.c b/sound/soc/qcom/qdsp6/q6usb.c
index 274c251e84dd..adba0446f301 100644
--- a/sound/soc/qcom/qdsp6/q6usb.c
+++ b/sound/soc/qcom/qdsp6/q6usb.c
@@ -74,8 +74,10 @@ static int q6usb_hw_params(struct snd_pcm_substream *substream,
 		goto out;
 
 	q6usb_afe = q6afe_port_get_from_id(cpu_dai->dev, USB_RX);
-	if (IS_ERR(q6usb_afe))
+	if (IS_ERR(q6usb_afe)) {
+		ret = PTR_ERR(q6usb_afe);
 		goto out;
+	}
 
 	/* Notify audio DSP about the devices being offloaded */
 	ret = afe_port_send_usb_dev_param(q6usb_afe, sdev->card_idx,
-- 
2.47.2

