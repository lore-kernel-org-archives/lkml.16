Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39E77192580
	for <linux-kernel@vger.kernel.org>; Sun,  6 Apr 2025 20:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743970615; cv=none; b=GviLCz0REHH0WbBghMhZxLMTrqpgGLfgbqc1pH+caZv/ddLO6uYWHnRNleWRr2CiYs2DmKTqHKjhY5SmMlg1TfFGcNCmc79Nw0dzstRYg/on+EnB1YKDCP14G8/6wZFIo5fGc+bHrNzkJgZuZnmd/AirZZklq07Tkr3eEcF4Tr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743970615; c=relaxed/simple;
	bh=F9pY8frtPyY1rL3BUcLY6dFvtBPh975/9mhwZubWHTk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aQa/kaLpLNwu9P7ONFBmzBWopVU2RRkcKer1p8MHZqcyIg7ONlAUY+JfENBdwEwMmqpdjkUQu6Lv101EwjLEmnzrz2wsr5po0QywGb9B+UHiZbtIQ2WyCTMNS1RKpXO29JAi2iPnpE6gJawAQ+aILxe3OpBvIDjMAYWysggws6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ddFasAe1; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ddFasAe1"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-39c2688e2bbso471226f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 06 Apr 2025 13:16:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743970611; x=1744575411; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PK1eLJRwjNUIf+jHFUkxf4T29EbEvmbmOLYjAcK/oEs=;
        b=ddFasAe1Kg8bXYiWRLH2/vrIIsYqiQ2x+/QNMtKdlNdJIcU76ZFqWR+Juc4KDj/C06
         YY9BO0TndGAMCm8rsDfX935Ep1KYpcNJoS156sTKLu7iP3GrHKNIQyFpvzilT6YOqGtU
         defpmGoQmTZPLoOlDzR7lqT6FWMbTYwMdp2xSUD67oC5ldjSDeL1FJMv1N+76oYjsdNJ
         7uQ4VM+9i1u6wxowAH/PnePKr8P4CHDMRhY/Un+WHLsRw/R2tN07RNkBKLLwC4vJlpVj
         ZKisXlz0XrCD/9/jTOAvY6Hm4HrSIsPIY0WfUHovKFXw+xgPDL6F/CzxrMohtb92ohOS
         uRAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743970611; x=1744575411;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PK1eLJRwjNUIf+jHFUkxf4T29EbEvmbmOLYjAcK/oEs=;
        b=SFUGtnxr6k9xHLTeQ24JrCk/kx4Sh81DfURt8dimE8+QfVBEIXAWWw4NYgufN4Yh0X
         Y60t4n0Xum+ECvBNl6LuGNwos78MRgtZvUOSIJNGEycyqcgKUY8445788ITmchSZP0RZ
         fN/Etrus+jOMyt3+Xik2qu8QdZ9cFe4zgYnRAtldHBaqIQPjg0f2QyTh3W5eDeerZ5xA
         MHDWXyo+XqNook+DoqDIgnYA5NZzNUYt1HlfafGtnoiKtCtKs5IU4bQDLB64EUTTd6Fn
         guLN7c5C+lMLaVdYknu9SbIvtIGrWou1RAj2gXVktz2OTSmCEipZXLQjrJvoQM+VvHCk
         NomQ==
X-Gm-Message-State: AOJu0Yz6EpYh6I6u++s2bfbKcCnBNGZzuqEPwr+BklRTVnGMRIGzZD6N
	H92ZBF1arEzG6AA6fIEEW2q8Yn2VwwlPf0Gr8kbi947XoOuPTsYNOxJSTwbjkwA=
X-Gm-Gg: ASbGncs0S6Wn4a5yZFC+Iim3qtZcQwwMzcPxokvHA4CRE5hqBIBF4uLeNF3jpLQisl0
	zrWYr3kWmRytI0Hila9h6kDrhCZgdC0oWZ63/sLySumNwygEQUX2mUgUnd1o50ORH/N8vQA7TOM
	2Q885F8TxhfTjvrEuJYuALPUCti5g10X6ooba8hzzAWaaH1XH8XcHdyyXzvOnBRDjThqkv/rP5e
	BlE7mfwl8Jqw+T+awBUL7/hbVsJpT0BzIbjRDnLkBa5BvoP0S1ZZif8G9Ql16fdZHnmO4cEO8j2
	TnyHir/TthZdSIcqWd+njtD7SaWh6yj9JFNohedqgLNnWMIMtA/p5Ld/8+747VQ=
