Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E31542652A6
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 11:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751456237; cv=none; b=rfFDCBd5gEYe77BqnY5v3SyhXdqj4tbtj6HEaXEjzOWQ97LQgmmBXV2agw2M8tgoFZzLGjTM37aybOqPevYmMZTTrXNXEVl7ocrZksnorXwBJBwFFiwU8dbCywL4ptxOzIwg0Cy1afMERDttoPtFpg46JyVj6M/XA+Mn7Riiqgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751456237; c=relaxed/simple;
	bh=zAogbkAHdpSMYu9hHlptP9/nDJc3B1iYUikebeaM8dQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PQxm48MKAjNjTCbCZIOwBx3ps3368N+IM96SZob9ZtvUp2yty8KTD09rq9MXFweg9EetaEzissdLTiisUdS1zixT4H+8xQ/L0pUFKf7V8zRBWRLNLcO1z/NgnCpG5b/w0Dg1ZVNMGRS/LWlzynjGJo7yYDoRqZ9SHNevqwPsE1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=FTlDqKCL; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="FTlDqKCL"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-6fad3400ea3so60927856d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 04:37:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1751456234; x=1752061034; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JuzsZX0ECM0P7YFc0RDsIs6MtWj0mR7kFmi3VabZ4io=;
        b=FTlDqKCL3/SCDGSdwugIYbm7s2dpoedmFCH+UnBfVhCPvfYSjKFj0tE1eBFbJynNiI
         5NG4He7XSh4z13h8wVdQ3E2UONC4/DBJQNHVBCAmXSvJpjkA5zonikwvceLboSW9Wp/4
         a2Qh7ConUN16gV6TfHMgH408h3LzXBz/DjJrmyEit8Tox5cIxhdWAxjmO4vEGifzATeN
         7okf7eA4O8x1o0wjBDvhBlO0iq5QT2diMEgA0EwcE/JEjUbf4042+qz308R0lvwZSpf+
         eWcQkL0q3Ln2mvC1zmhKjbWrR1vACaRccC/y5gnEJnJIWzrrLVCZJ3EinY8SIX9Sx+57
         YyVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751456234; x=1752061034;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JuzsZX0ECM0P7YFc0RDsIs6MtWj0mR7kFmi3VabZ4io=;
        b=hBWbQGxjcS6Bk44CIlNZ2NS20WfarxGXoi8ogB4dbczbrUBYXrfTODLOSmnDM0fBV4
         q3m8d1I9+A2xn9xGH76TbP9Nvfs8hgpJc+h/fkODLhjqSM6MI+09+Ner0RsKD0kRsZsF
         2kI+agR8Cp0khV4iQeoEBIARkMsj77bsF2P4MRnhMgt0LjcD5/gsEi6GeO8CpUZj08F6
         IJg+OiDkdWE+5SqsD4m6DIXtIoPy4oECbwqpOLcfPhii7nGdlS7B6d4G2Jfq62AYXIOl
         cR/vPGsBWBunbh/EdvlSJ0Z4mRzkNkQVEJKwuEDaJc7bCAhYczHETC4SZXvizDOx+bvj
         fqkw==
X-Forwarded-Encrypted: i=1; AJvYcCVmLQiBkHVHGFSxEZ6rcelpKnoGwaD32NBOFsOYL1fiYXAtmzzdEBfcJsHGtjr73q1YHyEut6tEsxT9vh0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw94yxcNxj16y+97eBUrOd14iaB+BIV1eAkvTIe6Xcvv80UXWxW
	yHTwWzjL3Rrr1dLQIXg5F5Atsc17yTPHCAalEMIMKOLKcW3TykC3P7exP0kQQePR73g=
