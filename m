Received: from mail-oi1-f182.google.com (mail-oi1-f182.google.com [209.85.167.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB0D42727E2
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 17:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751130717; cv=none; b=PNt1skxAS1LUwlpQY7PTSpUv2KnoV67KJjkrf0RHDat+CB1dCDvl/1tEVpgEyWah3gBz66tyOhED86FFh2+MVTZ+zo9gU0luHVmsRWmjqYt7yZHVcnDP4/y3Mt7/vBJGJr41SVZa1owUcWUvKKzvUoYlY8MYsSJAgSTJQWUV71c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751130717; c=relaxed/simple;
	bh=RSgd9cWz4dtUAf5vCU0RKP5cEl9WE3cTY6D65zfK1y4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=PJ0vU42xr+7OvtqrvbLXsTDmBYpjjwxh15wcU273TnS7wZmQbSUDeWluw8kBPcAQw3oNT1/mvNR63I5OMK/ozFJptjv/BrhcFVFwbs8EIczjiK9CS3BmRzUyr2GW/ubVZq+c+AkjYev0WjXcGkKBTmLJHN551NGDs3X6mctkGyY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=PbiLyWJt; arc=none smtp.client-ip=209.85.167.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="PbiLyWJt"
Received: by mail-oi1-f182.google.com with SMTP id 5614622812f47-40ab5bd9088so2113219b6e.0
        for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 10:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751130715; x=1751735515; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Z0zGVNJBIwr0zLZaR7nU9sUu1cb9pnBYtlj3JfPE0nk=;
        b=PbiLyWJtPMdcxY3DCtQpfK83rTs3TWMG01yitg1tsB1wFf4kQD/hsLmF1HnzyTtohm
         c4Y/E2LFtp2GA+AY6ib1fGsPNDxu3vVIndYC9AA3utFzAVpFkKfr/HMStodZoCzGe437
         c7XPIBpLg6s+dhS4XIxKWfxF8WZ4Ld9pewL9r59UG7QVxWi4m3SQD8+1MIH91/nqU+ao
         im/j+AFyzw2OT0n76j/ufdEdUCrEwu64/W9g1Aybs9CsqPpL5kLRcZBv8wGVAD2MXiDm
         djlrQIInRo7tY9gg3MHoXtTvkxltH/iBJBEuOBOPknWkiJsrK74CkeGJ8+D1NUhvioPa
         tJzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751130715; x=1751735515;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z0zGVNJBIwr0zLZaR7nU9sUu1cb9pnBYtlj3JfPE0nk=;
        b=VFjwhJhv0tX24PMWFO2tYAYw6zQVz/WZjoa16VE4zR0302UVf8U3cinT3vxdts7rBR
         sJZbyMHzlawe8sIgJngguJedMylnVTm19hZt53qLeF8iufRcl12RTkQq3G4ALusymwVk
         a7IGSYTKYLtA6Cw7CQ4fTlwYmckKU4n8197TQKIdlBYj+99j3DQNZVzYZY4Xljg3rrJx
         dgzUaxe7yp3zBuVNm/qS5ryEH+AgNg7/Y6Ps8W4/moNxEW2q6K2esp1TG04ItWkj0rld
         mgsgPWMx8J7PF6FOwXKJAkrxDMCenJ842Pz6r+NknYmrUcYlXEXYTmx59mJC+2s8dh7f
         8Ilg==
X-Forwarded-Encrypted: i=1; AJvYcCWGY29hvymoZVZMLA+yuVW9rzw4RJ9P1IQ9mf1WFcmKHRQIpPc7PoNQeSX4yZ4szP/kG8CsWZ6ux+Kb2zM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyl1E7Qi/dAilcxtjBfKtD+q1lgeuWKXqknr453v7ktWRm4Hcd
	Gn6harZam2QDATcXXee3BwMzrMnJl7dkNIJ2lVepx45LtgGapiijSVOY2ziZslUG9S4=
X-Gm-Gg: ASbGncvHj8TqzSnaXpzKTpxECa+ZmhdH9zzgS4vQHq1Rfb6A2zxddzf9Gheqml+1dtn
	VZGutXI+ED6bR26utrmKj2wgOpwnkFymNyVTpbd6Y6LQA/HmbyFPWBaMJ5MP9GM0S4XmTDZfkwb
	WdGchpydw7IWdwr9LQVEGS4bSx8Eetht3NvwZecyfbocbkktmceAY8NoTlHHTivYSZjztk3cOBH
	hTSMTt2kzMTZKisrCCabjx4iN55P9sZa5YjFLqVJ/GD7ONFQWUckdy9wNPOPU7r4hSjhp7vlTtg
	filkAve74elk6RbyMSDTDwM5iMQg9T14xTWOcUdH6vh1nqQMonhkAwHJ3qIoJ3DL3wa1
X-Google-Smtp-Source: AGHT+IHBSVuFxGp0Hj9QoUb9jbaNpST8RGEvAzqJhjb/ntts3jmK5CLJHnMv9T2xUZk649vl0tawcw==
X-Received: by 2002:a05:6808:2128:b0:40a:f3d0:cef7 with SMTP id 5614622812f47-40b33c47c21mr5147143b6e.7.1751130714748;
        Sat, 28 Jun 2025 10:11:54 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:3092:a48c:b0c6:cbf4])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b322ae4ffsm879599b6e.14.2025.06.28.10.11.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 10:11:54 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Sat, 28 Jun 2025 12:11:46 -0500
