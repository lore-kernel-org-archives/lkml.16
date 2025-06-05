Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28FB414B08A
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 07:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749107662; cv=none; b=HsnVHfvmKIefePVLHB6jGfD2JQ9kL9RM4LAQBI65mia8aoGpyiZCgy56tJrOw9ju0KB2y47YMUb28kW6jn5yStMX8ZG/mn7tM1hAB3WNNbi6icGoant0xVBymkGLqyVKpaGsg+keHPWzBK0R9Xmb1to6fp7IZmqNyp6nvbQXshA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749107662; c=relaxed/simple;
	bh=3VEwGz2Z+/tP7cOrOPkL9pne6x8ixDnBK3Ac2KnuJM8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=b5QQ5uWREjRgrIm92/gpSc+mOzdcke8ZGULUyXzVJbVOZTxIdrgf6gIt+PSlSpqaenOaLYtFxFTgxVeknmUDkDOhzoe35T4Zanu9B96Z7PQtQWvbNOxkNPtXmS8fbd3xRsH/LuiH0CoscLi4r6N+V232w4n8lG4feEYM2WmXZ6w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=et70ar5B; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="et70ar5B"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so6776805e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 00:14:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749107658; x=1749712458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dn4akhza0qZ3+Y35m3BBWIln1ChMI0xhmdYu7WD5G8Y=;
        b=et70ar5BvU43DE6bndYW0Xz5DrAeuagAMku7ZFlnW6bR5T2adZjphVOdKYnaLtQC4/
         6ercInjrQV3xNJprwiw9skijXGXNoB+sJU6BmGdFpipUXp/y//191BR1MdzrqHlINBoB
         okxgxmHNOjqDhs3PXy1buFmyDr5fYbYfSNsqlSeKq13087G6ktDwlat/oHMPeiXaFoSF
         136L4XwbJcUX+JDxR+YiFe0gfTPSx7CY6/boupYe1PYPmRdEYQ6MfABHjJG6jsnGuHrV
         ahAe+ZmPlJRQygcKZCnyihKHMTwSKox929t7wzzcTTT67udjce4C1V5u5FIdDgHtmDlU
         JJyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749107658; x=1749712458;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dn4akhza0qZ3+Y35m3BBWIln1ChMI0xhmdYu7WD5G8Y=;
        b=VQbL3tQf3mq+UZGPap6CfEvJDQWUSmMNLGoy9zq34E1uxdrCvbFKXxGyZd0U+PJNgN
         aPVhBw7TpExpdnFogK6RXYmxiDw3ffpTb4JcqVYwa6oQMSygsrdpz4x9fOMMx0Vko/Bm
         yfSYA9g2AJgfEX0d8v+aj1N/XP1NC1NFVCS90nLV8USFmerwrJG+YU3l5mIk36vsGyZI
         0MUTbTR9oMRopM9Ejwq7XoW3ngYlFjN98hY2SWbFfVGG3TioeKigw0+Bg6JxndV0jSlm
         jRmBCEWvMeb8Jsc+ciZAVJa2E95hHbdkKz+V+krBYgD1QthRzh/GzdI22ZRJ10TZawQf
         xjhg==
X-Gm-Message-State: AOJu0YyEWxR2k4qloRARfkGGezbsQnPA4+iMeLYtWFU0EYoNxv7lPhxU
	RhAqlmZKQIR3R2LoeCv7bMSLZmp53STg/0Suxg4fKlu9/4BR2ulB+Zwr
X-Gm-Gg: ASbGncvvVfXkOocuJ2lmBlclM0Gx2FEbywGIlMoQlb/vLxa/lUJDJ+bcYq5FYfVGrqx
	9B9wfV2V1wBQ+e8m0GiCoo6rQZZXDw8weCH8Pjyg/Lv0hwQzhmhRXi9FxWRFW12lounnnRAS9zo
	SaTZW9loOv8o7EoihJ3+U+thCEvyyqiNfJON/HBaqlrRq7pi/j/KGCUQYuyxhqeymoEjFwt/NO6
	iGn3EJW5gaaPIJNY5euJnubXI1KNZsVl8qEwipbb0Af1ZqZqUEZVkpb6vxAvpv44ocpyiwp8WAx
	MozuMSH5LJ0/k56ejrvMS0GzYWJsNMefJ4pX+cKwnyOpj+s0yo05eIkNzhqhbYqI
X-Google-Smtp-Source: AGHT+IGLOkw7L4QYpuu7ptO9meV5YrqMTpeAhemxlEOyuGmrgW3DbC3zlo3SqAWnUDLJGR6sqY/nyw==
X-Received: by 2002:a05:600c:4f47:b0:43c:efed:733e with SMTP id 5b1f17b1804b1-451f0a7c52emr55093655e9.14.1749107658058;
        Thu, 05 Jun 2025 00:14:18 -0700 (PDT)
Received: from localhost.localdomain ([78.210.56.234])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a4f00972b5sm23885431f8f.76.2025.06.05.00.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 00:14:17 -0700 (PDT)
From: Yuri Andriaccio <yurand2000@gmail.com>
To: Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>
Cc: linux-kernel@vger.kernel.org,
	Luca Abeni <luca.abeni@santannapisa.it>,
	Yuri Andriaccio <yuri.andriaccio@santannapisa.it>
