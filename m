Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D79124501D
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 08:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746176398; cv=none; b=VIb1z07IsIsl6TS11DCDOBnU+b8X59jo6FL65ADeemQVxCTXt7RY/xXdKDBy791DqtJ0gFxWzIQF+kkfq7v9y4rlr2vFenD8Az6wGeowz3NdV0DNPYMrqaUS2M5HkxXRxG4hMC/sBycneRl2aQdxD9nuQJPJQY1/eBqSDxAO8eQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746176398; c=relaxed/simple;
	bh=WHc7wn2J/YaeLrZRN4cvkbwcAb9iM7CUvj9xdwuFIIk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aER5MqqYKj3Xvo9HvMixpZi+yNl8Yg5Y0CGhYuy7pfxE9trIUELj4j/qARC6p5TpsMuVH1dvOnTZcEgB68Xi5ITM5SY3nILfQ1S425QREaYKmbOk+pahb4yW1qQwAahMPP0nXqLFDDIi9GyiaXIR7W6jvkQmZNzyhvbKaSrKBXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=m9y6ksaw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="m9y6ksaw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-39ee57c0b8cso1508531f8f.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 01:59:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1746176395; x=1746781195; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
        b=m9y6ksawFU1pi+PTc0vaDHGgZjsOJg1MeLpPC5LvqKoTi+oR+TXU+usP33xNoxWu5q
         0Mm8ORZ8mfrx17BAq6CyHzDUCAur7z9L2mEWXAXGpyJHUHhfvdwHeI0F4xgzox4YmlGV
         iLJRU9MTVOruVmxRSXdOf0Ghd8/+Q24fmkqQ5jbv3Ux3vYARkaEkYPWtT2RLBqIV+8oZ
         ITaTkzlRZmbNW47uzIciMjGfgpaSozPEdxjwF65khDyY3kZeMm/VpJ8WDeBrdCeylxb8
         gGXrh8mLSlVqCfWTo3ZPYDuEpHqD3ixHEZqqnrf7+k72FRBpW9STes15BB6XYh0s5lDo
         ZtFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746176395; x=1746781195;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c6w8Ny2qh7Oi2mCqCFAeltSr0IHxTHSshWp0NZpEQtQ=;
        b=Yhi5DHEtbhNS5INmS3JKNo3ln+DQpp+ltVAEvR4b/0fLGXtELhnjjqCjNo7DtRCNWc
         DwKMhmvNbeW0PDHApmzNvsLBtDmZdCZZDR2HfuOqHCTN7UKutZRN0QsY0ps5WBCnC7CD
         9hbnWs03C5DMKf4eLyE/tLLRL2uKmEfcrpx7sYk+Mbjsrto/xJ0ZD5zH51Z7bctOZBgm
         iMZzIV16wKdpjJrvz/hVgHWADzAW9KncfP2xqoBJjxX5bhla2tyLNwfjApKyyFCnlgK9
         tRbbIIFZcR/JsPAiiAc8rhrAD5xd5M6FGf4B5ds+Ivaa2JemfXphnjEwxf49359TvQnS
         XtVg==
X-Forwarded-Encrypted: i=1; AJvYcCX14Gly9v3TrKrihJYPngSMxU9gNyLmJXRI0YQ2IcoN0/ckZ1LNHW7FFvmDQ75RK2OXSV9BdlbIW+6OkAQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyligy93NOQubJLmrC22mueB1Z2Vkom5pJtKemJUbdq0NT6ayJi
	HzQMNuSf42FgY64YvaS0RMBy2V+qFlMxCP4OsY3175Y8Di/WX8Je1XXLBPm+CdQ=
X-Gm-Gg: ASbGncuQs+42k1vraDTXVN/PDA//7JUlqAdrAQCetLS96E8lnxq7aXreO43DmNsc2a5
	YjogMax3x+/YPTKlAb6/GfV2DYmW7yFW130xPNKqSu0ugeiGawxQjjB06ujDiwzPO3gGIl7GO2g
	9Oe0PicxUSMGqrjiTnuhKwkrfNGtwtnEbX9odNBh+C95iQAqDMNC6dtrIAV2g5Kc5aMkJAQQn4C
	jFcVsZgSLyDiurfC/WB4ozTBcnOctlXv+wmFcq3rZ4GbBT++dH6KRjisivWNj4yErbqXPIFNAha
	DB5TJQHm0OZDwQt3+aVDl9DiuuAQwQ3xPbE=
