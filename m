Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C73B347D5
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 00:38:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751330320; cv=none; b=q/9CC1oi9Zh06zBg2TX5dxKtwrGhrtyk8CLXBpEccYkW4CfjFptn0B59mI0Qm4C1ieG8KrVvntDSxPUol64coYFG/h+ByfcmpYZCpMMIj3ueRjcTucYC/pMpwdx5OMok4bfwS43fcA+AY9JbiVYYJrmlq8eMwavUcdLCGkb0aEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751330320; c=relaxed/simple;
	bh=grPoVhcVjgXAdfyTzOSuGuPLDbihdFmyTOqngJb0lfI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=thSIWxWPHip+3rKZMxaGpSxr4xECjsZ4iVw0TfJCDw+IjPL/cHPpQKoqRCgpXK+r56oc4LL+/QkXoS5LR0d7ojYADXfBryzDe0BOeaHUyxWgEv2udF8wikx/wIBivCxjScfHG5pY0HR9nHSjvUjRfJm6RSgxR7mknIY/lmJqVsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=VT2EnxXK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="VT2EnxXK"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55UIDFsD021841;
	Tue, 1 Jul 2025 00:38:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=6CUlblji+WYNUdtaIPYrNR1yv8Q5Y
	hnar2VuVSS1+vY=; b=VT2EnxXKzzJKVpbut2uwH+7URD9W44vRTSP25Y+PcTbSP
	pMphrcJr4oKZ1z9geYADBu6EKK+JJBUaHj+4opM0ZogdqlSgDxSNBdBpgVf9JaPM
	2JbpjrPMMS9KqU8HQKyRsAbH5q0znYLybjQd116qO/Sh/bGN50Avw74w7AdJmNBu
	Q0mPXCtQsT/tKP/IvXmhXhjbG8K/XWcLoIyWcj65ecuosnQErgkW5fS7EnfuFl97
	i92T5u2G7p8ix0tys0Z1w+ub+JKrkSldoy8ou/T1FFHPbsJ1L1xl1pgts3aXIgbb
	/0BPuEgJZr9Gb1zSvluNIwsXj03CPmvgP8lFPzrQQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j8ef3mmx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Jul 2025 00:38:07 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55UNDxNW009139;
	Tue, 1 Jul 2025 00:38:06 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u92pxj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 01 Jul 2025 00:38:06 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V6 0/7] Scheduler time slice extension
Date: Tue,  1 Jul 2025 00:37:42 +0000
Message-ID: <20250701003749.50525-1-prakash.sangappa@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_06,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 spamscore=0 suspectscore=0
 phishscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2507010002
X-Proofpoint-GUID: BYz8UO5MB1IKuQzt-sO3YqI_Ul-z4P8g
X-Proofpoint-ORIG-GUID: BYz8UO5MB1IKuQzt-sO3YqI_Ul-z4P8g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDAwMiBTYWx0ZWRfX74eWu30JBCX+ bcRde9WqeN7SxuhTpjzNbNdFElQ35QYHF5bHeApHODW3H53gDpZ2nizwSgdqOZAEfV/wY2MlAVk fv0UAeGhXf6kT1gcfSVoatR1u83cZNkw+g6DKa2IN0LR8nw+GPFq48BQxMXw9pVGEfmrTnKGjoh
 2iEm7788m65WnE9yJrFunzLNMDBwUbwSDct1rmhojSzt3b36fUlywTlsEyAY/VEYEsbrjX/vC4i 4FgvaCPfa8ASzLhXpCzJch1q6cbBLGFM6GeEdjvOq8GDK+o0+7oCGojBiSDlCZf87re8H5akAmz lemGl2F6yadlbQRjkFndya72ggx9tD2CNrnKrwFkV/5TDr3OAYq1zX2ACQUnXWs0dmd4jvgbOWQ
 GuUulEObGickDz6PQa+ykkYk54oBJuWt94FTHcz6N+E+KA5O26PqHpxQeYf2vHqsYfZLZ/EN
X-Authority-Analysis: v=2.4 cv=ONgn3TaB c=1 sm=1 tr=0 ts=68632def b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=Wb1JkmetP80A:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=meVymXHHAAAA:8 a=WsHKUha7AAAA:8 a=uOP8cWrhlu98mIGoFDMA:9
 a=2JgSa4NbpEOStq-L5dxp:22 a=H4LAKuo8djmI0KOkngUh:22 cc=ntf awl=host:14723

Rebased to v6.16-rc3.

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
prototype solution[5], which grants 50us execution time extension only.
This is achieved with the help of a timer started on that cpu at the time of
granting extra execution time. When the timer fires the thread will be
preempted, if still running. 

This patchset implements above solution as suggested, with use of restartable
sequences(rseq) structure for API. Refer [3][4] for further discussions.

