Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3534217E4;
	Fri, 16 May 2025 00:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747355246; cv=none; b=UCfV/DrPUFFcqjr5vL5rUHAvu1XufnlFieRbiDGSJoplLFjHy1ibRp3JZejNXouvNwJmA+f+O7L8l0LyKXNnFYk6Cg6zZzHO/ofqUOpgYAzJV0ovyBA9K+ffKXPhOFvLBkDZ/gjWn1pv10veq+dz6eR0FCaG2VT0rJOM+UUe2PA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747355246; c=relaxed/simple;
	bh=N8sOvo4FwSgkli1GbdXZABMRKYXeBpInBEb9HE55zSo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=uGb7/aBBga/r9VJYuZCsR9dCuxg9kokQETlEI5A/WxAoFGmia7Z1QdoJFpaJ8U8fi1xY3vQf0WNV2y/lQAW7irHlCPgeM4oLx6uFXM1k/+QhmAnfpm98QfKIiUhZXRViF3OJrZSJPGOxNwlZ/HhF16vd/Ip41csSyRDx5MAvsZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ViiTfVGN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ViiTfVGN"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4769aef457bso19752091cf.2;
        Thu, 15 May 2025 17:27:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747355244; x=1747960044; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=m6pURmVL5pc7CL/4Z+XDERMVUMwy4OEE/W3/L9YQ5D0=;
        b=ViiTfVGNyvm0KJF8YTiQMvSQSfgfXlbrXmL/+y5bMNmVjPJ29SZVOQedQ2TKtSUrw6
         4LeNcJrkak4vHRiHBqHwWy3JBcC9xc7cQgu+QgEXZOR+du5LATbeg7EJ7DrbJ2oi74SO
         0w344/XoUktWKNjyMZ1nwsftvdCv8OUnxN6ZerpPgvjrQwieChFYQ07vxoPMc1Vf5tDW
         ODO7PVajj8fq54AB/m5P6Elg8UXQ8VtgRVNudzdyIVdy4nmo5+AfhlacEjSP78OhWVYd
         SPd0qLa0C/ewgq8GB4/phclU2eM/OR4+Zr5fo9FhCdK06ju9xZV/myrcrP9WjD3dErJe
         UNcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747355244; x=1747960044;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=m6pURmVL5pc7CL/4Z+XDERMVUMwy4OEE/W3/L9YQ5D0=;
        b=o++gK3ikkTAOjZnVV9+sKOfWVtPiZ+nyrkYVNi7s9QsuxzRt0GDjjf+p7oarX/R+MB
         w8Cq3c61s8f3B45W72j4Rtc3VCWROdmwS19uI0vU23lXxTIjnAfscPang2RgGZ63yWAE
         MbIaSgJlToV75Z3seJItF4gjwzvdW9Pg01HikpuH3z8K8ai8a+FhQa0bnwhfr+dZ8swG
         OEK3AkSffNt6BifJTDbNXRxw4M+kOlv/O+BdgZWTInAezc0Cq+4dqEuUN1c7GPDGXvMX
         nPHS1FYC41TtQRaYObUXdlra0ZfFK/1I2k1SBU2AFG4s+90K08Mx1CaHkp3bSs4lsP5L
         6yZg==
X-Forwarded-Encrypted: i=1; AJvYcCWxKDmY4JpDgIvG/cl6K1W9VErbCngBr99revCtg5+TvH9IksovOpWNHh2Bjj5iIMTkXlPt/YPw4Nqi@vger.kernel.org, AJvYcCX8DWptX2t3dgGSC/d4m+ByFQjq0T6AAxxunUaCOU8S6Nt8IO/TagHGyOBcX8/zTABn6ANK1wd7tP3uDbNy@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8ltjWqI+87uelgSYejp2COBNPcWCkItIjqrfMeHaBts62K+5S
	HJyy7q8uDNORJCEwFREYPokwu+plCp/RUEMp7ZC/P5UnS2cJ/f5j+2iM
X-Gm-Gg: ASbGncsOgJSg12ff3fucjCyF075aVboftd2ijdiWWqvL/EKtdYPEjihZhpTy6Hrwei5
	XU1xtRVEFEFPv8mgegWB1URzPFK/HnsUe0KVw3+2ylNniJ3qURlMT84UHjFEhwX+KPcYEI+fWpY
	HKuMY+Ust2dY2wqqa31fyI5fX0jOvurE5/Gih44WlqMywgc6M+BVkp/1jvBTDTB1VWD/ya/qA2A
	xDVmGDUl1uNUnYd4RwjxLOBUHYue2Hv6sN4j/GQ0Ib0+oXu2AqMORIOVPlKURODsJy+NqeJYsvc
	UHlAOpbpys0SrCa2Rgb8rXPS1iSs3uYr1eY3fi1+dxtidpWBnDB3ZSllHybVnXw=
