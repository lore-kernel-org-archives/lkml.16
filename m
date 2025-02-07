Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B631DF75C
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 20:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738958998; cv=none; b=BgpKyN+BhMSGjrL72Ypw9txzmoIZQ8tbR1zlgpsPqcmFcpsyW8CeC2/i0k08iJEy+/Wxzki196KXT7o3h0NCwH+XklE5817fzr0HgV3LXDouPxNR5z9uEVe6y9s2WTSOofuO14tBcwvO4RreLFA2wffUQq8e63Cda7iKV/rHGNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738958998; c=relaxed/simple;
	bh=SMPmN8r0eR+8HY2Jj8x2xcYlPFmCLQlrLCIyeBHoKlc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fZ0elaKDOQIxYVeyfhf770yPFZrInnM10wKRFPRLw/p+SsenpJE4pQ35ho7OLL18HQ7cbr3w0RF34KxzsPhvUhvFqrYZEDzamLtYHaul7QA8lXgm/kGFddm8P7Lu/xJLObjerNcdPvbIZZjxdtGIwltPKUdamijnDvBRiYUhUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=LDYYMqJO; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="LDYYMqJO"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5f88a93dceeso800557eaf.2
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 12:09:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738958996; x=1739563796; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bhv4ANzzEFKwoR1NSwNAajicR1HfyMZAyaDEFtvhtoA=;
        b=LDYYMqJOG7yg/xQ2ScnUuEAtiJxxuA/BCwvVLZTh9szN1X+FEF13a++vkakF8Z1L1e
         hKdRoQKb7RX+GuP/u/kqGLz6kzrZh3kuxxKyReu9h3ItazMmdYlYVpOWUhuMVav4rMe2
         jqBKNj/Kgf7ch0gKKKWpQCvGBgSl8YORxjTSxbrd3XE3/5XPKfrKAP386xUyWg9mvzSc
         fTn8PNlaHmb15kZi2OE1ZWMTnQbVkxUOIWrIQbOt0AdM2PzMeSuIHkDbCVAitlOvK5YO
         YAkv+94v+Ip05KcXfTgeTsKpcr6vpboJk7UotgL04vQEercKlBwsj4WdX8aT/UwqN4r2
         W14A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738958996; x=1739563796;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bhv4ANzzEFKwoR1NSwNAajicR1HfyMZAyaDEFtvhtoA=;
        b=FSx67TjyaI6JAZBHaAdw5iFeYzbYwk4onoOSuu6xj0Us1XxHBRw2etQ0ouAuktAnch
         xGMV/ZXAJg82Wvj942fISg8Bk0KZqyjoX4qCDggEODW5AWN60hdXpgRbZKaTqroy7yVU
         VY8scraHprA0Uv2Q0wD+L51MpujvioikMpaThIhvEYpontpkndN5lBpohYnUCYhJ5qGY
         TaC4CuWtbm7x6R3R8budgo1e1VTmbzpndBXv4NxZEb6HKoW9CoGaEiu3sbMfEmjbrmYk
         1ZHLVUqdxBGU5UA9N4LeETD1wqAW/aQXRC8HTi2kERa0kb9PyJ6Nco9VInqS9A1ll9j0
         fWIA==
X-Forwarded-Encrypted: i=1; AJvYcCWfawhdjMN2txxghdAVmdCuXGsv7F5KGe8Vbeq1xPwJ+efCWL4Qq3J5YLZoSKbVaRr6lSJtyWBR4Rs+f3c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrGVBYlvidq34pMLfHb1FDK33pWDziAHBZ0uLggE04dtoPxqSB
	KO3h/s3YnMcyxocv3azXil5pnWTT9yUrzFNNQPx6bKjU34LgL296uGZN7Wk6j54=
X-Gm-Gg: ASbGncv3HKxdn5PL+B+w8rCTlTFw+vEhxCOneGzWg90MtUsbMHja92Qdc1GVck73q5D
	Y5G+UVbwCCn1mfkJq5sG6IlQ2/1W0UyzGjtvAJnJeB0E86+ytA3KG72cKwN1+Ok/GmpQlSEph0A
	gZLb1chZsu2G8aKxZ/CE5bYItFZgjNNyxLTdDgbAPA+9/x4NZRdYaRAP2JEJzyX8EuTmZbs7nwm
	mi/VMrAUOZENgb7tzGYiykAdWZ0nfmBb/hA2yAGJQWElbyaj+yWFKWUugbKZ1czV8iziitVvEaZ
	V0moFSfTx9BZxNjNDTgmB8K7j61GFQ4ntqDBK3Nwj056kdA=
X-Google-Smtp-Source: AGHT+IEqV/I6/z7/jDgPXn8cMBQ3jLjBLYlnGZUzifVpoGCFn9izQNeuUTDoXrR00+qnRlk+dTe7Pw==
X-Received: by 2002:a05:6820:605:b0:5f9:4f8c:868e with SMTP id 006d021491bc7-5fc5e6001ffmr3171575eaf.2.1738958996002;
        Fri, 07 Feb 2025 12:09:56 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc544b08d4sm930387eaf.2.2025.02.07.12.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 12:09:54 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Fri, 07 Feb 2025 14:09:13 -0600
Subject: [PATCH v8 16/17] iio: dac: ad5791: sort include directives
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250207-dlech-mainline-spi-engine-offload-2-v8-16-e48a489be48c@baylibre.com>
References: <20250207-dlech-mainline-spi-engine-offload-2-v8-0-e48a489be48c@baylibre.com>
In-Reply-To: <20250207-dlech-mainline-spi-engine-offload-2-v8-0-e48a489be48c@baylibre.com>
To: Mark Brown <broonie@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>
Cc: =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Lars-Peter Clausen <lars@metafoo.de>, David Jander <david@protonic.nl>, 
 Martin Sperl <kernel@martin.sperl.org>, linux-spi@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-iio@vger.kernel.org, David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2

Sort includes alphabetically before we add more in a later patch.

Reviewed-by: Nuno Sa <nuno.sa@analog.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---

v7 changes: none

v6 changes: new patch in v6
---
 drivers/iio/dac/ad5791.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/iio/dac/ad5791.c b/drivers/iio/dac/ad5791.c
index 034228a7c059f136cdecfb4683228d0be4c37477..4f28f49071c244bfcd21c7553aa3e39e9751490a 100644
--- a/drivers/iio/dac/ad5791.c
+++ b/drivers/iio/dac/ad5791.c
@@ -6,21 +6,21 @@
  * Copyright 2011 Analog Devices Inc.
  */
 
-#include <linux/interrupt.h>
-#include <linux/fs.h>
-#include <linux/device.h>
+#include <linux/bitops.h>
 #include <linux/delay.h>
+#include <linux/device.h>
+#include <linux/fs.h>
+#include <linux/interrupt.h>
 #include <linux/kernel.h>
-#include <linux/spi/spi.h>
+#include <linux/module.h>
+#include <linux/regulator/consumer.h>
 #include <linux/slab.h>
+#include <linux/spi/spi.h>
 #include <linux/sysfs.h>
-#include <linux/regulator/consumer.h>
-#include <linux/module.h>
-#include <linux/bitops.h>
 
+#include <linux/iio/dac/ad5791.h>
 #include <linux/iio/iio.h>
 #include <linux/iio/sysfs.h>
-#include <linux/iio/dac/ad5791.h>
 
 #define AD5791_DAC_MASK			GENMASK(19, 0)
 

-- 
2.43.0

