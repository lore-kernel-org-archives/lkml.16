Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48D9128C2A9
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:29:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747920596; cv=none; b=iIN1Yvqp7e5u5BeeaBFXrYZPL4nN0EhAALPMaoZFIF6dzkUSZc3Mq7h0EjibD0+v3ug1ERPcyOrvQx8d3Z296aTYG5oPp5Efow0l7ZJ5QtUEtrGFBJS01qgYxXTo7XYqO5FpHmdMPbSgZeUm+pCvWXKQf5B4AUFFmUMMr13YDUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747920596; c=relaxed/simple;
	bh=8DecWNX9a+g7ci97Vv7IU6U85+eTrGoiJDNqhMLAwD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpbjNOxjfafQZpq0LzE1gxkVyzReNFdVAYbAN5KjRG4jEQYeRuJlooQOGX1MQSGxcr74lf2Gs+dPLVNmFaOFqwHmybFMuw9YRpsrtPLaMXSr5g8e7WqkVFoyv479+H9b6cVPvmhbrOEDPOC06yWHx3o2+no+44yc3sAHLCCf3Xs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=pDisP2xz; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="pDisP2xz"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so61574515e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 06:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747920591; x=1748525391; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=pDisP2xz+HijpEunsNT1wisqfHA9xTVmAWD3ip5nUzc63Etm86tAK/EbwCBIinhPTe
         Ywj2qAIAUrxr1xhImiQdCqT6gNYSWvYyEtCwTNCK97tkPYkcdVw/cdotbgxxOMQqCJdB
         //FkyPyzTzOfgjz8b9KFmyFx+8a0Awg9hewL7E3cxLt82L6GAy5xwB1ig2iOFsK6nnnS
         KJgGm6ZAQ3FX+8q5hFMXK2tYV9pmAthIRUiHuZchCCJIm6+dNqz9S9Jt/Qdq88+QtVIa
         OxZdyyB3MFRQ78TGsIYWpwgVF7RTlXyZLmcEO+pV8WwEJfQL+XtEjDY9qp6e1xq8LfDv
         tpWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747920591; x=1748525391;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=l7bDMCAau0c90p2MsXuIqJ1D/79gc+Y8BLjO6gh2DnVFHOE6KhVM6I/1wJHuQPmglv
         gb7gur++fdXAkZOE6Lfd5z6cYtrZtjm4cgrVvCsPHeNxVgEJhlkDK31HGpoO4YqZzWcA
         R8IqkRoK5s88Rv82wzr4X729s4xbNI0/igpa2XIFYn61WlEpSuYC0XB5FL6dF4F5egt9
         nv3Kp56+iuhSKZJLwRN7euwoAQcd6KGjb9vrEjFlHrd7Dk3Tj4nBt+DfCoyKc0/l7h7Z
         qTLomZrAVtRQy3+tJsW7A9HrauyBd8n1H3ZdA1IA5Mm2St8fgxogr3d4ifMY8uK+NsTu
         vY1A==
X-Forwarded-Encrypted: i=1; AJvYcCVDoMBXzPo9NfrS8BSMGn/2LDcr2dmEA1YW2oTWv0AKBf8xur1/5p1GAhR4TsGhtk1yvLtub/91wN/SSFg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxJC23d3HUXt723qg9Uja4luoxXtOAwMvZsVU8OC9uLjZP5lmkM
	Tw5z1COLuMgE7AeExDYx7JIIW/Ld8+AiRouNRa2kcAu/4lxk9REIYRU6ozzr0iKgHak=
