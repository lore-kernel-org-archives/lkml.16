Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 131521F4604
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252838; cv=none; b=O8OSFSDAxKfH5u0iIoNkkNQvEmkqtfYSTc4Mgf7JpYKKjeCwMZZyxwJ5COhhLe4FOUuAA6yUJ8jrKhBvWgKc7SRoBJOM2nhxxEMe+4VyNdvX4pZ1VIy+uxNLkTv4m9ZBbrW55bL1HjlHrQDKpCjbVzpGujnKbGa+zn6CuBMbmlo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252838; c=relaxed/simple;
	bh=JFqzsTfm9DdoRKLGO7u+iVRbtQ2IB4LCND0J4CbvlC8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=i1wjUKq6sxQ9C4Yvs3RmZfs+ZEfsoCTu2q0DNQlBeU/eC3DIsyi0SWTjsplbYTaKFVk8dlO7hj95260g7d1j87p6kHOm2SvPzPaqtGKFHeLNoDB51k1mNrPdR1qVZrzCzBvfX2qwyLBzzGMIWR4qScCSB09eQeCU6Nna+WYoolo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hN62oGW8; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hN62oGW8"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-5faaa717cfbso303984a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:47:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748252834; x=1748857634; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kSZZR0qMZkVAUpEjFq17SeucbREofsX6jeLhn+A+x9c=;
        b=hN62oGW8jcD5k9dcQnE57f7awlc/z/N01Xa9aE4iCkblAPmUKbxW8+6SSqD05N8o/Z
         6g3pwrW5guDhwaLhVbqEvnd8GPyJYf+FdAuiVrNIh6BPuZXPZdtrYa6KBfXuENIDrTxL
         LtLXqD72FDqQZpd0sqSasT40VyhaqrhhcjUPS2YTMbns6i2kTtk6v/mOQk3fVF2RThAs
         vGEB95PgAQH2qWygttgacRM5fIQBg1FhfIfP2O6xPDRNCZzUbPoAmBvz0rQ939IxaJO9
         L1DGlTTiKC0z+k4+uOx1bJmzCWF/Di5Xez5y1kKno2XFzw4eMYWy7paOODw5m3nN/c7w
         sN/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252834; x=1748857634;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kSZZR0qMZkVAUpEjFq17SeucbREofsX6jeLhn+A+x9c=;
        b=hVVdTP96M6FFfN4/Hqby3161lkKopcQzTMzGJImcSHL4WN46yIEXkd5mHkyUjrFZOI
         gXEZbfE+PDPNpzQgTqspbJHih0w+Ut4qf4o93JTXcXSwNn3Qzms4ZBpruykeuC9P3yDx
         WgmJgu0L4dcM33a43zRX2MoOsXkLcKghOj3PalxX4jgWzOUw7mzFHBVt82H0ZD7atcet
         JBiimmgPTKPLDOYQZRkfSS7UaC03SyECZoEZEObbWkZ5w8cbkFJckVS4Zc809KnpUAlu
         B+vbmGbGScB1NIc3NyLdsCoNjzvpTGWwURRb2iqDb/US0hLn1km8ZKpX5i3mx7c30vLc
         qQZA==
X-Forwarded-Encrypted: i=1; AJvYcCXspOGRiRb1ZHSaSGRerYOhRYZIEOafOq3v+JHZISHrbK/WEXzRLllQLrpHllwuw3BYMGdNkt/Fqovje4o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbkC5gkh+Xt2f8R/qrxoPrNQePNkgkiLYOuq4/CGPhZllXwYNH
	ugUVWdO9ObD7p4L6cB+4lWRp3Uu9fxP1tV1ssYSJmgkpbYKjm2t2qJR6ggq8+JUiA1U=
X-Gm-Gg: ASbGncsWYA0L7JV2HiTHKNI3ccXUCW19xRPoEjH9y8q1hnYMTWSaT+iMPiacGxMvpEP
	Ve2JmxJx8onTeWCuOQyyBtcV0eOFGZxgNQj7n3tiXNPkQMxrfX3flnGNIwfNjXvmqtCe9mTzA6y
	h9Hp4nXjGy/rO1td1cDDgt6ZE9WsPCd6Ao5jtUawrvkip+YqRoX8CG2/IIkbLwBF5zLEC+gRp5y
	Wzn+mwpWxs4kwL+s0bESP/DGqc5BQeZ2DapslWrRKX7w3l8E+jTlOT3qbAi6Ou/pIVYPResjrPV
	z7K0nyDSvegeqlMJETzSMtVGh+BOox/rF7SM6CVuSOon0FeuCkhmkrQ0zYhCgRpMqpfWGgA=
