Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2149218A6AE
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:48:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748342942; cv=none; b=VYC0Lu1z5WwwFrpOsCEGvpXJR0D5yalMmjAhhZvkw5MNs2bllrKt79C2B8q6JD6JySZ7Xi3QlZuH0eWYDfNLzdU1PJfUdOLePKSZbQRtOIKqVtEpKq78yjG8FycH1jwcOdeX6hAfPeHreozmH+S7cg61Om9R3R2fJT10aVO0aR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748342942; c=relaxed/simple;
	bh=rT3q0/T/n/OdvtUzIiOBBIlKN3tNijY7T1rLOkW+cJE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PgJuzHEQ1UuqfqQE2Wgdsr8jz2mEktfMsXcNbVnk7zCVCWMla7whtGaBGMZc1pZMxZ+x4ynr+9yhfIRiAzJEibMM7QBG7RlNLddcLLoiJlMkctAWHPfcccvLeKLdNTlB7/mOlI0/055yPapg5VAp+s9e6eqJ7sZKuEmYFa/iSL0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=NPZIf2Pr; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="NPZIf2Pr"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-54afb5fcebaso4067538e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 03:48:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1748342938; x=1748947738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=9vKSPPco8uaYslgb3qMpB6uZMQh78r5qUBilSeR1pXE=;
        b=NPZIf2PrvkpDNdTkUIqrut2Ru31geLumiZl7kyegRCZl9nnPkJEZNvXOkwkZ6yGDSg
         EdbWs/Ggzh8gyc5Z88xQUbMg+MVcobfX5jGPNR29r+WaIjM6cEKq1PBRPf/b3CP3y/yY
         Qi8gGmQti5XBazufep4U9Uk+udoPGJvoFm01y/+GfKwqVVn8xGbZq/wj/yg3+fLEMHtp
         YWhc85/B33j5c6h0w3JEfRmP7Jd4sxegT0SohBS4pnErbcDd/uMSx39FWj6++YxieBGx
         3ALxrPjFFPwk23KZEJ26J2i+LxvgS8pMi32AxR6p2lzOZV7RSwRZ13e0SgBOF6THJtJp
         BOHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748342938; x=1748947738;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9vKSPPco8uaYslgb3qMpB6uZMQh78r5qUBilSeR1pXE=;
        b=foINuPAg/DPPIxzSQ1PEA4gp33TBBDtCWDVhf8QD157P1/lE9zCONqvOmJKHHOK8hz
         CcbebelhRlZO5AI7Won9kGsy31tx17vmFPD+XZ9+3BdqmnCUkxYCbIVkyEY5uo8iaXon
         iJ1Zp1dE3qK8L7E/tRWssomm2FqekHhjLSJFTUrHMDqpZv502HlR7pd5swbT9d8//Obz
         XZwJytpbkrQXTvtzW++NZX1pgC3cvfcxH5RZW70yJBViuTeyrGgzP813Jg6Oh9TBMauz
         X9V4lJXoEqe3d7Q5NGPzSUu2uUmH645s/WQcJXrmnE6vmeSAIyEkh4Pvxekx0KpfDmbt
         Scag==
X-Forwarded-Encrypted: i=1; AJvYcCVz1VKJvwZUfR9PbvO0Vw55KZpYlKo8BofqhOuOc/rC2CrtvcFqK6Xie8kJaJ5C/ImbKm7AL8/CYKkazIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwztswMWvqFbKEbrz80NWeGkFYdBfMjClW022t/yGSyvJTIF5Uf
	9ud7EGcmlSE6z5+Hao+yW/R6Mrjgfd0UGzdNYPkCIU/tNLUdtXKG1fRsr6rIGWKcvXY=
X-Gm-Gg: ASbGncu6P/1l7Gxl2aPChXPGe55MHjrP7zYgypNbuhmtCXNO1oUua6+8jetIQfRVYZ8
	KyHH+v5ZKwzY9BBWie76goVxkxbbjd6uXvygYpSrXuc+m2i+hh67E1XasfZFVPwWD+k9USge7hQ
	cHUxkmcfRB8+0ymEkJf8h4by3hLbqnA4IM6eJmzvAo8RL1Qc/nt4HqW1z8byfSLGWucr8LPpKaf
	dtRiPaxbQcBR28a9WVV81jnHyVjZQnR/C3xs7zz0E1idXDTXvh4hUv0slLFq/e6yJImzcKHhkXo
	8elpFExDentMuLmF6751yXagCRpVOVYxoI1LKXLtl14p07ceC/l2f7ysJALkI3bVgeb+YIvcpjj
	QXKu38ASicpYTz1lEBkdqZDYwfA==
X-Google-Smtp-Source: AGHT+IE9g01utC6Y6xeS//vjJ++/Yn75a8WpLtE+4tobVTnoaHBMkS9DP3t1Hn0PzpUeqXgyM5sSjw==
X-Received: by 2002:a05:651c:146d:b0:30b:b7c3:949a with SMTP id 38308e7fff4ca-3295b9f26cfmr30739661fa.18.1748342938112;
        Tue, 27 May 2025 03:48:58 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32a6cf9c68dsm2674441fa.58.2025.05.27.03.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 03:48:57 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Linus <torvalds@linux-foundation.org>,
	linux-pm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] pmdomain/cpuidle-psci updates for v6.16
Date: Tue, 27 May 2025 12:48:56 +0200
Message-ID: <20250527104856.206797-1-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus,

