Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13E6C222580
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990961; cv=none; b=u5Zz0ySBcIQO7JbhFxafDf6iq17dttyh79AWjqvP9BIMlBcxWGNb4lvMBKz+ny0/mqx/iSLL6hRQp0+SfS3DC8uqfV9KhD+U4Jz6XgEouoXdKfa0fUPPTGLWPylVedZ9GnwNWu8NrwGsi1z5HpLJg5B8dTWKKEQ6+ze88EQDtwA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990961; c=relaxed/simple;
	bh=VGmVlLv/g0NSChA5cTCx5HI2+YgjvT8aXwQeEVYqWkw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KgJyTl6FwjMR/dihfWWNbksj0WHiY+ucsRTQpjnKRB1wYAuv4qGYQqdkwF5++ZC0P0/OUGhXQOXGkJJTUBDJ/JFbKtYkUcIQ0o/iZDY6mYZGIt5TiL2hZH/0FkYDQjwEv/WayX4DeEEhdlvbq3jwxt9qO/2twG1xZC1Pn2kGzDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=FLGYCwPI; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="FLGYCwPI"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so93385215e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:02:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747990957; x=1748595757; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uNsJvlRDFjThPSOtGOteiq+PCHwiQFN7KKK0wuA2YaI=;
        b=FLGYCwPIbJnQ5T9lL5rvaJgXnOlsBdTkCYdXhPsAB0ZUxOPXcc2tQsZ05gd9MIQEWr
         x/g1SCZG48OcuUgo7CExH0uu/Mc6dTVelENDgT+9PfpxgSsDOarJXMIF3Xug85Rd9CHI
         TPvB93xMNgzh8ZTveVNA2QoSeq7ban+4biy5nat8B/JD3jtjhy0Z6xRTxx9M37REQmxf
         dJ5gLzXH6M+Fu1UNgaDnWNXJJelPqi6/VauM+Nbvndu85gn0iLzFGTiFRsuEWPaLRP2o
         m0QLzUDUaGPkLjPLA+Ywvlitrx6yacVwQ7Q29AMTMo0Oo6e2R4wR7Iv279oA7tcXVziR
         hV5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990957; x=1748595757;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=uNsJvlRDFjThPSOtGOteiq+PCHwiQFN7KKK0wuA2YaI=;
        b=G8+J5pfScBganDEO1mFhvq35UhtwCbxhwkBMJGtE2gwoScQR5YDlXNuCyE8ID8Lgh3
         uyB3ByQQgPGh19rGDowN4CF1zdQX+m962/wtPdDaMJPh9sFIijSPmsG0auigH/+XqwbJ
         /5risB2Vnq1fwt2ZDWRdPz3CccXjTv0w2BtHWa0YB1vle8o3cALl2V0/lBRKO9oOeICz
         jNX82t21a/ZzOU23cqLvQfPwA8C4DCWSBS+DM2iI84cnf/iAIk/YYjosif7rvoj4bwaG
         Ww5aA/CKbOzrf8DJt3CQ0akblaNHutN2VXCNIIhF5nEm3WEMfFMuwhEl6uSqAgPcnA0U
         fU1g==
X-Forwarded-Encrypted: i=1; AJvYcCWmh0i4aELuYKUiVVO6Oz2TVYOQEo42qQXOP5CXm86tnlcZeMju4YhJLs5D4hYPREqehXl1ptRceHdJddE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZykbysfXZptGkRbekB3Wlh4kD7wVcws/6+Bl7NgjHtdr3yTp
	OkaPzskSXaFuUKCmDLuGYZd9MyrdyvNz66pPj+Dpn6ghA8zYWSBxQSTbCffLZ46QgYs=
