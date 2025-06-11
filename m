Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B145925A351
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681756; cv=none; b=bPJrtUMyhLuoKVhQ/+mWFUmjGDrlorwJ5fOk1nUEME73SyDKuwbkabetXX+1hY/+UCQzU3wrxggPSfCK6R7tnoCWCWDaglqf28Dejyf/ZbIFrL7dj6dGuU5TLUG7YqdEwcSG8hQvhhDJJR/JxZ6vswrQFMj2zBzkVxU3+tifiP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681756; c=relaxed/simple;
	bh=WSd14gc0IglioCpRcpapejeZeHyJEdiW3ePuDI+8374=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iKVfDv94GXerpfyMTDnslYWmE/1xL4QshFT7B+/nU9F0QWjRFVEaWzGHE2zOnU7pCI+Vhs48Auxx3eaIJZwmMgwSG5Hzeq80uiB0JefrdoDFKhGf5bjgkAeDk7J+V+Wc2jVrWvdlyR+Ixf8axMh2aJDYc2QyOkXr//Q74b4AK0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=cj/rOsUy; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="cj/rOsUy"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40656384d30so225654b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681754; x=1750286554; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=;
        b=cj/rOsUyWcgzE+OWhmKctnPbbOOt9oRC4UgighH77MWzMrMkc2IEgg10KzfbHNS+ne
         66bYbwGBwu756qRmsMSePG99OKC3xMGEy4SV2+7YnWQzvcuqMYGXItoDdheIIKYKPus6
         qdWfckiAxyR9f8RmJACZDz4jf2llWbUXfo/MVhjfM5e4N7xSGN1KMVLkxGtiqwXzDabg
         m3j7UGFI3J9cClCPXEnbNxA2Cwu794+GENp6WaG9xcfQLwtSzc3NS5PUaMdq4I9FeXW9
         PB1kfaA6R7+3QrP9zJC0Xc8rpUWRLCQmI8aghrPOz2xoAOzIfeYBzqqZHwd4DbFbpxlU
         Hbkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681754; x=1750286554;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DVj0z+6x0ImArb5yGvcedbePq6HiJkWaJeSxbPqOIBs=;
        b=ZKHWVOC1yf8gtQLEJ2wqMqEZWb8Lt0maZQRG7IiEd8J2Moe0stfXI9Vhj2K2f6J5dT
         i0fDJwdfqpEJUDYPJk44tnM7wwUkh1gnWVqqlWtW33nV9DTMV3ZoiuWfz+ne6RrB3LIR
         tNUl0I4ozAdmrO4J5aytkjj+hZ1yNrVlMzVPLaWMHaZRtVateN95tusG5xOaBJdAyFGV
         EMWM9ZZdUk33JEGSAj9R34wOzDqaL4zRyL2NkcBsnTj9nmIBP0Ov2Ms36l+YHBDa7R+7
         1wrwmyPv+t34/E5a4K0vMBPpAA69uSTaHTkgBy+J4oTGyiybcgpalMfD3y6fz9Y8x5Ln
         MZuA==
X-Forwarded-Encrypted: i=1; AJvYcCXJej8yJjF3M6+8o3y7+I0+fBlTy1aasWj1FjlWrb4TQq16kUxzF32TOCnfFQRxiimz/rVPD9oFJJDhR5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOBCJjli1B+R/3wZSIaP0kluywYg/uo8DLNjwMo76ysv85Ro0j
	ttP4YVzjlvCzSqy5VOSwZfKBFFodP93ZzcJdUtLT9qlH1fA90Xa1FuNv42QFremlSP8=
X-Gm-Gg: ASbGncvGhZ+YWqYSKryXnXvBFDtWaiD02/u3s542sD2gemTp2lDoLE58K+juBxjtFPn
	YWZd5TmQ9u+REvvLjJqVK/H25oL1roS0/O8U6jKbKmJGAiI+k3SL88lAVBQNXNJAhDFuMyJEWzi
	PPwo8yYSr6ktfphEfGD+OqutlbMxYGIkrkWHT7tdjdBEoP45POkrkRo4AYGx8sVTZXFp+2bMidZ
	z9FSByveE1wxj+E6kwF6ZNWr9vJ4KF8oTdj0G0RW2DvGb2wOiDUyxnH5jUfk3N8pEqcEVYp6tR4
	kbrOa9+HU8mt5XV2DNbolJcKSo0SblIlhDrPgwOVZC2PLR4aZexK2xoGgSlZ8IJlfzbQ
