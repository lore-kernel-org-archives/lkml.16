Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A453525525D
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 16:53:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744908827; cv=none; b=jSDOH1q0J1220j4Synypm5XcU4gi5dQZFwUG/HYBYyoE7bU5QjD46VvLdpgtJG8pzkukJY6F11fgujfnKQRKd43dON3Es/sEXzBl6CfQ37ONDmve11fOjIAXPlWPhOxY6sJs7EHnrKmohpL+KqrglSae4yS/nAZ95VGQAhwbYxY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744908827; c=relaxed/simple;
	bh=Be+VG80oZRFA77m6Gt8gOSL/Nfe6cNHnZZZ4OXulHq0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NGePZGL6ouKxNr0Mb5Ze691TSa3T6/IQnitchcq6MyhljaSEKAu/+AHJQOOS5gLGDDpTLI+nFukQVKRiu3+xEkVSPAH59Z9vqsT8Z+tVlWz2l3WprObLR31xdVjArD2BMtSIh7Y90a8jYQUr+Xhzji4PvS15DmovVkfcz2yxqKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=peOvoezr; arc=none smtp.client-ip=209.85.160.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="peOvoezr"
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-2c6ed7efb1dso600852fac.2
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 09:53:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744908824; x=1745513624; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X1F+vlOB53N+GaZN9iKzvcz7MEqEzLVUIiy6PF/59Ng=;
        b=peOvoezrg4QIwfQcdoEiJrzGHhxGoD9aW08z5nbTD4ODca7qTcPPuq4Ff1NSAsQ3HJ
         bRtMlSLqGQv3l4rFN4Hea+Q765l6hmGEXJaQrVv1T1yvWaXGAuy3wnRdvJYxPE2Jc2aV
         oynqr8rPEuyXTgD2MSPPUNJ6n9+NxzVsy2HcsV22OuKF1ZDGe/4ollxqt+kCZEHh1R4w
         meJZVTRAuUBYQv1tzQUscoHq+4Cd4H3DmN6ghOYKnejgRYQuY2kZYmlJ5W9NYAW7kJGB
         XSXpLBfqSaku68iZe0MTBfZl36rWE4xXIaEulv8JZW5o4IP7owAZX0QxVKSHmNP2BuKF
         i6ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744908824; x=1745513624;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X1F+vlOB53N+GaZN9iKzvcz7MEqEzLVUIiy6PF/59Ng=;
        b=ALpkpxC9r7nEJ2Sr1tZAR7CTtScc57JH3e1ViJ6BxRx920mHea/v01XK7ZmcGu8LXg
         W0KVqby5f2q7FE5G64HSvxZp1ghpytrpVeal/MtB8WvUzTF1fZ2vOOALR0nfGiA1gztu
         iRZYPgVJyPNuGVeh9+6AAAktSZ4QTby2GgQjpvO0XuWvlDUkVQfYpEli8wGxGl6hRqlz
         8Q4VWcudj2eQfguCO0/SNGU28Hf4hUj5iInV8WsG61+0LrSP1r0JpQe/VJ+AW1Kedl5Y
         Z+JaPYe7bOj9XA0w9ig4LefP6asxdOGFVONdThSYj0P9in2gQBj+U9uftJcsaR6eOcxg
         eXUA==
X-Forwarded-Encrypted: i=1; AJvYcCXWdlmto1uS1CEpKAU1E3Y6PEmfXOZNfSOQzC/KnC10ZW20ZgbQrCbYg6uim079rh1Iq5XX4JVz8mn8y5E=@vger.kernel.org
X-Gm-Message-State: AOJu0YymNmCnbKz2+N9nuWr4qALJhz9HHqUU4To9zEUouZ7S9GcYGdOv
	5K8dGiNbrX+g5km+ZH9OzWU8khdejz4ieDFNuxpzhN3UwfptAN9SR8hEGHOUTjw=
