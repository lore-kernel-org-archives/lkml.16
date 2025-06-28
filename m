Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19B7F1A5B91;
	Sat, 28 Jun 2025 14:32:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751121173; cv=none; b=lh7Xr8/L8SMd8jLcoT73yXPtqka1wsAoDF4SeYCQTt6SPTdTFVfwlQBgG9Cq3HZbEuIiO1an4q8MEnxkECt7yz9V+o6hrFxbLaOjAS2zISxcu7CpyUDapfqDXR67/YPYoLzHCVugtN2BkeCMPYwMmxQvWQICKrxJbeut4XtZr9o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751121173; c=relaxed/simple;
	bh=Bl+6dxbFa+BtOUOg/hg24wMMzHPuMHD8D+s702Qlxm4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=dsTjQxpQDZkxRCTUHJYfyz5mcyG/elBXCGAKQo2CxUiSrfyr5/EQ4D5deqLU6t6nvPdEkePqIAZSCbsejKAXDUT7o86OCAEwSd9W/d9PynHjfgHc1T/pM5BBexnub11CzWhiHwoIQVpEsG4hE/ssKkpr8K9z8WVbQeAGcjikibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mWQ7eqhl; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mWQ7eqhl"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e40e3f316so6585187b3.0;
        Sat, 28 Jun 2025 07:32:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751121171; x=1751725971; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=45MS1jGnaUhNCKXawiCX+6El1Te2L6a6DJuqgA3p9nE=;
        b=mWQ7eqhliapSQleZtXatwxK9TUcMwdtUalmLAjV6iHip+1oVsMcCVP3SstmBjS1SHw
         Z8Cj/o7o1CYVYCvcpfSlqIZIIvhwvHdvZHI3sBOYYShctLgtolQZoWLMOVYzRUHYYAbT
         xwyHMAeyOwykKvvKdc5dPFWZo67kvmgmjzItverLtltOWuyfD00+S9mnIB3aqQNAeOm8
         Sd0RjHBMiNtSVqLTUDxyekcDzPymUvDyAHy0yOVtyG4T2SOgdjAPUDxE9ryDUbh4VcN1
         nokvU4hCmKV1o5YukvEWm61pjtP8zfYJylG3sZfUbZvIKx3k2J1q4Q0ATsH28z5yFp0u
         12FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751121171; x=1751725971;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=45MS1jGnaUhNCKXawiCX+6El1Te2L6a6DJuqgA3p9nE=;
        b=Fu8Xy+8DME1lp3XlUOQq2eGkQ/SBOp1p365GnMCy0babMNh4tXQshMNX9eZSDziXb3
         z1BhhwHf2eFJmO7CPjQQhYJGUQHumbEaPsuio73RuIKxvMsSxgkM/LGSMp/M0857ImM7
         ytJi59W6vy5RBP+I8OrXh51ADbbnROpYuzi5OEucPlECY3PMXX1MymlF0eOROyIuYmEL
         D9XU3aLQuHZzIQPWABEszBfL9CkYtpRt1+A74sApoAqP70fshRe3w2c5yoOSxc6rsa4e
         reGxp9CQ4id1OcsQqhaFS9dGEqt2Rh8gmUPb2dgUuS7RpPoA3L8pwjs64rUbjCMLFmqJ
         UGXA==
X-Forwarded-Encrypted: i=1; AJvYcCUzQjowGTKi4XiXpAdXQFGlvbOnp2sXOQ66081uGeeZmUGVWo6Dkj5m/QsNBXjup0YDKKIgQbSk/ZrHM1Cq@vger.kernel.org, AJvYcCXaJsoHYT6LvAHjk83IHE9Pi4KUNS/fMLisPVaf/UyKsbbrFRGNKdjJIpO5q3Pb0UeK/OKcKCu+5UEF@vger.kernel.org
X-Gm-Message-State: AOJu0YyddOnmblhIksnfox5y8sd2IqK3NisnM2hagg6HihWZycz9sB6z
	SSecPgms2DCH3+9WklYHFArlOFeTHtbtq/aVa8N74CWyPPh3EWx5YEjh
X-Gm-Gg: ASbGncvhu6FJZubZarIRx0sl+rJo5PU+UpdEfVLDXDY+sRyTRjmpRa9YmAADjJIKIMk
	rh8srbM7RnsrS0aSiHJYI7HcZSzxV7BtZmAcfso43SFA7UvPz7hPciyRyk5bT5zMWyZij8BFmgT
	HX3xIvXzePVxL79jckHkWTiz6yW+B0tJSguA2i0T/AZAgYxGBU5tcFLihQ1OLFRzzXfeWP5XHux
	zeaE4gQ3r3vbaRFesttOSt6TIiapXE18+t8/KLtKxVnNuU/EE2WumrSWr4hO4B/fR8/bt2IVMPv
	hpVAa+Wbc1m9qmw9OXEpVEL7sbUAVaL1WpheN3tQj3SOWb2USPnDccQ0K0ug6w5kDbDHSkU=