X-Google-Smtp-Source: AGHT+IEXnr9lmKNwFlpML2O4KXsGHR/K7hZOIitu4Tj0r8I6LyT5tXM1RW9jPWiQr2tfEbpDM0u0sw==
X-Received: by 2002:a5d:588b:0:b0:39c:12ce:1046 with SMTP id ffacd0b85a97d-39cb35a2333mr3406453f8f.6.1743970611516;
        Sun, 06 Apr 2025 13:16:51 -0700 (PDT)
Received: from [192.168.1.26] ([178.197.198.86])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d68esm10295521f8f.67.2025.04.06.13.16.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Apr 2025 13:16:50 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Sun, 06 Apr 2025 22:16:39 +0200
Subject: [PATCH 1/4] extcon: adc-jack: Fix wakeup source leaks on device
 unbind
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250406-device-wakeup-leak-extcon-v1-1-8873eca57465@linaro.org>
References: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
In-Reply-To: <20250406-device-wakeup-leak-extcon-v1-0-8873eca57465@linaro.org>
To: MyungJoo Ham <myungjoo.ham@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Hans de Goede <hdegoede@redhat.com>, 
 Chen-Yu Tsai <wens@csie.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=769;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=F9pY8frtPyY1rL3BUcLY6dFvtBPh975/9mhwZubWHTk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBn8uEsbOMZQJr73NW28WN6NH8FVqEpOW4owF6Sf
 RzXO/ebPOGJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZ/LhLAAKCRDBN2bmhouD
 13hJD/43TZvFgpyHitYxVcyhVDUvoH7nzWapN24cfLCFk9UeuMbJkUiKxwhkzRz0am2QzNfc6Q6
 o1INqA+wGCUsh0F7z7/fGzhY/581/mQwZwQCiY4cPy6zb5sAqHVTziS5M9syXOUn+AYVtNwxRZi
 YiVkdLLI2FCFxq/jDhK7RcPHUCWW0xVy6oxOqsDIr7Tht1Fw7pKBRwu8ZZU3wwtCk4+gB1uUvBe
 gahSEZKP9TKGeOuxXWIKXdJdGjxnETYD66ONmxXS2tFbBNVtzi3D7Ouwt9X0wfEhDWXi4k1Fz4W
 Mv+LeTmd2llPEsYErj/+XVTw+61Uaa8fitgMR8mFAeQwlzsoF212YRkox4jx7loZS31nMbzW6/s
 BvkWL5sP7nEu9+o0B9hdko+aRHBSF2GvXaWt73FycGvaRa0LQkOo1bf+/3Mplfp5Yyfgvc99adw
 E1up1XNK3bZ6SzYdU06Wqye0WDfdQZ9kpHEJfoUT1tyvcYU0Rc7VWhATJHxbjLpNvy4Pl6LLxJJ
 W1yzMx28T9UrsrfVRAMCXE9+IyfrbPu5Y59D1525LMqF+A1NBPf1IakgsAJyO0qtl0C/WLwFVWs
 1EgO+kokDcUT5wcjt5oGLSYgYJHIsPHTDAdZWJwxMB5AY9lTelj/GTxXmC4EX7TcpjcUTBO1/gR
 EshPLTWcE7Tv70A==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Device can be unbound, so driver must also release memory for the wakeup
source.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/extcon/extcon-adc-jack.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/extcon/extcon-adc-jack.c b/drivers/extcon/extcon-adc-jack.c
index 46c40d85c2ac89599ffbe7b6d11b161b295d5564..d7e4b1418d7e6b242780b3511f2a49def3acb7a6 100644
--- a/drivers/extcon/extcon-adc-jack.c
+++ b/drivers/extcon/extcon-adc-jack.c
@@ -164,6 +164,7 @@ static void adc_jack_remove(struct platform_device *pdev)
 {
 	struct adc_jack_data *data = platform_get_drvdata(pdev);
 
+	device_init_wakeup(&pdev->dev, 0);
 	free_irq(data->irq, data);
 	cancel_work_sync(&data->handler.work);
 }

-- 
2.45.2

