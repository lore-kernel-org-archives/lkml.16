Received: from mail-oa1-f43.google.com (mail-oa1-f43.google.com [209.85.160.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90E5B243958
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745006397; cv=none; b=ZEXA8j58Gy0C1OUqgvAOjUlCZC3bsGhDFXLSgrup0rzc6pK7Gi2tTAyBV6bhSaokVlWQT74v+B5Kv6hMAydjPd6kF3FVFEvm5IHZldbCsT5Wp1RLFcCthASPZ9dVye3/It7k6yJC08PCdzlIBU9Vyij0TZPkrnADZnQgEHYtn28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745006397; c=relaxed/simple;
	bh=lY3P/BHYMrMzt2KYi0LGUhjMzgl6dv5K0V1qFBaK3Yg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GGuSHeIip1qt74aWdWWt7pRdCCbhlLfh6HOSyO2PjDPSMz6jqIH2rfyL2U1ev5zvPl2jW3Ea03FU2ST5bTXeLmjXyBBZviG2/9HLAYtxuH5oTXtQWYeExhTC2PgjRJNMGoD963Tfg196xLoe9RcwVS5xCxPB7CxzfSWWScxLPh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QGXCPTCF; arc=none smtp.client-ip=209.85.160.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QGXCPTCF"
Received: by mail-oa1-f43.google.com with SMTP id 586e51a60fabf-2d0364e9231so566122fac.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 12:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745006394; x=1745611194; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=;
        b=QGXCPTCFzMRL0oCXAZNcwD91WxSxMzDlUg84qoJ4yoa/jti5RUnjaEYqUz9vsLLVHW
         3aZkaocnjsoLHnWpsSj4YSKBwRW+oMtQE9V5rPtNWWIop+Yq+eAbzavxl2gOKihmKP5S
         Tl2uUPk9JHSo3n1wms52im4UflROZtIKWWN7zuLUjzeM3R/97xuek0NpbV84vc9cDoB4
         POoC1MmiW9K2bCjT2sP8moQj9ZX+rRgSx3G5r9pdQP3l091Ukb0x2ApZEMED3/bDr39G
         MUIX+Ubp7+U3FUv0dj9MLVOrRnA+zBu4Vhtxy6uuMtbPqEEEdHGixB1CQsxUApn9PxbP
         98hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745006394; x=1745611194;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fzSqK4qY9zcb2u1Jy55Elop5xlKMZ/WslrYn6ETdgHk=;
        b=udeWrW5BKbJQXWuB4/KTVKXs0avKN4h290XDBq/tEo/+oJyCuFdqFi9XhMy99eaSC6
         k+Srj7GwLyRyOWTrGdZwtfESWvJZyay5snMY/f3tF/ZgX6y/RKejKw3aN6W8kz1Xk9Gc
         PW9W18H8vklvjwmfAxmY3mWY4DfS79gUGKwCJ+0qLm7kj/G8U3zzhFU/GiFLpt71fw1Q
         aovwcEtzzaGt31526ihIAP46yFrS+hCdlfG9/BX74SbXyCOgGTdo4KJvrr+EEg2Ts5h9
         9ck9EpGbEH5MRWtkvqlAcNS/MKW0mR6Y6mPVW4w+Wjqo7s1iJy65+HNWeWU64uQeatDZ
         aIBA==
X-Forwarded-Encrypted: i=1; AJvYcCWAHkG4KPzXTGT4Bdd9IFYLLP9VJgWS1qkFXdt54jsmiEvO8KYvAykGLIrZoRz2Qm0LMEMGBazDbnrl90U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy1kBU3AiSyjVdUPxTsnQCGxjz8h8Los//fxRYT3t7ab1tuu/i4
	5klDuTOwRhWcF4dQrn6K7yh4Q0DHDNebXy7IfjWL9JjhIXcjp9v6o0JSO4y9Fpw=
X-Gm-Gg: ASbGncuSh1KY1ammNq3fnin6RbTDiAGYtZHGNbrqM5NkBkhWbIHVnjBtoc+eE51Ljg8
	yGSOc04hju7gXPEbPKkSp+9MDAmik3ndDh0G39kLjRI8BYK5CVLrYpdqJtDBzUGGaVOSi1af3j0
	zYHFqw+sRMs0a6s53owqtMdTq6RcZY7K6P73oxUuN+JpUFa3vbJW2FuSIzimwfYv2ux0MNvihmW
	L4mNELqFmZFsCpGTA5QeqE0ZKGqcyJKW/Mlrsm48me1Toa61tDB6FGdgoVzm3gPVlx1SwkX1Pzw
	lYV4blvgiwq74CFhkxa4Jto+Zw9uKy8ForOV34VK3FqYbio=
X-Google-Smtp-Source: AGHT+IHI4O5x+wPPGV+94eQGC4Hk/EXR2vmceT21i5pvhTSn8o+7MxvxGNT6vfB1NACqkNwl8RvUag==
X-Received: by 2002:a05:6871:7286:b0:2c1:4146:c556 with SMTP id 586e51a60fabf-2d526d6841amr2433872fac.31.1745006394498;
        Fri, 18 Apr 2025 12:59:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5213f8e4asm606941fac.23.2025.04.18.12.59.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 12:59:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 14:58:24 -0500
Subject: [PATCH 05/10] iio: adc: stm32-adc: use struct with aligned_s64
 timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-prefer-aligned_s64-timestamp-v1-5-4c6080710516@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2137; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=lY3P/BHYMrMzt2KYi0LGUhjMzgl6dv5K0V1qFBaK3Yg=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAq8EXey7ghkTICKkPtv4/67AoklbnfdqMoKh7
 TTWqGpmphSJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAKvBAAKCRDCzCAB/wGP
 wHs6B/4sTJvHSSz6HmN4Jpf1hTnTzsCIHEnlOXlpjG7Pghs62u4n3Ku3uOCaSRMJmW8aPzERMxP
 EjQlPRX6KJhN02AzJJoLomnrGGAlKj7GTMshKYPld4I1xWH/wO+bvbTFWweAMtCYcz4wQfNoFMg
 cwyrNg/zAqQRG3mlYiQnk4s2TJ5+eite0qbnYZPq7xEU7Ky8GDlFTjYDwSgQ10AeOc0vqOIzsB8
 kR71fIXS76ZP1eN+CPrzVIJrpUKXC8rZ7myCL61/wGjr6qdg4OINWKinpTupJdCvUVcKhD3/6GE
 fMhBvDLohiP4ePwyNH53ZIr20gZKjtDb0cKa93njGvhC4hl0
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Use a struct with aligned s64_timestamp instead of a padded array for
the buffer used for iio_push_to_buffers_with_ts(). This makes it easier
to see the correctness of the size and alignment of the buffer.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/stm32-adc.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/iio/adc/stm32-adc.c b/drivers/iio/adc/stm32-adc.c
index 5159908a2a6100b62e5e64b2b469378ad778c35d..81df0d45784553c87c92995934884138939ac899 100644
--- a/drivers/iio/adc/stm32-adc.c
+++ b/drivers/iio/adc/stm32-adc.c
@@ -27,6 +27,7 @@
 #include <linux/platform_device.h>
 #include <linux/pm_runtime.h>
 #include <linux/property.h>
+#include <linux/types.h>
 
 #include "stm32-adc-core.h"
 
@@ -261,7 +262,10 @@ struct stm32_adc {
 	u32			offset;
 	const struct stm32_adc_cfg	*cfg;
 	struct completion	completion;
-	u16			buffer[STM32_ADC_MAX_SQ + 4] __aligned(8);
+	struct {
+		u16 data[STM32_ADC_MAX_SQ];
+		aligned_s64 timestamp;
+	} buffer;
 	struct clk		*clk;
 	int			irq;
 	spinlock_t		lock;		/* interrupt lock */
@@ -1447,7 +1451,7 @@ static int stm32_adc_single_conv(struct iio_dev *indio_dev,
 	} else if (time_left < 0) {
 		ret = time_left;
 	} else {
-		*res = adc->buffer[0];
+		*res = adc->buffer.data[0];
 		ret = IIO_VAL_INT;
 	}
 
@@ -1559,7 +1563,7 @@ static irqreturn_t stm32_adc_isr(int irq, void *data)
 
 	if (status & regs->isr_eoc.mask) {
 		/* Reading DR also clears EOC status flag */
-		adc->buffer[adc->bufi] = stm32_adc_readw(adc, regs->dr);
+		adc->buffer.data[adc->bufi] = stm32_adc_readw(adc, regs->dr);
 		if (iio_buffer_enabled(indio_dev)) {
 			adc->bufi++;
 			if (adc->bufi >= adc->num_conv) {
@@ -1858,7 +1862,7 @@ static irqreturn_t stm32_adc_trigger_handler(int irq, void *p)
 
 	/* reset buffer index */
 	adc->bufi = 0;
-	iio_push_to_buffers_with_ts(indio_dev, adc->buffer, sizeof(adc->buffer),
+	iio_push_to_buffers_with_ts(indio_dev, &adc->buffer, sizeof(adc->buffer),
 				    pf->timestamp);
 	iio_trigger_notify_done(indio_dev->trig);
 

-- 
2.43.0

