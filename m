Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C7A231848
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 14:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748615376; cv=none; b=STG5LQdTIavd1ogvTcAec9w0lQps2ja5cxQWVeRXSoBxNoaNyQYlyEsHf1fJtCcC4JaqOSw9JJVEKUGmNobl4orrXMTdFv58Imj/GLs8TdJBXUMZbJP6pDuYtyT0KpvFeEvSn6K4jP9/fGSeWpvFXiWqkFCKBOVE0ln55eXbEPI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748615376; c=relaxed/simple;
	bh=EuVopUch3RvcMm8wwL4YgvpMZfFl3NzeePoEsn6JRZg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fkPKrpREtypgPKMUDboZoDx35qZvaR+q07vmAbM5gDOKfBFJ4X1Bep7JrxAnxtY4FxcpGr3GKtRj3DwPhm0KxmXbP9BknHUmVXJwMXZhm90uLNfHVQ0s6MjqjLL21WU2vdGHt7bkHmFV3yjeNo4i5m9wXkgeMcoo3rDeMVdDgdE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=aU7zOldD; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="aU7zOldD"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-442e9c00bf4so13484345e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 07:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748615373; x=1749220173; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lmgqoKB1/8SUojJrwigc9jIEEcoeGxp7/cQDPaSjq8M=;
        b=aU7zOldD9ZxXSlViNY7vsDy7CzfmZxKhgqXfAzwNq22kK+UkjjTY2CEXGUshqUIg+H
         FD82YXoqFDb02wcGZ5jSXo0ENnlXDYCg9B2LYdZDHWgoVgEpITQTK1AguwZxMK+Kw0Pc
         gDfQ7GQCmlRAuRZeK+51HRFtkYYEGhbKJ5DiakQWbsmvL1xzvYaxA8WGTlnzRXPXBLah
         Y80aPpgDn0ClPxrfQKh+ygtCOELs6+9+gA+Odlgf7xuNzlTW7aCm1wHZBkEhcqKUkZVp
         ooqSNNjJbQBoNNXW/IKKOvlzzD7ImaQrWqZ1T0t0n5y2w6Q4RUZbiZJwSWo1n1QnHaJu
         hRAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748615373; x=1749220173;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lmgqoKB1/8SUojJrwigc9jIEEcoeGxp7/cQDPaSjq8M=;
        b=lyxyCsnUtG94QDmEGvHtIJwF8kqaolADq20qI/ZA+OJod1T/31slfTZEoZT84/jgp5
         I3WMKNagBktaySVggQGMyft4CWOF+4JbiHKeOxXFSHC+ZodAnRutxMU0wqqu/BMsV3qf
         +ogqFbmPZk2XwHdduYLPf+dgQPGq7AREe4ujfguae1pWSgpjBFg+NW55aFCm2ZDBurxj
         VZfZJa8gFsD8dAElbQ735Zw7gW7nL7U8FSVZ+npk1cuKm5+IvkPAlZgV4qhKzSMPh2c0
         BNxIPBS4CERrCGQumiWPBdNojS5Vxni/UktuidJhpEW41/W39UfrkeHpFTA6NVI309RK
         U8lQ==
X-Forwarded-Encrypted: i=1; AJvYcCWmtrOInjzqZ5zoop//eYJg5Rq7TD9NOe74JKA+0hf3FT7E1zX8sEL4rRJYdWKnQxDrCnR++5sLr7Lm0Cs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHftYtgDttyDMcvMiR55Pte1/z1gtbJeic6LyY50YnC8Z5Xp+S
	9NE6EeeN5826RDZdcaYhlA0836bpanrPR/j5nutIZagmlvf6YzWsHoyYT8MW6JgP3lQ=
X-Gm-Gg: ASbGncvkc2GDSzYZO0Dk18pOw2TVmX22xgG7uzq8EqInPQZZS5g0uWZ30unQtk4cgQE
	yocdVcgv2U+e7RaBcrMNpEtgXysWqjcF26VeCc9uw2ivWPBDFNZDhhO848S4z5OZP4ORM92ef5N
	OFMMr8ihIidZwphKmtwA4kMss0LVp/WRwbUQBNgU/LiBDmtHLl+gkb/QK+mg1Dbotq1nc3E8T26
	+vVwtEQhnyvjsLtD8m2VXicqSBdoqY1Yhag7IShXdL6s72+5pAUgN5/LjHyoCoXk401+7NY0Re/
	//S36OlX9SWVMN0dz6yrXn8bwrBXtgqCg7VmRiKVsJ1gpEEpILPWh+1GwEf6qcYkOwTFV5Pj85L
	+9JD95PkVRygFSK860ptQdlATWDdHe3pFJLgVb6+p8A==
X-Google-Smtp-Source: AGHT+IF82ytKbgIHFm5Bt+8HmPnB/Ki48PsCv2MzqdtONrfDtpN+r1/QBbMV71yK7tUzIx2WC/FR2g==
X-Received: by 2002:a05:600c:4f50:b0:450:d4a6:799e with SMTP id 5b1f17b1804b1-450d886f6b1mr21172615e9.20.1748615372671;
        Fri, 30 May 2025 07:29:32 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00a0421sm4979870f8f.97.2025.05.30.07.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 07:29:32 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Fri, 30 May 2025 16:27:56 +0200
Subject: [PATCH v2 1/2] iio: adc: ad7606: enable Vdrive power supply
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-wip-bl-ad7606-reference-voltages-v2-1-d5e1ad7e6f14@baylibre.com>
References: <20250530-wip-bl-ad7606-reference-voltages-v2-0-d5e1ad7e6f14@baylibre.com>
In-Reply-To: <20250530-wip-bl-ad7606-reference-voltages-v2-0-d5e1ad7e6f14@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=907;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=WbJxk5bQxvmJFaViamimQiGxr43ZTZXKFb47GKJ4NwQ=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiwPFDQqLeY+/o1OWv2E1+T377JtNht5PvgtMWevNXF+
 sxb1Hu4OkpZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExE1ozhnyL/Cx3Pwn1R8tvq
 Az5LzDvM+zeoTKE34vT8Y+cSXuieeMDwm4XvUtixux0Pl8zds11iq//BdQ/4S2V9pIv9GHvdQlT
 b2AE=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Enable Vdrive power supply. The "vdrive-supply" property is mandatory,
already declared in fdt dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 185243dee86ed2e9ebc43b578003d0c010e97a9f..3bbe9c05b5edbc11e8016c995c6ab64104836e7b 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -1330,6 +1330,11 @@ int ad7606_probe(struct device *dev, int irq, void __iomem *base_address,
 		return dev_err_probe(dev, ret,
 				     "Failed to enable specified AVcc supply\n");
 
+	ret = devm_regulator_get_enable(dev, "vdrive");
+	if (ret)
+		return dev_err_probe(dev, ret,
+				     "Failed to enable Vdrive supply\n");
+
 	st->chip_info = chip_info;
 
 	if (st->chip_info->oversampling_num) {

-- 
2.49.0

