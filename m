Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A112272E44;
	Fri,  9 May 2025 12:26:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746793612; cv=none; b=Yuhql7sg1RG9fy3wKJs/2XtO3RHLNPqh5Z9x0U2ZpOuY0ewLwn5S8YDyrKvucC/sGs8gWC7XNrVH/n+6+p6FMbJTTawDW6rVZC4xufrCZLt1XHsZt0KdSVxjZQqWb/6D7eQ7JcsZ0BGCoj7aeeh5YGpq45/BCvEJQDc1opDx4nc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746793612; c=relaxed/simple;
	bh=7PAKo79OBUGSoLnXINsEM7x2Qse0A4rdY1naPEDS7Wc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eV2CgPWDqgD+rWBZPYHvGaZPQYykgI9VihjYwxih8HLtNCRyWuWa0Tmpq4IPyIEUvZtDUsmrv/qBUUKr5yqv5P6dwQjTn1t9HINZlgAt9CYa2A1ejMSy9aolvcTKO7MpSQg58Ktm6fGgI/4rn73mKdS0PZrD4Dm3N8i+2LJNiIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Eg1LQWL7; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Eg1LQWL7"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7c5568355ffso205055285a.0;
        Fri, 09 May 2025 05:26:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746793610; x=1747398410; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kwBRH74C4Cjpm87bSfrtYSAOX2kIdu6R3gkHd+qGuu8=;
        b=Eg1LQWL74YKRHm+LwAVlLRcqth8sbGZczlqXHI/C8nDEH42npofUukJyypqRro1dL4
         U9RQIt8HfqQsPm09vpFqV//bZP5PZZDXnRUUUpvTCbOMVRUCOWNnJiVO7/a9Cnec4buf
         kY157LTK+P1naPzgrL5zHX2A0c05tg8LoKVfmuMyhxOONpea4dpRf10uXHrXsyIqWk0+
         RFwTSXSYeW6TWoihUIywXZl2Mdv+IEa8Voc0gR++ccO7tDOBBgCIOilmwtTzYdf7dlqy
         wwbbk5oZN2CCBfLYCcujMqJVUhPAQBHloP6omzyEj2rsy5h+d7K/pRJyYwGbbZVIr1Ux
         7iZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746793610; x=1747398410;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kwBRH74C4Cjpm87bSfrtYSAOX2kIdu6R3gkHd+qGuu8=;
        b=YkB+T3UaWXPqyb4o0D3kbz2iwgcwKbqH8P6VLT469B3xwlfQgPxZKUFkYqc8Qsa9Cs
         4QjHZE83pfE2MC9ZUQfj7qKg7ri57RF2C6fJn5YMulIrdKXaTF8G4l+YCgPEDL5K1Dk4
         1Z47vGhPAtBgCxJz5rZsUk1xfZd0K3AC2/v/D88/aeaKws+Xdt+2ycs3j94k0DBKHcew
         f1Olbnf7QDyKQXcu36zhObciIeNxd3Lbveyo72HOu6TV7rwJv8NOV6ZuXf4aBCJ7+nkj
         NODyr1QPn+GJwJG+zo+cxaECgGCfqefeR9c/DQ/evxL8BV7mlQpa339e9bf1S9i0I+sr
         DMFw==
X-Forwarded-Encrypted: i=1; AJvYcCW558AIfWdQn+aTu5WnsNwTZpANALtYHZMB89DKI3dx/0DPbBd3HZQ75UiIDg69f3jgZp36Z5LaU7N7@vger.kernel.org, AJvYcCXopDDfiN90DZVZgdGYHYsxpn9C7Rdl2ME1CTrBnXw84rwz4jIxKhx60SwjNY5A3frXrH1WbToAIyZkLjDW@vger.kernel.org
X-Gm-Message-State: AOJu0Yx52e7kHQb8WR3fy89QBSVR96o84bYbBlSBFSrssyFw07h8wSzF
	2DK4kbe6k6bBN1EMPNPEGRqQQ2f+EiE+a8/IDMRnJDd86Gpr08a1
X-Gm-Gg: ASbGncs3oRgWDOnSzRuVmaRXZKlRevspQnLTlRe1VWdWlzpCiTtUmBaijFLmLt5cBJB
	waFGOmBIYgkbX0caSwnm7zLcRTKPvchu9wWvp7rWoUWnuKuOikotbNpiVE5O84DsFd6QhZbfEx/
	CoCge424LoukpCvVkfyGynVma0Nu/KPXcqQjeNbhQk49KRrXc/Vjanu4uk0EWUiKTg3Rs0H7bVw
	jFXFbx2YFPQ8DiT7Xa9181Rx1xVh5YLqHG+9Eus72p2rvqEN4lMG/RHkT9cvwqbjenGXcNwh3HJ
	QDnEktuPWF0RyInelUfhZfnHpuBwJMADBuSiYvvK/LxmRokWDLT7
