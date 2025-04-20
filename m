Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78D6C1D63C7
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 07:05:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745132757; cv=none; b=ESJlaZBiUsCTK9Vk4EGHnIN1detrFHByWxKfIAYjy4Pfv/RZRDvwamGrmq0VKEaGGrmjoYrn8P3uypIJw3O5yRdMuZEdIrN1o5WU5JZT3YzKbZY1/SN36tYjOnGI+rKvX2Bi98p+6TTE64oS3FoZ7xf76ZZB7uqTTVqg94W4Nz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745132757; c=relaxed/simple;
	bh=naU+Nm6I+OWCRU692DlZpNGwp9uIvhKLLXB6jext1Rs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BYBGKeOVyY/V8D+azyL3ItHJB7y/R/B/h31in18VZdd4cXaWTfXonq5ZzCDCa1cMGHzUS4pinqyx34lkU3hj8lXZN26RbSJ/4/jyz65yqGt/QsCHlYfZKUMO8K8yWMBcSETKVgpCbt3XmUlcoWou4KsyQV2KxGBNR1+bP7hUhmk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=ds6SLhtd; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="ds6SLhtd"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-736b0c68092so2505823b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 00:05:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1745132755; x=1745737555; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=82p2hGF43l3nHL3xd1lQgBU5B0CP4KmhX25rKqULFWk=;
        b=ds6SLhtdBs+dZkHyP321JSs2pMtIxje9edOKxL9iI9qIzVqUAoKUgNHT2MmxQ0CgDr
         VxvmJv8pmofcIUwEm0TlBIztezhIYlJVtFyQHBywgirmClymDz1W+CWhXgNdluj+T2eT
         P5p+e5yjQuO0kWKxAetx7Yy8IGOJyHR+CdItp7HL0UdJilRLrBfGL1LXUCy9tuQFWR32
         2ajZ24KKkcPqeklJ0o0lhG8WrJ3/EnAqkdppowt15K81O6hOeo4TDILAjJc18hywZa7j
         gyjbV0NSNpb9F28qadAvk4wzMvX61izXVuJvblroSwUIXDYcTNCaqnIKmMS5HgdVnWE1
         +2mg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745132755; x=1745737555;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=82p2hGF43l3nHL3xd1lQgBU5B0CP4KmhX25rKqULFWk=;
        b=eEkHqYdK0Stv1KrOgr9O0fkTeL1dLyvYFX5EySVU7ki6ldcaOHhXWP3veQpziv2NG6
         JbSukoN68RTPGLPz3vyubOtCKFvPCkpK2TGKY4bt/EJ9Ak37zHzQjXjti1in70bseBr6
         D7pL0UzAyrNvSeQs2/o61ztO5iWmp70JJtLkW76XG0Hosvrr43WLh4XBA23AsqVBThEv
         ZzkI2ZXwU2bbeKW4tevHCBLnXePKsKx7sv2gZK35GDs1oa8Be/8eats+dLKaHPNQO68U
         yYzimZV+rHWvNETFTVxg/WyaUdfn1dMCunvPF6gHGawfcn2aFs1y5959U+zfrKH1nNZf
         j9fA==
X-Forwarded-Encrypted: i=1; AJvYcCX5l/xgltMZlEAX/hTnQGIA+453f0mY4BuQAccZJgV86Gz+28KiMtTxfHCsOFxBXSdbc47Cp2Wn1/OlMaE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26NEtc6h9IsWcH+qGjw3wNRrOexZDUJGOc5P/EOVQ8aDg936D
	Kk8UNUlRbXKQTgkXFJCQ0KT2H+TozbicWwutHKkCO8K1kbTDbnKVv9Ujeqiqa8wigrrpyeUYWsZ
	J020=
X-Gm-Gg: ASbGncuOZIzUfq/H3wCp8zSWAmAC02hE2mHKOhmUshXBa9+0GtpvRkiYHJ2YjuyjIu2
	TZWEGulA9p++rMYX6itoADO5lFREZSEh8kuViilmK2nZC4O5CP2SRMwEPgVBbXWBb7xSOS+v934
	VDWmaDpQWLwbDC652ZZ7v3uMP+MXxVJ6NGLBmiIP+n2H3lMUwx6NpxbBZDAUlFn22zcAxSRxQBh
	oC5G+guPmRD/4gFYE7TBqYVb66ayS0UO9qbegsFCiadtEpwZIqU4lQqdOXjELNwstxkPFyZY1i7
	+sHVqXICIoiuXDp+UvYXvcgk1y3Vig==
X-Google-Smtp-Source: AGHT+IGlKkNRMGUbwKmTBceKff072Fm/DzOacdnjFvDMw7BvjtUfzlAQ7rY/VZVOV3UNRwKeqrDsWw==
X-Received: by 2002:a05:6a20:6f92:b0:1f3:4427:74ae with SMTP id adf61e73a8af0-203cbc75495mr11575555637.25.1745132754866;
        Sun, 20 Apr 2025 00:05:54 -0700 (PDT)
Received: from localhost.localdomain ([2a11:3:200::40b3])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b0db12743afsm3742626a12.16.2025.04.20.00.05.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 00:05:54 -0700 (PDT)
From: Guodong Xu <guodong@riscstar.com>
To: ukleinek@kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org,
	p.zabel@pengutronix.de,
	drew@pdp7.com,
	inochiama@gmail.com,
	geert+renesas@glider.be,
	heylenay@4d2.org,
	tglx@linutronix.de,
	hal.feng@starfivetech.com,
	unicorn_wang@outlook.com,
	duje.mihanovic@skole.hr
Cc: elder@riscstar.com,
	linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	guodong@riscstar.com
Subject: [PATCH v2 5/6] pwm: Kconfig: add depends on ARCH_SPACEMIT to PWM_PXA
Date: Sun, 20 Apr 2025 15:02:50 +0800
Message-ID: <20250420070251.378950-6-guodong@riscstar.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250420070251.378950-1-guodong@riscstar.com>
References: <20250420070251.378950-1-guodong@riscstar.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The SpacemiT K1 SoC uses PWM_PXA driver.

Update the Kconfig file for the PWM_PXA driver to allow
the SpacemiT K1 SoC to use it.

Signed-off-by: Guodong Xu <guodong@riscstar.com>
---
v2: No change

 drivers/pwm/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pwm/Kconfig b/drivers/pwm/Kconfig
index 4731d5b90d7e..6731669e724e 100644
--- a/drivers/pwm/Kconfig
+++ b/drivers/pwm/Kconfig
@@ -493,7 +493,7 @@ config PWM_PCA9685
 
 config PWM_PXA
 	tristate "PXA PWM support"
-	depends on ARCH_PXA || ARCH_MMP || COMPILE_TEST
+	depends on ARCH_PXA || ARCH_MMP || ARCH_SPACEMIT || COMPILE_TEST
 	depends on HAS_IOMEM
 	help
 	  Generic PWM framework driver for PXA.
-- 
2.43.0

