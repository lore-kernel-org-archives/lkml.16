Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6494922CBCB
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751995; cv=none; b=jxaEg3yPH8jzRPud6alqIJby0pGMzHIIq0g064p2nydORP+FtwzEspzq18EwQDof+ynbsBQtEMGh8qIdOEdc9wUavp/fyKwj0pIHR54dMuBcetarbOmmcdSAROp7bJH5RfdwmS8JBCvmuXn4vGs9OS/uzyd/QqIz2PM0Rg/ywm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751995; c=relaxed/simple;
	bh=UfR+59KavMtZ11CfKcD2yOhyxGw2CjTyD/dBBlCLmDs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=q3jo+bJuiLOkMeEKYMO0NBzjeO72B+8xwzNuU/1XXuLYdy+drGSUV9vuPvc/NB2gWMEysYhTMteEvlgnkBjPhYG7uTG9F/T4P9FtS//BAqtlSIEDynKtGDyujJu3gKvrb4rGQ7O5JTS5Dn4e+R1iPnNMvgG5nzJz5d3jau6MBoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=gSytU5Sc; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=aUCEBDLm; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="gSytU5Sc";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="aUCEBDLm"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B502q2AlOmCNGRkwoS07XuMj1JmHp4WktLWVHz/Y3NA=;
	b=gSytU5SceUwkDKdQPQIeLw515FsfzEL2l/OdT0/GJkvCHqe+gj1hHxzEG9bPkzcNnB+6k5
	AfE+CfQoqtETgqsxEQSx0/6aSnjxtwI6viLn3v5mkQtRrx+KCCM+sDAVu5RO6JK/XXL/La
	dPnNNzlj2zQIb4S5KT22hZd9gMf5Dg0rMw+mkD3vouqDoSKpRN4+1ZEmnka+kgAsOEAHtE
	AKj4389zfdI8RT5K+qFFQTaY9e4hVSlTlvY9XCXtxIgvz6+Hf6u9kFxGPz60PmncQPbfui
	cPrOjiio9UyVy+huv6JT5zx45/4yOBKORKuw7mX9CfxE336Z73KiKaLY+Y1P4g==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=B502q2AlOmCNGRkwoS07XuMj1JmHp4WktLWVHz/Y3NA=;
	b=aUCEBDLmovq7OC5mZarOleKoCLwbGO0/X+fT3p8hghpCg5/Gja6bHADW93v3cNz3WyWeBH
	CDQDTNnPBrXGKHDg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Peter Zijlstra <peterz@infradead.org>
Subject: [PATCH v2 11/31] perf/x86: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:55 +0100
Message-Id: <e84ad5a660b8e10867e547db8e64f7e99c48ebba.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
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
Cc: Peter Zijlstra <peterz@infradead.org>
---
 arch/x86/events/intel/uncore.c | 3 +--
 arch/x86/events/rapl.c         | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/arch/x86/events/intel/uncore.c b/arch/x86/events/intel/uncore.c
index 60b3078b7502..a34e50fc4a8f 100644
--- a/arch/x86/events/intel/uncore.c
+++ b/arch/x86/events/intel/uncore.c
@@ -347,8 +347,7 @@ void uncore_pmu_cancel_hrtimer(struct intel_uncore_box =
*box)
=20
 static void uncore_pmu_init_hrtimer(struct intel_uncore_box *box)
 {
-	hrtimer_init(&box->hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	box->hrtimer.function =3D uncore_pmu_hrtimer;
+	hrtimer_setup(&box->hrtimer, uncore_pmu_hrtimer, CLOCK_MONOTONIC, HRTIMER=
_MODE_REL);
 }
=20
 static struct intel_uncore_box *uncore_alloc_box(struct intel_uncore_type =
*type,
diff --git a/arch/x86/events/rapl.c b/arch/x86/events/rapl.c
index d3bb3865c1b1..2b6cc2860836 100644
--- a/arch/x86/events/rapl.c
+++ b/arch/x86/events/rapl.c
@@ -274,8 +274,7 @@ static void rapl_hrtimer_init(struct rapl_pmu *rapl_pmu)
 {
 	struct hrtimer *hr =3D &rapl_pmu->hrtimer;
=20
-	hrtimer_init(hr, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	hr->function =3D rapl_hrtimer_handle;
+	hrtimer_setup(hr, rapl_hrtimer_handle, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
 }
=20
 static void __rapl_pmu_event_start(struct rapl_pmu *rapl_pmu,
--=20
2.39.5

