Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FF55263F3B
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 07:38:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744097911; cv=none; b=HEW/h+6W30jMJLkdm+Iv25LGGUFp55PZu4kDQw25GcH3m8wgVHBPf/In0aA5ClNZodCtxN1T1YRg6V/Q0xV7haHVJqqeJ+hsZq6jWsnPxzZsiLQa6e1lbtW2+HnPXhmJ7RaJLQrTJQCy0F/WR5EPHdRbwGZXRLTmMibfzvVvr9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744097911; c=relaxed/simple;
	bh=odvVZUrS3dbzVw9lDvpqQQ/85WCUEdMbQVAmeGMYZGc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UFXTuAQCI8cU8jtljQkCFQrTsNgcNW9UEE2wrC1HC2c6IGuInzJwWvm4blNbWbLu0V5LJ7MVUI8ia4STfqrfTj4H0JZgu+kK5M7pSb27RG0e9oNKemGTrxeVwscdGC0ETIflD2VlopXOL2XcspTuFqxX/wSY6v4/wXegLuo9nm4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=cS8c49fc; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="cS8c49fc"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-38f2f391864so2837961f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744097907; x=1744702707; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vM8Qea3FMtrgDWi17clkzSyShy7K/VLobQ3OM+BTpzw=;
        b=cS8c49fcSq74m4mT1naL6gWvEmKjSeAr7iW2/xt5Nk/3Lj30pEIpnZW3iAnFq2caxV
         ecdhc0IuzAgjU4zoWZvdre7KT67w4aqAlVl4NAcVn/tjQ/jYaClaBbRa4Qd83AMaMgYQ
         W4QmfWMhbblZ37x2z030M80yUu1ue3qYQEf5wHpL/RAtWC4DhQ56KK5xeL0lqcpf2pGo
         57ab9YayAFdA55lIcifcJrLl03yQqwK0UQ7s8wOJEJeUSs6NqgVhyVC3f/VP269W0yE0
         plWxOUxkbncvsFVS2IahiXM6KYc+lLbc+Nr8jTcgfWQifIU7axjttaH1R6N7zcIh+FNT
         E34Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744097907; x=1744702707;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vM8Qea3FMtrgDWi17clkzSyShy7K/VLobQ3OM+BTpzw=;
        b=ha9d8gPnjrrUQu52l+CsmktkfzoGtjNE9saomt/n+x6YcJcgwD99xuGL/vzvCCDm8U
         BkYk+Q90TL1pIyA7RBReAzz/sLFXTTEHcgOyTO6J3kchV8o6fqMO0ToVH7qMy4XEt3+F
         oL5GrJvx7IuEXp1e4hyiRn0ZrJXH2nHbLfCjh90+4dzu2pwxQtqjrkBMjZxavSZlu7dZ
         PsqWQtpA7jjohVGbXjokAY03vNo+ZQ2tjLs3bRfl5xLeWdiJnL2GKCmGoStX/YH6de91
         4PvdLOCaJnx9Io3sV3ONPHnxjATPtqGc7xosYcRFaufOuRchrAlCBxhkSYYHlNrRT9z1
         nXSg==
X-Forwarded-Encrypted: i=1; AJvYcCUi/bildfhwrHt2zOjNmTc07Laaemb7MciCwoUlVcphXEeyfT3ERPgniKYVS7mRq0Ep5HoJ/WsVgJGnZsI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvbA5MebnVeRz1qpFOAH6wx1G9bhOVg2ajLK/atW36bT1Zcymh
	6iIw0UOWjBhB4+wgabTEIxYtBAMLtI79xlB0ux8+9Nr7ILYp65TxesSy2mIFQzw=
X-Gm-Gg: ASbGnct3WI/y2nLeyVmmz/TvmNVNFocqw0nkY9HrHFR7dfAmbZZb6dIkoIJtCBjLq+h
	vK1X2BBfAENG9AxbK2zXsxg5GBmjR1uRTqU62b52l5Eigw1wNiFbFh9NfRtgmmyv/hDORoN5GVW
	wKWYgai+n0AwRkZlBXkfsfsCCZdkBurEIEuTvOMO5+BW+AnE5ySuMziQDeH92KIZtaJNrs8E/su
	LZFl3TNLfLNJ49p/wW7jYy2AESR+t+yaLZwM2RrfX/xPBv7hiojQPemsymqInR+wN6pWtgXC0GF
	2iOTpoPhvIox6AS8hMW5X5tm6tbhzHbU8/yXBHvcfRtCuVqN
X-Google-Smtp-Source: AGHT+IHG4Z/ZuFphLMM4BLXvIJni9vAF4RZfbvwi7RnlWhP+eHtEE8msr2+s9dSB8JIiVDJomM+vzA==
X-Received: by 2002:a05:6000:2512:b0:391:253b:405d with SMTP id ffacd0b85a97d-39d0de62927mr12155263f8f.41.1744097907542;
        Tue, 08 Apr 2025 00:38:27 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:2adf:eaae:f6ea:1a73])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c30239813sm13892137f8f.101.2025.04.08.00.38.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 00:38:27 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 08 Apr 2025 09:38:20 +0200
