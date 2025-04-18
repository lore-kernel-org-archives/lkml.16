Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C19DF222592
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 18:33:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745001195; cv=none; b=nm8po6LH3yuVAdl78leaQhcP3nLpVaJ2jOJZ8lBAvIZZCoNQ8/nZhw/WwGyC6Ibd18K5tvFb81OipT5jGl38ovyzu3YjG9r5p+0WDiLOHsAS6UU2lMs65UVs4DLtblTGAuxEA87hWMpHeLWZFNv406xbRSkTz7lMwsdCUq8YRKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745001195; c=relaxed/simple;
	bh=BFNfCAXgfDy1H6nRZLQIbFDRB827dsSp/614b/HrH88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oeYSGd7BVtml3FbIGo4oKRZhHh/KTv334e3KN4F/VHIXAdp4HJ/P/LZpCFFSRxKTmzMhynILehEB5xqcnz7rW7Wbt1FXsBQWmKwLCfPamUoIRAtGbxF4OcrZqHjxYVY7+dTtxWYCf5vVGYmiTKcZ7nigwZ3rhr4d77VbomQf448=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=L5O7QZ+e; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="L5O7QZ+e"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so24598155e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 11:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745001191; x=1745605991; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iRZ+jgVFwgume6BxLPo2873YNqsDxYM/0lRV47dPLIo=;
        b=L5O7QZ+eyONOJo3fkO4oGPPllKpO31RSaxKnWXDX391kNnevMrmQoKPV5fdAshyEmb
         sLNtGaSV/7P8MVeFLyWex8isy2SpVpmqGE/8HN8bdAIafrWa/W1lkKDZJLXr3aSZjITz
         uSgLEfHYoIJmk18823Cq1GES5mCbkeKFh+a4cTOv8+91KSN3kWpr0pwjCgwraoOE+t7r
         W+xrfuy+Ivh+9fnzZOQcwS4IKcML9EnRBMqkeEaDlxCr/ZTl12LHTWNxrgPL9GiXLGOP
         plMonwmoCJnHsPz8gk11GjjG51KhDCGrCsMrMCLbCdJr2eWaas7awOhZbkN5Knjmcbv/
         66sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745001191; x=1745605991;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iRZ+jgVFwgume6BxLPo2873YNqsDxYM/0lRV47dPLIo=;
        b=WgsyRmH8OkHAvmLCFAaxjv4VwCFpHL8mQmiZ00H3GpND33/DufvNL4nxXB6/vtuwWM
         mz1PVyQnuWW6BMNDvFs53TbxDPESYFaWY7xwq9hYM0imhpdNJB0W5nyHb7eSfMvksJtp
         SS7QuU3dN4ldBLBKqlzG17bLEg0EM0rSGENZOSxHRNFnBToDppV2SrjQ/3uMP1OH2UOg
         JXZjovxqvP9+xzZIIbLZ/dvDnn1Fq2Z7lMSbpZpxrgn4ZsSOQcIasQQHNjgUH3XPBq+s
         ReGaSGKf7epjcQrL4a6RP7mhcbeRW+p8BGY+0O2UiU7U2qvnWFJXMiGLmxc63YhjYNdV
         krFA==
X-Forwarded-Encrypted: i=1; AJvYcCWfebbJq5ye37o83ciMIHIqG+Etp0p1JTlxdBBbcLcq1ytxhzCAcPE3sWyvnTzU2V7piYsnRilDAb9W2IU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6ftf0Hx12heydE5TI1ve85UNoKY6XoJNtB5GS7+Gf1aaGMds+
	fwlqbMeqdwQSMfDNRaxuBlxBIMaDE7Y8AscqnYW5QjE1ReS87USu1l+/kBj/Ey7JprA9RWCZLvf
	R
X-Gm-Gg: ASbGncvPE7s+GuYQffTKTGF3yVFVUPPRB/cayKRJDDaHHLu+l75EhnRzdus9U7WcgBm
	dAdGqVXM/GIDFRKaO/Mtr0J+ioXLT/NV+J3pBfCvTBAuNI36tA2qcR98ABTGBytwhx18hJIkCc7
	xQ0mu4ba1I0JDGk4Nq7F5bldniGsAafH6E47iEY/cQNtLAiaGUFSqSNd/8D2CaByE2pSZ33OSqB
	P3FwBVUHWYszC4XAfuqCr+hnUiQsI6qbveuUsQ36QaEnFR4OeqR/RcQhB5qYaf6pVrYjSmO4jNI
	z9GT0tAfk83l3G8BJTgJOHTj2xg3ah/wimzXU5kJXfsqOh0s2yhzzy1B7wdLliDEITxbeV7XpH7
	paixkinWsFL5ah5zRnQ==
X-Google-Smtp-Source: AGHT+IGj9S4WRUKZtNodHl0GH1cTBRYlYX+0W8A4QD6dvdXuglhWcvb+rdy1DdVJlqow/SR2YziSIA==
X-Received: by 2002:a05:600c:190d:b0:43c:ee3f:2c3 with SMTP id 5b1f17b1804b1-4406ab67e15mr30991265e9.7.1745001191034;
        Fri, 18 Apr 2025 11:33:11 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa433429sm3472343f8f.37.2025.04.18.11.33.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Apr 2025 11:33:10 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 18 Apr 2025 20:31:59 +0200
Subject: [PATCH v2] iio: adc: ad7606: fix serial register access
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250418-wip-bl-ad7606-fix-reg-access-v2-1-8b1ade67e185@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAJ6aAmgC/42NQQ6CMBBFr0Jm7Zi2IFVW3sOwKMMUJkEgrUEJ4
 e5WTuDyvfy8v0HkIByhyjYIvEiUaUxgThlQ78aOUdrEYJS5qEJbfMuMzYCutaUq0csHA3foiDh
 GtOZGRhf22moPKTEHTosj/6gT9xJfU1iPt0X/7J/hRaNGRZwX2ufkKb83bh2kCXym6Qn1vu9fV
 PkFAssAAAA=
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1424;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=c/1c0SGQH8ay28jUfCcMDnmohaa6iaUAM5O7MoDjGZU=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYshgmjX/c7dNWIjfl3+tj1cnh6wsft6y9Pwj7nlqdmsOz
 uh6eMtVqKOUhUGMi0FWTJGlLjHCJPR2qJTyAsbZMHNYmUCGMHBxCsBEuEUZ/kdczX5jdP38+7Dw
 18xCbPNl9COs2b7tXjJltbU9r0Vt+C6G/16HeHar6LxZYvIwz2PvEilzy1Wle66Hv+ldKNRit7m
 Bnw8A
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix register read/write routine as per datasheet.

When reading multiple consecutive registers, only the first one is read
properly. This is due to missing chip select deassert and assert again
between first and second 16bit transferm as shown in the datasheet
AD7606C-16, rev 0, figure 110.

Fixes: f2a22e1e172f ("iio: adc: ad7606: Add support for software mode for ad7616")
Reviewed-by: David Lechner <dlechner@baylibre.com>
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
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