X-Gm-Gg: ASbGncshl+PUtTsJFmWOy2sax0AF9HFYGzf6wB69mG7b/GEg3xNTzjQsrhQAmZqYyWq
	eq7swPBgcrI4yob8nRMH+hv5r69H/laIvil01R3B8MFJhhBa5f8zTKCXoIt2QgUzjwyPghd4LSr
	AJTCKuHZLjYedklr9AilV+U2ceVzeP5OLej5+X3aOhXGuJvsWIj71Bf+EL6/7JeSTFOgjA9swuh
	+BoOTlp1MTpsW3kGLSBQYGBwQgC40/98ugczXXsYVmhDXU2qnv9Wh49t3NJHNYJb2sQzGQ1wjcA
	/wztUtTAG5xmoTzSEHgrovR1oFHWoInbrbdBczBnWf0t7MRZ5gwPWQbcVRZ0KREiEvVkqIU1agA
	F/W4J5fKfcSepkxCrRFYIQWWCl+JbEv8ES0Q=
X-Google-Smtp-Source: AGHT+IHrv/0Am2o/Cwc2NPGsVz+BDLqWvyUZRI3yS33HkECUWVudaOgyHY6MciP6XrQElNGui4KaAA==
X-Received: by 2002:a05:6000:1883:b0:3a0:7d39:c23f with SMTP id ffacd0b85a97d-3a35c821990mr24768606f8f.21.1747990957326;
        Fri, 23 May 2025 02:02:37 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f24b6471sm134043205e9.24.2025.05.23.02.02.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:02:36 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 23 May 2025 11:00:51 +0200
Subject: [PATCH v3 1/2] iio: dac: adi-axi-dac: fix bus read
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250523-ad3552r-fix-bus-read-v3-1-310e726dd964@baylibre.com>
References: <20250523-ad3552r-fix-bus-read-v3-0-310e726dd964@baylibre.com>
In-Reply-To: <20250523-ad3552r-fix-bus-read-v3-0-310e726dd964@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Nuno Sa <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1333;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=9pHPKsKzptvjYiQOA8UzTeuM77FIRRsobVc0fiDL1Ac=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwsEyZ2OWzV1FgL2dKvMgVlZsTGQrktLobFre6aaxtE
 Z2WvuxxRykLgxgXg6yYIktdYoRJ6O1QKeUFjLNh5rAygQxh4OIUgIm8e8XwT9u3q5j/J/uvLIm3
 rK+Uu4I6RRdu5djx/tys/td7r+twtDL8FQndrLxVgrfD5MVE18fMTxpk1ioGejyqcS8Lu7vij+Y
 zLgA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix bus read function.

Testing the driver, on a random basis, wrong reads was detected, mainly
by a wrong DAC chip ID read at first boot.
Before reading the expected value from the AXI regmap, need always to
wait for busy flag to be cleared.

Fixes: e61d7178429a ("iio: dac: adi-axi-dac: extend features")
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/dac/adi-axi-dac.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/iio/dac/adi-axi-dac.c b/drivers/iio/dac/adi-axi-dac.c
index 8ed5ad1fa24cef649056bc5f4ca80abbf28b9323..5ee077c58d7f9730aec8a9c9dff5b84108b3a47e 100644
--- a/drivers/iio/dac/adi-axi-dac.c
+++ b/drivers/iio/dac/adi-axi-dac.c
@@ -760,6 +760,7 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 {
 	struct axi_dac_state *st = iio_backend_get_priv(back);
 	int ret;
+	u32 ival;
 
 	guard(mutex)(&st->lock);
 
@@ -772,6 +773,13 @@ static int axi_dac_bus_reg_read(struct iio_backend *back, u32 reg, u32 *val,
 	if (ret)
 		return ret;
 
+	ret = regmap_read_poll_timeout(st->regmap,
+				AXI_DAC_UI_STATUS_REG, ival,
+				FIELD_GET(AXI_DAC_UI_STATUS_IF_BUSY, ival) == 0,
+				10, 100 * KILO);
+	if (ret)
+		return ret;
+
 	return regmap_read(st->regmap, AXI_DAC_CUSTOM_RD_REG, val);
 }
 

-- 
2.49.0

