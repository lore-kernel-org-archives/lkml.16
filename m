Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78BB2110
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745223628; cv=none; b=mTVltFdQBUoViEBiEoxRmmrppyzsxXHIaNR1UbC83XAJ9N8D6VUk74oxrDtAXnUIM5rGaEtRIwrwSb+XEpkquolw2RvGom3V6nnp25jFddkJPoLnZyC9ZcQ1w8pNBw5TnYKGHvfP2DoXxYWUB1l7evSgc73tEosJ7xK6c2nKAIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745223628; c=relaxed/simple;
	bh=6MkfKz38ObeZcfyCkcrYqFfAXaeX4E8lYjZjUkcJ/Tc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=WXFAH8x4kjWLTDX/7Ye633pUx6bZCU1P55vBrwaKJhw99Txzq2YvnM0nQ1p5JjbrJxafwQBdhTI85au+yby6fECt0anFYrg8MoRbKz/J/1kcJC8CZKeqJyTTisDAklisw4kqtj2cvCm4t+1xbzXdO1egC/2mv7azGocH/uwz1Lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=m+fAD93S; arc=none smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="m+fAD93S"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-5f6222c6c4cso4832285a12.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:20:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1745223624; x=1745828424; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Y2//hknri4hGBDD1e8OM0em/ek5dr9hJzLJ9p8JI8FM=;
        b=m+fAD93SkTDgdWj5lK64kfX2tPXPPrhw62dDtS0vmYIh5BdH8umK4DCyOKRhSmp1EY
         AdegZmqjVxdoj+mZvtm0IWrhCMvu2wG39Swq3STZiidIlLEOEyAH9mfiBhrOJDgSbQNi
         YioCKICF5s3p8bksRhs7gUGfkEAIZDZrEMNvi4YbUepbG08wGgd0QKKWDNiFc0CttWI2
         4erkPCrvydF+uke0cor+n5QU8w+cVOVB6ioCk8rzV0PkSXBhYJD3PtlOQGf9K/gvc1NO
         0RQAykGYXUktgerdeyJDvMTbCVaYly94uF44Z0UzgxHld8yslOYAy3B+aQoSPxVxl6G6
         vgVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745223624; x=1745828424;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Y2//hknri4hGBDD1e8OM0em/ek5dr9hJzLJ9p8JI8FM=;
        b=I/gf/bKbdNKWLWTl4apQrutYRTy03Y5abydgEe0GUSEm3zgCaw6YYO02TTwrSKMNmD
         aGAPNsBvT0kfv7P9WMftJRHzyjEccG8TphC3jP+MJV6j2sPZCqIJVlKG4ics4t/jjKzV
         EzRAYWFrepRvPgCQNW2M65G3Y+xeCwy8JEyP+nR4nsalNEvur+2v6NNt213xoHjs1Gna
         bWxfzyVX36+4n9GOYi93/fj183gAszNDejNH/yE9ZJO7hDYFboScUFStRXEGXCtAubfT
         B/XIKu19BrwQie6OaexN/ITAJtzRlhFwimX1IrC5z144lAaf1doFE9z7l+SO5FEjSS67
         UZiQ==
X-Forwarded-Encrypted: i=1; AJvYcCW8cLGpxdEpFuqkpMFRrWiKI33f5l0OzPO1H4yJcYFxmdvof1NpMg74fOHu8aXhRomASCzuQeahXGoIuds=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7U0jdiZ4nRzhPPT8BuB3EWpFmCkIUwL2Pel9620hFjcYM3fGg
	pjoCFtTia2CUxna3A1zOPAFZyiePhYO7bryFpVm0oxqvtc1DH79N5Tu03ge3c+wMo6/sx4PC7JV
	6
