Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7A811F4171
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:02:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747990961; cv=none; b=OLjCx6Aqr66j1Kqa224/Z2tuqovkyGa7kIxx7TyS0XD2YZVnsXVuIyRNu6CDT8qG6lVs+pOmfUkC/z8Qbm31adcTlP0baXZXElb8bIy9a+mzRRImcJcwJvoshs5M+iyH/nOq/APtmQLHMHWR+RvlWKER34j0FUF2qXKpjnIP24s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747990961; c=relaxed/simple;
	bh=doHa3YCIp7tiYkIZFxkhEcU1OgURBbT38DlkZJp+GiM=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tVJ+PrNLkhjSrMZIE6YkWubXn2yHQ4gLykSEa6N0zTnWQYL7E/Fp8A2JJjUZoH/KJC9ZOxjSnggoET0rR4L8sOWgvp+hYixRMk+EeGDsG6sEygU5DblvDd0aTPVvkfogM5sd58sifcNQULM2kYbuciKqYFlyMrGy2oVczLMB6l8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=b6qvEOib; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="b6qvEOib"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-442f4a3a4d6so4187015e9.0
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 02:02:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1747990956; x=1748595756; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwpmZ/tlJQz9RMWlTCuaFzjUWCjXgU2MOzG6MGDKtac=;
        b=b6qvEOibUsIMLdOh5JMfovPVaCWt8EQM2qnmSGVzOcNGSjfMv5IW+IeNuMkhvOYnUF
         rXQ1SbPgyErM34FF2JINJRivOY6J+3o6rah3mP9fOtC3GGeb321tV6w8fsgDK70RsoDT
         RgdZdPv73MN6D6ZtpBqnAES/E4bMfCBbMEYJHW42YRlC+hdB441PpBHzy+GnBRzYxrm9
         ch/4oaH1BJscinqYauPHRfQk6Ie3g0ex5k1fObKhDgI60OtWJvhj2PwkMPZX20eblkhZ
         pNAWYfPCH4HyCVkcGgw1P91UC8ehged4TryvV0LgCjCjWQ5xOXsFeQOeHe6fF75M7kXm
         trgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747990956; x=1748595756;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwpmZ/tlJQz9RMWlTCuaFzjUWCjXgU2MOzG6MGDKtac=;
        b=tzLfUo2M2rcaDM1VaXXvup+m7Okt7vWaB6MAA/ynQDm99LWBMkoY2AMPvvchjj2rxn
         6tvMzUSMiOV3zku88sogm/4/5A4Rn3zwiZd996RRS2pH6nHjoxC0UMO6mhwRLCZvwsJ0
         RwGL4LWdUHQlmameRF+magP/PoR6b6L6J936Iz3RR4Xqb2yOLhVWBfStBAO7+RP052pe
         uVDqDd3FnAzHyBqWBhj9+TnP/PMDtXS/zVvHICFEMbufvqmSoDI7MmCX9ODWSD0+uunQ
         1zXoUeNz7Uu0LK/lGGj2HoiBivX3axQSMQJEoXpVkUpWV4rEiNMtZgNm9Zlwws9yiTMt
         E5Cw==
X-Forwarded-Encrypted: i=1; AJvYcCURJbIsbJ0fafye4ru5g3G8uWV8ux2H2TbZx+5WPcL/dhoAJCU1PuxZXOXz4N6g594bXBY07+c+jFKVtIA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9NzyopPNKx/a/Z27vHlxrQLvJHvM+KbxgnnrWO4FxPL1ulp2O
	ZZXgEtCd0Ig9t+UnYd8JNa0q4pgH7GHDJ6DJPTqsuDQXFGBG29SjbPqGwbCO1t/i+m0=
