Received: from out30-113.freemail.mail.aliyun.com (out30-113.freemail.mail.aliyun.com [115.124.30.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EA5113A258
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 02:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751508618; cv=none; b=svZe7tnfOqUuSsIv0NTZLi+rrB6cjFbVJhkv4kjC7GrR0WYHJMgXuTm2bMwnyapz/OVEiC8ITliZnMOZBR9NLiFb1aONBIUPg8/HQlNE1CEUQ0dT8FoKmuABak4F6pZA6hUHar/+5nBGld0LSqlcjzWQHOU9SG8lk3FGW3yKAuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751508618; c=relaxed/simple;
	bh=vwwNDJjzlQVohb13fx30SQfuyj8E8X58401NQAwwcMU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=lByRqU0JrYjHFtPSbgsHZTbK2SEwZztIioAw/K7M4GEw3MBgQBVasjUGxzkKawMoLnwk6h2zgV0wzT7V9b/9kXviNqwmhMv8mGk6i42IJZox+3T1I0gOk9A110Afj8hMWaNrRtA4I9d0yctCnWG4yTAqxTqyC4R+81d1pTrBa+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=RjSEyhxY; arc=none smtp.client-ip=115.124.30.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="RjSEyhxY"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751508606; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=edvmugWDJTxNMlK+9JCcM+4eNkyAjcSLRhmeAsoFGzs=;
	b=RjSEyhxYbxAvZqPd4skuf3HNM5qYrdenFnHo1fllaLGOWYEQOEfOL0IgcMt5FChjtNuc3Sz8UfZwMVlGlAIz5/LokvZN5f8/iOGofXraLXCubov1m5TA/aKgpk9LT/TTkwDZNRL8qbgY2l8QHuO1CUweulF7dnF/3ZJViqUx2Uo=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WgqZ3cs_1751508605 cluster:ay36)
          by smtp.aliyun-inc.com;
          Thu, 03 Jul 2025 10:10:05 +0800
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
Subject: [PATCH v3 0/5] generalize panic_print's dump function to be used by other kernel parts 
Date: Thu,  3 Jul 2025 10:09:59 +0800
Message-Id: <20250703021004.42328-1-feng.tang@linux.alibaba.com>
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
and make it available for other cases which also need to dump system info
for debugging. 

Also as suggested by Petr Mladek, add 'panic_sys_info=' interface to
take human readable string like "tasks,mem,locks,timers,ftrace,....", 
and eventually obsolete the current 'panic_print' bitmap interface.

In RFC and V1 version, hung_task and SW/HW watchdog modules are enabled
with the new sys_info dump interface. In v2, they are kept out for
better review of current change, and will be posted later. 

Locally these have been used in our bug chasing for stability issues
and was proven helpful.

Many thanks to Petr Mladek for great suggestions on both the code and
architectures!

- Feng

One to do left is about adding note for obsoleting 'panic_print' cmdline
as discussed in https://lore.kernel.org/lkml/aFvBuOnD0cAEWJfl@U-2FWC9VHC-2323.local/
and will be posted later.

Changelog:

  Since v2:
     * Rename to PANIC_CONSOLE_REPLAY (Petr Mladek) 
     * Don't let kernel.h include sys_info.h (Petr Mladek)
     * Improve documents and coding style (Petr Mladek/Lance Yang)
     * Add 'panic_console_replay' parameter (Petr Mladek)
     * Fix compiling problem (0Day bot)
     * Add reviewed-by tag from Petr for patch 1/5

  Since V1:
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
  panic: add 'panic_sys_info' sysctl to take human readable string
    parameter
  panic: add 'panic_sys_info=' setup option for kernel cmdline
  panic: add note that panic_print sysctl interface is deprecated

 .../admin-guide/kernel-parameters.txt         |  21 ++-
 Documentation/admin-guide/sysctl/kernel.rst   |  20 ++-
 include/linux/sys_info.h                      |  27 ++++
 kernel/panic.c                                |  71 +++++-----
 lib/Makefile                                  |   2 +-
 lib/sys_info.c                                | 122 ++++++++++++++++++
 6 files changed, 221 insertions(+), 42 deletions(-)
 create mode 100644 include/linux/sys_info.h
 create mode 100644 lib/sys_info.c

-- 
2.43.5

