Received: from out30-130.freemail.mail.aliyun.com (out30-130.freemail.mail.aliyun.com [115.124.30.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74701156677
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 01:08:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750036132; cv=none; b=C/AHwf/s7819wvWaF6g/HnwMUVvqqMqAfBzIF1Eb7GGt1YlKDLOEcevALHlW0clAdPUA4dTFYOsZBJ4oM0GqqlHcgZkRFO4wCOEuSmxmT8c1xO1DPMp7HeulNebX8NCA1bwSwQt8Sft0kZsxWPCsLPRKfsqoqIQS4rPkYyUQJG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750036132; c=relaxed/simple;
	bh=mn8rlMH1QU6CVrwegnSLDndCUjago51N5YKqkGNYGQY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tBEgGr2eaPNXM7MALWtYth5u4I4uRPKY77J5Q9+GiFN3TLk87XDA3cDbidvzFUhZqrkg5SN0dFdyiJTZxMqQkgeiqCDdufoYu+aZq8YXQ5o9LIWa3FvT0qFEWalvY5Gn5gCOywRlJuxdbbQNSvK5OUhEsI/OBz+ysHNK2HvwO8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=c0mzj0wP; arc=none smtp.client-ip=115.124.30.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="c0mzj0wP"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1750036121; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=8zeKyqydqxDuVfkT53Zd9krS+5GqnZkwc9ENxNH7g7I=;
	b=c0mzj0wPhmZt27jLKkXWfCaSA25YpbYO1rHCUznm0cuqVXL9QD5AaVpnfwohF6JwMPubZVe4mvkFgQNhkAH8aVZwdkIXVKg9eru/Zqz6UPHu6w1HNLLOFVpuKq6IpF8el14CkFSTdIxJlUXE0TLgxqYR5FdNUrdiVuJqfOfmT88=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0Wdr3n89_1750036120 cluster:ay36)
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
Subject: [PATCH V2 0/5] generalize panic_print's dump function to be used by other kernel parts 
Date: Mon, 16 Jun 2025 09:08:35 +0800
Message-Id: <20250616010840.38258-1-feng.tang@linux.alibaba.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When working on kernel stability issues, panic, task-hung and 
software/hardware lockup are frequently met. And to debug them, user
may need lots of system information at that time, like task call stacks,
lock info, memory info etc. 

panic case already has panic_print_sys_info() for this purpose, and has
a 'panic_print' bitmask to control what kinds of information is needed,
which is also helpful to debug other task-hung and lockup cases.

So this patchset extract the function out to a new file 'lib/sys_info.c',
and make it usable for other cases which also need system info for
debugging. 

Also as suggested by Petr Mladek, add 'panic_sys_info=' interface to
take human readable string like "tasks,mem,lock,timer,ftrace,....", 
and eventually obsolete the current 'panic_print' bitmap interface.

In RFC and V1 version, hung_task and SW/HW watchdog modules are enabled
with the new sys_info dump interface. In v2, they are kept out for
better review of current change, and will be posted later. 

Locally these have been used in our bug chasing for stabilility issues
and was helpful.

Please help to review, thanks!

- Feng

Changelog:

  Sinc V1:
     * Separate the 'sys_show_info' related code to new file sys_info.[ch] 
       (Petr Mladek)
     * Clean up the code for panic console replay (Petr Mladek)
     * Add 'panic_sys_info=' cmdline and sysctl interface for taking
       human readable parameters (Petr Mladek)
     * Add note about the obsoleting of 'panic_print' (Petr Mladek)
     * Hold the changes to hungtask/watchdog 

  Since RFC:
     * Don't print all cpu backtrace if 'sysctl_hung_task_all_cpu_backtracemay'
       is 'false' (Lance Yang)
     * Change the name of 2 new kernel control knob to have 'mask' inside, and
       add kernel document and code comments for them (Lance Yang)
     * Make the sys_show_info() support printk msg replay and all CPU backtrace. 


Feng Tang (5):
  panic: clean up code for console replay
  panic: generalize panic_print's function to show sys info
  sys_info: add help to translate sys_info string to bitmap
  panic: add 'panic_sys_info=' setup option for sysctl and kernel
    cmdline
  panic: add note that panic_print interface is deprecated

 .../admin-guide/kernel-parameters.txt         |  13 ++
 Documentation/admin-guide/sysctl/kernel.rst   |  18 +++
 include/linux/kernel.h                        |   1 +
 include/linux/sys_info.h                      |  27 ++++
 kernel/panic.c                                |  66 +++++----
 lib/Makefile                                  |   2 +-
 lib/sys_info.c                                | 127 ++++++++++++++++++
 7 files changed, 217 insertions(+), 37 deletions(-)
 create mode 100644 include/linux/sys_info.h
 create mode 100644 lib/sys_info.c

-- 
2.39.5 (Apple Git-154)

