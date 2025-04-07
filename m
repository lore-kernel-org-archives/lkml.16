Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C3A3366
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:53:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744016010; cv=none; b=tPMLiEKSK73fgR/TdRVWP6vzCxUBVhZney2QgxGxNj1tOrvaTZGwGOTPH3Uqiyn7Pz4fLNO9De0zOtl1WjpY1X2ThliP2fgpNgjIdt8keGTp1/reXjIEX0E57eSWNBMkKGe5mfa4w3qJE2HEVBimIT85m9XXqpTolxSKRKi7AZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744016010; c=relaxed/simple;
	bh=QPHh8N4sbhjKwZMK7xvZJUBdpo9mG11VcIyhWlrXKk4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=YxTjT/D0Iavd4rG+g+HVLJ30qB1+dK9aMEH1d+K6SVXSnUUsjNkirnaK3pZSlsEkY6yXseSFhdbUFfgKtC65SrJUr+x3erAee2UB+7+jNKDHyKwK5NGHLdNeORsco3bkqh+0kMLm1Ewsc4c6CxsRn+Nvy22v4hDvAb6k6rekECc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=e9x+mz3k; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="e9x+mz3k"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ce70f9afbso44480165e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:53:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1744016004; x=1744620804; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eTlY5GezUXHh/ytz6WGIA1+pAcc+7slCnrxJejlItUg=;
        b=e9x+mz3kS2BVS1g38LWAYaOk64I2SwhrjW3oJPWUAnNZtVAAgLSHTkNLJKvLKdS2IU
         gMvH8qYALfNxLjvyRIRZmUEwv2FqNJ+706Q2dlhFqRBqByu1L20eLzQvEzT9endtKFzu
         g8150BrjrpFPFbRU3U42s58mvqrjnBAkIZ7zSsHmuc3bVjnfQwypurHm+4hjYiiTIT95
         JuZ4/ADSHhPzSrQ3pViOztJDoTmnsktxHAvws8ciAxoVAW2y+sbq4/9QvaHzEYjbmEsd
         g4Fr39Hd1+83PWplQur/P3Oky+Vnz/cokRniFCYN3xvXQMNTZwda8Ye2rA4l2peXbBOg
         aYTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744016004; x=1744620804;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eTlY5GezUXHh/ytz6WGIA1+pAcc+7slCnrxJejlItUg=;
        b=b1hEyfoxHCk8KkOpdUG0Psv5KNRwGNp+9b0Gj/1OvONrnKgzbDscuNO3FL0eUZSVlb
         nQ/vSxNQboZh5eVCapYivAp9Cykcw+P2WKE5s818sGDTW1M+x7Rp7lApUfZavA3iO84e
         WTmnE19S4cNGo7yWtQ86Ivf6tU+TYBPm/1nc+wUZIaJpuszLU0luoi3uOTMM6fT6CnlU
         RWrN/FPC/JZmRPeD/6yRCJ/ALN2ixHuJzTJf6tHQzrdfkta1O/Al3bkLK5OlcOBSX0Pw
         jrQIDTvP28w2k5EOy5cOHu1HiPsoezKmfCzL1Bm007ddMMUbxkFmy9c2V9PaCDCyjCdV
         dyNw==
X-Forwarded-Encrypted: i=1; AJvYcCWshdOA+A1tU7APPAe2+AZ8cnkoONq/JpeFMWxeEmPkpBx2ecVm7Xbd4uQT1HsrBr/DVFLtKhf/DNj4MXE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5neC+gTbA8jC7e7jViu3BJKo5AsIzD8gyvUyeOQ2F/w4SQKkk
	SkKuWEO9uDT7vYKEUxVJSoFjAIup48k5zGKmYaqSJhp8wzUTD09I0UkHIt3dhsI=
