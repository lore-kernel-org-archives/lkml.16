Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44F061AAC9
	for <linux-kernel@vger.kernel.org>; Fri,  2 May 2025 02:00:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746151226; cv=none; b=TppM2XvMNrax4LXJPPodnH811IsDqPn08GTF7U/8i4wew1p3cKeedpLVrOM0/xsr7K4EyhQum16HOKE3EHz8ElGobglchEQpIqIzYEo1hFPWF6Dru5xQ0xPwc4w6SAmV5DVUKEc5m7pF+PAQBYrRlXWcnnRIzFkkHOfrzgPcQPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746151226; c=relaxed/simple;
	bh=kpRoIaGYD06X9YMd+ZJNo/rzg+WKwqETjw7smvXRlto=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VIGecQ01ux6C7L7cvSmTKeuLoJ5e2LZY7tIUzDlJknc551Knd1SRf6E+tIoKSrAjhOpz5hqxMhkra6X0Iv+Vp3B5TwBIwT5SxheKZvuIshzklyoKaX4KuEgDZr0+6/X0w2E//22WGh6nE10nh6Ig3Q++s7hrJjBg6gz4w8pMTX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=NLfCNqT9; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="NLfCNqT9"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 541KeQOR025009;
	Fri, 2 May 2025 01:59:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=l1n8z5bxw8VHxkEW7AWAEXC1znZs1
	RbwqaWrSJfKroY=; b=NLfCNqT93txZ7xHhjVTjJHmJU0655uyqBGZs/RnHY8j/1
	2Qe9P3y3sQfyIiVC2Vu8oOnWUy+xsKAcGRJ06GHwQr25pedqUIwxXeL1gHHBAl4E
	hstsIRPW3wp1Rx1Ld1z97/hZGdRTgwcJzhOOrjCSDbS46+LGfD4nWTGuIN8dtMZ7
	U8bKsqZAxyAYhI51SJjhI0ly1BakRAf1RUezJdfJ1nLnzZlX75jhFxlGm6CTuqOJ
	EEKAA9lrp3AQqiqiHdYpyGQn7UCj9BTTCZJHv7C1dybzPu2fbFfDTcNZ7GlQC5qE
	CBNBReTp7ynsvRpYjvgAfySE9jLF705VzMF2MNrPQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46b6usmcc1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 02 May 2025 01:59:58 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5421aMDR035421;
	Fri, 2 May 2025 01:59:57 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 468nxd1euw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 02 May 2025 01:59:57 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V3 0/4] Scheduler time slice extension
Date: Fri,  2 May 2025 01:59:51 +0000
Message-ID: <20250502015955.3146733-1-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-01_06,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 suspectscore=0 mlxscore=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2504070000 definitions=main-2505020013
X-Proofpoint-ORIG-GUID: cEiyy3YzqfhBSehMertcFPUOid1N06Ab
X-Proofpoint-GUID: cEiyy3YzqfhBSehMertcFPUOid1N06Ab
X-Authority-Analysis: v=2.4 cv=Hd0UTjE8 c=1 sm=1 tr=0 ts=6814271f b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=meVymXHHAAAA:8 a=WsHKUha7AAAA:8 a=z6M46CtpNJjKcxa8ea8A:9
 a=2JgSa4NbpEOStq-L5dxp:22 a=H4LAKuo8djmI0KOkngUh:22 cc=ntf awl=host:14638
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAyMDAxMyBTYWx0ZWRfXxHOd/C5KdrIm oyWCBgOh08tHjG9D6MJEFyUgArydtcn5duXbk+tFFkkTpchvW+1qSU/9qMH9XHvJDL9bu+agsTf WofUtOoW3f2kO1UA2W9ZmY4Rg+C6oo60arNC1fegwA25akj/9a1vjlon0k/3vzLHbc0/6M2oO91
 eAzCg1pJ0A1nmDG6I2i4aoBvftzVyTn7ucf3krYq18zN7XalDh4sjXOdzTiVwp4yiayK+d3Vo52 JlcdtM8FEQKLBAnkteh1FIJhFo2XgothvwXFUHCKYpK4kv8NdAuo1L2DtoHzUTxfbf4L5YYHt40 ELV3CUvzMi79/Lq46TSBcnxzKtjj7PVwpEyHButirakYZcfVWcr8smbZ6fU2dR+cP+k7682Ev2I
 fo2iPuDAMMSEC3tlOGmG8QP5VVM+yKw/Ah3RJtKuT1cx9H+369oOsdwWko0Sqpric9uoWKpB

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
https://lore.kernel.org/all/20250418193410.2010058-1-prakash.sangappa@oracle.com/
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

v3:
- Addressing review comments by Sebastian and Prateek.
  * Rename rseq_sched_delay -> sched_time_delay. Move its place in
    struct task_struct near other bits so it fits in existing word.
  * Use IS_ENABLED(CONFIG_RSEQ) instead of #ifdef to access
    'sched_time_delay'.
  * removed rseq_delay_resched_tick() call from hrtick_clear().
  * Introduced patch to add a tracepoint in exit_to_user_mode_loop().
  * Added comments to describe RSEQ_CS_FLAG_DELAY_RESCHED flag.
  

[1] https://lore.kernel.org/lkml/20231025054219.1acaa3dd@gandalf.local.home/
[2] https://lore.kernel.org/lkml/1395767870-28053-1-git-send-email-khalid.aziz@oracle.com/
[3] https://lore.kernel.org/all/20250131225837.972218232@goodmis.org/
[4] https://lore.kernel.org/all/20241113000126.967713-1-prakash.sangappa@oracle.com/
[5] https://lore.kernel.org/lkml/20231030132949.GA38123@noisy.programming.kicks-ass.net/
[6] https://lore.kernel.org/all/1631147036-13597-1-git-send-email-prakash.sangappa@oracle.com/

Prakash Sangappa (4):
  Sched: Scheduler time slice extension
  Sched: Tunable to specify duration of time slice extension
  Sched: Add scheduler stat for cpu time slice extension
  Sched: Add tracepoint for sched time slice extension

 include/linux/entry-common.h | 11 +++++--
 include/linux/sched.h        | 21 +++++++++++++
 include/trace/events/sched.h | 28 +++++++++++++++++
 include/uapi/linux/rseq.h    |  7 +++++
 kernel/entry/common.c        | 23 +++++++++++---
 kernel/rseq.c                | 60 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          | 35 +++++++++++++++++++++
 kernel/sched/debug.c         |  1 +
 kernel/sched/syscalls.c      |  5 +++
 9 files changed, 183 insertions(+), 8 deletions(-)

-- 
2.43.5

