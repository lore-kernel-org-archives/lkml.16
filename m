Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com [209.85.128.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7C682264A2;
	Thu, 26 Jun 2025 05:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750916919; cv=none; b=utOBob2U3D0Shqejs33h5ZJva61maJnJcP+mqHvPOSmTISmG7sUoM5vt0H0hekQlO+KWbnyH5vIvRuCIA/QO8WsZtHFsx2tKnjIFiBWhBZJEAwRhMXdi1qTeWCMuuXbwCTxBeMNgscDWreJZliy8OB+difuFtO7XSD5S2kie8mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750916919; c=relaxed/simple;
	bh=PvP7V4HS/UqCZN0yCYpQZ/ywmaPF5RpuzeumcsptQd8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=PAx1qeqkbYwOGxsfc5Cu68nGm0OgcaJLnf7AJsuPDa2H3SHuqHB1tUFfCxMoXnatfCnM98M1zzoJjIo4Gg3MDNhlo3LGweKzQzBX0Q3ocxPvNgYciD8fi/c7YsFXZeMUNDdlauCZyU40OClrj1adWASKc88QUPeguaBKbpeNnYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ONUpuhQi; arc=none smtp.client-ip=209.85.128.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ONUpuhQi"
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-714067ecea3so5392817b3.0;
        Wed, 25 Jun 2025 22:48:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750916916; x=1751521716; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PVe6wGUug93MpyjkrNCWfM9sBMWoe0QRMhfdfW1sERg=;
        b=ONUpuhQioCBaLCTrBoNsvlT05NH9s1IZZNdGIpZSo2Q/2SIZWW8u8Z8Yldmk1Bp/io
         kU+FKW6YHI32ufXKMGnvKU6duRrw0zbgZ2FdGJqWwO2bn338gccWARznermPt2TEdFvb
         ys6BwaHKRbSCkCZwQ5zcEnE35YH8Qi2pDSSjfAqJTQP6KsffaDs74x4sQxn4jf6kC1bR
         a5F/0rd/q+TitExd8BqVh6KYaJWC63qBoZ+RRZZtJNY7m93i/CGao6odq4T7s4ZcecHc
         v7VlJCpiGkjVdfipv/VFECF87SlPuHOSAhNNGGDLcnOMu9CjQ3ubWFOpyPYMgTiW69ou
         w9dQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750916916; x=1751521716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PVe6wGUug93MpyjkrNCWfM9sBMWoe0QRMhfdfW1sERg=;
        b=EPb6g93FYF06XsXmEL2XMJraFt4NXJHdi619MpXV4JWA7JwAD54xC9jNlZfW1G4vAE
         GGi0uE3n5KerDRltpV6/Pw4LwZcfWGFHhx3teVkI6vZxNjJI0tCxg/KW5JwTc4Fdqwrf
         5DPRKhN6d6wvs6q5i+981G1T69Zsbzlw6hLOSp2NZnoWhLrjzjJBdyY11Pq8xjoHpbiS
         ygicabPPqs5w+ZwtHsMuuSJKctFR/p4lGN48s1ScQR7LQftXyPNUVfJCyqClZe0vC/6A
         xtGuif5cAiKg859163nxWh52QedTy8Rk/Ih1N3yJ/Z5koWI/7nXR/1BwXpIoIzYF/35/
         qKvw==
X-Forwarded-Encrypted: i=1; AJvYcCUXSLk4tgUXWZ7u3ExI4sW04BSPgc3wO7nio/OCX1Iq6w3mejG/8oHDYhQZ8t140zdJVZyOOc5wIPp49VtG@vger.kernel.org, AJvYcCXRu++swfeRYYoMNQ/PSEWM7HUNjjPJWolAYlslanFtROsyRD3HpB5fOKmAEBAqGf1GgPRxEJ+8Ng8w@vger.kernel.org
X-Gm-Message-State: AOJu0YyVv/uiel0soiYyKTm3Y6LwlnUgKmvPBv3ERm9W63IT7Q2/Nd9X
	HAu2wplZV+unWlh3sat3foYVl1fmmKdw5b7l5uP1FEqScH/9X/1iZqFI
X-Gm-Gg: ASbGncuXn+QhCDQyRKK6WLFJ03n/2Z8oQrNfXisyVQNedPt0yowQ2iloktylzpWElMj
	2ABMe3A2wh3O+i+r+pzXx8WwZ1+w73qu0W9ZOXdrTfeZswnYDrJhmPMexTUWs1qdqsFsevThEpQ
	RHpUy3UNOF+rjIiVs0JzjYMz7KLn1NEKaNmarXDwUVPqk6GcNuwD0m4kDBhOzIP1LE6YO6Fbg3A
	H6PXrYcY06vdNYKnSS8/fEFBJeS/PQB8pJsTKc6BY5n0rJpctHOQGx/aRp3zJPV88AkhqAtJM9o
	LvMYFwU3iVaH6Q2juZ7bu+X+8ObQaPMzoK0JEvQYeYOVwwrTNMUscSaZMWSZo/PnYOexp6JDJV3
	xmKgvSw==
X-Google-Smtp-Source: AGHT+IH9LKreUxvc3F5L5oWgirPyG5WU6cpWSWHJoSO7yLg9DvB+ScH57eawkJzLKyHLorJFXLN5zQ==
X-Received: by 2002:a05:690c:6902:b0:70e:7882:ea97 with SMTP id 00721157ae682-71406ca14e7mr87220437b3.10.1750916916528;
        Wed, 25 Jun 2025 22:48:36 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4b97299sm27323757b3.66.2025.06.25.22.48.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 22:48:36 -0700 (PDT)
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
Subject: [PATCH v4 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Thu, 26 Jun 2025 01:47:26 -0400
Message-Id: <20250626054728.4882-1-inindev@gmail.com>
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
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 999 ++++++++++++++++++
 3 files changed, 1006 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5

