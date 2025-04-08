Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E85727D797
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744117155; cv=none; b=qIXxvTyXqnfTkaXpA73RDW6n10t17PTfsOneIifvjn8z+a3ofPx8vADsVeS6bqkLdi+cUfsV2AdE622xddNGekVw5m2F6bX/prlTN2tMTn7ghWh/1fVCh6mQujmWPFzF9XrfLBv/XkhAlMx+lL1j7WIhbrvGzqdZK1W2Qd66Tdk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744117155; c=relaxed/simple;
	bh=IzWYJUDQ/XBumh+fKJa1sfGL2u5AW22M+59B06K+hWg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lfIZdn1kPv8+FALKAN7jlrebN+zklWOegQY51UaQrtxlXcmzXqjJ2VgpfwmDJ/j7pLDiqaf1jyPF6RfivS6tHR3gA+F/03aHXWq+XNKGWcsnli3DfccZYTTP76RFfC69+wZ+qvSKionXxxyEEzlJgROwzR9Zzk789RlCTADPYkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=bTDyssoi; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="bTDyssoi"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3913958ebf2so4879813f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:59:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744117152; x=1744721952; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FKg8iBYJb3uG7xdSQHAqRwZUKLSX1itanOGkZ1grlXQ=;
        b=bTDyssoi12l5yN6N2Mwq8KLU9nwllSht8xTAkkvEcadjzJ1Yn0BcjRUAr1LKjF5k+w
         8avkDWaCUF4WQQioDhyG4cs8hF4YjKh9M4DvbwoGgwHjnrIto6dUnXyLlmuZ+bOH5dqD
         sS3FUKhLP1Rzu6l27PD3Wtx2D3dZPFzzzZGh9yEKEL+XLZztQ5BiTUvPWYkP6WX74PJW
         wi2p+HTx06jqCO3ZO6tVxz1F/U2dkrogiCwb4rofMxJ/M/ZMQFxWm1t/04x7Ab//IEBr
         jmfEdE1FI+v9ztjJ8NLI96Tmsl3JpKe5EfBymzPNoBOCI5U4mQDg6v+u/2Dz6Smfy45U
         EMMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744117152; x=1744721952;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FKg8iBYJb3uG7xdSQHAqRwZUKLSX1itanOGkZ1grlXQ=;
        b=kP/Hq4MItArv403Rv/8/gDW6MNVF+uI3TRqacc1fMqx6IA443g+o4yC0VUBmk/yT9z
         DpHMXWF5K+Cx25XEsxmbtFlo83K5MvR2JIDF/cnewxMQwKmzuY2TvKK8VskctjoS3NE+
         PIDQPQ8v84ULASMbg8ydzk+qSnCaIKHYR1KbXDZ8lzDV6OBXGw7UxjNLCWok41X6ccCX
         RNWVY2K2D4iOH21vrlyQxiVpO+Ixz84TFngaL7bsJuZYs8vuUcdTDEe0N+RCy2uxNcUv
         0pjDsCAHVEyzqB9/HeVNPJgg3ir4bBv6ORP5LZ0oawTVoYExn+9pMjovgJnh0yO5AA1R
         RlHg==
X-Forwarded-Encrypted: i=1; AJvYcCXcjcbMpd+l9oF1+1jH+s+b9S9Ujoj6h93sgNRJpj5WILs/rNOAwz90EVJnKM30ZoHPxf9sgOkQux6OPHo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQGNyljmi1PM0W/JWrBHwqY65llD95rCjidZEQTqiUjqySotsK
	wIol1QPbH/TpVh639Lxi7eIHW744HVLg4xbZGe/+nGj9K8psFRAW8SuZxoBI/GeKCLccGsaTIZt
	SaZ4=
