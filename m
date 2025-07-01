Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com [209.85.167.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC57269CE5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 21:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751405974; cv=none; b=SQf/ewQ/PgT+51ubJLLYgCMeVbcE3Z9tieXkkT7SCrT0MJo9THmcOYFcGAGaa87nrkqNV//ywdMmAX138gsFGWLjyeAVB9OADwUiXZCW8qSUiVU10lJgP1D5k14e+wCWE5BM4T0GF2S0yMxcKDx2rx+0wXjgBPq52nFaYRyRsvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751405974; c=relaxed/simple;
	bh=0yYId7CmKo/+nPN29+4m0T9CC1yhegBE9FCPgm6tkyc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SjMczvW00dWZBcNxKYCbn1fKZA2Kmtr54NNpUT/KCHONMI7YaxbKuZz/aSwggAXevs6w3dByo2iX48jEfnEVZNqW9fe/LZAjmkr92XaXND9cnQPg5CFamXKaPxO8A+AMzUfHTFCP99fweKLZ1Zy95+Ir0E7nWt0/oDhmGoDCzM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=bmIESoKj; arc=none smtp.client-ip=209.85.167.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="bmIESoKj"
Received: by mail-oi1-f180.google.com with SMTP id 5614622812f47-407a3913049so3280143b6e.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 14:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1751405971; x=1752010771; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xaL2xzco1uO7UeMG0BpmNABPZ9hJVHgxxIybCcO0RO8=;
        b=bmIESoKjaM6+/GQDPWsc5plFMhIZu6XHFqo12Xivuelc1PWg9nj0RHqRN/VVB8LFEm
         Hcm4AAs4FZGF5vdks0t0p0w8/6pJBlEWXxYwVkHh5vpdh0CqdabITs+8fSj2bu8/vUKs
         8VI8h18bLlQUXnKoJyrS4cawRM6LHsvWX8sBixB4QcGLLS5kkOl5BrmnidLoGrtW/0Dv
         AhG+tax3II0nXEcAN19uz5ETvOoVjFE+bhGE/GKOPbe8SnhHBL5AMxqcduhgP/1DLxSc
         KhAQK2DU1dlGIfmlLNK4jB0+MAm1zgr9otpc7hR6nCZujNUS2xPVWN6f+jljGqPBq02R
         3CDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751405971; x=1752010771;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xaL2xzco1uO7UeMG0BpmNABPZ9hJVHgxxIybCcO0RO8=;
        b=w7dMlc6ScXUkag7arggkSoPLiVcmTRVN0UxKsy5oc2LW1rq/TRbaupTOuUKEtDcAQZ
         RTTrKcApsrGhEyzD+FQTXMaspxzPeKkG5mCLopxHwXJQEOFUpl6nn7/GwosZ0n3kzmyf
         Es3eMy4k+eDN5vRVQcsRJ409OkGo1Vbt/NS1NeW2tkCrYSUVEoy29nRrA6xGOr7AfTgA
         8SVTquu+TVG/ANBB8ryQ+wrS9JEh2AT7hRrha9FLe8vajnfr8QOjhgKw1qyNZrBbnxNu
         d+OLYNyodCrwvc2eH77F/UW25TTLm0WQMUFzJ+iHw9tbkxJDAqoZhQpGdB/dKw70eUpT
         U8Bg==
X-Forwarded-Encrypted: i=1; AJvYcCX+JgTCoOSFui782YHhB+eGEnf/Jkn6d2fbULPGxo4EGLZrz1SBUdSvily8SFzhyOTij8m80XXw2LcSweE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjIx2qpxNI+bnycY2P60cwmb/Fgja0UhfPvok6mpQXbaN/CLGE
	PV3Fp6Bc3Ca3S8hZDwAA6LKU5dkFf0FFsMrtBzzv2ESpQ7Xz0/Zojqx2trJYHh+l1ko=
X-Gm-Gg: ASbGnctG4+dRnnkcaDk15wFFeYKv/AcVhB98R82DQT2tNgGd27//QGxZYiHul1sGLC8
	uKVstRZKJZIJIXhdlPfo7CvKSfBunZ+5/PMv5dIqOTkTPH79hKgM4HlJSGS+O9PSgg+wjNy+Nd4
	5ntisHXMVHxrwSRqKV45FjDSDFTZ9PuEcoDeF12ImxhYpOvV/438mhr7iHsZlzayatudhmFqlFx
	hLx0fD5kq8V93p63fhwlUY4hgnZu83rexxkWx91Pq1Ol1ZFkN71ZAf/O8HWEhkiR9Lzg8tCz/Hn
	oijfh/AL1PNxNQc6Bb5drt+478W1m0QrPAZR9CJvecHEjlKkKdpY02pG6Q74cNGovlBZ
X-Google-Smtp-Source: AGHT+IH7i8yqxhjyYN/KbQhInEcAJaa6cWJ3EyftErBCubqr/OVp0eFazoz27vBEtzCjxnUCgjYlbA==
X-Received: by 2002:a05:6808:1307:b0:40a:ab2f:61a with SMTP id 5614622812f47-40b887d9c24mr273589b6e.23.1751405971489;
        Tue, 01 Jul 2025 14:39:31 -0700 (PDT)
Received: from [127.0.1.1] ([2600:8803:e7e4:1d00:70a7:ca49:a250:f1d5])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-40b3243deeesm2288335b6e.48.2025.07.01.14.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 14:39:31 -0700 (PDT)
From: David Lechner <dlechner@baylibre.com>
Date: Tue, 01 Jul 2025 16:37:49 -0500
Subject: [PATCH v3 01/12] iio: adc: ad_sigma_delta: don't overallocate scan
 buffer
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-1-42abb83e3dac@baylibre.com>
References: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
In-Reply-To: <20250701-iio-adc-ad7173-add-spi-offload-support-v3-0-42abb83e3dac@baylibre.com>
To: Michael Hennerich <Michael.Hennerich@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Mark Brown <broonie@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-spi@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1022; i=dlechner@baylibre.com;
 h=from:subject:message-id; bh=0yYId7CmKo/+nPN29+4m0T9CC1yhegBE9FCPgm6tkyc=;
 b=kA0DAAoBwswgAf8Bj8AByyZiAGhkVTuiqNL7i1o/SZKUCWwt3GuZlstGKg6M20S11KcCEKhVQ
 4kBMwQAAQoAHRYhBOwY2Z5iDoPWnNhomMLMIAH/AY/ABQJoZFU7AAoJEMLMIAH/AY/AhA0H/3CO
 fopSOjlWHCAtDnc4dQtzMVK1WnXmMthC/eXuPJrwo6ws3pD8i32duohWnCcFRPHLkKDCToZ2989
 K64ia8HI+IRjzR6GADENFKWAO3pbtYxf9ENV6jOtVbJP9U4IW1V3urzaF98v7CMOvI66jT+RbnD
 inubvVxHzwAPS33hJqmptqXma5p3vRLOPfWptbYSuCSedkUq5HocXai8PQUK8JBq3Aygh9sLqSA
 Tf9lyJ6UGQzkZrEQjrAHEEMVmGZ4H1/gKX+XWLs/ZqLDnV79Be2OYnkwWxCBz7DAbfsT76g/7Oq
 cy94BHcTuQOxWHHy5Dl9mmtTxuYN+f2QCI0gFoU=
X-Developer-Key: i=dlechner@baylibre.com; a=openpgp;
 fpr=8A73D82A6A1F509907F373881F8AF88C82F77C03

Fix overallocating the size of the scan buffer by converting bits to
bytes. The size is meant to be in bytes, so scanbits needs to be
divided by 8.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
 drivers/iio/adc/ad_sigma_delta.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/iio/adc/ad_sigma_delta.c b/drivers/iio/adc/ad_sigma_delta.c
index 4c5f8d29a559fea7226b84141bcb148fb801f62c..6b3ef7ef403e00804abeb81025ed293b188e492b 100644
--- a/drivers/iio/adc/ad_sigma_delta.c
+++ b/drivers/iio/adc/ad_sigma_delta.c
@@ -489,7 +489,7 @@ static int ad_sd_buffer_postenable(struct iio_dev *indio_dev)
 			return ret;
 	}
 
-	samples_buf_size = ALIGN(slot * indio_dev->channels[0].scan_type.storagebits, 8);
+	samples_buf_size = ALIGN(slot * indio_dev->channels[0].scan_type.storagebits / 8, 8);
 	samples_buf_size += sizeof(int64_t);
 	samples_buf = devm_krealloc(&sigma_delta->spi->dev, sigma_delta->samples_buf,
 				    samples_buf_size, GFP_KERNEL);

-- 
2.43.0

