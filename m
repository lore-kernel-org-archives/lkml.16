Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B4E1AA786
	for <linux-kernel@vger.kernel.org>; Sun,  1 Jun 2025 22:25:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748816722; cv=none; b=AnHSOUBOvSOORy/DaofI3epJ5V/vuRZDLm11eJCjlP6q68yet/xXDMctiRgdhXpQaSdOEm2jNtgvyIW666myw1yxa0hsJ6jou3VmpNJDD19XrqpAeN991891oGE5h7XTzwII0vKwQh55W3nXi48GjI2CMda33X6/OHUlr34giWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748816722; c=relaxed/simple;
	bh=UQMEiCY4uH1jwQAuC/8hK5QUoRl/PDIjkY4Qa7RtvhU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=mIX3YkE9jLdzcplljyRx02j4dg9GnWVhEyn/5VS0olNNe1V8ZRNNJmWkhalUnwfsmRdMNnj/MJm+9Xiqc6rC2tItzN6TlZaBeoQ8MhmSr9x3yqWd+SHKp14zV2Ve9iiofTWs6cJE/Zwt9fzCtGeHArTaOS9T0dy+XavyLfF040A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fx7SWbaT; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fx7SWbaT"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-4067106dd56so2319548b6e.3
        for <linux-kernel@vger.kernel.org>; Sun, 01 Jun 2025 15:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748816719; x=1749421519; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=bQBtyBckoPpDZJKoZg4EzGegksEO0utLn/9XYWq5qDM=;
        b=Fx7SWbaTOsXycGGkqD++vFMTa0Kd8ncIKnbIAZphPl5zzSkATzkaOCkMzEQ6IpcH9e
         dDP7dlaY3weE0PoOtJ3jUbgzHnltF3cqH2dtqJihPQ+IxbrCJ1/JJsqY3FZGD1hN9em1
         XXHi09/G+sTg9sGvS5NFqZOUZvBu2RkZr6/ouNJQL5HBG89tDFamew8PMH6gt+PUdug7
         SVf910SyMPYtgS1VVCP3INVBfs/AZ+okpe9Lo+oqmy955JnPaDh+bAPnmfW78i72RpuF
         gqDSwa+CpF9NJAy1Y7hXOFJyKjEnpRjbi4VysVPUSHV3HxH8PhB3GxewDbg9dZkwdHsT
         3mKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748816719; x=1749421519;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=bQBtyBckoPpDZJKoZg4EzGegksEO0utLn/9XYWq5qDM=;
        b=OT7rVsXxy8eEckuX7ox9pnwvJjThZtQJQybBHmWGd9H2DHclx6QDvtK73UN26RVkWg
         qGJyCHnzVel8wMtYiFq2+yOYmQa63gzRXY9Z9uuNpUV1MA3xpGy0P5q8J0YulxlGiV6e
         VTvl5r444lhphz9kwtNqxrylXAVJ3T8/bEVKl3fAsS27Z1JoeFJuEPA9J+c40/yNegYo
         Z0/JkcD5l8CGzR04AGBawIgjci8oF7JUTxkOqNrJ0PTaw5vDMGE6iMCHErBcPRd5yuBI
         1cH7lf9/QkqnR/1PMJ7Dx0OBW7ASq+xLfoWVjPGAT6Nc8qDN2guZwlaGKoE6QLTCjtVc
         lwhQ==
X-Gm-Message-State: AOJu0YxJGVtU/sFrHQQQI1phrHorQR1Ky7Ht275tcrO/J2K3B2VAgBym
	3Vu3/lK4x829bV2ZfV9+Z6T1+jhbK+eQIcxttHL2gXfirMv3kRB+Bfv0qzfSsUOZVE6Ohoh/CY/
	0y4i/VXrOctESkeiHNDiXAgR33CQOp1TEhnni
X-Gm-Gg: ASbGncst63JJ8SniWCmpRISodCkOyF28ceV8E9VtdRR4ic2M3qZa0wqKrAP8F1aPB/N
	0HUiLWpiZl8LmNwGMEcW79EmJtNxL7WlnQvOqbqbJ9UYvC92s6OnJu7f3UW6viBc3dqiLW5WD2J
	onmcIzYfeR56aY9zLuAvvtDMxTBKLdYibTxA==