X-Gm-Gg: ASbGncsrCH0/dVjrli8hVJ90fAgusxtIxcZ2W3lBHBNkG6uqPGc3lLpKj0lGLSdFy2T
	7HR5H0bRKnI7PQpB7aPkJ9MTKEvq793y/Qrogq0wzpU/cZ+IrfKylQXSGBqijnnnjkGApNdTcF0
	faFN2dIB7w6cBxAODyGXgyLrAJY3c118FkxWBLL2uCe7Vur/gS4NPb+PShXreYpvj8NUsxi43B9
	PhuSDHk5wMxMMWsQTI8QgmkszeIcLqBpux+UJbMhCHDQvch1i8taEwdCZ3qUQ1mctx3UjVRpRc8
	5odqszU3U+yhc943sh180GdLHX73NXsD3NA=
X-Google-Smtp-Source: AGHT+IHN4I6voe9MkaTbYNinvZPCG6UdoeCoQlcmMWrevtcqkaDTbIA+2EU2iRfYT2fL8Xsk7lmQfw==
X-Received: by 2002:a05:6402:26d2:b0:5f6:23b1:ab43 with SMTP id 4fb4d7f45d1cf-5f627c1e07fmr9366958a12.0.1745223624010;
        Mon, 21 Apr 2025 01:20:24 -0700 (PDT)
Received: from localhost ([2001:4091:a245:826e:c0c:4cef:7dd:26bd])
        by smtp.gmail.com with UTF8SMTPSA id 4fb4d7f45d1cf-5f62559cb7fsm4313239a12.48.2025.04.21.01.20.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:20:23 -0700 (PDT)
From: Markus Schneider-Pargmann <msp@baylibre.com>
Subject: [PATCH v6 0/2] firmware: ti_sci: Partial-IO support
Date: Mon, 21 Apr 2025 10:19:58 +0200
Message-Id: <20250421-topic-am62-partialio-v6-12-b4-v6-0-3b5cefab1339@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAK//BWgC/4WQyU7DMBRFfyXymld5ip1kxX8gFp5CLZqhTmKoq
 vw7zoCoCqLL+xbn3PuuaHDBuwFV2RUFF/3guzYF8ZQhc1TtmwNvU0YUU04wLmDsem9ANYJCr8L
 o1cl3EAUQCpqDoZLVWhnOuUSJ0QdX+8+V//K65eDOU9KM2xFpNTgwXdP4scqiOJAcgiHo1l9lu
 73c7Y1RLXyodzf1MHRTMG5vUBhiRVkyom1RRfmbkmOeBDcb7Hg3IwdGpbWkrom0qooELb2Pfhi
 7cFnfFNlafOuUpP9/JDLAUEsjlteUoiDPWl1OXgd3SKtXeOQ/QErKR0CegMTowiltOZbuD2D+D
 cwxw+IRMF8alowyyyTnit4B53n+Ao18HI4nAgAA
X-Change-ID: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
To: Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>, 
 Santosh Shilimkar <ssantosh@kernel.org>
Cc: Vishal Mahaveer <vishalm@ti.com>, Kevin Hilman <khilman@baylibre.com>, 
 Dhruva Gole <d-gole@ti.com>, Sebin Francis <sebin.francis@ti.com>, 
 Kendall Willis <k-willis@ti.com>, Akashdeep Kaur <a-kaur@ti.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Markus Schneider-Pargmann <msp@baylibre.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7595; i=msp@baylibre.com;
 h=from:subject:message-id; bh=6MkfKz38ObeZcfyCkcrYqFfAXaeX4E8lYjZjUkcJ/Tc=;
 b=owGbwMvMwCXWejAsc4KoVzDjabUkhgzW/9uk3H4ELrsV4jnLxbwhpctv0sXjwgnJj0M+lOdt8
 i/rlrnQUcrCIMbFICumyNKZGJr2X37nseRFyzbDzGFlAhnCwMUpABMJk2L47yFx7M3l9bUbBa16
 NPi99z5lsc2J+F2tsTPgiePFHdc3WDP89/216P2hmZIXHqgwVHDe1Ht4Y58Vs/iLmKNK09bpmlZ
 EcwEA
X-Developer-Key: i=msp@baylibre.com; a=openpgp;
 fpr=BADD88DB889FDC3E8A3D5FE612FA6A01E0A45B41

Hi,

