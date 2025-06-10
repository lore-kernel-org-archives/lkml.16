Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F4B528DEF5
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:36:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558973; cv=none; b=sHL7oT56jQeSes1z/BO/gRyicfxEpgCrmLinqgBvQZezsMWhKX/MBvKJiYJ5pQ38AljzZLJSRITiA0QTyB/P7eStD6+Tc9RIwqOhEK0KMHpSvWb3ihigKrsqhWGs994ynwRWzKPVGoUesZCvB+PCfD5YVWSrr4XYRbiAobTwjnM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558973; c=relaxed/simple;
	bh=6dDruxI0CMaIvewahEW6x/eO1kPM4lNc6aCD8Neqv4U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ESsPe9bhPKJF06CKc4AVw7uVvf7ur30LqTBinqaBPF4BO5dXV+7SaNQd2bSfVUzAN2gq9B4jEBHVAPx1ELC+miLKDLYTYOBSdtOho2LAaqSxRnYE6NUvNigyOyHxxvUW31qw/227j6ha5E6wtIemUodW3S1naV7waS5e/XCd3sg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=Wn+4yCRH; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="Wn+4yCRH"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-451d7b50815so46682255e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:36:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558970; x=1750163770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vJ+dN5ujs/yPK5NxfTplkwW8W001YBt6mCY985Z4SkY=;
        b=Wn+4yCRHijd9d/tobSpeB3xPO9DqzHSGOqWglsudRMGwkvi5MVWn87Tir2iBlJvMNE
         qwtOa2pfwGKZb5T6K8i1wfDf61pK1EBuMGPVsqNlxnkFINiJd1DOtGzueaZ2Q8bxvTP8
         syPh64lNMk/qmLWoOXxRql7itpgswvLE+6KuNoQlPD8e368YiQ2ti9qiv0g4i964devq
         FFlLfMJlxs8UKiGl+Ljq3+rFeVSF/FvICK0g/ER0EEvQq6O9QAROWEv8IrDKLa7g1Oo7
         YRROnctvhCzT4lWz0oOX1vGLLX8snXM8Q3LuQUfdpjuIumzK3nkEpnXKPmUGN2O+nA+X
         BZ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558970; x=1750163770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vJ+dN5ujs/yPK5NxfTplkwW8W001YBt6mCY985Z4SkY=;
        b=uwlfS+h5eWRAtL/0/HezAxoa1NLLRoXnE5XUvf+Y8sN8izjAstvdOS/N5J5ZvQzHtk
         VQaoAk0CRjtEh2WIfBjUqwS6jdUw1ZQ244FUwZe9CDczQ+VrrCLD7b7pvUxGRJu8B9Iy
         VYy2B2q/4WmSwUXWcbcoZJf9uZ+4ktPfnhA4GNSO7scxmOaHydISdazex3InqLQey7Ax
         J2SIQIxtM2isKKfh23Zya4C+iyJ7nt3GxRH3b5yM9/4ONUMRZL7B4euISxphaerqS6iE
         skVf/W2+fZnz92NSZFCu/y7u4TBDm01emP8R7BKIn6j5YE+Xl+Y9SfYO+M+Yf1RkSr+V
         NIAA==
X-Forwarded-Encrypted: i=1; AJvYcCVTnCTu3tizl3+sr/1FCa3NnCe1I1/rkMQrqA1DXJKAAM6lNaJOsw53Jn5HmKfrf2zMdZ+qvVwbk5XCvFc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxKdoTB/UvMNQ/A/z8vUhnnuF95+xCCVdrhNT4sXadAXhmkTlgd
	rJmco+bOsD0ZWAbetpSPJPJFrNkeoa4gPOm6IlNSQejLmllPH7MvSA4z/9m4R50oQZo=
X-Gm-Gg: ASbGncvsel2J4dLVr05JQO+p/sB36cTpSirZVcvp8X0LnHfI4UX0Bw5YPref1kPNEBM
	JoPkfdPn7rcpWX2eyfVuUjAlmtXpu/Rd2woo9gLf1leKGfnffGHrxD2ZHYjJb5CDMPFgogUSBsb
	plhFecZcXkIjoJPYhlFWtVGoee238JURJhwjBnxrYtjLJR60xKZ8aRrLYZhqU6JMoz1HutePM77
	a8ffpAo92jvHfH89CMz7DpoKexvf4zVEIu7KwEXCXb9qcZpGO0x0BpR4H6l856No+S3JjPsA9fg
	AdaJY0gSIoYZB/p4RF2KN4XO8kvG1cJROTiatY3FfJF5g16E38qZhg==
