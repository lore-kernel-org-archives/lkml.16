Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com [209.85.128.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B7A2629D;
	Sat, 21 Jun 2025 12:49:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750510150; cv=none; b=R8e1qFgaQAqBvpgN+GRhHofeqX1UXEFGuVJrvpPc26aM14bT8nwBgoPIwkpoeV9ha9DCqLg1X+mms5+tU9EJtjKSMo9Ic4ZKRP9QJufrTF2dUCKQ54q6s71alI4nn4v1v7eMtCq9gpQygVbey4gs1J76Aqe8iu7A3D+ZbChc3pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750510150; c=relaxed/simple;
	bh=lbiVxlmYbMfsoR+DVmijGwsQ2PRtaL1Pq+s0QV4Jp5I=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Dqev8lYALbjixsgtb55v8VRXPvaWk/yk+Pil9qvJfFQUoIR3KNYGw4xavDZ90792xmfHpLz05DP7NMzWr06wSDOI5N9F4MrJrM/lP/e40ZNImuey7HExrWBZidOoBaMOrOqP61QApeFZ7n2DCKxgoIdxhvRkljEaWF0L7qYJzAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fXLfq324; arc=none smtp.client-ip=209.85.128.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fXLfq324"
Received: by mail-yw1-f172.google.com with SMTP id 00721157ae682-71101668dedso22576117b3.1;
        Sat, 21 Jun 2025 05:49:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750510147; x=1751114947; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fjFo4OcPQCDhs/fkG6WHOCsTe4/XpEYceoAXLfRtUA0=;
        b=fXLfq324r76xSSxJrpee+gv7vItN13sWj3wAJOonA6fGsODhMLTrkMnW+SBwBXbcQ2
         ZlG3qcSDf/tp4rwelOFAwIQgFp/ApHMDBT5EKkt8skryj0tf5rSoMKGbmIpzVs4zMnrr
         I5fVdeX6zy1bMbIy0Tr4/UXmtPdWk72c2guzJTTGdG4M1B3MfZZ314oOP7NDTJ6clynk
         P3db2rmNmeWEEbwHSnFKnN5+z6RInuKIy6zC/Ow8oGtZaA0zJZzfcQ6x5KBdefchRjQa
         V/0HJG4TwU8hEQgSQvgBHMFAnci7sJPlbQsgQX5wAw+YD00Nhas3IXEl3eoGAvQj8tWA
         8MZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750510147; x=1751114947;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fjFo4OcPQCDhs/fkG6WHOCsTe4/XpEYceoAXLfRtUA0=;
        b=dyH7Tk2/2Ov22+M+Q8Dt9qo9SW0BXS24PaMokOEBC9fgcMposvLkm/JtnIcpIvNneP
         70p/5mSOVFYcIww84mYRV7EOVCJZ2R570nnsWKRIXh2e4YCNfOMTgLctibUeFtYbTt3C
         aI1jYYqnAwBGvr8N/XndhYP0EFJvA0PmdOTAWMTP0KilTWVJYVUB9K7nAE7sJfL+wtQx
         CM23kGsCwZdgFNSHZkLqRW4N/si5M6HPBQnpYaF4B1FCBgVwjkNxfl+K1n+vNQ8rd4q1
         e0Z8//xBWNltNbTK/MH3OlCbul/tMcX1Xc8WqBDprK6pP8K/AbR4ovOLuVgNxtwNqX+J
         tnhA==
X-Forwarded-Encrypted: i=1; AJvYcCUkKp0dpKBXyhZ60WC83hyJUIp+vM6UJSuKr2GFj96heYxwnjqr+0SmRLpNzCbE5Q3td/zYUhdEN19m@vger.kernel.org, AJvYcCV0uaTCXf6+ebEttF/vRS8aU7uHVwXEYU5FDdV6BElZi0pmWcpOqVRfSeSF0RyIX7wjP0OIVjdmb7/uKmUe@vger.kernel.org
X-Gm-Message-State: AOJu0YwFbVptBJOc/f8dWEHYqJb+HErPjG/pJa6OeAzKYA3aFqWcpsDJ
	9YVhRFnX56D3HleBujILcgCtxBKrLSW/huEULyxZw1IVAP3GPRjUdSf5C01x6r6R
X-Gm-Gg: ASbGncuf656xaZ3jRdFEumO2foyjwp/AXR7KxGO8Q15RABk/3NHzT7ZsYw6UzAH8/7F
	hVOFP4N0DliZRDpF4QfbylKNT5Opke5N+KaFPoKvx4sd3pbynyF3s3/qHl0JtMdhIhqCqOmk0Pu
	ZURiJUv4FRns1DkwNUY90yLE4Lg/Kep7XXU8bZJZLuoQDOrwAG45brtPjKAKDuJNHmwy5M41F7O
	T2B2JG4LWRF4YNnx8Y3sFxaMo9GU3OnYWK+A5OhwNoHPdKc5yQPG6TbZzICm9x+9Zyel0JMZszj
	JSVeGUj9j9Yg82Gz/iHmzj9r1xZkuVVfFBNpb9tdgsmmZP3zsAWpuaSRF44OVZ1XkLu4pKM=
X-Google-Smtp-Source: AGHT+IGpXQnN3tAt0kNP39OWMV3gBlwYAWIavcD6N1VqsfZCkQau6Hx5p4QBL32otzK/bnphmUSnZA==
X-Received: by 2002:a05:690c:7106:b0:70f:6ec6:62b3 with SMTP id 00721157ae682-712c6756223mr93147527b3.26.1750510147324;
        Sat, 21 Jun 2025 05:49:07 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a1625fsm8357727b3.27.2025.06.21.05.49.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 05:49:06 -0700 (PDT)
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
Subject: [PATCH v3 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Sat, 21 Jun 2025 08:48:58 -0400
Message-Id: <20250621124900.214098-1-inindev@gmail.com>
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
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 999 ++++++++++++++++++
 3 files changed, 1006 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5

