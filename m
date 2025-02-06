Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3943C22D4C8
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738847303; cv=none; b=CY2R54aZJ1aKzzRVbOrvc6PlnFcTGKt6+aiAy44/pQpBOqwsNsNijtBdMt7S0jxE713Bk0nfLz90Ar7eVJwaVQqOn9JMUjI54mnjEGmpgefufRjI2A9HAyETp1R/qAfgDYpc94C+D5J+qydw9e/nxjV6rTL56AghcxBVbbPMPiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738847303; c=relaxed/simple;
	bh=XgoQ89NLlToDu6WIUhA5TGdMOBSSYefS3ZZviogfjHo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mqMNv+arAnGz2opdBhGOzDofIMEzBqBKyKFfRWeypUSukfphniKmf4oXddiZNzu9x7bE2OzEaiJrlaWoYCfY/2H3Y3CVC1qsGDtUpCEoVzax5cSLyi/WYX1GQBw5SoeFPxLkLc0UJuGOIq/Nxww/bfIZOILjzxayLy5VfpdFIIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=zClau+nW; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="zClau+nW"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5de34b72ce8so535992a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:08:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1738847299; x=1739452099; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=;
        b=zClau+nWlFAcu2o1PC1sLaGRjHtTGcJeaIePsK2uFfnyfe8H9yZ7+MByFVPdOQ+jbY
         NjpraJeZrb/U5svaCi9Qxf0LdatnSyNVURaaPVj7WBNVZqL39pDyXLHmEUynF/ylxBwv
         e1VBMDVq0nOuWmHEr9LhlmC2l79s/ggyarf1ZR4hO4kftDCAFCu7roK2ePtrZO/iLlNn
         VfvbD5PKUhnHR+WBtxlAOo7AeLXibtSy/Jme7wHNm8mhSvDVfrDaVZGkNJF76roWNfHk
         uch7wZBz8p6oFiUU51jzmSX6qwJlSgeHuFdzH3k43oz0A7P3QP2mNXLL9kYU4FKNqsy2
         4jYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738847299; x=1739452099;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CC73hfx/xdEwQzx0mqhvPJwAxj42f8+ghz1yMlEDxZ8=;
        b=VSRuvHWfxN9g8TYoenRC9rQLMUU5rgsUwhj/Qq6sNNx8kYnXnHUifW/UOLi3h1Xmh3
         7Tc8m43aRiZsqYIJv6bwxOE8BSrr8W4y/zw/AFsbqAPMwBZZkPkLVPl8/SYQvNzvZgIT
         TocJ1qKeF16NhhDhn8rRG8s9xpakZIR8EFqXro0vcQEqXZynxQBBLlrd7aqY9XP/K3zx
         k4PaqnFdp166TRCm76T7DLHd+sKbVUm0a3v0tlfdO7fPsQjNLOFVGFc8pYvm6xdMBldk
         Q1Ny5lheSFY7eTvckbDftVY+icGtS5NY/kBaFW3ehNAm9w4Bk5whHy2PYS3htQwTXbHq
         N5Jg==
X-Forwarded-Encrypted: i=1; AJvYcCWzOW0OXuXkM+iaQ0zZJdvGYL381ONHOG1f3WlwJMYfjhfdVYgbN6+xxQ4q4Nsfca1A2neWeHtITmgituM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyrBfFkEvTCbi1VcQAP3Oh9oq2hOBFLwvli27O9sdrDqv+Oak0r
	+EfVuJTpY9cIzHZw0a3+N+sa8Dcy5cTjv96kw+QR01+HQx/EuNq2fkiO1ic6Y+7XHNqXc/ypQ6m
	DLKws0A==
X-Gm-Gg: ASbGncv8UhvksRiRbeNaYW04g+LAS9gRH6YQ0RxDgagJBlGlOLXpzCwxxex5NFqqJmG
	40pJdkhZqVNMQ4o8U4cBcSI6k8mH6sz/X11g9XMAz9MTk28+wdnVeuFhUGX7vCwxuiahq/TFiue
	jMsBgXXNZDu4BEyZvUcqXqVczxRkoF5Y6rQ3oG+AEuiEAJtj09nFs3I6tSEYFHDDWY8jCI1QRWT
	yg5OlLR5bdoOyr07p1tU7dKUxs4kUPQaN58jmlz1/P0KtZ8QWQ3gdMFYAB9mFiej5aNXRrS+Gow
	Cfwdu6oh/IIcChIMs9NVaPazZhhj91DoWmuYRepaPbyc+JBYfWE30blHHqYZXSrEU0dk9FcFurM
	=
X-Google-Smtp-Source: AGHT+IGHBChEeQbZZWdB6VUb2tAPzM2QubPuRCkq9llaK78PumUt20gOs9+K10OlU484h2rpI5M7EQ==
X-Received: by 2002:a05:6402:27c8:b0:5d9:f5c4:a227 with SMTP id 4fb4d7f45d1cf-5dcdb778e7emr7219614a12.20.1738847299436;
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
Received: from puffmais.c.googlers.com (140.20.91.34.bc.googleusercontent.com. [34.91.20.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5dcf1b73f8csm830235a12.8.2025.02.06.05.08.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 05:08:19 -0800 (PST)
From: =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Subject: [PATCH 0/3] gs101 reboot updates (DT)
Date: Thu, 06 Feb 2025 13:08:17 +0000
Message-Id: <20250206-gs101-renppt-dts-v1-0-cdfe993fb3c5@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAEG0pGcC/x3MQQqAIBBA0avErBtQKamuEi00x5qNiRMRRHdPW
 r7F/w8IFSaBqXmg0MXCR6rQbQPr7tJGyKEajDK9MsriJlppLJRyPjGcgqsfnLc+WjN2ULNcKPL
 9L+flfT+SZeZYYgAAAA==
To: Peter Griffin <peter.griffin@linaro.org>, 
 Tudor Ambarus <tudor.ambarus@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Will McVicker <willmcvicker@google.com>, kernel-team@android.com, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
X-Mailer: b4 0.13.0

Hi,

These patches update some of gs101's reboot / power off requests to
bring them in line with downstream / bootloader / EL3 monitor
expectations.

In particular:
* an unnecessary property is removed from the DT
* the reboot / shutdown SMC calls are aligned with downstream now
* we now implement the requested boot mode as a notification for the
  boot loader 

Cheers,
Andre'

Signed-off-by: André Draszik <andre.draszik@linaro.org>
---
André Draszik (3):
      arm64: dts: exynos: gs101: drop explicit regmap from reboot nodes
      arm64: dts: exynos: gs101: align reboot and poweroff writes with downstream
      arm64: dts: exynos: gs101: add reboot-mode support (SYSIP_DAT0)

 arch/arm64/boot/dts/exynos/google/gs101.dtsi | 19 +++++++++++++++----
 1 file changed, 15 insertions(+), 4 deletions(-)
---
base-commit: 808eb958781e4ebb6e9c0962af2e856767e20f45
change-id: 20250206-gs101-renppt-dts-cb8ab6bf6294

Best regards,
-- 
André Draszik <andre.draszik@linaro.org>

