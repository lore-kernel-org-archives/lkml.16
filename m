Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5DB923C512
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 15:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748965405; cv=none; b=Tajk2Hg/fXXk3yyoKTI0VHT03QCv8IsuXHT6/qVpyabNzGW39Q2j5g0NQJcv9Cj6v83dNV1KhteHD3jkfBbQ9emuXXRin+D73KeUyIIiNRWdevwBhqbI9HRnwI3sNH/SYa00GvpXZPWRjr70auYhAFStHz90qcsAXlPAOtTwJdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748965405; c=relaxed/simple;
	bh=aKo9WNWRBL0f8HmrtPSASNW+mdOzeR3AWVqy7W4T820=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HrbuKD7XP/ag8IrUVPvBe8l5qb8GvVw0dArMQr5sXJ1P3ltucSIXPjyL7HuQhJSunUKKNekQxYHrX88CnlDKtghBuwyD4ktVsjCgRZhaR1JfLrUQITvww834bvwk7/bzTNjvrmhdQ3xTGq0y1RMYF7JJ2Kk+8NwXuOj9DK0mgn8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=dn5Lp0bK; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dn5Lp0bK"
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-adb4e36904bso645704466b.1
        for <linux-kernel@vger.kernel.org>; Tue, 03 Jun 2025 08:43:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748965401; x=1749570201; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=;
        b=dn5Lp0bKDGpLka3BIU+PNOMDBTnjqJ6TcNBnKA9IurpOBFORDMHiLUAEjLqZeRP41o
         Zj6fUUGPeYh/id/u7KywDsovgxjJuhM+SeRFTOS8O4uQxx4T9Hlq7teWVVH14RHccAHL
         Od0g948M8zIZEtLNuEnq4tLUr3UNLpSWDqJIA88+8RVqcJ3BHQKCULikJ9jRbpO1AB/i
         HtOz15pKID+N50w7l8dV6YG5ynL9aro1I1VFXxwJgmujgHhpununNuG2C2qiPp0+V61B
         tiJNJoUh9aFI1BU3UEe1qlLuLZqV45Jah85mO1oioqLh4nF77pWv9WH3QWYLQJiBS2j2
         h3yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748965401; x=1749570201;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=172AOsAQz4QlRBaW+nRn36onwnXefgQKgc9WvkOzeXc=;
        b=LBkpvKV+Cxrn/33HZb4bqBQgePL15OSWqxDyEHKzdo1JRjbIBhpB7jOUYXZew5DwCa
         NT07a5fIjCI/oSn6ij+nHTQHRNPDHLBi016fUEwzs0qpHe+e9vR7HeoVotxU9oIfzPn+
         iH8I4l/9mdmUIyHr3fkDy6V5pYpTZ9cvK8l2CbXateO90dlAaazeEzcdF4E1qnmUEcY3
         DaoFVRfxHdYB9FzvpT6n0ow0tmKAm2ApfvjazMHFH+MLAbbkz29QmVX0+ons+RmUA3T5
         wQtj0iEDFjQl3Oa7jj67rhrbKsU1g9rMfnhZIZ1vk5WsHVrP9apVSNg/umnU/T+4bfER
         QFSQ==
X-Forwarded-Encrypted: i=1; AJvYcCWai7an9Cr0UI7tCf57AMBv4dz2fEm2llDv8hXqy6KKxNgyEXMtaDCnvGLBxATQSqQ4msIRrXCnT/e+9CA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVaS6kdQfhSoUGReNj2IkqYEPrepNoN1LchBfKWnhbjDIGHPZ0
	YzrL3XQ/qADnyBvQcpQbueRbaCYPBjJLGko0pDJDU/QcxlQ38p2EDYb4BajUlahkCGw=
X-Gm-Gg: ASbGncs1B+GRy7fOpWeJh5haQboehL3bzYYpYoR255GDjt1KenqqxOBXZnwEk71dTXN
	9AtqoAp7Ij9uJW5SIySbH0aY389r2RJdZ+F2BpFrInAFCd7h9VdTJcdPKg4Sg4i3DV+0j4OEsdE
	ZdSSErreK7oZZqOrulfqSzrH8FCs+iYVBTxwC40cB40Nj2hY1qy6DhvetuoCwEVAqUpbTgofgo7
	Jy5ZhQOmcK5j7U+ScsgqfNGGeMGnInzajUcRhm5l+51B5YYGYBWSock2WZC0rPSUbv2B7Q5TIb0
	ooew+iW/7xWjy0Q/H6cijH9t9bGLwpUbaeAX3PVOIrUEVsZJ3Kj9aT4NFcNzpkNkc1RkmTNZPER
	ARmygeJqcEqzmhm8tzWoG9N+Pz3C1MaFgdoY=
X-Google-Smtp-Source: AGHT+IGloNqlwgmA2JLdwpv1Sfgyhpoy3jA6UsqagxeRD/QCKnQisvHafq6ll76RsV6qpOjXtFvGFg==
X-Received: by 2002:a17:906:478d:b0:ace:5461:81dd with SMTP id a640c23a62f3a-adb36b05802mr1654872166b.3.1748965401077;
        Tue, 03 Jun 2025 08:43:21 -0700 (PDT)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ada5d82de9bsm959277166b.47.2025.06.03.08.43.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Jun 2025 08:43:20 -0700 (PDT)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] clk: samsung: gs101 & exynos850 fixes
Date: Tue, 03 Jun 2025 16:43:18 +0100
Message-Id: <20250603-samsung-clk-fixes-v1-0-49daf1ff4592@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIABYYP2gC/x3LSwqAMAwA0atI1gbqp4heRVzUmtagVmlQBPHuF
 pePYR4QikwCXfZApIuF95BQ5BnY2QRPyFMylKrUShctitnkDB7tuqDjmwRN7fToRl3bpoL0HZH
 +kLZ+eN8PPxlKomMAAAA=
X-Change-ID: 20250519-samsung-clk-fixes-a4f5bfb54c73
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>, 
 Chanwoo Choi <cw00.choi@samsung.com>, Alim Akhtar <alim.akhtar@samsung.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>, 
 stable@vger.kernel.org
X-Mailer: b4 0.14.2

Hi,

The patches fix some errors in the gs101 clock driver as well as a
trivial comment typo in the Exynos E850 clock driver.

Cheers,
Andre

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      clk: samsung: gs101: fix CLK_DOUT_CMU_G3D_BUSD
      clk: samsung: gs101: fix alternate mout_hsi0_usb20_ref parent clock
      clk: samsung: exynos850: fix a comment

 drivers/clk/samsung/clk-exynos850.c | 2 +-
 drivers/clk/samsung/clk-gs101.c     | 4 ++--
 2 files changed, 3 insertions(+), 3 deletions(-)
---
base-commit: a0bea9e39035edc56a994630e6048c8a191a99d8
change-id: 20250519-samsung-clk-fixes-a4f5bfb54c73

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

