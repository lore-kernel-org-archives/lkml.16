Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D756262FFE
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 16:32:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746462767; cv=none; b=dMeyYqbLJXRJ17wcy8OjPvmMxSvGMgt6M/5RQeJVaU0mdJuCMRnKsKiSBY7nxfxZEIho7KEdYijHjl8NbdMMYrr3AB49mi0mfO4Hah5GWREahbMB/x3YmuUmhVVY5HAJjB4kiEo8TNFdFJCxQwlSnZ2gjFwgmXJj/bskXhTOXwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746462767; c=relaxed/simple;
	bh=GqiFVLFxgn+LBBWQlIorwUyITU4RwfalpSjWWDvcdCo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oM7vS0316IVNkD/fv3GxKHsly87jEnIRLzpl9aF3toM7w5VTOAuj+ZoLdMbaY5CEfe860FfHSDZsft3wzLeksJdx4dgEAH7pIIMPYKbPz3xU1HywprzOePf7XPwB32oh5wujP1xncKRDZlyCMa8I3yR7AmIPjr+3aWHlhM63spo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=wa/jOA/N; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="wa/jOA/N"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-401f6513cb2so3167505b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 09:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746462764; x=1747067564; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4WROtiMI3JkznTuCCsJN7sUPb4kZ+J9D+lR0Z1bHz4c=;
        b=wa/jOA/NHP3DVWBWRvy1j55Q3HqgvWPYklOwq18LsDHeRhuRjtWKoOVe2LXn0juAbI
         0Z8wPT5yD5z+P8j+OXEc365OzSKMXh1nWyRjlqMNEYaRsyrsOFaX7vR1dP8stapLxWg3
         XNpxEybv44/IlKoLdw+yq+zBc94+zQujcoI1ZX1DSwl1xO+S1i2CAldKV+ciP5gNUe/R
         ff3YzOZgq6SoP2M9NTN4PrJ3M8zCajphj/U16wlV1spxQK40MsxPYIv9LIraKCwVVe3p
         hpUCjFBPvEfKs90de0YvIsb5EngdSm7EXeo1gd9NEDufoL9zKZN+9TtYVJlQ0LYQPoMZ
         6LXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746462764; x=1747067564;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4WROtiMI3JkznTuCCsJN7sUPb4kZ+J9D+lR0Z1bHz4c=;
        b=jUGZ7ucfXCd/WvnDwhWZAi+tuQOhPbqLOKwJ/E8ft8F5ns6CVo9BCd7I54VMODtTAE
         8FOFtqAefZoGL3zPOOPYRkswdZmH+UQul9k8Kxsh4XOR6uvakb2JeBLiCKPueu1YKqEQ
         OzajBDo5K82kxFjQ9JNbpJVJubcjp63QKMeLPNo+jKfYEC2/dC8k68mW/AtAxvQOgfS/
         tCN3wEzGBe2nq8U3gIdexmA25rJBm1K6vVYFzL5Xszom3ql4Gthax0IU6VGNmH68zda8
         5u2cEgZuou+MSjufKk0kf3ZubIqxOT9ebq7Tb4VF+nFRSfdleodsjd8EUzkxIXKAewzN
         NDnA==
X-Forwarded-Encrypted: i=1; AJvYcCVqqMPdoMzDSkzjZ8sUR7EoD7g5dmWQxrphzVJ5ugdisRj0UrJUhxcrcTbInkAiAdN7joq7u5HF49sl3iY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGHaPfMSJll4M5nsI4TCPIW4PHJ7vwXJeIW/OrqzOU0haYuR2O
	5+OKYpJtDZtU5/hVXoYdQ9MmqnFJr6tNmq6GbLYk3mN/vYNZeqspwxc8piV8rPM=
X-Gm-Gg: ASbGncsxK6pnwcT1FGbvV53Rx77SsUX3veV6/kG3Zhn6/kBnPn4+gZABb3VaiAKd716
	VN6hXDDMyNyRn8K6hn7iBPmjjihptqjLpowTHNhCgSfM7nYyFx5xjFIzypTTF/ihBTLOfMQVYx2
	c7llSe6ryqbDIw/bLP/JLUsutfrOz1H6M8kmO3/obqi+9v6A/sodVWNCHvK3OrY+LWhUCHdiysL
	Rw+DYQD3VItMIGWb9/SSYImG2v6pJfJK9IAspI+A5XZo2p52K0YrgghMdwbhbJLnpy8B5EG79w6
	PW7ItOG+Q+ZDaVhFgm1xoOc8qqKVkhHzdCcePrmaXByGcw==
X-Google-Smtp-Source: AGHT+IH4vRVlspiASheOc+rcVxaOiPunx6fBx8WC6lVUIUaD6fiU25D8/3I8EBIEW8Ys5r+61fqW/g==
X-Received: by 2002:a05:6808:22a9:b0:3f6:a851:fe85 with SMTP id 5614622812f47-4036883782fmr91855b6e.14.1746462764436;
        Mon, 05 May 2025 09:32:44 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:2151:6806:9b7:545d])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-4033dae68f7sm1971854b6e.26.2025.05.05.09.32.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 09:32:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 05 May 2025 11:31:43 -0500