Subject: [RFC PATCH 0/9] Hierarchical Constant Bandwidth Server
Date: Thu,  5 Jun 2025 09:14:03 +0200
Message-ID: <20250605071412.139240-1-yurand2000@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This is the first set of patches that implements Hierarchical RT scheduling,
aimed at replacing the current RT_GROUP_SCHED implementation with something more
robust and theoretically sound. The patchset has been presented at OSPM25
(https://retis.sssup.it/ospm-summit/), and a summary of its inner workings can
be found at https://lwn.net/Articles/1021332/ .

Summary of the patches:
 1-4) Preparation patches, so that the RT classes' code can be used both
      for normal and cgroup scheduling.
 5) Basic HCBS, no migration and only one level hierarchy.
 6) Remove old RT_GROUP_SCHED code.
 7) Add support for cgroup v2
 8) Remove support for cgroup v1
 9) HCBS with deeper hierarchies.

The patchset allows to create bandwidth reservations for cgroups which run
SCHED_FIFO/SCHED_RR tasks. Whenever a cgroup is created, N cgroup's local
runqueues and N dl_servers are allocated, one for each CPU.  The local runqueues
emulate standard scheduling for the FIFO/RR classes, as rt.c code is reused on
these local runqueues without excessive modifications. Through the cgroup's
virtual files it is possible to setup the cgroup's reservation. The dl_servers
are started only when there are active tasks, and invoke the RT clasess'
scheduler when they are deemed runnable.

Example usage (cgroups v2):
  // create the cgroup
  mkdir /sys/fs/cgroup/g0

  // request a 10/100ms reservation
  echo 100000 > /sys/fs/cgroup/g0/cpu.rt_period_us
  echo 10000 > /sys/fs/cgroup/g0/cpu.rt_runtime_us

  // move any process in the cgroup
  echo $PID > /sys/fs/cgroup/g0/cgroup.procs

  // if not already an RT process
  // set scheduling class to FIFO or RR
  chrt [-r] -p $PRIORITY $PID


Testing:

The HCBS mechanism has been evaluated on several synthetic tests with RT groups,
containing RT tasks with different priorities and the groups bandwidths are
limited as expected.

The tests can be found at https://github.com/Yurand2000/HCBS-rust-initrd . They
are written in C and Rust and should support any distro without issues, as they
are statically compiled. These executables test both functional features and
timing guarantees of the HCBS scheduler, but most are tailored to work with
future patches which introduce task migration between CPUs.

The Makefile will compile the test suite to a fully functional initramfs, ready
to use in qemu, but of course the tests' executables can also be loaded in a
fully fledged distro to run tests there. Further comments on the test suite will
follow in a future RFC.


Additional comments:

1) As pointed out by Peter Zijlstra at OSPM25, we removed support for cgroups v1
(patch 0008), but the mechanism should work also with cgroups v1 if the control
files (i.e. cpu.rt_period_us and cpu.rt_runtime_us) are re-enabled in the legacy
controller.

2) In response to
https://lwn.net/ml/all/20250310170442.504716-1-mkoutny@suse.com/, the new
RT_GROUP_SCHED mechanism solves the issues which are discussed there:
- RT group scheduling for cgroup v2
- RT tasks can be created in the root control group without having to touch 
  any of the hierarchy or reservations altogheter.


Future work:

As we already mentioned at OSPM25, we already have (partially) complete patches
for task migration among CPUs and assignment of different runtimes for each
individual CPU. The aim of this RFC is also to validate the current foundations
before completing and submitting the patchset.

Future patches:
 - HCBS with task migration.
 - HCBS with different runtimes per CPU.
 - capacity aware bandwidth reservation.
 - enable/disable dl_servers when a CPU goes online/offline.

Have a nice day,
Yuri

- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

Yuri Andriaccio (1):
  sched/rt: Remove support for cgroups-v1

luca abeni (8):
  sched/deadline: Do not access dl_se->rq directly
  sched/deadline: Make a distinction between dl_rq and my_q
  sched/rt: Pass an rt_rq instead of an rq where needed
  sched/rt: Move some inline functions from rt.c to sched.h
  sched/deadline: Hierarchical scheduling with DL on top of RT
  sched/rt: Remove unused code
  sched/core: Cgroup v2 support
  sched/deadline: Allow deeper hierarchies of RT cgroups

 include/linux/sched.h    |   10 +-
 kernel/sched/autogroup.c |    4 +-
 kernel/sched/core.c      |   44 +-
 kernel/sched/deadline.c  |  256 ++++++--
 kernel/sched/debug.c     |    6 -
 kernel/sched/fair.c      |    6 +-
 kernel/sched/rt.c        | 1266 +++++++++++---------------------------
 kernel/sched/sched.h     |  133 ++--
 kernel/sched/syscalls.c  |    8 +-
 9 files changed, 672 insertions(+), 1061 deletions(-)

-- 
2.49.0