X-Google-Smtp-Source: AGHT+IE1rLSqoI6VnW/NLYoSivs2MuuZWDVumnm9UU8M7AtHBTKkJd/NjnzZ8iSRnfZzOFIqVY6fmg==
X-Received: by 2002:a05:6402:2742:b0:602:a0:1f47 with SMTP id 4fb4d7f45d1cf-602daeb6a85mr2510849a12.8.1748252834261;
        Mon, 26 May 2025 02:47:14 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049d482cc7sm1486427a12.19.2025.05.26.02.47.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:47:13 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 11:47:03 +0200
Subject: [PATCH 3/3] ASoC: codecs: wcd9375: Fix double free of regulator
 supplies
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-3-0b8a2993b7d3@linaro.org>
References: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
In-Reply-To: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-0-0b8a2993b7d3@linaro.org>
To: Srinivas Kandagatla <srini@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Vinod Koul <vkoul@kernel.org>, Mohammad Rafi Shaik <quic_mohs@quicinc.com>
Cc: linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1715;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=JFqzsTfm9DdoRKLGO7u+iVRbtQ2IB4LCND0J4CbvlC8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNDibdl94YMZwfVYjatgUDK/f/MsGw7A+4YxeR
 4h2FKW1fSeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDQ4mwAKCRDBN2bmhouD
 1xdCD/9vbaZu8P3oo43OAFrxr0vkTiREG8aTp5vpTZPLskJ+htHbnhA044cu38T+qsQF9RQc34s
 MH9ZhhXXdTkJPECc+RyRkdOO6CV41gQOlhzV8ucdoTYo7EBwzHXx9/QkGxcFEU6EJH278hhCBfG
 8SEZJdrdNHri6a2MavtaOl3ZSaTkmJZXfM+wT8hiVYi7Cc17b4ZFpH5IyyZg/UczuXuCu8ghOJu
 GAaN+AqBcxVtOVGR2p9OLksELtTp5ico4csmbo/fdx/jNKa9VcxKfq8jseZSFi/4o0mf5rI/c3t
 uUwWjes6UcL6Lumzlh1pMm5I7+kjY40avjkF2POvtPtN85MuwDPqZCI2RVA98Os1YlvR43YSs65
 02JVU7LboKXWH5cmviFsAHsdJJT7LYW+AYMBK7VVxjey4cPYvkJ/YwBZ1ywIOLr8Z8DbTzYotSS
 +L+9FQtWWS6EU8D09M9A5rOh8bqUT1Dt0nDwZfArDBvTx2Sl4QUJlZPGX/QawbtigbAfdI0CAWu
 eEfou2JRH9F5d7Hve/pnDQSGrAKxqwfdmC3wCDqBvq9ng438hcxrZY1aM8gVde6d9rkb9Z28Kpl
 AZFaVOu0Nulq9n3Ad0lJqPqqTGaxR4queZIllBjl0EztEW5IDmYw87McvXlvQTdKcqS+ToPILj1
 f+4LnRh+j9PDAHQ==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Driver gets regulator supplies in probe path with
devm_regulator_bulk_get(), so should not call regulator_bulk_free() in
error and remove paths to avoid double free.

Fixes: 216d04139a6d ("ASoC: codecs: wcd937x: Remove separate handling for vdd-buck supply")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index a3a4b1f53e88e7ade13455387a65de736b1f0bec..b9df58b86ce953427e01ffb8c7eb7e52f9c2392a 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -2944,10 +2944,8 @@ static int wcd937x_probe(struct platform_device *pdev)
 		return dev_err_probe(dev, ret, "Failed to get supplies\n");
 
 	ret = regulator_bulk_enable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	if (ret) {
-		regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
+	if (ret)
 		return dev_err_probe(dev, ret, "Failed to enable supplies\n");
-	}
 
 	wcd937x_dt_parse_micbias_info(dev, wcd937x);
 
@@ -2983,7 +2981,6 @@ static int wcd937x_probe(struct platform_device *pdev)
 
 err_disable_regulators:
 	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
 
 	return ret;
 }
@@ -3000,7 +2997,6 @@ static void wcd937x_remove(struct platform_device *pdev)
 	pm_runtime_dont_use_autosuspend(dev);
 
 	regulator_bulk_disable(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
-	regulator_bulk_free(WCD937X_MAX_BULK_SUPPLY, wcd937x->supplies);
 }
 
 #if defined(CONFIG_OF)

-- 
2.45.2

