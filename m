Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B624468B
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 21:33:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749677631; cv=none; b=usdazhxAyxEyplhE4E+bTrcbJL6rTpXf3inWlqPHx6j+57+RtZVuwEXogF8qVFpuuc6C3mB4NvPmrD9HO7nGLocr8aSmqsTae0bOrCZl5W/UWaa4fcMTqg5t8A2U7A2x9eF1VuJzfDKBLD/IqbCGNFAbOe5fQLAdO5IXssmCUoQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749677631; c=relaxed/simple;
	bh=bsXjItfjIlF4mpOX6PIPZMbV+Bz7PTraCSfE6A/WZ2o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kji9F8zsUZO/zXphsppgiS3Cp5fLbuc3RYY9mn62B70JVeiGqtubihbALsYkmslTw5yfiaNPqf7zJSccPG56wg6BE8rmX6MNFj6GTZbUU4ogb6kBE927XH40QQnsW3CSw9UMe/NuYHzou05eXe3d167YvUh1nphE8cxnNNrBQdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IWyHRAyh; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IWyHRAyh"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-407aac76036so169141b6e.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 14:33:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749677629; x=1750282429; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QaR1O7T46/e+4OFiKZVwJfA8WtG54T6ucoylR5V5Xto=;
        b=IWyHRAyh2q23XR+DQSYcUuu9PuyygS8NbEbk5H37heZtsPCRgnSHS6FlFdbWWi2t7u
         fCBW5Xais9hsJ2mK6tB+avom7Uet25Mti8Alw+hKiq5qBGMI2IjEaMAGsNZdf8CLDjTw
         g/vZ2LSNC7dk8DwCVHp47DreY0dV9E/YLxiC3XMLGMzcVwJC8jP83Ltr5m4Ojbi0vaAq
         fRORP8ne18BAAy55ZdyorgSst92ZoCDPzqwDPQ21ARdBODdGSySTbuxeTDAOmHh/6OW5
         DTwft1FQ++E1s8yB4Lhk2kZjXVWJVE1guGNwVf3iImrxn6RJZL88nJ4bNuAxvA3AYT29
         y6ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749677629; x=1750282429;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QaR1O7T46/e+4OFiKZVwJfA8WtG54T6ucoylR5V5Xto=;
        b=niX7d2jLTqYqfP6yifrilDCqSgB9TL820QgWGh8ij4rjxr7MZUDHSSt5ZFxn0q2zAq
         ULn6fvei8mSQf93UotFW5PpMjCyaoLRpc8pQB2KNZcX9CCrOBc8hKhMJIRKTtThEwuLa
         KXM7zMBBe0idFotOWoMOgKENzTRzbdfdaO9N8Fyo8a82ttRtdkp6mSYktNwoSu7Y5nvx
         gMnLt5PuqA4KkDZ6lqG/yFJuEVcbSpRfXt0vS9wJ5fKWC8mjSx6w9cTuA2GMZknz4ypy
         7FfiozdssHYVvbdWqKBKZkGWy3FHsXnIZlBsAGLpyZqdBAUp7awMuJn1rLkG5Q3yOOPr
         67zQ==
X-Forwarded-Encrypted: i=1; AJvYcCUvSzQyhGdsynLGpGkY55O30RUSiMoLa7f8ra1nJ5oanf9y6G1TPPyn2Cr6zzA0c99COow3dcbsJkiKXlU=@vger.kernel.org
X-Gm-Message-State: AOJu0YywfvyC1wsC1C3LIMvGttFMUwCIRJmfopA3WR7fZK+Oyk/yTZZ5
	PfWIGW4GD32DdkJc40+AcCLpoFxjgH7BeVtI3NkkTHY5Hg/+rA8gDCEajSIZ1y4yRiY=
X-Gm-Gg: ASbGncvRbmhNWvQs0qXMDTAHhf/0LXvrQXjBd81Y6cpyXe1meOGf1vUnRas0oDJJq27
	H2eVGSTVr+1svOBuBxjQWJnhevJ4uBxiDxVU/pXXvnv+JM7bqvi9/SxroTYalVcs8ozJVcioIgh
	92l0JjKD96E5mZAaaHnuadRDh2G/o2nNpp3FJ2PFj3JlSJck6tJtSBipZm/fWkTop5/djzKeLvo
	NCu9nl5ui3IRbMIwBzq+UjuRNHwkd1ZxhJmr1wAivz1AgwdxiB5EVN6/yUZcpva5sQ8j0g+YjCR
	x1/nnCV5zsVJ22S+7ZhrTm1fNdgWjuKSrTmUMoT9MtE6XXAhOMOpx8U2i9vUL10Xv5ga
X-Google-Smtp-Source: AGHT+IHSIqmpgFI704FCWcftRQq8j3a/a2UfDUj0eB9CNGvobPtddrpb4tcsnxsxsDbtHvuDl7rThA==
X-Received: by 2002:a05:6808:3087:b0:409:f8e:727c with SMTP id 5614622812f47-40a66a419bemr475432b6e.5.1749677628865;
        Wed, 11 Jun 2025 14:33:48 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fb0bdsm2262b6e.23.2025.06.11.14.33.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 14:33:48 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 16:33:03 -0500
