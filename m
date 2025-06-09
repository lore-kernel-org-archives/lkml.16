Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E741F22A4FD;
	Mon,  9 Jun 2025 23:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749512511; cv=none; b=NjRsWO0iC7vL3JJqqhMR+Bo/1VUBTWnRrbNBqZjpfumCSY3RfLZf2kG53FmHugig8xUKyjXL1xz3B7bjHU0X+/j7SZFDWDh/1v2oKUGFSN8/Any2CCmoFvrl+8J68r3b7X+MK1Cbie2PykBWrCFXLt6XFTCHDJk0+iYcZ9g82h8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749512511; c=relaxed/simple;
	bh=cDCkk85k3A5R5CuEwbtk6qqX2z5/qKUPNGulxVzNryQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=mAKwocW/sqAJy1wr7L8y7H0JgfQSCQleCNYLdzDfkR/QKdKLoV/JJx5pIw4eRHbWTp2fUkYGNGB+6buE/I/qsbmufI6Eko08vIWIUXbwF8x+OCNzkYDZcdaPZ4Pif0CaFwML8EswDS+9KLOzIw86qYZm3HUdAMmMdomZxnIHJA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b0fPodfR; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b0fPodfR"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a536ecbf6fso1910783f8f.2;
        Mon, 09 Jun 2025 16:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749512508; x=1750117308; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=;
        b=b0fPodfRYudC+zQFk5sDywRnOoP5KEHdzyz7PATGQC/ORgYI6evnnDfTEBGxIhCLn0
         rDYSOy2O3EpQ4X3F+GhKQi0Y95cfb9e7MNjupSHN1o2Gtf7Co7HHUUjPZ9SDBgEbWF2c
         bfVbqlepOudJG+GXwCLEe5aucizB81qK0hy3kXIuSed6vi2e69EGuOKsYYk2YT/Yrb0n
         PWG6bFzxeV/dD+RCCJAr2uyPayPcgIqJgacz7RWecOAF/JxJ5gBH7jbg6qcFBetXNqoL
         VbhkdGivnRK9gzfmp6WtvCZWm9SFkBGAs39jCymUibssBbKJy+ffKSS8oEkxjK5BAvrG
         SH3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749512508; x=1750117308;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i3uI7neNHCeOOnqy1qi6PTTocqMk/JcRDsziPQgv/O8=;
        b=vtqPZvRyA9t+E9652MWNtoAslGIRXtHNIBA9oYyduU014C83dhzsStIsoIRhURNCCJ
         hFQNboVFZNqjgcZG9tseMoMTi2z5mmL22uJ3YRPp62Puxx+dqxaCLC6SGeuyZoCzW1Le
         iPbOvX2Ylf/HqJvmWJa574i12uWEVw/bK1kR9ZZYnye6Ju+39PCaqe+Anti6a0uHFMcF
         8gYqloxaRcGl78HSNFH4bWBjw7mdXCn+hlHAJarLcpv4MIlXJrXoSQS2zlFfa/9tFlj7
         xkFqgha+bZuujB3d0EkGzxZIf7xlU50ud7mG4e2LIAtiKIePwzS4vlguFckMTE3b7d1h
         snFw==
X-Forwarded-Encrypted: i=1; AJvYcCVgMBdOG0C9heauIMNG60bFbub7Hp5IRm8sFlBs7PNaG/UrTSEXcYddihidCgFZL4/gqN5vxU23Amla@vger.kernel.org, AJvYcCVqNyYbpRxAIp8d1SutE9KUAABwe1kjyE0NzC+qjFkteHYUp9RKlVOA4ma1BOI4S0fcxbhLtQGpV748pDNr@vger.kernel.org
X-Gm-Message-State: AOJu0YxJan/vT0Wf6rCY31oI3KHU3ulvfvgDoIX6IxxqT80Vl7aOalL4
	d/aL5ZxDxnOAdUzw6+vT1Pr75OCPNSr8bwPObvVdeRUcDWtLHHWMZPak
X-Gm-Gg: ASbGncu3YUqHSEPEKm7alXV7/LDvDUloRmWOOmNH5+eUD0ChFRYKjiQ8UYqm1uQSJ1V
	GjTQsLkEdm7W1dQVb3X7qyTYsTV+L2XakZG3OD9ihoHX3e2t1IWdv0W6jVXuLh/EHCxKncFpCAp
	qoQGMXbiZlhix2vXoOrKGl5Kvr5uJYIruUAogmCE3y+2yW5XPpXu0OmF+ulOfQG8dWgGfpsagnf
	Y6vUwB+iOMPmJW6CB16dxXBenOimHOm/tF45pi1FcEhrL2AgOq/FFlSeHSckIiyfUhVjEmGvCL4
	xNjGqUV2ysJdBHrVroK+6pkFq00OXo6NwqV+u8zV7lG3UwVczkSVaurBR2L0lVPCb1s11PdbTQ4
	=
