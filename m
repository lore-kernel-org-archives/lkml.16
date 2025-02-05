Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D941722CBFA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752244; cv=none; b=fAaZLnxODho0Va5aPd7UehGPSratbHo2TkyVbz5sA/sCR+4EWFVnS+zaVn/wNXJToS8ZxY20dtACDTvWTZiWRI3S3CzGdXAps7Zkg2g3M+q5m4ZDEh+9GHGQppNEwiLqEUWGN0vDJDK8DnWKkqz8Nx/ouMkY0uj3eCrz85MGDAA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752244; c=relaxed/simple;
	bh=blqJcxnKg91LnxCDkdxlfYSVX/zKY1PoB7+5I7BbB9w=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=DYjKa6WYgXec54tWzOepTQd+A+wsWurDGOSC4I7sGzmXl/rpMfcOWGBAlBMSeGm4IrmK2CA5Y3Z0Cq7l+nr3OFyWt63RQIuXKTSsJvLRBLWCxKCZ6ByX1JJkI4cO0t3aO7s0AWNwuHuDOBcjFTfGqSZIdYJCWY7UUtnYkDBBktY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=11U/V/OT; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=kNX80ONb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="11U/V/OT";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="kNX80ONb"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pB915+mRW6G1JuwVlEatRyv58a5CfnimTW+NxxsnfcI=;
	b=11U/V/OT2E5+MJBFmmYRfGWtXA7HZVE9h6ckCd2vw2VIlrk02jzxHlh/zcJMP2K16MvbOF
	MIpgQsCW1bNk+aqkoFvrq/jeKV3L1oZ0nkrh8cHqM9nBuzQSuTVzn+xyzUCVoVj9LjLAUW
	myvglLi/xM9gdRPkpzG39ERRA1CWivuOjexvKfWufca86FioStMpwo46pDd3wVXdm3qAZJ
	sEazul9eJEHeBUjONyTMuQOmx94q1PwsrMSGHpd/rK9EJkewgdKkACdbByi9Hv4g3255IN
	yp0VFjQbUdgkwshgC0yUoF5HseZS2mgEUsW9ifM90/xEDecNNpIvFuUnXsMmlQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752240;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=pB915+mRW6G1JuwVlEatRyv58a5CfnimTW+NxxsnfcI=;
	b=kNX80ONbo+lhShVXI9LpmvhBHhjAwBO8KpOdngAf1F0R4xDUkN0We4SHl+X/rM9snutYw5
	IHFm2Gp09S+maYCg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 09/24] net: ethernet: cortina: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:29 +0100
Message-Id: <ddbeac1e5d81df33e9cccb099f520111cb8ce9c4.1738746872.git.namcao@linutronix.de>
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
 drivers/net/ethernet/cortina/gemini.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/net/ethernet/cortina/gemini.c b/drivers/net/ethernet/c=
ortina/gemini.c
index 991e3839858b..2b4bb74f21bf 100644
--- a/drivers/net/ethernet/cortina/gemini.c
+++ b/drivers/net/ethernet/cortina/gemini.c
@@ -1833,9 +1833,8 @@ static int gmac_open(struct net_device *netdev)
 	gmac_enable_tx_rx(netdev);
 	netif_tx_start_all_queues(netdev);
=20
-	hrtimer_init(&port->rx_coalesce_timer, CLOCK_MONOTONIC,
-		     HRTIMER_MODE_REL);
-	port->rx_coalesce_timer.function =3D &gmac_coalesce_delay_expired;
+	hrtimer_setup(&port->rx_coalesce_timer, &gmac_coalesce_delay_expired, CLO=
CK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	netdev_dbg(netdev, "opened\n");
=20
--=20
2.39.5

