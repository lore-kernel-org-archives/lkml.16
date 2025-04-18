Received: from mail-ot1-f51.google.com (mail-ot1-f51.google.com [209.85.210.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A22E6253925
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 22:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745017159; cv=none; b=WMuDmE4OG7ZRMkIB+tPat4OPhrMuHvQfGWbaOaPU6s0CM3A64X0y7o/GeGGiQW/7UGeMQuwwmImbwMeh0lGHuyJCPr4Qg3twv37+mmN00dZu3xkXCCfjktcDAO+gCMdfusFDYyS0qH+KD19Qlhhm57VGNDaxm374ZtLahq26lCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745017159; c=relaxed/simple;
	bh=yR1qdfXVdfkGN0fnFpgmDF3GpryusLxet4K3aH/uiM0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LEdS+HDrqqDmV64l3RX0Qm3tqVQvJwOFUJCwEKREqpyPNLY48z20EMrngYXf6jsZ0lL6/Mc2KLGtVoBmu8ZV8KAFNBf+xjQM7+nnJVfLrAIPuL8Dj1gxivmBO/Yi9xCu29A+Y4mDmc/kKAWths0KDizeF8RORayuYzT0JsdTFOs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TPuQTPt6; arc=none smtp.client-ip=209.85.210.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TPuQTPt6"
Received: by mail-ot1-f51.google.com with SMTP id 46e09a7af769-7272f9b4132so1745712a34.0
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 15:59:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745017155; x=1745621955; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fDNMT7Ge9Z+4YSxWHFq5/Umu+PV5vrF6xXnHGQ6evEA=;
        b=TPuQTPt6xO7TX1JnW/lyOBF7K5v7kVYDs7bK2DQKc3h1IsaLzjV9S/bA1y+lNWy5ZT
         zaJcGc0p+R3Mw2NWc/944qMNsE+1SZu7lXS3zEybb9CVYsJA7iiuhuc9KWDYnYTEVfEH
         Bbz7xPmKixlxaRHdg/GM8N5oDQyI6PogQciHvpJUYT5YviWz42N+BXbvdAls5kk/lHiS
         55oPPTjY2NiB8EIFVSmzgfDV6xGIxvl/jiwYjXX/530wWnX/+658Bs2WGGZE37EDvwWl
         GWxXMTW4Ief4Bw+yqVjRdvarmKIwudEF2o6wRFih7hmsvo5Tyam3HveWVTUIHj9JSstV
         bokw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745017155; x=1745621955;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fDNMT7Ge9Z+4YSxWHFq5/Umu+PV5vrF6xXnHGQ6evEA=;
        b=mKCxiqMVcdnmyGSreviC0U/x7eli4D54n9UtyqY1pvS/GOCSKfpqA8qAekjg0TeLzj
         ppjEyV5HJNBa+eOLUrHxoHqkm7B5va1VkiG8N2gc5uXjbfMe72H3+pMwNhgX71LMKTAK
         4saO61fPLoIwGh0MtOfOowsawBm9Bon79UKaXd4DXGXPgMzJi5XeWS3uowX3Y1kYuYS1
         /4Jt7Ks5/D4FJo1ziMWlkLViqiHb1jzdodoB0ewhykp2eD1ScZGdNgGz0Ph/3/Cmdc7x
         /sOojc5bQGjQU4BmdLq7TZ+6R/V6KP8bEFSrPznlk0Z0H3ekVV66uVVd7eUX6baUkkmO
         9USQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwwGaWkhUp0wh4t8yrrGik6/uw4f7RDZQuei3qpAxapIP4kshS4HvR37lEe76J3Oq0hLmxNfIwyhjduyg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/kafUXTcqNQj+k9tNILV+dVZTkgpDCq38tyW5LVNNIaGnuPvI
	hLcWJxyoGeFw7Eqt7J/phVz22RgOMeARPnS4mx+UPCxmN0IhoBvPxhL0/82las0=
X-Gm-Gg: ASbGncum8mZoLfOhaiGrdqhFYgiBzSBA6ptuW6gQUx0PYJ3I3p1OmUiQFV2VBnf5kaW
	sQ3hvSeEnR+BCaGci+VY9i3eLKEqy7S3XD5oxWpLyZ6QkO1em9T4PJlL+bmcG/KmWCDj/EbAF+I
	XUdd05QVloKOmLGh4+2YZgQD0gfxxvS7FBx3Gu1hbVoK1L6s85C7VULwlPwHl3v2S1+dstdLG47
	/eBI59wqE+YIcXBWzIvFJb3mphE0y+AC+isK5R9shOTaIdiIquUFSJdg/nyxVnHmicwpwkAo2tF
	M1vM5FBwmXyN0W5gEViJMDJcLuAlN2CP3McFb4OZg6QUzHS85y2XZ8DIbQ==
X-Google-Smtp-Source: AGHT+IFdZWM25OSHAtQes7EmpuJa7tXiSJHLyfFyew45Pxr9CuiS609PKuCNaI5AO0LYucuoFbpSlQ==
X-Received: by 2002:a05:6830:6003:b0:72b:782a:56d7 with SMTP id 46e09a7af769-7300634a804mr2571319a34.23.1745017155668;
        Fri, 18 Apr 2025 15:59:15 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:dcdf:46e0:18e5:c279])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-730047ca051sm500187a34.36.2025.04.18.15.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 15:59:15 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 18 Apr 2025 17:58:32 -0500