X-Google-Smtp-Source: AGHT+IHGYs9SXMCPNNrSFnm8FqEiFqB/06BTghaHrW4YTub+wcikOYLcYXBiXkT4LJstkXF8wI3dNw==
X-Received: by 2002:a05:6000:2507:b0:3a5:2d42:aa17 with SMTP id ffacd0b85a97d-3a531cb8d5cmr13607365f8f.31.1749558969906;
        Tue, 10 Jun 2025 05:36:09 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:36:08 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:40 +0200
Subject: [PATCH 6/7] media: i2c: max96717: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-6-c088006a152c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1689;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=zxXtt6XCScDkqWqDmMavuunKoHjUaJSqDc/9xdViskQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCaejRazjUIZVqEFKdPo4Nfm0thjwtuSRRnuy
 /Ty0XmoSVuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmngAKCRARpy6gFHHX
 cnxvEAC18wqQmhpnwgjY2Ep9rhqC2zmil6GXWw7Z2idhzFYOhj+M2phuqy1Jq3OmdM4rqdEz0XV
 6i7KwbhgQ1R7aTbkvkbq4oein49RDbVYXNtzq4sM/TcreB8efM5aVJ43KGClhyrF5JiosQRcaY8
 /tgxG6+Wl/3nxg+wJ0SBaGwkIWyy1V/iy9R1nzoVpGCiO0MXiKILw6i58qYiH/AUCvF2T1YExdR
 yQbt58z6I4O2T1W37j26f9nwGzsqvt2JI3JNB4k+AK+UrRfw+ufC/aZDJFEC274u4pYNlj+/18f
 ZUkuCUhlSbqwP+xena6nVPWbRbStydhD0C340np4bQ3MOTyCz16nbAEEfYfR+N5/2F7RzJgByG/
 STfNNIS9YIy20PSBvnwxW08B0wuKYyyPxLfopQphWl1Liy00XlcTJ+s5hoG5z+GjTJg8Uq1Q3ZJ
 BHrA9V2qgjN1UrkyceGNfNmNjyD2cBaPO/LgAWfEpz0fcaiu3IBPIISNIO+iyAW3K/lF1R9rsUe
 v3Q4nfhvZYSPZCu5tr+DOJnFY6uIacIM0330u9oVpBNl33aIFzukBTWaKFFgmFQRafxCTYOo2wz
 vek9sLxuNOv05+yK/eY02RfmHHt0vHKYLkMmJJNV1RzTgt+oP9kMelVIZIQ+a8UZq08pp9uGfYS
 9k7y5LEw3NPKCsA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/max96717.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/media/i2c/max96717.c b/drivers/media/i2c/max96717.c
index 3746729366aca3af8aef3a807e2f91a8f142ce59..a503a55fe8afa9bdda8fc9b1c2b0e7ebd02afe1c 100644
--- a/drivers/media/i2c/max96717.c
+++ b/drivers/media/i2c/max96717.c
@@ -297,13 +297,13 @@ static int max96717_gpiochip_get(struct gpio_chip *gpiochip,
 		return !!(val & MAX96717_GPIO_OUT);
 }
 
-static void max96717_gpiochip_set(struct gpio_chip *gpiochip,
-				  unsigned int offset, int value)
+static int max96717_gpiochip_set(struct gpio_chip *gpiochip,
+				 unsigned int offset, int value)
 {
 	struct max96717_priv *priv = gpiochip_get_data(gpiochip);
 
-	cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
-			MAX96717_GPIO_OUT, MAX96717_GPIO_OUT, NULL);
+	return cci_update_bits(priv->regmap, MAX96717_GPIO_REG_A(offset),
+			       MAX96717_GPIO_OUT, MAX96717_GPIO_OUT, NULL);
 }
 
 static int max96717_gpio_get_direction(struct gpio_chip *gpiochip,
@@ -355,7 +355,7 @@ static int max96717_gpiochip_probe(struct max96717_priv *priv)
 	gc->get_direction = max96717_gpio_get_direction;
 	gc->direction_input = max96717_gpio_direction_in;
 	gc->direction_output = max96717_gpio_direction_out;
-	gc->set = max96717_gpiochip_set;
+	gc->set_rv = max96717_gpiochip_set;
 	gc->get = max96717_gpiochip_get;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1

