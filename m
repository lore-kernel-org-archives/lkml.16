Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D24EA2E9EBD
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 14:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751551664; cv=none; b=tkBAvD06UA2VyNtXM7WQ1R/YcO0yvW+9GbR45pEZQc91OU+vJGdTvY/bpQ3CAGfQK5yGkR8NefDivu2qxqwU22WDWhdb8K38TR8txr5UTWWmAGcIC63IccrO9Vp53bk2uYT4TBRG6QdPFXZhLintwKd4oalSOlk2wjvL8rkHGpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751551664; c=relaxed/simple;
	bh=6YLBMO4OX7UQZr8sjL+8YFZIQDKbhjUdn2GAhwLdBXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=q7bdBuq44tQbW41/as9vhVSRyu+UascsCGGp0TW53PnNQj85ELSi4x30hRd7ghxHzbMrfrIl6Jst/isQYFgQFXHrk3wmevy1eKGXtQ+jlXLX30UjaAaVc1jPE4Nj76PqmpX81uvgdoGN/TSuzw3duke0JRQw53P1hXxptiOyavk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUeZonbi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUeZonbi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1426EC4CEE3;
	Thu,  3 Jul 2025 14:07:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751551664;
	bh=6YLBMO4OX7UQZr8sjL+8YFZIQDKbhjUdn2GAhwLdBXI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lUeZonbi0i97RiWpdXIlsePYQZPLgKc87nTUzdVxZmFG34JdoqRcAHk8uZXyoNdQC
	 CfM8FFA+iHXdlqB8aTC449Vv7DJ6HgZ+SBpHsvhoPl26dPx1djC92/7X14hkzQpCy1
	 oDAEEU2vVruA2KXAnglmv3rFulkloSYie2ZXWn8fbViy7mabmajRu3uSkTwlYVR7Vu
	 tfJwbWeE0avB3n0sRXkGU0hl24FTdJeQpxUk9llXySq24QTgt1JUyWKNY4nQqRTOxR
	 AwbdRlBXsp8ykprfNoT3smm3C/yab5+/H2+N85fz4/HSU0bXOkjI+mX0E0Svi5NQMT
	 EOhTnmujdu8DQ==
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
Date: Thu,  3 Jul 2025 16:07:15 +0200
Message-ID: <20250703140717.25703-5-frederic@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250703140717.25703-1-frederic@kernel.org>
References: <20250703140717.25703-1-frederic@kernel.org>
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
index 4f78a64beb52..117aa20b8fb6 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1114,13 +1114,7 @@ struct task_struct {
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
@@ -1446,6 +1440,14 @@ struct task_struct {
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

