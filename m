Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E67F21F4C94
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:04:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253887; cv=none; b=nKVSHBbybf23RBrcy5hlqZYtikR9Nw3g41xNkX51ddHAmokjd4na/C0L5RtUn24fE+E0O+SH6YdNPD2eWO6EgX2t18QH2bG+UEAy++rePbePERuh5cm5dl+58FBrAgBFfhw8q0YOOqaCWVXulZcN5gTuhk59XLTWyDThvTnvu6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253887; c=relaxed/simple;
	bh=8DecWNX9a+g7ci97Vv7IU6U85+eTrGoiJDNqhMLAwD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=kqnEQ7CYRfwKU2EAqXyAXIAUQrq72tyEX5iA3pPU7R3a1MjLYie3L3ixL6p/j2BpG/0VAZ9KpMnHY1urbk06S+8QcQ3OkWbii30NfrTp3YGXRu9i6JRlFq367PshYAR/zWZAjI7G/9v4Zvb8g6VborQ7th0SuKGBFI3XNhVDk7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=poVyDTgq; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="poVyDTgq"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfe574976so15362095e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:04:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748253884; x=1748858684; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=poVyDTgqw+zz+w5FMFviTkNxA7NFu8dORMQmv+3wvDYXcAIckkKIVBaufODYroq4Uh
         4GhEgbrNqeOB/iybIa/CxCm5fLcLxxbybU3v5WlQNGRWIuSMiVP65eZfiUSO3bV23jCc
         8SDuQd9YT0TxxjJzrIIQEcrC5OuEmD9aFgI1/hjuC+wr3gJoV1MkfpCIeEBrWSMUTWvK
         soJGnCJ97+OAaLGkx1btu7TrcIi7KASz5h8wZil9l7t6tZWBz1P37lRxMSWZtMrJozJd
         0sZQyyoiESlQy0tfbHX86YWH8i+DNBqz3ROtCqcfkMVq/mxWBgM9cnBR7mXi799AS4aU
         BnOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253884; x=1748858684;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=k5NQJ2V/wowbg+6d499VGXVmPXk7RMY3NnoYgfJen6KyIn/qIVTMjNrU3WB+BbtrBa
         nyB6r/82+U3b488EhQ/CU36PCSR/m3oHHtfvIULmQt4CKgdbH69uS385UcSqnWwSyNNH
         CQWhlcOfU/Y76e4T8QnBFKmCVQhrw0MfXHnuGeAa6KxUY+lZyeOnY8q1QjGV/2BJdEGO
         /f0ESXge192GhEoOJcDjfTiACX8AJSNJ1YflT/MQVPRkxNypsWFelAaAgYBrlp5YVlJM
         inw7WE/IaJVh6wdh5Fy626NtUXakvUx7nwXifuWfpb+pjjJh97pS/IukE1MlzMDDYl2n
         tC9A==
X-Forwarded-Encrypted: i=1; AJvYcCWEuZrQsO8BMk6AHz5t4K4mF2/qFCkS+QWNHGQgT6Okw2gaWFg6JmLZfuJF0TxICgUFF/6w9cIk4MxmIkI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYHeDezB5mIG/irBbULplhko7AJwcCUfoOo/4QbV1oTB6cfh/u
	m2accU9NDRB2vPyJ9PqXxK/nhSqSkPdu8FG3pfucf4s+BBTDLh56dMMoVs7J0Bf9zXM=
X-Gm-Gg: ASbGnctTOmBfPNXZYI7Mi2HgFn2h5tPxOFm03VXi4GqJgJE0DENhA5kjQUu/qJ18dkp
	TvkWx+HiL1Uw02o5tAWZ6FP+WdchflC5IbU/TCW4dLS999ntKe41+ZysrRBgffO80vcoufuBkv2
	+faiw3v3Bbbc7rqofIK21bk06mn4O/JRQpUfCwZ/qWL6bCLf8VyUrlPoPdij5BfYuT9P5odhgeU
	91CbSGYcSAdgSa2CqEveoTwtK5h+7scGETi67I4pJT6GITQ0eFqE1Rx+oi9w6Bx4bBsk3TaLILO
	nS91GoE/NxVEV/i5qu5moPfjoNbKBevTc4jdIbLXTmIkYt3BLjH01RWvB8MZtGNmJB5FCA0CXzW
	dyKHG1e/3OL9DzlwsRtYqRN+sxTWrVvk=
X-Google-Smtp-Source: AGHT+IHYhcuJ5tJUzW+X1N6tLbm3m4NFLOMHI70/u9217nBb1JvAuUOsKFYkUSxnI3msJC2yE8u0Pg==
X-Received: by 2002:a05:6000:4211:b0:3a3:7bad:29cb with SMTP id ffacd0b85a97d-3a4cb499ce9mr7666683f8f.52.1748253884092;
        Mon, 26 May 2025 03:04:44 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888fcsm36141834f8f.78.2025.05.26.03.04.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:04:43 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Mon, 26 May 2025 12:03:17 +0200
Subject: [PATCH v7 2/6] iio: core: add ADC delay calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-wip-bl-ad7606-calibration-v7-2-b487022ce199@baylibre.com>
References: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
In-Reply-To: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
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
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwsck+Y36919jPLE56vYtxsKVOoPxZ0YUJmbsMZYT27
 D98c8L7jlIWBjEuBlkxRZa6xAiT0NuhUsoLGGfDzGFlAhnCwMUpABMRrGb4xXR166u8b6/zXyc2
 z2cQsgqZmpa/YfefM//nze98mTpj6wuGfwqn6tht+/hjAn4zSbQkH0tan7q5dZVvgY79w6Itgsv
 9OQE=
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

