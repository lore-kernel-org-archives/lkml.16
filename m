Received: from out30-111.freemail.mail.aliyun.com (out30-111.freemail.mail.aliyun.com [115.124.30.111])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADB81DBB0C
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 10:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.111
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614610; cv=none; b=gglCoGVccjNd1pC6f/Aq8reGdLoBNdHy0/FRfDIGZnZAjffZ4NQ1mU9ryjlYLv7oCFi51Fn5OR2OhVLtJ+Z6ITqLpXwehB9gSsHmpJ0wOBR0ph9yKdK2hqUEirFqbLAuNOi/cIHdGQ/vgOqHAhzMLsnJIFHA0ENxm1BpdW0l0eY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614610; c=relaxed/simple;
	bh=jiZqWELHH6zVZjug6ahqQ4Ui+f0DgA4b8u+g1xo2IIY=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gSrc2K/3OQ+I8WE/ADAW6xuserTvnv1d8ohCAvAZkEjKmFZJTXVmZ8XQS2hbGTTJafwb6oYkSZgxDAfP5/uNlMjTnKsc2Pv7kJpqFmnFb+wzyoiJBjpXhu115gc6u2/vKJc/2Fu7/Si4HW4jPcBb4q6XSx1fxISRojCq7IX/g8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=Rm0r3CoR; arc=none smtp.client-ip=115.124.30.111
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="Rm0r3CoR"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1746614603; h=From:To:Subject:Date:Message-Id:MIME-Version;
	bh=pH12W43+xOJyWLT48EPv16j0Er63/FGhO+BlmDajKZs=;
	b=Rm0r3CoRgjCoxxN9CoNhJjnh+8T4dCmCg9FWDwJYMg1xqa2mG4DVHxHnVlwNxzkREFges/bjL5IUDFT9rE9Huj0G8G/xdYpyVN8ZOYve/ITLcKUHJVyEZ1mkQOYCAjRFnZvAZwd55DLWD9XGtgqOyeBLcB1GXORMJb09qRLivZs=
Received: from localhost(mailfrom:feng.tang@linux.alibaba.com fp:SMTPD_---0WZpoLJF_1746614602 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 07 May 2025 18:43:23 +0800
From: Feng Tang <feng.tang@linux.alibaba.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Lance Yang <ioworker0@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Feng Tang <feng.tang@linux.alibaba.com>
Subject: [PATCH RFC 0/3] generalize panic_print's dump function to be
Date: Wed,  7 May 2025 18:43:19 +0800
Message-Id: <20250507104322.30700-1-feng.tang@linux.alibaba.com>
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

Feng Tang (3):
  kernel/panic: generalize panic_print's function to show sys info
  kernel/hung_task: add option to dump system info when hung task
    detected
  kernel/watchdog: add option to dump system info when system is locked
    up

 include/linux/panic.h | 12 ++++++++++++
 kernel/hung_task.c    | 29 +++++++++++++++-------------
 kernel/panic.c        | 44 +++++++++++++++++++++----------------------
 kernel/watchdog.c     | 11 +++++++++++
 4 files changed, 61 insertions(+), 35 deletions(-)

-- 
2.39.5 (Apple Git-154)

