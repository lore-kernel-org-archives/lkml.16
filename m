Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E91F21B9CD
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 19:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745004875; cv=none; b=ctTCqi7h9LApvyIwY0gA0WEF35fZWwtIWlWnIztu+H1A3287lVaRPWf59r2rdNIwm/+tM4M5jA1XvpQhKG14nhqzDVgPNsG6BitHwxErnqm5/I6f4owZijVHgfQ0VXEez2N9+dkIhjeXzpTWsUIzfyDbs8GbgbEIsqh3cz8fF+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745004875; c=relaxed/simple;
	bh=CAJl30qWQRiw0E843IMYmaAAAcUjarppCOQ/dr49iPM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bTjaJCjHNW0O7eL2zLrNXWf/4O3Pzg6Jx+atCouSuZ+igSf0TPgydAGLs3SNV7M7Nr5mREMW2FdL5/DThr4zshC4qZCv6e5dMTNv68wCLyZtK7g0VcRF99RsjLVUSipmfvV3kMDNqi3NhqxWu0tepZ95KrTuzQ5VzmQdVOLm4xY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=i86p1Qf2; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="i86p1Qf2"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53IJCW2C024634;
	Fri, 18 Apr 2025 19:34:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=dhBcYOkR+DgSc4JhpXvYt6GrlZqKs
	aeMM14zzfXBC5E=; b=i86p1Qf2DYXdH7ZXNoVa3uNugLbkTGCqEJpiQKHljWXuu
	rsF4D52u1EOms4wgaFySudHlh1gkvQkx0iKCs9cZgjEy9ld91DlSAgZcj/+ylOQH
	ERwRmCp59iiqk8qSrJn3W8XMtc5beKVS5g3V4BiQVzmcXd3ZAAPklQVjEWhBj7DA
	GY8r2bjnLCjC915leSMA1j/uSKOkVoM97tAhrfPczB1fsqj8qvG+Ppc+ugt4POhR
	AaqtIMFyCMNhRg7w2wa1Ab8zKB4RP+jm5zd1/i4x/yX1wY/WZazLiGTkgTaUKjOq
	O8XbtXlyU4fY/DM6VbAK1D1Ixqtvsjl1TE2cQNo9A==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46180wgxph-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 19:34:14 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53IIn28i038828;
	Fri, 18 Apr 2025 19:34:14 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 460d4w8qqy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 18 Apr 2025 19:34:14 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de
Subject: [PATCH V2 0/3] Scheduler time slice extension
Date: Fri, 18 Apr 2025 19:34:07 +0000
Message-ID: <20250418193410.2010058-1-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_07,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0 spamscore=0
 bulkscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504180148
X-Proofpoint-ORIG-GUID: 0HYHuf0QhRe-WXuj4D3xE_rsciVWv0Tp
X-Proofpoint-GUID: 0HYHuf0QhRe-WXuj4D3xE_rsciVWv0Tp

A user thread can get preempted in the middle of executing a critical
section in user space while holding locks, which can have undesirable affect
on performance. Having a way for the thread to request additional execution
time on cpu, so that it can complete the critical section will be useful in
such scenario. The request can be made by setting a bit in mapped memory,
such that the kernel can also access to check and grant extra execution time
on the cpu. 

There have been couple of proposals[1][2] for such a feature, which attempt
to address the above scenario by granting one extra tick of execution time.
In patch thread [1] posted by Steven Rostedt, there is ample discussion about
need for this feature.

However, the concern has been that this can lead to abuse. One extra tick can
be a long time(about a millisec or more). Peter Zijlstra in response posted a 
prototype solution[3], which grants 50us execution time extension only.
This is achieved with the help of a timer started on that cpu at the time of
granting extra execution time. When the timer fires the thread will be
preempted, if still running. 

This patchset implements above solution as suggested, with use of restartable
sequences(rseq) structure for API. Refer to [3][4] for further discussions.


v1: 
https://lore.kernel.org/all/20250215005414.224409-1-prakash.sangappa@oracle.com/

v2:
- Based on dicussions in [3], expecting user application to call sched_yield()
  to yield the cpu at the end of the critical section may not be advisable as
  pointed out by Linus.  

  So added a check in return path from a system call to reschedule if time
  slice extension was granted to the thread. The check could as well be in
  syscall enter path from user mode.
  This would allow application thread to call any system call to yield the cpu. 
  Which system call should be suggested? getppid(2) works.

  Do we still need the change in sched_yield() to reschedule when the thread
  has current->rseq_sched_delay set?

- Added patch to introduce a sysctl tunable parameter to specify duration of
  the time slice extension in micro seconds(us), called 'sched_preempt_delay_us'.
  Can take a value in the range 0 to 100. Default is set to 50us.
  Setting this tunable to 0 disables the scheduler time slice extension feature.

[1] https://lore.kernel.org/lkml/20231025054219.1acaa3dd@gandalf.local.home/
[2] https://lore.kernel.org/lkml/1395767870-28053-1-git-send-email-khalid.aziz@oracle.com/
[3] https://lore.kernel.org/all/20250131225837.972218232@goodmis.org/
[4] https://lore.kernel.org/all/20241113000126.967713-1-prakash.sangappa@oracle.com/
[5] https://lore.kernel.org/lkml/20231030132949.GA38123@noisy.programming.kicks-ass.net/
[6] https://lore.kernel.org/all/1631147036-13597-1-git-send-email-prakash.sangappa@oracle.com/

Prakash Sangappa (3):
  Sched: Scheduler time slice extension
  Sched: Tunable to specify duration of time slice extension
  Sched: Add scheduler stat for cpu time slice extension

 include/linux/entry-common.h | 11 +++++--
 include/linux/sched.h        | 23 ++++++++++++++
 include/uapi/linux/rseq.h    |  5 +++
 kernel/entry/common.c        | 21 ++++++++++---
 kernel/rseq.c                | 59 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          | 37 ++++++++++++++++++++++
 kernel/sched/debug.c         |  1 +
 kernel/sched/syscalls.c      |  7 +++++
 8 files changed, 156 insertions(+), 8 deletions(-)

-- 
2.43.5

