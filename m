Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DFC7145B24
	for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 23:57:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743292668; cv=none; b=sZJR8wQhty3VlB3oPNGDbmwBM5UgPq6ChnpcsBSFmn5YoxZ/LWaTlE16Z70fFwQW+cceEt4T8bOGnMNKD9t2Ap79zOArFJf1oL70n/XoyYxLfy/PwOdYypxNfndMDJ+d84I36o916ofpb8eH38bSQ2y0FW1Cu0ZUkMqcdsfc668=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743292668; c=relaxed/simple;
	bh=jw3OV5XiMsKH+QxGWOvbJOF/Snh46k99m6wJx62Of8g=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=gjtlqVk8V2sASXNbgPiMZBYxpM9GK0A1b/4I6BEs6QaAPdDyKY3LADCDSOcEro8D88PmcNvLUUZHy7YFd+0ClPaMG81BTDA6HuQCnhqYtH20Wu4j74ZJ/0dbMO9k95/I1pIeDRDdoclaFgtZLvwdrc4iv16qUyQtQYRylsr60kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DtGaYpyA; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DtGaYpyA"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-60219a77334so1710087eaf.1
        for <linux-kernel@vger.kernel.org>; Sat, 29 Mar 2025 16:57:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743292665; x=1743897465; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nmdLuCAm1CAJ4jEnyOVq/bYPb1GgUEH4akc+65VyZ94=;
        b=DtGaYpyAxPLJjl5priU3AclUTD1sJ8Ngq9szJlnBXTIkc/3rrQkMD3WoPn32pFG7wP
         hMzRt4Lm+BL7ci8gqWfsJxCnjWjEQNCrtvK95/1G2TuY7J/GGXESp1bJvB5bduwrkUhZ
         6HmmaaKltZCz0dM6sj9hPGACHR/HdROZG3Rr5NdSrTrA1IhOlxDTvM/d9zSJyyA1VKdf
         8Vmm7DTkt/t/fO5/v5AERQ4qQrc1OtA3gKGCGLLcJso3GYBoLJXVP1yDER6FtUXof5de
         kDuVmUfq+u/syDNFEueS5Imw+Ei66m/8joJVuVXmSdfsJbsFD/ZVOnh4Ae01Iqd8DXBv
         UthA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743292665; x=1743897465;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=nmdLuCAm1CAJ4jEnyOVq/bYPb1GgUEH4akc+65VyZ94=;
        b=ZQHdCyz0qhO0fmXV5SuE4aSqlNIP539zy9DSyXa1PAg3r6wDGkrzPHc5BbCGCouCdp
         yMA9PhVXLu3Suno1HTjAsQeHK9w8vDsNmLjBgzxdqeckLnab0K4JBik1c3lPat/JWfyZ
         Boif0FI3GAyTX3ZvZeSs/IvQiCDMEQViVI4WDyFUsQm48gP8CAAtXoqriSSeHCriU2cw
         7A67yEC3CscEK6n4pxPq+V9r1OO96r9ANjrUfaYyp/mUYLe+SlL4gd1k9tjzTCpIRAtj
         jry26cpwcszabaDwVoZ3ZhvpKDApXjfeE08Wk+qNwbe8dwMhNTi+wjhi28iXbk+QiCWW
         njDA==
X-Gm-Message-State: AOJu0Yxy2w1Ui8jRAsUV4rqSHspwSNVOOUt6EHKKK7E+XAHE9ufqKCHl
	IhZS5LKIBwj112bpHa0yWBTTV6Ii1g+++tJtaGeZ+LQ11cgkIBdzfv0IbdlHSnfbKal1olLu+Eu
	bbWNbWaVu8PgsmmFOhW2Vz14eIwQaaK8p
X-Gm-Gg: ASbGncsfQRL0QNVpTiuESb0UmMfLOgKbKvN2ioexNJajsYgZdE9ybkLp8dAbcRXmdRC
	+I8AvtJwMh71KibhmMrj0ErY5KMOcUOxfS6KK9A5eex57eu3dBHMBObmjCox1owOqO4q33xO3d7
	F1g0wlXPU+uD1Xtskliwe9Yo8Em4s=
X-Google-Smtp-Source: AGHT+IHun+H7WFPlKCwkbZmr48Ry4kBTHVoSBceNootkXSTXeWa/xWKLJ9WlUHvRVxHSm9sMcNguBCc9GExdVj5PNQE=
X-Received: by 2002:a05:6820:2710:b0:600:29ec:7619 with SMTP id
 006d021491bc7-60290e5821cmr2130089eaf.2.1743292665379; Sat, 29 Mar 2025
 16:57:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sat, 29 Mar 2025 18:57:34 -0500