X-Google-Smtp-Source: AGHT+IGri81tUaY4oEPMDFBUBSTE06hP6AeMH0PFD71DE1XCAFR5XnVVmfT9+56UOC1NwRJLmcI+KA==
X-Received: by 2002:a05:622a:98d:b0:48f:5d4f:8e86 with SMTP id d75a77b69052e-494ae4ac4b0mr30273961cf.50.1747355243930;
        Thu, 15 May 2025 17:27:23 -0700 (PDT)
Received: from localhost.localdomain ([216.237.233.165])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-494ae3cef1fsm4563991cf.9.2025.05.15.17.27.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 17:27:22 -0700 (PDT)
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
Subject: [PATCH v5 0/3] [PATCH v5 0/3] Add device tree support for Luckfox Omni3576 and Core3576
Date: Thu, 15 May 2025 20:27:10 -0400
Message-Id: <20250516002713.145026-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Subject: [PATCH v5 0/3] Add device tree support for Luckfox Omni3576 and Core3576

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

Changes in v5:
 - Patch 1: Moved luckfox vendor prefix to correct alphabetical position
   between lsi and lunzn (Quentin Schulz, v4).
   Acked-by: Conor Dooley <conor.dooley@microchip.com>
   Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - Patch 2: Unchanged from v4.
   Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
   Acked-by: Rob Herring (Arm) <robh@kernel.org>
 - Patch 3:
   - Updated copyright to include John Clark (Quentin Schulz, v4).
   - Reordered top-level nodes alphabetically per DTS coding style
     (Quentin Schulz, v4).
   - Reordered CPU node overrides to match alphabetical order (cpu_bX
     before cpu_lX) (Quentin Schulz, v4).
   - Moved mmc0 alias to rk3576-luckfox-core3576.dtsi for module-level
     eMMC; kept mmc1 in rk3576-luckfox-omni3576.dts for board-specific
     SD (Quentin Schulz, v4).
   - Added regulator-state-mem to top-level regulator-fixed nodes with
     blank lines, omitting deprecated regulator-suspend-microvolt; PMIC
     regulators retain regulator-suspend-microvolt to preserve Luckfox
     SDK behavior, with a future patch planned after RK806 driver
     validation (Quentin Schulz, v4).
   - Removed redundant max-frequency from &sdmmc, as it matches
     rk3576.dtsi (Quentin Schulz, v4).
   - Added vmmc-supply and vqmmc-supply to &sdhci to support eMMC (Jonas
     Karlman, v2).
   - Confirmed blank line style compliance across DTSI and DTS (Jonas
     Karlman, v2).

Changes in v4:
 - Patch 1: Unchanged, Acked-by: Conor Dooley.
 - Patch 2: Fixed binding for Omni3576 to use correct enum syntax (enum:
   [luckfox,omni3576]), added luckfox,core3576 to compatible string
   (Heiko Stuebner, v3).
 - Patch 3: Updated compatible string in rk3576-luckfox-omni3576.dts to
   match revised binding.

Changes in v3:
 - Split device tree into rk3576-luckfox-core3576.dtsi and
   rk3576-luckfox-omni3576.dts for modularity (Jonas Karlman, v2).
 - Patch 3:
   - Added pinctrl for green LED GPIO (Jonas Karlman, v2).
   - Reordered regulator node properties for consistency (Jonas
     Karlman, v2).
   - Used gpios instead of deprecated gpio in regulators (Jonas
     Karlman, v2).
   - Removed vendor-specific pmic-power-off pinctrl and pwrkey from
     RK806 PMIC (Jonas Karlman, v2).
   - Removed no-mmc from &sdmmc to enable MMC support (Jonas Karlman, v2).
   - Removed Ethernet nodes (gmac0/gmac1) due to unreliable PHY driver
     (Andrew Lunn, v2).
   - Addressed DTB warnings within scope (Rob Herring, v2).
   - Added RNG node per Nicolas Frattaroli’s patch (v3).

Changes in v2:
 - Enabled HDMI node, untested due to driver issues (Heiko Stuebner,
   Nicolas Frattaroli, v1).
 - Enabled Ethernet 1 node, removed in v3 (Heiko Stuebner, v1).
 - Clarified eMMC enabled but unpopulated (Heiko Stuebner, v1).
 - Patch 1: Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
 - Patch 2: Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (3):
 dt-bindings: vendor-prefixes: Add luckfox prefix
 dt-bindings: arm: rockchip: Add Luckfox Omni3576 and Core3576 bindings
 arm64: dts: rockchip: Add Luckfox Omni3576 Board support

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../dts/rockchip/rk3576-luckfox-core3576.dtsi | 748 ++++++++++++++++++
 .../dts/rockchip/rk3576-luckfox-omni3576.dts  |  50 ++
 5 files changed, 808 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-core3576.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-luckfox-omni3576.dts

-- 
2.39.5
