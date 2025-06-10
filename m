Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61D529B8D7
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558958; cv=none; b=ZStiaQ63Fu6xnus3t2AyAZno5Mcrp5dIcV5CjJ2bMPxCPHdt+cnz97auQY3X5sEOPrZZXaL+8J8KiQhNeAI4o0sphptrMwjWfYMz3z2kp9uoFyEZ2Yxy/RQYy739d9o9FfIgFaB66w65hKuP9ORP6r6zhBVSuBH8KoXi0hJE5Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558958; c=relaxed/simple;
	bh=vBIY6MDSAZqxd0wvprVpXG2GeCT/g5H/eGKWlDdO1xw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IkwyqtWNUbCzj/ziAkDDNzIZpKpggQ0ygqBIQ0YAXO377bVO30Omx/Dfe1DnMxRzR3Cn4Dz8ImXbQ73v420ty//xY45z0FuOol4ZCAmrwIjz3HmZ8nCvwikyJnw+CPYtTONH83XKBBIYUYHuGQoShV791r00VO6oa0kDTtyKH4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=YCG07UCv; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="YCG07UCv"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-441ab63a415so56248665e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558954; x=1750163754; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XFQEt0BhzwG4HODHfj1luH5UGQeZf6dSsvCSdYpA/bw=;
        b=YCG07UCvViyuBYYJYdpKsLd6qgRjrY4YcFzIEbiz7y7oPspJbCdOaP5ddQbsBZ4qHD
         3cGOOUZphhmrh7KZ0LhlonEUsz/cMlMqkt0Xn+XZFBQqXZl1kdiwP3HA0AURoCSvx6XH
         Ob9OJ6kQFAQoJNdGf717C/dGuLcaC9zGX9iF/ACqA1vt0G2mg7ltKQLD5k2Gb02IUxov
         Hf59VLVKOW1luqFBa/T20stPmIV+7xcznvwX/FfLAP808rxdEV2qJTfA40vxkB3o2p23
         poIFLObmHn37nmESfAexk4s5fZult53wJTlRkosEpEP+9KqqfeXYyPaYwnoZ5o0npvjm
         BrlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558954; x=1750163754;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XFQEt0BhzwG4HODHfj1luH5UGQeZf6dSsvCSdYpA/bw=;
        b=SGLIR3bwrjEwSEGzVDm/ve6TOxn7zYBS3O8/oFGewO7rsrK93zettZ1swGMKdbWkk3
         R9lSWlZjARyJij67oxce5YcM3AP+Smdpunl6MBhYXvSkhvcGrIVYAxLiKeNBYxBL7Jnp
         MzoDH7xQ5djZ4dFJ4QBV85JRtyFrtg9tokN5sNzYVvVHFQ7VWnJpIb0uwUPTspL47Zyw
         nOz6faKnQshRsU8RZCjSnUDjLpt87OOmqFhZ2goEpoLNHrU3M9yw0BJQ3g6ECqNP19b9
         zUcYvvow8/PKUL2QY/DY00srcLnLnVFdnTI6otiBi+KwMyhuE+Qw7PKAVylBuqrkK2Jp
         wehQ==
X-Forwarded-Encrypted: i=1; AJvYcCVbyHpEuldOJ3z4+iQSuBZte20CcdcJEYsJyrNjbSDYJKbg/5hVW/bLekfJAtykRL6sdIeVy6QF6iQ5lD8=@vger.kernel.org
X-Gm-Message-State: AOJu0YybLgT7Z7ZYqwih9TE+H4sWk62NsaslOy5ELOugiSgfil08heAg
	dZLIN+NkMpy4rDCPzziUqgIC7gg9QF2VyMbtf0KuvG/ZiU0PgjedL3C+Cinx8NcxAXg=
X-Gm-Gg: ASbGnctZeVppGymsvORwp4w5ERoZg8amr0CtAPMu7umcB9hhMix1We3UwJtSLgVxZXJ
	N6EFMXxRvRTQOY3nGRllFh1kjkdOS31B0N4v+7EERNJpMzsrTgdMmGKwO59SjyLZML7yB9i+rcX
	lVpAlobHAH3fAv4koFhHYhnt52zXO662PkfxLG8cH+Mqgy9hEhMWddmCxezqlsDi1uyK5fUSku8
	POSQUztj38E5ATy0bgJJj4A0UWjEfK03kyTn9aYK1Ula67m3cvgOf8e/4qdUntJISKPo0PuDfJO
	LwRUVuzLH8YwTroWsC9BOjSu24kyhmM+LAXrhSeO9MY6/XnupLUYClQ83WnkwzbF
