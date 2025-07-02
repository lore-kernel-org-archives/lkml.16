Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943CD158DAC
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 08:45:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445945; cv=none; b=U3OAcd0XS7YYfOowxnghnF+ymrWaGTFMUXzHLXwb/f22sjzs1ZKHljpFS09Ku9Bi/0nK0A8PgZ+aXzS6z9Xv72sA7DUE4YF+7WSJ9WhovKGgv3JmxTJiavfk27BOtQlQIqxcilq/Vf/0fwqh2KBWzJ9EP1KwfdrpHs+cRmZkOs8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445945; c=relaxed/simple;
	bh=4eNoEGYPEAvMXGMHyppT2sA734wCqZlMj9KGAuScq7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UNA7SZnMjKB1dmnUwrpwIRABtbR4Z8y7hd8sgluV8ERdZHaHCKCnCIc5dpQdIVgYVIvyiNay2N6JrR00M3WDuHTRV9rKWPQWVSzmjrGzzcQPeCDPZL4NJmnRO3K/EB3Y41cMLef6K40ARUF7zSiuaAabd9un4NtZjCHkpLRpK78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=XSAmOdkb; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="XSAmOdkb"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3a6d1369d4eso3608006f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 01:45:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1751445942; x=1752050742; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6hyBpvkXpsdyLCbyc77Y+t4FiY7HzT+n8f5AUiNbkS8=;
        b=XSAmOdkb0iCHxvWPGS2+g3BI3AkPfSHOBj7vWe0K1/UBWGytU/A3dCCpPtmKZlU82X
         K2snVrjI87anyvoommt8K+D9vFb77d2qEs4Kd3JQC/Ci2Sy4ei97Ge2H2Ioh9SawaU6k
         RcBFogiwJZOn7xSaoNcOBvP1i6v2OLkA73e4gJblh94lTKVKGLDqJjnUECh0OMfWRW0c
         d67iomjCzXoW922hbad5Id6soVV3xRfuHVKuswFIx1sK3n7fyZfg4oVru69OsDWrMr5V
         OVvwPyrSU/moVrlT9EgU+SbfFt7pmr4Z1KhT5U/VIeQ6teN+zgpF/qY/AC6h7Q8eLMgx
         tA+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751445942; x=1752050742;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6hyBpvkXpsdyLCbyc77Y+t4FiY7HzT+n8f5AUiNbkS8=;
        b=QujRCeRErSLUifgg/6c43sMtxJx/GXYenHyOl98ipGeJNi/N1mvMflCAJjdyQSfnXV
         CLmVLoQ2HsuwSRfaLpyt+RbkXwNpJ9hU47z5HMuwYs5q4MVTeORb2ayKcOcPn/9/1SA2
         Ue1dLJY/TUC9RhV0PX2Qc6k4LjZjcL0JdMLKKxsfJpHLQnrU3Pchk8kFUPyL3MoRcYRP
         vSvPXNhjwd5HXNpn9BX99QKpub7GnQEKBfuRY6rPUbIeY/8fHKtGkKjBLZpoYhD53c5K
         9muDh2KbMjSnJeL/YpBB/6unQlJN6b1yhOkAUJ0wTeRmsHisLU+OBZLFBNQIkWUwKUav
         hz3A==
X-Forwarded-Encrypted: i=1; AJvYcCXmnha7cUcC4s5KROheP7vtr7z+a51Bz4H5h3eS8uB2XcPfwP8dn8kjkqj0fldBegiX66DJSWoc+D0oYdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzfAZ5SKskoh0sw0K365D1V1V1bWG+Id2XG8FYVRfHlSLj0HZrE
	0rytr7UnyIhFtKCU2W1z5HlwA3SAEneJn4oZNuWMrkYB9n+q0UHPNsKhUF9LY+Seeyg=
X-Gm-Gg: ASbGncskyndc3RK+oOUAub3KG8fT2URG4cyyFe1lBZFnMXtJFFOJvRvw5et/DKsT2VP
	sKa8CWfPwzMNHBFJ7UzqX9MOLgivfzBxWX7dkNiLzBBl3Ce+W30K+/m5AotyeYxeY7MdZItah+O
	b2X2aoFGZMKu61ecYws6H5bz1LQ+cG6rYm+aKngSiVEgoRY0iips69ODd5fbnr8GuSxFu23zGyu
	m5xMBeiarj6kFlQ58obeYCttLhnNRI7PJgPvCK2Kx8dKT37HsuUece8zap5UgBqwcDyr14dm1I7
	fjJ4Le4tqVFUsVcQJQ+sSRtTS+u/WWDBcmOkj8LlAEPiItLFI4NOuA==