This series adds support for Partial-IO to the ti-sci driver, implementing the
firmware interface necessary to enter this low power state. It processes the
wakeup-source properties from the devicetree and communicates with the system
firmware to enter Partial-IO mode when appropriate wakeup sources are enabled.

Partial-IO Overview
------------------
Partial-IO is a low power system state in which nearly everything is
turned off except the pins of the CANUART group (mcu_mcan0, mcu_mcan1,
wkup_uart0 and mcu_uart0). These devices can trigger a wakeup of the system
on pin activity. Note that this does not resume the system as the DDR is
off as well. So this state can be considered a power-off state with wakeup
capabilities.

A documentation can also be found in section 6.2.4 in the TRM:
  https://www.ti.com/lit/pdf/spruiv7

Implementation Details
----------------------
The complete Partial-IO feature requires three coordinated series, each handling
a different aspect of the implementation:

1. m_can driver series: Implements device-specific wakeup functionality
   for m_can devices, allowing them to be set as wakeup sources.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/mcan-wakeup-source/v6.15?ref_type=heads
   https://lore.kernel.org/r/20250421-topic-mcan-wakeup-source-v6-12-v7-0-1b7b916c9832@baylibre.com

2. Devicetree series: Defines system states and wakeup sources in the
   devicetree for am62, am62a and am62p.
   https://gitlab.baylibre.com/msp8/linux/-/tree/topic/am62-dt-partialio/v6.15?ref_type=heads
   https://lore.kernel.org/r/20250421-topic-am62-dt-partialio-v6-15-v1-0-6ced30aafddb@baylibre.com

3. This series (TI-SCI firmware): Implements the firmware interface to enter
   Partial-IO mode when appropriate wakeup sources are enabled.

Devicetree Bindings
-------------------
This series depends on the dt-schema pull request that adds bindings for
system-idle-states and updates the binding for wakeup-source:
  https://github.com/devicetree-org/dt-schema/pull/150

These new bindings allow the ti-sci driver to identify devices that can
act as wakeup sources for specific system states like Partial-IO.

Testing
-------
A test branch is available here that includes all patches required to
test Partial-IO:

https://gitlab.baylibre.com/msp8/linux/-/tree/integration/am62-partialio/v6.15?ref_type=heads

After enabling Wake-on-LAN the system can be powered off and will enter
the Partial-IO state in which it can be woken up by activity on the
specific pins:
    ethtool -s can0 wol p
    ethtool -s can1 wol p
    poweroff

These patches are tested on am62-lp-sk.

Best,
Markus

Previous versions "firmware: ti_sci: Partial-IO support":
 v1: https://lore.kernel.org/lkml/20240523080225.1288617-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729080101.3859701-1-msp@baylibre.com/
 v3: https://lore.kernel.org/r/20241012-topic-am62-partialio-v6-13-b4-v3-0-f7c6c2739681@baylibre.com
 v4: https://lore.kernel.org/r/20241219-topic-am62-partialio-v6-12-b4-v4-0-1cb8eabd407e@baylibre.com
 v5: https://lore.kernel.org/r/20250306-topic-am62-partialio-v6-12-b4-v5-0-f9323d3744a2@baylibre.com

Previous versions "can: m_can: Add am62 wakeup support":
 v1: https://lore.kernel.org/lkml/20240523075347.1282395-1-msp@baylibre.com/
 v2: https://lore.kernel.org/lkml/20240729074135.3850634-1-msp@baylibre.com/
 v3: https://lore.kernel.org/lkml/20241011-topic-mcan-wakeup-source-v6-12-v3-0-9752c714ad12@baylibre.com
 v4: https://lore.kernel.org/r/20241015-topic-mcan-wakeup-source-v6-12-v4-0-fdac1d1e7aa6@baylibre.com
 v5: https://lore.kernel.org/r/20241028-topic-mcan-wakeup-source-v6-12-v5-0-33edc0aba629@baylibre.com
 v6: https://lore.kernel.org/r/20241219-topic-mcan-wakeup-source-v6-12-v6-0-1356c7f7cfda@baylibre.com

Changes in v6:
 - Narrowed down the wakeup-source binding to phandle lists
 - Split off the mcan and DT changes into separate series

