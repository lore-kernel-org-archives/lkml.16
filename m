Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 486BA261587
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744096877; cv=none; b=M9R+vryQ09ZomgHeRcVhUDovpEX+pKxddjjWKxGmeqPjXw2SP5tSmCEqep++33aqYLGB4BUvOUbZJLFj2ZEEvj6XuzJJh8zft8B9XnhXyQXhIsn+b2FtIxPAXVx4ZSrX/DAgN0FVaibJvw4Om8+dvYxsB0TZVQdrpS+E5citKAI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744096877; c=relaxed/simple;
	bh=PUo56Q2yzjhFctr4qJbBVg4rRJDOKkYPse+T2INVimA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LL6Gb/El9m/3ACZJzKHsxAsfXksuM2ueS3vFG0/JyX++lIO/QisszANVQZ6H9U3dM/gkBDh2tqEftfVKvCGRQK/SskKGKfmFxFD0Fzktv89S+1Bi98MceLTQQTmyDB9IHXUhU/msJyCV6bJjhd4V7Q2u422AsTvA3hySL9Xf4bI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=v2zFM1d+; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="v2zFM1d+"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39c1efc4577so2831156f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:21:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744096874; x=1744701674; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
        b=v2zFM1d+8ZszMR9EihxGe/FBGY+JPPpsc+/6nzozbkgMILd6UOc+i0vd0+p88oPn0r
         lrk+psdo9IF/lUl8TRA0u3sJERmPfbEybrPRgP80FCPNtGcEjGNZkEJMMxImY3LbNYUN
         8QKLMwQ+pkFXEXi1IqIr80qdu5fxpH35UNKYtbE5UgUgNJq1cUpacAEcvRTZ9yHbl4x2
         X6EzBRpkUO/dTZ1KxIX8zaIeMGsFlfEsv29CFmT0WYy+6S7y+Far1Bm0QDDwR5et2g+w
         nLbmQ131DuBcIMS5YDGMOEcE7CqzV38EvyzQMvGCuAUmnOG/HEfU1ZN+Ol8V6Wr5j0wd
         1Liw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744096874; x=1744701674;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9EKgQ1cgxpU6DSJVVu3CokqxSFGqHBUMN7AY5XSvKwI=;
        b=b7/uGQA/EupZfvfuUN3dTK/T/Pfj25CrQF9oX9g1DZIlRDX0CpYx/A0RPYQ6gVKfxo
         j0IwuT4eZd3phNhqejL5n8LJhAcrOfTVXLz7qnLADKOSh8rRuM83zCld6+yMSvo9Sqle
         +I/gzl7dofB4Q7elfRmxh/NLpbp2xPSCLo8DcjKTZwxxw+a1wkYJ1NIqobbNisjQe+5B
         GPju+bTBUw/mUUNW8E1uIQZ0jSKtZszATG3MxYLJzVv18CopY7VyO91XN5P11LVNdNmn
         tPIdk+AWl1RAsCVf8E3jyFiPprzg87Vr+QH15omqvqmBmFpb6T6QVNo0bq42KtWV4Mv/
         Izng==
X-Forwarded-Encrypted: i=1; AJvYcCVn9N+XppbegBFyrGpyv40v3zfvYd2uBpmfPc6vcgRyOmpitzxLfUYkiX8BPFa7gH/0zVliHTnXD90Xcxw=@vger.kernel.org
X-Gm-Message-State: AOJu0YznRT/16bK7Nm+RfFNBkXkpO9DatDT6s58x6DmI4UkSL0TlCunt
	D7hU42rspN/g4OCmIaj0oF8Rpi5nJeNmPVIdCxv28+w8PHQFX88v/kD+x0Bxszg=
X-Gm-Gg: ASbGnctPz8J2vlDZzqAuF1WHg3Y97ufRIbSAAas3KBWPC4GFExvSP/cdD8rcn+arDiF
	vuDrB1CEefjuDl11Ux45wzuT3MpC+GMo/o3/senbTuWjD5ArkF4efVjNcs1uEwRY9hEnaC67Dgr
	XfC6VyXIrL0GW2Bgy6BUHnktsv+H9y6CldUlkawz+pZ1osySe3gGgTkWVzNUucLOzDHw7kgamq3
	9Vta7bGvk6bwIxcCsCfH8ky9klWYb53m2qSdeEsU/zg+jBkvBjxRRhccVV7wStqYUtPCLDmz7xB
	yw9qndzmOdfZ9LbA5yruU4P1d+fIhhPKPNKTlw==