Subject: [PATCH] iio: dac: ad5770r: make ad5770r_rng_tbl const
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250628-iio-const-data-15-v1-1-b86ae055004c@baylibre.com>
X-B4-Tracking: v=1; b=H4sIAFEiYGgC/x3MQQqAIBBA0avErBtIwdKuEi1Mp5qNhkoE0t2Tl
 m/xf4VMiSnD3FVIdHPmGBpE34E7bTgI2TeDHKQaRqmROaKLIRf0tlgUCs1GVmslhZ4MtO5KtPP
 zP5f1fT+plR82YwAAAA==
X-Change-ID: 20250628-iio-const-data-15-9bea88521879
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=988; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=RSgd9cWz4dtUAf5vCU0RKP5cEl9WE3cTY6D65zfK1y4=;
 b=owEBbQGS/pANAwAKAcLMIAH/AY/AAcsmYgBoYCJTSVo/i+tsx+2E9aUNWAvRbRUUNroIKNFSW
 q7HCIeYNKGJATMEAAEKAB0WIQTsGNmeYg6D1pzYaJjCzCAB/wGPwAUCaGAiUwAKCRDCzCAB/wGP
 wNyzCACTIRX6I4QdLdlakUYNCTN1JJFMN3sFGX0ROaUY21qviwEsZL8N37e/lF2Ioc1J5C0W6cK
 kksJzr640I+2mG57YAeBt1UMyJjqUfyTh5Ua3Gl0GwhcUGutFaf/Q4AF6JbGPLbtHpI1EXEg/1Y
 Nhsia6Rb3Q+MUk9y9oksv1kJiFLr09Co6/2DrCgl0LDdOXrVpcutqsEUhNUK3GmKcH8oHmS6gEa
 TAy5EmuGcjUb+rF9BjtZZ4STiawdUm9RkJd4XzgY+Bz4HjfxMmXJx5qHlBM3W9vlNstCE9uCeMV
 2rmzT/TffBhXpiQzFnvZkMCLc1GeechMQsNRunT7DYgawhWk
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Add const qualifier to struct ad5770r_output_modes ad5770r_rng_tbl[].
This is read-only data so it can be made const.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/dac/ad5770r.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/dac/ad5770r.c b/drivers/iio/dac/ad5770r.c
index 6eb4027a44fba20a9a789428f3ed278054c65497..cd47cb1c685c4d3ef117bfc59e0e2e45b11e7b7c 100644
--- a/drivers/iio/dac/ad5770r.c
+++ b/drivers/iio/dac/ad5770r.c
@@ -155,7 +155,7 @@ struct ad5770r_output_modes {
 	int max;
 };
 
-static struct ad5770r_output_modes ad5770r_rng_tbl[] = {
+static const struct ad5770r_output_modes ad5770r_rng_tbl[] = {
 	{ 0, AD5770R_CH0_0_300, 0, 300 },
 	{ 0, AD5770R_CH0_NEG_60_0, -60, 0 },
 	{ 0, AD5770R_CH0_NEG_60_300, -60, 300 },

---
base-commit: 14071b9cf2d751ff9bc8b5e43fa94fbf08aceea1
change-id: 20250628-iio-const-data-15-9bea88521879

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

