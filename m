Received: from m16.mail.163.com (m16.mail.163.com [117.135.210.5])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E511C442C
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=117.135.210.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747378952; cv=none; b=Jnij3AmeAM1L55PVaMlc2tKlTB3FH1bj/Dqce9OrqdGI7RjqkmGJL0fsn/5OaUL5B1gyBWNcUR3rD7TMKua2s3ngFDxJttrbjhXPZ157KbGm2h9Z33L+RzvXateaeKklwAuO3NlcJvAAb1hfIbFJ5sVUHYVqOTGxqfdk3jrNb7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747378952; c=relaxed/simple;
	bh=NSm3l2AjyEQJZbJ+kTPiI26S8Hs8lJR8uhbihum8Fm0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=s1cxEQggGKgB1MRMz6pawXlkJhwNQvdis0otmfNyBuvQebU1C0+kquH+2myRorUCCIPF0lZ0pzXV8SjXec2j1oWs4Tvv2Buslx/Tv2PTiPl2m9GS8I+3OO4zQEoM3lDty8bK7RhGXseU5oIIZezoQ+nCzD8XpCoJ+FXYclWTR1w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=EYiNaQiO; arc=none smtp.client-ip=117.135.210.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="EYiNaQiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-Id:MIME-Version; bh=3D
	p87Pol0DiDHOxWLqgQHJiIDQ96ZatGbX/ZyoNiUI0=; b=EYiNaQiOpTS4W5pAT3
	F5pL9XRrbUhAuTOQshamureTUN9VUEPuYW+BfgsrmMdOV5E5A2qHSHsLeRk/xUbt
	/MMFS9sNp5kWoCTkXJHvxyqlwNeMSBsgOe4sxKh5u1CNoI0dpUVBiDtTv/eOuzuC
	TAXCJ2VJbPmNV+romc+rYHpqY=
Received: from localhost (unknown [])
	by gzsmtp4 (Coremail) with SMTP id PygvCgDnF1Xk4iZoNbqAAw--.63522S2;
	Fri, 16 May 2025 15:01:56 +0800 (CST)
From: Xavier Xia <xavier_qy@163.com>
To: anna-maria@linutronix.de,
	frederic@kernel.org,
	tglx@linutronix.de
Cc: linux-kernel@vger.kernel.org,
	Xavier Xia <xavier_qy@163.com>
Subject: [PATCH v1] hrtimer: Simplify the logic of __hrtimer_get_next_event
Date: Fri, 16 May 2025 15:01:53 +0800
Message-Id: <20250516070153.2410363-1-xavier_qy@163.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PygvCgDnF1Xk4iZoNbqAAw--.63522S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7ZF15tF15AryrXF4ftF4Utwb_yoW8uw15pa
	1xG3sxtr4UJF15XF4rJa1DZry7G3Z3Ar1xJF40q397AFna9348Kay0gF4fZF43urWvvrW3
	A3yxJw15Aa9rAa7anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0piO6pkUUUUU=
X-CM-SenderInfo: 50dyxvpubt5qqrwthudrp/1tbiVg5PEGgm3jms8gAAsw

Currently, __hrtimer_get_next_event makes two separate calls to
__hrtimer_next_event_base for HRTIMER_ACTIVE_SOFT and HRTIMER_ACTIVE_HARD
respectively to obtain expires_next. However, __hrtimer_next_event_base is
capable of traversing all timer types simultaneously by simply controlling
the active mask. There is no need to distinguish the order of traversal
between soft and hard timers, as the sole purpose is to find the earliest
expiration time.
Therefore, the code can be simplified by reducing the two calls to a single
invocation of __hrtimer_next_event_base, making the code more
straightforward and easier to understand.

Signed-off-by: Xavier Xia <xavier_qy@163.com>
---
 kernel/time/hrtimer.c | 21 ++++++---------------
 1 file changed, 6 insertions(+), 15 deletions(-)

diff --git a/kernel/time/hrtimer.c b/kernel/time/hrtimer.c
index 517ee2590a29..7c23115d25b0 100644
--- a/kernel/time/hrtimer.c
+++ b/kernel/time/hrtimer.c
@@ -577,24 +577,15 @@ static ktime_t __hrtimer_next_event_base(struct hrtimer_cpu_base *cpu_base,
 static ktime_t
 __hrtimer_get_next_event(struct hrtimer_cpu_base *cpu_base, unsigned int active_mask)
 {
-	unsigned int active;
-	struct hrtimer *next_timer = NULL;
 	ktime_t expires_next = KTIME_MAX;
 
-	if (!cpu_base->softirq_activated && (active_mask & HRTIMER_ACTIVE_SOFT)) {
-		active = cpu_base->active_bases & HRTIMER_ACTIVE_SOFT;
-		cpu_base->softirq_next_timer = NULL;
-		expires_next = __hrtimer_next_event_base(cpu_base, NULL,
-							 active, KTIME_MAX);
+	if (cpu_base->softirq_activated)
+		active_mask &= ~HRTIMER_ACTIVE_SOFT;
 
-		next_timer = cpu_base->softirq_next_timer;
-	}
-
-	if (active_mask & HRTIMER_ACTIVE_HARD) {
-		active = cpu_base->active_bases & HRTIMER_ACTIVE_HARD;
-		cpu_base->next_timer = next_timer;
-		expires_next = __hrtimer_next_event_base(cpu_base, NULL, active,
-							 expires_next);
+	active_mask &= cpu_base->active_bases;
+	if (active_mask) {
+		expires_next = __hrtimer_next_event_base(cpu_base, NULL, active_mask,
+							 KTIME_MAX);
 	}
 
 	return expires_next;
-- 
2.34.1

