Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7761F3BB5
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 09:47:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748252836; cv=none; b=in5MQ27t9y59ZihW9o1p2bVQHhKei/YffdUYLb4/FtWBjbLSSFAEpo3NcHItUqp2pYXgdVvKHD6m87xULTdGjADqd2bBzT5IrzQ2qLlFEjF8npCLi48usUY8cmXiCVSALJbA6qSTB5l3uM90xn/8njLPW99w54sFZqb/FsB1DVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748252836; c=relaxed/simple;
	bh=mT/EMNtSwpdKAfwY6okQuII7UuVyMAXDJYDo9/I1RAw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YKIU9tw1tk5fLbNJ41dgFw5jcfbF9tBhJiN8qA/xBoZgEFj1rWJqHKFEYazQYbqOUhIUjDxpqjuFZzmWvzL/He68UvlwbURTu8WMpRfhUmbvznS/DRDFfcRDqdAifsJcYbb+aOmk2IOZnCErSCIiv7KFnKdtbbviiJ68MKaVmF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=WsMSj1PU; arc=none smtp.client-ip=209.85.208.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="WsMSj1PU"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-604593544aaso310269a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 02:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748252833; x=1748857633; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mf98aVEPRnEWwXE+rikHvFZrdzzyYrcXz6WwCds+ve0=;
        b=WsMSj1PUuH74yBrzXjSFpGhwG2yF0SY8AJ126a7w1me0zeLOL5xaQDK2yUFOg30H5j
         mM17ryX/TlFiC7BiyKtMs7Xmt0XNGaysSN6ToXyi4p0s8XGwE1bNcpt+qxLqyhx9+zZE
         R3I1WUznQTE6mlkHShw0HkUjCiqj0KG5rkQkYZOmmvVOhd6A7bsYAKjQtmA1XfsqR1ek
         5ovKaj9U5nWV70EOr4+1Hb/2ajNNwcQ9S6GbbkaCqUtpRPxi8ku3kRNPbvn4H8Rxcog2
         OCpC/hJ8hOlaptz66nbwEPANwLYnab8Ribaj5BO7Qrln2LmagrfQkgSxV/O8B/g/30aF
         5lPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748252833; x=1748857633;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mf98aVEPRnEWwXE+rikHvFZrdzzyYrcXz6WwCds+ve0=;
        b=PuR4jMNyClmnoj7x3WZrL1PZdpcz6KLRUGDKj1grfQcoPSIQnuxQqspTz8dUb/UT3o
         3J4Gw1ULb4X/iOxprMNeuB1Y89sB0zeyXJjoHsmVcXXP+G/uWHUYC3Ug8dBjsGhLyL0n
         vbE9z8dkGkvt1lLuGprBuTU/NGYsHx13AkeaNnxfJYns5DEgn+KYPMHglf3en4B2XHlu
         tr5fsDbi4sxYJROoVwacrx3uYDd0lkEfhlFgku6pJvIuT+vW6gbmKWkP8YlP7BTqdOoM
         yQ8nDTMgKek36tWdCgkU6Gz61M17tsz8GPQ97dtnTac9OpzmohLikuy9hsRHW5dmRmLo
         COgg==
X-Forwarded-Encrypted: i=1; AJvYcCWXqwW7NBQrENSNUlVPN9QpxwK9npUBibN577/Lg429ACQRuG+6ZRk5Mu3wA+MPTQM/MkhJc15MFlHZJ/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwylpcOGy3PLRUIRwjbEO5a0LJHRkLnaAl1icVTpZCvZlKvc8AD
	fhMsJxa1pLnV0Q4fxpdnx+xo5rwonD3y4jM5COkqSsJTMBPwRUuWuhYm+GpZbF1kqlw=
X-Gm-Gg: ASbGnctnBOgLlymcfDNVrX/0Yf7mibpoli4lkR4A986jWVeuyhoTNcuYoSb1JWEhDZj
	oBIEIIdHyjkWlJootlKWKFKkE8jIFzh+GmznPU1wIlDwaNwrRvz2LLysPPngJexwvWZcZe/L7IM
	LrYXC9ByHLPzl6fGRglUSpqcOozdnPAivePfWBNWreFCTjlpNIZ6q3+gkSh0C9BLH/J7p55wN5J
	eVwGDSPZVjsVNwAH0xOVxubfocmxvAveHMjAS9dczlAFnIf6CIecD1gkGHIGA/Sld0Kef+kypOb
	AjbMcuOst0Ks2plrV5Wwx9oOxaZ0Kcj/apZjtCDZAaIh4VJdnA0pLe4SYW/Alf77VymLXhk=
