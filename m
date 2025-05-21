Received: from out30-132.freemail.mail.aliyun.com (out30-132.freemail.mail.aliyun.com [115.124.30.132])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC30F1EA7DD
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.132
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747805488; cv=none; b=IigcDIEq/iFSlLiDDfG7j9pgPa04Nk4Ffq5v1hFi9vvG03f5NPZZPHShHTLEmIpdbtJihnGniJTvwrZUgAF8u48iG7Ro3Vn5GxTCqEKlpu3fR9qc6q5M+WMV/nO+eKg4EIQPDfdDINCyslVJhqqNyjsd6Gyj3WEehunHwDfyzdg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747805488; c=relaxed/simple;
	bh=g3/5xCYIg/+p8yKXf1omkM/rN2NJh+kGwfDAO/va/ME=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ur9oru6qx2OkrlJZsX1rwKU/PjN6nytkv0Va0tUN0oEZDTta5jZhqRvylhveuu4DJT3BrNiqrd/E/pzMU1153ncKhyVrS5flBhVQjCTVK66EGFMtGW6nu1U3/KNbZbp1LVNJ8u/KOi5sUvAJLapPnttuHmQWMMjzqfeeampkIIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=VxmbgCbU; arc=none smtp.client-ip=115.124.30.132
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="VxmbgCbU"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1747805482; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=dcP8LHyPjzdlImshxVILGO4hUrWa+0RbtsHn2HWY6b0=;
	b=VxmbgCbUpZt8+jQ/qCG6XaHQUM3Gkn40/+c+OBE8ks8epHAG7llCqORrm3XhcJiYPUSlDRzUDdeLf1r0jfdJXkeCG8HhjffmHc++YVNBmXGCAKaOHQSt8MYSBAmPoQuhN3zRVzFwW1hYpipAJeilZyN7KNSrJBGi8VSXtiLCmgs=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WbQMFDV_1747805481 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 21 May 2025 13:31:21 +0800
Date: Wed, 21 May 2025 13:31:20 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Petr Mladek <pmladek@suse.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>, linux-kernel@vger.kernel.org,
	mhiramat@kernel.org, llong@redhat.com,
	"Paul E. McKenney" <paulmck@kernel.org>
Subject: Re: [PATCH v1 1/3] kernel/panic: generalize panic_print's function
 to show sys info
Message-ID: <aC1lKGWOuYXP7Bmt@U-2FWC9VHC-2323.local>
References: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
 <20250511085254.61446-2-feng.tang@linux.alibaba.com>
 <aCMXf0JOi1g6ZI8u@pathway.suse.cz>
 <aCNHzXkz4wfnIDPM@U-2FWC9VHC-2323.local>
 <aCXCpGkXJ1x9ncHS@pathway.suse.cz>
 <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aCbPOry4r_ac0zUL@U-2FWC9VHC-2323.local>

On Fri, May 16, 2025 at 01:38:02PM +0800, Feng Tang wrote:
> On Thu, May 15, 2025 at 12:32:04PM +0200, Petr Mladek wrote:
[...]
> > > > The console reply might be handled by a separate:
> > > > 
> > > > 	panic_console_reply=1
> > > > 
> > > > And it would obsolete the existing "panic_print" which is an
> > > > ugly name and interface from my POV.
> > > 
> > > Agree it's ugly :). But besides a kernel parameter,  'panic_print' is
> > > also a sysctl interface, I'm afraid renaming it might break user ABI.
> > 
> > A solution would be to keep it and create "panic_sys_info="
> > with the human readable parameters in parallel. They would
> > store the request in the same bitmap.
> > 
> > We could print a message that "panic_print" has been obsoleted
> > by "panic_sys_info" when people use it.
> > 
> > Both parameters would override the current bitmap. So the later
> > used parameter or procfs/sysfs write would win.
> 
> Reasonalbe.
> 
> > Note:
> > 
> > One question is whether to use sysctl or module parameters.
> > 
> > An advantage of sysctl is the "systcl" userspace tool. Some people
> > might like it. But the API is very old and a bit cumbersome for
> > implementing.
> > 
> > The sysfs, aka include/linux/moduleparam.h, API looks cleaner to me.
> > But the parameters are hidden in the /sys/... jungle ;-)
> > 
> > I would slightly prefer "sysctl" because these parameters are easier
> > to find.
> 
> I will think about the string parsing in sys_info.c, and in the backend,
> a bitmap is still needed to save the parsing result, and as the parameter
> for sys_show_info().