X-Gm-Features: AQ5f1JoYZOgXhh_ZakSNYcgqU00butGrTYEuoZM0qK0JvlcozMWOWi-dvPiJAnU
Message-ID: <CABb+yY3nL=VjLZq_pDxQfr3m2-B78hiuJyEWhSNRU_zcjaQdKg@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.15
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

The following changes since commit 4701f33a10702d5fc577c32434eb62adde0a1ae1:

  Linux 6.14-rc7 (2025-03-16 12:55:17 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.15

for you to fetch changes up to 1ec12fd31ecc38e2a81a137be7eec5df51894bcc:

  mailbox: Remove unneeded semicolon (2025-03-26 20:58:26 -0500)

----------------------------------------------------------------
misc: Constify amba_id table
pcc: cleanup and refactoring of shmem and irq handling
qcom: add MSM8226 compatible
fsl,mu: add i.MX94 compatible
core: misc rejig of header includes
  minor const fixes
mediatek: remove cl in struct cmdq_pkt
tegra: define dimensioning masks in SoC data

----------------------------------------------------------------
Chen Ni (1):
      mailbox: Remove unneeded semicolon

Chun-Kuang Hu (1):
      mailbox: mtk-cmdq: remove cl in struct cmdq_pkt

Frank Li (1):
      dt-bindings: mailbox: fsl,mu: Add i.MX94 compatible

Huisong Li (1):
      mailbox: pcc: Fix the possible race in updation of chan_in_use flag

Jason-JH Lin (1):
      dt-bindings: mailbox: mediatek: Add support for MT8196 GCE mailbox

Kartik Rajput (1):
      mailbox: tegra-hsp: Define dimensioning masks in SoC data

Krzysztof Kozlowski (5):
      mailbox: pl320-ipc: Drop unused xxx_destination functions
      mailbox: pl320-ipc: Constify amba_id table
      mailbox: arm_mhu: Constify amba_id table
      mailbox: arm_mhu_db: Constify amba_id table
      mailbox: arm_mhuv2: Constify amba_id table

Luca Weiss (1):
      dt-bindings: mailbox: qcom: add compatible for MSM8226 SoC

Sudeep Holla (7):
      mailbox: pcc: Always clear the platform ack interrupt first
      mailbox: pcc: Drop unnecessary endianness conversion of pcc_hdr.flags
      mailbox: pcc: Return early if no GAS register from
pcc_mbox_cmd_complete_check
      mailbox: pcc: Use acpi_os_ioremap() instead of ioremap()
      mailbox: pcc: Refactor error handling in irq handler into
separate function
      mailbox: pcc: Always map the shared memory communication address
      mailbox: pcc: Refactor and simplify check_and_ack()

Tudor Ambarus (6):
      mailbox: use error ret code of of_parse_phandle_with_args()
      mailbox: don't protect of_parse_phandle_with_args with con_mutex
      mailbox: sort headers alphabetically
      mailbox: explicitly include <linux/bits.h>
      mailbox: remove unused header files
      MAINTAINERS: add mailbox API's tree type and location

 .../devicetree/bindings/mailbox/fsl,mu.yaml        |   7 +-
 .../bindings/mailbox/mediatek,gce-mailbox.yaml     |   4 +
 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    |   1 +
 MAINTAINERS                                        |   1 +
 drivers/mailbox/arm_mhu.c                          |   2 +-
 drivers/mailbox/arm_mhu_db.c                       |   2 +-
 drivers/mailbox/arm_mhuv2.c                        |   2 +-
 drivers/mailbox/exynos-mailbox.c                   |   2 +-
 drivers/mailbox/mailbox.c                          |  23 ++---
 drivers/mailbox/mailbox.h                          |   2 +
 drivers/mailbox/pcc.c                              | 113 ++++++++++-----------
 drivers/mailbox/pl320-ipc.c                        |  14 +--
 drivers/mailbox/tegra-hsp.c                        |  72 ++++++++++---
 include/acpi/pcc.h                                 |   6 --
 include/linux/mailbox/mtk-cmdq-mailbox.h           |   1 -
 include/linux/mailbox_client.h                     |   2 +-
 include/linux/mailbox_controller.h                 |   6 +-
 17 files changed, 149 insertions(+), 111 deletions(-)
