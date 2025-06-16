Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DDF23AD
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036133; cv=none; b=F/a/5pLn87uL8POB5IRv5FSDPgpohaejgTG1HLf07boOxwETX677nFERtKB1pBl9p5HFvWYDNE94uIGWBrrmo/2cSRd0xoreELVXRG2mq1kvQtF+1OVag39iagfpj0U/JZnJ6C+9tcwMM9fouzFiUU6++SKxJwYmNurAWIm0SDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036133; c=relaxed/simple;
	bh=abEiY5hBMI67CoNMXEMvgnnZK8G6qawPiVrmr/bLuG0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=hOJlojOVMqh5Cznsb+wMY4ZZiTUnhlqVSLa9/hewIjYcMVBPE5G5hnY3rZkGr4UG0mRJ3Xfo4QQ4pW1QDNmonyLR3Od37ynRjVDh89421VrDzWZLuqWeR3o23v+ZgHeYy82gLAx7C2GywIQNXa3pyOcmDKKMWIgEpej8k/D2mG8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=yL/oXijF; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="yL/oXijF"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750036124; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=PLJj49F9PjWWVpiZxBe0LA+dLBqogOq9Z6+7w2bNWXk=;
	b=yL/oXijFpfOmhCbcDCAq8xYUSSrD81HZynudmaTSRMKtgSuK9kSuuaHNp8odsVvWwQUVBLJe9vDsooRH9PntuO9gTYZfvx2Wmoc0Ign236G1xFA3f765ANeh9oyusgk58dBFurGxDct1Ht/yrHnUbj/IS03TBHe4CRYb4hV47Ng=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WdqyMzW_1750036122 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 16 Jun 2025 09:08:42 +0800
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
Subject: [PATCH V2 3/5] sys_info: add help to translate sys_info string to bitmap
Date: Mon, 16 Jun 2025 09:08:38 +0800
Message-Id: <20250616010840.38258-4-feng.tang@linux.alibaba.com>
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

Bitmap definition is hard to remember and decode. Add sysctl interface
to translate human readable string like "tasks,mem,timer,lock,ftrace,..."
to bitmap.

Suggested-by: Petr Mladek <pmladek@suse.com>
Signed-off-by: Feng Tang <feng.tang@linux.alibaba.com>
---
 include/linux/sys_info.h |  7 +++
 lib/sys_info.c           | 97 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 104 insertions(+)

diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
index 79bf4a942e5f..0b49863cd414 100644
--- a/include/linux/sys_info.h
+++ b/include/linux/sys_info.h
@@ -16,5 +16,12 @@
 #define SYS_SHOW_BLOCKED_TASKS		0x00000080
 
 extern void sys_show_info(unsigned long info_mask);
+extern unsigned long sys_info_parse_param(char *str);
 
+#ifdef CONFIG_SYSCTL
+struct ctl_table;
+extern int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
+					  void *buffer, size_t *lenp,
+					  loff_t *ppos);
+#endif
 #endif	/* _LINUX_SYS_INFO_H */
diff --git a/lib/sys_info.c b/lib/sys_info.c
index 90a79b5164c9..9693542435ba 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -5,6 +5,103 @@
 #include <linux/console.h>
 #include <linux/nmi.h>
 
+struct sys_info_name {
+	unsigned long bit;
+	const char *name;
+};
+
+static const char sys_info_avail[] = "tasks,mem,timer,lock,ftrace,all_bt,blocked_tasks";
+
+static const struct sys_info_name  si_names[] = {
+	{ SYS_SHOW_TASK_INFO,	"tasks" },
+	{ SYS_SHOW_MEM_INFO,	"mem" },
+	{ SYS_SHOW_TIMER_INFO,	"timer" },
+	{ SYS_SHOW_LOCK_INFO,	"lock" },
+	{ SYS_SHOW_FTRACE_INFO, "ftrace" },
+	{ SYS_SHOW_ALL_CPU_BT,	"all_bt" },
+	{ SYS_SHOW_BLOCKED_TASKS, "blocked_tasks" },
+};
+
+/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock,ftrace,..." */
+unsigned long sys_info_parse_param(char *str)
+{
+	unsigned long si_bits = 0;
+	char *s, *name;
+	int i;
+
+	s = str;
+	while ((name = strsep(&s, ",")) && *name) {
+		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+			if (!strcmp(name, si_names[i].name)) {
+				si_bits |= si_names[i].bit;
+				break;
+			}
+		}
+	}
+
+	return si_bits;
+}
+
+#ifdef CONFIG_SYSCTL
+int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
+					  void *buffer, size_t *lenp,
+					  loff_t *ppos)
+{
+	char names[sizeof(sys_info_avail) + 1];
+	struct ctl_table table;
+	unsigned long *si_bits_global;
+	int i, ret, len;
+
+	si_bits_global = ro_table->data;
+
+	if (write) {
+		unsigned long si_bits;
+
+		table = *ro_table;
+		table.data = names;
+		table.maxlen = sizeof(names);
+		ret = proc_dostring(&table, write, buffer, lenp, ppos);
+		if (ret)
+			return ret;
+
+		si_bits = sys_info_parse_param(names);
+		/*
+		 * The access to the global value is not synchronized.
+		 */
+		WRITE_ONCE(*si_bits_global, si_bits);
+		return 0;
+	} else {
+		/* for 'read' operation */
+		bool first = true;
+		char *buf;
+
+		buf = names;
+		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+			if (*si_bits_global & si_names[i].bit) {
+
+				if (first) {
+					first = false;
+				} else {
+					*buf = ',';
+					buf++;
+				}
+
+				len = strlen(si_names[i].name);
+				strncpy(buf, si_names[i].name, len);
+				buf += len;
+			}
+
+		}
+		*buf = '\0';
+
+		table = *ro_table;
+		table.data = names;
+		table.maxlen = sizeof(names);
+		return proc_dostring(&table, write, buffer, lenp, ppos);
+	}
+}
+#endif
+
 void sys_show_info(unsigned long info_flag)
 {
 	if (info_flag & SYS_SHOW_TASK_INFO)
-- 
2.39.5 (Apple Git-154)