Subject: [PATCH v5 2/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-2-814b72b1cae3@baylibre.com>
References: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
In-Reply-To: <20250505-iio-introduce-iio_declare_buffer_with_ts-v5-0-814b72b1cae3@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Nicolas Ferre <nicolas.ferre@microchip.com>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4179; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=GqiFVLFxgn+LBBWQlIorwUyITU4RwfalpSjWWDvcdCo=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoGOf+Ep/O4CcQfg5E/1xbTSnTa0LnJINU/61Bq
 JnFrh18IZaJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaBjn/gAKCRDCzCAB/wGP
 wLpcCACBNPKqIY74BOKllvhWFKdD323FZ7oXSTwtI2y67stm46e4owBkZHCPcibWab2zgd31LdN
 ACchPsBpYGJXX99sZIZnt35PumsAo7QlwvGPaAfa7CHGsc72prktudnAyu7WPtzLf65ls710pME
 QFeZY2xcjPxTZQ8ScbtBNdlvJ4XEs/qlo1d9ZEufQX+pq7joJ6wF7D++vNtcAj63PaLexc+m5BF
 CwYchx1Iz86maVtt+QVKFe+LNLJSyy7n771W48FxK2ZYvrCNknwctl7jrBxOOaYmzZlM5pnyuhn
 Go5Tsa+atkz/BAktK95G0godMRFp+uFmqp1muRBEUqrB1Yuk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add new macros to help with the common case of declaring a buffer that
is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
to do correctly because of the alignment requirements of the timestamp.
This will make it easier for both authors and reviewers.

To avoid double __align() attributes in cases where we also need DMA
alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS().

Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v5 changes:
* Revert back to __align(IIO_DMA_MINALIGN) as IIO_DMA_MINALIGN now has
  a minimum of 8 bytes.

v4 changes:
* Drop the static_asserts(). Some 32-bit arches were triggering one, so
  we had to address the problem instead of hoping that it didn't exist.
  The other made a multi-statement macro, which isn't the best practice
  and didn't have a way to make a really helpful error message. The
  condition we were trying to catch is still caught by -Wvla.
* Changed __align(IIO_DMA_MINALIGN) to __align(MAX(IIO_DMA_MINALIGN,
  sizeof(s64))). As the build-bots found, there are some 32-bit arches
  where IIO_DMA_MINALIGN is 4, but we still need 8-byte alignment for
  the timestamp.

v3 changes:
* Use leading double-underscore for "private" macro to match "private"
  functions that do the same.
* Use static_assert() from linux/build_bug.h instead of _Static_assert()
* Fix incorrectly using sizeof(IIO_DMA_MINALIGN).
* Add check that count argument is constant. (Note, I didn't include a
  message in this static assert because it already gives a reasonable
  message.)

/home/david/work/bl/linux/drivers/iio/accel/sca3300.c:482:51: error: expression in static assertion is not constant
  482 |         IIO_DECLARE_BUFFER_WITH_TS(s16, channels, val);
      |                                                   ^~~

v2 changes:
* Add 2nd macro for DMA alignment
---
 include/linux/iio/iio.h | 32 ++++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 7e1e3739328d103262071bd34ba5f6631163c122..703ade71483803c0a335343d5a7ecaefd8bc93b6 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,7 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -787,6 +788,37 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
 #endif
 
+#define __IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
+	type name[ALIGN((count), sizeof(s64) / sizeof(type)) + sizeof(s64) / sizeof(type)]
+
+/**
+ * IIO_DECLARE_BUFFER_WITH_TS() - Declare a buffer with timestamp
+ * @type: element type of the buffer
+ * @name: identifier name of the buffer
+ * @count: number of elements in the buffer
+ *
+ * Declares a buffer that is safe to use with iio_push_to_buffer_with_ts(). In
+ * addition to allocating enough space for @count elements of @type, it also
+ * allocates space for a s64 timestamp at the end of the buffer and ensures
+ * proper alignment of the timestamp.
+ */
+#define IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
+	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
+
+/**
+ * IIO_DECLARE_DMA_BUFFER_WITH_TS() - Declare a DMA-aligned buffer with timestamp
+ * @type: element type of the buffer
+ * @name: identifier name of the buffer
+ * @count: number of elements in the buffer
+ *
+ * Same as IIO_DECLARE_BUFFER_WITH_TS(), but is uses __aligned(IIO_DMA_MINALIGN)
+ * to ensure that the buffer doesn't share cachelines with anything that comes
+ * before it in a struct. This should not be used for stack-allocated buffers
+ * as stack memory cannot generally be used for DMA.
+ */
+#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count) \
+	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0