X-Gm-Gg: ASbGncvWwpFFvHGXesR58K2EXUkwirLEjFCRtDlP8EPwFUYVPRvybZWnuspizlAetO3
	cM3aNiu0vaoS3qmX/X32XQ2FSqd5Cj2U4NF90xXj32Z3NAf66knBGzVHy+gABgK8zEayIo2JC9J
	JUgNyI4g9/033cJ7C79w3rfY4VnJUPv3hMDesL+X+Vrf3va482q6iuIALuYKFA/gxCh7xH1LZcn
	iuFSwCXjtlD7cM0WInedTBrrJ1ZdKi0JcN63nYwLOOxpUrTKtNPwnEptywnkafOkWRlToCwtLes
	/GnB4guY7DzW0RRCw1Ul06PPDNOKdrq7+h4ootMQfRW6jegH2gMo01F1RlmHxgjmi8nsIGLmmcb
	pWTbmzFNbiJgCuDMJpCmZxGBVC5TmJ9c=
X-Google-Smtp-Source: AGHT+IHue17ZX9mw4ey3hwkVeMQ6JQCquCW3Ynl5s+S7l/UxkzY5Bqoj4I32hyU+LDWChls+robRsA==
X-Received: by 2002:a05:600c:5295:b0:43c:f3e1:a729 with SMTP id 5b1f17b1804b1-442f8514e9emr270779675e9.12.1747920591505;
        Thu, 22 May 2025 06:29:51 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f1ef0b20sm109837585e9.14.2025.05.22.06.29.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 06:29:50 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Thu, 22 May 2025 15:27:03 +0200
Subject: [PATCH v6 2/6] iio: core: add ADC delay calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-wip-bl-ad7606-calibration-v6-2-487b90433da0@baylibre.com>
References: <20250522-wip-bl-ad7606-calibration-v6-0-487b90433da0@baylibre.com>
In-Reply-To: <20250522-wip-bl-ad7606-calibration-v6-0-487b90433da0@baylibre.com>
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1303;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=4Hb5fAw6wk9UOyjGvMGWLBgqM5yKlaYwdF7azoNoMts=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsjQV/NLN312tkCt7MRNx1XzP6tp3D0T16i1jZNjoWlp9
 6tVG2aydpSyMIhxMciKKbLUJUaYhN4OlVJewDgbZg4rE8gQBi5OAZjIfR5GhsnLHlX6eC3U3i/6
 ZEr2Hl1Oh64MH/On61Zsz1vcz3C0ez7D/9QMS9/mApnn7WJ7M5UafHeUSt5ezc0XUXt7gojfVKk
 7XAA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

ADCs as ad7606 implement a phase calibration as a delay.
Add such definition, needed for ad7606.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/industrialio-core.c | 1 +
 include/linux/iio/types.h       | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/iio/industrialio-core.c b/drivers/iio/industrialio-core.c
index 178e99b111debc59a247fcc3a6037e429db3bebf..f13c3aa470d774bfe655d6a9fb00c263789db637 100644
--- a/drivers/iio/industrialio-core.c
+++ b/drivers/iio/industrialio-core.c
@@ -188,6 +188,7 @@ static const char * const iio_chan_info_postfix[] = {
 	[IIO_CHAN_INFO_CALIBAMBIENT] = "calibambient",
 	[IIO_CHAN_INFO_ZEROPOINT] = "zeropoint",
 	[IIO_CHAN_INFO_TROUGH] = "trough_raw",
+	[IIO_CHAN_INFO_CONVDELAY] = "convdelay",
 };
 /**
  * iio_device_id() - query the unique ID for the device
diff --git a/include/linux/iio/types.h b/include/linux/iio/types.h
index d89982c98368cf72c0fc30fa66ab001e48af4e8b..ad2761efcc8315e1f9907d2a7159447fb463333e 100644
--- a/include/linux/iio/types.h
+++ b/include/linux/iio/types.h
@@ -69,6 +69,7 @@ enum iio_chan_info_enum {
 	IIO_CHAN_INFO_CALIBAMBIENT,
 	IIO_CHAN_INFO_ZEROPOINT,
 	IIO_CHAN_INFO_TROUGH,
+	IIO_CHAN_INFO_CONVDELAY,
 };
 
 #endif /* _IIO_TYPES_H_ */

-- 
2.49.0

