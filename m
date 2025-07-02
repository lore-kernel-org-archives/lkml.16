Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED78C23E350
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445948; cv=none; b=S60QSNmvocG4yk3hw9JzC8gPBQuO6ZF56wBgb8/fUm17rf3BoHVCMEXaKZJZavfn98teDbRNw1C6Sjkp5YYlmVfl8q7uJfruMWiCbRdl3XdS8u/iBAwkZgcP606yC67S6TbrJUxv8ASWg7HzIcts3h8wK9YGVYV7EqGj8VOUJOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445948; c=relaxed/simple;
	bh=OMLzjDb07AyUp83AV0GD0cM+vuaw1gwx03PQmJxw7XE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YRYvHWMQNjdszRYioNTy8WDVG8FtSV9KGM27Jg4js9mwqlcDfFJXBAm4Uc3KdtK0ZaIG/R5T0ENLE1wfXjhBlAflkNbmKoX4VjQSCHeGDb+FDxvpnCzUr0xqq+hWKHrrAn4tgMf48+3395gdXP1IZRThBp3F57BvouRINqE3Dq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=1MLNDAOO; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="1MLNDAOO"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a6cdc27438so3495392f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:45:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445944; x=1752050744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZwPpNwCYln313MFwdNQx7OjpsLCSlHqrL9enedbM0bk=;
        b=1MLNDAOO5V3ajQwPYXc0hwPq4I4V1CwFyH3ty1HOGgN8oDpDvX1QGwR4qzy6w73Wtl
         CuG0KFdMTVtfD4zkaJSDLgiGAnSaQG4EW9PnHOENkvd0DYdRHsGSNXkuXlse/jsVNbYO
         d4JYO/s4beBULto9WLEu8aRDsipro1MN/cS245dJJUi5hq/YyeyUd0M/D6BNRZO75V0W
         Rt0fOkP16v1mERtOVkxRcKBfnikaudIDaNHqLacQYgtkzY6DjQb2iDWGGKTNuKDPudpD
         wJf4DxNVO5UuNJ8e0jlIhf8vwu9q7So/loxU+wOsn9Ogz0L2H1XnNwsahCUV6Vnx8OVL
         TAmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445944; x=1752050744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZwPpNwCYln313MFwdNQx7OjpsLCSlHqrL9enedbM0bk=;
        b=JasHDFO2JFBLEE2UAgoiYwPT0Y7zM+xjPU3oHrD6YNWTmxkx0wguby3IhsGihbIShq
         ApNDwpVU5QW+cXFmxC0VLCYyVe4Kuiy+UgxNcHcz7jM3X9hIlkbVNslLmGG+jXjDCiHS
         rejPrzDnbfsMC/rUp2KoCJ4ruvnH1s0L3B4Br2sRtnu5GJlBS97lGqoLDE7sII2Pm2Oy
         CPXmDu0Vu+Toumx1/ScNt1YH6srKjsQ0oP8XLwINeSiO3gbErf+A3E90uFMZin+fi2JQ
         N6YleW10ehrFsijf2LjMTWvkpfRqwhYnQss7wulreG8vU6IY/d1CS1WsYnYOhhH4jQuB
         oRxg==
X-Forwarded-Encrypted: i=1; AJvYcCUzyT4VBHL+dF4kLU8lLTcjZ1RV6UxzptjyPeZ9HPrfnmkTP+z3cxEyv4QMp2zG8h6TC++JgKz3Va2ecic=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDD69M/wX1evo1mhnp+P7KGburqkQ1M+ZvYUjk8J8KYG7OPlff
	2kxf7VZ5BgBtyQ5r0IGhwShLVHexgwQN8u/egYtn5ycHgH4sM2XeHJSJk2FL91PbSlM=
X-Gm-Gg: ASbGncsEhrtb2Tf3VolrBGFJcvmqDprbPnq7hmV3hJCRe1tDdRmB0YljYrUFoU8lWhx
	82w8G78POU4819Usgb0+xlJ0GmohBpXJbEdSZzfagWwMLOawRnwMXH6XFFgFNscPEjAKnsGnFZo
	DC2H66cWHVO9lqPchFVV64qChXICcsVBWeRRplV04cB7PcGkAMLkWYSrJAoazyUMT3yqptaieRt
	dzwKBgVhynXAlXKgi7shZZvLARfwk6gpIuZKW974cprMaIZxSNeXyBPmcoHpLsKibQNWf3xmtVC
	kaCKDOnouUWSsNOCxAk7OtiC0cpGejmD7XsV02orqLPJHQYgb7Gddw==
