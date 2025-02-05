Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706CB22C324
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751994; cv=none; b=hErcNLKpizMTlv85UjrOok26VEbhNS3TgyqwdaSmxrFxslcWPIg6LsAVyyf9P2SbumzKvoLX3vWpNhXu95CBw03KhD6EAzkHqFd7XGuxWj3gEiUe6rS+m34ysv28v/K+waJ1B0PAozJWWC5WvmmIwZY3Jq1QKptV/MSMHxQ6bOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751994; c=relaxed/simple;
	bh=ZWMFT0wDu7BzhhJL0tvD3ItSZriH1lPxKa7bj6Zt8io=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nN4W6fNt68s+QXdMZb0MoOtOaFSOXs5CugMkeiPS/IX/YYpTHWTlP/RO46RTLjUjByh+qJZ+vv2v9Z7ciJQGjSZKcemgiUZOYnNn3tqOS7dD7PCCC4yX8rVyxVkOaCkOxzmkKEN5CnBYaOMOabxamcn7H3R/3AJmutTqPaIYyDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=jtaziQCn; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ZiPnA5cc; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="jtaziQCn";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ZiPnA5cc"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Cuy6hGSdtklzsLc7CsatheTky22+D8bUAROhyka+iY=;
	b=jtaziQCnuW//YOM8LaHGBfL/rU7JA1V5gH/87bJTJ42v2EGYRQ+gNVXQTPhurgAWICfU5/
	vzBdE1WG1eahlHlzzQ37UMmPR5El0ITxX+7KOO2ig987B+XpbgbTXa+Gxh/VSg1/XU0A4r
	KxNhU+g08K2+lwQBRgwOKDuyUVnMVnPbppflTkf7TnqqsxR279+dtIstIhDupO8pP5dvNO
	Zb+ZC/LcWJ/xGb8VLq8L13ONRGx1LXUV2E0bewyQgOmpLuCASMR/O5KouqtfZXx3IPGvz1
	ELG+HMQaS2P/cbhivEAaSkTf2CF0066PT22JZkhkrT0Q9swicHImGLCaXSqofQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751990;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0Cuy6hGSdtklzsLc7CsatheTky22+D8bUAROhyka+iY=;
	b=ZiPnA5cckhfZRAhITsC16smjK8Io9ydFKeS7rEMLRuIAV8hAr+7mtZv6PJn9lF1DVumDs9
	PWIUD50JDiH+UWAA==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Russell King <linux@armlinux.org.uk>
Subject: [PATCH v2 09/31] ARM: 8611/1: l2x0: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:53 +0100
Message-Id: <5ca584b1e32c34630bb15ccc84467c1e05059e66.1738746821.git.namcao@linutronix.de>
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
Cc: Russell King <linux@armlinux.org.uk>
---
 arch/arm/mm/cache-l2x0-pmu.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm/mm/cache-l2x0-pmu.c b/arch/arm/mm/cache-l2x0-pmu.c
index 993fefdc167a..93ef0502b7ff 100644
--- a/arch/arm/mm/cache-l2x0-pmu.c
+++ b/arch/arm/mm/cache-l2x0-pmu.c
@@ -539,8 +539,7 @@ static __init int l2x0_pmu_init(void)
 	 * at higher frequencies.
 	 */
 	l2x0_pmu_poll_period =3D ms_to_ktime(1000);
-	hrtimer_init(&l2x0_pmu_hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	l2x0_pmu_hrtimer.function =3D l2x0_pmu_poll;
+	hrtimer_setup(&l2x0_pmu_hrtimer, l2x0_pmu_poll, CLOCK_MONOTONIC, HRTIMER_=
MODE_REL);
=20
 	cpumask_set_cpu(0, &pmu_cpu);
 	ret =3D cpuhp_setup_state_nocalls(CPUHP_AP_PERF_ARM_L2X0_ONLINE,
--=20
2.39.5

