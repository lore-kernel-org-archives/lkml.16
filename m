Received: from mail-oa1-f51.google.com (mail-oa1-f51.google.com [209.85.160.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 925A921A436
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 22:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743547841; cv=none; b=sE9iHTe9SZIJomtvis1acJUGTOXyFSkOdySNCod3X9ynvmGSYiv9KoRZXN2fvxnqMKXkIm93vb636IO07DX8AmfUNVu6IVbhocyPT2B98nv7tGFCdtyMpegGcVk90ySBZL47AU6L/H2PtvwjHeKwnEvnb2hhFZFFqe0ygXTcAUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743547841; c=relaxed/simple;
	bh=TFjwmH+xYODJDHRu7+6zpGJURRvrNkpc2t3jrzy9BBE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NUsG2Wawkt9m9HvqzOdBD6/9FNgYNY/iYSm1aTAeegTslXfUMbTH+tyqtdoirtVc0EIOo9b18G9On+WrEr/+PtWpmj9Yxe0wsLeC7kpxVcNc16ZX/d0W7tx+w0WrXXtDnYQJUxiX+crSyOCEm3AklyM/IrTNHi5D47cTO9XgfZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=IouOL8ae; arc=none smtp.client-ip=209.85.160.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="IouOL8ae"
Received: by mail-oa1-f51.google.com with SMTP id 586e51a60fabf-2c68fd223bcso2267679fac.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 15:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1743547838; x=1744152638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eBF8hIhV/gGGIF9CyDabCpTI9anOcgSekPdGitLDP/E=;
        b=IouOL8ae+gkUuB02wWJOcZGYcdMYFCWTgWOPG33AAW+egF19ZOAVYDfGMtkQgUnsBd
         RqljJ31XtnJ6aKIju9pzR6LjXm3nmvLXOg8/H85tpQSRefvsWambpXT2NvuEoCnAsSwV
         +LUXTgOMg0a/2QqnVkwcJBMMnqdFvvtML5rGW+vzNt/kpqjB1nAL0B7Fhr9oAn6FPiYf
         Ylq0U5J6cE6NI9vkki1y7roP7EaD5v+dHLjGc6Ue4KRTDA1IofZw+R+Z501n4pDL3lOx
         WmhhfAO6PY+58BB2+3sOIbaT52q+jVHoCYFVxgWEDEt3Tl1BE5/QqbiNyGHA5sHo83Kz
         YeiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743547838; x=1744152638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eBF8hIhV/gGGIF9CyDabCpTI9anOcgSekPdGitLDP/E=;
        b=rnyFFiNa0X4+m64NMQg2K/7Wqxh5CeYY8DGTdYOcWvCyMyloKZWOfaX8lw5ivyx/a8
         nrtolovrKS25HT90/KSltpu61xWuE46YXzBeJCDYMNnCWB1kSl8uRKcOdCDtwToHcNWz
         Dli8IrBikKCXY4X63FH3ghD3ZAezzdjFcuZd8Add8NxfgPb+Mz3hus3i1AS3S+a7UF6v
         oycXFkgIU34Qkd/4ZqEbd7/fba40PrdMDhqhwLnekZfWTHL9XxaUcLJPnYQCLM8tDwIn
         ZoZPfset1qWFWCis1VLWGiLIgzqgoK6aJBcHb4OB5wsvOYwALyazZgtqX71kqI/n7DjJ
         6WKA==
X-Forwarded-Encrypted: i=1; AJvYcCWwrJLFFWebkesvhAycrDjklyW48PTHJkHpQ9iNrB1Q2af8WKIkLKrhxWHRB2DS9Gc2Q7ei54TA1FF7dgA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzes9cpHPyBSNRwlXhCOGG0rzS1zHLe1hx0NM4ZE8YUbsIfHR55
	5IXbIYpaLUdTalslCrZNh/aNhsNNBSQedktfijjs37g8trKCatLcqNH4qO7LVF0=
X-Gm-Gg: ASbGnctzvAky8IU/+0O1t4jUCRDWvD7KkxTYAnjqndPum9MFNaF4nze28b4lh515t4K
	eYvVoBjrnmx6J9kO9K4Lj52L28qyX0TfmX6eANWV2SQAN6B4LE5uqhjcb8hmqO7ylvfQL9/cn4S
	xBK3YiVDp+VZ0MhLzR3cYLCqCGcErmpbE5copzrlvZFE1WjSWvwyhqo1iHpw6xfF8jGN0qilV1q
	3PB2FWAvT/esJHrZL/XcFEYT2RQt7Rn+YI7mC4CRrULMuAj3cIrxVEptpNpsh/zoaX21jX9J8lK
	riW+SKU/H85Kn+sCwA288fQq1eYHvBndXXaEAluKpZzCmminN5pqEZwr4DGzX88WnGlpKBnNy5o
	C
X-Google-Smtp-Source: AGHT+IESz/E4eI0MhmXQMQkBoqB2xjogbiGsCXXe0qD+Mbg5ugdkYMFO/KDTISnaHkB68zUZBZxAog==
X-Received: by 2002:a05:6870:9a22:b0:2c1:3d93:c192 with SMTP id 586e51a60fabf-2cbcf7e2558mr8560619fac.37.1743547838707;
        Tue, 01 Apr 2025 15:50:38 -0700 (PDT)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-2c86a860267sm2541894fac.36.2025.04.01.15.50.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 15:50:38 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Apr 2025 17:50:09 -0500
Subject: [PATCH 2/5] iio: adc: ad7380: rename internal_ref_only
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250401-iio-ad7380-add-ad7389-4-v1-2-23d2568aa24f@baylibre.com>
References: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
In-Reply-To: <20250401-iio-ad7380-add-ad7389-4-v1-0-23d2568aa24f@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-iio@vger.kernel.org
Cc: Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Corbet <corbet@lwn.net>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2396; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=TFjwmH+xYODJDHRu7+6zpGJURRvrNkpc2t3jrzy9BBE=;
 b=owEBgwJ8/ZANAwAKAR+K+IyC93wDAcsmYgBn7G23egjxV4yz3dj26AK7uLICaoldkTDiVP/xg
 guuGaexxGSJAkkEAAEKADMWIQSKc9gqah9QmQfzc4gfiviMgvd8AwUCZ+xttxUcZGF2aWRAbGVj
 aG5vbG9neS5jb20ACgkQH4r4jIL3fAPr0w/9EkuROxujgEl8VHDj4h5nwtZmLdOqXy00Ra5uSIV
 l5d1vmMRw6yCTUAK0SPtgWfxerm/fCf+anaH0jr7QIgr3B72JZ+HIU+dY5GFyjI9hGGR+Er00qy
 cvkwd0EQxzV9gplODJ6+b2K2TO6OZjIyK7JH/UtxvOZb95mVEecYG1KPJmMDWw3OLXDS+xdimrF
 1RuD7e/JiyX19/Bb7jgRRFWboRa83eUF3ONzDWalKc5aI+f1EcGfP47tnAwHrNUQ6qKHYlJINBg
 jd2Jkh1jq4lkF+OOzHRLN5MlHSqSOberl1Ws8q2EBxCH7pLaaXoySE/rORj+CJKszygf0JGvN37
 AaXbvRzvDSylQRIyfzNWzaVCvkLlw7YtJbdqgz1LcWsVUkbOBi20G+hsC7mCDy/CIIxMjj5KrKO
 q/sc0KjzAUXoItTWgy0wyKFgQwf0LR2gfxLFK3TZPy3fhhoN02LSgwDGh6PxCxx8ipi4eWux7Ff
 6CbkgVjikdPNL7/ffhwtKau2joe/7Fso0PADHTCGGd8hlYtsj5rnEjSOMt8H3QNyddd+EKdERnV
 WAzVzsY9yzEMJTqtaWHc5J1WqlmDliY7E4UEfIs1kbzhWwc4JVsFtbpjrYv8v+6JnWil+hQYWhm
 fUsFEaPYsLfQeRtc0laxu/yrJnmblapSNE3vHGW0/WtE=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Rename adaq_internal_ref_only to internal_ref_only_adaq. There are non-
ADAQ chips in the family that are also internal reference only, so the
adaq_ prefix is misleading.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad7380.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/iio/adc/ad7380.c b/drivers/iio/adc/ad7380.c
index 4fcb49fdf56639784098f0147a9faef8dcb6b0f6..18ed07275be8e031e54f3595f70afe47514084cd 100644
--- a/drivers/iio/adc/ad7380.c
+++ b/drivers/iio/adc/ad7380.c
@@ -119,7 +119,7 @@ struct ad7380_chip_info {
 	const char * const *supplies;
 	unsigned int num_supplies;
 	bool external_ref_only;
-	bool adaq_internal_ref_only;
+	bool internal_ref_only;
 	const char * const *vcm_supplies;
 	unsigned int num_vcm_supplies;
 	const unsigned long *available_scan_masks;
@@ -806,7 +806,7 @@ static const struct ad7380_chip_info adaq4370_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
-	.adaq_internal_ref_only = true,
+	.internal_ref_only = true,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -821,7 +821,7 @@ static const struct ad7380_chip_info adaq4380_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
-	.adaq_internal_ref_only = true,
+	.internal_ref_only = true,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -836,7 +836,7 @@ static const struct ad7380_chip_info adaq4381_4_chip_info = {
 	.num_simult_channels = 4,
 	.supplies = adaq4380_supplies,
 	.num_supplies = ARRAY_SIZE(adaq4380_supplies),
-	.adaq_internal_ref_only = true,
+	.internal_ref_only = true,
 	.has_hardware_gain = true,
 	.available_scan_masks = ad7380_4_channel_scan_masks,
 	.timing_specs = &ad7380_4_timing,
@@ -1847,7 +1847,7 @@ static int ad7380_probe(struct spi_device *spi)
 				     "Failed to enable power supplies\n");
 	fsleep(T_POWERUP_US);
 
-	if (st->chip_info->adaq_internal_ref_only) {
+	if (st->chip_info->internal_ref_only) {
 		/*
 		 * ADAQ chips use fixed internal reference but still
 		 * require a specific reference supply to power it.

-- 
2.43.0

