Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B9EC253F1A
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 20:00:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006411; cv=none; b=pw9lZut+7ks8YhvWwsPunS9JGeuHVg5aJIwMJTDSawpSa3eLlyFsy68XkjInT/JE7rqs3hL/J4i4U8176RJhCDUAtoUIyoL1gAAacRzy23x2qqVUP/Lj7tYH+NrSJAXjReZrOY0eXM0Zws+f+ydofTn6iqCTKLHIOjkyqpvIA5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006411; c=relaxed/simple;
	bh=anywE7XPQeNCDKeK0PUagrE9N3D2Cd5D3ok+OCQfyOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=K5F9vSqZV0ssUTU/ucQXH9p1oD2wOAFPoM6uYu19AgmQxt5d2sVqRoCxClCV4HAOMZrebEAOqnQE2CsRJ4Ti4NN6n3K0X9T+6UA+mhIa5qpNSBs3FtdDspMkpWzwI1orhCoMLFyLcDCA87i7Y/JUZ+ZdBW7e8RT/ChcusOmUGL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=rQhIjtQQ; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="rQhIjtQQ"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-72c14235af3so1297132a34.3
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 13:00:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006408; x=1745611208; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
        b=rQhIjtQQxVzksNVr1NwORPAjiHhK4q72Vg3BOvD5I0vvdK4kGcNPvzSxLOOg33hmgB
         qaPS8Fnf5x5gZ0SzmlP/Omb5ZXzW3gaOrWdCOP2W+xSfo1ODLmRys8H4UrQ5u9CvDAzF
         JSXrgU1M6oee+L9v88pGxrYdnUeSHmVEi25M/O/yz4dCGs0JrgGNbbEbWlblq2nXKoHT
         zho10t5F8zV2AKNP6KOTo/dwDn2DZ3B8IR3f6OilL9TzMqt1vNyoJb6pkguPT4FrxOOR
         Ed2LNsL62lfRCMSA0ndjBlh9Wd3gD9ePI2kRwjRMM7O+2GfZfjVds5+jIefczMcnElaY
         bc8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006408; x=1745611208;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=QlEEHDv/JjD6VH/F564VEg6t5ixWWwDpak4BAWMlBsA=;
        b=dvQSdoNoTr3YeUr5CoXtv5Qr1ELUQZHK3IVu01uy6Obn4bR/5VN37EbD0B/sSjAHPn
         OvRHQxt5Qak80oLCSsZFW/mFIKGTM+PEKAk6l42Iqb4xNFS3Voo6ULgciLjud0FZ/AMr
         DKUrOURdZK6V0reqPI2F6f4k+p33WnF0EBCJhIz2qVm/3+tE/b13pl04ZvQWN+RDuMLh
         w/YhwWU40yw+NCBtkNlxJqbQi+u5uCR81Whry1nPIYWgI4nkga+YEKw3WePThgGgz/NH
         GCUnNIabsep2JzL1KND7WSZfVzDck/aRtnrD1cR8ZSltcSmj1Zvj6VzohApZA06T36jX
         pflA==
X-Forwarded-Encrypted: i=1; AJvYcCWW7ma/RhKiD+iBiiR2XRMGZSP2rvWw/OveSdHROKnBx5llcihtVpSh4/IRQPQ4BQ7GRupatRrG2bKa3cM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxc963rZthScfvoM8xr4vV+hDCf9nbsjUyldH+Sa693fSIv2Q2B
	ipXma5hpWI4Dmp7le6rtDbbzKYAUs/fnzuBkxm1wVwF5Go+0gwhci5BT6uvbpGk=
X-Gm-Gg: ASbGnctQ9A9X+3vrYfkd1gYzyfuRt5C2RMgnjmCHIUS3OUp9g36WV+O+CBp3w/8BlIk
	OPfyBqolz6zzBbB/ieyn/VTcwmk7bOOeENfvr2aqpzFxmMfgPOL/2i21lWMlQ93VKFIT47P5YYV
	ikPZ34sdzFhe1mCO4541fvHZWeGgjk9GzSBfPZxTXhz0tHM5fsYC+TmLXj2uG9tC+Ojy8hU7qSH
	NSg3MvabT0c2Pw4Y7MHQ+Eb2mf16x/ztNKxXazkR2eCfC7axkjNW1gBNUjRp2+awuFD1W7hgyvK
	YpIKrnwAoUTaj/B3YI0w4zJLXweihNWo6lLG1kO2gPaVtXlB/eCwIwnfGw==
