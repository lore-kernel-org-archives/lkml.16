Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7177D1F12FC
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 14:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746110019; cv=none; b=AxxfAjKX5LoSbXpZrnCBMIVoSAdqXOautrFkd57YcJuoTAvn4xee6j3pkrjy7YcMu6elFHceRGiBBz9uTOsXpSo8EC2xaPrQvJGDJZChNHfteO6x8hMYTiSDE+OdHqpfRDQ3S6HPcQ9DhqxaLYXBZHonmc9a3gnLCiqZ8Tjh7Pg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746110019; c=relaxed/simple;
	bh=i/9JegHkYn3hf7UKBycAb6L/6+ZSLW212aokZlZbpAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=b7TMnyP4Rhq/unGe1FBLYEr/gteXcRHYniTAhdajnbck+5GFBf4gJgvf5w3naQEXKexExTWrI7wSwzTCs2WpnvOlpy354craQqShO4Lf67onNJzNUOz7UBXzmVl1xk4eDY6hlOB//oraiG2Elm9IQZENbqyKMYTJta+SIhjQDdw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=GfHIWhqp; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="GfHIWhqp"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-43cfe99f2a7so1684955e9.2
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 07:33:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1746110016; x=1746714816; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=235YzEa2hhjg3MerjPvZinFHZ44M460Ui9/2wMQKQn4=;
        b=GfHIWhqpjBEmMJD7lm1OeWcrdg4JgAW4dWWbC5EwFEWS1NHkY9LQ9qU1QUCP+7v8Ig
         +/gQfFZhYGVsimYJZRyPGgil3ldlikSwXB68kklphGtXDj7BA0sO9ihG6v8mO3kCOD9B
         UFRQ3qd1A/83UICDRTAVHvZdWiynD9gVzgCym8lOdybBGwnaVppv5AV/GLh4JIpupbQX
         QeoQxL2w5OCLOt1VLMAwbZzX+ERF0zIjq4+wjuS9h8zHtwz+bMDhXmALYJ5fI1G0cNM+
         2UXR8zvM3pq41RWZarEuTW/bYObdRejBEXM8Ri44yow7aOMo8uBJvSkUEwKn5nj7WWVI
         xtgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746110016; x=1746714816;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=235YzEa2hhjg3MerjPvZinFHZ44M460Ui9/2wMQKQn4=;
        b=s38P8HVw+OJH1DLy5IY4CC641SgZmRoZ9DL9AZZ+548PmWRNLTW464fsRYd+MNsO8+
         O7wYtaiZkk9wSlPWvXlw7sdPdyM8CymnPAcqcYKGvTisINeIfqSJt4e+hDE7EhAWh9Ti
         eN10HfkgQ+TNWdTBc0nk7xcQTwXOqE+no45V1TnkcUNNayZHuuKNaleSgg4HpjqMsjzc
         WzwX802Wu6o5NC5lLmGY91lYKGRfsbCkEsujA6g4ELbBebtVa7VhWw951vceNGBsGsmu
         GPmAkW/o0uQwUk/VAio9V7HXFfa1WHDha/GuifDK6lYUN8mqvTV7DUmbf4o22m7i++Nk
         MU2Q==
X-Gm-Message-State: AOJu0YwOVFAZDsKeyUy2BnblV+SiR9JGVU+3uKbb6hpDrHKMwoK4JoFX
	K0uzxvT73WUVVChsH5bKi1GLWaOtzV4qyhCVPg2ulaiBdlzcuBamseSNfst9Kr8=
X-Gm-Gg: ASbGncuENipcqpqDlmKQqUboAY8d0UjISGKwHfvyQhjIPboYXt+qQMQCxE20TLWOXjl
	TMHKVrTQ6kPDdmddBnQaTyZKNerk+5d4Eibqh5ci6UfdpvSsvolX+XG0tmOGRK9RxGbH70uM4UT
	dndaPSEEIv5D17S5t7FrDNVlZEEs5Hn7Yoz9y2pGzmWAAPg0J8hH8RGck7i9Cnc/cEFYsEXGGwx
	8XrE1JtSYxvkvQ9vlLqK2T+r0QA1cfYXWzOSIkCX0FbK8XHxw/f1KYJriIWS2VaYo8cnpTbmPMU
	XojPrknonwXahyZJUYw77/Be/+mG1wuhlS4gLxSRiaXnagjfQMRourWu7GU=