X-Gm-Gg: ASbGncvln9ozx1T7u5TKHJD9FTJlRoUZG1pKMZ8TNxrplr5Nv6wZJoXp5GzoF2FhpGH
	FzcGDNu3PFGDG4wICW8tnng+bDEGvfZxO/lOxf5ecPsFcSzrh37/hc75XZ/z+fOS90bjauo8lDf
	uKAcxVbCJvYWo6Kapw/mKbeWOAzBUgUytFps+cfJweph7M0IKksXiNWzgKiA1A3SlrLAuTW8USS
	vvF1rt7zOZWfczq1hqXD7Wnm7wdAWAioOnNz2RrNrnSXi/VeDkB/zpUbYyGk90YIngy+1X4Lplh
	locHnCl4u0TLVUIOnZMcgzo4SaaMY0+tOuKiEOyg8y1mCKL0kgQTQ4wBrsV7nEIVrCy4X+3biOA
	liEHuw+RIMrI1vxoctVvmeg==
X-Google-Smtp-Source: AGHT+IGDheRzEIDWvy9jJjVetSnf3JmgBhH88wP2OMBcuwCzAIlUjPSEuV2XkMUSvUT2xeOCmyTN3g==
X-Received: by 2002:a7b:cb42:0:b0:43d:fa59:bcee with SMTP id 5b1f17b1804b1-43edf4581d1mr45012985e9.33.1744016004661;
        Mon, 07 Apr 2025 01:53:24 -0700 (PDT)
Received: from [192.168.0.2] (host-87-15-70-119.retail.telecomitalia.it. [87.15.70.119])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec3174cf0sm126966995e9.0.2025.04.07.01.53.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Apr 2025 01:53:24 -0700 (PDT)
From: Angelo Dureghello <adureghello@baylibre.com>
X-Google-Original-From: Angelo Dureghello <adureghello@baylibre.org>
Subject: [PATCH v3 0/5] iio: ad3552r-hs: add support for internal ramp
 generator
Date: Mon, 07 Apr 2025 10:52:02 +0200
Message-Id: <20250407-wip-bl-ad3552r-fixes-v3-0-61874065b60f@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIADKS82cC/4XNTQ6CMBAF4KuQrh3TdgqIK+9hXPRnlCYIpDVVQ
 ri7hZUxMS7fm7xvZhYpeIrsWMwsUPLRD30OuCuYbXV/I/AuZya5LDlKAU8/gulAOyxLGeDqXxR
 BaTxUjVJW1Jzl6RhoO+Tl+ZJz6+NjCNP2JYm1/QMmARzQCq2lapyo8GT01HkTaG+HO1vNJD8c/
 OXI7FhHzijkqqnpy1mW5Q2hu+TnAwEAAA==
X-Change-ID: 20250321-wip-bl-ad3552r-fixes-4a386944c170
To: =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>, 
 Jonathan Corbet <corbet@lwn.net>, 
 Olivier Moysan <olivier.moysan@foss.st.com>, 
 Michael Hennerich <Michael.Hennerich@analog.com>
Cc: linux-iio@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Angelo Dureghello <adureghello@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2144;
 i=adureghello@baylibre.com; h=from:subject:message-id;
 bh=QPHh8N4sbhjKwZMK7xvZJUBdpo9mG11VcIyhWlrXKk4=;
 b=owGbwMvMwCXGf3bn1e/btlsznlZLYkj/PMn6s0PTYdHJSzQMT5X2HVmyLGTdNxX17+46TRWOz
 je37l63uqOUhUGMi0FWTJGlLjHCJPR2qJTyAsbZMHNYmUCGMHBxCsBEzBwZGaaeZQzKdMqf8ClV
 JEGvZgbz/7ijyXvb76/RkJvapGEk1MbIMONgjRiL7cZXbeY5PQXXeOvMzyWn2/ZHWXkffpxVmtH
 MDQA=
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

 Documentation/iio/ad3552r.rst      |  72 +++++++++++++++++++++
 Documentation/iio/index.rst        |   1 +
 MAINTAINERS                        |   1 +
 drivers/iio/dac/ad3552r-hs.c       | 124 +++++++++++++++++++++++++++++++++++--
 drivers/iio/dac/adi-axi-dac.c      |  54 ++++++++++++++++
 drivers/iio/industrialio-backend.c |  28 +++++++++
 include/linux/iio/backend.h        |   5 ++
 7 files changed, 279 insertions(+), 6 deletions(-)
---
base-commit: eb870a5af7db1e5ca59330875125230b28e630f9
change-id: 20250321-wip-bl-ad3552r-fixes-4a386944c170

Best regards,
-- 
Angelo Dureghello <adureghello@baylibre.com>

