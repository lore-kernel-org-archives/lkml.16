Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80B7A186E2E
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001548; cv=none; b=cLtwbAeBtI5kUC+ulKN8D8oq/SnX9+pySnsFMD6LQMZYprXyxtktBFv1eqQgzKOUCTGfvHI7YH1aKWc5G+zeUY6OMG8hF2wkh3+4xmwZ2qsuofFdCWceWrkgsurudA7x/bw/cvMscew4KhClbS/8rEwdNTStevVS0+R+MVr+7bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001548; c=relaxed/simple;
	bh=Bv/8pmkVSLEHKs/mav/QyQx2gx+A9OyyTn67MfrVslE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=IrhixjY2MB//X25VpAcOwXDKUYLxyh2WdFse/P6Skpk4swVHdFSmq/5TCNWCUgztUlyWt1jCFZULQG/hQtbrJzU4XemMyGhJTT520LjfopKIhdwjGELEikV7a9jt5r6RTDRiEf77dyWUVYC1fFcLAPgZiYIuuuu/uhvzptNZsa0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=px+AmD9r; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="px+AmD9r"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cf848528aso16408465e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745001545; x=1745606345; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fdOyOpClnf46r1G0w0n1z533KfjfW03By15fERgN3ao=;
        b=px+AmD9rvf6F1yCAvzy0GdYQb5BJWDgK/eoaPubZs7HClc1OQ++HiHlsXg7RNKq25d
         agjhT1dz/aR/rQeGtA/MHkGQdrJ6zRh5EkCN+QOJGbrHnMa6bIzGS8bgy83fwsmyDiDU
         1UPwO4RxifOTEYFxoxKgyyYXvPObzIpZiGmsXhHyjEdD9kZkMXMNLMnphRNA2z0WKBih
         dC8cEQqOQ+cnGWzdl1gyC9v/+jzfz+AjLAj50TLSb1XUj40fhHvI80K5zIowfi2cwS4L
         oZv1oTQooaykylXvagdc8uBqlowLgAd2AGMJXRdBxuDna+CF7Z4cIws+pH53cC+7YJmj
         GPqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745001545; x=1745606345;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fdOyOpClnf46r1G0w0n1z533KfjfW03By15fERgN3ao=;
        b=UC6Phz+vX6DWWCUg6DwYnaz4i24rLtLzYQLgigjAEFAszSTNp9C+iwtoVPKFZw8ejL
         LUgN2CsiziPvM4kpcB/YRjroYXsu8rUZ6t1xWjL+HH1shHQ/muqoH1Q1iHDfjNwdPoFw
         zI2TAXXC49qfohE0yNtKzs59e0RwNpVTcWVbSkqhH3tfP7jWDBK/lG5m96aucLEP/bL4
         3hHhS/epYCxnsxIzucIri2TEmHaTwApShDN4Nx+bzoijt2oU34juMatBEdtvwNp1gc+q
         HYRNq/RZstzIFlcBaoiV99o0RkwvdoQxYRDoWs9SQ0DZ8BPlZlzxCF6DHerS22wx/TwH
         iRyQ==
X-Forwarded-Encrypted: i=1; AJvYcCXaZh4cLBbg3Q4LtfIhU3wMZ1YBRCA+HsXDkiaMS9bjTlqm09rRlV2r/irfUDQIdDusjWMvjmnOpKguaOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKi8ZXCJWaTpDkbElmPok0K10mlN24wnLggU7gkJwpi4DhtALR
	jupEDd2sKhcC584MHKNK4SrMyDxBFc2WN4Q3bEdflEyuCJQvzp3DUdcEbAVQjio=
X-Gm-Gg: ASbGncstCdE9Rcli6sJT0Ib9pI3dTlJ826X6+0HeZnNVTbVjgaiDoWExE4SSLVC+G9S
	1QyA6xPNAS8/n9ItkC27/rQqHXvPovLaZm6ihrjDgsD6UEbr6uehoYpHqotZzVHCDprnV17dxJT
	+HuxKXnye7M+0gAc5aleckGnCrjeU/LgSmkw/3kwOcOon8nXL+TJTVeVGe0aK6MnFhauLwS97dt
	0BRXZt0arDML1OpMCVLbjCHrvMAJFMZTsgTYhrmoS2DSeWw5fnu9hDa0YHfyRx/gKEGsIRxEwFh
	yWTDqgwpqFVi0hwyb+4SXLCTM8zYr8wi5N3oA7BURY2rRKl2Bc2Jh3QY9ljebuQEQTVOvUr/Rhd
	aHOJ4pnXLauCLeCjIKg==
