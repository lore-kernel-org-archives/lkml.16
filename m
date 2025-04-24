Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E43AD1DE2BF
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 06:21:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745475722; cv=none; b=GLgRhuFT2iQ1+G91VOp9il0cB4wHTdBV7KHT13NOuJ1Wnm4/3crFys57HCSAsz21QcO670FUS/o+HP60OSd0OsqfVf2hKCkXTqDycJwHtosW0yltJgvL4dy/yGui8TMEC5THun1xvce43YzA//ubKqlEeEPXk2ioK6pLihxciPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745475722; c=relaxed/simple;
	bh=LtMCrptJRi9h9DeLKz99vu9IHBG3W2ht+0QjDEqkmQ8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tCJj3+e0OscYn7nX8F5XQeOLXp8FkYV4jP4iBSzLYYDDBbriGAd031KfihIbzfteiAVyUuEU6vDdaXC8FMxiKM54sUvZ682rLbjn1Si0KJQt5m+0Ti1a+RgyIltTMxZpfY1bMxYhXCMW5//fwX+CqW7YmTVX66XcZwQsEC5NIpA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=NZejulRF; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="NZejulRF"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43edb40f357so3653595e9.0
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 23:21:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1745475718; x=1746080518; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=XxxaGvQDvfu7Q9PX5MDYrjcRysLPu8BDWxxMsfcOWXo=;
        b=NZejulRFCZawSgQZk86LRTm5QPA/15OkTF/hKG6+mo2J+m5UrESb3wAhZFJi6ZHPXf
         flSrDSeBkLD+ZLcn22gGACql16FhrbUXGYl3MUTfArV+DNs52Eji6hyjQczHF4ZwNAKt
         m0aWFEILiErWCd6neyfexyj19kWrV0kcdmswM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745475718; x=1746080518;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XxxaGvQDvfu7Q9PX5MDYrjcRysLPu8BDWxxMsfcOWXo=;
        b=Ht8FqQHKDIpY7Pm7saAlhThGlwknMHzmrcaljF3gsasi8cQpugRvc2zY98uImd+oSR
         VSTmjLz/OQkrzyEbDcL8lcSEgXfq1fwzVVevswV3eIugSV+34qqroeKKdLLK+g6qWtKQ
         hF/Ogz12RhQrETyQeUCLX92479aCXBb62B9dq+zwpMjHEdC2YgvTut+hYwB+ecGmaMcx
         YX5YUbSNahLZ4R7Pe9qr2Wk+48AQZ3gDFwUFAaMXlPfxpk88q4t27OeOpbxY9PveVZHY
         yFmETD3VehfyKMpMGDjJ6STkEy83jA5vJdeYluDbVHZrCvo7n7/+VSQjrNM10xlJwO0M
         l99w==
X-Gm-Message-State: AOJu0Yz1rj3HRva83IlsyMS7cFU+/Z17aZKewbJLWy6hMoeHCPrSGUeP
	E/VXdJFoUouR/NSuTJBz2b4qTiGPykt3cSgnS8cjvFuddBIlby0julsaiCU8wd2VhxuLZZ755sU
	V
X-Gm-Gg: ASbGncvaCLgm9nYZ/ZnJZUSEK1FD9vGLoAQXu6FM3rvzyuZurNnUqSyJgjSLmnZkkB+
	wSOIEYl98NQCrhsOmNQnNS36a/cfNP52QqUJ0emobr5+JL06eShp6hupIQjhVBUdBk0EHsXJ+fR
	6LHpge4QRxDfAKlGaw+utgoGOSeFDQUrWVHqZ/Fq6fCyJd1Sqnkc1bnd/o3LDiJjBACo3JjJ3qX
	+jc4pQmAO0TrzE481SQRk8+x2HHaMzB/P0eJ5Aa8KzLHn0qrB2RmJdJ1odHXzwh0MUk0sBzPF7Y
	HM1+NxyL1/9dzkqna6kDdCKj8Lqk60lN9Y4nX/IdUb4fCIrmauTAKcR464RLr/NnEK7OjQ+OFh4
	i5iRi
X-Google-Smtp-Source: AGHT+IGvTU8Y1hgfT3yKjsK08TdE3oRPW2oO5ovqbEbqxVzSJcoPTwAc+vZW0Km/jHkJQMRVgAbuoA==
X-Received: by 2002:a05:600c:cc8:b0:43b:c5a3:2e1a with SMTP id 5b1f17b1804b1-4409bd05289mr11180925e9.2.1745475718040;
        Wed, 23 Apr 2025 23:21:58 -0700 (PDT)
