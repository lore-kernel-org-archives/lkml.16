Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0568024C095
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:01:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745571676; cv=none; b=C3XTxbDGgB3A2VA0e6pXHVW2woT+pdubXsbXhfgwK+Kzg7nPdkuB3Iu7hrI4JqcaqSPig81rRLwq7gwkxrRP71HNAFvwltWRy++TRPmC9Nhyq10Qg8zIzvZZfK+yiShVJgwJytghfClflcayN+N9CgJ1N2Lm+TnHMpUwacXPqo0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745571676; c=relaxed/simple;
	bh=jbtD4lxoo1Rym8zGIQhQtZtmYwoyyWZdSONqwD+LmXY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=txLc/x8mL3GXmgFm4ryihedC8DKHM8KPCgT3oGVxv4RF/w74a79Cd3TMz3SxA+ZcV7xFrRij5JPQ0k587pXG52ChQvbDqkTBn76IjDCCLD/CvmhVp4fmOMQW3PKxC0tASgLZTgFE/hp5m6ocOdvExY+b6TAI9EAWRoe+3p+YFaw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=H0lBOLMg; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="H0lBOLMg"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-39c13fa05ebso1286267f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 02:01:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1745571672; x=1746176472; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=H0lBOLMgy6mEpMCFeYJOt4AYsHm0+x5PW3AxnlmDOHAoEtnxziU02zBEN8dLJmFdy0
         1z9E/BcVUqKsVmQOcaSTPkGdKhtnv7QMdPurpIAZ+OWnzZCRHaNmYuMWr5KjGZc+IAVR
         jyKqQO+AG39VmHx269jdEtCyIZbIhxCxrT35guldMi0/8nTyb7KOJFutI1ZikvZ1JfjR
         i4ynuU3F02m62MBmZeRuoL2nuqVtfPsjBZI21qzQbwxqgbXkOHIrE11lQAcLQgjTFGS7
         FnTH1Y939hW03Cyx1PFL4oyMikGDtsLKGFo28lhB5hcPc4baVLkCP4FP5S8W9iV/B0CC
         9/1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745571672; x=1746176472;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bSvrLQBfLq+B4ut1ceVEmi9/bo2rmWrizkJ6hXk1M/s=;
        b=GrwUFrKNZ8ujPBnc4qDBMBR9IZAu/9rhBTzwFDBTPTfXvCwYCBjGF7uIuVqFcSL0r4
         V8XjasuhS8+R8uVQ97ZpH8l9DGwDQOv2Blif2mBDhC3TGRbwSE0lRQmK53MEMv/v1kZ7
         rrgv558xtGJDwMWBYYSm21+cIABawC1jv07d1ACGIay9u9YwTX9ZFWvT6fgrus+IfVnq
         LiOAlNge9BlBl/+a6/JL2yGKIbKoyjrzS8cUuyM+ImuCsl5J1bABvD2n3wd/xAA7sG8j
         ingNQo2L0/WQxX93UI6UM6z8GIFzgolBejsZam2SJeuKSKwFq7P0TphylfiTASGJY0my
         BSPg==
X-Forwarded-Encrypted: i=1; AJvYcCW0tDkmkXc/YcnJ3Wu7TonvHYJzxjVvZhirKta2q7JiJq8VlMuA79fogg+Y/9LMRrHwH1SrbL35ZOHkZVI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8P3B+q/h/5sXflYGiPxtJsflcbW85vK28BRXNL9YAGZr1JhmA
	6gCLZ3VRc9EubcXj9CSIHRUFJZk8fLACiTW9UcOjscwFmlyyo7ws7TPHwcJXuiE=
X-Gm-Gg: ASbGncslJsjuNkBciXY9JH4E59xxUPf1FIkGn5TDxgdHJri5BoCZd6afG4p4gYAmvZk
	L/jcbu7sjpAc+mxX5oIwiZdo027nkMoK2iOUEXfd8nakVoRRDccG7BOnccar+5poFRf1SJWaxP9
	8ssGS0c7jlJegRBgfOgzR29/EIrIbwLQ7W3wg7yewy+qk82y4KanMhxtE220vfSLnjoVZ6BpiK8
	oOfx2YuK0EiZ1jcsTNbJRjcOiqsAziG8TPNIGZADRoiCUgyV75kFY6AjCgHckoF/qtdLGOsH1cd
	j16/pNNIOFn7HQuTamrdvqwgnj1QiM1avw==
