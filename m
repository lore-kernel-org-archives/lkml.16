Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A45E267F61
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 10:20:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744107618; cv=none; b=W+F6B+F2HdPDFMTzTn79+GKVpw4g6BCE5dhR/nCykB71hgaWbrH07GKpYQrGiomEK3qNApZfLw15N88t8x1f6mlI5ndhWOJMP3z7CGltwLvhOLIlW0YJksE36yPGA3L/jpNugYQoirR4LoGj6kgghLR+HVH2C9hh89hjl3qP800=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744107618; c=relaxed/simple;
	bh=VqkQDwdjjBLXg0xsTy9tSOcc4xRmbJVc0CLEPpdho78=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=g3FFeFaFkfGbrGvN+4kAB4b1cCHU8r/UQyfcG8VczsTfwpU9tgS/l8tJdQAoENUb0xXi57t39XpcfLxDA4s44hTUIfTtqDPWgA73tWIUglHQgKyWdWLtkN3X+oDm7XU+cEA8TLP5sZNn2W/dtxJcdqVLHv65xRHYr5uy0xm1v0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=yG0wFQCk; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="yG0wFQCk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-39c1efbefc6so3109228f8f.1
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 03:20:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744107613; x=1744712413; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=vaQaFHxZ5nKN+lY9D9HQ1Xp3+zQ5MlJgomgir2Nxsdg=;
        b=yG0wFQCkfMXYslCHGeRjYoRhcxA0LZBji6cmfW1P4gIAELPkpS7pIyMT7kxL9Rb71L
         hx3RiXyGm9TV9qV+QspyR0LYC1nfFwghJ1TTlE4A8EvManyuApTUK9HZbLbfsU0S41Nj
         2H8+/8rSY1GC1dwyVP00y7zRoiR0O7KkBHFgbsL/+bEuGssyOW7YvX/naWqMvEM4iWXh
         kA0UZkeyS7Q3ouncoVH/y1d2rZP/xasbsKd8PR5zLeL7/sgxt1l9gv/yD7bw/YVjGleQ
         lMJ+jwfslFz4yOy9nUpKzEfBMMKvkY/V9OPVwtFjBfiMf3ti+dycUvkor8IO782pgvC5
         b+MQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744107613; x=1744712413;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vaQaFHxZ5nKN+lY9D9HQ1Xp3+zQ5MlJgomgir2Nxsdg=;
        b=wtRHkZ0UczFzUR7vIKKu9ISS7Fhrxpp0n6Z4uG4YQkrcGSVecOzpzNFnns1tfjLyRV
         hLn1TGmiDTnqU96ODX7vGVnzlXPd0QLda0pxK8PuAfBEsg53vK44+knXzUEcT9A18qtn
         EITktZ7HNlIA+YnuIvHp53yDUq2KCccLvE8Xc9cnbi3B5g5WmpGJrVrCP26+OR1uDq0+
         WWSDAQxFqmeGwxP8ovmSQ1+muxz4XAttgZPVpIwiNp7h3nxxxNnydUUnhnctzGqpBK/2
         3nAsThjy7RDqfl79HtfzSqpbpNrR2uauKtcwKyx60PZngakm1WRM3vvHBLuPeR8sfDNp
         Z8mA==
X-Forwarded-Encrypted: i=1; AJvYcCU4z11zad5DaFctazSPFPKQv5W643F0nu0NtGJMV10VZTyafY+DZB9aMdy6RaRHzIqX6uW8aGaXKGmtfvs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwT/4BmTTVFB7G66POD6WSUWM2di6RWRkEGcGzhQq/D4JXCwc52
	LKFgC3KK+PZecNmE/KrNs/60XuL8CeJRnHqEdWZ4cR504dXQDRFg/lltrffKnbQ=
X-Gm-Gg: ASbGncujV7KuevNrupir/ECFdIr1ZMRS4c5VQKO7to5z7H8H2/So5j8mW8UFy36NRVE
	h0cj8ZsNwzDVFvDl9cLp6hqXEVlbGGHE+drk6Nj/XWQl9bgCCdZiQqtlX3FmlBPS2B8MSyVeFwz
	atXICYCp61riMRLqEhIjQ8TFEBBLkELM79AMw5BZL+ULMMeX+2PwY5/8CrWMNIk0vQ0HGhoWSac
	/6wAtAoXR7H+luqdPz4gPuE4rgePcVzimkBnrnVjq4NDT5MBjuO6bfhPHYOgcZzbbiBn6silNrp
	nLgA3Ep/Za2grE1LVFc+oKLxMTTV4wHsolpbb84RqjbB+0CBUHKdvfX/K0msmASla21oFw0Pc3+
	SUGrArbKiTYw6NkBdrsNAkA==
