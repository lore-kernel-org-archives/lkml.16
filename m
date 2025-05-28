Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A73E248F7E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419933; cv=none; b=YK5ciZug0xBo5tu/qpsC8G5tZztVwbV8Br1uS9PzjLkLuX8wJzaSEZHXGliSgsrgtwdjhg8W16eNtlih0p36oWgfgaZwMcql3xOlMzFM+kCDSwgmgoH3U3UTKitB+Azuyf95I5WtDWTvI7mPHBePPXZySPDmf/Zix4KyPpEn0js=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419933; c=relaxed/simple;
	bh=z/RR0FJpocDARlFVrhQXFGutmtDQTpHxlDPhV664NzA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=NVgHuIq6xygxLOj3dzQpn51wctjxEZbjCS19mVXYY+twjwJGRVq2nAGkcQUNAji67xwiY2Y29rLobK5AoMUmzMUo9GUXz+PHcarf+0P1nOIryEb1FrTEAwjRR4AFm7fLGuJ6/m0aPy6yjkYCLf8f7gd8tfZVAfHsns6TKt+eEpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QNoNygN0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QNoNygN0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239B3C4CEE7;
	Wed, 28 May 2025 08:12:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748419933;
	bh=z/RR0FJpocDARlFVrhQXFGutmtDQTpHxlDPhV664NzA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QNoNygN0hsSo4RaRa6eXoWvSevAKHqUoTundXNE7ozZN1ENQqj7Tf1Jol2boP7rzt
	 BX6pe3N8dI0Lh2TSje7dTutrrG2ILpWhxn9QJLV1HrK6ZSMxc5bMcHrrE1UhZRsBxk
	 ao/4lrY54Vffn4/G/gJ9lnN6+VbsVUijeWar6IM0rjTfyCafO+FsJnokhcvrNwzo13
	 NUmW9rhmFRYxWJWtn3MvD+qiFkVN1VeJ5qv/SYWzkp9sCtN7YHyD6vxo+xDuWDVIp0
	 HjYucmiJoOAuyX23NXfWlqyU+9M3bsl86r+6kNpsQ5uk3CXkv5PGIsIoTv/WpUJjdV
	 zQ4VtnbYDsJAw==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mel Gorman <mgorman@suse.de>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>
Subject: [PATCH 41/43] sched/smp: Use the SMP version of ENQUEUE_MIGRATED
Date: Wed, 28 May 2025 10:09:22 +0200
Message-ID: <20250528080924.2273858-42-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250528080924.2273858-1-mingo@kernel.org>
References: <20250528080924.2273858-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Simplify the scheduler by making formerly SMP-only primitives and data
structures unconditional.

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Dietmar Eggemann <dietmar.eggemann@arm.com>
Cc: Juri Lelli <juri.lelli@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Mel Gorman <mgorman@suse.de>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Valentin Schneider <vschneid@redhat.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>
---
 kernel/sched/sched.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index e4aeb1e1c849..20d9da03d947 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -2318,11 +2318,7 @@ extern const u32		sched_prio_to_wmult[40];
 
 #define ENQUEUE_HEAD		0x10
 #define ENQUEUE_REPLENISH	0x20
-#ifdef CONFIG_SMP
 #define ENQUEUE_MIGRATED	0x40
-#else
-#define ENQUEUE_MIGRATED	0x00
-#endif
 #define ENQUEUE_INITIAL		0x80
 #define ENQUEUE_MIGRATING	0x100
 #define ENQUEUE_DELAYED		0x200
-- 
2.45.2

