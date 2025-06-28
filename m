Received: from mail-oi1-f171.google.com (mail-oi1-f171.google.com [209.85.167.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A3EE25B2FC
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:31:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751131917; cv=none; b=d2tNHFKFACp7ozl7XZUBpg/4z7yogLPpT5s3GREiBVyZcmK+4yvwR22QnZscBhsA2Ld+A0R8Ok5EDV+iuAQ9gw/rLBV82G4wi7ZCQGmu1qjb8hW2gPZ0H9QsJ4iaMRXR6vxAHJZPpRZnzcdvl9x94juZze3tuk2hFVrcCig0KSc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751131917; c=relaxed/simple;
	bh=mNlNcIDpJOuFxOzfuo0nWQ2Cmf1deme4AEktqDh7bL0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=EILkfaH6n9j/VdQsOfup5qltECJ+p2+kvY1JrymZf9zuFoQ7yDgSLcZoISJo8jsm++eBIUjBfDcPcDm0bnhh/5jbF/WQLnopnxrDzfEPQVjoQyIvHfHD1QO9JuUGlCQhuUrV0iEHiLmGUp1RfMEc9FuEWLgAtrzsdXNcephT6HM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=QWqlaoeT; arc=none smtp.client-ip=209.85.167.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="QWqlaoeT"
Received: by mail-oi1-f171.google.com with SMTP id 5614622812f47-4079f80ff0fso2487939b6e.1
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751131913; x=1751736713; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a/rZ/BZZ6dj3yKfppO+1iRMMiSpP3Dh4QhplfHbi68c=;
        b=QWqlaoeTQJHcnj4eDY76pzJRKM2QwFBfAXw3iUHslMnRmiT1577+AR/DWAv0IGQnV1
         S9TnB60KWA6rJEYSQb5W5cVLjZkrhJuhsoQXZQfmsLdqtSUZ7HQnpp/p4G2NXCn+NSU6
         v+AcfOBe38SaqbyYNlZ0Syum6BcWqqImebglksDNIcHJ71FWjxZupawvCRp7FCvWdy4h
         E2RX1TFuMnzltj8riSQunfpGhaFN7TGuHE6AjK5KHNAoRYjS0KYRIL0aklOMQl7ckRLH
         4RD3UNg3hZ+Jmeev3G8gSCm+/I5HtaSYsp1GV8tSEZcET4gwV3+ugp8iL+FxCZ+s24zx
         xW+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751131913; x=1751736713;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a/rZ/BZZ6dj3yKfppO+1iRMMiSpP3Dh4QhplfHbi68c=;
        b=xEpKSp767O9wBhvoN49I6pB3BCDQnkN37+0pdKkiI2MyyUEvHjwxr5hO7fUXZi0IVQ
         w5vEFwS9vjqiJtHu5A9vLqrybcGDeWhXT3kcYZWMjjneyOr0dNp9y5/ujlDKNEg/diqs
         c1aE9s9a7by7SCbHz43LzBppImJZ5R72KWUmDESVCsZN5KGrF6mvlEoS4uVIdtFTbazj
         ePs9l1Eph3xlZFRDVXJy6E74NO+CDUIdetCN3od35qV4oc49ZCQ9sDO7tBgTGIZWPgGU
         NBnxBcBfFPr+R63h1ybDDF9zkye47LrNhNSwtOZaSq/k9NaTvx80GEvHElN28pSfA4R8
         bTtg==
X-Forwarded-Encrypted: i=1; AJvYcCWdTdlCKDTAQ/qK0Vtea3VyQDvEID+UBMK9CTbIqTU+pp6pg9QFZ1GwVWqg6ksff1jbeXiv7MUtxcqyQHs=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqKu56bplP4NZCHWFm4fwLtHO2P0ba/UFMR2NAgaTWiEBVCUMX
	KmlOVVWGls1uStyHcC8T/rQgT1aPtabOpAublv30rFKJak0yHIh2vZYY1Fvv/RkjFR8g5puSRgB
	Rv428zKU=
X-Gm-Gg: ASbGncuFeb+AodtwBUpYER7XruQOB5GI5QSI2QvzSynXVETtayVfv/1lKFMysArXoBS
	O3wpA1NckEBU8N1+r71d5TWYDEdw9mhRcm47/RiwPtke3zi/LOAbW7yhWIPQcMnwWi0Lk/PR+d+
	0VR7kPyQ7CPJ7GTDG8GR3ScJEJgM23gdRxwX1KvMgiTflwkTmgY32rtGwFx24H1e7xlWsPSyXrs
	UUf0Ce8T7uVCFJCvHzf3Yvc0wl4deETXPE78j5nvL5tKZN6Y/knoikb9Y5wnV9M4eVDWNgYfSvW
	2MXEW/wkm9oEe7SV/TOuOTnkCVWDniIRgL1HWMiojVTnSjJaNRnDdqXLYTHbkOvjSg61
X-Google-Smtp-Source: AGHT+IHN6ojHQDxt1Bx0mZTR0H0cL5vmfW7pJKbLefP/CkbpptVvu96oSnp+TX4rwF0z98uc0D6FGw==
X-Received: by 2002:a05:6808:48cc:b0:40b:52ff:7a62 with SMTP id 5614622812f47-40b52ff7af1mr997475b6e.8.1751131913560;
        Sat, 28 Jun 2025 10:31:53 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae4e9sm895241b6e.17.2025.06.28.10.31.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:31:53 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:31:43 -0500
Subject: [PATCH] iio: imu: bmi160: make bmi160_regs const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-18-v1-1-dad85ac392ae@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAP4mYGgC/x3MTQqAIBBA4avIrBswrZCuEi38mWo2GioRRHdPW
 n6L9x4olJkKzOKBTBcXTrGh7wT4w8adkEMzKKlGOSmDzAl9iqVisNVib9AZ7YLTNAQ5QuvOTBv
 f/3NZ3/cDfG7BrGMAAAA=
X-Change-ID: 20250628-iio-const-data-18-b83bdb3e4d05
To: Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=mNlNcIDpJOuFxOzfuo0nWQ2Cmf1deme4AEktqDh7bL0=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCcB/CkRqcoJ0X+ucTtszV8cbkFH/qYauTxfa
 PkNJhg+/KyJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAnAQAKCRDCzCAB/wGP
 wFtyCACfsx4BEqaYVAkiPaTJ/aV9allSyiIY1u09Zfcyt1QNyg1WaTEVlYCyoGvB4WM+09mtHNa
 jsN9iRfbZKKHQNedart11F1+LpEIOgVbNNUPlUvPKHHVEdx3VKiOwtrNTatcW2hYbC5Tj8Mcsm0
 DRAWH6atLgJrP5ZSaK927EM5aTgb6gdKdgtqDtAXne7AFMS2PGazauN6KqS/KhlOYlP3fHzSBm6
 fvmELEftOg9FgEtwMIiOT+HNsRECXN3HWZPkJbkNVM55rFKbzB7Jvxc4E2fWlaxi2qSDmdqb888
 P9yuxCGXaFglspAWFFxznyh07YGFxOaHPuWvF/9Ew2Iu7LI2
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct bmi160_regs bmi160_regs[]. This is
read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/imu/bmi160/bmi160_core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/imu/bmi160/bmi160_core.c b/drivers/iio/imu/bmi160/bmi160_core.c
index 9aa54b95b89f96299e65b9cc00149bffe5f2e56a..5f47708b4c5dc5b2eb139b1c36542aae22a4cf43 100644
--- a/drivers/iio/imu/bmi160/bmi160_core.c
+++ b/drivers/iio/imu/bmi160/bmi160_core.c
@@ -161,7 +161,7 @@ struct bmi160_regs {
 	u8 pmu_cmd_suspend;
 };
 
-static struct bmi160_regs bmi160_regs[] = {
+static const struct bmi160_regs bmi160_regs[] = {
 	[BMI160_ACCEL] = {
 		.data	= BMI160_REG_DATA_ACCEL_XOUT_L,
 		.config	= BMI160_REG_ACCEL_CONFIG,

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-18-b83bdb3e4d05

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

