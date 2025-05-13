Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2687B244677
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 10:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747131041; cv=none; b=XiZmhZ/A+4ImJoQKkqk78Rosyu6MOV2Q215KmphyaoXT9rRyoUCl3sJfCClAyGPE3i6d8Af3DXdqGtAeCucEfPR0UUGny3328o2l7u9eZt1CV+t8kZ0GoGPAaivcA11c451brPtOOQOmIdkbGwURbWjp4QVUjHemWFX0iIHC26I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747131041; c=relaxed/simple;
	bh=Mw1tyq5QfND79Wb5z/DsSwOKjJVKpecFlRbtqfJOXOk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lG+K14IJ/2HN6QuD36ZvBZAf+63+Ls+AqK1BXLOV9A2vfTK0UktakmVTF8kZSaCmriK0gepQ/bAh3uB/XVPJ6Y+DYsZ0uoYRSRhAdG75srsLEa22WGIsY6n66KacOvT9rA4dx1l3few2bRpb9WOob4ZUHum42YGFvshtx1QrBK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=VDx7BE4d; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VDx7BE4d"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-44069f5f3aaso2724575e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 03:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1747131037; x=1747735837; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=;
        b=VDx7BE4d25GoPG57htCHMt2NOS56aOoS1BWXA+nI8HETUxKnqKXli9m4O/F+RzTAL+
         sfLUi7Jlk1utEzKEwEybm8qGjPjp7triAf+j8jYg2eAT3pWmhod+aQzG3Ozn2BjAi0Cj
         Rhh675b0cJSz+MLv88GrrRGUxgvOS6K3RHdkxIbboOwoPH6QOeOfPRc5Mq7dsTbEtH2o
         ruhdwZLRtfyGiOasRmOiXWmL2os2z9f6/Ouo224SCRoRyUHYwKSbsJiGxsn06JLaSyl9
         EHvqd8GYKdit8VhWatO+VvHagIgkEjKLrL6kP4Ut7XS1PkYoyVqhgNRaHa76GibYvKvl
         eR9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747131037; x=1747735837;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ylae4Ll4XqNmNgm02KxyYLuLgMmXCKZfW750alXaKGY=;
        b=rfanpwtkq7p5Jc0QMv2GwBL2903o1BMAEdgX+ozRSW1co9MUVJxdLnnqHwsWumlN7o
         l9TH7lE225LUzd2GVo573OFHzD+HYIsKu6bb0NV0KM0oY7Qe2jh/gYE2i5wXGCMzbyh2
         4Y6NumVjrGki+2Xf9XO7DCXgM4C5naqmLPnW8mHJywFRW/ZPdTIC/2gRFJXIOImIztj1
         WKeuAReK+QK++5RihYhlUKE+XoOyE+DWF6Ixw/TnmIxZZKwq6gXmLcIptiqwDlfdkomZ
         YDpIdNDZXp2cTB8jwfJG7p+rZByPo+SROOk5kqyotK5ZL6BnA6MiuwXoR7e/V3t1bQVb
         SWpw==
X-Forwarded-Encrypted: i=1; AJvYcCXfDIL69OzFYthBLvf5igsi68KFQIbp+kcKhrP3O2mai64wzDDnfHPPYLDQdUFrKIygEWORad+CaVvV++g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxWfbK7o60x5WGmX6NsXgsht0RBd3HXyLKVRZbvLHW5WKsbWJwD
	8gQm7uTfM0qhoiNdmv0CBZgv/vUw+yxpnJueJC09a6OqJZXf096/jXfTzXsL2T4=
X-Gm-Gg: ASbGncvZU1k6sjkVyGAWnNBN/cG1iB9NKQLet5YBnhQlhnnLOoApjNxqh6PfCaEjBEw
	8avjrGozyCtjlNVbgJTPAOd0Eqa/ukNLsfQ0ajsqydvis93tZeE2qJu45uN8pn+tWWWFNqe8BAc
	fsioIwHDFCIu2mLyvPvZYKRGzW10RgkBNtHMpVlF2kPp/uimWQqE3BWmWSi/yIkdl3H9glmKmri
	/fh9X352rR34RhSiDCZhySvLeAdTqaa/DJs9csjSsypOGkEvYvAtLqhi2OxFkq8QPPst3q43Ua9
	Ea2mn5gaDGKhr8jdPtYcxk2Zps+0mX+D0P6bMUdnCXV/TNnAJc1+bKmDjhttOjDIRaNKD3z7636
	E3jMeNP/jF3aoonDzW2IFh6CE4sKXonHf5SaOTsw=
X-Google-Smtp-Source: AGHT+IG/cZVqXuc+pBf7UL6B8hCIaPUE80iB2obzNalJ0Q7d8K7s5vC7GfG5dhzBEFWg6B/3BfGcWQ==
X-Received: by 2002:a05:600c:4451:b0:43b:c0fa:f9c4 with SMTP id 5b1f17b1804b1-442d6dc7d2dmr55413605e9.4.1747131037326;
        Tue, 13 May 2025 03:10:37 -0700 (PDT)
Received: from kuoka.c.hoisthospitality.com (110.8.30.213.rev.vodafone.pt. [213.30.8.110])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442d67df574sm159683635e9.11.2025.05.13.03.10.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 03:10:36 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Arnd Bergmann <arnd@arndb.de>,
	soc@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [GIT PULL 2/4] arm64: dts: samsung: DTS for v6.16
