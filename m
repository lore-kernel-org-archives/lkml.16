Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59CC11C6FFF;
	Thu,  6 Feb 2025 14:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738850520; cv=none; b=eKBNruVQe9Ysbn1L3OBfVzqGi/JFcJ23pqKd8RxMlL49wRC9rT7pdPHy8e96S+WwDgoru/hDobAFA2myEuHPO41aczoJF07vpP4iooyzQmeusmiUq1qOSWaF/xo9O37978rrGrCuWf0Ga19moKo87Y6k84qIzaqFW6G4WMtVB28=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738850520; c=relaxed/simple;
	bh=4irXlDLhVC3QMn3aym/cMiuL941aNfnp/WLK9ZuODjA=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ZzqIvUzECyytdrWXkCuPY7NSh/ShqkPvnCHrMQJW6RNzBzIcAchpEdndO6CxF4nEmFvhrPmaqG+Z8s4S8zTohCO6yQZw8wBrNTQX9N67HSQk8mYXCRib83VkDhQEkpA4CgaRN8epBJ7nNzdlXBSGMNXeWJVKik9E3AB/RcmXRYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CcZ03hjB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CcZ03hjB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id BD1C5C4CEDD;
	Thu,  6 Feb 2025 14:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738850519;
	bh=4irXlDLhVC3QMn3aym/cMiuL941aNfnp/WLK9ZuODjA=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CcZ03hjBjak7bZxyVTic+/H/Nisa6/fOiXoCYGVahK7YBrANJAcNCnhddjQGvjVAj
	 A1HAizaI8kOCUuXFEzkAbopqzxSwCa2hMCmu8P/uqIeO8MnozYzB3VnQ7ESKTh3VOv
	 i2TnxvwFsnseHfc4QIMMmeyLEIorD5CD9GBgRGFSjBBwwVf0tuubWV4L6m/VdohT+6
	 bbHRReTr0ugMQcqjGTEaeBuIIef6IrfCTLpKiVsK4qIew1Ed3i+cQr56BtHqX9B9EN
	 JSwwBFobh6II8stN7KwO1u++46GSFfl2HiHjS0gR4X4swdC+oyiVB64nshc0dPCNMm
	 OQokEvhmWoaYA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1202C02194;
	Thu,  6 Feb 2025 14:01:59 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Subject: [PATCH v6 0/5] Driver for pre-DCP apple display controller.
Date: Thu, 06 Feb 2025 15:01:53 +0100
Message-Id: <20250206-adpdrm-v6-0-c8ab9348b853@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANHApGcC/2XOTWrDMBCG4asErauiGf3Yk1XvEbqQpVEiqOMgF
 5MSfPfKgTrGXX6Dnhc9xMgl8yiOh4coPOUxD9c63NtBhIu/nlnmWLdAhQYAjfTxFksv0abAOsb
 WNyDq41vhlO/P0Omz7ksev4fy8+xOsFz/JSaQSmogiC07NuQ/zr3PX+9h6MWSmHDL3MqwskDKt
 FZrFxTtmf5jVlW3Mr0w15gYgJJv0p6ZLXt90lTG1Fl0ymtKsGf2xVDZldnKDBsO1FDXJdyyeZ5
 /AVnP2It4AQAA
X-Change-ID: 20241124-adpdrm-25fce3dd8a71
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, asahi@lists.linux.dev, 
 Janne Grunau <j@jannau.net>
Cc: linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Alyssa Ross <hi@alyssa.is>, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Nick Chan <towinchenmi@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738850518; l=2696;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=4irXlDLhVC3QMn3aym/cMiuL941aNfnp/WLK9ZuODjA=;
 b=6fqfcf9ZP7jYCkNGzpNzK2J5tDuJ1uL7S6GfMocw05IQJYmp1vpGqlyKaHUjAcg/6Hgvfqgal
 vgupf/TWWTrBfYCQmvKRZ0qsBBhIzRzpVkWTju7MReSFyvdLHKLerQs
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
Reply-To: fnkl.kernel@gmail.com

Hi.

This patch series adds support for a secondary display controller
present on Apple M1/M2 chips and used to drive the display of the
"touchbar" touch panel present on those. 

Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
Changes in v6:
- Use the drm_connector_helper_get_modes_fixed helper.
- Split out into a separate MAINTAINERS entry
- Link to v5: https://lore.kernel.org/r/20250205-adpdrm-v5-0-4e4ec979bbf2@gmail.com

Changes in v5:
- Moved to using the component framework.
- Other lifetime fixes
- Link to v4: https://lore.kernel.org/r/20250114-adpdrm-v4-0-e9b5260a39f1@gmail.com

Changes in v4:
- Fixed dt bindings.
- Link to v3: https://lore.kernel.org/r/20250112-adpdrm-v3-0-c674dc19fa7f@gmail.com

Changes in v3:
- Fixed building as module after splitting out mipi block
- Addressing the review feedback.
- Link to v2: https://lore.kernel.org/r/20241126-adpdrm-v2-0-c90485336c09@gmail.com

Changes in v2:
- Addressing the review feedback.
- Split out the mipi part of the display controller into a separate device
- Link to v1: https://lore.kernel.org/r/20241124-adpdrm-v1-0-3191d8e6e49a@gmail.com

---
Sasha Finkelstein (5):
      dt-bindings: display: Add Apple pre-DCP display controller
      drm: adp: Add Apple Display Pipe driver
      drm: panel: Add a panel driver for the Summit display
      arm64: dts: apple: Add touchbar screen nodes
      MAINTAINERS: Add entries for touchbar display driver

 .../display/apple,h7-display-pipe-mipi.yaml        |  83 +++
 .../bindings/display/apple,h7-display-pipe.yaml    |  88 +++
 .../bindings/display/panel/apple,summit.yaml       |  58 ++
 MAINTAINERS                                        |  16 +
 arch/arm64/boot/dts/apple/t8103-j293.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8103.dtsi               |  61 ++
 arch/arm64/boot/dts/apple/t8112-j493.dts           |  31 ++
 arch/arm64/boot/dts/apple/t8112.dtsi               |  61 ++
 drivers/gpu/drm/Kconfig                            |   2 +
 drivers/gpu/drm/Makefile                           |   1 +
 drivers/gpu/drm/adp/Kconfig                        |  17 +
 drivers/gpu/drm/adp/Makefile                       |   5 +
 drivers/gpu/drm/adp/adp-mipi.c                     | 276 +++++++++
 drivers/gpu/drm/adp/adp_drv.c                      | 617 +++++++++++++++++++++
 drivers/gpu/drm/panel/Kconfig                      |   9 +
 drivers/gpu/drm/panel/Makefile                     |   1 +
 drivers/gpu/drm/panel/panel-summit.c               | 132 +++++
 17 files changed, 1489 insertions(+)
---
base-commit: b62cef9a5c673f1b8083159f5dc03c1c5daced2f
change-id: 20241124-adpdrm-25fce3dd8a71


