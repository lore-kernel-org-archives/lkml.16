Received: from mail-ot1-f41.google.com (mail-ot1-f41.google.com [209.85.210.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A454926137E
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:16:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229387; cv=none; b=GhLkDGokusOUIsMaDsfCBezDNMwV3W1a8xj6N617AkEuNo9pf0G22waXJ3BfunKx2G+J0Qd6RKTh3XagKcBxZq1PzQxIj2795GatSsXd0LAXmzRYWrtzyUvMSg+v48JvP8OOremC5S/axLt6cW1niX5N2OygtWO5v9WdxY40FHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229387; c=relaxed/simple;
	bh=E64vimrA6sAQmqcb8D5CIBdvE/5/9FWh9JZxsOyC0Ro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l5ofOHZL+Fhehb6+qQyVLWc62jT/eqPzr3fBj3CtSClVMniiZggOgr6hmYugT7nVNN3UrJcgXB73WHBhgIfi4Ufvj5+dX32KaVErpMrwSRZbc6vsaMJ/y2mHxnG/2+Fv9DqnOWO5j2kRh6HIlOwLRk2CYWoknyy3ggZ1g90VOOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=fI4uEXCG; arc=none smtp.client-ip=209.85.210.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="fI4uEXCG"
Received: by mail-ot1-f41.google.com with SMTP id 46e09a7af769-726e744c798so267028a34.1
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:16:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739229383; x=1739834183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rzovOp0gWLRUdwhwXTDu1YuijsWTRmR+OknRU/gsakM=;
        b=fI4uEXCGoe3H52IQSfOQA1UQAp5UBhAoxoLolvcj9MaTGlT9XQPm3zSX2hqaW02D0V
         jwy3sWbYvuxab5s5Vh55bgM7P6DqXVdEKt7Rpa1kuwU5oS3JJltpaFzBQmMPRMpQafe9
         T5m3WzUgQNBZLP2cGaRjJR88OA7aYsLVFNTK8URHCLl7lI15i0yM3X7FUX2LzFNGG49t
         LWokoGJRp3XwhoqzJ1DRfkJZJbKQEQlBaVoSqjT8EEHyz5FXe79Bo6YW1F62Z944xeaH
         bTSWaaKRfZ9RXnt4LWpnTNYFwtyoZocCg87kYNaB+iT4o5YaM8uSFwD2VcSDF+7h3pGz
         xvzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229383; x=1739834183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rzovOp0gWLRUdwhwXTDu1YuijsWTRmR+OknRU/gsakM=;
        b=WoZBrkLemt5YsrQMhK6QMsot3fLXtTa9hCho41IjKvCoIMTyIDy0MzU3Sx1FS+zn7j
         CBUSIo/yaNXiRXG8HTrn//GJIDIKJi8EnkxTGlSCeHKoktvBcilj1pPJrArLK6Hjhv4z
         ox42dei9+2K9V9l8kmb+sudeXAcpTJC7wKRt1rq+P84wGt8cB7yJW/pv6u6fX9KWwxVe
         0/t7s0rb66/5c7c58pH0Jc8jnGL6peErq8G54n1uethwgInzgBLHjqkn7cB8pz19xmxt
         MDegrQNkVdKtm/4U7D6sKW2ZDKL8N/oyOHIUO4js/AohMMYue7CBDBLKgui9fbp9UVpD
         vyXw==
X-Forwarded-Encrypted: i=1; AJvYcCWTd0/Sue3P3lR8fM3fRCHA8z0/Df0Xd3z9E8bC0I5+8fZq6bQk/+y8M0X9qGG3aq0GE2aXRRNvLZs0Dt8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFp/Zn6cs7sMrxK5qi7grzrHUV3MrNuQ9F44/bD/LGjf6XFyhI
	OMcuNTb0tNH4tSyoxpwhezbR4tIs533n5LrwnTjmUBIOlpn5ld/bM/j/GkkkjSjgXXSLoijdqEq
	U
X-Gm-Gg: ASbGncvfebC5BcP0TqDTjtdrtCIee8SOb0W4Bbpd3pO5kn40aajtY/OvEREt1v7ZDyr
	FJgS2qBjUwUGuCgdHw+W0+BpboEAKInjhI2/4WycresAcM4Prh48j9zQYGy8VOCqR+15gdFdKiz
	oyTUt09VwqqXVggalnJ4gCKAuAGv5jRntYWp5l+XU7cSMDrTb1QRNCM+Ass/EicIYkeiuq4fFNh
	Vg/DFGSH+T4Q9p+7QtrY5EgNoNq4a4EdZzK56hxwA7uH4oXwrizWakvdIpoW8WMpk2kLDiUWKMQ
	0BSzTyRbspDCtcOZ1iD+NbEjenIDvEF72/9VttTuPqZlM9A=
X-Google-Smtp-Source: AGHT+IEVJH69m3Tol6MXlyMkcLSWbCYFUgZIG3ickNDxavyuj3Qbw/ZqUcyoMFnpf3iYuY0BbllMXw==
X-Received: by 2002:a05:6830:4988:b0:71d:eee3:fd19 with SMTP id 46e09a7af769-726b87b3d9emr9563503a34.6.1739229383654;
        Mon, 10 Feb 2025 15:16:23 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc545bc40esm2758043eaf.29.2025.02.10.15.16.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:16:22 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 17:16:15 -0600
Subject: [PATCH 2/2] spi: spi-offload-trigger-pwm: add extra headers
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-spi-offload-extra-headers-v1-2-0f3356362254@baylibre.com>
References: <20250210-spi-offload-extra-headers-v1-0-0f3356362254@baylibre.com>
In-Reply-To: <20250210-spi-offload-extra-headers-v1-0-0f3356362254@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2

Add additional headers used in this driver. This is better than relying
on implicit includes via other unrelated headers.

Also sort the existing includes while doing so.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/spi/spi-offload-trigger-pwm.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/spi/spi-offload-trigger-pwm.c b/drivers/spi/spi-offload-trigger-pwm.c
index b26d4437c589052709a8206f8314ffd08355870e..805ed41560df090d85a8547b59f122cf2e3941a2 100644
--- a/drivers/spi/spi-offload-trigger-pwm.c
+++ b/drivers/spi/spi-offload-trigger-pwm.c
@@ -6,10 +6,17 @@
  * Generic PWM trigger for SPI offload.
  */
 
+#include <linux/device.h>
+#include <linux/err.h>
+#include <linux/math.h>
+#include <linux/mod_devicetable.h>
+#include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/pwm.h>
-#include <linux/mod_devicetable.h>
 #include <linux/spi/offload/provider.h>
+#include <linux/spi/offload/types.h>
+#include <linux/time.h>
 #include <linux/types.h>
 
 struct spi_offload_trigger_pwm_state {

-- 
2.43.0

