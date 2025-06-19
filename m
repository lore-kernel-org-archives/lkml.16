Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40F52265CAD
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 08:33:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750322019; cv=none; b=fSy0GhmSyp6Rek3/99k3qzTKFRK+QxAy479b6bIoBrMSXS5BMaeyTepO6IfJTkq//c8S0XAGoyq7Z+nMHOc29Xn99WogASvtaXbUckdyZ/8ihOKjgbZkCRtBph2yzPj5zPEVirUydDkSbLm3VLQQhzSuoNQOouwpt66KwwKZmVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750322019; c=relaxed/simple;
	bh=cKZpAhtifR8xk5RPiheRH/GzBlWm98s/1BZyILH5nuc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PAoRgHtvCiqpe9GOCC3QCGUD7uGTe/bh0M7wGlr2aYJA4f/r9fXZ0NCsJdSmBAjSz1gI2qsoYIYmZgTFh/gr9cMnkTV9TMKRxn4xpdTznWqDAFqPDabZ47lqIRyVp3NztK8YbjhX91e+HdwY0/Ee4ujZDZkF2D+Fle7O8PBZn3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=W3AhiyfY; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="W3AhiyfY"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-450ce3a2dd5so4272635e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 01:33:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1750322015; x=1750926815; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2SDdps11Q2eLdePG5stsUwakF44A60m55NMmpcUnFIc=;
        b=W3AhiyfYGjsT5PFZIldrXTCm9McBxYPYEShpu4ls241Z6hdb8sR3bcxUGqV0bMER2I
         9XMoZgiGgFIU7lFFjLAFK3/1RqPB7xKg3HPCHyOfDF31qQ4o7icdVE2q/itjGqlZ0YCW
         xrQw09EUZE8Zksm2vRH79xYwkKt7bms6yA5HgWimdQbCGc84T1ncAsn2xa2kTZZ55r3G
         fdQ6sL0UqaUE+/02Az6wcXg5QvyAfIxXIDhRYcOhmBm6grD/pS8DyakZOgpy3gbEatfg
         jBWNHhznHsoftuVHlWBPyBCLBjGixwlZAVXDtZzLwQ5Rv4r2cCf7w2rcz+rwetu++JYT
         9LEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750322015; x=1750926815;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2SDdps11Q2eLdePG5stsUwakF44A60m55NMmpcUnFIc=;
        b=gV6zlQ0nOrXRL9JnQrTCFkII+jFDvUYrVmZM1ngmEH8uuvL5iSi/5WJ1fIae5kdcIR
         zf9K5YoHjNyWXCC04+hNj2PjxjsmtUo4L48842pDn14/dkKE7t5lrW5S+JrCiEqrodce
         bp4b4Zc9Y8iVY6/WUoqUF0tH6mOwb2DBxv3XrdVgZSTIq1O29IjRhItYeee0Fh/aF41O
         hgaAU8u5pLCbxFdg+j1MX4/nFqUPr0tAb6RhVF2ffNsjroUih/V3RKQnZ8lealvd+IBi
         cRvwyVkIMvhW09sOJqN3tbxujifgpfuLNgmUVUY7ctt0asuUB/ehzdoDHIs9Zudvvxmq
         JUaQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8fxFf540qCvGFfnjslrYDaErkMKy5lBSpd0JpEaxDtRid0tdeeLrChKP7qAobNG1jtAuxc8Jhh5nmyqE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfvQ3eAGRZXPMTuqWfWpY6jszArcfP2ablUve6/8uY3rsHm10k
	/X5GveP/jPoD3sivdCOpttraTKAlyBv/K9xeZ9IAwajrIwfhxdzYBJ2HvXJOEQcJaQo=
X-Gm-Gg: ASbGnct8r0b+zUkOzLheE78499Uepb0sTh1YaaixVM3C6LP4Ae5T5RkrZZBnQNTN3lW
	ce3VuEinSC8fVPWCkc8NXAqksrXZGvChp4oRSxvfk4DsILTSa+HgVP8ImyFu44lod3A79xZDEKE
	PgmxtIatbDAH6orK6bSk7B+/cg4A11om+jYQvnmob+Ix8AjudrCzgfeKAn/uA8OU1gFqherCwB0
	tUQGce/7ZOwXKrk4KKRhRnclGjZfd64FKMcU3kTY8pctYYR1hiQjdLmisG4Fmm5RA7PLeioUjIP
	rjUC+VF93nwjqnzO8WcCZGpen/30azY6rQlTUEQne8DBy1RD2Cb4/7MmrSAh/XpTycU=
X-Google-Smtp-Source: AGHT+IEYlToyOJr+R8YXFkFhSULjEkR2OowLuJCLc5w/3XKdZxLCXJx6NMKNblG+ZhhHv+GOy+JYng==
X-Received: by 2002:a05:600c:6207:b0:43c:fe15:41cb with SMTP id 5b1f17b1804b1-4533ca76ff8mr219841245e9.15.1750322015343;
        Thu, 19 Jun 2025 01:33:35 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:c485:fe15:c9ab:c72f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a63a42sm18828151f8f.28.2025.06.19.01.33.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 01:33:34 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Thu, 19 Jun 2025 10:33:22 +0200