X-Google-Smtp-Source: AGHT+IGDN/KHxz9Bnp8yALdHvhwtdj8HwBIeOVLJvupWPyPhdbyamlXaAmqI6CHUMik81UZ3hpwyHA==
X-Received: by 2002:a05:6808:2223:b0:403:34b3:c986 with SMTP id 5614622812f47-40a5d0b202cmr3734055b6e.17.1749681753896;
        Wed, 11 Jun 2025 15:42:33 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:32 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:00 -0500
Subject: [PATCH 08/28] iio: adc: ti-ads1015: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-8-ebb2d0a24302@baylibre.com>
References: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
In-Reply-To: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-0-ebb2d0a24302@baylibre.com>
To: Michael Hennerich <michael.hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Heiko Stuebner <heiko@sntech.de>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Francesco Dolcini <francesco@dolcini.it>, 
 =?utf-8?q?Jo=C3=A3o_Paulo_Gon=C3=A7alves?= <jpaulo.silvagoncalves@gmail.com>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>, 
 kernel@pengutronix.de, Oleksij Rempel <o.rempel@pengutronix.de>, 
 Roan van Dijk <roan@protonic.nl>, 
 Tomasz Duszynski <tomasz.duszynski@octakon.com>, 
 Jacopo Mondi <jacopo@jmondi.org>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Mudit Sharma <muditsharma.info@gmail.com>, 
 Javier Carrasco <javier.carrasco.cruz@gmail.com>, 
 =?utf-8?q?Ond=C5=99ej_Jirman?= <megi@xff.cz>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=847; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=WSd14gc0IglioCpRcpapejeZeHyJEdiW3ePuDI+8374=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgW5Ygza7kmThbyisDqsWQsptmTBU8wIgMgQE
 pxnhMsh/S+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoFuQAKCRDCzCAB/wGP
 wKntB/97ufnI2T1BvBKlrPPhGQWGDqAjoQSkW1QKpcvqm5JNUoqkex0I8noUiFjQLHt6g8Fwi0r
 VqqpMFbpUdF1MKsd5VP5Zb7DZxC2kjDp6jL041HzjfWKWjfXVH15wEqbhi9WhO8WDjGwDbAlCsC
 xF7XmULVO9O8XVbEX2VK3nCtJNrC1K8evAkSlACFG8ZzKinPcoB1k9qYzM5sU87+WFtHVkD0AZc
 Qeah+fJkaOfF+P+wux9OLYTxPFsUcmD0IHW5EsI2+Tkmo1808IBnI/YGG1DoVdGBoAdPrE3h6Cr
 QU+mELE3P/nwI+trrPO3SatKUUCLCkgwZTzH+YNm4fFPbrtC
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ti-ads1015.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/iio/adc/ti-ads1015.c b/drivers/iio/adc/ti-ads1015.c
index 21181cc3bd852ba3bb05b295c98b3530d8c07d3d..48549d617e5fdc363a5ff583a2b303cc8adc9eae 100644
--- a/drivers/iio/adc/ti-ads1015.c
+++ b/drivers/iio/adc/ti-ads1015.c
@@ -450,11 +450,9 @@ static irqreturn_t ads1015_trigger_handler(int irq, void *p)
 	struct {
 		s16 chan;
 		aligned_s64 timestamp;
-	} scan;
+	} scan = { };
 	int chan, ret, res;
 
-	memset(&scan, 0, sizeof(scan));
-
 	mutex_lock(&data->lock);
 	chan = find_first_bit(indio_dev->active_scan_mask,
 			      iio_get_masklength(indio_dev));

-- 
2.43.0

