Received: from out30-119.freemail.mail.aliyun.com (out30-119.freemail.mail.aliyun.com [115.124.30.119])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1244D1A4E9D
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:08:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.119
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036136; cv=none; b=p1PTQZOpOyDzNHaGkpsrzaMc1kRB4iMD3muqUG6xo5jHv3ekwb6ub7uf3Vz3o0hFtmU61ZSXWjarwArLqMoh0YztFyJfcqSiIhuz18V0li1OT/udOeKoEVgQGDu4convSkBvjgHctj3RBV/9wSn3e4jut2IJQVXdmmEFljiBrCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036136; c=relaxed/simple;
	bh=lTJPQgSUL+HA9iGN4smN0uaMAZJI9ZXb1POdzToXVqQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YmY/btM71hNDlOspfhgNFfrmGWcKyr5h/XXmp8y2/wsVhQB0qFwSr1Ay6tMN8ISiakbMdCyG84dNuTdEhZ56DcOvhDHFwGqspSE42T8jH37OR4w2J2OQEW7jIFYxFYM/gxJ9BsNGLUv+SEdkHfuaIFSUOWMvT2hoDDGuFUnD8e0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=sMlr3T0+; arc=none smtp.client-ip=115.124.30.119
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="sMlr3T0+"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750036126; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=GW2zZxjWOUZ9IQnQWcV8PPRSVZvl4IdIaylUilpQWL4=;
	b=sMlr3T0+uTIgcHfBUSNmfqWx+eX3HeglpQ4Du91OVAVL773tkf1eWIMELOsIuMpkm/wqA5ZRzqgijAo/BdZAIcVPzdKLsenQXx5nWfe0O96J6VH9h/CbSjswdMwoLrBqT8A+O9noCeq7M2sC3wjCSXz1/FC7pA2JTLobCBSrCrA=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wdr-a1R_1750036123 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 09:08:43 +0800
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
Subject: [PATCH V2 5/5] panic: add note that panic_print interface is deprecated
Date: Mon, 16 Jun 2025 09:08:40 +0800
Message-Id: <20250616010840.38258-6-feng.tang@linux.alibaba.com>
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

Long term wise, the 'panic_sys_info' should be the only controlling
interface, which can be referred by other modules.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 kernel/panic.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/kernel/panic.c b/kernel/panic.c
index ea238f7d4b54..e8a05fc6b733 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -76,6 +76,13 @@ ATOMIC_NOTIFIER_HEAD(panic_notifier_list);
 EXPORT_SYMBOL(panic_notifier_list);
 
 #ifdef CONFIG_SYSCTL
+static int sysctl_panic_print_handler(const struct ctl_table *table, int write,
+			   void *buffer, size_t *lenp, loff_t *ppos)
+{
+	printk_once("panic: 'panic_print' sysctl interface will be obsoleted by 'panic_sys_info' interface.\n");
+	return proc_doulongvec_minmax(table, write, buffer, lenp, ppos);
+}
+
 static const struct ctl_table kern_panic_table[] = {
 #ifdef CONFIG_SMP
 	{
@@ -107,7 +114,7 @@ static const struct ctl_table kern_panic_table[] = {
 		.data		= &panic_print,
 		.maxlen		= sizeof(unsigned long),
 		.mode		= 0644,
-		.proc_handler	= proc_doulongvec_minmax,
+		.proc_handler	= sysctl_panic_print_handler,
 	},
 	{
 		.procname	= "panic_on_warn",
-- 
2.39.5 (Apple Git-154)

