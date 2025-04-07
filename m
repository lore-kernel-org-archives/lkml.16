Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00547226883
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 07:18:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744010298; cv=none; b=uea0ojcOl9cvG4f+y20MDZD3OMM9hfGQzS3PhJkkN9CoztRjbi2rAeBKUf5BIRmnGwMcvKiQpE3nm/JrjI+OJb/KGsQ3peAh9EIXgX65eI26HGBAfnixD8IHqjUNCaeDI5I8g2I+Rptah6DR/T9RE/XQFj55i+re+QhIJ95HEiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744010298; c=relaxed/simple;
	bh=qh02EOpLmoVQFOGtxc//WQmmDLs4Qdqs4X8qzXYsbtA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7+hm1cJkoTHjeiwknU7D02GimPl/om+8ccEokNn2sU06rUnjoDRlEQMRawP/+G90Q+5vELzzQa9mE8j64zsBGk7ysS216bYMyO/yWv6muoR/ddmlgzRfTn03aFGShv1rItSG8Zn1bxWHZAMH45hulqeO0gQy1T6QwDCGxt4Btc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=DIq5wTZO; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="DIq5wTZO"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-39c1ef4ae3aso2185227f8f.1
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 00:18:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744010294; x=1744615094; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFYbotP5fmTf+KhkIn7tkSgVn5aK/YHRq/3B7g/SlrA=;
        b=DIq5wTZOM91ezm9VxOmDL/5nW0ZxoLsQEvMVZSavLoBQ2GEVUkyw9rY1qaVik8NcF7
         pRu0kSyQt4Ts59tjy8U4L2YzU0PX7MiPDMlmw2qA+XZarO+AThnOfEL4KZ9QqtwsBCjy
         VxbnoGSNzNtpDeelMypqZKcYbgRKQ1k6K9pfAolmLmJMLmAt/d4ZNKh99iHDu0TvlrOt
         0rDBPtqqOh2sefyN/ylagCNHFgtfU99Ryf2hoi9EMuKdEt/QkLnbqX6U7//r7yP3KrhS
         /wsEw8huEKljfVzdu9soV/MqXBiwHHIlsYrDdvk1yf71K/E3x0cy/EAwL3JdxsfMg7Mq
         TQKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744010294; x=1744615094;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oFYbotP5fmTf+KhkIn7tkSgVn5aK/YHRq/3B7g/SlrA=;
        b=FvGcRXOD3mx40WiO33Q54Fswmsk2/9OdNkP+1465lGUCAZNpmXoGDa0a8pPjz832v1
         OBMAxmKL41Cp65nc80+QoOZoOPIZBHbpwq6MsPSUq0rewthxVgYlF11Nw8cvKC26pQ0M
         gPgBIrV9KPqtZ5HW6IzJ1yB4pSEkg498t0WKCriFj5yerl9ukO4FN5wYdgLCl8OCIH2I
         5zqepiBXqbABOkwVuAnl9fJzY1NVfA1niMEKyqzxx9tuqHZceJyw4BaDWL/bw6Aq8o32
         i0cClBZPjuBriVJkALK+K57OAL20bsVC+LlPSpUNT19WGex1TIF974QkiOD5tn+JPXdI
         nvZw==
X-Forwarded-Encrypted: i=1; AJvYcCV0biVIzNdVtH6zGVxTz5MqmiZS14i4atSs+HR3ZaL0Wqn1kKfxC2KOK7gGAR/6tznFS41DKyBZv9P0hyA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBEAFyacmEkiAbK46LmBN7Zx6qLwjSzEnMKfVjC7d16bLlglAt
	SSb7ct6yyLaNth6eZSFtYwI5Ygf9H1wZNz+9omppbcIX446cksWM7jpbRv64uBI=
X-Gm-Gg: ASbGncvZRPJRAcbNd2ZWhYOFHwTOflLz/reTuOivdoHNX77WFK/47Ma0h0O6hDnHRnW
	GQrcFjJ5h0NZ0nzyQeCsIcYLvl6vINKqQ9lfnf1bbuEITBwa6+6QetZjKI7DiM1u6xb6RmB45MQ
	yprkzmzJWNsu3KFoVkENzQomz30OxZrn55+0KqwKlMoK8vWhdciVm2/Qnnp6zSgQbzqgDCtSA5x
	XHrjzXvA8IlBS679GeqVTBnIbUwyrRbcAbcaIU/fvcjEuH5pG21s8n7jHKJ2lDoZiTp96WLbVh9
	SgfelFS8cYO3BTbjNXvwaP4YwNhqwpew3v3UZw==
