Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EECD2255224
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908823; cv=none; b=Lqk7FEyd9dC8ayq7Dxq5c9RPQhUHDXEICUMs6WMZm/FhEPTnCJuUnhTBnktXCnZeRHeJKj1H2jHrYTglYU25JuRSHzB5i0N7TQH2Telw0BU9I3+oVKC6gfvcp3NIR9TXQqN0gY1tWpvhJPmW5eZplPKUhPB3joYMQXYKcyVXTnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908823; c=relaxed/simple;
	bh=MCoZT25X+adzcafRFG4aXXsW2m7rdL+DKEbLmBiVtso=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRj/I4BvxeBEIUfs3xaQLn/Ulfbop7NuGi5IAhEhG7FILa1HMwZmwHAGvu0xTdOevI0TBoZX2hn6KNGsX7T4n7T58a8MvWRfL5BHf7IcJxxTaqVwSOOLzH5XpLDeVT1wcJ8B0qDyA4eta2tJ9PIvLj1h+BtMRQ6AIJcbJTIhA88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=WdrQUKN9; arc=none smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="WdrQUKN9"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-2c6f27599abso260898fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908821; x=1745513621; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8Mlcy7RuTjVsp9IPk7gmpzYSIxCmAnjblWVcEv6ccJY=;
        b=WdrQUKN9tSlbS9GJDAISGN6QYGovwqN5yaNx/tDbMk2d6cSjtXCfIHnboSpeeEV7as
         dAtkYwSP7H1J0k0NXvTIWLP2ujwonu44+kFndOJ4qkffb5unejJDwcnt1iu/Q1XAVPjR
         1wxazp5tB3i35WZvYs0UbwJwEhQQSeuhN+Wff66kqZItIxP3RUcRaTpFfBEK7uEsX9Ij
         1NCj/ut0O8XXyyNoQLAwN6qO0BwPVYTJA37cvdIEhk6M7Sbi5XjkvxVeNYNYkq//daZj
         gUj8KUWiue7rt32dTl3+gLOLIKx0KMA1ThEV3QItRD/N+yuXHvTLDsvwwwIT/ulRqIgU
         M3/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908821; x=1745513621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8Mlcy7RuTjVsp9IPk7gmpzYSIxCmAnjblWVcEv6ccJY=;
        b=GjB6S3bfhAoBkSyrxNICMW9lOs4Ol0u0RdqDKBOa41F5Z/aIh48pvd+DxzLw33X0+t
         kb/ghhLAv4f5ainb58QLegtu507yJgjIy5XtrlP/KyBslp0F8Hh58f9wxgMJmI3BFvOd
         o5TLpEOPyfGfw34tADZ0ZOdfltkronDajPGANeE0szTRdewepHl3Auq0b4VXYAZIo3dH
         BG4NuOzj+EwqWOjpVDsYbno8rs2sgFKyH5O60e+c6tgJ9D4nmfiYBPP5WjucGA+VI1EA
         YSqUa2r7rAKi4eiqfCENgNI5+7Q1Wnj8fKffHkOTGOHk+qmrAv9/LGb2+VHbk6fDC75b
         WCWA==
X-Forwarded-Encrypted: i=1; AJvYcCXrfQ7u7NoxohSZMj/UaEYQHv9VLmD8Fij2HUase7BEdLtnaRYd+cNgZGJ7igosfWHXQN052knAWqVO6/A=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZRauo3W35H6NeXjfsPv3WMVbpRUhuFUKdZtRtaX/T518if/sf
	TqfluAvEOw6P1jA1qks7fOiiCsJvlJIuxaP2jeBNOOCXWideBhKgYYbAi1zFzXmD9htabfJqXR0
	t5SA=
X-Gm-Gg: ASbGnct9rjNne6KzFXYTygS45o8Pkk04wsbEZi4hSpRRwv2glxjViGAI60uEoh1botP
	XYUGfHDrkjHex+loTNmMGrEcMef8pOcJ/++38zO+bcHnpQ50jbTARGP32b9ZIQQvHAMCXlOHdGr
	uNUFvuX+pk50UpLyKNxLfu/UifOe7k/695gwAy9AOVYwIxfUimHZ3no9kTOqSg2m/Bpn6KL/sB7
	o6PwkYwMvbWeNdpUgduOjOt6QoF3A1XXI7GMNxJdmGu6hOVtfJ1bLLfArvrWhYnbvmFBxoezF2x
	SsY7ZTdmcoXu+Es3sXVXObnfYHwAFBVAf0dmC/xxdO5/Q0s=