Hi Petr

I tried further this way, and with below patch on top of current 1/3
patch, the 'panic_sys_info' sysctl interface basically works, as parsing
user-input, and save it in 'panic_print' bitmap. 

It has  one problem that it doesn't support the string parsing as a the
kernel command line parameter (auto-derived from sysctl interface), I'm
not sure if we should add a __setup() or early_param() for it, or it's
fine?

Thanks,
Feng

---
diff --git a/include/linux/sys_info.h b/include/linux/sys_info.h
index 79bf4a942e5f..d6d55646e25a 100644
--- a/include/linux/sys_info.h
+++ b/include/linux/sys_info.h
@@ -17,4 +17,8 @@
 
 extern void sys_show_info(unsigned long info_mask);
 
+struct ctl_table;
+extern int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
+					  void *buffer, size_t *lenp,
+					  loff_t *ppos);
 #endif	/* _LINUX_SYS_INFO_H */
diff --git a/kernel/panic.c b/kernel/panic.c
index 3d9cf8063242..8ca9b30f0fe4 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -88,6 +88,13 @@ static const struct ctl_table kern_panic_table[] = {
 		.extra2         = SYSCTL_ONE,
 	},
 #endif
+	{
+		.procname	= "panic_sys_info",
+		.data		= &panic_print,
+		.maxlen         = sizeof(panic_print),
+		.mode		= 0644,
+		.proc_handler	= sysctl_sys_info_handler,
+	},
 	{
 		.procname       = "warn_limit",
 		.data           = &warn_limit,
diff --git a/lib/sys_info.c b/lib/sys_info.c
index 4090b2e0515e..27de6f0d0a4d 100644
--- a/lib/sys_info.c
+++ b/lib/sys_info.c
@@ -4,6 +4,121 @@
 #include <linux/console.h>
 #include <linux/nmi.h>
 
+struct sys_info_name {
+	unsigned long bit;
+	const char *name;
+};
+
+static const char sys_info_avail[] = " tasks mem timer lock ftrace all_bt blocked_tasks ";
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
+
+/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock" */
+static int write_handler(const struct ctl_table *ro_table, void *buffer,
+				size_t *lenp, loff_t *ppos)
+{
+	char names[sizeof(sys_info_avail)];
+	char *buf, *name;
+	struct ctl_table table;
+	unsigned long *si_flag;
+	int i, len, ret;
+
+	si_flag = ro_table->data;
+
+	/* Clear it first */
+	*si_flag = 0;
+
+	table = *ro_table;
+	table.data = names;
+	table.maxlen = sizeof(names);
+	ret = proc_dostring(&table, 1, buffer, lenp, ppos);
+	if (ret)
+		return ret;
+
+	buf = names;
+	while ((name = strsep(&buf, ",")) && *name) {
+		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+			if (!strcmp(name, si_names[i].name))
+				*si_flag |= si_names[i].bit;
+		}
+	}
+
+	return 0;
+}
+
+int sysctl_sys_info_handler(const struct ctl_table *ro_table, int write,
+					  void *buffer, size_t *lenp,
+					  loff_t *ppos)
+{
+	char names[sizeof(sys_info_avail) + 1];
+	char *buf, *name;
+	struct ctl_table table;
+	unsigned long *si_flag;
+	int i, ret, len;
+
+	si_flag = ro_table->data;
+
+	if (write) {
+		/* Clear it first */
+		*si_flag = 0;
+
+		table = *ro_table;
+		table.data = names;
+		table.maxlen = sizeof(names);
+		ret = proc_dostring(&table, 1, buffer, lenp, ppos);
+		if (ret)
+			return ret;
+
+		/* Expecting string like "xxx_sys_info=tasks,mem,timer,lock" */
+		buf = names;
+		while ((name = strsep(&buf, ",")) && *name) {
+			for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+				if (!strcmp(name, si_names[i].name))
+					*si_flag |= si_names[i].bit;
+			}
+		}
+
+		return 0;
+	} else {
+		bool first = true;
+
+		memset(names, 0, sizeof(names));
+
+		buf = names;
+		for (i = 0; i < ARRAY_SIZE(si_names); i++) {
+			if (*si_flag & si_names[i].bit) {
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
+		return proc_dostring(&table, 0, buffer, lenp, ppos);
+	}
+}
+
 void sys_show_info(unsigned long info_flag)
 {
 	if (info_flag & SYS_SHOW_TASK_INFO)


