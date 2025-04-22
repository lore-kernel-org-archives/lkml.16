Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42F4A22F752
	for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 22:08:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745359728; cv=none; b=Id04Dried2P98Xh4hcL04klWOBIA3qXEcHSCnEbPX8JEgCEO+zLlHDhodCE8bnCdEJZj28e7ONbq0wnXfrvk0a3Rcg4yNGTXWwJ1PeTpcIaj4BQB1hh+DvGzj3TXlRSmqlESyyZJD/ycR5Xf0OsXABlobw6WAg+R9OK/APTNV+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745359728; c=relaxed/simple;
	bh=nCzR1/emrbeUL84tCt3IiYuUEVzi1rCzDn2Z6fqJM44=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGEKb6tqvcaueDBFnVrtw6TavFYvRkgp/rAlM0dSgu5mhuKk+XzRwVPPuWC4ebOxY3SPuxZEIglwVBs9aXtWwMKF0bPKoR+EzCopxtyAClD4P+szU1tNzcW9zw5Ra335W1tKt/SSJHdnIuW3nzUYJFrXDYJ3CoqZbPlDUGTha+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=KCOBwBNr; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="KCOBwBNr"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-72c7336ed99so1692199a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 22 Apr 2025 15:08:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745359725; x=1745964525; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9K2B+Xay9TH+WRl+WF3lyeO5h1JwZugbslpoI+5AHg=;
        b=KCOBwBNrhb0MyQfMFQaroSKXqmrCq+7KR7e67Fg9b7h3ph4XEkTyLilnMXDKB12jzu
         c+5yLHSD1Qh2v+FnPYuirb6mfyXrv6nKA2Rj9dt5kZGZV+ji3VSiEYuQGjrm/hP5604D
         v8KP/SrDiQvcvnyp5hSDVtJ1Qgg/ziT7jpC+GuKfwzpIBwwS2eqcFU0kMkiGoWPA8p+E
         LmUXkxB929ik+wzcNDMmR1R+OI0orgEkKlULjjDHi0bsPtNnZ/3UVgPDo6FzlVoXU9ye
         eguOj0RT+dLEnnx+Vt8imU1HX6KqoYOwttlKBspNAOwEQkumWKTa7JWnUI0ctyPaDYjc
         297g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745359725; x=1745964525;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=H9K2B+Xay9TH+WRl+WF3lyeO5h1JwZugbslpoI+5AHg=;
        b=mEE3sN7mOY5yS29GmuhvPhvR+wmvu98te5y12LBhz99B+GdQU5h9KNNKvrPcYUWj2t
         qmxIuDXWnqVK7SQTzKz0dmiECKtqPfXIg+tT4o9XFLFtKTsvNGWyCHxb0/28YeJlddZY
         rvJ8YHqBY951DxAD6KBoA8kpetKkI3dxnfCbaN0yJla14TN3uCRZY8RRnLNEr0uExNeh
         wgZOOOmAF7EoFR8sAzR1+GlqxpeqjDOvq/ZEIG6ycP9BpKzwqMwa8Cz4BWnaJ0MToSKW
         y7e1NQfSuooYlL3ciwxf07Fe4oyRo4OFXFljN5RCKTaVfXrwfU8t2TRC79rpXQddiLbJ
         PBEA==
X-Forwarded-Encrypted: i=1; AJvYcCX7faKcWdsRcoP1KN/56UZgFIXxKlcM8G/Sh3ayzVxWssMyXwPwKsf2ovfdfe/9uYYGWwy5SXzD4NugDoM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxoqiCksGsKd3YTEkoMRCVgUR/p3ofXSVybSU0q8DEF1Rm3N7P
	TXdrlSGg9a9advXFWW01migvVl+/1lRlwIEp8LX6YI0yFFMQL+sjogMPzVWybjw=
