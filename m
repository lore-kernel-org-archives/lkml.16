Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEB941F4261
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 10:04:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748253886; cv=none; b=mhO6epP31CgrVKVwUbajqVZiQP4RfcvjE/3EejkdcK+Vce3kZ2QKumxXfzdHbtVpIJ6N49ZCDPqjEgh0Bs7qQECq2tNrsBWtcqA7vSy4HrbcZJjs1i8fJxw3Und2l8S2e60yrF+CP3xdzFePIrVhEA9Co3CxW8fQC4vznLNWat8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748253886; c=relaxed/simple;
	bh=eSK6YZcLQNcfWyBCA5lDtS+FZisIhv1cZBflT0atmTw=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=KpJ+qW1IF+/qrMgnb/fRIH6HxC7Y83cczKqhBdTNWsQmh2H+PeS/YIHQbWhACa4azCXlzFHs5HaYMiwZcB2qpke49iYNz8gLHqEtGNZ4RiHKfNJC7Ekvrir+iatMBE0oPP+44ZYFfpYommx7yxMMGOm0JK9pQYWl8UQEcr35bVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=M4g5Y3nW; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="M4g5Y3nW"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a4dc0f164fso420266f8f.3
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 03:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748253881; x=1748858681; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DV2U6idgVojBbiD7oQDIMDL4s90BH7rw7O7YWkBzKdA=;
        b=M4g5Y3nWO370Zacw7hWSenWJoRdKlSf5imPCM1zFvWuGmSlfBnFhsLCsjhgWaxe+6l
         BqXEwDXDgZnvLvpJwuKgaw6FbgdwM6U9qrFQKkTD8rAzWxjQjbx7JfJ7Y1To/StghCxo
         NjViCAm54A2x8uET7VOUcZrn0HDsrD8X1EFZhTid+kiwzHYDdULrc1AlpiRDzxIoi7UZ
         Efdh+9nR+ue9obvZKdwKzzgiBDOeKaH50NT7kPcSGpN2nxHZDQNo6PSy0qN9uY547vMU
         gIbapzhdR7KDDWHeFLRFCylRiwbykkTAOd1Lod9ZtufiakAdYmsentReXYr9ybU9R/Cg
         2RAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748253881; x=1748858681;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DV2U6idgVojBbiD7oQDIMDL4s90BH7rw7O7YWkBzKdA=;
        b=hpnIhhhRLoKSMeG4TabyhrPwLe0KlrU+TMtgcX5O7XiWpYBWct64a+qAeVJSw4SDTB
         1IU170XMLBjnKCekqMQrHFWOfGRvFLBNpclo5+OfDYyyWzbP0kWQlJN48i/NGZ2akR5n
         lB/seChHOlTCFlh2GaC0PGhW1qtj9BXcFnmEeOE+W5DBiM/j1cKopsy2zetlvLPsT5Gv
         wfxdSvxab1D4PcxV62MsEKFNfb83//QShmlwMlxHcLuaPRH6dHFT7zqDIbycdbZz3y4j
         yh3EwxBFwcw+xxByAsYJ+mO0p1M27zaoRpTg3rOQSXXuXWGWoxD22gyBSNHSbOfeBYVg
         o+iw==
X-Forwarded-Encrypted: i=1; AJvYcCVidh/Jp1Kr9KpyEQteukjfc+xaV4r92S1ZJNBOLbuNLHZLpcfMAh1hXqYHrYJsY5HMgR14pLZ6QoG4WgE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqLX/sYmNpx8d0Aqkbu7+qMQMTYxyfPpX9H2WN/2SFmIpNvIVB
	kcxSOLjRbWTQ93GtAAcjKZyu0FWJaTIEYVHp1r0jvIIkHNl/xj6tryEwZXpVIGJzmNo=
X-Gm-Gg: ASbGncv62v/ejKGROX1YofvACxulhQa+d0S0TsDnwl6++nf58lFg195zTXqkGNatLu+
	Zt9AIe+GgiNEcykoUJW9yudSdU6xVhAKMOaDw4UG9nm6rXO1aR/PoWCPFnYi/nGJbuB/TqYFjGa
	H2fA/xGMElkbdbrzHnV93muENyuzYnysjSmIgUsk4VKOaiE2fnwXbn4uFqdEYjQAGGZj2zKRwuv
	VnKslpmYADxTGTBqI/FoBifAsVYU1PJIMOBML4+pxn+gZz+saBhCLxwmq8Tt7UVdxKSCl2xwZmF
	IUWBJpGqHlPYMrRE6LUAHK0umaSOOLquqwpeVamm1pa+1Mspq1vIlHm3AZI83VOM3Pw8iwXFZiD
	TuADY+EQUjwkq8Hqb9zfdv7LQPkQ+vzA=
X-Google-Smtp-Source: AGHT+IGPPusAGdBj+JyaVRhQQ6sAZOIsx4vzH7PAiLud1ABGfWxc4dBci9VDUB4fBJQIrwDdRYc/Uw==
X-Received: by 2002:a05:6000:4027:b0:39c:1f02:5409 with SMTP id ffacd0b85a97d-3a4cb4619camr5820777f8f.9.1748253880831;
        Mon, 26 May 2025 03:04:40 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.retail.telecomitalia.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca888fcsm36141834f8f.78.2025.05.26.03.04.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 03:04:40 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v7 0/6] iio: adc: add ad7606 calibration support
