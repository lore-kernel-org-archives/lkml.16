Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A91F3215F7D
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 21:05:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746565526; cv=none; b=ED3W/+o/4s6IHWMGprxjPCUKC722TKDrAtnVTUixBzq11e3JT9wFI1OfFgaDAjB/zGr8apu7qMaYofk6oqLUw8r/hZoviwFLWgXCzUunsPElYF94x+nMrL9lspc5y6tZCgyVBqxxiFEruhOySCsvcIugm4j4/cX8wQZc6Cp9eDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746565526; c=relaxed/simple;
	bh=8DecWNX9a+g7ci97Vv7IU6U85+eTrGoiJDNqhMLAwD0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=o7MFSGPqTM8p+hUQWILz/SO2bZdN9S6YhvyPAgwuQY+BKQfCc9hQLhpwASYgAb4yd3HnccKDfGtVYAXdzhYm0kjCf0RpeAHPZND6j+e6NqGuQtts6aNyVg5OOIunK04HBLTUith8Gvl1f++gszJc2tI6aWxHNISfjO30VqxSduA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BOysUuBm; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BOysUuBm"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so52424085e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 14:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1746565523; x=1747170323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=BOysUuBmSoAEMOyH+RVIb0Pvh11HJ3xEGkP88oGtGf5uAixPvY86fTJwZ9xn6RC04t
         cWlTLWozS0d5l7ykVZQfjblN/GRR4NDqktJ1Bks3V9oM6AT0cvJ7iAr0pH/P131LOY/c
         4YCy530NQPyL/W0qEBMoOannqil6mfPbLbex7W2cKcrp6svIHQaPKM/6RBTKkOPI7n+O
         70CB/DIlM8pVPAqy93tsXfslt9EXAhOMBCmGHBtsvtylybpPOGK/Nh8qPuemBiBiBlFr
         PQiy7I6Vnk4dZlAbin7tY875sGnKLjkyv2VDXidxbJgMcYABkrFhLEnHmEKFw+LG+eNl
         ybbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746565523; x=1747170323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQIoahuutc2qqjFxwM4CJBJC7cg2fQ/5cUj9Q0XSXuA=;
        b=wK63aPe3Osrr8ztDpsknjwaG1UmXAMQwNQbq84pT7kFi21M5/iUmD7MNlhhg/pLdUR
         +VjcFSQWfWfE4+k0aT1MmMlcC4S+CAXpJ96ftY1R15JGkiIx+ehYu0KxjFTALjxw32Tb
         2zqjU991pDjUBwE0lFPFJrHpkTJTRPshDjDEfcQ80nQ+snmLXns36SfXijoG5MrhTQku
         Cytdl8Uce5thnYNquqfKFm9p+Bb+zvJbnXTUV/crp3GvLSNHGXRcIqfG/u3YJWcmbZgD
         jS0M1Yx8gKzat8Ycu5vfPMvZyCHU2cDTZx1JA/B8w1//nIU6CYfcI4AazD7Sg/FsyQ7r
         2INQ==
X-Forwarded-Encrypted: i=1; AJvYcCVR8O4nTNEC18CH0CK/NIl44dqZcxlKcEcqSsDANQ4PH2UV6N8p/JF3UCIJBVcyHnd8tmEtzOf1KrBHZn0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7qgBHbxk3KoqJuxkusfd6z99Ev7tE3ABotBFjHBRFJ0wSXrbk
	yDMM6XgO5zLyopPD0utcwAb5wGnTbzHW8HZReswa7nQXfTeFbdjqSar0K82I/88=
X-Gm-Gg: ASbGncsVVl+2oOo6134dHvDxK5hKgihgIiS5sjC20qCMVIx85c+UUEpBoirLPVMgWRO
	rnNixYdnL0B7Gx2Sc1qhGodp6PpsnCAk6vFIpTlOLWP5dFI4qVpn4eOyHyScFahB1Xd15IJd/uy
	BZBrfrGP/fMdmKt9KcroUnMdBDtanU5r50bLjgtwRFRn2zHLGr7pkiKQvgsCtGRK/KYxwgwxsj+
	DrDx1N83PaOyjqlSMcNM9+E5/C9IknOm10it+Yt/JfqSeKF7oHqOVZMikdLkV3i3ZoitLdECFBX
	lWAlod+Fgx3kRG/xdv3TNA+DbaHKRn+g+j1H8SsRZKK4/N1D3pPOHBDfB5/4yXGdCG29zrQd6u+
	fyGfrMZddMvmLoEHOs238zZg=
X-Google-Smtp-Source: AGHT+IE0lNn0nT2i13dUfcqq/tEEHU4n3DZAgcrz6Oy4DZvTBDhpwmaW+VV7h81wiw+2Az3EYbCpFg==
X-Received: by 2002:a05:600c:37c6:b0:43d:1b74:e89a with SMTP id 5b1f17b1804b1-441d44c3933mr3684925e9.9.1746565523006;
        Tue, 06 May 2025 14:05:23 -0700 (PDT)
Received: from [192.168.0.2] (host-87-8-31-78.retail.telecomitalia.it. [87.8.31.78])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-441d4351abdsm6794475e9.23.2025.05.06.14.05.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 May 2025 14:05:22 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 06 May 2025 23:03:48 +0200
Subject: [PATCH v3 2/5] iio: core: add ADC delay calibration definition
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250506-wip-bl-ad7606-calibration-v3-2-6eb7b6e72307@baylibre.com>
References: <20250506-wip-bl-ad7606-calibration-v3-0-6eb7b6e72307@baylibre.com>
In-Reply-To: <20250506-wip-bl-ad7606-calibration-v3-0-6eb7b6e72307@baylibre.com>
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
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiQqnQ3KT7w9NWpH9PZpfu5Yz+6RB9VY8lekhEqm5rIV
 2dnkfqso5SFQYyLQVZMkaUuMcIk9HaolPICxtkwc1iZQIYwcHEKwEQ4rjP8032+bJ5MgIzJlhtz
 Zp1nV65mXhgq9kPi2YrPPWfvpPHaFDP8leabnfws1/gip23dg6dTBSVm11Uts/PXP+EiukNj08I
 YZgA=
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