X-Gm-Gg: ASbGncuSQRdWWHW/jQh4yzMkKJCAnPxk6rNVoVXtfvCanZlzrx3x8joQtAFTgjUMiqK
	jNFGWpN1Z84ZVb+Bfo+b4mj3YfwJKS2+dbhBdgWTUm71uEPhRqRD3A5NLuf0TneRBMGBOcWlVNb
	Z7Dhhg4KHQelTOb1elLroXnv9DJ4cvLqsUTSYrM2+QHnqSsoS6L2SGthPi3LOHZqktR089xERny
	qENvydrYg2Wh6DH6qXJwNigRrv76NL8+CQST3ekE/WpTdp9yIT9DmGMDVD2sMHVv7sguAb+jMJv
	sqy4jZXN2lXMiHbmu4CkNjJ4DdKCFbbWcFd4OTmf0hwt+ec=
X-Google-Smtp-Source: AGHT+IH9UlcMwP6SptMTSFVihJ/iz9gBXiP46PQmSgYR0lDL6OqVr1KITJanla834aaysMRXitqaWQ==
X-Received: by 2002:a05:6830:3813:b0:730:da:1165 with SMTP id 46e09a7af769-7300632c65dmr13414959a34.21.1745359725278;
        Tue, 22 Apr 2025 15:08:45 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c8d1:e0ed:ce8b:96a3])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730048848dfsm2265938a34.52.2025.04.22.15.08.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 15:08:43 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 22 Apr 2025 17:07:46 -0500
Subject: [PATCH v2 1/6] iio: introduce IIO_DECLARE_BUFFER_WITH_TS macros
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-1-3fd36475c706@baylibre.com>
References: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
In-Reply-To: <20250422-iio-introduce-iio_declare_buffer_with_ts-v2-0-3fd36475c706@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2962; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=nCzR1/emrbeUL84tCt3IiYuUEVzi1rCzDn2Z6fqJM44=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoCBM9pXsoFeECQODQSXKUf+R+nqAiwzg2R14di
 eSX7AycMvuJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAgTPQAKCRDCzCAB/wGP
 wDU/CACaaPDIIK7yQ4QaByRNrsGGx3mAq/LvHL9GakyNv998abhnWQTZ0Ue2ye4vTXEsv/ERja0
 vlcjBv6HxuJ/mPV8MzNx6Rah+WZIAe0rcTIuBx4J7i+Mso7eGGVDp/LjMLePye3PYnumWKpavRy
 Yk0p1RqkgEIhIqTi+GggQYvsJVZ6h5ngl02BhN02xRtAKV46VjQci66m0EaYvmApDuqg0UPNjcZ
 M96Ap1ZaJxoNNvdMht3X9sIr5zcqG31wGiAQDSdCcdJTM4HYBVdPFlkIcpCGmnytcviPQmjjsxC
 /8f8RJrpl5Ip4TJfX7L/LddlhzV8vamiGUCUTqizsRvrrldk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add new macros to help with the common case of declaring a buffer that
is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
to do correctly because of the alignment requirements of the timestamp.
This will make it easier for both authors and reviewers.

To avoid double __align() attributes in cases where we also need DMA
alignment, add a 2nd variant IIO_DECLARE_DMA_BUFFER_WITH_TS.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/iio/iio.h | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..4dd811e3530e228a6fadbd80cfb2f5068c3d6a9a 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,7 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -777,6 +778,41 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
  * them safe for use with non-coherent DMA.
  */
 #define IIO_DMA_MINALIGN ARCH_DMA_MINALIGN
+
+#define _IIO_DECLARE_BUFFER_WITH_TS(type, name, count) \
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
+	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(sizeof(s64))
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
+	_IIO_DECLARE_BUFFER_WITH_TS(type, name, count) __aligned(IIO_DMA_MINALIGN)
+
+_Static_assert(sizeof(IIO_DMA_MINALIGN) % sizeof(s64) == 0,
+	"macros above assume that IIO_DMA_MINALIGN also ensures s64 timestamp alignment");
+
 struct iio_dev *iio_device_alloc(struct device *parent, int sizeof_priv);
 
 /* The information at the returned address is guaranteed to be cacheline aligned */

-- 
2.43.0