X-Google-Smtp-Source: AGHT+IHM+H9W6H03/DSmUY0qzExdl+2h9JqhPuoEYvmYnQ1kcBLAjkYWDq/sTkuyzxoH0CkcdQ5N1w==
X-Received: by 2002:a05:6000:18a2:b0:3a0:831c:ce4e with SMTP id ffacd0b85a97d-3a094178ed7mr696817f8f.12.1746110015720;
        Thu, 01 May 2025 07:33:35 -0700 (PDT)
Received: from [192.168.1.28] ([178.197.207.88])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a095a8ef66sm957636f8f.88.2025.05.01.07.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 01 May 2025 07:33:35 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Thu, 01 May 2025 16:33:22 +0200
Subject: [PATCH v2 2/4] extcon: axp288: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250501-device-wakeup-leak-extcon-v2-2-7af77802cbea@linaro.org>
References: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
In-Reply-To: <20250501-device-wakeup-leak-extcon-v2-0-7af77802cbea@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=819;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=i/9JegHkYn3hf7UKBycAb6L/6+ZSLW212aokZlZbpAM=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoE4Y4qnk/g4XV7me9WouKqm9DXqHuXluUpQfFh
 44yOz8PFqaJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaBOGOAAKCRDBN2bmhouD
 1zSDD/4/C2bZx81xYPkD+nD8q8jsTtnM7Tz9rzBhA+VDWRdn9Nz1CTuSZ62C1J5w2Nhn7BFtuJY
 MWEUiigYZrgv/L7einC9teL35A4C4XbTGSeELk6gHyyJRC9t2U8RHQBaC3BS82BqcnwMm3nRzM/
 hmUBj02FP14tUrpVAb0qfvmiVaml+SyH/zUxjyfC01psQ8JmDhm0hE4uTqH27Snj83Clrv+l0Fc
 ihC65YP7MzlIaV5d/wlo3L6DmxkH5uzVhXmX1tlLmArZ2Vdx8+Jgiemw8u8s13Zqz10UrQQzaa7
 Osv4n2qPkxDiAHNKAb4Jw9iiqlxbw+eRYLjE/PMFXC4FO9iecc1z5GEKF8QN8ahBWfuK3z2gv5X
 7zNEW8QhqzlT3dy6NRoB2L9rYVHzDM77MZ9md5FV5KGINOIFLPJynOAtzWzZR+Z4MeDigxWi3LG
 OGGcux4v0+fu4rCzttuNcw39dzsEsvLuBGq8AcmNhScv46ji6D9KTdwOFF3+gsYOQWDuRlyogEV
 a7/fCqr+/r2IyOYS5rLCcIXxTun/TZnvo67GMjnFxuGpf7PSOEOgCEvHyGKOOgUJMdC2bKaPwE2
 qRF0mmfZXeaAtCesIeE+nhHFolQe9IlF0r1dOxO2EFG/7KVMhrvbiJ+fHWiJa8An9iLmUUQF7Zt
 goZGEmzDfYZrZaw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-axp288.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/extcon/extcon-axp288.c b/drivers/extcon/extcon-axp288.c
index d3bcbe839c095f126f0313a074681f1c900762c2..19856dddade62c5592701f8fd5842857ec24813a 100644
--- a/drivers/extcon/extcon-axp288.c
+++ b/drivers/extcon/extcon-axp288.c
@@ -470,7 +470,7 @@ static int axp288_extcon_probe(struct platform_device *pdev)
 	if (ret < 0)
 		return ret;
 
-	device_init_wakeup(dev, true);
+	devm_device_init_wakeup(dev);
 	platform_set_drvdata(pdev, info);
 
 	return 0;

-- 
2.45.2