X-Google-Smtp-Source: AGHT+IF13lpklzPbh8xMbJqnVkS8TJNKtSOtn9pjfRhQnXEhuJW95QQJxk5TmDOVOxq1lUF8eH9Cmw==
X-Received: by 2002:a05:620a:24cb:b0:7c5:5d4b:e62a with SMTP id af79cd13be357-7cd011790admr721621385a.54.1746793609859;
        Fri, 09 May 2025 05:26:49 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd00f4e19asm131843485a.4.2025.05.09.05.26.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 05:26:49 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: Quentin Schulz <quentin.schulz@cherry.de>,
	Jonas Karlman <jonas@kwiboo.se>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Andrew Lunn <andrew@lunn.ch>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH RESEND v4 0/3] Add Luckfox Omni3576 Carrier Board support for RK3576
Date: Fri,  9 May 2025 08:26:34 -0400
Message-Id: <20250509122637.26674-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

[RESEND]: Addressing Krzysztof Kozlowski's feedback:
- Corrected Cc list: used proper maintainer emails.
- Confirmed Conor Dooley's Acked-by tag in patch 1/3.

This series adds device tree support for the Luckfox Omni3576 Carrier
Board with the Core3576 Module, powered by the Rockchip RK3576 SoC
(four Cortex-A72 cores, four Cortex-A53 cores, Mali-G52 MC3 GPU). It
enables essential functionality for booting Linux and basic connectivity,
with plans for future support of peripherals like WiFi, MIPI-DSI, HDMI,
and Ethernet.

Tested features (on Linux 6.15-rc4):
 - UART: Serial console operational
 - SD card: Mounts and reads/writes successfully
 - PCIe: NVMe SSD detected, mounted, and fully functional
 - USB 2.0: Host ports operational
 - RTC: Timekeeping and wake-up tested
 - LED: Heartbeat trigger functional
 - eMMC: Enabled in device tree, not populated on tested hardware

The series includes three patches:
 1. dt-bindings: vendor-prefixes: Add Luckfox vendor prefix
 2. dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
 3. arm64: dts: rockchip: Add Luckfox Omni3576 board support

The device tree is covered by the existing ROCKCHIP ARCHITECTURE entry in
MAINTAINERS. I am aware of ongoing RK3576 upstreaming efforts (e.g., by
Collabora) and welcome feedback or collaboration to align with mainline
driver development.

Changes in v4:
 - Patch 1: Unchanged, Acked-by: Conor Dooley <conor.dooley@microchip.com>.
 - Patch 2: Fixed binding for Omni3576 Carrier Board to use correct enum
   syntax (enum: [luckfox,omni3576] instead of invalid const), added
   luckfox,core3576 to compatible string to reflect module dependency.
 - Patch 3: Updated compatible string in rk3576-luckfox-omni3576.dts to
   match revised binding ("luckfox,omni3576", "luckfox,core3576",
   "rockchip,rk3576").

Changes in v3:
 - Split device tree into rk3576-luckfox-core3576.dtsi (module) and
   rk3576-luckfox-omni3576.dts (carrier board) for better modularity.
   Previous Acked-by from Krzysztof Kozlowski for Patch 2 no longer applies
   due to substantial changes.
 - Addressed Jonas Karlman's feedback on patch 3/3 (Luckfox Omni3576
   device tree):
   - Added pinctrl for green LED GPIO (gpio1 RK_PD5) for proper pin setup.
   - Reordered regulator node properties for consistent sequence (e.g.,
     regulator-name, regulator-min-microvolt, regulator-max-microvolt,
     etc.).
   - Updated regulator nodes (vcc_3v3_pcie, vbus_5v0_typec, vcc_5v0_host,
     vcc_5v0_hdmi) to use 'gpios' property instead of deprecated 'gpio'.
   - Removed pmic-power-off pinctrl state and pinctrl-1 from RK806 PMIC
     node, as they are vendor-specific and undocumented in bindings.
   - Removed pwrkey node from PMIC, as it lacks binding documentation.
   - Added blank line between properties and child nodes in i2c2 node for
     DT style compliance.
   - Removed no-mmc property from sdmmc node to enable MMC support,
     aligning with RK3576 SD v3.0 and MMC v4.51 capabilities, allowing TF
     card slot to support MMC devices or eMMC via adapter.
 - Removed Ethernet support (gmac0/gmac1 nodes) per Andrew Lunn's
   feedback, as it used the generic PHY driver with incorrect RGMII delay
   settings, incompatible with the upcoming MAE0621A driver.
   Collaborating with Andrew Lunn on a device driver, with Ethernet
   support to be submitted separately when complete.
 - Addressed Rob Herring's DTB check warnings, other warnings (e.g., VOP,
   PCIe, OTP, HDMI PHY) originate from rk3576.dtsi and are outside this
   patchset scope.
 - Added RNG node to pick up Nicolas Frattaroli's "add RK3576 RNG node"
   patch.

Changes in v2:
 - Enabled HDMI node per feedback from Heiko Stuebner and Nicolas
   Frattaroli; untested due to upstream driver issues.
 - Enabled Ethernet 1 node per Heiko's device tree philosophy; untested
   due to suspected PHY driver or configuration issues (removed in v3 per
   Andrew Lunn).
 - Clarified eMMC remains enabled but unpopulated on tested board, per
   Heiko.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
  dt-bindings: vendor-prefixes: Add luckfox prefix
  dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
  arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 683 ++++++++++++++++++
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  53 ++
 5 files changed, 746 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5