Received: from dario-ThinkPad-T14s-Gen-2i.. ([2.196.40.65])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4409d2bf8dbsm7243435e9.35.2025.04.23.23.21.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 23:21:57 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	linux-amarula@amarulasolutions.com,
	Abel Vesa <abelvesa@kernel.org>,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH v12 00/19] Support spread spectrum clocking for i.MX8M PLLs
Date: Thu, 24 Apr 2025 08:21:30 +0200
Message-ID: <20250424062154.2999219-1-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This version keeps the version v9 patches that can be merged and
removes the patches that will need to be modified in case Peng's
PR https://github.com/devicetree-org/dt-schema/pull/154 is accepted.
The idea is to speed up the merging of the patches in the series
that have already been reviewed and are not dependent on the
introduction of the assigned-clocks-sscs property, and postpone
the patches for spread spectrum to a future series once it becomes
clear what needs to be done.

Specifically, the patches:

01/18 dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
02/18 clk: imx8mm: rename video_pll1 to video_pll
03/18 dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
04/18 clk: imx8mp: rename video_pll1 to video_pll

are a replica for i.MX8MM and i.MX8MP of the patch for i.MX8MM
bedcf9d1dcf88 ("clk: imx: rename video_pll1 to video_pll"), which was
merged some time ago. The patches are split into four because, during
the review, Krzysztof asked me to separate the driver modifications
from the dt-bindings changes.

All the other patches in the series, from 5 to 18, are necessary for
the implementation of the anatop driver for i.MX8M{M,N,P}. The review of
this series has taken a long time, partly due to misunderstandings
arising from incorrect design choices.

As Peng stated in [1]:
"In current design, CCM is taken as producer of CLK_IMX8M_VIDEO_PLL, not consumer."

These patches fix this issue by ensuring that the PLLs are now produced by
Anatop and consumed by CCM, aligning with the hardware logic.

Finally, a clarification: I decided to keep the same title for the series
despite having removed all the patches for spread spectrum support in order
to maintain a clear connection with the previous versions.

[1] https://patchwork.kernel.org/project/linux-clk/patch/20241106090549.3684963-2-dario.binacchi@amarulasolutions.com/

Changes in v12:
- Add the patch
  15/19: arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk properties
  to fix new warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/freescale/'

Changes in v11:
- Fix conflict while rebasing on master for patches:
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base
  15/18 dt-bindings: clock: imx8m-clock: add PLLs
- Add 'Reviewed-by' tag of Peng Fan for patches:
  11/18 clk: imx: add support for i.MX8MM anatop clock driver
  13/18 clk: imx: add support for i.MX8MP anatop clock driver
  14/18 clk: imx8mp: rename ccm_base to base

Changes in v10:
- Drop the v9 patches:
  16/23 dt-bindings: clock: imx8m-clock: support spread spectrum clocking
  17/23 clk: imx: pll14xx: support spread spectrum clock generation
  17/23 clk: imx8mn: support spread spectrum clock generation
  21/23 clk: imx8mp: support spread spectrum clock generation
  23/23 clk: imx8mm: support spread spectrum clock generation

Changes in v9:
- Add 'Reviewed-by' tag of Peng Fan for imx8mn platform patches
- Fix building warning raised by the kernel test robot for patch
  v8, 11/18 clk: imx: add support for i.MX8MN anatop clock driver
- Add patches for imx8m{m,p} platforms:
  - 23/23 clk: imx8mm: support spread spectrum clock generation
  - 22/23 clk: imx: add support for i.MX8MM anatop clock driver
  - 21/23 clk: imx8mp: support spread spectrum clock generation
  - 20/23 clk: imx8mp: rename ccm_base to base
  - 19/23 clk: imx: add support for i.MX8MP anatop clock driver

Changes in v8:
- Drop the patches added in version 7:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v7:
- Add and manage fsl,anatop property as phandle to the anatop node with
  the new patches:
  - 10/23 dt-bindings: clock: imx8m-clock: add phandle to the anatop
  - 11/23 arm64: dts: imx8mm: add phandle to anatop within CCM
  - 12/23 arm64: dts: imx8mn: add phandle to anatop within CCM
  - 13/23 arm64: dts: imx8mp: add phandle to anatop within CCM
  - 14/23 arm64: dts: imx8mq: add phandle to anatop within CCM