X-Gm-Gg: ASbGnctrhuWAAloTqoXFQ6VtbyLTDAfaZ5HF+tKnycvRG3lBW00Y1fFtXoAxnuFgUc1
	78XKWNjOmFfW4l/tWIk4iv/Vw9gxw5/3/yrDvNoA1wlsIlHU7S9I5E7EbBfZcGl5J28xcw9EdMr
	ZAI7mOl4Bu+BdMgAZvOVuYJOcYFqDGAihmtsrli0DO1yfoPElzUXDaghho/P1+yFBM3Zyg1NQSP
	R3rbJNip/pPmNvTcbnd0G+EomaMQ2Nn//Kk+HgCD5Dt/vUoe3Exx7yYB4ro+HPuWiTth00+L08B
	M0a56ynlKtM5YEaXtSwDGYUwbPrYM8L4ywaE2Q5oyJ5cLTWz1/FpS+AfEz9+0VcTM2wunYLZP0G
	qe9V3bqo66BH1yX1vC8x+ldpxyVl1A/pk98M=
X-Google-Smtp-Source: AGHT+IG2imp757tfBUch+mPjlrSo4FqLZrnMd87ikEDlzWlfKhJEzuvvcBO0t/h7py81wq3vTreWwQ==
X-Received: by 2002:a05:6214:415:b0:700:c46f:3bd with SMTP id 6a1803df08f44-702b1bab600mr37043216d6.25.1751456233867;
        Wed, 02 Jul 2025 04:37:13 -0700 (PDT)
Received: from localhost.localdomain (c-73-228-159-35.hsd1.mn.comcast.net. [73.228.159.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7730ac6csm99218046d6.103.2025.07.02.04.37.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 04:37:13 -0700 (PDT)
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
Subject: [PATCH v12 0/6] reset: spacemit: add K1 reset support
Date: Wed,  2 Jul 2025 06:37:02 -0500
Message-ID: <20250702113709.291748-1-elder@riscstar.com>
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

The only change in this version is that three of the the four resets
associated with each PCIe port have been renamed, to align better
with their corresponding clocks.  This affects patches 1 and 5.
For example, for PCIe port 0:

    RESET_PCIE0_DBI	(no change)
    RESET_PCIE0_SLV ->	RESET_PCIE0_SLAVE
    RESET_PCIE0_MSTR ->	RESET_PCIE0_MASTER
    RESET_PCIE0_GLB ->	RESET_PCIE0_GLOBAL (no corresponding clock)

No other code has changed since v11.

All of these patches are available here:
  https://github.com/riscstar/linux/tree/outgoing/reset-v12

					-Alex

Between version 11 and version 12:
  - Renamed PCIe resets to align with their clock counterparts

Here is version 11 of this series.
  https://lore.kernel.org/lkml/20250613011139.1201702-1-elder@riscstar.com/

Between version 10 and version 11:
  - Rebased onto Linux v6.16-rc1
  - Redefined several "multi-bit" resets as individual ones.

Here is version 10 of this series.
  https://lore.kernel.org/lkml/20250513215345.3631593-1-elder@riscstar.com/

All other history is available via that link, so I won't reproduce
it again here.

Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 19272b37aa4f83ca52bdf9c16d5d81bdd1354494
-- 
2.45.2


Alex Elder (6):
  dt-bindings: soc: spacemit: define spacemit,k1-ccu resets
  soc: spacemit: create a header for clock/reset registers
  clk: spacemit: set up reset auxiliary devices
  clk: spacemit: define three reset-only CCUs
  reset: spacemit: add support for SpacemiT CCU resets
  riscv: dts: spacemit: add reset support for the K1 SoC

 .../soc/spacemit/spacemit,k1-syscon.yaml      |  29 +-
 arch/riscv/boot/dts/spacemit/k1.dtsi          |  18 ++
 drivers/clk/spacemit/Kconfig                  |   1 +
 drivers/clk/spacemit/ccu-k1.c                 | 239 +++++++-------
 drivers/reset/Kconfig                         |   9 +
 drivers/reset/Makefile                        |   1 +
 drivers/reset/reset-spacemit.c                | 304 ++++++++++++++++++
 .../dt-bindings/clock/spacemit,k1-syscon.h    | 141 ++++++++
 include/soc/spacemit/k1-syscon.h              | 160 +++++++++
 9 files changed, 775 insertions(+), 127 deletions(-)
 create mode 100644 drivers/reset/reset-spacemit.c
 create mode 100644 include/soc/spacemit/k1-syscon.h


base-commit: 50c8770a42faf8b1c7abe93e7c114337f580a97d
-- 
2.45.2

