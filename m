Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73023227BA9
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749626885; cv=none; b=TTozTqEtVleDJobc7MrvHZQpFpfGqHQLlhAzQ3pSyIRZX8vcHmMLfL+dznb+q+D1ehuYptvVODHbZJH8mvJwQi/RHEqWNaMeWIKL9atro0tdaXItqPyoZZWWG2smjFkd4yMwOY3Wlf1ftXGg2BNA7DCN+bVusElc9FvC1zdngpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749626885; c=relaxed/simple;
	bh=ZmzFKZJkP78DlEuTQx92TLfbg/qZJDAB88ySq06CL5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X9MFkt4C+liNfvQolFt2GB6WsuVlIEoDyElWSVlFShKIJ6rxTG+mheUaWfm/vq5cgYiaMGG2GG6SeglttQOPVKpTJN25e3trwE0ODeiclpCrdKInJplS6977qxMIXP1g6ZcGUQ2fsBUEX2dIqu1hk8cihkzUhlSnwc7dZpuhyTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=C4q8Cb/X; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="C4q8Cb/X"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-3a53ee6fcd5so2177316f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749626882; x=1750231682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5b7KiJcZC38GOmum8tkvCWEpaNDs2GuKtb4NqvqE9+Y=;
        b=C4q8Cb/XWF8hHYMZqmgGAJ34rA+IAKjDUfaYzzjJ+Ryq/P2Z0Yc7FZsme9dznt6cRn
         XAaGcEDkpK8dEnAbpxAyJIB4LkHZqKL3QD3IA68q6JtaRd7d8Z7Bj1RKgXU0mxIJPbGl
         FuUkRSiSo5UwIPwrIE4PifVDuojhYunOu19L8m44viH0FryKeglq679d7KSyCqw9dXks
         TxubCvo09oTjnfSv5E44/z1nDEyyfgtOYrLOqrKmZPp57HGyJuiD7d5RU4Uw9at1nZQL
         FtKauP9aATuU3c42CP8mUIhUQd5kAlIHrKav7SN/+RkmmOO1UbyFeTjtHofmAXvPGsUn
         iD2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749626882; x=1750231682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5b7KiJcZC38GOmum8tkvCWEpaNDs2GuKtb4NqvqE9+Y=;
        b=MgX6rROjefFoNxqouea/Dp6pOcatuzuQYRq2QRNJ5kX0aHG5CAlC3ArtDJfyp1uSDW
         peFtieK2lALN4X1zlPZ/JrV5sRRl5PKVj9HsxzKbA9NI5b1m6d1KFY8ZGYGMtKc5QIn3
         z0/CbiK0grxffs/0H+5JiaHNiBoWEHzR4p7OH7UeAfuxQAuYsnHZXWHPTLttZ4yD/Jk7
         SFN0xTR+hlW/WbBThMHrlItTSVwTkNPEZUKQmYuP1H80XgNIPGJQ6uSKlx2+/H5hqGTP
         CwPw8upj3Q5nA2VInOIpNSQb/beRPh4xw3GrF39+hY54crhknkO+KoYSXCWuO//MlFnE
         sdCQ==
X-Forwarded-Encrypted: i=1; AJvYcCXrMu7NkzJDXkBYi4na/Zi1NA/xVBwi+q0wm2gVp5N52GVLMERtmZu+NpRpO4PWoNg43p+9P2tVM97Tm8Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7vd1tl6bTbtjskwxdrwHlYtUWCXiTuSs3fuunuZUwxuXWJz5I
	AoGgwyzBIgAr53kG56pBeld8BJVbjfdTB/v3gOZSUmWn2MCcwEZRWyRiV+s6lFZHOW2cpz599C4
	IRrFu
X-Gm-Gg: ASbGncsTafn2macm1lyGA4UM7/n5TO+1WTUS/RF+L3HEaq+UR6idnLsg1jSxS1KCx1L
	DBDqAZysF6qDzkEKZLCfqxbn5ekbaRlHjaDEnSm5Hdr7OqHaJvChoVqlsv39yLr7jHV/cYbbMse
	RlwXlyM/LhIrsNUXzzoG09s+QLrsc7+m6Edvnaj3VV3Uvv8d3vGSR4AF3lfdxBpiNMPz3dF2XHz
	4btJ1akgVCYM3U/WX8RZjykjZ4pIo+ylbVdoBtJ1oNSXYyLPgcl/s0HoosPSvnTrYcv8klLk7AQ
	53A0aGeqeYJD8VR1w8f+uE8aHJH2LB4hWpLI1rfDdTPqXfHBC9Tjt4EbDkDvQqAhYOM=
