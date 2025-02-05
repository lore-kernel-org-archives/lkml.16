Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B9422CBEB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752240; cv=none; b=N0VlpmZa0s5qb/Hiex5j5BWoGv49l8HWMqJILpTXe7O2+wW71m23H2zYQcR9PO4AEBHwZMa7pVMwV28SVdZ3HvnPLI0A1amDgej0+RaeJMtfdtA7/fKvzJPuOCa4YxFheTTSequoeqLbRt8hxNtmndX37zknQbxCYKmP585Yc3Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752240; c=relaxed/simple;
	bh=1VKERE/3NmbrcRJIxE0CJ9VhWtSsoK7JDqT1V7qm/gg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=IE8XdBvoECx85dBXxmUTJm1zx7Uh3SQsqwHZ9IvdZSeSNVYt1+rZisMWsuszpVMJp0WmrkgwGTQ7h49oI2hwGusC1cmQHWZ+QRC+cIPAslKweAZqHuVlHCRCefeLpH3gi/J0N9i0AlzGKTQns5EnB2iKiqvJWfzUT2G9jyEhBZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=t9KfqIxo; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OkSckskN; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="t9KfqIxo";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OkSckskN"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6f8tajSQxlWZwKFys7jINlkCMDSb595FfBICmDbiTIE=;
	b=t9KfqIxoHgTY56FMfcRb0LROOy8S2f0tB087DF/mYytsdY8SwbA9zQu47HooY3UEhH9B4R
	TsDwC2qMl1StsNALpW0+1hdqNmEJgLWhne3L0qPsn3PyHwQgsfs6F8vDg3apvVdhHQepKt
	FCpn00JvJ1ceJcUoeCUN7T/y1rqxsWHrYhT0hMCztzd5I45BwTDEM4GYuMN9FNhDzkGvWY
	zjmdCIptKbzKWDndfZB0vLHlB1zzgwKh1cD4oqlX0iR1mc4IflBFH6qq7ZnLYZedJ3nHcU
	Qy/Z97+N43TuLBMvRHXDaKRFANHP/G8Bx95X1zgJQIwMc2ZBQHKD/PKmBeGp+Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752237;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=6f8tajSQxlWZwKFys7jINlkCMDSb595FfBICmDbiTIE=;
	b=OkSckskN8hz3xbyNAOf2ed4eNBDqYvaR7RZh1YOjH83zZ/WJ0FFNTaf4JqWZcFMWHcpwj+
	JAD65jxXO0fHj0DQ==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Marc Kleine-Budde <mkl@pengutronix.de>,
	Oliver Neukum <oliver@neukum.org>,
	Kalle Valo <kvalo@kernel.org>
Subject: [PATCH v2 00/24] hrtimers: Consolidate hrtimer initialization - Part 3
Date: Wed,  5 Feb 2025 11:43:20 +0100
Message-Id: <cover.1738746872.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimers is initialized with hrtimer_init(), and after that the timer's
callback function is setup separately. This separate initialization is
error prone and awkward to use.

hrtimer_setup() combines the initialization and is simpler to use.

Switch to use the new setup function. Most conversions were done with
Coccinelle, see the sematic patch below.

This series is intended to be applied to the tip tree.

v1 -> v2 https://lore.kernel.org/lkml/cover.1729865232.git.namcao@linutroni=
x.de
  - rebase to v6.14-rc1
  - use the existing hrtimer_dummy_timeout() for rt2x00 driver and bcm driv=
er
---
virtual patch
@@ expression timer, clock, mode, func; @@
- hrtimer_init(timer, clock, mode);
  ...
- timer->function =3D func;
+ hrtimer_setup(timer, func, clock, mode);

@@ expression timer, clock, mode, func; @@
- hrtimer_init(&timer, clock, mode);
  ...
- timer.function =3D func;
+ hrtimer_setup(&timer, func, clock, mode);

@@ expression timer, clock, mode, func; @@
- hrtimer_init_on_stack(&timer, clock, mode);
  ...
- timer.function =3D func;
+ hrtimer_setup_on_stack(&timer, func, clock, mode);

@@ expression timer, clock, mode; @@
- hrtimer_init_sleeper_on_stack(timer, clock, mode);
+ hrtimer_setup_sleeper_on_stack(timer, clock, mode);

---
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
Cc: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Oliver Neukum <oliver@neukum.org>
Cc: Kalle Valo <kvalo@kernel.org>
---
 drivers/net/can/m_can/m_can.c                 |  9 ++++---
 .../net/can/spi/mcp251xfd/mcp251xfd-ring.c    |  8 +++----
 drivers/net/ethernet/cortina/gemini.c         |  5 ++--
 drivers/net/ethernet/ec_bhf.c                 |  3 +--
 drivers/net/ethernet/freescale/fec_ptp.c      |  4 ++--
 drivers/net/ethernet/hisilicon/hip04_eth.c    |  4 +---
 drivers/net/ethernet/intel/igc/igc_main.c     |  4 ++--
 .../net/ethernet/marvell/mvpp2/mvpp2_main.c   |  5 ++--
 .../net/ethernet/marvell/octeontx2/af/ptp.c   |  3 +--
 .../ethernet/microchip/sparx5/sparx5_packet.c |  4 ++--
 .../ethernet/qualcomm/rmnet/rmnet_map_data.c  |  4 ++--
 .../net/ethernet/stmicro/stmmac/stmmac_main.c |  6 ++---
 drivers/net/ethernet/ti/am65-cpsw-nuss.c      |  9 ++++---
 drivers/net/ethernet/ti/icssg/icssg_common.c  |  5 ++--
 drivers/net/ethernet/ti/icssg/icssg_prueth.c  |  5 ++--
 drivers/net/ieee802154/at86rf230.c            |  4 ++--
 drivers/net/usb/cdc_ncm.c                     |  3 +--
 .../wireless/mediatek/mt76/mt76x02_usb_core.c |  4 ++--
 .../net/wireless/ralink/rt2x00/rt2x00dev.c    |  4 ++--
 drivers/net/wireless/virtual/mac80211_hwsim.c |  6 ++---
 drivers/net/wwan/iosm/iosm_ipc_imem.c         | 24 ++++++++-----------
 include/linux/hrtimer.h                       |  5 ++++
 kernel/time/hrtimer.c                         |  5 ----
 net/can/bcm.c                                 | 20 +++++++---------
 net/can/isotp.c                               | 10 ++++----
 net/can/j1939/bus.c                           |  4 ++--
 net/can/j1939/transport.c                     |  8 ++-----
 net/core/dev.c                                |  3 +--
 net/ipv4/tcp_timer.c                          | 10 ++++----
 net/mac802154/main.c                          |  4 ++--
 net/sched/act_gate.c                          |  3 +--
 net/sched/sch_api.c                           |  3 +--
 net/sched/sch_taprio.c                        |  6 ++---
 net/xfrm/xfrm_iptfs.c                         |  6 ++---
 net/xfrm/xfrm_state.c                         |  4 ++--
 35 files changed, 88 insertions(+), 126 deletions(-)

--=20
2.39.5

