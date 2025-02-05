Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E8922C325
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 10:39:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751994; cv=none; b=awcwebwQK50fVbV+VqpiITJ1AB2TMLRHlwhUl2F3yvgrCFvlbSOcEzdLxxRL+fy7Tapt13h0agv1oT2OA/kbHuqNd3w8JCzprZ3Vyuj3QS7PA7F/6T6k9phpD39+btP+D3uSqRU1Ep3mX4N7sHRJxcVAbwBwKxfYYwO16r88seA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751994; c=relaxed/simple;
	bh=ngcz8LegcHj9iV0oYkCnZEeLpPfwmAwaCf5gCihXRi0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GKnPRpAYkolGgBLlOWofm8A0B1RgFvDhEYvRy+xU8kir90cZoYarnWj06uumy/N0zAje8zQyExF6zec4L/yuOyiSeG1kxlaOT7OPsa8AWBnIPb+Po4JfTU0X9H4IepRhNrOpPUwbRO03+YOHZ11fsW9cZIL+KzcRTtR3C8nDF3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2Gin8O8Q; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=/s/BFjlS; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2Gin8O8Q";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="/s/BFjlS"
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5swN+tTnX18LgifasfS+OO1X1LHz6T0cwrNQiP95U=;
	b=2Gin8O8QPTRqp71i2e78EaoV5BmC+B/uSqtnXcG3bUX3f1kSp6mFav47WSga91Xd16M7lK
	aJMvMdqjPANopiFj1d1gn48b0vMDfI+ahK5E39yrSfjoiE8YuoJBra0H3Hs85mywKgraNz
	XTpidofebeRK03sM1QdGevMhNPuSYPcf70m8mmuf66ui32ShePITeZCdggJIjlVfAtnVJB
	CQi208qWpyrAwwR7YqrA6mH8bUJ3Vlehj4W0dkMdUIvLNnZTvVRouPp9z/cFkEOslgxKGO
	nsa1wYxr8J/0kwLV/WTxbTd0sbh8wC229FXI+ZCVRm+L2fQGqeBzR3xnhMFBRg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751989;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nm5swN+tTnX18LgifasfS+OO1X1LHz6T0cwrNQiP95U=;
	b=/s/BFjlSTsk2BaHy8JP+XMk1CBbvYVyhSBJO2OvbnqJl9XiJ0y2UbmvVjPzeYG4DbDeveg
	kYaPhRaPieaGrwDw==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>
Subject: [PATCH v2 08/31] ARM: imx: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:38:52 +0100
Message-Id: <aff915511ee629b461fee98688b8e859075386ac.1738746821.git.namcao@linutronix.de>
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

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
---
 arch/arm/mach-imx/mmdc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/arch/arm/mach-imx/mmdc.c b/arch/arm/mach-imx/mmdc.c
index e898f7c2733e..94e4f4a2f73f 100644
--- a/arch/arm/mach-imx/mmdc.c
+++ b/arch/arm/mach-imx/mmdc.c
@@ -509,9 +509,8 @@ static int imx_mmdc_perf_init(struct platform_device *p=
dev, void __iomem *mmdc_b
 	pmu_mmdc->mmdc_ipg_clk =3D mmdc_ipg_clk;
 	pmu_mmdc->devtype_data =3D device_get_match_data(&pdev->dev);
=20
-	hrtimer_init(&pmu_mmdc->hrtimer, CLOCK_MONOTONIC,
-			HRTIMER_MODE_REL);
-	pmu_mmdc->hrtimer.function =3D mmdc_pmu_timer_handler;
+	hrtimer_setup(&pmu_mmdc->hrtimer, mmdc_pmu_timer_handler, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
=20
 	cpumask_set_cpu(raw_smp_processor_id(), &pmu_mmdc->cpu);
=20
--=20
2.39.5

