Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6B20E32F
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 11:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744196427; cv=none; b=d5sZliXalnCBBqVTuYyCzLuhda9i2Rpu3dWNnyQqQ2+y8wzItMmOZVVzLaxHAUN6wSoLu0pbF3TWwHIaQJ6HM2jhC2XBU8MLDsG9ZPLQhimdseQHIdNN0EfPDUUpgE6TDFhSL0gwLPBlz8ZVN2qR77lRToN3CiZ0VPPcx8w8WUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744196427; c=relaxed/simple;
	bh=TXbbF1zjZi8YpyEwLeqY6OJ4Ffj6+deknefbHUzUNHQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bQiq2PDy0zKaG3uZre4YqIhPqMslYy7jvJmOh6GoUMYOb2kpsuRfWC7R7w4Kh5M0rmGS1sGVPtbM2zdW5asfL0PBV7B3JI9mnrkHMYLkUWOK8g1Kfws6atRL8IlJDvtGqHfe1X4osL8Uy7a0XH/fWRTWdyau6DN+EvdO718AGig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=PwlvHVZo; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="PwlvHVZo"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39149bccb69so6210582f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 04:00:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744196424; x=1744801224; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kbiuDHdVeIa3R6A3S/AmU2DqX1Wn9eEzl5pawdchrAM=;
        b=PwlvHVZoEUn0//wun9PYY3aH2bH+feMOEPMOZJIwh2Uz8QlArr8qKLhKwMnnJA1wt7
         Gr/VNcDzkDD12AumaK3gVIPAaAFhLTefHTL/aMivkWCqOCd25EXACSMJoj9SwELsHG5s
         4xdzTTW/B63aC8otcEDZ/y85E8XpyEMVd9orIMELijo0d90aYnQBxJNNS6gMSZsbfo+v
         wWih4mk8r/5FaFwEugAGeRQ0Yp7fpEDoedsGrbOn3c7IMn18plBzlyNSEOcobI++8W3f
         41oovLQ/0TjPYYXoVzMf4KnysHssba6mmTDK4ucy/BbMbG9MO8sqdhIiLQ0V/OLzUdHV
         ddvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744196424; x=1744801224;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kbiuDHdVeIa3R6A3S/AmU2DqX1Wn9eEzl5pawdchrAM=;
        b=uKnWRx1dHgw45LYPn3/Wpum+jQKsVe8pBgomB4oKwJPiqJlhP4KPHst/94NB7qYuxG
         1x6zeZFM5bnk19M1vQNIDe4VLwfZgpHNktC/R730XWtCpWnkdpsFl7QPKxAgFfjSViVZ
         ytuZ7+8pxhMssKBC1N+w/7gj0AqiVyytn18L/3tx3e9DKv28bSKOSjVpZlnti8iYiNJZ
         JPP6sAVsn0pG8JMIsjXCN9lFAyeESFncMMhjh55xMKr5gLSxVvLWRf/oVXMpweCRcuq9
         vrwIdC+XDeoVZXM+rScHyEsmOww4J/yxA105fGQfLAwLFlbQSuo/lqlISXo8En5/l8H8
         6SXw==
X-Forwarded-Encrypted: i=1; AJvYcCVYpFErMvXt31I50It9XrxPku3BPVDuKjx78NV5soSg3v5k98pUxLH2xyqVDk0sUL7VWi4pkbUMdtc7MlE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAoo44IzwZx21IXyZNBCpWv1EDxjAg43XZnlRiefHg/KQUMV1n
	zv1EBJiWMFAwJeQFcKHcSbihJtrvt6sR7Z1emxQoH9jtxwSe3fiyjK5/9HypCIA=
X-Gm-Gg: ASbGncsq8eqjcHC4pKBigmicrvyKaJ/x3T3txw/ysKQaa205xeqH+GHCWArlPDvom7A
	lky8BgRHlSHLSCW9EDz9KpYJ5HEyDf7IIHqGTedZA4kFBbxNYIU2fRVVvEWP8CS34g4HH7O1rJx
	+VZCJsaqb+K29Eu4yhl2shDvxQATlELZVyvedVb+DTZ0HEZ5vpxy/yfB7nwhALTiTIzRIAUsAjw
	RDV6efxlkjQqGu8eUvAxT4v4fVL53hfZCaT4ihQxDmBqxR4ksWX7umyMzLOkFvixQEMQR8M1oaj
	G1TTq30dG8jneahGDcSSDJJzvHuK4AODPze+E8t44B3KmsZoNQcvOCQb
X-Google-Smtp-Source: AGHT+IEMjvJRXwtECocC18o7I7YJL0m4T21SAiMp4ugNPg39UK5Hf4bTJoM5nx1QtVGbXPOR2J/7dw==
X-Received: by 2002:a5d:5c84:0:b0:39a:c80b:8288 with SMTP id ffacd0b85a97d-39d87ab92bamr2196525f8f.33.1744196424413;
        Wed, 09 Apr 2025 04:00:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893611d0sm1278591f8f.6.2025.04.09.04.00.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Apr 2025 04:00:24 -0700 (PDT)
Date: Wed, 9 Apr 2025 14:00:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Binbin Zhou <zhoubinbin@loongson.cn>
Cc: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Juxin Gao <gaojuxin@loongson.cn>, linux-pwm@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH next] pwm: loongson: Fix an error code in probe()
Message-ID: <6965a480-745c-426f-b17b-e96af532578f@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

There is a copy and paste bug so we accidentally returned
PTR_ERR(ddata->clk) instead of "ret".

Fixes: 322fc380cea1 ("pwm: Add Loongson PWM controller support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/pwm/pwm-loongson.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/pwm-loongson.c b/drivers/pwm/pwm-loongson.c
index 412c67739ef9..e31afb11ddd7 100644
--- a/drivers/pwm/pwm-loongson.c
+++ b/drivers/pwm/pwm-loongson.c
@@ -211,7 +211,7 @@ static int pwm_loongson_probe(struct platform_device *pdev)
 	if (ddata->clk) {
 		ret = devm_clk_rate_exclusive_get(dev, ddata->clk);
 		if (ret)
-			return dev_err_probe(dev, PTR_ERR(ddata->clk),
+			return dev_err_probe(dev, ret,
 					     "Failed to get exclusive rate\n");
 
 		ddata->clk_rate = clk_get_rate(ddata->clk);
-- 
2.47.2