X-Gm-Gg: ASbGncvKiZHoerCaFxxYIk9jcE/EBlsianOOo0Gz8xtwaBwgo4gCcPOZ9bTTIy916++
	cwkfb4IwkzDYlFSNvJZ+Yzxnjec5InSDH2g2QJUIV3v9hoSigBfELTOWach5BZwIcUNcaO/r6Lg
	N4QYEZLNpsaxLGDKgCXpHKplbVW/TCyK6aH39PepMgH38Yr8KLkrpt3IxD/5TkOE39MvvhoR0+v
	XIiuHtUkFemrAeV0TY7tqKWLue2hOtmHuMFsJN/iX9zYi/y+YGWYBigYRRv8MOpW3xAhxXIAtoQ
	9HbejWbywbLGsTx3evCanTo7tGAeu1ZXnr+KSwCBA+q8HkI=
X-Google-Smtp-Source: AGHT+IEKFwTdIVXn18X0mqQJTNwR4Yk4UGM3aZEZT7fmXlltGNReQaAJ+kElPt73dhfKHrVg0VWtdA==
X-Received: by 2002:a05:6870:1708:b0:2bc:7d6f:fa86 with SMTP id 586e51a60fabf-2d4d2d58f98mr4604470fac.35.1744908823626;
        Thu, 17 Apr 2025 09:53:43 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:c91b:eea3:7afd:2dee])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2d5218248b7sm15812fac.47.2025.04.17.09.53.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 09:53:42 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 17 Apr 2025 11:52:36 -0500
Subject: [PATCH 4/8] iio: chemical: pms7003: use aligned_s64 for timestamp
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-iio-more-timestamp-alignment-v1-4-eafac1e22318@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1299; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=Be+VG80oZRFA77m6Gt8gOSL/Nfe6cNHnZZZ4OXulHq0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoATHtmXXnfyB5zOEBfzyoHuG/ltoONKqIKZ4Di
 d4P0WmcMFyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaAEx7QAKCRDCzCAB/wGP
 wIxICACdc/mCCcb81hretoFsihU80lPcVXFy8V1MRYpADv7qyT8rw2ZaOKBT6PmnabUtyxkC1WX
 zmjyOWxpfiX4jLkNDrcLJE9x52qUTJDYy5RcyB5fq9a2ekDQ+2C28Kgb+XiqJlK9SvIwOMQJgQf
 S3Ov6qj1Q/QvrRrsEg6LQFwlifspnOVIYXWmhzlrKb5LmITB7lRM2RxdN/VFeP2rjr4nRjJU8CT
 nKXM8npO+jClZzs9AsMAl6dn/iYQSr0+toMwTe0sz0fX4riLCS9LGqRasAudxP7QROpdFLpFSlW
 aABPICumbovD+w351IASkkwdw+h7FJ7nMElFz8CN30NLd0Fh
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Follow the pattern of other drivers and use aligned_s64 for the
timestamp. This will ensure that the timestamp is correctly aligned on
all architectures.

Also move the unaligned.h header while touching this since it was the
only one not in alphabetical order.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/chemical/pms7003.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/chemical/pms7003.c b/drivers/iio/chemical/pms7003.c
index d0bd94912e0a3492641acd955adbc2184f4a11b3..e05ce1f12065c65d14b66ab86e291fab47805dec 100644
--- a/drivers/iio/chemical/pms7003.c
+++ b/drivers/iio/chemical/pms7003.c
@@ -5,7 +5,6 @@
  * Copyright (c) Tomasz Duszynski <tduszyns@gmail.com>
  */
 
-#include <linux/unaligned.h>
 #include <linux/completion.h>
 #include <linux/device.h>
 #include <linux/errno.h>
@@ -19,6 +18,8 @@
 #include <linux/module.h>
 #include <linux/mutex.h>
 #include <linux/serdev.h>
+#include <linux/types.h>
+#include <linux/unaligned.h>
 
 #define PMS7003_DRIVER_NAME "pms7003"
 
@@ -76,7 +77,7 @@ struct pms7003_state {
 	/* Used to construct scan to push to the IIO buffer */
 	struct {
 		u16 data[3]; /* PM1, PM2P5, PM10 */
-		s64 ts;
+		aligned_s64 ts;
 	} scan;
 };
 

-- 
2.43.0