X-Google-Smtp-Source: AGHT+IESAKBg/vUZr7+HdyTu7Zt6c8/2gvrqKe9AqCVjAbPvKvH7CRuaevUBHKKYT49ezlwSd/p7oQ==
X-Received: by 2002:a05:6000:290b:b0:39e:cbd2:9211 with SMTP id ffacd0b85a97d-3a074faf2f4mr1109587f8f.55.1745571672261;
        Fri, 25 Apr 2025 02:01:12 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3f35:2b31:c543:726d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a073c8c95dsm1696571f8f.3.2025.04.25.02.01.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 02:01:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 25 Apr 2025 11:01:01 +0200
Subject: [PATCH 5/5] pinctrl: mediatek: common: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-5-93e6a01855e7@linaro.org>
References: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
In-Reply-To: <20250425-gpiochip-set-rv-pinctrl-mediatek-v1-0-93e6a01855e7@linaro.org>
To: Lorenzo Bianconi <lorenzo@kernel.org>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1986;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=DhR5Cx+h0tuPThTQMfkVBP7GDMglNgqo3TCYghOZtTc=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoC09Q1qfvXLmie8Ad0KxRLSMtwSzORIC9DHLME
 ux5GcRSG1uJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaAtPUAAKCRARpy6gFHHX
 cin/D/wN4TReNcVZdJpBQ3ij4ORtqXCjpIzT8TejLJmPbAW7VRLBI73Sot2lYEh6ivMjaPGV+Ez
 ff8t2p6qHWL0XyeySWLjPm6Sa+nVqRjbyFGUOty8iQicWy3VgU0h6OZYaOlbXE3HSchUFE7AuvP
 l/20EdnceslbHDVHXe3uDbsWvxyZn5zCj0Kq78XggHgGsprpI2qVyAFDUBbwaWh+1+myh7YJx/X
 yJvdjTBEdvqoMiqeuJaYhx/t/paIekWXTGSEKqVdHPp1hzb6KRCrycp6u6jzsZvnNsrMKcXHxb8
 9/3Gc6GRcWE7CxSmBqB9B0mJTdhSHRZa3YIRQTpeMxWjxGa30VQ7vMJvHygVdwcFOueRtPlcXZz
 gU7YuuI7Ug885r7Xoodq798CBFf2KN6mjY699nAmfRjbxVv+FxH1WyP0WBmENEtDQ8VHxfPJbgP
 WWvfpj0aKZTuEMTvbguqYDv8tC6fjQApPkWtivimKfsAvwjsxNqFKKgcWTlaNMCai5ye1+WNLlF
 o2XVBinR1y8178arKTT0Sa1lWO97DQwu63sYqqlePtrT+KmXA6ixprYXzYR5iBLI0RZGMNF10bP
 T1xXXdlDIe8hx3XfKDVXoo/cUL60hAqfNjdG3/Z8zF7bbaR3dzsYYEOsDCOqiO/bRA3AGSM9R8D
 Y/dstQRT5IQGDZA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/mediatek/pinctrl-mtk-common.c | 13 +++++++++----
 1 file changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
index 8596f3541265..de7bebb9a6cd 100644
--- a/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
+++ b/drivers/pinctrl/mediatek/pinctrl-mtk-common.c
@@ -86,7 +86,7 @@ static int mtk_pmx_gpio_set_direction(struct pinctrl_dev *pctldev,
 	return 0;
 }
 
-static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int mtk_gpio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	unsigned int reg_addr;
 	unsigned int bit;
@@ -100,7 +100,7 @@ static void mtk_gpio_set(struct gpio_chip *chip, unsigned offset, int value)
 	else
 		reg_addr = CLR_ADDR(reg_addr, pctl);
 
-	regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
+	return regmap_write(mtk_get_regmap(pctl, offset), reg_addr, bit);
 }
 
 static int mtk_pconf_set_ies_smt(struct mtk_pinctrl *pctl, unsigned pin,
@@ -809,7 +809,12 @@ static const struct pinmux_ops mtk_pmx_ops = {
 static int mtk_gpio_direction_output(struct gpio_chip *chip,
 					unsigned offset, int value)
 {
-	mtk_gpio_set(chip, offset, value);
+	int ret;
+
+	ret = mtk_gpio_set(chip, offset, value);
+	if (ret)
+		return ret;
+
 	return pinctrl_gpio_direction_output(chip, offset);
 }
 
@@ -893,7 +898,7 @@ static const struct gpio_chip mtk_gpio_chip = {
 	.direction_input	= pinctrl_gpio_direction_input,
 	.direction_output	= mtk_gpio_direction_output,
 	.get			= mtk_gpio_get,
-	.set			= mtk_gpio_set,
+	.set_rv			= mtk_gpio_set,
 	.to_irq			= mtk_gpio_to_irq,
 	.set_config		= mtk_gpio_set_config,
 };

-- 
2.45.2