X-Google-Smtp-Source: AGHT+IG5u79osLOJyjW/HnZsIL0/4QcAMEJjPNjmGPE4qL92+wsrfxd5ANNR1y0fi/i1c5rfxy70Qw==
X-Received: by 2002:a05:600c:524f:b0:43c:fb8e:aec0 with SMTP id 5b1f17b1804b1-4406ab7ff18mr30012915e9.1.1745001544822;
        Fri, 18 Apr 2025 11:39:04 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d6db117sm31044565e9.26.2025.04.18.11.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:39:04 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 18 Apr 2025 20:37:53 +0200
Subject: [PATCH v3] iio: adc: ad7606: fix serial register access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-wip-bl-ad7606-fix-reg-access-v3-1-d5eeb440c738@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAACcAmgC/43NTQ6CMBCG4auQrh3TKT+trryHcVGGAZogkNagh
 HB3CyvjRpfvl8kziwjsHQdxThbheXLBDX2M9JAIam3fMLgqtlBS5TJDDU83QtmBrXQhC6jdCzw
 3YIk4BNDqRAozbSqsRSRGz/Fi56+32K0Lj8HP+7cJt/VPeEJAkMRphnVKNaWX0s6dKz0fabiLz
 Z7Up2d+eCp6pkRbcaEZTf7lrev6BotFIgMbAQAA
X-Change-ID: 20250417-wip-bl-ad7606-fix-reg-access-729c21478d1f
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Beniamin Bia <beniamin.bia@analog.com>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1587;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=xDLDsBY+0buT4niZ2UTLenrevFoj/yl6I/WTIFIhTHE=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYshgmsP4u1lm3beujIUdU/Z2dtl4rzwYlR76I+fqBOXSx
 Avx5i3/OkpZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExk32VGhmeTJv3Vsb5WJCfU
 fOivUN+GuO1SP1m/rbnzaVG2lVfQw0OMDB0fd0aes757MIeb9cy8piOyx5gyTARP7p0SOk1D/F/
 tR1YA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix register read/write routine as per datasheet.

When reading multiple consecutive registers, only the first one is read
properly. This is due to missing chip select deassert and assert again
between first and second 16bit transfer, as shown in the datasheet
AD7606C-16, rev 0, figure 110.

Fixes: f2a22e1e172f ("iio: adc: ad7606: Add support for software mode for ad7616")
Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v3:
- fix typo in commit descritpion.
- Link to v2: https://lore.kernel.org/r/20250418-wip-bl-ad7606-fix-reg-access-v2-1-8b1ade67e185@baylibre.com

Changes in v2:
- improve bug description.
- Link to v1: https://lore.kernel.org/r/20250417-wip-bl-ad7606-fix-reg-access-v1-1-0ce341f3cfc3@baylibre.com
---
 drivers/iio/adc/ad7606_spi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad7606_spi.c b/drivers/iio/adc/ad7606_spi.c
index 997be483ebb93293481b922e13ece4edb47e940a..bd05357a542cf7234d5bb6b718829d6b720262cd 100644
--- a/drivers/iio/adc/ad7606_spi.c
+++ b/drivers/iio/adc/ad7606_spi.c
@@ -103,7 +103,7 @@ static int ad7606_spi_reg_read(struct ad7606_state *st, unsigned int addr)
 		{
 			.tx_buf = &st->d16[0],
 			.len = 2,
-			.cs_change = 0,
+			.cs_change = 1,
 		}, {
 			.rx_buf = &st->d16[1],
 			.len = 2,

---
base-commit: 8dc6b228d746b1a900bed28568defb2266fa4c43
change-id: 20250417-wip-bl-ad7606-fix-reg-access-729c21478d1f

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

