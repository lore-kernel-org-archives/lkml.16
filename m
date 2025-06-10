Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D494628BA93
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 09:40:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749548412; cv=none; b=ROM+5ZvRE6cpPQekoHEHAcdapJgNy2Fh+hZI8mDl9PmPw73LlaLWD+8vQSftUBnKU2t2S1Cv7Kq4rxeal755rn7sUqbWDzPGnOeyaN7cSTeo0VReqrR/JuAFWhSLOvVPc66J3uXDLEy1UJ+u6o3R2vPMMoqNC3gTUJfZDN7PKFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749548412; c=relaxed/simple;
	bh=FM9+FxKhkL0fgoYqO0FEHZpohQiYjQOPgOSd5xOlL60=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nuRLmSCmyRNZzFIrej6G79EPlekk9zcMqIUxkAmUsYRN1oeDIlNBDx6g88NbINPaJulo3FlIhwy2NNUtwBobDqXjreHR3gcqWOKQetpmT6dy2DVd9IlPQbucaHO9p/NMhakIdaK/5Eb92Zec+TgAaW45Grji0mJwMEOS+x9J04k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=wlOetIRQ; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="wlOetIRQ"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so42918245e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 02:40:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749548409; x=1750153209; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QuNlufTXDsCqvE1UM2bBXJxJXmhGQd5fXcs9xnB1YPk=;
        b=wlOetIRQWz56WjDbcUNLWObevICrkNZvuf8Bv4NhSKgN68UqTS38zNhIwn6fOm3fDH
         AXbpt3Z9WEfgHkWIhZvLgJDKEzbrEldutAQb0gaphw4UB8nGcLQqvPF8E4rSM6L2XbVT
         apht2yWnpxc29zVxxAxweAOO/F4Bz94ZNIsyM5cxtCinep98CevcNL6oDdA/EPY212sA
         0/emH6Vu2x6pDgGQNnTJ6+Jd18l/79hEFfeVO+WMa84XGNh8QG7E9+EM/vTI8CHgHezh
         ypMx93JDCoeVUvieOHoy+GkmnttisAo3slwB5iJ7xgQA/nrIGiOl5DZkK+SSkLlu4Pa4
         mIbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749548409; x=1750153209;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QuNlufTXDsCqvE1UM2bBXJxJXmhGQd5fXcs9xnB1YPk=;
        b=eVxjbGCXgtE6TLabdxELRfOjeTHvusGVheJv/gwy3WcJIjSDTcaqnYRG245ttD/QAo
         tyY7SYJGQjCCB1V64PmVIuTpOV5lhleSBwb5SU/HYsBsiFtV5sddJF/OMljNKTWXYsgq
         /M2HAC3C/U6bNLkMn0ED6k/jum9EGcat19bCDqGmc5WVMJVN0PmkTKgLjDIFiS0vdEkh
         QPOaZq6tF0Ib7MJDcIm+6LIlmF5o+QZWAixsdBUCKjzLlcm2Az82fX3v9bPBzFDoDV/v
         4fC/AJcCQlOysw9Bt4GcTd3egHeNH4waFw1XHw5JUK2ALzWeA4o5Bo2hTKcBBBhtQb6J
         JHTg==
X-Forwarded-Encrypted: i=1; AJvYcCWZf6vSf8uQ+AIXTkTw2bwTSKtaBd+oJIk1tGEHA/KoOLvWq1od14aeiu2DZV+TNuUDCzxUFPNWqxf5ywI=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywp/AY8ujLV8pcFr9XwPTVv3TFy/0vrMg8c6EL0Nbi69JxIon9G
	FLljTcCy6FFYieaJkiyvZECphWPdj3JX1BvMPM5ZVKXBWwoxxZDuRmJu149d+sNbN0g=
X-Gm-Gg: ASbGncvAAJhxOMAe22AcSxx16kLIVPwpov6xmqeiRBcZuVHc5RhPIEYueoC71x0bJIW
	EVdxaRc8Xo7ugJfGiqzxeSJs8Dwi3eN9tYOtyvRbv5yb2QtRI+U4CaI6wYjjSZ0NW+pX+vrOBtN
	un5tsxq0pZ02jno0W26tHEiBHiSRo9qPkvqwDaUmiidmlzmTasrNElRWFRo/1XIyU53FVdLrIbI
	v3/R+tGsI42HBEfJBZjXnuRscDLTjN4dFz0NyUfSE2SIDHJi+FcCBd7Gs21HszeIMzp+W/IcgRC
	s+LQMFq0CyI3hRQSHN/C2UO3NoDPKyTMTVwY3SYl+cvVrz7Aed/g
