Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF70122DFA8
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:47:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738752423; cv=none; b=PO9Y0n6iBoA0XYoJcDGNamq6lJKblRjCHXADu8odfIv4yOBnCQHWsoJFSFAFUk79oUS9I9tenXgAK3XFKYX+yTYvTar/aic1G6iqwyCB3SROq80MAldz3XEnmDYbZ9+egN8ZyRrBVnyO31pal07x4bcIvFbkqnRYUgHK0PMguzE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738752423; c=relaxed/simple;
	bh=NTzCf7qh2LlxsQNyaVS0ITS/LvjhAOY4FgMdFq3DsbI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=P3Cwt1dzjNyca8wnIMcCz5hAEpSRpR4+TA/upOa9Cyc59ujO6LORuKH1NASHRap2mAh39PXnuaGAPWYMT/2EOXJU1efe+kBf3MtJgd/7BSaYGBQ5q8y+lNltb9m+EBWnQo9g44rlxvLE+xT7eHZNrZvrRyRFIjwfUpwAWmTFXnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=HwSU6OT9; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=PthrRuWx; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="HwSU6OT9";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="PthrRuWx"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738752420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0/5h8SnECt6G+uZTSG0mM4WQSpxVtA+ab0q9wDtDK4=;
	b=HwSU6OT9oWXviLvrGO1A64Mb7YOAKO71OoybQj3uinopksLOCDJ+B6Uich/m3fVvR6W2Ko
	YK3KRUWM3/tCy9+n7C2s0yuDYYQ/6DPWbVE/BWt+tl/K8oDncm4CAUok4szrwshQ1eJuWJ
	ll7+AdJ3Qkt/bOpdIprhEBAkhHV7lufM3dJhSag+DpAFbe7+jhesW4vbDrENcqYzf1gueT
	Now4I6Mf56JZD7nv++S6+u6hvDq41m559ulWDXN7DfXrFzAVp33C/QQog0JDFjQpm/Q1cM
	coMuOfD7+tEL3KUvrwamL2xQZiIZbuHnONrAJDiE0xFE03HzOMEkY5hErX6dOQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738752420;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=W0/5h8SnECt6G+uZTSG0mM4WQSpxVtA+ab0q9wDtDK4=;
	b=PthrRuWxaGvkPXfWm3Ot7UqPfohO1xhprCiDAhsWHbisI6MXtl/APmvfjfgF0tSp1yry0C
	xaKNE4wfUPtBYgBA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Zack Rusin <zack.rusin@broadcom.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH v2 22/45] misc: vcpu_stall_detector: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:46:10 +0100
Message-Id: <a1c984288c6e47d956c07339ced486a8ec95f8d5.1738746904.git.namcao@linutronix.de>
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
Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/misc/vcpu_stall_detector.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/misc/vcpu_stall_detector.c b/drivers/misc/vcpu_stall_d=
etector.c
index f0b1fc87490e..26166357b255 100644
--- a/drivers/misc/vcpu_stall_detector.c
+++ b/drivers/misc/vcpu_stall_detector.c
@@ -111,8 +111,7 @@ static int start_stall_detector_cpu(unsigned int cpu)
 	ping_timeout_ms =3D vcpu_stall_config.stall_timeout_sec *
 			  MSEC_PER_SEC / 2;
=20
-	hrtimer_init(vcpu_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	vcpu_hrtimer->function =3D vcpu_stall_detect_timer_fn;
+	hrtimer_setup(vcpu_hrtimer, vcpu_stall_detect_timer_fn, CLOCK_MONOTONIC, =
HRTIMER_MODE_REL);
 	vcpu_stall_detector->is_initialized =3D true;
=20
 	hrtimer_start(vcpu_hrtimer, ms_to_ktime(ping_timeout_ms),
--=20
2.39.5

