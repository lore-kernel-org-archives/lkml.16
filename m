Received: from out30-100.freemail.mail.aliyun.com (out30-100.freemail.mail.aliyun.com [115.124.30.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C577D17BA5
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:08:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036127; cv=none; b=dFMR2Yq0rUxk/wovsCnIBRl+TTVseEfB4zeLV3RJ9mXCeWBVBbv2Qt+0hx3AI61029gj8LlrzaJUAu6hM43NJ+Cd4fENHaEehI/ZXPifFQxBY9mwgUNmjoh52evsjVff2UICk8eA9hXE2NULDg7fkCvAQVjt7wcyl4QC5dy91ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036127; c=relaxed/simple;
	bh=Kj9loMjOceAfTvJkSvXiARKvoR/e9L3Fz3btdN/YJA0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=H7MlNdi3RwDxtqKYrrSQ6qrDmWhW+Gok0CQlQYavFzTMCpP9dXxCKNjf7O35Pkn8BsZh0QyI1Eadn5s/n8mZ5Ag0MnL4TXLjX0CULu985jum7HJUJ5HhUHnDvjyuCCX3OdluSY9Bj76n1AyTHAlVmUy9ftIa0wztUT9fzGQmSyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=HKchmyPo; arc=none smtp.client-ip=115.124.30.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="HKchmyPo"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750036122; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=b7nsMWZwXRG7VGmZov0snPfqziKqK7Nrc8RStA8klUc=;
	b=HKchmyPoWqmwweG8/xe2Oz+sE1RLXlc3bohSAR8xBvgyxh6iSegNAMlALekfVDLpX7CUSC9UqjVrK2HYlWiB2bBzALmjgz3TPoGOlIAqk3woT1gYmz98D2ELEY6b57vCMP4oNQqvJC+XaVk4qJrNwcH7HrhSfDDzexXF3JjUPeM=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wdr3n8N_1750036121 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 09:08:41 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-kernel@vger.kernel.org
Cc: paulmck@kernel.org,
	john.ogness@linutronix.de,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH V2 1/5] panic: clean up code for console replay
Date: Mon, 16 Jun 2025 09:08:36 +0800
Message-Id: <20250616010840.38258-2-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
References: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently the panic_print_sys_info() was called twice with different
parameters to handle console replay case, which is kind of confusing.

Add panic_console_replay() explicitly to make the code straightforward.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 kernel/panic.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index b0b9a8bf4560..af0d5206a624 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -238,14 +238,14 @@ void nmi_panic(struct pt_regs *regs, const char *msg)
 }
 EXPORT_SYMBOL(nmi_panic);
 
-static void panic_print_sys_info(bool console_flush)
+static void panic_console_replay(void)
 {
-	if (console_flush) {
-		if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
-			console_flush_on_panic(CONSOLE_REPLAY_ALL);
-		return;
-	}
+	if (panic_print & PANIC_PRINT_ALL_PRINTK_MSG)
+		console_flush_on_panic(CONSOLE_REPLAY_ALL);
+}
 
+static void panic_print_sys_info(void)
+{
 	if (panic_print & PANIC_PRINT_TASK_INFO)
 		show_state();
 
@@ -410,7 +410,7 @@ void panic(const char *fmt, ...)
 	 */
 	atomic_notifier_call_chain(&panic_notifier_list, 0, buf);
 
-	panic_print_sys_info(false);
+	panic_print_sys_info();
 
 	kmsg_dump_desc(KMSG_DUMP_PANIC, buf);
 
@@ -439,7 +439,7 @@ void panic(const char *fmt, ...)
 	debug_locks_off();
 	console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 
-	panic_print_sys_info(true);
+	panic_console_replay();
 
 	if (!panic_blink)
 		panic_blink = no_blink;
-- 
2.39.5 (Apple Git-154)