Date: Tue, 13 May 2025 12:10:23 +0200
Message-ID: <20250513101023.21552-6-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
References: <20250513101023.21552-5-krzysztof.kozlowski@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=3490; i=krzysztof.kozlowski@linaro.org;
 h=from:subject; bh=Mw1tyq5QfND79Wb5z/DsSwOKjJVKpecFlRbtqfJOXOk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBoIxqQiLF8lqPQxiZfFjJOOgAXgivq851DtvWOY
 wVxZ/pDpeKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaCMakAAKCRDBN2bmhouD
 10UlEACKFX9blnyKE3zoty0mjF32nefBZs9EruwNIxVFRMKIsmm2hKzldWArgXhgb6aoVoGIduW
 LQQOvhJn6O+OkpD6yBQIP2oe2XldQYWlTbRoAgSrAUsfRmwHrZnBwdCRnKY6ajkLKzrvOK/KqWs
 oXFFAqVioL5RTPrB7oWsmxOGeybClBjZ6rZmGEegEDoJPUK6ei8ndY1DfUtvsFGqGt8ZdQn5Z20
 Hr5yqbWHhcqhl5PdIMOFWpPq3wR6T3V1PvpS31j42tnnFzedqAKI7dvW4o+vF/qvfP65IowxBiE
 sQzmN4zBdX/4kCZDIIuaeYgIu8vwahq8I5HcMPvwUOfwQZ9UsUDlrZxSUKuvaedmxfKL2wrrCU0
 Xy2LMgTTRml+IaW1VqRnwkBU+VS9xADEQSQsKES1nRAQQZCCQ2rRGvP7oRTEBlXTn+QqBw6zq61
 3PsOUr7ZFy6LC8oRvH+/EE/gj5OVqXCjH8enrQSTZhXdOChXSyTiVnP6fOwFP6gO3bexky6UTFD
 GeKM7Q9KbtLKjzqpbfQF4AUm3Ki4679C8cygq9wTsF4x8avxsifvXzFgmsMxnB25TJnG5vqaYFh
 tdcWVxQ21s7ry/qZahuxUJ7Blz9+l9lpvHWHbAFtwDRRbyoLa0THuU1SdCl3uSr/qZtLpHr/g8f 8SWqs7R+GK6l9UA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/krzk/linux.git tags/samsung-dt64-6.16

for you to fetch changes up to aaf02428fdd50b818c77644bc0b8a0b282ce8ea4:

  arm64: dts: exynos: gs101: add pmu-intr-gen syscon node (2025-05-13 10:02:17 +0200)

----------------------------------------------------------------
Samsung DTS ARM64 changes for v6.16

1. Tesla FSD: Add Ethernet.
2. ExynosAutov920: Add more serial nodes, clock controllers for CPU
   cluster CL0, CL1 and CL2.
3. New Exynos7870 SoC with pretty decent coverage: pin controllers,
   clock controllers, I2C, MMC, serial and USB.  New boards using
   Exynos7870: Samsung Galaxy J7 Prime, Samsung Galaxy A2 Core and
   Samsung Galaxy J6.
4. Google GS101: Add pmu-intr-gen syscon node for proper CPU hotplug.
5. Switch USI (serial engines) nodes to new samsung,mode constant coming
   with DT bindings v6.15-rc1.

----------------------------------------------------------------
Faraz Ata (1):
      arm64: dts: exynos: Add DT node for all UART ports

Ivaylo Ivanov (1):
      arm64: dts: exynos: update all samsung,mode constants

Kaustabh Chakraborty (5):
      dt-bindings: arm: samsung: add compatibles for exynos7870 devices
      arm64: dts: exynos: add initial devicetree support for exynos7870
      arm64: dts: exynos: add initial support for Samsung Galaxy J7 Prime
      arm64: dts: exynos: add initial support for Samsung Galaxy A2 Core
      arm64: dts: exynos: add initial support for Samsung Galaxy J6

Peter Griffin (1):
      arm64: dts: exynos: gs101: add pmu-intr-gen syscon node

Shin Son (2):
      arm64: dts: exynosautov920: add cpucl0 clock DT nodes
      arm64: dts: exynosautov920: add cpucl1/2 clock DT nodes

Swathi K S (2):
      arm64: dts: fsd: Add Ethernet support for FSYS0 Block of FSD SoC
      arm64: dts: fsd: Add Ethernet support for PERIC Block of FSD SoC

 .../bindings/arm/samsung/samsung-boards.yaml       |    8 +
 arch/arm64/boot/dts/exynos/Makefile                |    3 +
 .../arm64/boot/dts/exynos/exynos7870-a2corelte.dts |  630 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts    |  613 ++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts |  662 +++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi | 1021 ++++++++++++++++++++
 arch/arm64/boot/dts/exynos/exynos7870.dtsi         |  712 ++++++++++++++
 arch/arm64/boot/dts/exynos/exynos850.dtsi          |   14 +-
 arch/arm64/boot/dts/exynos/exynosautov9.dtsi       |   48 +-
 arch/arm64/boot/dts/exynos/exynosautov920.dtsi     |  536 +++++++++-
 .../boot/dts/exynos/google/gs101-pixel-common.dtsi |    4 +-
 arch/arm64/boot/dts/exynos/google/gs101.dtsi       |    8 +-
 arch/arm64/boot/dts/tesla/fsd-evb.dts              |   20 +
 arch/arm64/boot/dts/tesla/fsd-pinctrl.dtsi         |  112 +++
 arch/arm64/boot/dts/tesla/fsd.dtsi                 |   50 +
 15 files changed, 4406 insertions(+), 35 deletions(-)
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-a2corelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-j6lte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-on7xelte.dts
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/exynos/exynos7870.dtsi
