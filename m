Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A83529C33F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 12:36:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749558963; cv=none; b=uw/+QXKzf4OP9KUtv+6ZPebJQWdVIm7fbENDrmRDvEOpSTkv/UP32Pz7p+3MI3QuPQUDPdPzoZUIb61LnTnUETP4NjKX9Gvc0nD7gJ4EP7F8tWbr98oYRw/87xQklEIJ0hhIf7LiVKH/0c8ZdKURX9mGx0crMfD/5STQbKjvmzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749558963; c=relaxed/simple;
	bh=DmSMep/ln8oFNFSCxh+5YdfNVCHUYDbu+lN2rz8R7HQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QuZZYrJlxBVSyxpx6i+ODEmU1Ehj9/aC9x2Srp9/JGLwjZwxehfwp4hGRyPdgsIeYrve8uMfAySdF+N3VkSbL22n/fS4c+9J+0SNMk1vuY20yqYd2zoeJ53cCQJ2ke5Px+JmwpKWG3AV8pzsI1wVfrSW8sKRLTuX7QMQtxCtRXI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=LrG5vHga; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="LrG5vHga"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-450cfb6a794so34937975e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 05:36:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1749558961; x=1750163761; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q5StFzbVLsxYvLdlkRPCazQb/CEyrkV6c3CXJXiOD9M=;
        b=LrG5vHgagdYLiNpLHWDrNdxpMHcGqn+TXoLiN9hFlZ5fJjKJR4c2VrE6VFGtAcqUrQ
         X/16GCxlOG++do5ZfzMeA2peYh90heHv5pC+W1CGnx0Ctvimf7Mkf/THA+NXijvDtsiu
         l1mOgPNtpazRwDjE5lIYL9evdUVc8A+VN6IDnkHf12f6voKjZq1cjSTNiI7gMFaXb7AL
         vqLg7mq1Lgz4C/kLzQqy58NB6AYls3nCUusgwDxyBdB/ImiJ1IBTci+Ba7K3Y65JrFdo
         azzTGoGH4x8yH8E/Eq6JMFhYbE3RMt0Pvhl+iROAn8rjbI+BArp0cggX0IQIJ5/lscv9
         ypqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749558961; x=1750163761;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=q5StFzbVLsxYvLdlkRPCazQb/CEyrkV6c3CXJXiOD9M=;
        b=ogIh+L01E3rMNm8zmms1OHbtp3+BIXKaupazYoAH3QGuVZ3sqX8rhiCNl7JUvvrpmS
         Sx8mr2hEjDVKINklhL7lLIk58n5ZOrD90mzcPLU7gzBYQ4GClJwnaoMhfazNqPtEKU8H
         A8YFfpYNfzTFjGRgfea6cqFsL8Iinkurk8ZMVn045Lqo9TxpDdd8do7coALhJ1vqYopt
         en914A3c3fERwyCyS2EV/72S14TgeTXbFc0IDvQ5701L173iS0+dN2HW6L6xVVBslXLA
         fEsCCPZmIZaTIiSxz6d5TNp8nzRM8lmyKzFHsqHo9FTn9bgy9PliVF7TTt5c8EbhpzWV
         x+nQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFg27njobFw+NQnC/vKfpVtOXEUvKWlYzsXugJW4fHVDudVtL1mblsXZqN0kN3z2mnZ77mgZXRybtZXYA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj7Ertk1i7qEt/jjAflmUglseKb0Rowun9okLwHoCAP3WWKgNK
	lUGa66t4IBiKXQhXpMw03maoBowzokQlPBaHAisM6Z64UL6erSLM5Jlhtykd5gws9Qo=
X-Gm-Gg: ASbGncunfDlisX5Uow2aF3qBRjFeVf+KNvsIkLm76zqXsE1ONDtWIdv39QArqIxE07A
	LZtPbsPCVyyXPsO7wZCDMhjrjhz3DNdGRllOpIZVw2l4gaFkbUbZelSOImggcBNKxmMAc9JoGZ0
	/fsp4E6ffIOsyccZdf+lumW9l8PxbteTk9AbuQLp1ptXWQHpg2MeHqGT9TG9p3u29wtRVR+pJrb
	szMJ2Ml/EFAPkUBKSaw54mlrYwNv39vGcGGfGYGI7EMkKIo57rP5E+IFS7d5jNG2AZWQcJQYKkr
	W2q0W3avNqEq7UcNjS2kPlgYeALX+PX7tEYX6wPUDERnmtI/UXf2OOVIZG8eodAi