X-Google-Smtp-Source: AGHT+IHo+a/giD3KOuRSI6Txn7wgTN3MjofXYie1Hm/9oQ70BP5UcGVJlwTt4NkvED2pEWah9gQSTg==
X-Received: by 2002:a05:6000:290a:b0:3a4:eeeb:7e76 with SMTP id ffacd0b85a97d-3a558aa5ad4mr1345576f8f.9.1749626881856;
        Wed, 11 Jun 2025 00:28:01 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:3994:acce:fbc8:2f34])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532463e11sm14572552f8f.90.2025.06.11.00.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:28:01 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Wed, 11 Jun 2025 09:27:54 +0200
Subject: [PATCH 3/5] pinctrl: rza1: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-3-ad169a794ef0@linaro.org>
References: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
In-Reply-To: <20250611-gpiochip-set-rv-pinctrl-renesas-v1-0-ad169a794ef0@linaro.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1492;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=pP/oNTY+jKTjqoh8Y3FwDaZwU+GC9Jsw4vp0KbfKuMw=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSS/9w6ivG0bcYQcQVi816zZdcCnUI93QCAxvw
 h4chHAyu4KJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEkv/QAKCRARpy6gFHHX
 ci0zEADhc7hf79+f1Kg51T7M/9zj+dlodBnMUOaB7rwbfS1K72grf5h2K44YI8laelqcrumcbTp
 lIGha3HpMAAf0zCWYQWMHQcYHLDpg7zGC0z2Ed9MTEfEY6Pqrpmm5jzy0f/rzl1o6l0PCq8lJCI
 Qbs5AqutuHK7ltEenIJvZmA+GQhCYzmQK8ugAq6Dsl/nwYw8XlcVgkBofUeJGsy7oKplJ9djW82
 RiRHqCokJ8gRug/7VPTFhBc74F6wKuALnLfWobCq/UzYjB34W/aX6yYAX7Nf9uEbqfhX/TGVPd9
 1V52If7RrLaASxAGhqaEsAUSrShjnb1Lh4yGt0TB8a5fleOyM3c4Zije7w4hCEURfrP64kDXf8x
 ywaUKZP2TNs6BFslIy2wpsiFKLCj1MTGcE9uPAJxGLWCex5Z1Ii+MEYqNlyFf5xyJeUTVwRscLX
 qFfwP0ciwhEV8J3C6h73627f4TGENwseJm70QvwNpmuLAi9tErK0a6MVQpbSWcu9U2NxmF/J5bK
 E3qPx1KdC2Y440XQKfM4sLg/rdeZ9j1RmNt4a01245WDD+W5fFEn0Fqq7ehjOhDAP4TbWS+7e9A
 GP4y/vs4GhfEDy0TFXk1wCEAtQpqwkE4CVQmM9UYR3mtzGh5l2/DZYQVKmyx+jK9cSS6asrvCbq
 UBTgONolXmnUUyg==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/pinctrl/renesas/pinctrl-rza1.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/pinctrl/renesas/pinctrl-rza1.c b/drivers/pinctrl/renesas/pinctrl-rza1.c
index b1058504e0bb3eb4dae8ac5b0eb848eeaeb907af..b0ba1d836ca822833416f809df570bf459c1298b 100644
--- a/drivers/pinctrl/renesas/pinctrl-rza1.c
+++ b/drivers/pinctrl/renesas/pinctrl-rza1.c
@@ -830,12 +830,14 @@ static int rza1_gpio_get(struct gpio_chip *chip, unsigned int gpio)
 	return rza1_pin_get(port, gpio);
 }
 
-static void rza1_gpio_set(struct gpio_chip *chip, unsigned int gpio,
-			  int value)
+static int rza1_gpio_set(struct gpio_chip *chip, unsigned int gpio,
+			 int value)
 {
 	struct rza1_port *port = gpiochip_get_data(chip);
 
 	rza1_pin_set(port, gpio, value);
+
+	return 0;
 }
 
 static const struct gpio_chip rza1_gpiochip_template = {
@@ -845,7 +847,7 @@ static const struct gpio_chip rza1_gpiochip_template = {
 	.direction_input	= rza1_gpio_direction_input,
 	.direction_output	= rza1_gpio_direction_output,
 	.get			= rza1_gpio_get,
-	.set			= rza1_gpio_set,
+	.set_rv			= rza1_gpio_set,
 };
 /* ----------------------------------------------------------------------------
  * pinctrl operations

-- 
2.48.1

