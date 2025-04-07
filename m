Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8718225760
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010001; cv=none; b=IQLKOg5kAaW8mzCoU3tOtEKfdPKy2/7vf5Q7Pa32N0ahfjzZQ6HoXX+dy0lJP97SyCrLRT0tz6MQuV5zsN80ma35XdGV67U0haoEIxdn3BddMj/9+e6bvjUd9YGdYjI2edAyeCIt2vp+dgiVrmfL8wMPkHI7wFpMYgEhwZO4It4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010001; c=relaxed/simple;
	bh=3UqRWBNBXZo/ZeZgdiat57DVN/jGiDxmQMa8wMm3mEs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YmJrb8AWb1E1G489MQ3EwiBHYpH4Vk29QbTbysqf4OTv7/y8Swevn1W0P6IPD2ICNqxycPj9od8UmZREkHI1KFCboUG/8xVVFPcDeCEHwYs5W/+j1Z0xKK+Mnn7Ph+k7qxc5PGrd3cA2pDTh3VqHbr95zqqVCuiOfwUKYk4Wgr0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=IdPcTtiV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="IdPcTtiV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so20697975e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744009998; x=1744614798; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=g1fP3xcbZWM3sDn2ueQ9yrMymsFb75Gu1/jl1pJ8LTw=;
        b=IdPcTtiVgu7JlkSEIrOoSX9S0r45eoTQzC/eQnA0V77LzBDWGq1H8xEHOh40AHjTNb
         ET37NePXzcr/KkHMcXrOge393dSSURvNDhVFe+ggEgSYo5bzm85WIzryxHwYe/Kv/GSk
         2fF64N9dgt7k+KcOB7sR6VTci5GEm/seVoJBNErUHQ+L3F0aCoHXcSBv+4p2OQJwNSSv
         7u7n7nekkr827OxDgBFFM05Yxh+2JFdl04NBHrU2CwQGDqOb3+fhKtXX2eG/RDaiL0Cs
         l94zo4mUveByPOneXmTjjIGcb7YbisHuzUjKPDcNNGHOe2tpyGTXFL+MDb3yX6oc7/ja
         4/Zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744009998; x=1744614798;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g1fP3xcbZWM3sDn2ueQ9yrMymsFb75Gu1/jl1pJ8LTw=;
        b=DkGU7cKvZ4S/KLb0twnM4nwAXg3zTy4td3s8z/m9RbtYWvWDDv33EmAiErgRPzDH+q
         rTJLpJefRM+mki+ZNAZIeX+4hd16XSyVYK1GjdG2Eq4Ql3/ViTjtUZ+p7AiWB7rFZt9l
         TfxxMsvTPm3lDOJvfpM5Gz7kk+sQdoVdXo6JDPBeoT0saiE1q0Oz9VMT58ox9WeYUibT
         Gc5+iC9QyehjOMytERZJmpND048WOfQVQ0D0ljoLsTfQN+OPSDnETtK+lUNnMstpxivA
         C1bXiJ1OC0KeO63t4trJ+KNDXtL6NbOw9KYZleeF/Q65S8zydBCXIjIyUr1RaJgzKitd
         930w==
X-Forwarded-Encrypted: i=1; AJvYcCXDZlS1+en+kPixttm5PYKaimGW+48KskdO76+gYSgworNKG3+kMj1P2ZRQjiF+dXHX8oL8CMuVv2HzmLE=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo/1RvQGHGhvL3lMnI6RCdC0hKQR6pYzp7tvEn1cjl+lV01ySl
	NjufYdXKyl1W4A7y4gzt9caLe3wJ7ska9grDv1dSFhGwmKMmkLFqUMm8ONR8tRk=
X-Gm-Gg: ASbGncsdrhQNb23s+5H5XgSy6rK9iQ1sGsaowcgyXv/C3owh49r0ceNgX2U+QRZEv3D
	bNI4HPPpAIYFRPN4SGpAj8471lLD2oSY2uZqPmG2FPecLryVBg8/JjLCBepBLgxCLxPAqPrIyFk
	s1KgbTEXutQKu6Tjp5AVwAHDUt1qaGkPanhmvb5P5GzBy6WqPgU3/AzBObpDKJ0hGvEEhJqlOvK
	c+A7o2JfSAnourXOLOLoOHsSOVNDnCC6Mqsb+hnU25wSCbVKABn5iL5nMbSzJwYDepkrvWXJveP
	iksGWEFJKcpfk6NoS47eZL1C1HbjsKDw98bXmfJHW3kDGyJt