X-Google-Smtp-Source: AGHT+IHfPMYdbRyv2lDo4Df7tZa8JhMWmqJ5xTNyY8GATqJ5hfSOIDKoiZq2XLjT+/o6Y7BqLz6SBw==
X-Received: by 2002:a05:600c:64c6:b0:43c:fceb:91a with SMTP id 5b1f17b1804b1-4531de0093emr23790175e9.11.1749558960814;
        Tue, 10 Jun 2025 05:36:00 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:4d:e52b:812d:eb7c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45307b4788fsm91008455e9.21.2025.06.10.05.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 05:35:58 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 10 Jun 2025 14:35:38 +0200
Subject: [PATCH 4/7] media: i2c: ds90ub953: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-gpiochip-set-rv-media-v1-4-c088006a152c@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1766;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=6W1fcEZimkIBP6TJfRKXLMogRIa4qaWvK8I7PtSZn7U=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoSCadgZNCGVFxZVVgaNpXwu+Mm+iPf/1j9OnjS
 h6B2gUmkKuJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaEgmnQAKCRARpy6gFHHX
 ctu+EACFkCbwSoa4iv+9cVxVDtv4cv2EitIDVYBEwHyML8ePPxpTHLWdYCwMUNCYk+QXViqfZ5E
 GSi5XJ1K3P7JnOU4+RjKupliJekYJkcj9T96GcDKPgh2C39AkFUnGUDGyLdGDqYoT6c5Fsb/U2S
 0BIsPkWJZGZbJIul0RbAAMO/SnMfXNLHUhMpfEWUMDsD5Md2QO4flxYBCDPLTh8MaibGSa1xnEO
 tfTSTEPTj2psuOYw3Mp/hgg4cqi2+qygmQBYCIqMErri6FrJluhbL1hSHVf3+ZdtypLKj4CJKF0
 GRYFoAFKlt55vzDzxj2qebHPmCwr0J1RZTK31OOanB6psbaR7seEsNAdQeSIv6153VwYXPIDrny
 V6bhda2T0gEviWbCfZ1DEJbvMORv4wc3bm/Md3/eDQOxeJnyxn0CVMIuXfIpUV8CH+NpXHuTAXY
 +eTvOs8LnnLkAc5c5bZJN+N1zSGl9SOttchRalCO4JUPknR2ZUef3RRVHVV9UqaV7xs9CvGx59z
 RYkH8tiMuXikYvRlsHQibPLAk52NL933ARk92kdgqGtrgRiOj/bgzQe2TZ+Ttmmcapp2n7RZu7h
 NQmmvLreQXMGbiHSuSPC5bVNg6tv7S/Ff5v7WHsymifG7mFjbOFFqT+XnzdjSJIZTwwVQMF2z5B
 uFM17C8ZjdeYJLA==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/media/i2c/ds90ub953.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/media/i2c/ds90ub953.c b/drivers/media/i2c/ds90ub953.c
index 59bd92388845eedf64587289c7f7424ee570524a..242dbf6d48f3905c8908bbb06ede84e068e2f267 100644
--- a/drivers/media/i2c/ds90ub953.c
+++ b/drivers/media/i2c/ds90ub953.c
@@ -317,14 +317,13 @@ static int ub953_gpio_get(struct gpio_chip *gc, unsigned int offset)
 	return !!(v & UB953_REG_GPIO_PIN_STS_GPIO_STS(offset));
 }
 
-static void ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
+static int ub953_gpio_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct ub953_data *priv = gpiochip_get_data(gc);
 
-	regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
-			   UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
-			   value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) :
-				   0);
+	return regmap_update_bits(priv->regmap, UB953_REG_LOCAL_GPIO_DATA,
+				  UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset),
+				  value ? UB953_REG_LOCAL_GPIO_DATA_GPIO_OUT_SRC(offset) : 0);
 }
 
 static int ub953_gpio_of_xlate(struct gpio_chip *gc,
@@ -362,7 +361,7 @@ static int ub953_gpiochip_probe(struct ub953_data *priv)
 	gc->direction_input = ub953_gpio_direction_in;
 	gc->direction_output = ub953_gpio_direction_out;
 	gc->get = ub953_gpio_get;
-	gc->set = ub953_gpio_set;
+	gc->set_rv = ub953_gpio_set;
 	gc->of_xlate = ub953_gpio_of_xlate;
 	gc->of_gpio_n_cells = 2;
 

-- 
2.48.1