X-Google-Smtp-Source: AGHT+IEFh5AmGgfvsCCKFb1ElEYNehy+umZmo3olYFL9QRSS/S0Dg0pyMclntsqGh93jA274HIA62Q==
X-Received: by 2002:a05:6000:64f:b0:3ab:27f9:e52 with SMTP id ffacd0b85a97d-3b201203956mr1229163f8f.42.1751445944138;
        Wed, 02 Jul 2025 01:45:44 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:43 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:35 +0200
Subject: [PATCH RFC 5/5] pinctrl: qcom: make the pinmuxing strict
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-5-ed2bd0f9468d@linaro.org>
References: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
In-Reply-To: <20250702-pinctrl-gpio-pinfuncs-v1-0-ed2bd0f9468d@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Alexey Klimov <alexey.klimov@linaro.org>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1076;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=OwkxPIY+ly3qk9K5KMkBmlKJolP2LmYDOd6T4DDMhzY=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGwiqrlDD6VTQ+SSYTG7O/hq3u765I/ubDxX
 8PuCC705T+JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxsAAKCRARpy6gFHHX
 cg2XD/wId1y4HKdHsUrX29XYKcHhJqIjLS8zAw4bFVv0RIqvj+CQcPFNw2UJSfCFt1ise1qc5/V
 He8yFAFvyIMC4UsLm1NpkgYyeZD/3yRiVoh0kVWDnxYm1ebmYXAcNFtC5napCTAYqHI80WOGlTT
 EMuCat7+ZPdRCX3/JBnYzTp0wgRftHo2f03XvXa1DgsC7gC6uHVYpgCdfKTSqM+6+JspxQzSQ/z
 8m28/fvzBESRQcHuFCAaLUjNwzcpDJ9pB88qZrVDCqDbH4p6X1zZpAx2r2sqoquPh51WGYGorA/
 ZTJ7itByBFIBFAois9/xcIYvwNe6WEoI+VVtzXOtwomeYkjanS4BNsfr3CX7i0RSMGYZnCLMV+6
 SFddbcLoTfsM0zFJ1eoMrNKab9KHOwRjRArrDCu19OhkytIkKeuqXYaW3F0gbRr7BgKd1Kt1qiV
 nGl+9Cf1rEAZ7w1s270OhdONyT2fOLVv3Ub6pAJRK+Qukm49BQdV7zzAh429jc0V8evvj3Wv/wb
 UbfBVFp8Pa8AKhczTqxU3k93l7DXrr6FHDfx54kKucDVvQF/ZcO8f5HL6qmsFelq0h1tILrsMwZ
 zNCEfrLAPbRmb77RC84sfAHKxm5irjcMBsbHnTPxjc3LU6Dl0pLRxrdpScqfNctGxToPwvvUq/8
 3yS3sy9BjzvRPFQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The strict flag in struct pinmux_ops disallows the usage of the same pin
as a GPIO and for another function. Without it, a rouge user-space
process with enough privileges (or even a buggy driver) can request a
used pin as GPIO and drive it, potentially confusing devices or even
crashing the system. Set it globally for all pinctrl-msm users.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-msm.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/pinctrl/qcom/pinctrl-msm.c b/drivers/pinctrl/qcom/pinctrl-msm.c
index bb1e5aca058fc28c3cc823876c8fe7880d66b6fa..8727b8f394a5a2669c0dc8ffe5f1b83d5db526e8 100644
--- a/drivers/pinctrl/qcom/pinctrl-msm.c
+++ b/drivers/pinctrl/qcom/pinctrl-msm.c
@@ -302,6 +302,7 @@ static const struct pinmux_ops msm_pinmux_ops = {
 	.get_function_groups	= msm_get_function_groups,
 	.gpio_request_enable	= msm_pinmux_request_gpio,
 	.set_mux		= msm_pinmux_set_mux,
+	.strict			= true,
 };
 
 static int msm_config_reg(struct msm_pinctrl *pctrl,

-- 
2.48.1