Subject: [PATCH 02/12] ASoC: ti: davinci-mcasp:: use new GPIO line value
 setter callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-gpiochip-set-rv-sound-v1-2-dd54b6ca1ef9@linaro.org>
References: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
In-Reply-To: <20250408-gpiochip-set-rv-sound-v1-0-dd54b6ca1ef9@linaro.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Peter Ujfalusi <peter.ujfalusi@gmail.com>, 
 Oder Chiou <oder_chiou@realtek.com>, Shenghao Ding <shenghao-ding@ti.com>, 
 Kevin Lu <kevin-lu@ti.com>, Baojun Xu <baojun.xu@ti.com>, 
 Herve Codina <herve.codina@bootlin.com>, 
 David Rhodes <david.rhodes@cirrus.com>, 
 Richard Fitzgerald <rf@opensource.cirrus.com>
Cc: linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, patches@opensource.cirrus.com, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1670;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=4r1nNQSWxtmth2sTRGpaUPwZfF0gETP2bZXWejf1QY4=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn9NJtxz6edE9QBclqAj6Xs4+ohVR6fblexPUix
 T1DRmXYfQCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/TSbQAKCRARpy6gFHHX
 cn5dEACtbJfAMR6blmJ5wZcZOFlii3iInTRZzxbZjFSWOCktnBrvaRB+jeqQ3IZxcM4fzKhQHs6
 N3KJTejg3lD5nx5JVxxA9FRJDkXlDOzpJa/5/eobsWgmQOtYyD2edbPb//P1qw5f0F2G6k+7cET
 CQ8DZFfEvRtULbVjWYkufogdf6u+2oPkLlsicSTyuH5zouYuKanlMmQXwaZntrm4QgRhe7m8q7b
 adhDH5smg3VjX3GqZBA4BsfI0fLWJHpp8gtVn9ck85B/l4hXhaoxcAv4EaOZiDSamljQOk6+3l7
 D8m7hQTMuB2DmVTypZe4f6hptW+oiIqnrhcO/8dAZZJFBgCYnV11Wdbx9tZjiAvT2yvShU9H2ae
 GvMZTUu8277850aaeuD6Ig438+uY3Z1F7TtVBBRs/gurlaEcl+hHP9/OfOWVeKf0yIlXFq4H0FK
 jUCe2rYGiEzQRrJUHgAAj3tY9t0Jge2Yev0Lv9LebKQVxNzB1xVdM418dKMTQOh7xe4meV9YMIU
 asJa6U6nBxsZyJs4ZZOS7TWzLJTUssSXguWW7ITmLEAwavxzDfV2OlMU04xULphX1f6QaOibmjt
 +kkXlVFP/GA+1mfY89eommtJmf2iBx/O7Z9j/vKwN9LfxJS9v/hK57pPhqXVat/pH6Cg/ATvSJX
 RlU2bZozo648+fw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 sound/soc/ti/davinci-mcasp.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/sound/soc/ti/davinci-mcasp.c b/sound/soc/ti/davinci-mcasp.c
index a0b8cca31cba..caf1887cc9d1 100644
--- a/sound/soc/ti/davinci-mcasp.c
+++ b/sound/soc/ti/davinci-mcasp.c
@@ -2157,8 +2157,8 @@ static int davinci_mcasp_gpio_direction_out(struct gpio_chip *chip,
 	return 0;
 }
 
-static void davinci_mcasp_gpio_set(struct gpio_chip *chip, unsigned offset,
-				  int value)
+static int davinci_mcasp_gpio_set(struct gpio_chip *chip, unsigned int offset,
+				 int value)
 {
 	struct davinci_mcasp *mcasp = gpiochip_get_data(chip);
 
@@ -2166,6 +2166,8 @@ static void davinci_mcasp_gpio_set(struct gpio_chip *chip, unsigned offset,
 		mcasp_set_bits(mcasp, DAVINCI_MCASP_PDOUT_REG, BIT(offset));
 	else
 		mcasp_clr_bits(mcasp, DAVINCI_MCASP_PDOUT_REG, BIT(offset));
+
+	return 0;
 }
 
 static int davinci_mcasp_gpio_direction_in(struct gpio_chip *chip,
@@ -2216,7 +2218,7 @@ static const struct gpio_chip davinci_mcasp_template_chip = {
 	.request		= davinci_mcasp_gpio_request,
 	.free			= davinci_mcasp_gpio_free,
 	.direction_output	= davinci_mcasp_gpio_direction_out,
-	.set			= davinci_mcasp_gpio_set,
+	.set_rv			= davinci_mcasp_gpio_set,
 	.direction_input	= davinci_mcasp_gpio_direction_in,
 	.get			= davinci_mcasp_gpio_get,
 	.get_direction		= davinci_mcasp_gpio_get_direction,

-- 
2.45.2

