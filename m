Received: from out-182.mta1.migadu.com (out-182.mta1.migadu.com [95.215.58.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF13D15F330
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 08:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744101000; cv=none; b=W/kb35yzECa6YN4p51Ee3zvTt/crTZnnfV52CybcMXSFXzC3NuF1bP6nav7/JeWrjGlF+dh0cJUWSDHJx+Culs+HLctYgqdVIIL1tFOojXh+hYsSjrsVx1TRxiZJ9VWUgK85ayIZtubTFsPI/Qp4QTnMkUdp/fiXkZ78e/K9xSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744101000; c=relaxed/simple;
	bh=eY6QmS/jMMqraLWISElVxM2ddsk83dVnwANCMNtp9uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=nXSFjh1WO1MYqjNvc3rlpDi6iVrcJS6Uj6SzgcE7yXAb1bt9z295lFVERvKY3bJcAYWY1mc4FV7Uav7xF6/ZWynDW7K/jZHVTSrGIuB3awG8/poqqzV+6M6eGzirCYMPZjii77nJLgi0NiLC6UdakFyAx/9TKPNicOB5gXBzS5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kIcIYVV8; arc=none smtp.client-ip=95.215.58.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kIcIYVV8"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744100995;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=ZAi+cp3bu3ospaZa9MvxjpPUoJTJl/dvPd0ysKpUEWY=;
	b=kIcIYVV82pkDXHaHXO8f9LiB8+PaqvcZT16J72nItbLFQ+PtENESMa8wZZIuTf0aKYGcmR
	wnYdfqJ+VRZiS/U4KR7Wa3vcP39lBfX5BW24sbmCTcAhJ5esp3M6Z5USqO0Gc//8XrY7rf
	4gfamVWMUwWTRqo7s7x42oh6/KIvfyA=
From: Thorsten Blum <thorsten.blum@linux.dev>
To: John Crispin <john@phrozen.org>,
	Sergio Paracuellos <sergio.paracuellos@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Cc: Thorsten Blum <thorsten.blum@linux.dev>,
	David Laight <david.laight.linux@gmail.com>,
	linux-mips@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] MIPS: ralink: Avoid x/x division in rt_timer_config()
Date: Tue,  8 Apr 2025 10:28:05 +0200
Message-ID: <20250408082804.796515-2-thorsten.blum@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

Avoid the 'rt->timer_freq / rt->timer_freq' division when the divisor is
larger than the timer frequency and use '1' directly.

No functional changes intended.

Suggested-by: David Laight <david.laight.linux@gmail.com>
Signed-off-by: Thorsten Blum <thorsten.blum@linux.dev>
---
 arch/mips/ralink/timer.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/arch/mips/ralink/timer.c b/arch/mips/ralink/timer.c
index 54094f6e033e..5d8286603584 100644
--- a/arch/mips/ralink/timer.c
+++ b/arch/mips/ralink/timer.c
@@ -75,12 +75,16 @@ static int rt_timer_request(struct rt_timer *rt)
 
 static int rt_timer_config(struct rt_timer *rt, unsigned long divisor)
 {
-	if (rt->timer_freq < divisor)
+	u32 t;
+
+	if (rt->timer_freq < divisor) {
 		rt->timer_div = rt->timer_freq;
-	else
+		t = 1;
+	} else {
 		rt->timer_div = divisor;
-
-	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, rt->timer_freq / rt->timer_div);
+		t = rt->timer_freq / rt->timer_div;
+	}
+	rt_timer_w32(rt, TIMER_REG_TMR0LOAD, t);
 
 	return 0;
 }
-- 
2.49.0