Here's the pull-request with pmdomain and cpuidle-psci updates for v6.16.
Details about the highlights are as usual found in the signed tag.

Please pull this in!

Kind regards
Ulf Hansson


The following changes since commit 0f5757667ec0aaf2456c3b76fcf0c6c3ea3591fe:

  pmdomain: core: Fix error checking in genpd_dev_pm_attach_by_id() (2025-05-08 13:29:30 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm.git tags/pmdomain-v6.16

for you to fetch changes up to 36795548dcc841c73f03793ed6cf741a88130922:

  pmdomain: ti: Fix STANDBY handling of PER power domain (2025-05-19 16:11:05 +0200)

----------------------------------------------------------------
pmdomain core:
 - Add residency reflection for domain-idlestates to debugfs
 - Add genpd helper to correct the usage/rejected counters

pmdomain providers:
 - mediatek: Add support for Dimensity 1200 MT6893
 - qcom: Add support for SM4450 power domains
 - rockchip: Add support for RK3562 SoC
 - sunxi: Add support for Allwinner H6/H616 PRCM PPU
 - ti: Fix STANDBY handling of OMAP2+ PER power domain

cpuidle-psci:
 - Correct the domain-idlestate statistics in debugfs

----------------------------------------------------------------
Ajit Pandey (2):
      dt-bindings: power: qcom,rpmpd: Add SM4450 compatible
      pmdomain: qcom: rpmhpd: Add SM4450 power domains

Andre Przywara (2):
      dt-bindings: power: Add Allwinner H6/H616 PRCM PPU
      pmdomain: sunxi: add H6 PRCM PPU driver

AngeloGioacchino Del Regno (3):
      dt-bindings: power: mediatek: Support Dimensity 1200 MT6893 MTCMOS
      pmdomain: mediatek: Bump maximum bus protect data array elements
      pmdomain: mediatek: Add support for Dimensity 1200 MT6893

Chen-Yu Tsai (1):
      pmdomain: mediatek: Add error messages for missing regmaps

Christophe JAILLET (1):
      pmdomain: amlogic: Constify some structures

Finley Xiao (2):
      dt-bindings: power: rockchip: Add support for RK3562 SoC
      pmdomain: rockchip: Add support for RK3562 SoC

Krzysztof Kozlowski (1):
      pmdomain: arm: Do not enable by default during compile testing

Stefan Wahren (1):
      pmdomain: bcm: bcm2835-power: Use devm_clk_get_optional

Sukrut Bellary (1):
      pmdomain: ti: Fix STANDBY handling of PER power domain

Ulf Hansson (15):
      pmdomain: core: Add genpd helper to correct the usage/rejected counters
      cpuidle: psci: Move the per CPU variable domain_state to a struct
      cpuidle: psci: Correct the domain-idlestate statistics in debugfs
      pmdomain: core: Add residency reflection for domain-idlestates to debugfs
      pmdomain: core: Reset genpd->states to avoid freeing invalid data
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: Merge branch dt into next
      pmdomain: core: Convert to device_awake_path()
      pmdomain: Merge branch fixes into next
      pmdomain: core: Convert genpd_power_off() to void
      pmdomain: core: Simplify return statement in genpd_power_off()
      pmdomain: core: Use genpd->opp_table to simplify error/remove path
      pmdomain: Merge branch fixes into next

 .../power/allwinner,sun50i-h6-prcm-ppu.yaml        |  42 ++
 .../bindings/power/mediatek,power-controller.yaml  |   2 +
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../bindings/power/rockchip,power-controller.yaml  |   1 +
 drivers/cpuidle/cpuidle-psci-domain.c              |   2 +-
 drivers/cpuidle/cpuidle-psci.c                     |  40 +-
 drivers/cpuidle/cpuidle-psci.h                     |   4 +-
 drivers/pmdomain/amlogic/meson-ee-pwrc.c           |  78 +--
 drivers/pmdomain/arm/Kconfig                       |   6 +-
 drivers/pmdomain/bcm/bcm2835-power.c               |  16 +-
 drivers/pmdomain/core.c                            | 131 +++--
 drivers/pmdomain/governor.c                        |   2 +
 drivers/pmdomain/mediatek/mt6893-pm-domains.h      | 585 +++++++++++++++++++++
 drivers/pmdomain/mediatek/mtk-pm-domains.c         |  17 +-
 drivers/pmdomain/mediatek/mtk-pm-domains.h         |   2 +-
 drivers/pmdomain/qcom/rpmhpd.c                     |  16 +
 drivers/pmdomain/rockchip/pm-domains.c             |  48 +-
 drivers/pmdomain/sunxi/Kconfig                     |  10 +
 drivers/pmdomain/sunxi/Makefile                    |   1 +
 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c        | 208 ++++++++
 drivers/pmdomain/ti/omap_prm.c                     |   8 +-
 include/dt-bindings/power/mediatek,mt6893-power.h  |  35 ++
 include/dt-bindings/power/rockchip,rk3562-power.h  |  35 ++
 include/linux/pm_domain.h                          |  10 +
 24 files changed, 1185 insertions(+), 115 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/power/allwinner,sun50i-h6-prcm-ppu.yaml
 create mode 100644 drivers/pmdomain/mediatek/mt6893-pm-domains.h
 create mode 100644 drivers/pmdomain/sunxi/sun50i-h6-prcm-ppu.c
 create mode 100644 include/dt-bindings/power/mediatek,mt6893-power.h
 create mode 100644 include/dt-bindings/power/rockchip,rk3562-power.h