Subject: [PATCH 1/4] iio: introduce IIO_DECLARE_BUFFER_WITH_TS
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-1-ee0c62a33a0f@baylibre.com>
References: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
In-Reply-To: <20250418-iio-introduce-iio_declare_buffer_with_ts-v1-0-ee0c62a33a0f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1828; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=yR1qdfXVdfkGN0fnFpgmDF3GpryusLxet4K3aH/uiM0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoAtkqyXb9vDxQstUInEUU743mIZXYVXrEgfvzc
 ak8VdCOqC6JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaALZKgAKCRDCzCAB/wGP
 wDZFB/90kaHk9mlw5yS5cTge2wjVVMXABttc+mogszsnZWm1GtEfulL8mUuzhfYg+SWsxdkA/oH
 pv0LXPUHJQoQGeC7BBpLdJ3DE1G8n5PeTEfMUqGCNt0oyF2yuq6yk1MYHWuDz1Lb+sF9A7T/ZhT
 a+iD6i86h2EADCy/GXNzs62lqcT3Qor9HeLcFzFFMqb71N2ShhOVecLdNdVnikmy+JZfHuvSd4b
 YM6vJf9QO2RBccB9lLCUjyRcYNDqEAYQbtsKNf9nqCmVE2woGQTprHrMt8btY9RuB0RRKxCijMO
 3wjgARlY2jxqGUNK2lpUB/pDiSxFoz+/ZAyUlhGnb3nay+j1
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add a new macro to help with the common case of declaring a buffer that
is safe to use with iio_push_to_buffers_with_ts(). This is not trivial
to do correctly because of the alignment requirements of the timestamp.
This will make it easier for both authors and reviewers.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/iio/iio.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/include/linux/iio/iio.h b/include/linux/iio/iio.h
index 638cf2420fbd85cf2924d09d061df601d1d4bb2a..f523b046c627037c449170b7490ce2a351c6b9c0 100644
--- a/include/linux/iio/iio.h
+++ b/include/linux/iio/iio.h
@@ -7,6 +7,7 @@
 #ifndef _INDUSTRIAL_IO_H_
 #define _INDUSTRIAL_IO_H_
 
+#include <linux/align.h>
 #include <linux/device.h>
 #include <linux/cdev.h>
 #include <linux/compiler_types.h>
@@ -770,6 +771,21 @@ static inline void *iio_device_get_drvdata(const struct iio_dev *indio_dev)
 	return dev_get_drvdata(&indio_dev->dev);
 }
 
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
+	type name[ALIGN((count), sizeof(s64) / sizeof(type)) \
+		  + sizeof(s64)/ sizeof(type)] __aligned(sizeof(s64))
+
 /*
  * Used to ensure the iio_priv() structure is aligned to allow that structure
  * to in turn include IIO_DMA_MINALIGN'd elements such as buffers which

-- 
2.43.0

