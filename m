Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31D812E3389
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 11:42:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749814927; cv=none; b=lbZE69Zbrn6CKil66Ai2HO+1f+tklImcaNWHNx5bmK2S5+uB35laj6jIC3c/RamXiqDL9DA9CV2gCceRE/QK/jIs7T9VjlyytC7AAiNzK/VqxnF4HuBxK6oplQG4EXvEX6g/aPWpv8tGgbecqZHO58RQ1E5z+Tu617DR/9sQJo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749814927; c=relaxed/simple;
	bh=N9EwmincliKfa+Mj4InfAX1k9UEb+FroSKDS7Tw5blg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GIz5KzFIV5/8KN18cWVaC10j5dHxGCXPwzca+fP8qugADRTIETjfPfvTVVnC6WRC+PiV8/E96IZg0eKtTQmRpWb1dkgMvpUbZuKigEhESfvUl7Nb0VvJg3EuQfaTHrGhqQ+VgAc926PHj+uIM2rySD+qinC78S9JL4Ur0y36tgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr; spf=pass smtp.mailfrom=sartura.hr; dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b=kp5alJbw; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.b="kp5alJbw"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-6fafd3cc8f9so27752426d6.3
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 04:42:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1749814925; x=1750419725; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=;
        b=kp5alJbw1ibON2Dab5a6SrDZ9iCGZ2Nf4bdRShSDrKmBRO1Km4Dd2GxERRY+45VY1+
         zASnCdxWsMjIn0EUNnZdr8j4CzO6PltJ/5KiboftiDD5mJFbXKUVEyeBpJ3U53rLRuwL
         tKsDfzynZly/EIZNa5TEXqbuNq8WZ6QtbjqXY46PKTmtPIYUcWv1iRv6QsA2iRZH4zDE
         9EXyH8bQqKY6DUaPRbEVSjmLz3ecH+i1KPXVBSgC43g9xH/X11ySjzt+SkgdLaUgnMrS
         a9QzkEJ3LZYUi24ZEESfHFEFwDrHwYaRnYVedGQgFvust4DNvenZrcd0zqnPka31K20z
         ws7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749814925; x=1750419725;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PHtJLyTMYIFfJmuax7k6vu5lhjJG1PUEv0OdzzE0zPY=;
        b=Gaf0XjfqiR8Fuq/gUKVYfUcGnMRah46R1UZFKCAF0471ODbQ1DK9a2f9KOgA2cYEAR
         e7xu/mW/j3N82x/kl3GWt3iooQLIaJ8W/nMYXMs9JNpTNWN/wvVVGZHMu+ypjwFmHKgQ
         Wg7BaDCY5D1aahnsRqYd2zysGwqC7sdktc5TJBPDWu+ITafCvCUwBcch+ci+dlKFtTNo
         IS3uZEBQchGDNRoPDJIFWfR0O+29Nst19JT2+9tWGiL6lK5pKWzH/wnhPVZ4AYcyo5uo
         wNxXJkb7kdU1bfHLYOzsiyaTLo3TTv1Dsptcptjtfzc/0lNsF6rFo4naFUhXSSzn4Y6z
         Brbw==
X-Forwarded-Encrypted: i=1; AJvYcCVcf90IW2WawjCsc9lXdATQCl9M/TXc6R4b8sUDwzk4L8Oiv1LuCZ2cfONSZXubah0zTiXoEYeZylS3YCE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzR5s/sUJ6jq0AXIBBArn5HPo0VnnQK32Cmrx7v1ep1M2oPYin8
	4YQfSgeCBTZFo82DGg9XMx0ZogiscQTS2DklQZ30T2bQ6lZbDeP+S6l/s/hYn6fAOUQ=
X-Gm-Gg: ASbGncs/YtwrjC/6Nfou7soTxivkKLIKrLhTBwBX3lpHlrWgc1/aeeh7c/hX+IXVCro
	hWPemhaZgMrgfTH+sRCw4z8QKzgDB8pNrYzeynfvZj8W+30GaOnK8QjX6GZg9mIRjTJGH3MSF9k
	ye60jvur3HwTZ8LHzeWfRnm8UWdCAJ1kk4Zu2Q3YNOeUfhwss+Fsp1aGsT8LqIRSi4v45SMSq95
	MZ6zSxToEfK5WQEuEGS7k1SPntZ1P0E8rtSIt41eNhG7wbwHxsPmijhQ1ZYaNvOEIbcd/u0LykT
	R6NUS+AicXnkIZLncyfXH3gXhdd2HpiKbwmiLcjl6x8GoTgowq9IobSQkT3RoTfR2qXH6OOrgai
	jPYv+XVTWkrJhEAIoAARURQ==
X-Google-Smtp-Source: AGHT+IFEhBGPIDsjq1frk0/wn96Fw6QfUCgUoIMTWna+hcxXY+/S62LesfKCTPJGDYw7KyfEPMYp/w==
X-Received: by 2002:ad4:5dc5:0:b0:6ed:19d1:212f with SMTP id 6a1803df08f44-6fb3e596a01mr39443246d6.5.1749814924913;
        Fri, 13 Jun 2025 04:42:04 -0700 (PDT)
Received: from fedora.. (cpe-109-60-82-18.zg3.cable.xnet.hr. [109.60.82.18])
        by smtp.googlemail.com with ESMTPSA id 6a1803df08f44-6fb35b3058fsm20558206d6.37.2025.06.13.04.42.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 04:42:04 -0700 (PDT)
From: Robert Marko <robert.marko@sartura.hr>
To: catalin.marinas@arm.com,
	will@kernel.org,
	olivia@selenic.com,
	herbert@gondor.apana.org.au,
	davem@davemloft.net,
	vkoul@kernel.org,
	andi.shyti@kernel.org,
	broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-crypto@vger.kernel.org,
	dmaengine@vger.kernel.org,
	linux-i2c@vger.kernel.org,
	linux-spi@vger.kernel.org,
	kernel@pengutronix.de,
	ore@pengutronix.de,
	luka.perkov@sartura.hr,
	arnd@arndb.de,
	daniel.machon@microchip.com
Cc: Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v7 3/6] i2c: at91: make it selectable for ARCH_LAN969X
Date: Fri, 13 Jun 2025 13:39:38 +0200
Message-ID: <20250613114148.1943267-4-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250613114148.1943267-1-robert.marko@sartura.hr>
References: <20250613114148.1943267-1-robert.marko@sartura.hr>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

LAN969x uses the AT91 TWI I2C, so make it selectable for ARCH_LAN969X.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
 drivers/i2c/busses/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/i2c/busses/Kconfig b/drivers/i2c/busses/Kconfig
index 48c5ab832009..ba8c75e3b83f 100644
--- a/drivers/i2c/busses/Kconfig
+++ b/drivers/i2c/busses/Kconfig
@@ -414,7 +414,7 @@ config I2C_ASPEED
 
 config I2C_AT91
 	tristate "Atmel AT91 I2C Two-Wire interface (TWI)"
-	depends on ARCH_AT91 || COMPILE_TEST
+	depends on ARCH_AT91 || ARCH_LAN969X || COMPILE_TEST
 	help
 	  This supports the use of the I2C interface on Atmel AT91
 	  processors.
-- 
2.49.0

