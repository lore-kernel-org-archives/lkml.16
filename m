Received: from out30-133.freemail.mail.aliyun.com (out30-133.freemail.mail.aliyun.com [115.124.30.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB2F520EB
	for <linux-kernel@vger.kernel.org>; Sun, 11 May 2025 08:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746953588; cv=none; b=Z5y9mY7K3rhpeR2okb3KvkrCNfcLFQEacV8E+Chs8kcKFS4csiH8MK0OIy/UFvfk5n4E6SO4LbJe9HRla8PhIiuErJHRk+gJ0x5ZKtwp5GiRpCK9waf1IksFOGPYPIqglT0dejju8hng7gQWbfXNBXImeUlALSat+FAqRNxpEfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746953588; c=relaxed/simple;
	bh=tAS+vpzqXuhwgb7tfR/AfG1PwPLtTlLONaGMt6u/XaY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=bwy5aVmR1EQOYabLRz4uGyZXn13wCJQhGdAd4cGHGEQ6O2VmNgPzgnnSwt14yn3I+hrEOKdz6irnslo7CLO0b8rt08Rba/w9aycmo/JLvRo3tcTFA0zJxYL+7TlgZEh+swwl7gTaVmie4QaOB6Hl/U+oZhhONUYj9rWJcggY8Ec=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=YQ2xv9HT; arc=none smtp.client-ip=115.124.30.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="YQ2xv9HT"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746953577; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=F6RpzbeAQBAS3TbYMjSI6+umsIIPmOwJmrJ+q64ssmE=;
	b=YQ2xv9HTcKr9qj2oINEq8CrYSVTyF6kq0tlQFrLZR1tymqIHMASqVHCbdF+6+T5eOZCAnMdMshaU7I5ihkIWT2dtIt/uYai6AxWL04OwdH30KdMhFcAQgqDnSExJZbbmYMTCX0NRpIPwZ1phUPz6Z1qJs7Hg117epdu6b8gBJBk=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WaA7MVQ_1746953575 cluster:ay36)
          by smtp.aliyun-inc.com;
          Sun, 11 May 2025 16:52:56 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <lance.yang@linux.dev>,
	linux-kernel@vger.kernel.org
Cc: mhiramat@kernel.org,
	llong@redhat.com,
	Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH v1 0/3]  generalize panic_print's dump function to be used by other kernel parts
Date: Sun, 11 May 2025 16:52:51 +0800
Message-Id: <20250511085254.61446-1-feng.tang@linux.alibaba.com>
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

So this patchset extract the function out, and make it usable for other
cases which also need system info for debugging. 

Locally these have been used in our bug chasing for stablility issues
and was helpful.

Please help to review, thanks!

- Feng

Changelog:

  Since RFC:
     * Don't print all cpu backtrace if 'sysctl_hung_task_all_cpu_backtracemay'
       is 'false' (Lance Yang)
     * Change the name of 2 new kernel control knob to have 'mask' inside, and
       add kernel document and code comments for them (Lance Yang)
     * Make the sys_show_info() support printk msg replay and all CPU backtrace. 

Feng Tang (3):
  kernel/panic: generalize panic_print's function to show sys info
  kernel/hung_task: add option to dump system info when hung task
    detected
  kernel/watchdog: add option to dump system info when system is locked
    up

 .../admin-guide/kernel-parameters.txt         | 10 ++++
 include/linux/panic.h                         | 11 +++++
 kernel/hung_task.c                            | 42 ++++++++++++-----
 kernel/panic.c                                | 47 ++++++++++---------
 kernel/watchdog.c                             | 20 ++++++++
 5 files changed, 95 insertions(+), 35 deletions(-)

-- 
2.39.5 (Apple Git-154)