v6:
- Rebased onto v6.16-rc3. 
  syscall_exit_to_user_mode_prepare() & __syscall_exit_to_user_mode_work()
  routines have been deleted. Moved changes to the consolidated routine
  syscall_exit_to_user_mode_work()(patch 1).
- Introduced a new config option for scheduler time slice extension
  CONFIG_SCHED_PREEMPT_DELAY which is dependent on CONFIG_RSEQ.
  Enabled by default(new patch 7). Is this reasonable?
- Modified tracepoint to a conditional tracepoint(patch 5), as suggested
  by Steven Rostedt.
- Added kernel parameters documentation for the tunable
  'sysctl_sched_preempt_delay_us'(patch 3)

v5:
https://lore.kernel.org/all/20250603233654.1838967-1-prakash.sangappa@oracle.com/
- Added #ifdef CONFIG_RSEQ and CONFIG_PROC_SYSCTL for sysctl tunable
  changes(patch 3).
- Added #ifdef CONFIG_RSEQ for schedular stat changes(patch 4).
- Removed deprecated flags from the supported flags returned, as
  pointed out by Mathieu Desnoyers(patch 6).
- Added IF_ENABLED(CONFIG_SCHED_HRTICK) check before returning supported
  delay resched flags.

v4:
https://lore.kernel.org/all/20250513214554.4160454-1-prakash.sangappa@oracle.com
- Changed default sched delay extension time to 30us
- Added patch to indicate to userspace if the thread got preempted in
  the extended cpu time granted. Uses another bit in rseq cs flags for it.
  This should help the application to check and avoid having to call a
  system call to yield cpu, especially sched_yield() as pointed out
  by Steven Rostedt.
- Moved tracepoint call towards end of exit_to_user_mode_loop().
- Added a pr_warn() message when the 'sched_preempt_delay_us' tunable is
  set higher then the default value of 30us.
- Patch to add an API to query if sched time extension feature is supported. 
  A new flag to sys_rseq flags argument called 'RSEQ_FLAG_QUERY_CS_FLAGS',
  is added, as suggested by Mathieu Desnoyers. 
  Returns bitmask of all the supported rseq cs flags, in rseq->flags field.

v3:
https://lore.kernel.org/all/20250502015955.3146733-1-prakash.sangappa@oracle.com
- Addressing review comments by Sebastian and Prateek.
  * Rename rseq_sched_delay -> sched_time_delay. Move its place in
    struct task_struct near other bits so it fits in existing word.
  * Use IS_ENABLED(CONFIG_RSEQ) instead of #ifdef to access
    'sched_time_delay'.
  * removed rseq_delay_resched_tick() call from hrtick_clear().
  * Introduced a patch to add a tracepoint in exit_to_user_mode_loop(),
    suggested by Sebastian.
  * Added comments to describe RSEQ_CS_FLAG_DELAY_RESCHED flag.

v2:
https://lore.kernel.org/all/20250418193410.2010058-1-prakash.sangappa@oracle.com/
- Based on discussions in [3], expecting user application to call sched_yield()
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

v1: 
https://lore.kernel.org/all/20250215005414.224409-1-prakash.sangappa@oracle.com/


[1] https://lore.kernel.org/lkml/20231025054219.1acaa3dd@gandalf.local.home/
[2] https://lore.kernel.org/lkml/1395767870-28053-1-git-send-email-khalid.aziz@oracle.com/
[3] https://lore.kernel.org/all/20250131225837.972218232@goodmis.org/
[4] https://lore.kernel.org/all/20241113000126.967713-1-prakash.sangappa@oracle.com/
[5] https://lore.kernel.org/lkml/20231030132949.GA38123@noisy.programming.kicks-ass.net/
[6] https://lore.kernel.org/all/1631147036-13597-1-git-send-email-prakash.sangappa@oracle.com/


Prakash Sangappa (7):
  Sched: Scheduler time slice extension
  Sched: Indicate if thread got rescheduled
  Sched: Tunable to specify duration of time slice extension
  Sched: Add scheduler stat for cpu time slice extension
  Sched: Add tracepoint for sched time slice extension
  Add API to query supported rseq cs flags
  Introduce a config option for scheduler time slice extension feature

 .../admin-guide/kernel-parameters.txt         |  8 ++
 include/linux/entry-common.h                  | 17 +++-
 include/linux/sched.h                         | 30 ++++++
 include/trace/events/sched.h                  | 31 ++++++
 include/uapi/linux/rseq.h                     | 19 ++++
 init/Kconfig                                  |  7 ++
 kernel/entry/common.c                         | 19 +++-
 kernel/rseq.c                                 | 97 +++++++++++++++++++
 kernel/sched/core.c                           | 60 ++++++++++++
 kernel/sched/debug.c                          |  4 +
 kernel/sched/syscalls.c                       |  6 ++
 11 files changed, 290 insertions(+), 8 deletions(-)

-- 
2.43.5

