Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9609923C512
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:38:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961483; cv=none; b=D/jAwgXGOc41aDhsdbe1yxJc7+iUL9qtE7PvsPlR4NKBGIdxVZcGSQ6u8iE0jukVuwBM7+S/RLryv9UqEuIA12XT3ccQ3Uh6VwzfrXJPVnDmMsK9UyqPUEAznzFzDGAAX0bqkT4rnxLvDALSNWXLUagI4epM/tnFOCL4xPEYwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961483; c=relaxed/simple;
	bh=G/PHL2H0hCT1vJawFGnuZDviCmco7m1K7dYprLhxJYc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PUNJnKnNWJPCczofKcfQRdS9o5BC09f+u0RI2awf3pWTjjmVm/JWurhGqrWAmcJ7weCdq2KCwn3dJ7x+VdAQoIlBEpQbpaBE3r6jOn5u1NiHgPljTUiNAn7abps/pU52u4wq8w4Hb6riWl/je3a00sOpgFDJ8xiVn9xLJQ/7sbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=BSAwEPtf; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="BSAwEPtf"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-3a50956e5d3so1928367f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:38:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748961480; x=1749566280; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=L1cI5SBD7MAWLfTRQEXjlnF27Z0y/aSH849T67R+rYk=;
        b=BSAwEPtfAtU3wBxN+PELjdy9Wk34d6LdA3wAA6ncD1eVWvdpoh9kN0R2fKjcAFZdg5
         LGEjZG5jcz7mkNfJXoLiSBcTAaBkjoYq3Yx8iawyYeqCt+SJPkeZnrd5IA9Hcdn1X8IG
         V27+UGCIE/VW6BAtQlg714vaVBwIZuQlB9ls+EToKGLcBZx0r2A7hsIzUx5r4ycpuZ6X
         cT43jsnmnsNrxXClN86Z+0sBvTUEJTKVFyHcohGAsfOzl9gjbHCN1mJmRkm/q9RQuwkv
         veNo1fvwFmZ448+dZ4Vb/fMEy2sAvVqgr6j2KIeTokqB3+SOi+Z7yesXyoM526va6yrB
         uBvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961480; x=1749566280;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L1cI5SBD7MAWLfTRQEXjlnF27Z0y/aSH849T67R+rYk=;
        b=ex6RghauYeT8Ei9NfrFDsc8OvV05dQF1pe/cW6f5Bd3R9suovz+aAjckXYG3nxOIKO
         uCnq9NUZDpDYYXy9ksu43fMbT291BPlSlw7cUHtuClAoIm1OW8pwmvOamHP6T/Ugo6TF
         VWc7HPWS3+AGwX+mzFOyMgFhB5Npg3c2S+VS+aHVGo/2lnemnb1p0387bvR0vd1iH4tL
         zb1pQms6mKpogQI/ZOgk07Ft/084kUUXFwnXmrFswth4nfr6WQHal/c5llB0FstewWM5
         GGE8xp6f1SHZjC/S7cI+F9GP9UgbkHQBaJQjJr8rwq0u+cI8wcal6hhE6sqTvGohxg1N
         MMdQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrCzqEgkb/CxBCCRK9O7NG9uBB5/okDnttPGdpt5/uwCsGO5hBVueE54p19hxu3F6FNc7b0K4MAbIOOu4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwqWjzDCGO5YuANhANBWdH1jdoZql7kf2YtNlm4tOqEuXSC1MDg
	IrASsuwDRjt2rSkiwH4bTcGVfjdTFCW9nISHjVx6dwbDL8tKm3MYlf6eEnj+CoixPYw=
X-Gm-Gg: ASbGncubVmijKSbY/QrXU8oZgDEBLKex0QbquYFLs2BDKmvFoyDwvK6IsX46XLxxasJ
	kt5I7ZgRrghTFp/5UDc9Ww7ORKGAqPJME6xeNNyqF6JAwI38EI2vi8uVD5jUKkiyxRwgw8Uwy2E
	NfGRzS95ELlc1Va7ABvHRpT+qCAldJVwLukJ9a01nXSuI5BJkp2Sj796qVCw1ysDQ4GUrrfTkdH
	xjk1s19z26SSUHpHqCE4X5sdqem/cp3tA69BcZv/OMl/BOFblg0UdsUklqVD/l0yN+m2aE2igTR
	fdQRw6NLidmVINrNq0q92cvhA8+TNCqmpgr2jyuPfDbKRrVQMvErcHn3XVc8lw7oZ/Jo/GBgT1q
	ZkRTxJA668lHBC41Gyky6lpkac6kED19RDzhlCwu5uMI0jQ==
X-Google-Smtp-Source: AGHT+IGFPX5VdQK9T4g6UMgjgydI5QDL83V3yamCgeiN3fZy4/E6HSS7tjewElI3JgP7ZsTBOye2lQ==
X-Received: by 2002:a05:6000:1a8b:b0:3a4:e4ee:4c7b with SMTP id ffacd0b85a97d-3a4f7a4d5acmr13070281f8f.15.1748961479912;
        Tue, 03 Jun 2025 07:37:59 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f1afebsm164430945e9.0.2025.06.03.07.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:37:59 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Date: Tue, 03 Jun 2025 16:36:27 +0200
Subject: [PATCH v8 5/6] iio: adc: ad7606: exit for invalid fdt dt_schema
 properties
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-wip-bl-ad7606-calibration-v8-5-2371e7108f32@baylibre.com>
References: <20250603-wip-bl-ad7606-calibration-v8-0-2371e7108f32@baylibre.com>
In-Reply-To: <20250603-wip-bl-ad7606-calibration-v8-0-2371e7108f32@baylibre.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1153;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=rfCHNvDJGZ9CfpNWbsvNZme06fPzQKFo7DAhEkye3IU=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiw56gofpjWOk/92/TCQO2mBqUzHm9/yq3j6er66+rW+
 4ktv5e7o5SFQYyLQVZMkaUuMcIk9HaolPICxtkwc1iZQIYwcHEKwETOqTD8M/X8uefDpwPN9jU7
 8zZvSHkZWG4Yx6dyT7t2M+cBY72fExh+MauesFcWCU6y/29m9/Vq//VX+X9kdondPsv3fZ4/k5Y
 1NwA=
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

From: Angelo Dureghello <adureghello@baylibre.com>

Fix ad7606_get_chan_config() fdt parsing function to exit for error in
case of invalid dt_schema values.

Idea is to not proceed when there are values that are not allowed under
the dt_schema.

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
 drivers/iio/adc/ad7606.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/iio/adc/ad7606.c b/drivers/iio/adc/ad7606.c
index 9a9bef0cfbb37138f71ba5b1babeaa423eaf4d5a..e0a666cc0e14255754e74daa9e1e88bc4ad1665c 100644
--- a/drivers/iio/adc/ad7606.c
+++ b/drivers/iio/adc/ad7606.c
@@ -319,15 +319,13 @@ static int ad7606_get_chan_config(struct iio_dev *indio_dev, int ch,
 
 		ret = fwnode_property_read_u32(child, "reg", &reg);
 		if (ret)
-			continue;
+			return ret;
 
 		/* channel number (here) is from 1 to num_channels */
-		if (reg < 1 || reg > num_channels) {
-			dev_warn(dev,
-				 "Invalid channel number (ignoring): %d\n", reg);
-			continue;
-		}
+		if (reg < 1 || reg > num_channels)
+			return -EINVAL;
 
+		/* Loop until we are in the right channel. */
 		if (reg != (ch + 1))
 			continue;
 

-- 
2.49.0