Subject: [PATCH v2 09/12] gpio: reg: use new GPIO line value setter
 callbacks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250619-gpiochip-set-rv-gpio-v2-9-74abf689fbd8@linaro.org>
References: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
In-Reply-To: <20250619-gpiochip-set-rv-gpio-v2-0-74abf689fbd8@linaro.org>
To: Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Andy Shevchenko <andy@kernel.org>, 
 Orson Zhai <orsonzhai@gmail.com>, 
 Baolin Wang <baolin.wang@linux.alibaba.com>, 
 Chunyan Zhang <zhang.lyra@gmail.com>, 
 Robert Jarzmik <robert.jarzmik@free.fr>, Heiko Stuebner <heiko@sntech.de>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1851;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=mTukrDx/R865Eocr4BQInw+yzkmSNTUOuezPg7apBCo=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBoU8tT9TjfCO988cJoPpaw0anioCZr5/SZzCR4/
 DPRgt1RWO6JAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCaFPLUwAKCRARpy6gFHHX
 cqwAEACHem9z95tLu2mdatXQMsbEwEicFLRuj0CKjbLo6ddh0GNFaOmHiWL6TYjpWH5luCWeMji
 qr1REYJYG2+rMFPuZQPUyuhA1rjAiCsrWtl/bG1cZELYCCUs4vTIYgeEp2/NsoHpfOHN+1aAb+Z
 cxfAS9JLi0BgNAH5ji3H1LEoyTV5WC2TEAZjv90mZhXYbKXVgC47+jmunaleDfmjku8MT8/8Orx
 uU5pL9dxB99qCZeNNZsNm6K68r2sEJoEjTAVe7aRTyI/GTM680rIGfT1+rWSHaV762HhWV9xM/h
 XY943W99sLzAtIu/+fEObsJOpIgMARGHIv/73HK2929fx+Gni/Kuy8WaRWYnDUONLxu9Tr0bLQB
 KbfvyCCWvxqlNvkm/dWG7MOV73RahG9L9ihNjZPRYXra5NRXstQ/xRttFCsYv7zkLnb6tJOa0e5
 z+1mU60ZwoOB+XoH6XvWBCGVaBfR8gh+GA1IfVSnndtvh7Q2H4ZYUniBVwnaRsS2pxLb32R+4iq
 zX5AV+tgLtdpL3yOnU2jfRaUkXt5MpQ+3r78F5PqiamJZzDRD5PbZP1uj3HOHYIHZLa4gtP6gWd
 yEYw21OVubU+lwFvfM3IHdUhbQFiuc+J41nWd0vt6pmrx3LdNUX70dveJQRLfE8MtZESyFB9BB6
 4sqwsUIoOUevrKw==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

struct gpio_chip now has callbacks for setting line values that return
an integer, allowing to indicate failures. Convert the driver to using
them.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/gpio/gpio-reg.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/gpio/gpio-reg.c b/drivers/gpio/gpio-reg.c
index 73c7260d89c083a702b1d914ddca7a573a37de4a..557dd77ce30bbca6174babbcabc965cdcec57896 100644
--- a/drivers/gpio/gpio-reg.c
+++ b/drivers/gpio/gpio-reg.c
@@ -46,7 +46,7 @@ static int gpio_reg_direction_output(struct gpio_chip *gc, unsigned offset,
 	if (r->direction & BIT(offset))
 		return -ENOTSUPP;
 
-	gc->set(gc, offset, value);
+	gc->set_rv(gc, offset, value);
 	return 0;
 }
 
@@ -57,7 +57,7 @@ static int gpio_reg_direction_input(struct gpio_chip *gc, unsigned offset)
 	return r->direction & BIT(offset) ? 0 : -ENOTSUPP;
 }
 
-static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
+static int gpio_reg_set(struct gpio_chip *gc, unsigned int offset, int value)
 {
 	struct gpio_reg *r = to_gpio_reg(gc);
 	unsigned long flags;
@@ -72,6 +72,8 @@ static void gpio_reg_set(struct gpio_chip *gc, unsigned offset, int value)
 	r->out = val;
 	writel_relaxed(val, r->reg);
 	spin_unlock_irqrestore(&r->lock, flags);
+
+	return 0;
 }
 
 static int gpio_reg_get(struct gpio_chip *gc, unsigned offset)
@@ -157,7 +159,7 @@ struct gpio_chip *gpio_reg_init(struct device *dev, void __iomem *reg,
 	r->gc.get_direction = gpio_reg_get_direction;
 	r->gc.direction_input = gpio_reg_direction_input;
 	r->gc.direction_output = gpio_reg_direction_output;
-	r->gc.set = gpio_reg_set;
+	r->gc.set_rv = gpio_reg_set;
 	r->gc.get = gpio_reg_get;
 	r->gc.set_multiple = gpio_reg_set_multiple;
 	if (irqs)

-- 
2.48.1

