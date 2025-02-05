Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C10A222E41C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752247; cv=none; b=AmVPm0t/kLBXW88SHLzfIOR6JA1GlvzUWvSgrbM2J02yL+kZURjD5LDaT8E+oGMk3wZrFBERGpPQzDxdtrEbUg5DB6vSmJREhsBSi9WZPvVeod9VuADglseM5SoUQrRfsWcuHFtK+SWhCmflnfMgI4RTjSdBNXQmhs+Ops03a5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752247; c=relaxed/simple;
	bh=FzqoDf+9djRGV4O2V7KhBDvcaWsBi4mVJ5qtmklUfck=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=t2GU5S0Efs7nCSpQDxzAY4smSgLNdDMSQLF9p5Go0Cny3bKMWe//TjIvGp9x7P0lO6/1AjPNGRqWJb31ZZVZuWeOVr9jlf2klIe5HAn4CXRZS9m0dLs+Nbg4TAuZPPa/LgxkyUHICjGBZAqKCb19V8fWmYoNMTeyHxl+NcQCzC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=lc405zqm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=JNPYnZu+; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="lc405zqm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="JNPYnZu+"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xN0W6G+08aPqthOGDvo6LpKjkTabUBuSdTTHJczVyd8=;
	b=lc405zqmE6EYS+ehBV9ZBAeEWtj0U/pIsH2FNAxMTXUEajo80+PMtaxJ7LKCWTLE4AyYGQ
	AoSRUpSVKD3w/Ja+4rqDtZWTrjKTxNgrcH4EuRdLkKDypq5WDWaSHeoUS+nWiK66IikH5/
	fvVu59p6iejv60trl7yhi+eUJvlSOs/BRXeoaG6qy2+lJYFxZPYXjJlJgFH1VKBfb72RDD
	E6M6kCe7e915iLabgNlLLwFed/J3CuTbYMlN+m8uVCIbv7LO6D0t095fv50i4r/jbmAGTB
	AN8T4zVtg78zd6kMrAMD7MGnTUK+x1hBmkwl7x4kKI9fDCde8nn0s2fDfbIRQQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752243;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=xN0W6G+08aPqthOGDvo6LpKjkTabUBuSdTTHJczVyd8=;
	b=JNPYnZu+1jVeB8dDYp4GgUS24bsCeNHXh0LBwo1efO8DkObOHIN4YrAebGwCQn/Pebnry+
	gHV8KlWjqdO/uoAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 15/24] net: qualcomm: rmnet: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:35 +0100
Message-Id: <4312885d95fc99053b2c285f74cc83a852c03f4a.1738746872.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746872.git.namcao@linutronix.de>
References: <cover.1738746872.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c b/drivers=
/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
index a5e3d1a88305..8b4640c5d61e 100644
--- a/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
+++ b/drivers/net/ethernet/qualcomm/rmnet/rmnet_map_data.c
@@ -686,8 +686,8 @@ void rmnet_map_update_ul_agg_config(struct rmnet_port *=
port, u32 size,
=20
 void rmnet_map_tx_aggregate_init(struct rmnet_port *port)
 {
-	hrtimer_init(&port->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	port->hrtimer.function =3D rmnet_map_flush_tx_packet_queue;
+	hrtimer_setup(&port->hrtimer, rmnet_map_flush_tx_packet_queue, CLOCK_MONO=
TONIC,
+		      HRTIMER_MODE_REL);
 	spin_lock_init(&port->agg_lock);
 	rmnet_map_update_ul_agg_config(port, 4096, 1, 800);
 	INIT_WORK(&port->agg_wq, rmnet_map_flush_tx_packet_work);
--=20
2.39.5