X-Google-Smtp-Source: AGHT+IErXXlq9KuInn3X1DPupkiObTPpeE0ueF1La6/hhWfHWV2I+w4DlDOGXdfxGLmNEFpgSLM4Bw==
X-Received: by 2002:a05:6870:230e:b0:2bd:456c:92a with SMTP id 586e51a60fabf-2d4d2aa1540mr4331539fac.10.1744908820696;
        Thu, 17 Apr 2025 09:53:40 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:39 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:35 -0500
Subject: [PATCH 3/8] iio: addac: ad74413r: use aligned_s64 for timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-3-eafac1e22318@baylibre.com>
References: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
In-Reply-To: <20250417-iio-more-timestamp-alignment-v1-0-eafac1e22318@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Cosmin Tanislav <cosmin.tanislav@analog.com>, 
 Tomasz Duszynski <tduszyns@gmail.com>, 
 Jean-Baptiste Maneyrol <jean-baptiste.maneyrol@tdk.com>, 
 Andreas Klinger <ak@it-klinger.de>, 
 Petre Rodan <petre.rodan@subdimension.ro>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1548; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=MCoZT25X+adzcafRFG4aXXsW2m7rdL+DKEbLmBiVtso=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGgBMeaiYXaZnaltaqKxrBfvibKRF2Q2tMZ2i51a85HCji5pc
 okBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJoATHmAAoJEMLMIAH/AY/AAGEH/A7d
 yhRTzK61gaVftoV7cazJRl2ySH0qG6zH3EJWeARByL5cbptKOdlsuZo6d7dZBRrZJ4C8ev3rdUJ
 XhVeTDsfkPJ45+tsomWPkqCLOzQPKAU8JhuMXYWFGbviMcDJ+rrK2aPgMeKN8SxeHBRAa/pGmu7
 sqQ3y01Yn+QJpQLze9bqW7Kro6CN6cfC+WsHUhmd7Kwu2JsZ/4++9+AdY6zYE7SKwBPkHGrai98
 KgNtgetjJZDDS8Ly3nsQIbzVqGVSFp7+cKTzCAd8qq5qbgaI3qiltP4wNPKERvyQvIC1vXCB64X
 /fpWqHAAG+swe9n4QTO5IL33IsWflX2inevS41I=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. Technically there was no issue here since
AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX == 16 and IIO_DMA_MINALIGN
is always a multiple of 8. But best to conform in case someone copies
this to new code and then tweaks something.

Also move the unaligned.h header while touching this since it was the
only one not in alphabetical order.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/addac/ad74413r.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/addac/ad74413r.c b/drivers/iio/addac/ad74413r.c
index f0929616ab899cb374f00869787321eed4ccde16..a0bb1dbcb7ad9d02337d0990e5a3f90be7eaa4ac 100644
--- a/drivers/iio/addac/ad74413r.c
+++ b/drivers/iio/addac/ad74413r.c
@@ -4,7 +4,6 @@
  * Author: Cosmin Tanislav <cosmin.tanislav@analog.com>
  */
 
-#include <linux/unaligned.h>
 #include <linux/bitfield.h>
 #include <linux/cleanup.h>
 #include <linux/crc8.h>
@@ -24,6 +23,8 @@
 #include <linux/regmap.h>
 #include <linux/regulator/consumer.h>
 #include <linux/spi/spi.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
 
 #include <dt-bindings/iio/addac/adi,ad74413r.h>
 
@@ -84,7 +85,7 @@ struct ad74413r_state {
 	 */
 	struct {
 		u8 rx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];
-		s64 timestamp;
+		aligned_s64 timestamp;
 	} adc_samples_buf __aligned(IIO_DMA_MINALIGN);
 
 	u8	adc_samples_tx_buf[AD74413R_FRAME_SIZE * AD74413R_CHANNEL_MAX];

-- 
2.43.0

