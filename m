Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54B828688E
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 21:07:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751576877; cv=none; b=oJVDJbcfXSeHparXk6O62HciHNyRbDKeSsQWSrVCIsPzVlutq+hRLF992J0P0RzZg0WP0viswtwmQhqWAIgrYz3F1geGcnF7ERUYd3dg/GxEU0c8AB3ZI8fZ7+QY9GQbcdqOMtTUSGo4HCpE0/GFnsd10DWZOeBtt/xvM1SRSLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751576877; c=relaxed/simple;
	bh=kqPXioKOoQz945FL/ykJkjIoFVXZSuZyL+bCmVjutc4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PRqcQj02apzcKnukSMFl8MuA6L/iPqH5DpR57DDMPtsYFZeYzoAmJ5gW/0e071isz/ukCyCEZjxIRpT9N3Pn5NknwN5YD61mWN8+2YtOolvJPa1tayTddT9IWcMZ6pkAo55CdvIfhxAFSXaFbDy4uolWznTxWqV4+jrqXGOzIws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=VBa/ee7G; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="VBa/ee7G"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-72c09f8369cso142535a34.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 14:07:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751576875; x=1752181675; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=t4oYDZ5sK08jy+FMU7Girvf+ZLAM5OGZtPNURJiwJ+8=;
        b=VBa/ee7GAy9zTfPePYvdzVhESliiimZT8C0uKAKao2bt4MyXkgnTTLIeYVQ7otu8ev
         aoCSPpg7HqQ7zqrBiSOr8bleubgbgv7IPUqsDB3mBYpivz03Ltbu0BoRsqla5rLcvO3d
         ND/e6dZcu4WAeBor5mdhcMED7FQ5kVm0bwysmvNC5mVmsrLn+oWjWEgJuHFKwUe5pj1B
         wda9YG1yZ8oZ1DJoIDwXoUiURcCX3Tz0Uo3DryWFkP4m1bd8FjGq+zv9b6RFw2Na69t1
         1iMjJx7PAk/5cUjtKzbuHNkM8PZJVThYBpHsYR0w20yvwDVS2m19Ph+mJiTFajE2eKZi
         WWeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751576875; x=1752181675;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=t4oYDZ5sK08jy+FMU7Girvf+ZLAM5OGZtPNURJiwJ+8=;
        b=D9NgLBqlbFM7EAGP20Q0MOVEorP+vkBxY/hnsNxeKU1K9czk9MhX/ofDL5ApgTsIKn
         vRTA955B4C5lcPMOA5E4ucxZ6dH8D18z5WX9xAIeaD6BVBXNSKf7zgXMYA3nIKD/7lZV
         QmzE6sxMOsLBH5nsqHftDIZUARUgHYaMj2jsQr/EJhI8tUV98/Y52XIKJYrUVClu0ASR
         hNfcNiy0IptKynyQ0/tye2XEroyTl+ximaoRr8+LE+74fV3L9V+YOiFTmwk29PNsQH2h
         SO49fXet4jCHU8+2sESRvUMLGfE32+6KyFJwERsDDs6dH/C1TFtDUXVDh0hken247Yih
         7z9A==
X-Forwarded-Encrypted: i=1; AJvYcCVDqSAsJsdOpXfIFV+izYGEx6H8O39aF6wLooAa5eDAeGC8V2yB7FAD+tWZ/jhBWNa0bHBh/hthLuJ77RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWimc9nvJbLVajaEtswuddx69A1h54HKqm6mE/aEHAARQ1PJgS
	Tq9MvUuAtswZC6n/V65E/uuhoPADSRhKPY+Y/qnATSlibeJ1pXAZeEEr6LW/YZpsUyI=
X-Gm-Gg: ASbGnctoDuE6ui35T25/o3wrjuzanM1lVx4T6YcYjcQ13t0y1JgRKRaAwZqz8beAKy1
	yn+Uy9r+fm/uIN7Unjozd5xPHDt4Gu1Df7a+e2S9C/K1JHPiQePtNRcLl2cZj4oCnPrjBL+qSuT
	+c1725U20zJFkD1i/kupz1nnAJtfUnYOPsQhzgSO8KKEIX8b6EEKvTjG1lNZglsC4r6MEmNZKT3
	itEepI4p2VQ9/5defQseFEDFvuPPeWMTvN66klljreQg+RuNWZGbg5SIhRrN7sTuxNWsq1m1CbT
	H4nLh6wvvA3kVzfa186pU7q9AYMqLnBQfREwV+PbeGQvTV1PJ2ZoCWtvRnseT1fLFxczmcPNIRQ
	3FHs=
