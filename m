Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B5B238C20
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:20:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749568845; cv=none; b=pLJpSpgejmkIbsu3ZNl8nPdL32XJRiuFmMBA+TO2jhs63bP/XLbM1gtVfc3HG1ThxyrqkBYn4m+n0bgJviL0Xx6JaFoDbHaMtc+ZZd+GfJR6SXkJA4pwtKlZQjw0zkx2K/nX1I6p/Kr/mgI/jGMoKGVyPCVEvNN71ZXICeMCHcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749568845; c=relaxed/simple;
	bh=ntw2ey008iOZHteqPhoBSfK1i5W77BNCidxaLvGyUlE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e8lecVy+ic+WKUHF3CKx9Zx6wCKfE99xyELLP1jJ2IXrBMPrlQmi6+EXJUrXAUd3Y7l7kKBDgRKWxndvaGA9uGS6Ju0Z2ewAspd2NVCGsgcgjJ3XNy6A8fE8injeKn6ljP03TD4NA3EAybu15pwjwfRSc90C8/R1+WeH2J3pk+Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=QwptGVlB; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="QwptGVlB"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-3a4f78ebec8so3368226f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:20:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749568842; x=1750173642; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pedIUwRN3D7qvw8UIlmZrCckR2WX2CSjcTaVtRgsTAo=;
        b=QwptGVlBEOrRqIu6eRVjsM6I7FvWnkoN6lr/naJSI0myd2odbvelbWQ3kmZN/axejr
         LKkzZDO41p46Lm4yzDpaOHCvXXcMGaYKtnP+XwBeYMz3y1GPVyzrXQQauvNMRnxoSA1Q
         Zs6kWjSlvKdgj5my7BVjq0XhhC5PrC3mc3dpk/fJrnlAonurSikMOzTwFByEEn0wcrQg
         uozEeyzSFVV+AOI2GJbXF16V/r+ylI3m0Fin9g9Yy+JhnamScgOTPVE5yfV32pmBYXqZ
         c8tU6o17PPbhXsmeI0o7iQqttPKNHOoOtTG8JWEdpCE1PS7RdIHCxfBPnEijTEPtm0/n
         AOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749568842; x=1750173642;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pedIUwRN3D7qvw8UIlmZrCckR2WX2CSjcTaVtRgsTAo=;
        b=XpZpzmJIfx+lKJ8aEVr92yKTVejH+6FoCTbjgQccNlpLJrIb88MN4BOciLs0PUJHUy
         SOaxB5igqelFtDEVo1hevD7h4M9axVju3kYcbNos1VxdHkjdM/edT8Gim9kKTHgumF1u
         02zqV0bI0rDhxPcSgDpD7s/dOnNAVY+cG+GoPAcXGrPrq4QjMkVp8UwuWnMRg4sEcf9+
         ynkgMccQ0bDjx3nzbku88VuYgDBEM/feo03vRRSA5pKnCY9XaszpoY/N0CEPEz59la0Y
         dgARe5LtiZprbZ8QiZqJ+4t+hKYrGT62r/KxMj88XcwCePvC99PwI/vOhQkfsFEgkoZ7
         +Nyw==
X-Forwarded-Encrypted: i=1; AJvYcCXmmTmXP67f4UIwgZD9FIi4Ets3d5e+hIGdWDLdJn2goVZHeOLoHkfOCmsKMRoEjNJFOT0/y7w208eJjkg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyxeowo8htu0w4xozxDR36CY5XUkKU2o5pqS7IEcty2z2X5tLfb
	EwqWgJELOgMwr6yZNRLBKk0czs8G4N70U4BWrDxQQpH2YpwRdwMV8U4oEz0bidDNzyY=
X-Gm-Gg: ASbGncuW+DBCy9EMFub2M9Nv9nvoPXoGgvG/USkjxCyMcDLfESF3TkNsBEslvpeDPsi
	gLxw+a3GX14Wdt2QPBDC2+yPI6NRnjCPNGDtZC7z+ZBjSWFFXbSPXFp8r6i7dyI3xx9wkGhChZ2
	RnoPkTJPFLpi+LAuQbfWQ7vjaM+Xbbbbtd7WxHEr06DM5aAsjRlvW9jFb9jlD9aY3dqBfscavQN
	X1eoZ2ygnBxQZcqX9fZ4bWdIDlt/ZyjRREzSccowuhS4OowRYc1o5kth+/vNDO4LacR5gPW8M13
	IN8kAKAww/mZD6SDtm74LE5I2Gjybb983xd72VjcoxarTfuGUU9Kkk/VBYtGcAfcypHOS7U=
X-Google-Smtp-Source: AGHT+IFDGGWE1z6DBNuxPQdlOoATNSHUMRrZOzpLgsWsb9C2dYFqKHbu0/aBJ7qfKFllqnf+O89l6w==
X-Received: by 2002:a05:6000:4305:b0:3a3:ec58:ebf2 with SMTP id ffacd0b85a97d-3a5319ba2bcmr13714922f8f.7.1749568842105;
        Tue, 10 Jun 2025 08:20:42 -0700 (PDT)
Received: from brgl-uxlite.home ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213759fb2sm146708685e9.38.2025.06.10.08.20.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 08:20:41 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
To: Rui Miguel Silva <rmfrfs@gmail.com>,
	Johan Hovold <johan@kernel.org>,
	Alex Elder <elder@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: greybus-dev@lists.linaro.org,
	linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Subject: [PATCH] staging: greybus: remove unnecessary GPIO line direction check
Date: Tue, 10 Jun 2025 17:20:36 +0200
Message-ID: <20250610152036.86099-1-brgl@bgdev.pl>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

As of commit 92ac7de3175e3 ("gpiolib: don't allow setting values on input
lines"), the GPIO core makes sure values cannot be set on input lines.
Remove the unnecessary check.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/staging/greybus/gpio.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/staging/greybus/gpio.c b/drivers/staging/greybus/gpio.c
index f81c34160f720..1280530c8987a 100644
--- a/drivers/staging/greybus/gpio.c
+++ b/drivers/staging/greybus/gpio.c
@@ -192,12 +192,6 @@ static int gb_gpio_set_value_operation(struct gb_gpio_controller *ggc,
 	struct gb_gpio_set_value_request request;
 	int ret;
 
-	if (ggc->lines[which].direction == 1) {
-		dev_warn(dev, "refusing to set value of input gpio %u\n",
-			 which);
-		return -EPERM;
-	}
-
 	request.which = which;
 	request.value = value_high ? 1 : 0;
 	ret = gb_operation_sync(ggc->connection, GB_GPIO_TYPE_SET_VALUE,
-- 
2.48.1

