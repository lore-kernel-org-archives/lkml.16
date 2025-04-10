Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3423B1E5B94
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744298629; cv=none; b=RAULASzp9oSDq9xTNj/e0VodwyebFkaIvUm0O6dKp2D+xocL7y1dTztt7+GUVSXe8rOEkj1mE9HHk9sQ98OiCqTUkGsvLXjMhyut9AFgKA6uJtFvRzvG+zrTiqB4fiT+g/mp3M1CrjlzA/rWjeFtHJCUbLgwMQgR7R470bzWTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744298629; c=relaxed/simple;
	bh=l3VO6WBv+ArOF03U7NJi6+am3DCDRNiD9Zb95QE1QjQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JMoWssqCg136GKRsezgL8MNOAsrXQtqAiuVYpAfAWZZv0YxgMCFH6GXIyMK4k9L+Wqi5Wk+8bM588WLyCHcrwGvWcKPCT29cQwcYAZZPQjCpyrHC/5c8jhiZnZQZx9q2QhuvhQdSxJk0/2eWPrVNOa7mRkygfY+tDWsnn1O09Nc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L4Pb8QdK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L4Pb8QdK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E8A9C4CEEA;
	Thu, 10 Apr 2025 15:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744298627;
	bh=l3VO6WBv+ArOF03U7NJi6+am3DCDRNiD9Zb95QE1QjQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=L4Pb8QdKdNYxjnWQ8Wm5pszfSbTM8zEO1gP/6yA6X78fuFlRn4lIex+ze7UlVfXA7
	 qFgVCuDW6Yd54isboTwax15Q2PnxUL9J0A1eI9qDHz/4vP60nxPVZ+Zka5XL/IStBp
	 B7wk55YGzwkeFA82PqylJJIibC7Q6LcPAhzWEuTv76nAxwVhZTMGKylTh5HU6Lg+KU
	 QquEVfV5030H3BnuGUGr1Pgr/Ttsg+6sycLunvRjNvPb7CdQi/yTAIwF0LZMf/IzU7
	 PKvL/MYNGGTNGqUwEHobnchX/rlOKxDr5aNU6ZpWR9QAGqJXAlrBFQ8DXEjRMPsYem
	 614Yh4/tzyiEg==
From: Frederic Weisbecker <frederic@kernel.org>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Ingo Molnar <mingo@redhat.com>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Michal Hocko <mhocko@kernel.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>,
	linux-mm@kvack.org
Subject: [PATCH 4/6] tick/nohz: Move nohz_full related fields out of hot task struct's places
Date: Thu, 10 Apr 2025 17:23:25 +0200
Message-ID: <20250410152327.24504-5-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250410152327.24504-1-frederic@kernel.org>
References: <20250410152327.24504-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

nohz_full is a feature that only fits into rare and very corner cases.
Yet distros enable it by default and therefore the related fields are
always reserved in the task struct.

Those task fields are stored in the middle of cacheline hot places such
as cputime accounting and context switch counting, which doesn't make
any sense for a feature that is disabled most of the time.

Move the nohz_full storage to colder places.

Signed-off-by: Frederic Weisbecker <frederic@kernel.org>
---
 include/linux/sched.h | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/include/linux/sched.h b/include/linux/sched.h
index f96ac1982893..b5ce76db6d75 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1110,13 +1110,7 @@ struct task_struct {
 #endif
 	u64				gtime;
 	struct prev_cputime		prev_cputime;
-#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
-	struct vtime			vtime;
-#endif
 
-#ifdef CONFIG_NO_HZ_FULL
-	atomic_t			tick_dep_mask;
-#endif
 	/* Context switch counts: */
 	unsigned long			nvcsw;
 	unsigned long			nivcsw;
@@ -1438,6 +1432,14 @@ struct task_struct {
 	struct task_delay_info		*delays;
 #endif
 
+#ifdef CONFIG_VIRT_CPU_ACCOUNTING_GEN
+	struct vtime			vtime;
+#endif
+
+#ifdef CONFIG_NO_HZ_FULL
+	atomic_t			tick_dep_mask;
+#endif
+
 #ifdef CONFIG_FAULT_INJECTION
 	int				make_it_fail;
 	unsigned int			fail_nth;
-- 
2.48.1