X-Google-Smtp-Source: AGHT+IHJb3z8M860dK3fs2rS4Q0akrg1/3Gw8aQy4UrD9Q8p6MNxb6Rzpc3c2JwhJLChEPk7Vbp8pQ==
X-Received: by 2002:a05:6000:41f5:b0:3a4:f722:f00b with SMTP id ffacd0b85a97d-3b1fdc22160mr1402479f8f.11.1751445941970;
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8827:d0e:25e:834a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a892e52a26sm15620571f8f.51.2025.07.02.01.45.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 01:45:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 02 Jul 2025 10:45:33 +0200
Subject: [PATCH RFC 3/5] pinctrl: qcom: sm8650: mark the `gpio` pin
 function as a non-strict function
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-pinctrl-gpio-pinfuncs-v1-3-ed2bd0f9468d@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=893;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=jRdYxCj7D4STZwFqPe35Zw19hML7V+rAMKmzg1nGymI=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoZPGwugmFNm2faShHzwUW2ioHIDM0QHXxYXhBQ
 cEfPt6JajyJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaGTxsAAKCRARpy6gFHHX
 cqaHEADW2WyAalEo0uVymxsrwbmVC7EBQCEm3JVHFeIGx9KBJv00oeqEpBN3YGiOC8bx9sLcP+q
 SDZrt8xcnOoZJkZjp0jOzvRITM+KQUFCEH/IWbFZk8+IsdnooEI810bUnxK31paCbJQ3kB4GcxC
 yP0yGWKNAGjAqGeGUdteBQAFMkDt9MlYJqB7NGzy1pa/fzFICTkQzjO/LQ0RFiilIcYkTs3/N4u
 Zh8ZwKeZa1LGCBfHLOCqfP+Df2Kx9UmNveHuWjhBZ6a9w04mjwvXEoHMZ13wqr4pb0l0nBKmac/
 a9UsGe1TrPD8BaS3bM1Md3CRkah2qOmieCB2M3Q+Vs4wclifXFUTMtQ4U3ZxoY5tEGGmTa/oBWY
 u3zKgpVL6rXI3rOpLgc6nG53fvRNAqH1MbE1LVSL3AG/33CQd4lOlNE3rDKDfvMT7eNkRA/gd5P
 ksFKpwVo+uWhpt1JdOsPNMXmKRfJ0t+HpREgwF2SH39ga24cAkILm10b4RPp/FLW5U6C5Xk8UGB
 CIoQB6MLtMOLVL5TlULcuTNFdkF0hveBB9GgExczGYbVayh06LLJndx/xJcXYCFGQgsAJ49L3GA
 30rdLrtAwM7s2AhflMuez0Dnpx1p6sbCYhaG9y3MuoRcpnslNHsOQ11msg0Ovg5bnf46YMy6I+3
 Ca+EdcsC5CmCh6Q==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Allow pins muxed to the "gpio" function to be requested as GPIOs even if
pinmux_ops say the controller should be strict.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/qcom/pinctrl-sm8650.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pinctrl/qcom/pinctrl-sm8650.c b/drivers/pinctrl/qcom/pinctrl-sm8650.c
index 449a0077f4b10666ecd9dfaae8e0057a91e181a6..4ab0e75079cd5dec1d86835dae30c9a09455c7f3 100644
--- a/drivers/pinctrl/qcom/pinctrl-sm8650.c
+++ b/drivers/pinctrl/qcom/pinctrl-sm8650.c
@@ -1328,7 +1328,7 @@ static const char *const vsense_trigger_mirnat_groups[] = {
 };
 
 static const struct pinfunction sm8650_functions[] = {
-	MSM_PIN_FUNCTION(gpio),
+	MSM_GPIO_PIN_FUNCTION(gpio),
 	MSM_PIN_FUNCTION(aoss_cti),
 	MSM_PIN_FUNCTION(atest_char),
 	MSM_PIN_FUNCTION(atest_usb),

-- 
2.48.1