X-Google-Smtp-Source: AGHT+IFQ/yOEW6qFlSR6tl4VswK3VUmEUrQUe/Qse8CIDzE90hh/Y0WqsQgHDIHFf+lTQEEGJWMcWw==
X-Received: by 2002:a05:6402:26c3:b0:601:abc4:1b44 with SMTP id 4fb4d7f45d1cf-602d9df6cedmr2589786a12.4.1748252832752;
        Mon, 26 May 2025 02:47:12 -0700 (PDT)
Received: from [192.168.1.29] ([178.197.223.125])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6049d482cc7sm1486427a12.19.2025.05.26.02.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 02:47:12 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 26 May 2025 11:47:02 +0200
Subject: [PATCH 2/3] ASoC: codecs: wcd937x: Drop unused buck_supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-v1-2-0b8a2993b7d3@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=996;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=mT/EMNtSwpdKAfwY6okQuII7UuVyMAXDJYDo9/I1RAw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoNDiahh7YsUBAm8Iu89FMVlZwn3xet93APz5h0
 3uJi60zcxKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaDQ4mgAKCRDBN2bmhouD
 1+fUD/981M4YfExEo4SwrDuA7PVrVCLEGQOILs/9VATrukI3ZP0GscQGTIPCQY9Zcx5WlwnfTDb
 tnejUOcxqApFXlwuzbuepvNtVlRyRqF6jvdO3D5DtAZHuW59VB4atNkVhLAPn9JLh+O9DTQJZpl
 BI6AnEYCTqwuQkVk+e6JqWC24GNeN9TSmSW4izZfzoQYU475omw9dQ5CuWU2BpMDsqAo7+73lc5
 2S759DiwR764pmXfakow15a6gLPjPtllS6DXQe17NKHD5NTuR//X0Xjj3JDBQM6/FKmr2fHFL26
 YXvWHOMcm+nCJZrjniXILk7Wp2zjFJ0RVufnPlKM0nlMg2w7R+mSX7eNyHMvjGp1F4XPVEjjFo0
 rGZFNef/g+6uUEcwgwPj6johBCnCLEf0DgcIEXmNMDSllQtr1KtWVhHX4TzgBZB/5qC1UnXcvv3
 XfO1iq2mA9Gd95SaL3edLoPl/sZyjgZFr0h9aMJIfB084y/8H9zZGnupVP0iWD21wrxmY1XJIvT
 lNinP/AEW/bwPtqAFuKc07u8lbqfpVkqseimONoPZBFpBHJXah5Z7C/DzjZzI2f39jD3I30/3WO
 62WMeue++WBVUvLJAwH8VUeVDJQmqtk+HMSiwECH6a56t0tVpNgzTZqe4/AL73BdzWyL5R0r//h
 TUjsAnDn0MQgA0A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Last user of wcd937x_priv->buck_supply was removed in
commit 216d04139a6d ("ASoC: codecs: wcd937x: Remove separate handling
for vdd-buck supply").

Fixes: 216d04139a6d ("ASoC: codecs: wcd937x: Remove separate handling for vdd-buck supply")
Cc: <stable@vger.kernel.org>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 sound/soc/codecs/wcd937x.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/sound/soc/codecs/wcd937x.c b/sound/soc/codecs/wcd937x.c
index 3b1a1518e7647366b4de0e90828b8d97b82c5bd5..a3a4b1f53e88e7ade13455387a65de736b1f0bec 100644
--- a/sound/soc/codecs/wcd937x.c
+++ b/sound/soc/codecs/wcd937x.c
@@ -91,7 +91,6 @@ struct wcd937x_priv {
 	struct regmap_irq_chip *wcd_regmap_irq_chip;
 	struct regmap_irq_chip_data *irq_chip;
 	struct regulator_bulk_data supplies[WCD937X_MAX_BULK_SUPPLY];
-	struct regulator *buck_supply;
 	struct snd_soc_jack *jack;
 	unsigned long status_mask;
 	s32 micb_ref[WCD937X_MAX_MICBIAS];

-- 
2.45.2

