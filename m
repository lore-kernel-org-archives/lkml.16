Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B21317BB21;
	Fri, 20 Jun 2025 17:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750440108; cv=none; b=nCOB5j2vO4bS+qBEOio/toPUHtsmz3KvUAUyJS6YeCkKlDNFCN/JIPRqMsM6tVIqkpD5/dSkg2CLHuugStPuUor7404J4tMiI1LAXpJjUPRGA5ytNv9GNzxmNTaOqrG1c8pGlsIpAdOEJA+SNcMZSvOLcy3keh3L7JSv10RvRH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750440108; c=relaxed/simple;
	bh=hWEBnXWWMQEMCGSzUFl0Z0gKr4yJBOS5vfs/3+bHSRg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=hJDtfZE0jMsGWqWSEoaF/RlNdeUKE2u1YZVEzfzbHB9S0i2R/tv7ror5ASebtkK2+Sp3aADJyIqOn5HGo/1u+lI+hgue1AsqOUO/TqoDi8fch4OTxNHSMyRNSqOLlt292gMYK7JDd6Xna0yasEWH+4lzP8LDfJG4jh2n5XvP6Uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GzzY9Efl; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GzzY9Efl"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-71101668dedso18147887b3.1;
        Fri, 20 Jun 2025 10:21:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750440106; x=1751044906; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fvS3KMtz9AvK+cQpsMLXwD2ffJ5jVL2vkB80StYNZLs=;
        b=GzzY9EflJtK5UChsvZHkLi5OyAR14wwrjyycEjKRlRItMd09PhZF5Tlmtg0ITX4WyA
         qaNb9y/GlsoCYXIwOe+cOufTdsMuTbKe8EkxYigZntMk7u/mB2s8DLzcI1Sr6l2Wa+Cl
         xUV4ebmSo3g0Y+Iun00X0amh+9XT/QJg9Mdv/HHiSPyDHZhHS5lNM8YamdkT768KRh97
         GLPzujWF8pJfAfVo0XUHV8WT0Tq4QF1Dz+DMWxFoRG36JWRzPZdSkHFqeJST5xiJQVa6
         CJv8K8bcASl0+7Zzj7WCwEYHEvPiTTZpgSbNd+ndLH5BVb/6LvKehSY+Amr3Q4khTuHm
         xUDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750440106; x=1751044906;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fvS3KMtz9AvK+cQpsMLXwD2ffJ5jVL2vkB80StYNZLs=;
        b=COYXNWiLtBzgTLKjq8EJltNJye73uJqmryMTmgl+vRZOo8TsGpLnDLnW+vU3b0ZSPQ
         hHLAT4db6jqZFUXW0Qz+RQpgK6FM5qdGmnTd6HZ9AhMtzHWyFcIsHGQMNlNPyCtaU/tX
         eoBjdSAtei+BD0S42PoYydTJfItAZisliCeS4+y8Xdsr504DbTuLB1FlR7hNI7Uh90ea
         F81NNNiFCapPT5uJp3z7L3c/K2Odw8YuQmSU1MxiDd5yyb7R4WBXqU6TRbHoHh8ek8R/
         dSk4eKVgTd8r6QWJ7q6YA+VZxMYSZNk29/bYf7vNtsrDv9eVHaehjWUjG+h7VlPumPDO
         zWRA==
X-Forwarded-Encrypted: i=1; AJvYcCW5is5kkLMDkz5XE0J7IxTBEaTDtzoLUl8dxqxB4u7zKBtlZbeCv4hIWAv23vow38UGnSe+iID6lbt2@vger.kernel.org, AJvYcCWQLhoOnOTN1NuFPhyGuOwuOwhs+OUewQaXglnjls8nk0I4Jzrk6fctvNw1yc9mr//GGHsK9XT470GrUDNi@vger.kernel.org
X-Gm-Message-State: AOJu0Yy15XxEoOhazczRKiBGtpnvrJhbCgTVq3JLIsCqkAKBxLxK2U9i
	M61KHsBdTEsXGQzZB05BM5sbGt3Qz3FaQcpbu31hf1YZPZSyPo0cTADM
X-Gm-Gg: ASbGncvj5RfMLbknzLaNJgq0ihvnubYcGHIHEFQDtrR4qXMVIwax1xgmorFevP/Haix
	O2uUuHnI4ZAopGLn4zVqG66jOWkLwZsFr/aiDWLk+YqV4jdMOkes19oRcX1KwQGaSEvzNqh/M1b
	sh0SHdesLC/Io+5D0NrcKc39U/e6Q95xgbpTpEoGaK0wVXr1Iwx3cCJdjpBWU5+ygVwK1UcwnoP
	1oXQGxiVrPrC4gBArxjXRuKi2k548BqkFO7Hqc6rf3ULQS2K3ilV0G/cNaRgIRgq+u2YQVAvKZm
	7muT8897NngkJ2yjV+0PmdyQIzzh+EKoPOsycqBwSwzITNGeEEQU75WMCFvqh4usPZykTzg=
X-Google-Smtp-Source: AGHT+IEHjO40uKSkV7nfam+/N57foyW5wCOVz4cX1+zGDB4XHw1dSOQQdikhvdY9IR7c5chzXB9wCg==
X-Received: by 2002:a05:690c:6f86:b0:70e:7ae4:59f4 with SMTP id 00721157ae682-712c6517768mr50267987b3.17.1750440106089;
        Fri, 20 Jun 2025 10:21:46 -0700 (PDT)
Received: from localhost.localdomain ([192.34.165.40])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-712c4a4a7besm5004037b3.52.2025.06.20.10.21.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 10:21:45 -0700 (PDT)
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
Subject: [PATCH v2 0/2] Add FriendlyElec NanoPi M5 support for Rockchip RK3576
Date: Fri, 20 Jun 2025 13:21:39 -0400
Message-Id: <20250620172141.173266-1-inindev@gmail.com>
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

 .../devicetree/bindings/arm/rockchip.yaml     |    6 +
 arch/arm64/boot/dts/rockchip/Makefile         |    1 +
 .../boot/dts/rockchip/rk3576-nanopi-m5.dts    | 1001 +++++++++++++++++
 3 files changed, 1008 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts

-- 
2.39.5