X-Google-Smtp-Source: AGHT+IG8h84cnoDGmPM2wUQp8K6n6nIRYzYCfzkJFo5ukI7macMT7pJZL3QEYaCjlzX/N63TOTdFmooErb/s7w5n5MU=
X-Received: by 2002:a05:6808:1d02:b0:406:7704:b2e9 with SMTP id
 5614622812f47-4067e550230mr5491095b6e.9.1748816718917; Sun, 01 Jun 2025
 15:25:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Jassi Brar <jassisinghbrar@gmail.com>
Date: Sun, 1 Jun 2025 17:25:07 -0500
X-Gm-Features: AX0GCFsDsAzayrx7tSJWlDUSaooEVCAH1bhCRroOmZTwTH6Zg-oJiU1qWyBmMac
Message-ID: <CABb+yY0mDQrYH0Z6=kRyCft5DXgUmhT2X-trRfs+PPd8i8ppbg@mail.gmail.com>
Subject: [GIT PULL] Mailbox changes for v6.16
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"

Hi Linus,

The following changes since commit a5806cd506af5a7c19bcd596e4708b5c464bfd21:

  Linux 6.15-rc7 (2025-05-18 13:57:29 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/jassibrar/mailbox.git
tags/mailbox-v6.16

for you to fetch changes up to d0b497df02e9b2ebcb5771c7b16e424c0614a366:

  mailbox: qcom-apcs-ipc: Assign OF node to clock controller child
device (2025-05-29 10:01:35 -0500)

----------------------------------------------------------------
sophgo: add driver for CV18XX series
mailbox core: misc cleanup
qcom: add SM7150 APCS compatible
      apcs: added separate clock node
imx: fix tx doorbell send
microchip: misc compile option fix
mediatek: Refine GCE_GCTL_VALUE setting

----------------------------------------------------------------
David Wronek (1):
      dt-bindings: mailbox: qcom: Add the SM7150 APCS compatible

Jason-JH Lin (1):
      mailbox: mtk-cmdq: Refine GCE_GCTL_VALUE setting

Peng Fan (7):
      mailbox: imx: Fix TXDB_V2 sending
      mailbox: Use dev_err when there is error
      mailbox: Not protect module_put with spin_lock_irqsave
      mailbox: Propagate correct error return value
      mailbox: Remove devm_mbox_controller_unregister
      mailbox: Use guard/scoped_guard for con_mutex
      mailbox: Use guard/scoped_guard for spinlock

Stephan Gerhold (2):
      dt-bindings: mailbox: qcom,apcs: Add separate node for clock-controller
      mailbox: qcom-apcs-ipc: Assign OF node to clock controller child device

Yue Haibing (1):
      mailbox: mchp-ipc-sbi: Fix COMPILE_TEST build error

Yuntao Dai (2):
      dt-bindings: mailbox: add Sophgo CV18XX series SoC
      mailbox: sophgo: add mailbox driver for CV18XX series SoC

 .../bindings/mailbox/qcom,apcs-kpss-global.yaml    | 170 +++++++++++-----
 .../bindings/mailbox/sophgo,cv1800b-mailbox.yaml   |  60 ++++++
 drivers/mailbox/Kconfig                            |  14 +-
 drivers/mailbox/Makefile                           |   2 +
 drivers/mailbox/cv1800-mailbox.c                   | 220 +++++++++++++++++++++
 drivers/mailbox/imx-mailbox.c                      |  21 +-
 drivers/mailbox/mailbox.c                          | 199 +++++++------------
 drivers/mailbox/mtk-cmdq-mailbox.c                 |  51 +++--
 drivers/mailbox/qcom-apcs-ipc-mailbox.c            |  16 +-
 include/linux/mailbox_controller.h                 |   3 -
 10 files changed, 536 insertions(+), 220 deletions(-)
 create mode 100644
Documentation/devicetree/bindings/mailbox/sophgo,cv1800b-mailbox.yaml
 create mode 100644 drivers/mailbox/cv1800-mailbox.c