Date: Mon, 26 May 2025 12:03:15 +0200
Message-Id: <20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGM8NGgC/43QzWrDMAwH8FcpPs9Dlvy5095j7GDH9mromuKUb
 KXk3ef0sjCC2fEvoZ+E7mxKtaSJvRzurKa5TGU8t2CeDmw4+vNH4iW2zBBQgUTHv8qFhxP30Wj
 QfPCnEqq/timO4Mlpr4EUsjZ/qSmX74f99t7ysUzXsd4eq2axVv+jzoIDT0FGaVEEYfA1+NvaT
 s/D+MlWeMZfTAH2MGyYMDJE8BmsCDsYbTHdw6hhOgUTdDJIYHYwucVsD5MNc8JTRksm6b3L1AY
 T3Z+phklQMg9mcJniDqY3GHZ/plfMmuBAEkUPf7BlWX4Azz2OqUYCAAA=
X-Change-ID: 20250429-wip-bl-ad7606-calibration-20a396a60352
To: Jonathan Cameron <jic23@kernel.org>, 
 David Lechner <dlechner@baylibre.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Andy Shevchenko <andy@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Hennerich <michael.hennerich@analog.com>, 
 devicetree@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3377;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=eSK6YZcLQNcfWyBCA5lDtS+FZisIhv1cZBflT0atmTw=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsgwscnecHDetTezxVZkrj1a5fzq4urwyu/tLLxO7rM6J
 /AKt15r7yhlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCR93sZGRqnrNb48dpgVo3/
 lfVHs5X/xu9dsGhCepHFk/TM03fst71m+O/p8O+j6uzzthb7Dt4+HxfQ26UtefSJM5fMH6bbe9h
 qJnIDAA==
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

Add gain, offset and phase (as a delay) calibration support, for
ad7606b, ad7606c16 and ad7606c18.

Calibration is available for devices with software mode capability. 

Offset and phase calibration is configurable by sysfs attributes, while
gain calibration value in ohms must match the external RFilter value,
when an external RFilter is available, so implemented through a specific
devicetree "adi,rfilter-ohms" property.

This patchset depends on:
https://lore.kernel.org/linux-iio/20250505131544.0a7477a2@jic23-huawei/

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v7:
- Fix each wrong commit desc. occurence related to convdelay.
- Fix ABI documentation with better words.
- Fix wrong comments in driver source code.
- Add r_gain default before reading the fdt value.
- Link to v6: https://lore.kernel.org/r/20250522-wip-bl-ad7606-calibration-v6-0-487b90433da0@baylibre.com

Changes in v6:
- exit for error in case of fdt that breaks the dt_schema,
- add (5/6) patch to fix the above on older code too, 
- Link to v5: https://lore.kernel.org/r/20250519-wip-bl-ad7606-calibration-v5-0-4054fc7c9f3d@baylibre.com

Changes in v5:
- fix tab/spaces wrong formatting on ABI doc (1/5),
- fix description in ABI doc (1/5),
- fix code multiline alignments (3/5),
- fix calibration offset calculation as oneliner expression (3/5), 
- Link to v4: https://lore.kernel.org/r/20250508-wip-bl-ad7606-calibration-v4-0-91a3f2837e6b@baylibre.com

Changes in v4:
- fix ad7606_chan_calib_gain_setup appropriately to be called once.
- Link to v3: https://lore.kernel.org/r/20250506-wip-bl-ad7606-calibration-v3-0-6eb7b6e72307@baylibre.com

Changes in v3:
- fix dt_bindings,
- change sysfs calib_delay to convdelay,
- fix sysfs documentation accordingly,
- used u32 for reg and r_gain,
- used DIV_ROUND_CLOSEST for setting r_gain,
- minor syntax fixes,
- Link to v2: https://lore.kernel.org/r/20250502-wip-bl-ad7606-calibration-v2-0-174bd0af081b@baylibre.com

Changes in v2:
- change phase_delay to calib_delay,
- fix dt_bindings,
- fix gain calibarion fdt parsing,
- fix ad7606c-18 calib offset range,
- fix calib offset calculation,
- fix calib gain range,
- Link to v1: https://lore.kernel.org/r/20250429-wip-bl-ad7606-calibration-v1-0-eb4d4821b172@baylibre.com

---
Angelo Dureghello (6):
      Documentation: ABI: IIO: add calibconv_delay documentation
      iio: core: add ADC delay calibration definition
      iio: adc: ad7606: add offset and phase calibration support
      dt-bindings: iio: adc: adi,ad7606: add gain calibration support
      iio: adc: ad7606: exit for invalid fdt dt_schema properties
      iio: adc: ad7606: add gain calibration support

 Documentation/ABI/testing/sysfs-bus-iio            |  24 +++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |  29 +++
 drivers/iio/adc/ad7606.c                           | 218 ++++++++++++++++++++-
 drivers/iio/adc/ad7606.h                           |  12 ++
 drivers/iio/industrialio-core.c                    |   1 +
 include/linux/iio/types.h                          |   1 +
 6 files changed, 279 insertions(+), 6 deletions(-)
---
base-commit: 789fd0b1a017f1582fee73effb5cfa740ad6569b
change-id: 20250429-wip-bl-ad7606-calibration-20a396a60352

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

