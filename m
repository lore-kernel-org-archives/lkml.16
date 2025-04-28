Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B549A1D54E2
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 20:24:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745871848; cv=none; b=CpzD0jmTaKA6dXtMGidlE+JQ7nAZ9+lIbpEK2aNr+1Eqy1VlVSJVrFhETeOVjJm8hmQD4htXEO9vsxhvZqq5DP4Dee8le3pU3mIOriA3hMm5BKDe28t9s7G5fxKWTw41GqtETW8qK5y9ZOps2cX4fG2c+AVLiw/lXt3pFHAWN9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745871848; c=relaxed/simple;
	bh=NbvlMBP/8hkPgeT8KG8PAd/JVAGx954UfPXMpF7Wv10=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rzHePEc8AYgj1Q8GztiPCKIZDBsXh4zoZoEQH2OsWyKpQQXer+S/20l2psBboOeKFWmFNIi3FzBYXwruaDoRr58lpJ0HrdRIQuGEdAM6odL9d33d5Lq0oSstElodPg9aoQzcHj6M0FOg6wvgvJn4HIuu8Zrq3m8XyLr0kSjvSEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=xwPy127n; arc=none smtp.client-ip=209.85.167.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="xwPy127n"
Received: by mail-oi1-f175.google.com with SMTP id 5614622812f47-400b64ac5fcso3304541b6e.0
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 13:24:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745871846; x=1746476646; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDO3BrucMxULVTP7wxmNOUlpxABCLZ8/GfNo16L3AFU=;
        b=xwPy127ntU7sLNLubaBBMWQTsvfuBSwNSoQEWR69IZite85vtoM4rICaeX4NsZP+M+
         Gxe4BCJEjbi/+45/4SXZUhsE3H0wcq6LDEZEFRNXVbfYG3GnpCocigbc+EFqSWhfCULZ
         ptSRWAVQPMpwVOKGAkkblOzQ3I/sYX43+VZCU4eP7BnpqUSQOGeL1ABauRAj0ETpoV0Q
         83RicAj1jVJMH6YRwdbjbY/6MOQPeH8+9J8k3wNdkV4xT+lp3FC5A0CKV4YJkb5H7WM2
         gAXE/E4u4dCM2Xtn9nIIgFHdLdb6OUJRKMrH4uWQrZdahmAXIB3JuEgqIBpwFtUachKC
         as2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745871846; x=1746476646;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDO3BrucMxULVTP7wxmNOUlpxABCLZ8/GfNo16L3AFU=;
        b=CKYg0Vbamf/00Ui0FlIDfJPvU1dE5o6lbJ8rHUGf52gVp9iexjaVQn+DBe0Pgvi5B8
         PPXLyVNxoJGbFpS29aQrY94D5hMh8SZO2bSttco80odQ96vdl4P7ukfeTfbu/vba0rtD
         TrE7D4eVRKVrT2HjmO7fpc1UNwWOfLAIxD4rpgrpK0Px5wFFFWC+8loTBFef5dI5mONl
         4+FXsTcLWs+vkDiFftyHRDijTJ5cYw8Q88aCDd7ve5zc+CapwLwyuU7EsFqfs2hN4a7y
         rPyhRZII8q9/rzSHZJi6OUCYrkWv2yAYkZrVf2KZt4JGMhu2U6V/UtYITmU2SPTvMPgD
         qFvg==
X-Forwarded-Encrypted: i=1; AJvYcCUKR7EX4dkWpxjDxUjZw8bO0+93wAZDQM/SgOZD+LtfYJ9vEK62wg4F4BBfkToqj/u+IKB5sgQOionBpEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfIFg1awOCSa54aFgjvliYfm4y2zErFsPPndY/w8HRZCijMXkJ
	jxJVOrdYLMi/NCaUoi8CvU8emf9V48eqpCZSgkgIZbd6pWR/2tS4uoWIJ+Kc1xg=
X-Gm-Gg: ASbGnctdZT8/iQWpPEubyLT1lDC0T6/i/yPYTQ9qIpM34Y1wePo+20jhTr5f/pHGzlk
	4NPUNudk3Ziwb9LRn7X89n4+p/1Rt3H37y2ThUGHYU01UXZvj/M2USTpJ+0Lkjc5Z0DJQhHd5J3
	dtWlvpecBR9g+t5oWTrNVlync6rh+HbPZvIhWLxInXhqjcSvZUyyqjPWPDJ0lPYB6V61kjU4zi9
	R5kDaYZwd44MhtyRhlCSwdYqc0R9Vr1GG7ki8ycUZnd1fnSe76BRG8edNp7kNgnk3nK5erY04lh
	3sYAeLH3t7WUFwOGIKe7krYByARKuOwhQTU92xYDF+XJf14=
X-Google-Smtp-Source: AGHT+IEIb+/7jwFycj6Lxs0AIAmOXJEQMNM+ExPcVNff3F0TuKaEDFx36DEm3NSKVEONbWj2NvQzbw==
X-Received: by 2002:a05:6808:1597:b0:3f7:6824:5839 with SMTP id 5614622812f47-402115793e8mr196510b6e.19.1745871845666;
        Mon, 28 Apr 2025 13:24:05 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:cff6:9ed0:6e45:1ff9])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-401ec970ec5sm2196187b6e.34.2025.04.28.13.24.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 13:24:04 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 28 Apr 2025 15:23:03 -0500
Subject: [PATCH v4 1/7] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-1-6f7f6126f1cb@baylibre.com>
References: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
In-Reply-To: <20250428-iio-introduce-iio_declare_buffer_with_ts-v4-0-6f7f6126f1cb@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4338; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=NbvlMBP/8hkPgeT8KG8PAd/JVAGx954UfPXMpF7Wv10=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoD+OxkAV7kbZhJxHC4iKN/xmbZ/Lc7pauhbWdp
 +DmlLR4dguJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaA/jsQAKCRDCzCAB/wGP
 wJ72B/0UaG/hbNwQmC2jqV8Rbj6GBpaWfbcJAA1elDDGhYuyJ64XSLue9cdWjFH6yHyLS6A9xFI
 +onUBUrKMut5HCGv9SdkQo5a9imJSUAXjTv8Ybl5c/tk6Jrsq1URo3qjRmbmL4/kH4L5gv27bQ3
 oKMt+m/912KVXfQxhD3WgV75N+7lUB6G8GJd2hyhlVFrkcXqVi1yB0ynX9s39mqfcundWaczazG
 qfz/2+xNtm9ozLVPvaRf0fREtx5UaYGSOj9W/fkpXMbpysJW8cmG1acPjbDyoAKZ4nDBw/g+Jig
 dXM8MBCBPdgtaLwMqGWw6SdzKM6WU8EmTzGIqtMyx16s0Hpo
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
 include/linux/iio/iio.h | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..95d90740b4ffb3ebd819d03ad2bd05ecf40d4384 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,9 +7,12 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
+#include <linux/build_bug.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
+#include <linux/minmax.h>
 #include <linux/slab.h>
 #include <linux/iio/types.h>
 /* IIO TODO LIST */
@@ -777,6 +780,40 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * them safe for use with non-coherent DMA.
  */
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+
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
+#define IIO_DECLARE_DMA_BUFFER_WITH_TS(type, name, count)	\
+	__IIO_DECLARE_BUFFER_WITH_TS(type, name, count)		\
+	/* IIO_DMA_MINALIGN may be 4 on some 32-bit arches. */	\
+	__aligned(MAX(IIO_DMA_MINALIGN, sizeof(s64)))
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0

