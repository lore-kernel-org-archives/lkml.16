Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97E78218EA2
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 08:27:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746001658; cv=none; b=DhgHpxPd9dRUrD7YK8o9bxFwJuiMAG5yeNjVfEaKIqoqJs0wBud8TFrlwkq7Sc+0CsJfGPpES/+394MpsLdiGfYG/AVWM8KQ6lPdwUQpx96s2+khzuoVCWZEf60VwaILFeefOH7KEQ/e5R6XmMQ8XT2pxZQL1emfWocrOGVKmqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746001658; c=relaxed/simple;
	bh=DxHxKhJsfM5IQo4p/BKw2Qv5mxONn1+sIjGNnBfbnCc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VYMX1U8eRUAnbt9qxbxPt0AhS06PtQjh8fnUzFjP9X6zAQbwvPQXCjs7Q4npe8XZEkX71GvpTMVbMvNfprYG+rZakwZS+k5MfAXDly/39rTeCqW+hQ1ZJGoRt6VU868VpnHyXXKcBEfmd1vpPI4Po6Dlp64LEQWq1mvRAJOmx10=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=mLXTCk1R; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="mLXTCk1R"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43d07ca6a80so26592085e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 01:27:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746001654; x=1746606454; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Ca2Hq/Lqblr8quUvSQPFNLA2CAIvKIyN9VULJch+1To=;
        b=mLXTCk1R8CZkBSaln/P3982QK+0Aoy+HdQnfMCFydvQ8Ap05PtmX3Q20gXmdtfGhf6
         uygm75QhLs6uFXlk9beQpNjpyYeiiho3rT1IXC3cH31O5NBpLRPZHj/nSHCtzym7prDn
         QvyXQtLbTqb0GwJP/1SYkYFPrPng9zHaW1WdZZWNCDa550QUaVq3UiLdY6ubWWsCnqlj
         xhoQK+GxhEMjqfMdaqzj+iAWS11G0GR25Wrqo3s5qveb9I936IbxKXwIy55grWTZsOuP
         Nap5pDTJyOO4FA2C4g950FCmiCsiJft3F7VeMWEFQP/aI58E6cJR0uRxqT6GoQnTCnQz
         81Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746001654; x=1746606454;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ca2Hq/Lqblr8quUvSQPFNLA2CAIvKIyN9VULJch+1To=;
        b=oAaqYU31+YHEYVdgxpn+nh3k9slgFCn4WSpdAiDXkRuBGErBhRelC35mkzMkroiH0k
         k4dStQIkTYNtL8q2SldluCVNk+9heTj2ER2FOTQjHZj+aQhzgzJjMAZH4eaaAmk+8qwW
         NXD2YFZclNetuXx20Mc3R+bUEGXpxm03O6js95jYyuL+tzkkQnRlJ70pInAr3x3UMAA0
         WDDLjotUSoCoS75FFqiZNsRO3A96RBjnEyRRmnL5NrJdqJszrLOIp3q6RulxEw9w+F3T
         r6kAZaskbJimVmbL5ttmyrokE7fWyD9/MuUa9OvSFKXwALWPuYaOA1OCHFcOdX8NOQQh
         0PPA==
X-Forwarded-Encrypted: i=1; AJvYcCUBeHlztNzw+NLgvKEG37AEZtrRFQYxP6M1zmKcYLWisJjz9EwuD2Q8zzjxQYk9OVg1u84Lip7g2Inp0Sw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwwE2JQ4yN2gbUa7j+NGRcdVsfR9epNNDDhy+k5EEh+mrJ9/kC3
	Kv6KWun/ujNyRWJN0S17VNie6Ep2muxcXN5fF7FTS3WXA9GxJWjgQ4saYy0opD0=
X-Gm-Gg: ASbGncuRuChaYSONfIf/cIUXEPx9nSUGay9gEeTYSkdlmmduiZcPTZz7QSqHPNvIwf8
	tzG3jKboB5LEEyha9jL7alKKXrMD6w145aDeUPVBO7ZuNG4PTSoqZGvjkW/o9mxMn4DOq8nbyg4
	qIJvsE7WnidA5XQmvx6fZxFeSvKacjiQlVopK1Kz31qIc+aFaOVJYV8l4qEkoYevb9S0cyf5vYR
	MtnmGFeJ6CLYJuotHFVriZaGdBk6T4/aYEAW+HRyW28ats9EBFMU67DwdGc7Vsi+Lh96+Fq8SlW
	1zQT/SjkCXO6ydPmyyL8YYNpVaqp+pWLRnQb+uGN6/uKHA==
X-Google-Smtp-Source: AGHT+IGwdDRTjPXieuwqML9OeOIGuwumXqnwuBaxSQXQnI/omezt1QxDAaH8vN3P12fRW7cmzI1H6w==
X-Received: by 2002:a05:600c:1d8d:b0:440:54ef:dfdc with SMTP id 5b1f17b1804b1-441b2639c36mr13608775e9.8.1746001653963;
        Wed, 30 Apr 2025 01:27:33 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-441b2aecc89sm16215325e9.9.2025.04.30.01.27.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 01:27:33 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:27:30 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Tarang Raval <tarang.raval@siliconsignals.io>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Hans Verkuil <hverkuil@xs4all.nl>,
	Shravan Chippa <Shravan.Chippa@microchip.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/3] media: i2c: imx334: uninitialized variable in
 imx334_update_exp_gain()
Message-ID: <ee811e7c6eabc390241e0227f7a26d1eaa7818a1.1746001540.git.dan.carpenter@linaro.org>
References: <cover.1746001540.git.dan.carpenter@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1746001540.git.dan.carpenter@linaro.org>

The "ret" variable is not initialized on the success path.  Set it to
zero.

Fixes: 7b19b0fc8ac8 ("media: i2c: imx334: Convert to CCI register access helpers")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/media/i2c/imx334.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/media/i2c/imx334.c b/drivers/media/i2c/imx334.c
index fc875072f859..846b9928d4e8 100644
--- a/drivers/media/i2c/imx334.c
+++ b/drivers/media/i2c/imx334.c
@@ -536,7 +536,8 @@ static int imx334_update_controls(struct imx334 *imx334,
 static int imx334_update_exp_gain(struct imx334 *imx334, u32 exposure, u32 gain)
 {
 	u32 lpfr, shutter;
-	int ret, ret_hold;
+	int ret_hold;
+	int ret = 0;
 
 	lpfr = imx334->vblank + imx334->cur_mode->height;
 	shutter = lpfr - exposure;
-- 
2.47.2