X-Google-Smtp-Source: AGHT+IGr6jWJlv3BH4w4Ps2j1330V0WmKydx70JnXcNoazpPHvVerIJTYwy+J7D4DhPX9Wk8OvfSYw==
X-Received: by 2002:a05:6870:ec8e:b0:2d4:c55b:199a with SMTP id 586e51a60fabf-2d526af63cbmr2074229fac.18.1745006408488;
        Fri, 18 Apr 2025 13:00:08 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.13.00.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 13:00:07 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:29 -0500
Subject: [PATCH 10/10] iio: chemical: atlas-sensor: use struct with
 aligned_s64 timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-10-4c6080710516@baylibre.com>
References: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
In-Reply-To: <20250418-iio-prefer-aligned_s64-timestamp-v1-0-4c6080710516@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
 Andreas Klinger <ak@it-klinger.de>, Shawn Guo <shawnguo@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 linux-stm32@st-md-mailman.stormreply.com, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1731; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=anywE7XPQeNCDKeK0PUagrE9N3D2Cd5D3ok+OCQfyOY=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8nzp0+Cmfo0t99KU1QNh1dT37rrLQG2SzNH
 U5outJwJB6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvJwAKCRDCzCAB/wGP
 wKuNB/9sC6Bs/gHTswHlJCsOQM/Cjv9JBeFqLqwPG/EH6lPVnuMM2r0CjXLaKZ6Sod/kwk+E4pt
 PNtFh4rt+VvxCpXg1H0wPTud1mMFV0tkDA7sJwxDGX3Z94mw+p7WvzEoCCCx9HSBkorH5YUMaBP
 FCGeNDyvZQ9+L3skA4biUuoQKswoX/yqxNlCaGcY5dG++zXclH3PsId+6ITHnGlrGoHnpFcs0Tk
 2lRJbQaIhxof9SiZNt0q9xABQZsm6NFC63JdQGq9OgxSD7qaa/0W45hSH8XuZCCJndZw/VVEDwj
 Yi1sy0l4M68NpXKzIiV1vXzyy+beWErhT1Jlka5PNTGLOmpl
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/atlas-sensor.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/chemical/atlas-sensor.c b/drivers/iio/chemical/atlas-sensor.c
index cb6662b9213740f4a88b8412e6a0f01bc5a314d6..a67783ce7f1b68135e05d3afc05533d400d4a052 100644
--- a/drivers/iio/chemical/atlas-sensor.c
+++ b/drivers/iio/chemical/atlas-sensor.c
@@ -17,6 +17,7 @@
 #include <linux/i2c.h>
 #include <linux/mod_devicetable.h>
 #include <linux/regmap.h>
+#include <linux/types.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/buffer.h>
 #include <linux/iio/trigger.h>
@@ -91,8 +92,10 @@ struct atlas_data {
 	struct regmap *regmap;
 	struct irq_work work;
 	unsigned int interrupt_enabled;
-	/* 96-bit data + 32-bit pad + 64-bit timestamp */
-	__be32 buffer[6] __aligned(8);
+	struct {
+		__be32 data[3];
+		aligned_s64 timestamp;
+	} buffer;
 };
 
 static const struct regmap_config atlas_regmap_config = {
@@ -455,10 +458,10 @@ static irqreturn_t atlas_trigger_handler(int irq, void *private)
 	int ret;
 
 	ret = regmap_bulk_read(data->regmap, data->chip->data_reg,
-			      &data->buffer, sizeof(__be32) * channels);
+			       data->buffer.data, sizeof(__be32) * channels);
 
 	if (!ret)
-		iio_push_to_buffers_with_ts(indio_dev, data->buffer,
+		iio_push_to_buffers_with_ts(indio_dev, &data->buffer,
 					    sizeof(data->buffer),
 					    iio_get_time_ns(indio_dev));
 

-- 
2.43.0

