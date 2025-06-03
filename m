Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6A98239E67
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 14:37:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748961478; cv=none; b=g5RxPyC3XBR7Be6hdMysMwApDh3c+aY/vy8oM9eULwo0WR++v6TQ/4z/07vPfGSEIA8iEKlkb4kzCgA+COxh1iA9zuaRC2/jUoJM5N/DZVVbwAANzMke8Ey+oHExq7sqrgkIzLUft16IzEuCzSxSgCJ/v6uLY4yNjpqiNZHw2GU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748961478; c=relaxed/simple;
	bh=677TSc9A1hAhSoAaOW87gpqqfvUgwDfZFIvIBoyyRr4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=kgDVsIzWMXdu10yXMmWueidh1CDrOlvnT6SUK3GrxZoOoaW7CVg/lsPnSBsxi4QVxZJbxkaQbfhjd1h0Np/W/klT7p3TesSU6pcRJla8FzcR9rwcMk1lS4UOcCQg+DOrWztt/lhYub1f0GFLS9eTycgFpp6hTy483qZ4hau3/+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=J7tSbDZ4; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="J7tSbDZ4"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3a375888197so2943772f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 07:37:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1748961473; x=1749566273; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=a3xpYGRLXAWWNaLNbZuTl8oqgA2OpPj1dGqIRkmhTZg=;
        b=J7tSbDZ4CQXapadYBNd7V3vR1N/9ms6Ldit4QXPUv92X49z6BY2lgjZivb3eNmzuN9
         nFdrMcWPtliPaYEqq1mU09XreyFGhZtwSlezDD3M4q/8emev2IX1qzkWjLte1s/3at/V
         Mx3Psj7pogyn5cExm8UqXEdSa/7Yqe0NGasEh4eYcDoaTzeTO1COrmNJnBt6EFTtQMQa
         OG8lAbBUWLa0dSrL48lumCWmcyJc3cqXT+lahLxqX+cK31qorH3M632dO6HqvritEOGb
         m5Dq3hyhsx7jKXArpyh+qB7Y2c8hxWycnpsVuawQxrSaR6254Y98NlhZluHylLLqdRqH
         /iEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748961473; x=1749566273;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=a3xpYGRLXAWWNaLNbZuTl8oqgA2OpPj1dGqIRkmhTZg=;
        b=W/D76z1xj/cKVbeI4ZSx6pRWbQfe70H9HB1f3HhB7S4vG0Zfwa4hhc6M97qbZMbtU2
         zYkV0Zs2FtzzXoMUHsBd9hDZVPESS06ZIzTU9bVolG1zPBTDqUAeQ6QiAm18Ha8jImFx
         yk1GhuzpjgtaGTLHGomigyIZJ+oxd15GR0943CJsqM06sbCAieWB0I4nf4xjNgovQA1H
         O/Rx+MuMnds1dQQtT2MnqvrxWcGSZ4p20UidAssS93jQS4Gyb/LK6co0+gTjO3if5mAq
         7bPxqEtaNRxkLuOZUSTMC8FE6MF4lmUBHOxJXJXt7vXxuJkktcmLAU3rx1JZh8fwUTDV
         ycvw==
X-Forwarded-Encrypted: i=1; AJvYcCVghZYKv4Wsihv5HbRAAC5jx6v9qKFnib7mylAZGOIxAey0ij2CanRGHHT5CF87ktwX9kZ8qW4HM4muLdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzU9aHt2DHfbLd+M8YRsDLslx/yflwWtpBdY2580yZbkshKBcd3
	/3KYND7h1S0Fnof2H5zyAiA0PJOU0zPbFP2EKfAbAD/LuXRft82V+ChjBaTvNnmbfhk=
X-Gm-Gg: ASbGnct9L9pNv42RyhY1r2/AsU9+J3MG+EgyiB+7K9zAzeeo++1Br0mcrpuTqT61ID0
	EdlY/ovgE59RN/7dtc/jfLgygrlHB5gJViQYqn9jh1iDCB1Kpg3kAVMc2siGV5JXRXENAa3NVaB
	Dx8DOu3CW+TjqSmlGWNHIV6duYluRawT6GssaslEFqtYwFsR/OtN0SFulTBLYT0JZgwc12e5kqY
	4Ea8QmLw+kO4YcSqdrGZXhwEEMFF4A+B/6/qOYMNJOoFdFQPr+F8AFFjfmZ3Gr/JW04Gwy+dTUj
	0yvHSj/rlIGkOyfQpcfMDDptR6I1qUzQ+7prRymNmTplVw+rDT5xm/MZGJmutq2ZUEMiocXTMdj
	fd2EPH6LyVZp2a5nSY4zwOcxwE+jgd4sw97Q=
