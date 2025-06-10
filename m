Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 480B228B401;
	Tue, 10 Jun 2025 09:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547787; cv=none; b=W7BsrE7xGFVs1t/Wn1Wep8yHnmDGZFVAHlzjiWaCIM/Akyd9wgcgB1vRaQf5Y/o0WAYObSVdkdJY14mh4Iz2ljlcYN67X7/MrWxtWBNc/+API3jWOJFLv0zq+UtnZbNp0/2QLf7fL1qeDgRaYGnY0kW12S5scI/L4CYRjF6pJf8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547787; c=relaxed/simple;
	bh=f9JKpi+eBd7LUjedWzTR5wWbT7SkQKka8cB763mOsc8=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Sorz/U+rnnhG5yWKoAtD9O7HFkcJbLjVOKfbR+cF4xCjF46oqw3I9UEUd47/bKyQHIr35XN0aEEWoM/CM2VGVMFsL0kkPv91JjB7HM3unWMYuaqvMwmrkzhTuNQorqY9efjgeZ8epk495PxhhY6NzJAwk46/Of3S8Ktdsz20CME=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LC7blfLb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LC7blfLb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E303C4CEED;
	Tue, 10 Jun 2025 09:29:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547787;
	bh=f9JKpi+eBd7LUjedWzTR5wWbT7SkQKka8cB763mOsc8=;
	h=From:To:Cc:Subject:Date:From;
	b=LC7blfLbT4P5kKey9jIxRSs0irnqnIBF+Q+lSwB1F+eRYsG5DrxAv5+GZ/45ytI73
	 u5ByovXd1N1PFgOktl/xBr+1SmqNAqmNrk8oM5jJ1v3JqIdx5yhRBFdZEfNSJsQwZI
	 L46SNyVtD0qKRN83bJ5dwt1EPFZMNDKhUBeVk0rqgwhI4eOTyb12a8NfD9nD+np67B
	 3MEDI5keVcncSOuQIvuG7uWUmPWf2PK2M890iy8WnPIpP6mqwdpzulxFLO8bDqs/fU
	 +tdT9KAdAfwtNLqDScjj8xQVUKIhK++7iMzSwfp5AnJAy1dLf7stfLEDE2gcM0TQ8C
	 C24QTzujcixbg==
From: Arnd Bergmann <arnd@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Will Deacon <will@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>,
	Nathan Chancellor <nathan@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Waiman Long <longman@redhat.com>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Kent Overstreet <kent.overstreet@linux.dev>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] lockdep: avoid struct return in lock_stats()
Date: Tue, 10 Jun 2025 11:29:21 +0200
Message-Id: <20250610092941.2642847-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Returning a large structure from the lock_stats() function causes clang
to have multiple copies of it on the stack and copy between them, which
can end up exceeding the frame size warning limit:

kernel/locking/lockdep.c:300:25: error: stack frame size (1464) exceeds limit (1280) in 'lock_stats' [-Werror,-Wframe-larger-than]
  300 | struct lock_class_stats lock_stats(struct lock_class *class)

Change the calling conventions to directly operate on the caller's copy,
which apparently is what gcc does already.

Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 include/linux/lockdep_types.h |  2 +-
 kernel/locking/lockdep.c      | 27 ++++++++++++---------------
 kernel/locking/lockdep_proc.c |  2 +-
 3 files changed, 14 insertions(+), 17 deletions(-)

diff --git a/include/linux/lockdep_types.h b/include/linux/lockdep_types.h
index 9f361d3ab9d9..eae115a26488 100644
--- a/include/linux/lockdep_types.h
+++ b/include/linux/lockdep_types.h
@@ -175,7 +175,7 @@ struct lock_class_stats {
 	unsigned long			bounces[nr_bounce_types];
 };
 
-struct lock_class_stats lock_stats(struct lock_class *class);
+void lock_stats(struct lock_class *class, struct lock_class_stats *stats);
 void clear_lock_stats(struct lock_class *class);
 #endif
 
diff --git a/kernel/locking/lockdep.c b/kernel/locking/lockdep.c
index dd2bbf73718b..0c941418a215 100644
--- a/kernel/locking/lockdep.c
+++ b/kernel/locking/lockdep.c
@@ -297,33 +297,30 @@ static inline void lock_time_add(struct lock_time *src, struct lock_time *dst)
 	dst->nr += src->nr;
 }
 
-struct lock_class_stats lock_stats(struct lock_class *class)
+void lock_stats(struct lock_class *class, struct lock_class_stats *stats)
 {
-	struct lock_class_stats stats;
 	int cpu, i;
 
-	memset(&stats, 0, sizeof(struct lock_class_stats));
+	memset(stats, 0, sizeof(struct lock_class_stats));
 	for_each_possible_cpu(cpu) {
 		struct lock_class_stats *pcs =
 			&per_cpu(cpu_lock_stats, cpu)[class - lock_classes];
 
-		for (i = 0; i < ARRAY_SIZE(stats.contention_point); i++)
-			stats.contention_point[i] += pcs->contention_point[i];
+		for (i = 0; i < ARRAY_SIZE(stats->contention_point); i++)
+			stats->contention_point[i] += pcs->contention_point[i];
 
-		for (i = 0; i < ARRAY_SIZE(stats.contending_point); i++)
-			stats.contending_point[i] += pcs->contending_point[i];
+		for (i = 0; i < ARRAY_SIZE(stats->contending_point); i++)
+			stats->contending_point[i] += pcs->contending_point[i];
 
-		lock_time_add(&pcs->read_waittime, &stats.read_waittime);
-		lock_time_add(&pcs->write_waittime, &stats.write_waittime);
+		lock_time_add(&pcs->read_waittime, &stats->read_waittime);
+		lock_time_add(&pcs->write_waittime, &stats->write_waittime);
 
-		lock_time_add(&pcs->read_holdtime, &stats.read_holdtime);
-		lock_time_add(&pcs->write_holdtime, &stats.write_holdtime);
+		lock_time_add(&pcs->read_holdtime, &stats->read_holdtime);
+		lock_time_add(&pcs->write_holdtime, &stats->write_holdtime);
 
-		for (i = 0; i < ARRAY_SIZE(stats.bounces); i++)
-			stats.bounces[i] += pcs->bounces[i];
+		for (i = 0; i < ARRAY_SIZE(stats->bounces); i++)
+			stats->bounces[i] += pcs->bounces[i];
 	}
-
-	return stats;
 }
 
 void clear_lock_stats(struct lock_class *class)
diff --git a/kernel/locking/lockdep_proc.c b/kernel/locking/lockdep_proc.c
index b52c07c4707c..1916db9aa46b 100644
--- a/kernel/locking/lockdep_proc.c
+++ b/kernel/locking/lockdep_proc.c
@@ -657,7 +657,7 @@ static int lock_stat_open(struct inode *inode, struct file *file)
 			if (!test_bit(idx, lock_classes_in_use))
 				continue;
 			iter->class = class;
-			iter->stats = lock_stats(class);
+			lock_stats(class, &iter->stats);
 			iter++;
 		}
 
-- 
2.39.5