X-Gm-Gg: ASbGnctux3ZkHaVcv7JNg3qxk9rwx+x8YVqpur3NkVK1xd3kVdxzW/vORWCQFyOaIyd
	HGGCdHdnFtzW/Wa+CKlHY8d2Cw81SnxtVPNpnBh+OIolZPxRRt07B6V4WHI6TSytNsN/tFqI3pw
	A9GMDn8ulKNuNH0jn60/lI7ildrYKMMzfqLlUWuHsEeCI1aZevmTSiwSP78uFgCZSFLTW6UB1Km
	eGv2QGBw9OxhB/x/Wd3Y749HuzBah+7WroEWrMAfoprsDAAj8fQkwyEr1yXs54TImUedlw66Zfa
	me97FFnomPtjhRqI88sx5b5jxzvU1SoahS9s63jULpO/EwxUq1kJzZdi/tq1e2o9WWF1p/VOj/F
	Hl9wIqt5fHSmPR8ru/9oiH/DiBgcIRDkleC3h0vaGRsix/A==
X-Google-Smtp-Source: AGHT+IFAj3aiPAt+YEDjIex6r9cadMUgoqd5WzJcO+3jJTN41Tv3VWf1ELG4ndyEe2vGuLIDmHFUlg==
X-Received: by 2002:a05:600c:b8c:b0:43b:c857:e9d7 with SMTP id 5b1f17b1804b1-44b58a9bb3fmr22411595e9.5.1747990955983;
        Fri, 23 May 2025 02:02:35 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-447f24b6471sm134043205e9.24.2025.05.23.02.02.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 May 2025 02:02:35 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v3 0/2] iio: dac: adi-axi-dac: fix for wrong bus read
Date: Fri, 23 May 2025 11:00:50 +0200
Message-Id: <20250523-ad3552r-fix-bus-read-v3-0-310e726dd964@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEI5MGgC/4WNQQ6CMBBFr0Jm7ZgyWCSuvIdh0dJBJlEgUyUS0
 rtbuYDL93/++xtEVuEIl2ID5UWiTGOG6lBAN7jxzighM5Aha06mQRcqa0mxlw/6d0RlF7C0RDV
 R7wN5yNNZOfe79tZmHiS+Jl33l6X8pX+ES4kGq7MLoa4de9NcvVsf4pWP3fSENqX0BaOZI927A
 AAA
X-Change-ID: 20250408-ad3552r-fix-bus-read-1522622fbd2b
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Nuno Sa <nuno.sa@analog.com>, Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, Andy Shevchenko <andy@kernel.org>
Cc: Jonathan Cameron <Jonathan.Cameron@huawei.com>, 
 linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1451;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=doHa3YCIp7tiYkIZFxkhEcU1OgURBbT38DlkZJp+GiM=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwsAyTKrz+tGjS2qs3fBO1HPSca9d+V3SY8KLUa1KbX
 vz2zUdMO0pZGMS4GGTFFFnqEiNMQm+HSikvYJwNM4eVCWQIAxenAExktzXD/wqN3lWL5RXcvyjM
 zlIyeMhfpOlZZiN42dTj2sTTkdb3JjL8lV1wtKxyhviPTdUzn/6y+OEsp/th/561Nkkn/6zr2qp
 lxw8A
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

This patchset is intended to fix a random wrong chip ID read, or a
scratchpad test mismatch, tests done in the ad3552r-hs driver probe. The
bus "read" operation must always check for busy flag before reading.

First patch fixes the wrong bus read occurence, second patch reorganizes
a bit the busy-wait polling code.

NOTE: due to ongoing changes in adi-axi-dac.c, this patch is intended to be
applied after the linked "ramp generator" patch.

Link: https://lore.kernel.org/linux-iio/20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com
Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v3:
- fix axi_dac_wait_bus_free(), 0 must be checked on poll, not -1. Someway
  failed testing it here initially.
- Link to v2: https://lore.kernel.org/r/20250409-ad3552r-fix-bus-read-v2-0-34d3b21e8ca0@baylibre.com

Changes in v2:
- invert patch order, fix first.
- Link to v1: https://lore.kernel.org/r/20250408-ad3552r-fix-bus-read-v1-0-37add66aeb08@baylibre.com

---
Angelo Dureghello (2):
      iio: dac: adi-axi-dac: fix bus read
      iio: dac: adi-axi-dac: use unique bus free check

 drivers/iio/dac/adi-axi-dac.c | 40 +++++++++++++++++++++++++---------------
 1 file changed, 25 insertions(+), 15 deletions(-)
---
base-commit: 6fb85f14853ddde06d57030c753168402bf69cd9
change-id: 20250408-ad3552r-fix-bus-read-1522622fbd2b

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

