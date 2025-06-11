Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D39A250C18
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:42:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749681764; cv=none; b=VX33PoUYg/IaFoaseRyfXwCbpvoVpY65nso/KW/GoWkWulb0n0McY4NRpqQQgtCBSmW5DKgHEtGa6K697ixPNcEClkhVg7YR/u+8ohscCF/gsOoXZUEGwxErV9zxd2ggM+9QYCBOJRuqQEAw/GkJpr4lXBO1HWllSLYTCIlmxf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749681764; c=relaxed/simple;
	bh=w6sewnHJwVlZtUZ1XCEB4lsBcr4uySr0t3enC0nXMgo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k2tp8KGsB9SX9z5SFTlZaLmEkr1uoqqiD4Da7XRGdK19xQoLLzpnDK/Z0qdgq/htL3yDUW6hyJrNgDu2Tv1D30IOAT5P1Yq18703lzC9qdau5+jyGrBQ/Xy4Dnn56q+I96NjTKKoDLlInO6CIs+d8J7a+yeKN04MJOhnfglKh1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=SsOefWXt; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="SsOefWXt"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4091180d3e5so173368b6e.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:42:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1749681762; x=1750286562; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
        b=SsOefWXtrms4NznSIcRfSkLaBy82PIQP0FU67RK0TLT11w2pk51VhvDcpLLOn7HGGH
         XG2xSOKh/YpeZUwtFdqim7jCbI4L5QG11roTx2bdc7JsJvlwHqNcQ/8HOyMjjrKAscuK
         U61F4KWdDSC9VuKUHwVD2Kpbh0+koy+Rpv6GKu15wPsrvcWpb5HISRkEQLNEIus2Wv0/
         8LGGZSaoAfmh65u/RDyJclLeBRtuWku494GIVH/taYyHHgl0SDsxvo9Lnk4iDT3MJqfj
         wfAs6QhCK5Ug1emw3Fhs2VnRW5O89kyVS31A3w4LlJx8L1v1ZTX+yqoyKczMlJ2xNYPr
         jiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749681762; x=1750286562;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1+AXM43LJmcTiZ4+XLqifo1WeAnz6FejMu0e+/VkXQ4=;
        b=lkP2cePBuAXI+BYEgQH3huNK3j55LR+Zt13MaH9UCXpgGUQrqyzxvNA/HuWBS+V+CC
         JZiOPyuf7fp9HlWtTQz7/lw7buMncR1EXoqObF5ipSGTtp6ckHrBTcUtBiCzY7zcdQI+
         XVR3Ka01Do9nleaC+L9izJip7sXoxOhqLtR/DWvy9GiWUXqIHmkKzwtFpi+gUfptWX+W
         dEDl6cZageyFtrE+VVJiKYaEOtqOS2GepOzgTljsOFTp3GqL0hw2ITwEzzGfndxxebSs
         zTuEKUqXZDxWkYeFcn799DwAytiEOBf/eyulOifqGbEkYBRLyMPs2qe84MC6Qt1AbSQ+
         K5VA==
X-Forwarded-Encrypted: i=1; AJvYcCXmUwIO8Odb8aZuNA5mxccHlsES3mLRxy7u370ybjgLiAfYAiLaX8U5TFbLya+KLDRO5qT/Q6Wvd9tq2EM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7k4tSNHjw7ABUZ3ekfIm4XL4Ofz+s+K2b5b5yjaHIBgL3B7vA
	WxJPcssQXnQt/Y8RiH5UbWRUlkkl8IPHbvPxOa8D5NgMJBdGiGC2Q6ncCEUPu0Hwsoc=
X-Gm-Gg: ASbGnctdWnPHg+zCb1hJe6XKlsU5tGIn495m4NWXOGyqye1ZAoM07kqZMd4Jw0ZQDCq
	xXfbaE6/CqyoKe5T2iR4kJrMtolh5KiEl60M1uDto3wfF/kIM8qhTKTsUJ4UQmOehyMhyqNWrQy
	ggiot0gL8TdAgTaMsV3NisO3N9vhmFP6Bz+Nk75NxPxO6v2D6PCyT02WlFHsTyCdtej7s3nQq+m
	mwzTrSFXzNJAhV8PfH/r1LqFeW+deJ++WbillkYdy7tN38qVQwdofC0T9+LTtnthJQ3M1lXIJGQ
	MM5Yo1Sh6XQs40DGvUywhuWP6BhL0iFYvmY3mgl4DfrRFqD7qiW2AB+PzZZt+yRw42WJ
X-Google-Smtp-Source: AGHT+IFMMzvtGjq/XF9sKG5BGljgdifNq6jOybNnZI2VIWkdnxiv1hDecZPrcYLXm/jeBNerhjgiZw==
X-Received: by 2002:a05:6808:144f:b0:406:39b4:2232 with SMTP id 5614622812f47-40a5d053e13mr3229763b6e.3.1749681761758;
        Wed, 11 Jun 2025 15:42:41 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4753:719f:673f:547c])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40a682fbf05sm24684b6e.32.2025.06.11.15.42.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 15:42:40 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Wed, 11 Jun 2025 17:39:04 -0500
Subject: [PATCH 12/28] iio: chemical: scd4x: use = { } instead of memset()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-iio-zero-init-stack-with-instead-of-memset-v1-12-ebb2d0a24302@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=810; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=w6sewnHJwVlZtUZ1XCEB4lsBcr4uySr0t3enC0nXMgo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoSgXTO0fwqvdhMYlsTHXtIYGob2RsszuHsUyLs
 SfL1LagKj+JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaEoF0wAKCRDCzCAB/wGP
 wPZeCACIJ32MRJGFXAWVkUo7XJ8IPrL0OrDOVi8YV9Bz71zO9E1Xbt2tdxaHIRCxRXTjHv0+zxe
 w/o0PiRItwBJgVkYx0LCNcV0wRJiX/3SOXvkNIYHEjW/6bG5mIuft2mWy9pOWtFB1hHlRO5OHW0
 HRZV2jH97fcqcIdH9wSd/O5uzb2vY2Mv537m9vzG3NCE1EZ6ni5m4frRR2Ju3EquwZ5eFRMUZDk
 6TffT8htFYg5wCw+GGZ+kUM+ESDQvMFNiOZTKVDPOJtDl6Lepqk3gBrXVA5n8ijfXQPulfkc44L
 Ad5/aXu1TD4BBvsWqxbL+8KuoPFw5kwu1Q/N4uflwEd9cOV+
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use { } instead of memset() to zero-initialize stack memory to simplify
the code.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/scd4x.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/scd4x.c b/drivers/iio/chemical/scd4x.c
index 2463149519b6d82caede9c9b253942fa421fdd3c..8859f89fb2a942d940b1ba7adf202977df7b4ad6 100644
--- a/drivers/iio/chemical/scd4x.c
+++ b/drivers/iio/chemical/scd4x.c
@@ -665,10 +665,9 @@ static irqreturn_t scd4x_trigger_handler(int irq, void *p)
 	struct {
 		uint16_t data[3];
 		aligned_s64 ts;
-	} scan;
+	} scan = { };
 	int ret;
 
-	memset(&scan, 0, sizeof(scan));
 	mutex_lock(&state->lock);
 	ret = scd4x_read_poll(state, scan.data);
 	mutex_unlock(&state->lock);

-- 
2.43.0

