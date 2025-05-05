Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAF7D280310;
	Mon,  5 May 2025 22:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746483664; cv=none; b=VNaHkTD7EUKlkpl4wrGx1h1olSb6GqRNNVrZaoNDRcDF55PnXQcMxACcCSA3FlTYvsSBL883Xzbc4Jr6Xm7szMe4OufoOd0wtiRjOCnhEUCk3h49O6P1bi1RPFKrW7nZmwiymxqYRSREZVWqSp2CDWxBBpm4aWORFVYXhaBa58g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746483664; c=relaxed/simple;
	bh=jTphWrmv44YP6NtaA/99o5KYTtq/M3BPS0eJY1PDA/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=M4qrXSV8TTHqcgs92IrbAUyQIBaKjTjpethUmG9ch7Z+qo8FWka1UKG0b3t45hwjFsYnaytchjRWEz/FCce18Un9ehihxor/maNTI+JMSlJZsY+DPafBQmlorZVAHPYff1rWVw0RgQ1rxchCVe0SoNnF/P5mBnczEw3yh7Vfat8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RiqEgdje; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RiqEgdje"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EDB9C4CEEF;
	Mon,  5 May 2025 22:21:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746483663;
	bh=jTphWrmv44YP6NtaA/99o5KYTtq/M3BPS0eJY1PDA/U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RiqEgdjeLM6niuOhQODfkTNdCHinZqlj2vjwjzhDF2fiQa6wGxTYHI9/6gEYHKzNV
	 RaGqXZM/bEu3ls7sGOEf5nSf49FuTqkqxl5DVRIcgBejR+rGlWuQwiO6DV1lKnrurm
	 9/aQvhJsU0j4IvXsNxPGr8CP6rro9h99WXOpTPUz7fLVBB77UeFpFKBF/Dvtfo/0QI
	 2jIsDLUCOPFxQQ614BG+p3QKDM7kpr5rns2RRghhhawq8S6lnX15j+n9iD0RnBqWkB
	 rVhWY8OfWagOL1Gxptj4MFYR3anvfSEYdERlngPpm5EanUbDwOiI2612tBZm9pYfhR
	 TWRW1Fk7T0OMg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Sasha Levin <sashal@kernel.org>,
	anna-maria@linutronix.de,
	frederic@kernel.org
Subject: [PATCH AUTOSEL 6.14 166/642] timer_list: Don't use %pK through printk()
Date: Mon,  5 May 2025 18:06:22 -0400
Message-Id: <20250505221419.2672473-166-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505221419.2672473-1-sashal@kernel.org>
References: <20250505221419.2672473-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.14.5
Content-Transfer-Encoding: 8bit

From: Thomas Weißschuh <thomas.weissschuh@linutronix.de>

[ Upstream commit a52067c24ccf6ee4c85acffa0f155e9714f9adce ]

This reverts commit f590308536db ("timer debug: Hide kernel addresses via
%pK in /proc/timer_list")

The timer list helper SEQ_printf() uses either the real seq_printf() for
procfs output or vprintk() to print to the kernel log, when invoked from
SysRq-q. It uses %pK for printing pointers.

In the past %pK was prefered over %p as it would not leak raw pointer
values into the kernel log. Since commit ad67b74d2469 ("printk: hash
addresses printed with %p") the regular %p has been improved to avoid this
issue.

Furthermore, restricted pointers ("%pK") were never meant to be used
through printk(). They can still unintentionally leak raw pointers or
acquire sleeping looks in atomic contexts.

Switch to the regular pointer formatting which is safer, easier to reason
about and sufficient here.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Thomas Gleixner <tglx@linutronix.de>
Link: https://lore.kernel.org/lkml/20250113171731-dc10e3c1-da64-4af0-b767-7c7070468023@linutronix.de/
Link: https://lore.kernel.org/all/20250311-restricted-pointers-timer-v1-1-6626b91e54ab@linutronix.de
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 kernel/time/timer_list.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/kernel/time/timer_list.c b/kernel/time/timer_list.c
index 1c311c46da507..cfbb46cc4e761 100644
--- a/kernel/time/timer_list.c
+++ b/kernel/time/timer_list.c
@@ -46,7 +46,7 @@ static void
 print_timer(struct seq_file *m, struct hrtimer *taddr, struct hrtimer *timer,
 	    int idx, u64 now)
 {
-	SEQ_printf(m, " #%d: <%pK>, %ps", idx, taddr, timer->function);
+	SEQ_printf(m, " #%d: <%p>, %ps", idx, taddr, timer->function);
 	SEQ_printf(m, ", S:%02x", timer->state);
 	SEQ_printf(m, "\n");
 	SEQ_printf(m, " # expires at %Lu-%Lu nsecs [in %Ld to %Ld nsecs]\n",
@@ -98,7 +98,7 @@ print_active_timers(struct seq_file *m, struct hrtimer_clock_base *base,
 static void
 print_base(struct seq_file *m, struct hrtimer_clock_base *base, u64 now)
 {
-	SEQ_printf(m, "  .base:       %pK\n", base);
+	SEQ_printf(m, "  .base:       %p\n", base);
 	SEQ_printf(m, "  .index:      %d\n", base->index);
 
 	SEQ_printf(m, "  .resolution: %u nsecs\n", hrtimer_resolution);
-- 
2.39.5