X-Google-Smtp-Source: AGHT+IGnuPzW0KsZuoafr0ut25yVUAE58QEXlIHKEBz/4ug3rf9GaFjAL3GjFqvtw7oASpIUZZCL/w==
X-Received: by 2002:a05:6000:2ad:b0:3a0:7af3:be8f with SMTP id ffacd0b85a97d-3a099ad31cemr1489449f8f.5.1746176395349;
        Fri, 02 May 2025 01:59:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:f280:a08c:3f15:ae3e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099b17017sm1552055f8f.92.2025.05.02.01.59.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 01:59:54 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Fri, 02 May 2025 10:59:50 +0200
Subject: [PATCH v2 4/5] powerpc: 52xx/gpio: use new line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250502-gpiochip-set-rv-powerpc-v2-4-488e43e325bf@linaro.org>
References: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
In-Reply-To: <20250502-gpiochip-set-rv-powerpc-v2-0-488e43e325bf@linaro.org>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, 
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 Naveen N Rao <naveen@kernel.org>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Anatolij Gustschin <agust@denx.de>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1743;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=NUv/Cv/Ma42p5cVqxLaXY/iK8aY4ZJdMZfYarvprRRM=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoFImFEUTAydQAnqUBWcSczhRxoDxw1FtPObvJO
 Cps9EWCTzaJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaBSJhQAKCRARpy6gFHHX
 ctNvEADegI0ahN7DjfRK70i+3mbHNjJm9hEqWx3KvwVKsoM5dD/Lkpn2urM861oMuobssDB/gcE
 DbA2cu+7NDPR0b+KaYiEU8JJ5BvmUpmTg09PVE/paQdwKat4HoV6icBYsyMHJI9ZZg9Vbo2EQav
 FoMnIzOGzWzbrqdUg6jyaaiQFMqhkbafZz1QVXvN2ZKuYbkwTLxLyq48nKWRTJUlsOTpmLY9kAv
 DCCAzdjB8yk8zEXXdAaEKLsoXZwjR6cwdBa54HDS6vPGP8iioKYpI0sOxcsxIAyX3woKy10zuGf
 tJuGP1S7Nw3/HmrBmtsVe1yTgdnQYY9te4AtsrBPo7A+Qe8FbkiUJcbbwG1qQc1sB0nO5kn5Cj2
 9o/m/6lcqCxlfcVcTenPlKMlyIMMVbJ9j9qV/gDFhDxnKHZwY4rtTo/8C3TcgqxobElqQuEK65O
 BIcVEJUqyvLGwd3JPg21ifkC8tQ++TuyrXzYGTnjdwm5bMWWkyKpOiC0W762gmVviUqRHG1x9aA
 zYw9pfUPGHaAQLTeDArAu40iBit+zJBYbkA3kfchXECSfhyTBGacRZZrgbfq/M55mbahzq1kFtA
 8gWJE/qAD8A2LLIlIugop7WeyKiehQIs2Ox+gKZA0/PxIaVU0RhyHAvi5AJDBvWuN7YMXvDSGik
 ecRAgo8SfaYFF9A==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Christophe Leroy <christophe.leroy@csgroup.eu>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 arch/powerpc/platforms/52xx/mpc52xx_gpt.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
index 1ea591ec60833..c96af6b0eab42 100644
--- a/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
+++ b/arch/powerpc/platforms/52xx/mpc52xx_gpt.c
@@ -280,7 +280,7 @@ static int mpc52xx_gpt_gpio_get(struct gpio_chip *gc, unsigned int gpio)
 	return (in_be32(&gpt->regs->status) >> 8) & 1;
 }
 
-static void
+static int
 mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 {
 	struct mpc52xx_gpt_priv *gpt = gpiochip_get_data(gc);
@@ -293,6 +293,8 @@ mpc52xx_gpt_gpio_set(struct gpio_chip *gc, unsigned int gpio, int v)
 	raw_spin_lock_irqsave(&gpt->lock, flags);
 	clrsetbits_be32(&gpt->regs->mode, MPC52xx_GPT_MODE_GPIO_MASK, r);
 	raw_spin_unlock_irqrestore(&gpt->lock, flags);
+
+	return 0;
 }
 
 static int mpc52xx_gpt_gpio_dir_in(struct gpio_chip *gc, unsigned int gpio)
@@ -334,7 +336,7 @@ static void mpc52xx_gpt_gpio_setup(struct mpc52xx_gpt_priv *gpt)
 	gpt->gc.direction_input  = mpc52xx_gpt_gpio_dir_in;
 	gpt->gc.direction_output = mpc52xx_gpt_gpio_dir_out;
 	gpt->gc.get = mpc52xx_gpt_gpio_get;
-	gpt->gc.set = mpc52xx_gpt_gpio_set;
+	gpt->gc.set_rv = mpc52xx_gpt_gpio_set;
 	gpt->gc.base = -1;
 	gpt->gc.parent = gpt->dev;
 

-- 
2.45.2

