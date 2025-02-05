Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82A5718CC1C
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 16:02:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738771353; cv=none; b=bQjU7KAl1CSmL9ufRxkFnTcfMNZCGXtFI0DSaJ4affc2/Urfqk2r5tJuNk8gh3qReEHjiqNjny5NIr3bjcrQYUgXgB6EthFv30EAlC33u+UJWTkyya0ZwbDTitaCVZ0j/joGtsbT+bbO4romiqy2trg15wRBvlejw1cJ5y292ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738771353; c=relaxed/simple;
	bh=yu5I0Tytb8ykUcd1Cm9mqQfxQOKtln6I/FcAG0UK1zA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LC5m9bVxzFe5qmlIn6+z0JMnJ6t3jovbJjeFQZWOBqEgkMcShuR2HeJECE16c//XOkyDYaoeMSD9pSfK9IFWcXYy1UUpl8GK7UHwSr1628LCWgJPNe/ZFaE7WjrzW3w/WvTHfOsnwN+mq8KooIR+XPX6dgL6ePKrNVAzhvoS0Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mrPi7x9B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mrPi7x9B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C64EAC4CED1;
	Wed,  5 Feb 2025 16:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738771353;
	bh=yu5I0Tytb8ykUcd1Cm9mqQfxQOKtln6I/FcAG0UK1zA=;
	h=From:To:Cc:Subject:Date:From;
	b=mrPi7x9BEI5+gy1codsY62i9uSO/W6xP5dCiiUTT59n76gwUuGFCe/AFoUviYzS0x
	 yXP+4qGpo9W+S/rmWEfuL9DqGwGTGLAf/e0Oj3aVzDc9nVRWb8wEelIB1SxNJCLLle
	 dtYqLam/KO0I7skFv0GeJNCNS8LCrk/eVdRV3LcQnjlkfOExBYMfkSSs76Ic1tg9wz
	 8O1xDv038Xc3H7Fg1s6wSgkmKEYizIC6WWrKDwFNMnFdYQVuek9ON37c0jl15HpAm/
	 1NDL4IgGxidFF6V1dRXw94F6aryrMV3zxvQNW8Gr6rLemGU/TETci07YB5dHApWqvO
	 034FcNeukOtrg==
From: Frederic Weisbecker <frederic@kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	anna-maria@linutronix.de,
	Matt Fleming <mfleming@cloudflare.com>
Subject: [PATCH] timer/migration: Fix off-by-one root mis-connection
Date: Wed,  5 Feb 2025 17:02:20 +0100
Message-ID: <20250205160220.39467-1-frederic@kernel.org>
X-Mailer: git-send-email 2.46.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Before attaching a new root to the old root, the children counter of the
new root is checked to verify that only the upcoming CPU's top group
have been connected to it. However since the recently added commit:

	b729cc1ec21a ("timers/migration: Fix another race between hotplug and idle entry/exit")

this check is not valid anymore because the old root is pre-accounted
as a child to the new root. Therefore after connecting the upcoming
CPU's top group to the new root, the children count to be expected must
be 2 and not 1 anymore.

This omission results in the old root to not be connected to the new
root. Then eventually the system may run with more than one top level,
which defeats the purpose of a single idle migrator.

Also the old root is pre-accounted but not connected upon the new root
creation. But it can be connected to the new root later on. Therefore
the old root may be accounted twice to the new root. The propagation of
such overcommit can end up creating a double final top-level root with a
groupmask incorrectly initialized. Although harmless given that the final
top level roots will never have a parent to walk up to, this oddity
opportunistically reported the core issue:

	 WARNING: CPU: 8 PID: 0 at kernel/time/timer_migration.c:543 tmigr_requires_handle_remoet
	 CPU: 8 UID: 0 PID: 0 Comm: swapper/8
	 RIP: 0010:tmigr_requires_handle_remote
	 Call Trace:
	  <IRQ>
	  ? tmigr_requires_handle_remote
	  ? hrtimer_run_queues
	  update_process_times
	  tick_periodic
	  tick_handle_periodic
	  __sysvec_apic_timer_interrupt
	  sysvec_apic_timer_interrupt
	  </IRQ>

Fix the problem with taking into account the old root in the children
count of the new root so the connection is not omitted.

Also warn when more than one top level group coexist to better detect
similar issues in the future.

Reported-by: Matt Fleming <mfleming@cloudflare.com>
Fixes: b729cc1ec21a ("timers/migration: Fix another race between hotplug and idle entry/exit")
Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 kernel/time/timer_migration.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/time/timer_migration.c b/kernel/time/timer_migration.c
index 9cb9b6584ea1..2f6330831f08 100644
--- a/kernel/time/timer_migration.c
+++ b/kernel/time/timer_migration.c
@@ -1675,6 +1675,9 @@ static int tmigr_setup_groups(unsigned int cpu, unsigned int node)
 
 	} while (i < tmigr_hierarchy_levels);
 
+	/* Assert single root */
+	WARN_ON_ONCE(!err && !group->parent && !list_is_singular(&tmigr_level_list[top]));
+
 	while (i > 0) {
 		group = stack[--i];
 
@@ -1716,7 +1719,12 @@ static int tmigr_setup_groups(unsigned int cpu, unsigned int node)
 		WARN_ON_ONCE(top == 0);
 
 		lvllist = &tmigr_level_list[top];
-		if (group->num_children == 1 && list_is_singular(lvllist)) {
+
+		/*
+		 * Newly created root level should have accounted the upcoming
+		 * CPU's child group and pre-accounted the old root.
+		 */
+		if (group->num_children == 2 && list_is_singular(lvllist)) {
 			/*
 			 * The target CPU must never do the prepare work, except
 			 * on early boot when the boot CPU is the target. Otherwise
-- 
2.46.0