X-Google-Smtp-Source: AGHT+IESFyFCWZLYfYcronoGyauhrXiKxJd2nnHn7cFixMqmLQzSw7QDvKjzm7oz76Y/iC13YdLNfA==
X-Received: by 2002:a05:690c:30b:b0:70d:f15d:b18f with SMTP id 00721157ae682-715171a2efcmr107899067b3.26.1751121170867;
        Sat, 28 Jun 2025 07:32:50 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-71515bee257sm8393477b3.23.2025.06.28.07.32.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Jun 2025 07:32:50 -0700 (PDT)
From: John Clark <inindev@gmail.com>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	John Clark <inindev@gmail.com>
Subject: [PATCH v5 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Sat, 28 Jun 2025 10:32:27 -0400
Message-Id: <20250628143229.74460-1-inindev@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds device tree support for the FriendlyElec NanoPi M5 board,
powered by the Rockchip RK3576 SoC (4x Cortex-A72, 4x Cortex-A53, Mali-G52
MC3 GPU, 6 TOPS NPU). The patches enable basic booting and connectivity,
including dual 1Gbps Ethernet, USB 3.2, microSD, M.2 PCIe NVMe, and HDMI.

Changes in v5:
 - Addressed Jonas Karlman's feedback:
   - Added mmc0 alias for SD card
   - Updated regulator names to match schematic (e.g., vcc12v_dcin,
       vcc5v0_sys_s5, vcc3v3_m2_keym, vcc3v3_sd_s0, usb3_port2_5v,
       vcc5v0_usb_otg0, vcc5v_hdmi_tx)
   - Fixed vcc3v3_sd_s0 voltage to 3.3V
   - Removed unnecessary regulator-state-mem for fixed regulators
   - Removed vcc_5v0_device regulator
   - Added pinctrl for Ethernet PHY reset GPIOs in mdio0 and mdio1
   - Used correct pinctrl format for sdmmc and sfc1 (<&pin>)
   - Increased SPI flash frequency to 50 MHz
   - Updated LED colors (sys: red, led1/led2: green) and functions
       (LED_FUNCTION_HEARTBEAT, LED_FUNCTION_LAN)
   - Dropped rng node (enabled by default)
   - Omitted HDMI mode-switching GPIO (to be added later with driver
       support)
   - Updated pinctrl names to match schematic (e.g., pcie0_pwren_h,
       sdmmc0_pwren_h, usb3_host_pwren_h, usb_otg0_pwren_h, hp_det_l,
       pcie0_perstn)

Changes in v4:
 - Addressed Diederik's feedback:
   - Renamed pinctrl nodes to align with schematic labels
 - Moved pinctrl-0 and pinctrl-names into button-user sub-node

Changes in v3:
- Improved (even more) fspi1m1_pins comment for clarity, specifying
  gpio1_d5, gpio1_c4-c7 (clk, d0-d4) for SPI NOR flash.
- Removed redundant #address-cells and #size-cells from sfc1 node, as they
  are inherited from rk3576.dtsi.

Changes in v2:
- Fixed DT schema warnings (Rob Herring):
  - Renamed spi-nor@0 to flash@0
  - Renamed pmic@23 pinctrl nodes to end with -pins
  - Renamed hym8563@51 to rtc@51 and removed clock-frequency
  - Renamed button@1 to button-user
- Addressed Heiko Stuebner's feedback:
  - Sorted non-addressed nodes alphabetically
  - Added blank lines in regulator nodes
  - Improved fspi1m1_pins comment to clarify SPI NOR flash pinmux
  - Moved status property in saradc to last

Patch 1: Updates DT bindings in rockchip.yaml
Patch 2: Adds NanoPi M5 device tree and Makefile entry

No MAINTAINERS update needed, as the new file is covered by the existing
ARM/Rockchip SoC entry.

Tested on NanoPi M5 with successful boot and feature validation.

Signed-off-by: John Clark <inindev@gmail.com>
---
John Clark (2):
  dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
  arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

 .../devicetree/bindings/arm/rockchip.yaml     |   6 +
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 941 ++++++++++++++++++
 3 files changed, 948 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5