Changes in v5:
 - Rebased to v6.14-rc1
 - Merged m_can and ti_sci series to avoid conflicts and show
   dependencies more easily
 - Added definitions of system-states for am62/am62a/am62p
 - Moved wakeup-source definitions into board dts files as they require
   a bit of support on the board.
 - Updated ti_sci support to walk through the wakeup-source phandle
   lists
 - Added pinctrl settings for mcu_mcan0/1 on all boards
 - Minor style updates for ti_sci support for transfers without response
 - Update and move the dt-binding for wakeup-source from the m_can
   binding to the dt-schema repository

Changes in v4:
 - Rebased to v6.13-rc1
 - Removed all regulator related structures from patches and implemented
   the wakeup-source property use instead.

Changes in v3:
 - Remove other modes declared for PREPARE_SLEEP as they probably won't
   ever be used in upstream.
 - Replace the wait loop after sending PREPARE_SLEEP with msleep and do
   an emergency_restart if it exits
 - Remove uarts from DT wakeup sources
 - Split no response handling in ti_sci_do_xfer() into a separate patch
   and use goto instead of if ()
 - Remove DT binding parital-io-wakeup-sources. Instead I am modeling
   the devices that are in the relevant group that are powered during
   Partial-IO with the power supplies that are externally provided to
   the SoC. In this case they are provided through 'vddshv_canuart'. All
   devices using this regulator can be considered a potential wakeup
   source if they are wakeup capable and wakeup enabled.
 - Added devicetree patches adding vcc_3v3_sys regulator and
   vddshv_canuart for am62-lp-sk
 - Add pinctrl entries for am62-lp-sk to add WKUP_EN for mcu_mcan0 and
   mcu_mcan1

Changes in v2:
 - Rebase to v6.11-rc1
 - dt-binding:
    - Update commit message
    - Add more verbose description of the new binding for a better
      explanation.
 - ti_sci driver:
    - Combine ti_sci_do_send() into ti_sci_do_xfer and only wait on a
      response if a flag is set.
    - On failure to enter Partial-IO, do emergency_restart()
    - Add comments
    - Fix small things

Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
---
Markus Schneider-Pargmann (2):
      firmware: ti_sci: Support transfers without response
      firmware: ti_sci: Partial-IO support

 drivers/firmware/ti_sci.c | 134 ++++++++++++++++++++++++++++++++++++++++++++--
 drivers/firmware/ti_sci.h |   5 ++
 2 files changed, 136 insertions(+), 3 deletions(-)
---
base-commit: 64e9fdfc89a76fed38d8ddeed72d42ec71957ed9
change-id: 20241008-topic-am62-partialio-v6-12-b4-c273fbac4447
prerequisite-change-id: 20241009-topic-mcan-wakeup-source-v6-12-8c1d69931bd8:v7
prerequisite-patch-id: 02b7142f56c849c9a3faab2d2871805febd647aa
prerequisite-patch-id: 830b339ea452edd750b04f719da91e721be630cb
prerequisite-patch-id: 56fd0aae20e82eb2dfb48f1b7088d62311a11f05
prerequisite-patch-id: 41f55b96c0428240d74d488e3c788c09842a1753
prerequisite-change-id: 20250415-topic-am62-dt-partialio-v6-15-327dd1ff17da:v1
prerequisite-patch-id: 74d50dae2d453ec9a3e72c89df40e97df2ebed9b
prerequisite-patch-id: b68c32a3053c71bc0c3e301dc0b6b4f54546f789
prerequisite-patch-id: 6fe934ea35357712bb07ada84c157769418704d1
prerequisite-patch-id: 993138fcd8edcedf0d7ba033df7bf9ed3d45d40f
prerequisite-patch-id: e0330ef081affbe91e02b2e9b5a76ebab59e6ea6
prerequisite-patch-id: 864092d43dff594e8be7812a80a3e4a1739ee038
prerequisite-patch-id: b4f982c7015f03acc41285195aff0f3a44b027c2

Best regards,
-- 
Markus Schneider-Pargmann <msp@baylibre.com>