X-Google-Smtp-Source: AGHT+IHdzlVUeS5mJkviPZtuB2uw9FN1NeOxmWH4SG/0ghkS1vaZxYCoVQJ7a8Egu0T4TP8eDMqtxQ==
X-Received: by 2002:a5d:59af:0:b0:391:9b2:f496 with SMTP id ffacd0b85a97d-39c2e621a3emr13954581f8f.16.1744010294242;
        Mon, 07 Apr 2025 00:18:14 -0700 (PDT)
Received: from [127.0.1.1] ([2a01:cb1d:dc:7e00:8c64:734d:705a:39a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1630f21sm125224455e9.8.2025.04.07.00.18.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 00:18:13 -0700 (PDT)
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Mon, 07 Apr 2025 09:18:09 +0200
Subject: [PATCH 1/7] iio: dac: ad5592r: destroy mutexes in detach paths
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250407-gpiochip-set-rv-iio-v1-1-8431b003a145@linaro.org>
References: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
In-Reply-To: <20250407-gpiochip-set-rv-iio-v1-0-8431b003a145@linaro.org>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-gpio@vger.kernel.org, 
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
X-Mailer: b4 0.14.1
X-Developer-Signature: v=1; a=openpgp-sha256; l=1118;
 i=bartosz.golaszewski@linaro.org; h=from:subject:message-id;
 bh=XzPoG1yue7TTDzwJnpp3K9VyK//i5C6T3BQHGpW1rkQ=;
 b=owEBbQKS/ZANAwAKARGnLqAUcddyAcsmYgBn83wywmyOOD88VwORmWru81fcLV3QYv1XG/rvC
 emcVWAZtXCJAjMEAAEKAB0WIQQWnetsC8PEYBPSx58Rpy6gFHHXcgUCZ/N8MgAKCRARpy6gFHHX
 cqfFEACz71tG/3HuelbJ6Rrr2frDLyUukL8onqRwqZiYWvP2v00lklCU8eOTbzlcce97uUaYV4i
 7mTqzUgEy+rhhPrNgyzc510WcMQQIXDLOSDRj57nwABQeeVOb8JEBS2j/nYoNSbv5XIUMANI0Fn
 i7FWPzY1+g7HQipYpIRm6/gv+o49kw2yp5uAO3DrHnJBbLVAdOo92D8fsLAwnmTG+xC3oUa543X
 WGxiY1DUUqC3YdmvJDrqpey0q8sKK36bOFqtpC9MwhkIaQqvEvPai+nTN3K+Em0yy0CNnUN8V2x
 HjFQPvb1GRLlCZ5lD2xObaYh+ilUynNTA2Oe5bqR1/Ylb/0/jo0GYERiyuB/yVk3FC359a1axap
 P+bLuCrSMIz+E3/p5vLT020cxg0vR+FcGBExYWBICD6Qzx83IpsYSP93Zh55sds/nKbcbSjSjFQ
 CqYVE+zd/DlH4f1ZLumoG31oIOa2dreLrWTXvHfG4kVLRbScIOrFdiUjTFMkoxJQCx270gJeWrP
 uyIfIoImPWueOPQKDC3bfBTaWWtUgDH3fhIY6LMf4XNwYGcXQmHlUEiUa/C6HOkXLUJggNsQUiw
 K8gwxrpumAVtISXOxq9aN+D/cMWuqi6tFOarPths4eY6Y7covbIKNvTNK/LAz78aR5IRiRgdDIK
 bqI8blnjoJd/QqQ==
X-Developer-Key: i=bartosz.golaszewski@linaro.org; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772

From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>

The locks used here are initialized but never released which causes
resource leaks with mutex debugging enabled. Add missing calls to
mutex_destroy() or use devres if applicable.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
---
 drivers/iio/dac/ad5592r-base.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5592r-base.c b/drivers/iio/dac/ad5592r-base.c
index 50d19304bacb..fe4c35689d4d 100644
--- a/drivers/iio/dac/ad5592r-base.c
+++ b/drivers/iio/dac/ad5592r-base.c
@@ -155,6 +155,8 @@ static void ad5592r_gpio_cleanup(struct ad5592r_state *st)
 {
 	if (st->gpio_map)
 		gpiochip_remove(&st->gpiochip);
+
+	mutex_destroy(&st->gpio_lock);
 }
 
 static int ad5592r_reset(struct ad5592r_state *st)
@@ -622,7 +624,9 @@ int ad5592r_probe(struct device *dev, const char *name,
 	iio_dev->info = &ad5592r_info;
 	iio_dev->modes = INDIO_DIRECT_MODE;
 
-	mutex_init(&st->lock);
+	ret = devm_mutex_init(dev, &st->lock);
+	if (ret)
+		goto error_disable_reg;
 
 	ad5592r_init_scales(st, ad5592r_get_vref(st));
 

-- 
2.45.2