X-Google-Smtp-Source: AGHT+IFRnHSRrU1UayHggAUih0volM75oXFwlpBe39dzJgPvnLxpduH9rL+KJ0brb/PgqgbJyn/ykg==
X-Received: by 2002:a05:6000:144e:b0:3a4:eae1:a79f with SMTP id ffacd0b85a97d-3a4fe3947dcmr10812301f8f.33.1748961472622;
        Tue, 03 Jun 2025 07:37:52 -0700 (PDT)
Received: from [192.168.0.2] (host-80-116-51-117.pool80116.interbusiness.it. [80.116.51.117])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-450d7f1afebsm164430945e9.0.2025.06.03.07.37.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 07:37:52 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v8 0/6] iio: adc: add ad7606 calibration support
Date: Tue, 03 Jun 2025 16:36:22 +0200
Message-Id: <20250603-wip-bl-ad7606-calibration-v8-0-2371e7108f32@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGYIP2gC/43QTWrDMBAF4KsErasyGv131XuULjSS3AjSOMjBb
 Qi+e+VsaooRXb4R8414dzblWvLEXg53VvNcpjKeW3BPBxaP4fyReUktMwTUoNDzr3LhdOIhWQO
 Gx3AqVMO1bXGEIL0JBqRG1vYvNQ/l+2G/vbd8LNN1rLfHqVms0/+os+DAM6mkHAoSFl8p3Nbn/
 BzHT7bCM/5iGrCHYcOEVZQgDOAE7WByi5keJhtmMlky2aIEu4OpLeZ6mGqYF0EO6KTNZu9neoO
 Jbme6YQq0GqKNfpBpBzMbDLudmRVzljwoKVOAHcxusW5ntmHUNECMWXj/B1uW5QfcYfKzkwIAA
 A==
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3712;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=677TSc9A1hAhSoAaOW87gpqqfvUgwDfZFIvIBoyyRr4=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYsiw58jM3M1kFHf+khRDoraopVWFpyd3vdv8VSlL1vr0z
 bkV96m3o5SFQYyLQVZMkaUuMcIk9HaolPICxtkwc1iZQIYwcHEKwEScNBl+s05caKvPpV25x3fO
 t9reuaWxq8suL+bgrRO+9K3o+Kf2CkaGNY2fyzZaR/9pEvqw4uu0+t/+86pehe2XcWyvP6H2KUu
 MAQA=
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
Changes in v8:
- fix bug related to wrong calib gain setup,
- fix return value on wrong "reg" read from fdt on calib setup,
- fix commit messages/titles,
- add new function to write calib gain on ADC registers after reset.
- Link to v7: https://lore.kernel.org/r/20250526-wip-bl-ad7606-calibration-v7-0-b487022ce199@baylibre.com

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
      Documentation: ABI: IIO: add new convdelay documentation
      iio: core: add ADC delay calibration definition
      iio: adc: ad7606: add offset and phase calibration support
      dt-bindings: iio: adc: adi,ad7606: add gain calibration support
      iio: adc: ad7606: exit for invalid fdt dt_schema properties
      iio: adc: ad7606: add gain calibration support

 Documentation/ABI/testing/sysfs-bus-iio            |  24 +++
 .../devicetree/bindings/iio/adc/adi,ad7606.yaml    |  29 +++
 drivers/iio/adc/ad7606.c                           | 236 ++++++++++++++++++++-
 drivers/iio/adc/ad7606.h                           |  15 ++
 drivers/iio/industrialio-core.c                    |   1 +
 include/linux/iio/types.h                          |   1 +
 6 files changed, 300 insertions(+), 6 deletions(-)
---
base-commit: 789fd0b1a017f1582fee73effb5cfa740ad6569b
change-id: 20250429-wip-bl-ad7606-calibration-20a396a60352

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

