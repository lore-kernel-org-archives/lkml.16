Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 037F022F3B4
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752250; cv=none; b=m2oAWlpL1fv4jT09BDFa4aGNjGsP3WwpgdTfThzoST1JXlcdDGX3BM6unVkrNbo4sSjA3ERRod2TENHnP8nkd2fltHv+WrtnwU7TGxlIJt2/oEaL0QAtCByuuO2CJduA3B6PcZSpTNFADVCphx+QuL/MxLYHQh0k/lgLjf5PPlY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752250; c=relaxed/simple;
	bh=KGS8vhGRR2eHOXmkjqrkc+GP/9h46GaMmPLtKj3+wnE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OdkxahfULRKnOyA+k621t0NnIEXyozcm3s8SPxgBHjEUuvIDD3f7VWOzDCQYtIY7/oMmJza1VLdvjrgYYqxVXNjtaW0pXz288UwyUghejt4KuXQQXrLOFNKBSfNfXYP3dC92Bl+0wPtDlxkfRGmw2PeNyFG7756ObY3Tp0NCmpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=P0hOPQXr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=WAuN/w8m; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="P0hOPQXr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="WAuN/w8m"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eS8b4wjj7FsT/6AEfL6jTm7G7uaMle7YtZmUlKJVEE4=;
	b=P0hOPQXrI7A8ZcxEvChGypmMBkCWyZb2dsMsfHUSRDL/WF9d+fJkcd4XHoRZGWxSKRRHkM
	y2AdnjL8YYSNo9jLYnhgsFiYVXp/h+QnCibVtrqm7s6DwRWm0YnhrxP8iFJ2BLYE3tX8ov
	O0fbc0fNvxx14J+qCPso2/J2pCoOhgPUCGN8HVpqdwXH2NGWWADaLgUPznvwdmU3zYUEN2
	omE1dBIFMK85c8D26W0jPxvh7v8d68SqO8Uuds+WBfxRZ/08Jl1S9FEYMQOxHA60TjUhd8
	FfBLw38iK3yDQFSW7qD/d5cFbVIULwaEefZLP6+VDvlfWoChIuIGUAXhs9BZOA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752246;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=eS8b4wjj7FsT/6AEfL6jTm7G7uaMle7YtZmUlKJVEE4=;
	b=WAuN/w8mMasjAZHWMwgTBVilxcFiHVvYRRwLUs7M4HeQ9l7Rw93LqUn6QY9onzgM8+4Wai
	82jngHdyqgDddkAw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>
Subject: [PATCH v2 24/24] xfrm: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:43:44 +0100
Message-Id: <d338b246f087ee2b2a305348c896449e107a7ff4.1738746872.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>
---
 net/xfrm/xfrm_iptfs.c | 6 ++----
 net/xfrm/xfrm_state.c | 4 ++--
 2 files changed, 4 insertions(+), 6 deletions(-)

diff --git a/net/xfrm/xfrm_iptfs.c b/net/xfrm/xfrm_iptfs.c
index 755f1eea8bfa..3b6d7284fc70 100644
--- a/net/xfrm/xfrm_iptfs.c
+++ b/net/xfrm/xfrm_iptfs.c
@@ -2625,12 +2625,10 @@ static void __iptfs_init_state(struct xfrm_state *x,
 			       struct xfrm_iptfs_data *xtfs)
 {
 	__skb_queue_head_init(&xtfs->queue);
-	hrtimer_init(&xtfs->iptfs_timer, CLOCK_MONOTONIC, IPTFS_HRTIMER_MODE);
-	xtfs->iptfs_timer.function =3D iptfs_delay_timer;
+	hrtimer_setup(&xtfs->iptfs_timer, iptfs_delay_timer, CLOCK_MONOTONIC, IPT=
FS_HRTIMER_MODE);
=20
 	spin_lock_init(&xtfs->drop_lock);
-	hrtimer_init(&xtfs->drop_timer, CLOCK_MONOTONIC, IPTFS_HRTIMER_MODE);
-	xtfs->drop_timer.function =3D iptfs_drop_timer;
+	hrtimer_setup(&xtfs->drop_timer, iptfs_drop_timer, CLOCK_MONOTONIC, IPTFS=
_HRTIMER_MODE);
=20
 	/* Modify type (esp) adjustment values */
=20
diff --git a/net/xfrm/xfrm_state.c b/net/xfrm/xfrm_state.c
index ad2202fa82f3..9bd14fdb67a5 100644
--- a/net/xfrm/xfrm_state.c
+++ b/net/xfrm/xfrm_state.c
@@ -746,8 +746,8 @@ struct xfrm_state *xfrm_state_alloc(struct net *net)
 		INIT_HLIST_NODE(&x->bysrc);
 		INIT_HLIST_NODE(&x->byspi);
 		INIT_HLIST_NODE(&x->byseq);
-		hrtimer_init(&x->mtimer, CLOCK_BOOTTIME, HRTIMER_MODE_ABS_SOFT);
-		x->mtimer.function =3D xfrm_timer_handler;
+		hrtimer_setup(&x->mtimer, xfrm_timer_handler, CLOCK_BOOTTIME,
+			      HRTIMER_MODE_ABS_SOFT);
 		timer_setup(&x->rtimer, xfrm_replay_timer_handler, 0);
 		x->curlft.add_time =3D ktime_get_real_seconds();
 		x->lft.soft_byte_limit =3D XFRM_INF;
--=20
2.39.5

