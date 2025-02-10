Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3D725EFBE
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229383; cv=none; b=kXvIZJaRpbd/914eGheWdLnp//otGGVFSDCLVuIxH/9+67TDLQgDQDXBmk/2khT81avk2tIh0Dv+o7tlTesKPHCvqzbkXspnlHSX5xMTIDbjmzlCBPkCpA+jQZW4IPfAjO10WEK4y2HqvXUDR2JNvxULoQA5e9CgyScLQvcDoGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229383; c=relaxed/simple;
	bh=fwM8qEu5h1zUp2oTAbXzdbLh9akj8f0+B5V6fLJkDyU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e2MZuhl3IEMTl9rytxLEPPcwksX3tkWNdF1rmL4V05MAVRLmWz9eEiFPlDSC6tNW8/WjUzIKsUr283WRWayoAog8oJ7V5Ybd5Jh8u64LRy97wZlgk5Y/RuApPaQYSwtKbnc4FKMihVltyFVqoDvE8IBk5PmEcfP5gOi40ccM0x0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bTvUyoJE; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bTvUyoJE"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-5fc73d5786eso1092251eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739229381; x=1739834181; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lzozfC/C/CNZbOHWxAaIbKwLQXLSUBmVfwbt3QVV2pc=;
        b=bTvUyoJEyZ6dNQ965hSuNKoOTOBwSeEV//4LX4ZDLL35WK47VxOlgr+wW+8xEozduh
         CBnm3udwcSB+GrpPFir68/TwGQk80+Syrro3UxWY9taIcGuWwAMN9GrgMnhK5vWHodgH
         q5TJ3ztsZ/k/MhVr3ITLPZ+Sa3SCfXVO+mLMyaOawiWMFmTHLPph51VtfvXo/vdHfdp9
         eXQ+UonNudU/i9gkufoPVnKOQooGNWZl9VsW/36eu7jyoiFUVTj9i9RR/UO26GooNowI
         +RdAC+kJdZzARnmGPmf+yj8WKcg7oHJ5CQf99DCNoSR6n6iu7+VhqupA/J2fiG3TlDwF
         E/0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229381; x=1739834181;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lzozfC/C/CNZbOHWxAaIbKwLQXLSUBmVfwbt3QVV2pc=;
        b=T4JrI186vG8jsanMLPb4uO0Rkgs0gMNmg+ABKjr2cFCCMQ+EpHSvuTDysf02wf1rck
         NqIH2CTN1xuBRjbDdhUJP5UD10LSAEWmsEPcSi6Xz6C9gUGiZ703M2bCGuknE2V4M6oy
         eKXH7Vdnjxfi6ri9YALDWZNwmaYjr5I+tIJMJxoEpvRnq9ODGkWxdPGFGnjL1lfR5nLX
         OZZfZzY+rJfLXZa0BOh1EpmRGhLlrfO2ZnsFqpqt37duruiuKe4wefB7yh9jii+A8EJ6
         eQY5PjqG7RLqeaNmlGwciTqkc3gx37G/GgNcfR5JRgQvkakt6rkNESXdCHoTUuTr6iHY
         vcow==
X-Forwarded-Encrypted: i=1; AJvYcCUXXdRjwa4Wegkvqh5Ca3bIpbkib9IOM4IfdKPkQH+LHdPcMihyKyXdO0pAT2Vz+2ZiN3p3WoZlrMKdYEM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxxuO/RhDL4IPAcU8fKgYuXuLsE20qkUZRBqRz+gI35zuKuDpyc
	gKyvGMbgbfZAeD8VMzUv5tm30jbjHHRLmfjZbR6F62kKkmcuv/WUFTSmfy9HKV0=
X-Gm-Gg: ASbGncvE4oOw7Hl1fJewbOG+3azG1wV9RJ2xllmkeQp/vKO+u0JX9XPE1WqFvxQiGdy
	jjnLQvBV/KAI6TKw3JWwVHZUs8nCur44viqzneAkctcNjNy0IWTAEyf+ks1YXnkK+M1i39+hTDA
	EBjaBe+hTOdL3tYq19Y5KKG3jQMNRRTMznWNK8s8D0185eYkRCZ4u2JNqBD2jG/9ZDPtxq0gDAw
	WAnxJtjAGmeA4Vb1kurdM3+vpRIhLjn7stryCS3q3hXY+KZ34du0eZxNTpg0NVhzXbHDiB7EOJt
	nDktvxUkQMr52zDhI9Y4i33O28nxuADHDUPHA+O65qKb2V8=
X-Google-Smtp-Source: AGHT+IGg5a+3PHs2A+mC/Xs4YrchdRMKPJfOeNphn3yRBkRtdQVXcqW2zbyQzWyk7tGY2CWhFieumA==
X-Received: by 2002:a4a:ee82:0:b0:5fc:8f9f:5a2e with SMTP id 006d021491bc7-5fc8f9f5efamr2207464eaf.2.1739229381087;
        Mon, 10 Feb 2025 15:16:21 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc545bc40esm2758043eaf.29.2025.02.10.15.16.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:16:19 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Date: Mon, 10 Feb 2025 17:16:14 -0600
Subject: [PATCH 1/2] spi: offload: types: include linux/bits.h
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250210-spi-offload-extra-headers-v1-1-0f3356362254@baylibre.com>
References: <20250210-spi-offload-extra-headers-v1-0-0f3356362254@baylibre.com>
In-Reply-To: <20250210-spi-offload-extra-headers-v1-0-0f3356362254@baylibre.com>
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2

Add #include <linux/bits.h> to linux/spi/offload/types.h since this
file uses the BIT macro.

Suggested-by: Andy Shevchenko <andriy.shevchenko@intel.com>
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 include/linux/spi/offload/types.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/spi/offload/types.h b/include/linux/spi/offload/types.h
index 86d0e8cb9495bb43e177378b2041067de8ea8786..6f78923478713aa3c4fc03d7d47b768ed1d52682 100644
--- a/include/linux/spi/offload/types.h
+++ b/include/linux/spi/offload/types.h
@@ -7,6 +7,7 @@
 #ifndef __LINUX_SPI_OFFLOAD_TYPES_H
 #define __LINUX_SPI_OFFLOAD_TYPES_H
 
+#include <linux/bits.h>
 #include <linux/types.h>
 
 struct device;

-- 
2.43.0