X-Google-Smtp-Source: AGHT+IGcbz9EPZCqgrBKNQ8aQeRDCGZyMg6GG7p5JvSkTyWeu0NoTLGjdTFe1Q3xhSgsj7nwDpOzeA==
X-Received: by 2002:a05:6000:2410:b0:391:4389:f36a with SMTP id ffacd0b85a97d-39d6fd0229bmr9811971f8f.48.1744107612907;
        Tue, 08 Apr 2025 03:20:12 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39d7c6d838bsm4396138f8f.69.2025.04.08.03.20.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 03:20:12 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v4 0/5] iio: ad3552r-hs: add support for internal ramp
 generator
Date: Tue, 08 Apr 2025 12:18:50 +0200
Message-Id: <20250408-wip-bl-ad3552r-fixes-v4-0-b33c0264bd78@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAr49GcC/4XNTQ6CMBAF4KuYrq1pO0MBV97DuOjPIE0QSGtQY
 7i71Y3GSFy+N3nf3FmiGCix7erOIk0hhaHPAdcr5lrTH4kHnzNTQhUClOSXMHLbceOhKFTkTbh
 S4mig0jWik6VgeTpGeh3ycn/IuQ3pPMTb68skn+0fcJJccHDSGIW1lxp21ty6YCNt3HBiT3NSH
 w4sOSo7zpO3CALrkn448HZQlAsOZEfLqkShC6tF8+XM8/wAjaWTHUsBAAA=
X-Change-ID: 20250321-wip-bl-ad3552r-fixes-4a386944c170
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2510;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=VqkQDwdjjBLXg0xsTy9tSOcc4xRmbJVc0CLEPpdho78=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/8kOQZ064XHzXNd2ubwkCv658uW316gnT28kl19/We
 3AEijT+7ShlYRDjYpAVU2SpS4wwCb0dKqW8gHE2zBxWJpAhDFycAjCRDesZ/lfX9vDc1n2qyv7Z
 7o/e72MrG09/uFOepHx98orn13zzth5nZHifeUWureeFD+9pxy/pb5fzB9tbG8rnXXnlsD7euT5
 LmxcA
X-Developer-Key: i=adureghello@baylibre.com; a=openpgp;
 fpr=703CDFAD8B573EB00850E38366D1CB9419AF3953

Add support to enable the HDL IP core internal ramp generator,
actually managed by the adi-axi-dac backend. 

It works this way:

/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage0_en 
/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/out_voltage1_en                                           
/sys/bus/iio/devices/iio:device0# echo 1 > buffer0/enable 

Activating ramp generator:

/sys/kernel/debug/iio/iio:device0# echo -n backend-ramp-generator > data_source

Deactivating:

/sys/kernel/debug/iio/iio:device0# echo -n iio-buffer > data_source

Signed-off-by: Angelo Dureghello <adureghello@baylibre.com>
---
Changes in v4:
- set data source based on hw channels available (model_data),
- use a string array for data_source debugfs attribute,
- modify debugfs accessors to use the string array,
- add new "data_source_available" debugfs attr,
- fix documentation accordingly.
- Link to v3: https://lore.kernel.org/r/20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com

Changes in v3:
- add mutex description,
- use devm_mutex_init and check for return value.
- Link to v2: https://lore.kernel.org/r/20250331-wip-bl-ad3552r-fixes-v2-0-cdedb430497e@baylibre.com

Changes in v2:
- doc, add few words for generic spi driver version,
- axi-dac, add a separate patch to check cntrl chan validity,
- axi-dac, return EIO on a wrong source on get, 
- add a lock on debugfs file access,
- use const strings and strlen on file access.
- Link to v1: https://lore.kernel.org/r/20250321-wip-bl-ad3552r-fixes-v1-0-3c1aa249d163@baylibre.com

---
Angelo Dureghello (5):
      iio: dac: adi-axi-dac: add cntrl chan check
      docs: iio: add documentation for ad3552r driver
      iio: backend: add support for data source get
      iio: dac: adi-axi-dac: add data source get
      iio: dac: ad3552r-hs: add support for internal ramp

 Documentation/iio/ad3552r.rst      |  73 ++++++++++++++++
 Documentation/iio/index.rst        |   1 +
 MAINTAINERS                        |   1 +
 drivers/iio/dac/ad3552r-hs.c       | 166 +++++++++++++++++++++++++++++++++++--
 drivers/iio/dac/adi-axi-dac.c      |  54 ++++++++++++
 drivers/iio/industrialio-backend.c |  28 +++++++
 include/linux/iio/backend.h        |   5 ++
 7 files changed, 322 insertions(+), 6 deletions(-)
---
base-commit: eb870a5af7db1e5ca59330875125230b28e630f9
change-id: 20250321-wip-bl-ad3552r-fixes-4a386944c170

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

