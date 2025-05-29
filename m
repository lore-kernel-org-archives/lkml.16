Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D536121B9FF
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748510163; cv=none; b=OPO7zr300hpNVBp+RHPpM3lNtH9rt9IIZ2dhCmsAuoUR6iKvxAyuH9qry1O/M5foqdmoNigmmy9MpIDgshga2lwzH5rpaEek3nHfWuOUPJKlpImZzhQLRTKKPwe8CNm93+LgniMoDJeLCV9d8b5iPk9e1ZFu1poTk8DNaPNkAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748510163; c=relaxed/simple;
	bh=FOI2NlElQUAvYF3wBUa5TZiP2fxcwdHOkRWmLHfzir0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iQxwdgQSilMRajzwuwyi/+bATAiyMo3rOMe6MzfOTYv8yPjvp5wDHkGiNe54/B+mIkygHDNjMP8vkjzSblnYamduV+fd+i4nEIhNRt55PnSDNC10QUjp678RvGxeS0gFnwInrlsXjdcOeTffsng6nJJP4ElQ6b9uW2HQqeLvD4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=nJ+C3pL8; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="nJ+C3pL8"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a36748920cso658771f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:16:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748510160; x=1749114960; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=C5KgxFGK8GpAJ4dN8Kp0qrb4U0fnu5EDWu0pgs+B0vI=;
        b=nJ+C3pL8OBAz5SnztXa0tT0fFl/S+zdUtlqDK1HAH7mMFhIdsNtFVjJwIkgJMbHg96
         dVpqurTypg8v5bI3NmCrWYbFnc+9aRIW2yyq+UkW3gy1I5LJWAr9SRhebbOa2eG/yAoH
         p/pT/6drv9rTy3FXPHajSWVW4A6b/zNUd/LKA2yunGTe7JBBOrw2th0s7fcel3XakaRy
         GkrDPE03ck+Cyn07znwf519tlnLcSzJJOiBchNeCl2p2+dzYl0ZVi5wmToY+QZWQpSKa
         W7SxroGHZZicxowTvCudJcgSUiRVNTHs9uZTj5PWXdwP1hlnuas5WeEZ+CAucsAKIAYR
         D8Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748510160; x=1749114960;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C5KgxFGK8GpAJ4dN8Kp0qrb4U0fnu5EDWu0pgs+B0vI=;
        b=mfrmA189V5R7eXabFDiCY+DAwQEcwMqaDatqFrkqLxsvIz/HOM1LfPndLj3SpQnAxw
         1I9eiDWL7ZVw7VCwRPrA/MeVVCWCG5qsS8nJWO0UuGoTNBrLsGO2CSn3dxD83LWpCLyr
         xXUjImeh8y32MHr+x2YYWn2TRTy3pW6wmkpVhFGMeYSmQvLiLX0wYwI3mtOFWSWF/7/F
         qnIOuOqK9aEiUVzwmTCSkuVZqiA2E5TKjX4nTh+wyVIuxq6X8i55shVBImYAMGtdKrIl
         PFApKHpWodQqJ6suDFekGJ8X4nDPlpotIROCKSXc925rvz1XtrqHswj5F5SWD6BeiSfA
         97Lw==
X-Forwarded-Encrypted: i=1; AJvYcCUpCq7EgNTpF/Zr7gYhBxHrYW2/7cpb8HEATSPqy+azrppaqImzcEmjxoRp8L8rm85B+GDdufeAoR5O8U0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxweMujH0oWUm+xIJqCyCOTKudHIVLY7TIHBJKGgfsQprejbUla
	34rg4BVY1+kWO4tSVFQmfcosknUucU4jHvzMtsiSpogZI3yhYGOkxZ+Wual1CD49/pc=
X-Gm-Gg: ASbGncshZNyV6si6C8jenRV1voKjHy5J+K+AFBzK+uPfoIifraCUFbK48eeTwJvhmQr
	ttzpqfQTAPbotXHXeqNimPR8q+pc29jkVTfAusAI93mJzjAUAst2fYdczNFQsyGHQdUBR82VmMQ
	aIT6IX3IReP+P8A1rk9gfwsHq+WUg8C9vDfw+BoYdRh/SmrI30WZIB6myXpJm5+bl9+3laOeXuJ
	b6b2LNOTJ252YQ3OsYPaQxe7HYy1MFCHTI3kSZgmog0jnpEOf3sXBQmfg90CwzCRweVc7yTVTno
	4EcwRedeFSKKt3jNaiYzGeAGbKxNSmIARwwVCCIRIlGwF4JnaE2B4QYO5/zVeFCRjBGCeCjHpU4
	Twn76RREcX7y638FkL+QDxq75kB7o5cI=
X-Google-Smtp-Source: AGHT+IEyGk5YUyGC2CgIHlQGEHVMKaTiSTSLXFk2d+0PJbxOk/oSmluEgZeTda147DVczcWuAAeLSQ==
X-Received: by 2002:a05:6000:26d1:b0:3a3:6f26:5816 with SMTP id ffacd0b85a97d-3a4cb489a52mr17871249f8f.36.1748510160104;
        Thu, 29 May 2025 02:16:00 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450cfc348bdsm14318475e9.33.2025.05.29.02.15.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 May 2025 02:15:59 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 29 May 2025 11:13:55 +0200
Subject: [PATCH 2/2] iio: adc: ad7606: add enabling of optional Vrefin
 voltage
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250529-wip-bl-ad7606-reference-voltages-v1-2-9b8f16ef0f20@baylibre.com>
References: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
In-Reply-To: <20250529-wip-bl-ad7606-reference-voltages-v1-0-9b8f16ef0f20@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=937;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=mPtkuRFlIF9kUIg6RF/x8q8TWHnV0+cp5WDL4t37AOI=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiwUK3qFjppZ/5afINoCt8607Udqbb/M/9VTI6f9eaTs
 VT0voetHaUsDGJcDLJiiix1iREmobdDpZQXMM6GmcPKBDKEgYtTACZSqcXIMN9z8fyJvFZ3DqvV
 HP1wo37dGkG+GbFudSpz9xy+fORVCTPD/6Rj4QyGH39t8O+xPnXE7bPZOam/SoVsZ5YLr2uu8H3
 2kxMA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Add optional refin voltage enabling. The property "refin-supply" is
already available and optional in the current fdt dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 3bbe9c05b5edbc11e8016c995c6ab64104836e7b..21e63260965c32988d0ab3b8bb1201aa2396f1ba 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1335,6 +1335,10 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 		return dev_err_probe(dev, ret,
 				     "Failed to enable Vdrive supply\n");
 
+	ret = devm_regulator_get_enable_optional(dev, "refin");
+	if (ret < 0 && ret != -ENODEV)
+		return dev_err_probe(dev, ret, "failed to get refin voltage\n");
+
 	st->chip_info = chip_info;
 
 	if (st->chip_info->oversampling_num) {

-- 
2.49.0

