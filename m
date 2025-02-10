Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7574B26460C
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 23:16:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739229382; cv=none; b=B59APT6pRgvrx7ASup5M/w3xDzvz4Iktrh47koKdFUz/PMHxcQCjclB1EUERmmRQ8aqA5D7a5v8z63Bx1DdCwZsQrE+oN+ZWOJ4LFzCS/Au7mzpLOy8R/emiTJK4Hlv8mui0qf4ooV3broxT880mSE8xoO1j8dPXxeOY0xJ957s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739229382; c=relaxed/simple;
	bh=NUApKyScjyNwhZt7QISmRvCwSkmNuMrMeDDGrzDTJE0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=pKsR3i2Nu0bnwsbb8djy4KqhBM82+bHjCFrKKikkMw8T1/020B8S1xMcV7YEl680DetHMw4HcCeO1kk16PScUIy6gutmn9X9YbBlqHKTWJRNmTcrArdmB9YQ2+kB1biGcGOJKPy+NCna8CLh85XVYeu4L/PYv74Tb83uGRj42Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=TI8M4e5V; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="TI8M4e5V"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-5fa2a2bdde9so1330117eaf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739229378; x=1739834178; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zOTiC9N25oxSFn8PJurmN+X05adw39aPm32FGiYhCiI=;
        b=TI8M4e5VjtidvaV7h9z0OgQwBgGfq01PiIMPInWVy2sexE5/772Y+xAJsgvqPQ9YWB
         B691eb9ytdvzwAms1p4bG2bD4kT91+Q7ANvdMy4N5VXEeeP8Rc854kWi+V+qUwAkWCyq
         +3zghMOn8cU4gbMxCuGOJEf2JQKKKitjqC5ThpTZOE5UX/C4uQ7U4earKKhJXJYpwnJn
         y7rv2TBZAbb61I4zbD1jWGqOIyhW3s32sTq4HWh59ZO5Q+4J9KSj/Q8A7PZlygXahDN4
         hZogLhb2HZitohrSEHKVJsAQRKLVXrIk96L9I45+c/IkO62MLoR4J43NwxyMVooZOvlL
         1PEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739229378; x=1739834178;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zOTiC9N25oxSFn8PJurmN+X05adw39aPm32FGiYhCiI=;
        b=W5CMKdiMo2E1677IyDqWBVY/0efut3bcqDo8BKC/6ixAHQJei4h2/qDtPlFK5hSmNt
         Ua2eTn6kK7z+/87NS9TPhAV4g70SgLP25HWjTAwkFU8N2W27l6nRskrpJdlh9pE8mtxG
         0er2kcAeZ8hmBJ1T3POKQOhLynJRg0vUoV24IJ5wykOFumuABImFnECexAgIOLJUTU+/
         Ars/JDnOsoxcAkhDNuBRkTezsSXkIMwe8BteU906OvE6UJ4Mnhhe2iMl64+Hmr4ispT3
         ZkOrgq7EVntGglqqRrrRxnMAcvv12Vjj0fmqCU5UuOJTGyQHOwwvzGOR8hqDboQvUlGy
         DbOA==
X-Forwarded-Encrypted: i=1; AJvYcCXogRe9zJtwyAnjU0OyPcBr+wxUrHrteSMnAbekes7Sr7ielbgsDiTViV5ZDT3dEk/NVVaDI3AklM5i6F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbpjgAo90sv86fFDbA9dv0a+hDL4cPdA5rPfzmrdhrL5OKP59p
	xaNOzTslaUaUWUYAwN7pEy0mdzYlYDmmBQ5VxnaWrcxRt3ipowIFR2pTBs1WeXRowAT+s1ZaTye
	c
X-Gm-Gg: ASbGncv5fiYFaQKsWhctCNxGDrr6h3T27U3KzLZ0SPfiKDOHWhAoOYI/Tax9pCvBzYZ
	saOjWqELSH6VnGyJu4KrHQAgCeM3RnbR4DGrupcBxqlUQt1BHOydVN0Z4A0USXo7SzC5cPOBenQ
	VDAkPTXN+PliONzK/YuRbbXHtvIwJFxfdRqJTXpL/AHbyTYi0sNWP1lX1kSihbX2Ba7kWSAVcCV
	zPoxBvC9xrz1NUEJ4smEFYyrNsX4Rd3oHb2oO5lGO/JeH4ufS6Hl1xoHJ+dXzLb2eDlqtUGvUZQ
	1zQ9wC/8OabugaVJcwx97jdUOZ4h+hBzxSRJskeYb/vFOqE=
X-Google-Smtp-Source: AGHT+IH5xNEjbl5fvc3vvYa7TyhbGhLexFzpDFKP8guUzeJDkdNhhSooVjDClNMHdacLxvGBKWPMkQ==
X-Received: by 2002:a05:6820:1787:b0:5fc:9430:d747 with SMTP id 006d021491bc7-5fc9430de7emr1578893eaf.1.1739229378396;
        Mon, 10 Feb 2025 15:16:18 -0800 (PST)
Received: from [127.0.1.1] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-5fc545bc40esm2758043eaf.29.2025.02.10.15.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 15:16:17 -0800 (PST)
From: David Lechner <dlechner@baylibre.com>
Subject: [PATCH 0/2] spi: offload: extra headers
Date: Mon, 10 Feb 2025 17:16:13 -0600
Message-Id: <20250210-spi-offload-extra-headers-v1-0-0f3356362254@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAL2IqmcC/x3MQQqDMBBG4avIrDuQRCzVq5QuovlTB8TITBFBv
 Luhy2/x3kkGFRgNzUmKXUzKWuEfDU1zXL9gSdUUXOhc8I5tEy45LyUmxvHTyDNighq/niNC3/s
 2o6Pab4osx//9/lzXDSk7Kn1rAAAA
X-Change-ID: 20250210-spi-offload-extra-headers-86be29913fe5
To: Mark Brown <broonie@kernel.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org, 
 David Lechner <dlechner@baylibre.com>, 
 Andy Shevchenko <andriy.shevchenko@intel.com>
X-Mailer: b4 0.14.2

Following up from some late feedback, a couple patches adding extra
headers to a few SPI offload files.

Signed-off-by: David Lechner <dlechner@baylibre.com>
---
David Lechner (2):
      spi: offload: types: include linux/bits.h
      spi: spi-offload-trigger-pwm: add extra headers

 drivers/spi/spi-offload-trigger-pwm.c | 9 ++++++++-
 include/linux/spi/offload/types.h     | 1 +
 2 files changed, 9 insertions(+), 1 deletion(-)
---
base-commit: d15cc2db846f73920688c045be6b4c782b68d058
change-id: 20250210-spi-offload-extra-headers-86be29913fe5

Best regards,
-- 
David Lechner <dlechner@baylibre.com>