X-Google-Smtp-Source: AGHT+IG+P8d/GG0ERmwI9KUQ4IgMhjLvDPM7p0ncbjo6JhLmbJaSUWNaP11Olo/wsh6igEJXujEKSw==
X-Received: by 2002:a05:6000:22ca:b0:3a4:f55a:4ae2 with SMTP id ffacd0b85a97d-3a531abd890mr12527110f8f.50.1749548409105;
        Tue, 10 Jun 2025 02:40:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm134388355e9.19.2025.06.10.02.40.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 02:40:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 11:40:00 +0200
Subject: [PATCH RESEND 3/3] Input: adp5589 - use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-input-v1-3-5875240b48d8@linaro.org>
References: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-input-v1-0-5875240b48d8@linaro.org>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-input@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1910;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=fvDEw15OiAsvKyldBKZrvmZGaVnjKoDEoEksuJuTlQE=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoR/10aQmX9TGylNk2QobRGpevvl1Uu2mKo8IPS
 oRxLGufeU2JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEf9dAAKCRARpy6gFHHX
 cuhOEACHDYOEFa1D2cvZ9ft2DaDxXLvO46Y+7oMsLv3k0kI7hnRtVkzbvcp3aWskfZqFEx8ymaU
 HwJODA2Y+qUuH6t4BxlOiUMdcWc3iagzCj+UR8Y5UX8Bk3bPq4RPbT0jsNrL4pUGMxBl2Kf7qdj
 6dR/0977BZiuV8tyg0ejAfnyY2wQoar2BiZaMm16sseYeYuOAvqauNUEnAzyLW4Pp9fHRtAH/uS
 atKEXRTpV+It8VN926SIu8eEbWJo/tH2h2GGmUjoXiT/+r8/1mfuGTD26VzkYKEKQ8hsJgAbtgN
 ZR4dwpfE/OwGTkf9dGqaY0r8rvmH4RkFWn2gmLkv5dhBqV4+G1EC49lZhGHkYFK8RjcWRUcZF8B
 Pz8hz94iae2ZhMTgDik8YbHoS43F8SMq1hRd0rXXnxvuZIaTrsIe8yRtWXs0mWPdeYcNh/eHiZn
 2rHcvQrS++MFr+YoNJvWtFiyIlNgJ2LwQHFOAGZK2+jAbvXGUNaBy3xSCxxzxjCZhoWHjZCLW91
 h9SjVrnzTbIJttXvKUZCDcAcDboQZNzMgBEwmkc2kDY0f1igpELcX5ngJ1Bls3/GreQcs27XCQf
 nEnFQ9iV0QqWG8Sd8qgliRhZBPAYCqVFhK9ExS7r5hLPbf/HvPIoZxjxA0IicManSPWNhDWgNkw
 +Oo3M5UZilcbbcA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/input/keyboard/adp5589-keys.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/input/keyboard/adp5589-keys.c b/drivers/input/keyboard/adp5589-keys.c
index 81d0876ee358ef4b521f3f936dc2ab108bb4cda3..986a789f1ec3b3599dc94e1f6cd871e1df5e1537 100644
--- a/drivers/input/keyboard/adp5589-keys.c
+++ b/drivers/input/keyboard/adp5589-keys.c
@@ -404,8 +404,8 @@ static int adp5589_gpio_get_value(struct gpio_chip *chip, unsigned off)
 	return !!(val & bit);
 }
 
-static void adp5589_gpio_set_value(struct gpio_chip *chip,
-				   unsigned off, int val)
+static int adp5589_gpio_set_value(struct gpio_chip *chip, unsigned int off,
+				  int val)
 {
 	struct adp5589_kpad *kpad = gpiochip_get_data(chip);
 	unsigned int bank = kpad->var->bank(kpad->gpiomap[off]);
@@ -418,8 +418,9 @@ static void adp5589_gpio_set_value(struct gpio_chip *chip,
 	else
 		kpad->dat_out[bank] &= ~bit;
 
-	adp5589_write(kpad->client, kpad->var->reg(ADP5589_GPO_DATA_OUT_A) +
-		      bank, kpad->dat_out[bank]);
+	return adp5589_write(kpad->client,
+			     kpad->var->reg(ADP5589_GPO_DATA_OUT_A) + bank,
+			     kpad->dat_out[bank]);
 }
 
 static int adp5589_gpio_direction_input(struct gpio_chip *chip, unsigned off)
@@ -520,7 +521,7 @@ static int adp5589_gpio_add(struct adp5589_kpad *kpad)
 	kpad->gc.direction_input = adp5589_gpio_direction_input;
 	kpad->gc.direction_output = adp5589_gpio_direction_output;
 	kpad->gc.get = adp5589_gpio_get_value;
-	kpad->gc.set = adp5589_gpio_set_value;
+	kpad->gc.set_rv = adp5589_gpio_set_value;
 	kpad->gc.can_sleep = 1;
 
 	kpad->gc.base = gpio_data->gpio_start;

-- 
2.48.1

