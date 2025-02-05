Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D523235C15
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752427; cv=none; b=XKGVs/A0qrCEzGY/BDvQ3ALlo+7ZpJylOXdA3Sn9eZjY6XxbXqUgsWpnyPqVs9I99Rh/jIFiZP6fMnCgLoeyAPGMFoyhjcmulC8No1KgGQJMRZaxUDXyJhFplwhJ7ZV1KcAsv8QwwDw/3+aCBPg6ONrS88YvclW2cIaiJ0jTOxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752427; c=relaxed/simple;
	bh=nX8DXsCpT9rgqoVzI56QfgEL5GqeB1usbTrTYi/dR8U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WwE+UmeiHzm/dweFitmNT2Tr4PT6Jq+ubyKZVpVQRcj/srsk0+8kJYqBTZCDlrLzpf0ATyuA4oKeOY6Lx9dLfBx3ZQKM+xi13xJM91l1qk9WgX+jeXGnONJJP5myMTA9UshQvWQiotmkDVxOyBRovo+XvZZpgFLDdShMwOW1+uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=joo2Ocif; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OwIF2CeB; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="joo2Ocif";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OwIF2CeB"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2P48GePcAavn7WXu5LgLQbMUKtGqras4yxixT58g3xM=;
	b=joo2OciffMyRNMiWlclHMB7soh5BX7ThkBgl70X/XOi/2/WaA6uOoFV59TNJeiWqckIgSr
	cS7lZ9P4n4KxBnM79qHv/ODM0h8FzIp/rP8kPXC/ElHNI972aPfHotpK7JLTiHc8f12Mtg
	Tu8HwXT4udU9JMsMO29kJliRl8rwslGsBeY9zkWwNp7k+RjD45NVO47c3c7nx5/CIifnfW
	Svt21fXgUEJDVGhQ61NDa4/YHtRpW+go3F4k9Lnb9zUYj5jKwHkuy/Q7VaD/pEX2LbddMa
	yJ2nVvVybXLeXK8G6rgroVEOK5AXoLuq5hulw3LWC09kJupgCmmdDb/q6xLxfQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752423;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2P48GePcAavn7WXu5LgLQbMUKtGqras4yxixT58g3xM=;
	b=OwIF2CeBxBpj4K8suV39p9+Lr0c9aH61axPQv4zj7bmxyrcnPLWuQV26onG6Lv3h+OOP70
	f+H8bz/jKoYEYUAA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v2 32/45] drm/i915/gvt: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:20 +0100
Message-Id: <9af55b7d0918bb3642c6392fbb4800d8ea7c9c50.1738746904.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746904.git.namcao@linutronix.de>
References: <cover.1738746904.git.namcao@linutronix.de>
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

Acked-by: Zack Rusin <zack.rusin@broadcom.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Nam Cao <namcao@linutronix.de>
---
 drivers/gpu/drm/i915/gvt/display.c      | 3 +--
 drivers/gpu/drm/i915/gvt/sched_policy.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/gvt/display.c b/drivers/gpu/drm/i915/gvt/=
display.c
index 95570cabdf27..f668cd9487f1 100644
--- a/drivers/gpu/drm/i915/gvt/display.c
+++ b/drivers/gpu/drm/i915/gvt/display.c
@@ -581,8 +581,7 @@ static int setup_virtual_dp_monitor(struct intel_vgpu *=
vgpu, int port_num,
 	vgpu->display.port_num =3D port_num;
=20
 	/* Init hrtimer based on default refresh rate */
-	hrtimer_init(&vblank_timer->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	vblank_timer->timer.function =3D vblank_timer_fn;
+	hrtimer_setup(&vblank_timer->timer, vblank_timer_fn, CLOCK_MONOTONIC, HRT=
IMER_MODE_ABS);
 	vblank_timer->vrefresh_k =3D port->vrefresh_k;
 	vblank_timer->period =3D DIV64_U64_ROUND_CLOSEST(NSEC_PER_SEC * MSEC_PER_=
SEC, vblank_timer->vrefresh_k);
=20
diff --git a/drivers/gpu/drm/i915/gvt/sched_policy.c b/drivers/gpu/drm/i915=
/gvt/sched_policy.c
index c077fb4674f0..9f97f743aa71 100644
--- a/drivers/gpu/drm/i915/gvt/sched_policy.c
+++ b/drivers/gpu/drm/i915/gvt/sched_policy.c
@@ -286,8 +286,7 @@ static int tbs_sched_init(struct intel_gvt *gvt)
 		return -ENOMEM;
=20
 	INIT_LIST_HEAD(&data->lru_runq_head);
-	hrtimer_init(&data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_ABS);
-	data->timer.function =3D tbs_timer_fn;
+	hrtimer_setup(&data->timer, tbs_timer_fn, CLOCK_MONOTONIC, HRTIMER_MODE_A=
BS);
 	data->period =3D GVT_DEFAULT_TIME_SLICE;
 	data->gvt =3D gvt;
=20
--=20
2.39.5