X-Google-Smtp-Source: AGHT+IGeLm6Stn6qwmhFlxY6yRUd1ZWHS+JmYdkbaMswqAFFouRLMnPi65wETwm0g9P1taELNYxEnQ==
X-Received: by 2002:a05:600c:4e41:b0:450:d012:df7a with SMTP id 5b1f17b1804b1-4531de914bcmr20613935e9.28.1749558954024;
        Tue, 10 Jun 2025 05:35:54 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:51 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:36 +0200
Subject: [PATCH 2/7] media: solo6x10: remove unneeded GPIO direction
 setters
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-2-c088006a152c@linaro.org>
References: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
In-Reply-To: <20250610-gpiochip-set-rv-media-v1-0-c088006a152c@linaro.org>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Bluecherry Maintainers <maintainers@bluecherrydvr.com>, 
 Andrey Utkin <andrey_utkin@fastmail.com>, 
 Ismael Luceno <ismael@iodev.co.uk>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Julien Massot <julien.massot@collabora.com>, 
 Jacopo Mondi <jacopo+renesas@jmondi.org>, 
 Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, 
 Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=3e0iLtDRWFqoc+uvXxn0R7qOqIkpeyOfEDZD1yz0l28=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCad0uJuLemvk7d60Go2/A881xsjcQG2ox29Z
 GFRhSm6V9OJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 cpxuD/9O2VIBYw/wCZEMw9n47f3PrD4xcBr4nPWgGrIHy09M6wa/1OJdgKzPDnEbEt85UfiTD2M
 /GwSqgss74CkSEMJHxPlmAhP4xLCapXkVUe8qNxArgtobkWzZ9aFfamY+omdojX7h8xlDSG35Vj
 3tIrgZWAADV53CDmEsg2z7L9sIE2RhSv/2IK6ltE93kF2B31Ye6DQf7hZw2W0pvIYps/w+ChxMK
 Zls4mabX4FBPHubUNorzbFOftqdzWFm1J5CsRPzVMvMmiH1tzevpciIRLT6vXQhYdyD2hZecdUc
 MqVwGNlSBwshVSqkM246jD4/piYQzT9Cq498QyjnuMlt5a/ZD3ODQyMPfTDKweAOybN6NBAA1m5
 ob1bJC2SZkkMkJ9Sg3XgqhabVoonOocwqHv+lSm46b5d97+/RskrNbakpuh1ut87dSBu2XSs/iy
 jBbXrfhsBmIB7EnrZJqiiaea632or+hXDEbdYAdTaCQv/+UhFjyVYSmOM0Xw1xYMrWj/+adX3Ze
 tmLVLD6rTGaJC98SPOjkB5kmjrQCa1CoS9kpEKx2E8g6loZyI2da9uGEFpAirlx8TmTnpBm7bkl
 +6MEmKOoApckOiwzXcWm9W3Gscq3pHunjWTki74Sfs5+R8TLzGIOBGvWHMDLe4kB7I3JzmWVVa5
 ubQ0FkFfH8sL17w==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

GPIO core already handles missing direction_input/output() callbacks.
The ones in this driver also effectively return magic numbers which is
not optimal either (the number accidentally corresponds with -EPERM which
is different from the number GPIOLIB returns and so inconsistent). Just
remove them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/pci/solo6x10/solo6x10-gpio.c | 14 --------------
 1 file changed, 14 deletions(-)

diff --git a/drivers/media/pci/solo6x10/solo6x10-gpio.c b/drivers/media/pci/solo6x10/solo6x10-gpio.c
index 084c30760e459e37cd1800132a93dfb0fc70398e..f51f865c69bd7b04fac7a1f951c734965d8fc993 100644
--- a/drivers/media/pci/solo6x10/solo6x10-gpio.c
+++ b/drivers/media/pci/solo6x10/solo6x10-gpio.c
@@ -116,18 +116,6 @@ static int solo_gpiochip_get_direction(struct gpio_chip *chip,
 	return -1;
 }
 
-static int solo_gpiochip_direction_input(struct gpio_chip *chip,
-					 unsigned int offset)
-{
-	return -1;
-}
-
-static int solo_gpiochip_direction_output(struct gpio_chip *chip,
-					  unsigned int offset, int value)
-{
-	return -1;
-}
-
 static int solo_gpiochip_get(struct gpio_chip *chip,
 						unsigned int offset)
 {
@@ -167,8 +155,6 @@ int solo_gpio_init(struct solo_dev *solo_dev)
 	solo_dev->gpio_dev.can_sleep = 0;
 
 	solo_dev->gpio_dev.get_direction = solo_gpiochip_get_direction;
-	solo_dev->gpio_dev.direction_input = solo_gpiochip_direction_input;
-	solo_dev->gpio_dev.direction_output = solo_gpiochip_direction_output;
 	solo_dev->gpio_dev.get = solo_gpiochip_get;
 	solo_dev->gpio_dev.set = solo_gpiochip_set;
 

-- 
2.48.1