X-Gm-Gg: ASbGncv00D2B8uT36zJXAL8tmWvZRta2jM3IA+6iJyGeblzH33rzL65AjfHjiLaOz0j
	hEyI+e6Z6Nws34abC+9k+x+rNMK6BDnPdldYwjdc/9G9jylQwL7UjtUcHFL4W206cSoP1yNfPqV
	uMZa4MoCfUWYO9sO+FohfZrXuH6qDLwjadDiUItEjZCdoK1xhC9uN9Jn9GZTXKPeej5pAssnqIs
	hf1Tcq9Fpt9G/dUDIpOXX8RxjgkLVrRQHwCoEM8s0zgvtuO6yLuZmsDTCSiEOcrEjaFQZEgc5+c
	LPcMTEXCIR/h2duNK7A7AIWJP30bBVaDd0GeNw==
X-Google-Smtp-Source: AGHT+IGOLh3Fsf2RFQ/S09YLaN9r4OLPWYtBEsNRg2AJeLgnOjzyFt0fdLYGlZjQY1u34FIiL114OA==
X-Received: by 2002:a05:6000:381:b0:39c:1258:7e1a with SMTP id ffacd0b85a97d-39d6fd54a93mr8763859f8f.59.1744117151770;
        Tue, 08 Apr 2025 05:59:11 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec16a5776sm165820155e9.22.2025.04.08.05.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:59:11 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 14:59:04 +0200
Subject: [PATCH 4/6] gpio: rtd: enable building the module with
 COMPILE_TEST=y
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpio-compile-test-v1-4-140e108e9392@linaro.org>
References: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
In-Reply-To: <20250408-gpio-compile-test-v1-0-140e108e9392@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=632;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=iv0x4W/BfCPRkisezbu2lJjlQcv2GM/LfxV4rBzChhg=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9R2aW5rmbgovnrwRRlttBwuhdy41U8E1y29Ja
 LbOnAtJip6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/UdmgAKCRARpy6gFHHX
 cnu+D/9XaFHuXaA6vmYtwHZFN0beDnegfw4n/7cf+NmUgi1EcJtipJR59s3m6/XW1qxTqK0dnEG
 U8RkdRRC3asOUxkjkp1kSwIcF2vCrJ+OHjNmFPACuGfhgPgBqPf3TUXa0ibMGjrn2iJSAHhNou8
 ArK8Mydgdl8eaxzy81tV2CpkEb4GVLq5EANXstXoJDPXkb62BF34s/2Oa9s0KhCZ119X6fZOMMx
 RVde+bV5Z8Hq8jw+iZ+jALZGn59UBg8lw+ZTYV4KG5EvM171YykNbQsvFfy6KPFNjG5cddLsgPS
 fDbmcuKZ4RigndPUd1XQA6+k7bpYH5unGEpHnbSZtjUGyk42KUSZ4yp9dPGmsmp1wB4pKdZqrNL
 4NayWoZo1fnn7XYJwzP4/aL039yuQynwcIShf28h0r7vcgEZW7cVhgBx/sTRBaCsEfOdJDIOx+E
 9fAzTDYkWqkgCvmi2D/pxqrzh0RP4Yp8wFHfOwi8V/Ee4pltlI7SsgtRGFV7b3I1b5dI/0mpAZD
 U40oGvd1TFzeaMpluEDuo8zOnxO3vBIaas3Vw2Yqx0l3oMiWpVzwbDYSnLS0xucqWwQTLbs4liu
 eEN+G6N1B3VnW+1G3yxcwVJRwSNwh0oJg17IzJMyvC6Nrg84dnxo4dsFDKfylU7lGe+HarD6RwL
 sF/l4JIRsAU89pA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

Extend the build coverage by allowing to build the module with
COMPILE_TEST enabled.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpio/Kconfig b/drivers/gpio/Kconfig
index bb03457afa72..b0a689993bb3 100644
--- a/drivers/gpio/Kconfig
+++ b/drivers/gpio/Kconfig
@@ -604,7 +604,7 @@ config GPIO_ROCKCHIP
 
 config GPIO_RTD
 	tristate "Realtek DHC GPIO support"
-	depends on ARCH_REALTEK
+	depends on ARCH_REALTEK || COMPILE_TEST
 	default y
 	select GPIOLIB_IRQCHIP
 	help

-- 
2.45.2