X-Google-Smtp-Source: AGHT+IGfBvpH0yFkliZLtXlbOsc/im0FjsnYwDk1DO3Fnkg/Amyk0+BzHkIllruNLf+k0vJRb3h3JA==
X-Received: by 2002:a05:6000:40c8:b0:39c:142d:c0a with SMTP id ffacd0b85a97d-39cb35bda23mr12921572f8f.19.1744096874610;
        Tue, 08 Apr 2025 00:21:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec342a1fesm154404135e9.3.2025.04.08.00.21.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:21:14 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:21:10 +0200
Subject: [PATCH 2/5] powerpc: 83xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-powerpc-v1-2-73dc1ebc6ef1@linaro.org>
References: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-powerpc-v1-0-73dc1ebc6ef1@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1493;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=T4A59REGiz5eXob5HMd6JwbPWhPT8lTp1DmdLIdpCvw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9M5mXcX7kY466l0OiK8NIg5nd6PegVrBTz5Aa
 R0NwF85CWSJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TOZgAKCRARpy6gFHHX
 crwFEACOditebqDnaphThATlEMjgOgAWyDQeAEeb+QxdPhrDCGrM945fOgEEDGXhJGdoD7do5iE
 Hz6qaTwsLtEacAQodx1V+cgO+UD/vFMjHmaZZ3Bg52U+0J/qzYK58L9l4koz+PARYWiDbcNmQIx
 yu5/cZhXO+enA3bpZPQUcKmDtfOujhymNXkYMzBfZVv0sBfALvPPkv7c15AOlCtwVUvLwzubEiJ
 gNYvdIxXjMSzhvV5t+KOVFZpWbv0smNiEp2tNOHU0DAZZ7ogu03DBk9d9AscS9tCGF/1a6pWueM
 fzvvLxDfmPqXTrW1DG4fQ8Y36utZEXUfpiGAPqYsjICMIwmMYaxYBLIHTmuRulXpkrdErKJcwXN
 oM3jjdlHR6TpE4w5cbXxJY+tl1SiGNA0xaZZSQj4WCpTKXxH1qnqeNvImuYdQ7Im8665DuOIcfc
 /OYBh5JBhAZPqe+JlDjrQpQUTqXDT2MM6s/d7JJ1ys8EwTq5KY3EZaZAorGAGCsAmscyuz/uefG
 QTQJS3NFuVkw6wzzSFFHTUm8hz+PVpLWLnhoZOXLx8kP8ljszTFiKp7coboOT4J02tUzkWzQ0Ue
 CM+5pjZQ+VmDEp9OswqiqyPLiMTIGPgCBK7L3F+2CIwHDk/lKvNn6nZd/Ktm805r2AJOItWe44I
 73ElfPLII2F36nA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
index 4d8fa9ed1a67..d4ba6dbb86b2 100644
--- a/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
+++ b/arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c
@@ -92,7 +92,7 @@ static void mcu_power_off(void)
 	mutex_unlock(&mcu->lock);
 }
 
-static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
+static int mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 {
 	struct mcu *mcu = gpiochip_get_data(gc);
 	u8 bit = 1 << (4 + gpio);
@@ -105,6 +105,8 @@ static void mcu_gpio_set(struct gpio_chip *gc, unsigned int gpio, int val)
 
 	i2c_smbus_write_byte_data(mcu->client, MCU_REG_CTRL, mcu->reg_ctrl);
 	mutex_unlock(&mcu->lock);
+
+	return 0;
 }
 
 static int mcu_gpio_dir_out(struct gpio_chip *gc, unsigned int gpio, int val)
@@ -123,7 +125,7 @@ static int mcu_gpiochip_add(struct mcu *mcu)
 	gc->can_sleep = 1;
 	gc->ngpio = MCU_NUM_GPIO;
 	gc->base = -1;
-	gc->set = mcu_gpio_set;
+	gc->set_rv = mcu_gpio_set;
 	gc->direction_output = mcu_gpio_dir_out;
 	gc->parent = dev;
 

-- 
2.45.2