X-Google-Smtp-Source: AGHT+IGzLgILttDxO1B8ID6ZmYzo6UknUTAj6YgLYVfn5lH4jvVbwUel10EFxuC86rN+5EElsQDGrw==
X-Received: by 2002:a05:600c:1e13:b0:43c:fbbf:7bf1 with SMTP id 5b1f17b1804b1-43ed0da49e6mr130036885e9.30.1744009998188;
        Mon, 07 Apr 2025 00:13:18 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ea97895e1sm145267115e9.1.2025.04.07.00.13.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:13:17 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:13:12 +0200
Subject: [PATCH 03/12] gpio: em: use new line value setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-gpio-part1-v1-3-78399683ca38@linaro.org>
References: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-gpio-part1-v1-0-78399683ca38@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
 Peter Tyser <ptyser@xes-inc.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1477;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zoMPRDHW7Y3vEjectUVkjXPywBkkJrvFak4r8W20jMQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83sIVNSgQwx43danFZuwlKoFhMjhiY4tXyr3K
 hPcVKvFHrSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N7CAAKCRARpy6gFHHX
 cjyrEADFMysjkLjIc4WN+B46gtwK7IJ+YVCQQCJApl4/0aueqbNPycaFo8kpJ3MlEQABIFK//YC
 mPYqV+EPiI03ax66V45tvlBnBE4elvx3DUeEvur/yjdOAGJS40SVXUBntZlCnuCuRzHC96vDNcx
 5yiV41OIBqFD25ocDJxlIQTnhzfb5usz3+t9bkcvbah6vDS4sHvbxrre+67+vIraZQ58GFE0Jpe
 IjQUBSkZ2WaA0Uq+4d7HXY9TYEtJvn2nzVwSgyMUQi6iUKG3bxxt/PWDHj+BSIhUOk+AJgRWe63
 NNeT8Loi4x5F51xpLgFXHe2/7BrSAZaUQZ2H5YizUY5cR2K7UfXywccY1FUlGl9ImUqV7PnfrFm
 S/jdAWb9COZ1rkCitxYVX1bEb1Un2DujKjPQJLMzn1HcWr6iURKwXTxTKsjIY+xPG2pecEIzB3o
 EPnNfFBtGbjvsSaCGDm06EiD4V0o2C3BF2uu4LH7BpQlzuYa0bDjFOueCufLBFhPRWyjOQlUuKd
 mEZS8chidh6g8GgwfWfOPh+/eT/19cbCPDi6LKp4+TJwlAoFY/6x4XIsAYpNXENGItGQHAZdxUS
 NEDpumQOLGrDleqcTZwv0xiajhTebODEPE/mzCbAj0Cj9RPyY38A1RuAvw0pTficQbCASosENsf
 7kxItCqcsnjKYew==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-em.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpio/gpio-em.c b/drivers/gpio/gpio-em.c
index 6c862c572322..857c28895131 100644
--- a/drivers/gpio/gpio-em.c
+++ b/drivers/gpio/gpio-em.c
@@ -204,13 +204,15 @@ static void __em_gio_set(struct gpio_chip *chip, unsigned int reg,
 		     (BIT(shift + 16)) | (value << shift));
 }
 
-static void em_gio_set(struct gpio_chip *chip, unsigned offset, int value)
+static int em_gio_set(struct gpio_chip *chip, unsigned int offset, int value)
 {
 	/* output is split into two registers */
 	if (offset < 16)
 		__em_gio_set(chip, GIO_OL, offset, value);
 	else
 		__em_gio_set(chip, GIO_OH, offset - 16, value);
+
+	return 0;
 }
 
 static int em_gio_direction_output(struct gpio_chip *chip, unsigned offset,
@@ -304,7 +306,7 @@ static int em_gio_probe(struct platform_device *pdev)
 	gpio_chip->direction_input = em_gio_direction_input;
 	gpio_chip->get = em_gio_get;
 	gpio_chip->direction_output = em_gio_direction_output;
-	gpio_chip->set = em_gio_set;
+	gpio_chip->set_rv = em_gio_set;
 	gpio_chip->to_irq = em_gio_to_irq;
 	gpio_chip->request = pinctrl_gpio_request;
 	gpio_chip->free = em_gio_free;

-- 
2.45.2

