Received: from mail-io1-f54.google.com (mail-io1-f54.google.com [209.85.166.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B2528ECEE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 11:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746789640; cv=none; b=szzSSy6TdziXxjFxWoJbXD9nI/5wmTYpECCvD0zODdF3dKQjYDdT24LISJK8ERZGeiRDW/wfC0Ic/s/LAue1jF7ni1RmTkmKFUwYA20VyHbvmqO8XMuMXo4RaQfqbtTb2p2HMVUJMyRAn0W91Q8EmD4W2dOogSb7sAQtauwq3AA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746789640; c=relaxed/simple;
	bh=yoTxnq74WPNkNddj+21/14jDBfGMw7QYijOl5YQWEpI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=i4x9UYd9nwz878N4uL46Y73/EAmONuK13rTWp+F5aMnRCh6cnG3xSiz/3kgTLRLrm50FbujhVzctlpp5n0pbIbq5Qvl9DUx5jVF2NQwb+lNR5hIaWNnow1kHdHjOv491uaA51hMdg1iOhDQBdG9djttssNu3VO+7VyF1DHGQdFA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=vhG5qcTB; arc=none smtp.client-ip=209.85.166.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="vhG5qcTB"
Received: by mail-io1-f54.google.com with SMTP id ca18e2360f4ac-86135ad7b4cso79771839f.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 04:20:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1746789636; x=1747394436; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NTSX0/tw8NEx2HZiz9FcVkfctrtBy+rS4Bs93fohJKY=;
        b=vhG5qcTBTHn5t8HmquDxULE57jUHAhkCG/BLT5mnQnDaF3xwHBU6mUFXqKKVOSNTwE
         6wLYcyCKHrmcKD1abxN4RyyknUG2W71301FwDHnWSA/iO7xPrOGRGR/n3hUUrDeyfY8B
         QZ0DxJzSjzewGzFxvjKKAKFemNgxADsd+c/vRUYygdIO8LAz8XKMo1dMx1+NiZum7zzo
         pVsXL3Ccsi6yzMCpAha4Htq6nzQEZz3qk5kdQj+v8v+VvT8/rPoHU+pchFBBTnGN6Yts
         nAgYL9eEAmchZZmF8ikdTNlZcGoTaB7v9JocMhyq8ZpbHdF2k8ZuZGR299zL/v0zDYDQ
         GDaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746789636; x=1747394436;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NTSX0/tw8NEx2HZiz9FcVkfctrtBy+rS4Bs93fohJKY=;
        b=GlPkdph0EU4rnYVwtuVxCW9xih/z+WC1a1cm9X1oTMRH3yMRnci3XhqheQf8cuDGrg
         +e5foKNtUPaE2djr1TMtMh+RTCUDv+QV9v6gEwFfXKWANSlLaRwG+xU1E6m2RY6zMVC2
         MwvnpdUrh3GTERUn9FqczqZyRTA50Fbe+lfyKSouSC1KCuaNVgewzXmowaqZr1RS0Ke+
         m9Ci6lZS0SfWHGEqHuyE0NGa5wiu+5/EAJnqV3eBM2GT0a3NjImC8MF61/zbG28z6FSC
         8dC0kWCoyd+YkuOGLi1taMvmMCf07zAvGtGRmeOGuhrse1Ztc/8UnVUx9EE6ZRm2gW6Q
         Orkg==
X-Forwarded-Encrypted: i=1; AJvYcCWrQHH1Tvqlj24JuKrlL+p2/leUDd7iQqqV/DWT3zWj9GBIedXGBtlhOkwe/fOImtCDwl/0K733g/pNTms=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFEwnUJl6KYyBRmdwG+i9mD7aQns8AQxv2mxD6PCe3K6VjacOd
	ikhDhAZSlBWQiF0CZoyIUjZ3vvqKTRdXORHyYHFZE/wUjCrX58mhEyHRTS8SDc/5paAC54MHRkg
	f
X-Gm-Gg: ASbGncs2aeDpSRpK95LBgI0lgCY+DRCqp7e9Zz0DnWF8+U3+on277qb4RRbj8ftYuOH
	njAXxXsiCifICm6/j8j2Mnjj2nVG0MYj1cVeajl0RfFA9yVjz+ugLX2NmBjo5HoeJD6M02pNVTW
	ZDoWjEnUqvwn8SikX+lbUkZ+rXoyAjavVDgwGFfEBHXbrznDvuD8uvKrbFivHSkAubLDOfVhDxJ
	m3CGqKtiYCC6n4v/RRDwAdchMLdSNpcA1L7bCVkdn2Y01DDBUIRCt0nlOUJWO1myUv35ACoNIPa
	bF2CtqLWHk6UDLZnqxDEnifyxIb90TgrgoAIWlnWiIZ8p3fJ3sLegYfo5JEe///1OghXwdTgvjZ
	cN5WT9LpRe5TVRQ==
X-Google-Smtp-Source: AGHT+IF05PBHHDZrwWQcLeXCbxDAB8MCaPu4N0jfY4wA0OvXddQCJwebAgEaZT9GlDpW3ltbOgzKXQ==
X-Received: by 2002:a05:6e02:2489:b0:3da:6f46:5c1a with SMTP id e9e14a558f8ab-3da7e1e1b12mr36660425ab.2.1746789636400;
        Fri, 09 May 2025 04:20:36 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id e9e14a558f8ab-3da7e10549fsm5136325ab.23.2025.05.09.04.20.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 May 2025 04:20:35 -0700 (PDT)
From: Alex Elder <elder@riscstar.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	mturquette@baylibre.com,
	sboyd@kernel.org,
	p.zabel@pengutronix.de,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	dlan@gentoo.org
Cc: heylenay@4d2.org,
	inochiama@outlook.com,
	guodong@riscstar.com,
	devicetree@vger.kernel.org,
	linux-clk@vger.kernel.org,
	spacemit@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 0/6] reset: spacemit: add K1 reset support
Date: Fri,  9 May 2025 06:20:25 -0500
Message-ID: <20250509112032.2980811-1-elder@riscstar.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series adds reset controller support for the SpacemiT K1 SoC.
A SpacemiT reset controller is implemented as an auxiliary device
associated with a clock controller (CCU).  A new header file
holds definitions used by both the clock and reset drivers.

This code builds upon the clock controller driver from Haylen Chu.

The only difference from v7 is that the structure containing
the auxiliary device struct is now allocated using kzalloc().
Previously devm_kzalloc() was used, passing the parent device
pointer as its first argument, and as Haylen pointed out, it
was being (doubly) freed in the auxiliary device release
function.  Everything else is essentially identical to v7.

This series is based on the "for-next" branch in the SpacemiT
repository:
  https://github.com/spacemit-com/linux/tree/for-next

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v8

					-Alex

Between version 7 and version 8:
  - The structure containing the auxiliary device is now allocated
    using kzalloc().  That means its lifetime is not tied to the
    parent device, and auxiliary device's release function is
    correct in freeing the structure.

Here is version 7 of this series.
  https://lore.kernel.org/lkml/20250508195409.2962633-1-elder@riscstar.com/

Between version 6 and version 7:
  - The new shared header file is now named "k1-syscon.h" (suggested
    by Haylen Chu)
  - The SPACEMIT_CCU_K1 config option has been removed (suggested
    by Philipp Zabel)
  - The SPACEMIT_CCU config option is now tristate, and selects
    AUXILIARY_BUS (suggested by Haylen Chu)
  - All code is concentrated into a single file "reset-spacemit.c"
    rather than in a directory (suggested by Philipp Zabel)
  - A bogus return value has been fixed, and a few irrelevant comments
    have been removed (suggested by Philipp Zabel)
  - MODULE_AUTHOR(), MODULE_DESCRIPTION(), and MODULE_LICENSE() are
    now supplied (suggested by Haylen Chu)

Here is version 6 of this series.
  https://lore.kernel.org/lkml/20250506210638.2800228-1-elder@riscstar.com/

Between version 5 and version 6:
  - Reworked the code to use the auxiliary device framework.
  - Moved the code supporting reset under drivers/reset/spacemit.
  - Created a new header file shared by reset and clock.
  - Separated generic from SoC-specific code in the reset driver.
  - Dropped two Reviewed-by tags.

Here is version 5 of this series.
  https://lore.kernel.org/lkml/20250418145401.2603648-1-elder@riscstar.com/

Between version 4 and version 5:
  - Added Haylen's Reviewed-by on the second patch.
  - Added Philipp's Reviewed-by on the third patch.
  - In patch 4, added a const qualifier to some structures, and removed
    parentheses surrounding integer constants, as suggested by Philipp
  - Now based on the SpacemiT for-next branch

Here is version 4 of this series.
  https://lore.kernel.org/lkml/20250414191715.2264758-1-elder@riscstar.com/

Between version 3 and version 4:
  - Now based on Haylen Chu's v7 clock code, built on v6.15-rc2.
  - Added Krzysztof's Reviewed-by on the first patch.

Here is version 3 of this series.
  https://lore.kernel.org/lkml/20250409211741.1171584-1-elder@riscstar.com/

Between version 2 and version 3 there was no feedback, however:
  - Haylen posted v6 of the clock series, and it included some changes
    that affected the logic in this reset code.
  - I was informed that defining CCU nodes without any clocks led to
    warnings about "clocks" being a required property when running
    "make dtbs_check".  For that reason, I made clock properties
    optional for reset-only CCU nodes.
  - This code is now based on v6.15-rc1, which includes a few commits
    that were listed as dependencies previously.

Here is version 2 of this series.
  https://lore.kernel.org/lkml/20250328210233.1077035-1-elder@riscstar.com/

Between version 1 and version 2:
  - Added Rob's Reviewed-by tag on the first patch
  - Renamed the of_match_data data type (and one or two other symbols) to
    use "spacemit" rather than "k1".
  - Replaced the abbreviated "rst" or "RST" in names of newly-defined
    sympols with "reset" or "RESET" respectively.
  - Eliminated rcdev_to_controller(), which was only used once.
  - Changed a function that unsafely did a read/modify/write of a register
    to use regmap_update_bits() instead as suggested by Haylen.
  - Eliminated a null check for a pointer known to be non-null.
  - Reordered the assignment of reset controller device fields.
  - Added a "sentinel" comment as requested by Yixun.
  - Updated to be based on Linux v6.14 final.

Here is the first version of this series.
  https://lore.kernel.org/lkml/20250321151831.623575-1-elder@riscstar.com/

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  reset: spacemit: add support for SpacemiT CCU resets
  reset: spacemit: define three more CCUs
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 225 +++++++------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 297 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 128 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 ++++++++++
 9 files changed, 741 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: cb9c3aeae509b36afbdf46942a7a0a0dfc856ce7
-- 
2.45.2