X-Google-Smtp-Source: AGHT+IFJGly+blzpD/C7mjwzVxH0NIWp3w9oJLoNQ1NEhhl+S5i5wl4mzsiArlB5jChHIduux7h2xg==
X-Received: by 2002:a05:6808:1206:b0:408:fbed:c3ab with SMTP id 5614622812f47-40d04b9aa50mr130033b6e.38.1751576874719;
        Thu, 03 Jul 2025 14:07:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:4f2b:5167:10f4:c985])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40d02a45af3sm78900b6e.14.2025.07.03.14.07.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 14:07:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Thu, 03 Jul 2025 16:07:44 -0500
Subject: [PATCH] iio: adc: ad_sigma_delta: change to buffer predisable
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250703-iio-adc-ad_sigma_delta-buffer-predisable-v1-1-f2ab85138f1f@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAB/xZmgC/x2NQQrCQAxFr1KyNpCZKlKvIlKmk0wN1FYmVQqld
 ze4eIvHg/93MKkqBrdmhypfNV1ml3BqID/TPAoqu0OkeKErtai6YOLs9KbjK/Us05pw+JQiFd9
 VWC0NkyAHKjl04UxdBJ/zVHT7X90fx/ED7K5KYHoAAAA=
X-Change-ID: 20250703-iio-adc-ad_sigma_delta-buffer-predisable-d10fc1914092
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1741; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=kqPXioKOoQz945FL/ykJkjIoFVXZSuZyL+bCmVjutc4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoZvEjEZHxabT02pj40v/6ZNFWUsqVg+fSmoMRj
 B+fIXSQ2c2JATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGbxIwAKCRDCzCAB/wGP
 wA+8B/9/Q8mZS5Tj0FbKJ1W2M/CxVZjR5wAoPdzdKscHRZzVxezqPM0c6E4JN26+fbYGS9yWeyv
 Ld7bi4feF+CP8QfPMGD5U5kq+BlKVmQE8JZqEuIi5xZW+Jh1HXxKun6mWDUOa9G2XP0DwrbDZIL
 yDSl1MEl6nQCHhdRQYA2gA1MZFVFVWMffH0aK7uJJ68x5Gmq4L7M+HdwzJ+qItFtYiq4xQI84ja
 gNFTtKmeeDcXFU/p/zOmD6guFcImqV2Rz9yv7cliCkGQI/iynovEYiRkSycywSjAveHac0Kqe4z
 Oag/geYS/vWDWtjZBeNBVX4Pgnf+J9oj2NDh2/OFSb3mmUfI
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Change the buffer disable callback from postdisable to predisable.
This balances the existing posteanble callback. Using postdisable
with posteanble can be problematic, for example, if update_scan_mode
fails, it would call postdisable without ever having called posteanble,
so the drivers using this would be in an unexpected state when
postdisable was called.

Fixes: af3008485ea0 ("iio:adc: Add common code for ADI Sigma Delta devices")
Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 4c5f8d29a559fea7226b84141bcb148fb801f62c..1a2ee7c7f65afc60677af9f3138e59f6476f74c7 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -520,7 +520,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 	return ret;
 }
 
-static int ad_sd_buffer_postdisable(struct iio_dev *indio_dev)
+static int ad_sd_buffer_predisable(struct iio_dev *indio_dev)
 {
 	struct ad_sigma_delta *sigma_delta = iio_device_get_drvdata(indio_dev);
 
@@ -644,7 +644,7 @@ static bool ad_sd_validate_scan_mask(struct iio_dev *indio_dev, const unsigned l
 
 static const struct iio_buffer_setup_ops ad_sd_buffer_setup_ops = {
 	.postenable = &ad_sd_buffer_postenable,
-	.postdisable = &ad_sd_buffer_postdisable,
+	.predisable = &ad_sd_buffer_predisable,
 	.validate_scan_mask = &ad_sd_validate_scan_mask,
 };
 

---
base-commit: 6742eff60460e77158d4f1b233f17e0345c9e66a
change-id: 20250703-iio-adc-ad_sigma_delta-buffer-predisable-d10fc1914092

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