Changes in v6:
- Merge patches:
  10/20 dt-bindings: clock: imx8mm: add binding definitions for anatop
  11/20 dt-bindings: clock: imx8mn: add binding definitions for anatop
  12/20 dt-bindings: clock: imx8mp: add binding definitions for anatop
  to
  05/20 dt-bindings: clock: imx8m-anatop: define clocks/clock-names
  now renamed
  05/18 dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
- Split the patch
  15/20 dt-bindings-clock-imx8m-clock-support-spread-spectru.patch
  into
  12/18 dt-bindings: clock: imx8m-clock: add PLLs
  16/18 dt-bindings: clock: imx8m-clock: support spread spectrum clocking

Changes in v5:
- Fix compilation errors.
- Separate driver code from dt-bindings

Changes in v4:
- Add dt-bindings for anatop
- Add anatop driver
- Drop fsl,ssc-clocks from spread spectrum dt-bindings

Changes in v3:
- Patches 1/8 has been added in version 3. The dt-bindings have
  been moved from fsl,imx8m-anatop.yaml to imx8m-clock.yaml. The
  anatop device (fsl,imx8m-anatop.yaml) is indeed more or less a
  syscon, so it represents a memory area accessible by ccm
  (imx8m-clock.yaml) to setup the PLLs.
- Patches {3,5}/8 have been added in version 3.
- Patches {4,6,8}/8 use ccm device node instead of the anatop one.

Changes in v2:
- Add "allOf:" and place it after "required:" block, like in the
  example schema.
- Move the properties definition to the top-level.
- Drop unit types as requested by the "make dt_binding_check" command.

Dario Binacchi (19):
  dt-bindings: clock: imx8mm: add VIDEO_PLL clocks
  clk: imx8mm: rename video_pll1 to video_pll
  dt-bindings: clock: imx8mp: add VIDEO_PLL clocks
  clk: imx8mp: rename video_pll1 to video_pll
  dt-bindings: clock: imx8m-anatop: add oscillators and PLLs
  arm64: dts: imx8mm: add anatop clocks
  arm64: dts: imx8mn: add anatop clocks
  arm64: dts: imx8mp: add anatop clocks
  arm64: dts: imx8mq: add anatop clocks
  clk: imx: add hw API imx_anatop_get_clk_hw
  clk: imx: add support for i.MX8MM anatop clock driver
  clk: imx: add support for i.MX8MN anatop clock driver
  clk: imx: add support for i.MX8MP anatop clock driver
  clk: imx8mp: rename ccm_base to base
  arm64: dts: imx8mp-aristainetos3a-som-v1: don't replicate clk
    properties
  dt-bindings: clock: imx8m-clock: add PLLs
  arm64: dts: imx8mm: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mn: add PLLs to clock controller module (CCM)
  arm64: dts: imx8mp: add PLLs to clock controller module (CCM)

 .../bindings/clock/fsl,imx8m-anatop.yaml      |  53 +-
 .../bindings/clock/imx8m-clock.yaml           |  27 +-
 arch/arm64/boot/dts/freescale/imx8mm.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mn.dtsi     |  11 +-
 .../imx8mp-aristainetos3a-som-v1.dtsi         |   4 -
 arch/arm64/boot/dts/freescale/imx8mp.dtsi     |  11 +-
 arch/arm64/boot/dts/freescale/imx8mq.dtsi     |   2 +
 drivers/clk/imx/Makefile                      |   6 +-
 drivers/clk/imx/clk-imx8mm-anatop.c           | 287 ++++++++
 drivers/clk/imx/clk-imx8mm.c                  | 262 ++++---
 drivers/clk/imx/clk-imx8mn-anatop.c           | 283 ++++++++
 drivers/clk/imx/clk-imx8mn.c                  | 183 +++--
 drivers/clk/imx/clk-imx8mp-anatop.c           | 306 ++++++++
 drivers/clk/imx/clk-imx8mp.c                  | 672 +++++++++---------
 drivers/clk/imx/clk.c                         |  15 +
 drivers/clk/imx/clk.h                         |   2 +
 include/dt-bindings/clock/imx8mm-clock.h      |  76 +-
 include/dt-bindings/clock/imx8mn-clock.h      |  64 ++
 include/dt-bindings/clock/imx8mp-clock.h      |  80 ++-
 19 files changed, 1740 insertions(+), 615 deletions(-)
 create mode 100644 drivers/clk/imx/clk-imx8mm-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mn-anatop.c
 create mode 100644 drivers/clk/imx/clk-imx8mp-anatop.c

-- 
2.43.0