X-Google-Smtp-Source: AGHT+IEsAqVyl21nrnHMCcfk0whdunesI5czCGvugVWSJ+BoAoNWxpXOTu6PD/8F0KK4s/GGTVK0tQ==
X-Received: by 2002:a05:6000:1a8f:b0:3a4:c2e4:11b with SMTP id ffacd0b85a97d-3a5522cc60dmr287159f8f.51.1749512508160;
        Mon, 09 Jun 2025 16:41:48 -0700 (PDT)
Received: from giga-mm.. ([2a02:1210:8608:9200:82ee:73ff:feb8:99e3])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a53244df34sm10849846f8f.71.2025.06.09.16.41.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 16:41:47 -0700 (PDT)
From: Alexander Sverdlin <alexander.sverdlin@gmail.com>
To: sophgo@lists.linux.dev,
	soc@lists.linux.dev
Cc: Alexander Sverdlin <alexander.sverdlin@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@gmail.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Jisheng Zhang <jszhang@kernel.org>,
	Haylen Chu <heylenay@outlook.com>,
	Chao Wei <chao.wei@sophgo.com>,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v6 0/6] arm64 support for Milk-V Duo Module 01 EVB
Date: Tue, 10 Jun 2025 01:41:11 +0200
Message-ID: <20250609234125.722923-1-alexander.sverdlin@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
been chosen because the upstream toolchain can be utilized.

Sophgo SG2000 seems to be a continuation of the Cvitek CV18xx series, same
peripherals with an addition of ARM64 core. Therefore it would be
beneficial not to copy-paste the peripherals' device-tree, but rather split
the most suitable riscv DT into ARCH-specific and peripherals parts and
just include the latter on the arm64 side.

This series adds the device-tree for Milk-V Duo Module 01 EVB, which
in turn contains Milk-V Duo Module 01 (separate .dtsi) on it, which has
SG2000 SoC inside (separate .dtsi).

This series has been tested with Sophgo-provided U-Boot binary [2]: it
boots from SD card; pinctrl, serial, GPIO drivers are functional (same
as for RiscV-based CV18xx SoCs).

Partial SoC documentation is available [3].

This series lacks the support of:
- USB
- Audio
- Ethernet
- WiFi
- Bluetooth
- eMMC
- Video

Changelog:
v6:
- rebase onto sophgo/for-next (108a76779829)
- dropped first patch refactoring RiscV counterpart (equivalent present in
  sophgo/for-next)
- added cpu_on/cpu_off properties into psci node
- added reset-controller node, compatible comes in [4]
v5:
- PSCI node in DT
v4:
- minimized patch 1/7 (cleanups dropped)
- cv18xx-cpu-intc.dtsi instead of cv18xx-cpu.dtsi+cv18xx-intc.dtsi in
patch 1/7
v3:
- &cpus node has been moved into cv18xx-cpu.dtsi, &plic and &clint nodes
were moved into cv18xx-intc.dtsi to reduce code duplication;
v2:
- dropped all patches related to the new reboot driver and corresponding DT
and bindings;
- grouped DT-related and config-related patches together;
- added patch moving sophgo.yaml from riscv into soc (to share it with
ARM); added SG2000 SoC and Milk-V Duo Module 01 EVB into it;
- other changes are documented in the corresponding patches;

[1] https://milkv.io/docs/duo/getting-started/duo-module-01
[2] https://github.com/milkv-duo/duo-buildroot-sdk-v2/releases/
[3] https://github.com/sophgo/sophgo-doc/releases/download/sg2000-trm-v1.01/sg2000_trm_en.pdf
[4] https://lore.kernel.org/sophgo/20250609230417.620089-1-alexander.sverdlin@gmail.com/

Alexander Sverdlin (6):
  dt-bindings: soc: sophgo: Move SoCs/boards from riscv into soc, add
    SG2000
  arm64: dts: sophgo: Add initial SG2000 SoC device tree
  arm64: dts: sophgo: Add Duo Module 01
  arm64: dts: sophgo: Add Duo Module 01 Evaluation Board
  arm64: Add SOPHGO SOC family Kconfig support
  arm64: defconfig: Enable rudimentary Sophgo SG2000 support

 .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
 arch/arm64/Kconfig.platforms                  |  6 ++
 arch/arm64/boot/dts/Makefile                  |  1 +
 arch/arm64/boot/dts/sophgo/Makefile           |  2 +
 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
 .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
 arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 91 +++++++++++++++++++
 arch/arm64/configs/defconfig                  |  4 +
 8 files changed, 226 insertions(+), 1 deletion(-)
 rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (81%)
 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi

-- 
2.49.0