Subject: [PATCH v3 3/5] iio: amplifiers: ada4250: use
 devm_regulator_get_enable_read_voltage()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-3-bf85ddea79f2@baylibre.com>
References: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
In-Reply-To: <20250611-iio-amplifiers-ada4250-simplify-data-buffer-in-init-v3-0-bf85ddea79f2@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Antoniu Miclaus <antoniu.miclaus@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2721; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=bsXjItfjIlF4mpOX6PIPZMbV+Bz7PTraCSfE6A/WZ2o=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSfYjPh0zoRqAxnaVZku8YBtsOStzbQ3hW4OWQ
 5GqapvEqbSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEn2IwAKCRDCzCAB/wGP
 wHzOB/9MY+J7iMqc9X5TjdHUYDxU04NDw/iERF0zwegoZo4pMJxbqEuy6pB31f1jDANUVHCXB7F
 eBmAlytR+4kcvLH2H5L5Qna/xqyUZeCM8hcrVxa6q/rlhfi1FU996VOal5DiSmUg+r1lf0xMrad
 rJwx308zXliRqOKo5jxpUqb7A9axg4z2PfqR1lf24d9SLhXy0QUNBFtHE88AbEj6vLEJtQqlaGa
 EFBq+7kuSXcx+Hs4+fx0kg5CxZm5e4blRd+aXKcTZHq0LdKhFIxy7w7yw054goueh+TVci8O6G1
 8dKEVSTRv4vwOx6woFKfigNowbHmSg7Ja5pBPBGpChnm+C9+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use devm_regulator_get_enable_read_voltage() to simplify the code.

Replace 1000000 with MICRO while we are touching this for better
readability.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

Note for reviewers: if you are tempted to comment on the new variable
not being grouped with offset_uv, see the next patch in this series.
---
 drivers/iio/amplifiers/ada4250.c | 27 ++++++---------------------
 1 file changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/iio/amplifiers/ada4250.c b/drivers/iio/amplifiers/ada4250.c
index 1bd7c0c3c695b3872b8c389fb4ae89bf5d24f51c..c367c53a075b26327a221e0c3a9dc8e788891f32 100644
--- a/drivers/iio/amplifiers/ada4250.c
+++ b/drivers/iio/amplifiers/ada4250.c
@@ -14,6 +14,7 @@
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
 #include <linux/types.h>
+#include <linux/units.h>
 
 /* ADA4250 Register Map */
 #define ADA4250_REG_GAIN_MUX        0x00
@@ -55,9 +56,9 @@ enum ada4250_current_bias {
 struct ada4250_state {
 	struct spi_device	*spi;
 	struct regmap		*regmap;
-	struct regulator	*reg;
 	/* Protect against concurrent accesses to the device and data content */
 	struct mutex		lock;
+	int			avdd_uv;
 	u8			bias;
 	u8			gain;
 	int			offset_uv;
@@ -91,8 +92,7 @@ static int ada4250_set_offset_uv(struct iio_dev *indio_dev,
 	if (st->bias == 0 || st->bias == 3)
 		return -EINVAL;
 
-	voltage_v = regulator_get_voltage(st->reg);
-	voltage_v = DIV_ROUND_CLOSEST(voltage_v, 1000000);
+	voltage_v = DIV_ROUND_CLOSEST(st->avdd_uv, MICRO);
 
 	if (st->bias == ADA4250_BIAS_AVDD)
 		x[0] = voltage_v;
@@ -292,11 +292,6 @@ static const struct iio_chan_spec ada4250_channels[] = {
 	}
 };
 
-static void ada4250_reg_disable(void *data)
-{
-	regulator_disable(data);
-}
-
 static int ada4250_init(struct ada4250_state *st)
 {
 	struct device *dev = &st->spi->dev;
@@ -305,21 +300,11 @@ static int ada4250_init(struct ada4250_state *st)
 
 	st->refbuf_en = device_property_read_bool(dev, "adi,refbuf-enable");
 
-	st->reg = devm_regulator_get(dev, "avdd");
-	if (IS_ERR(st->reg))
-		return dev_err_probe(dev, PTR_ERR(st->reg),
+	st->avdd_uv = devm_regulator_get_enable_read_voltage(dev, "avdd");
+	if (st->avdd_uv < 0)
+		return dev_err_probe(dev, st->avdd_uv,
 				     "failed to get the AVDD voltage\n");
 
-	ret = regulator_enable(st->reg);
-	if (ret) {
-		dev_err(dev, "Failed to enable specified AVDD supply\n");
-		return ret;
-	}
-
-	ret = devm_add_action_or_reset(dev, ada4250_reg_disable, st->reg);
-	if (ret)
-		return ret;
-
 	ret = regmap_write(st->regmap, ADA4250_REG_RESET,
 			   FIELD_PREP(ADA4250_RESET_MSK, 1));
 	if (ret)

-- 
2.43.0

