Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3624024C692
	for <linux-kernel@vger.kernel.org>; Tue,  3 Jun 2025 23:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748993841; cv=none; b=quPeIfcVxnj1Scaou+pZRNb1VwOxLg//3KiNAcbM0cVKEvBibjPSn8VpG67LUi79Z8EzuZxW36UXjdbldmqs9Vn3+yda9uOt4kGskE/BkbfXDkhl3nL/a10hq1n4mvg+Vesxg03PRka8GCSrKVD4cMTWFliHPRJhpEapzVBHsWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748993841; c=relaxed/simple;
	bh=Rer9IRliwj4vJQr4tRx4OKdBvoQu9mN2uEzkc1rpBTk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BfLHi1SSx2+/vrLr9b9YKL3nm3fTGw6pEDJmhpobEcVFHDWl03plIhafZwuj+k9Dul+Fc1iUCLXk+t47Wos5rYZvIe+kZASzgqerNJFtDxlOQteef+w2TkCJNDtnqq0xsTZ7kzwt1OHm5ceQjHrgfRb8jatlxeEB31IZ7J2W6ds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=L2r7+aKa; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="L2r7+aKa"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 553MN4if000745;
	Tue, 3 Jun 2025 23:36:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=i9brL2bjCjZjmvmdY2+HdOKNHT43L
	+4A3A6ZBE6H9/k=; b=L2r7+aKaC0q9H2Q45k8i+w+rVkY2n3I9/BUvTxP3eTF4Z
	LPsOq3TXez639piRc730VoLdUnuoIc+DYHNW2PUfu98XA1bRyQHWmDdqTbcBuFqc
	1ftzlBewNSoyPXno6KyyyrZX8PsezNijI38Mu3ccOvdYwsSDBAdJoevZMHhZkqcQ
	0MP9/Tah0Q5EnJMr/WWBAjL+See5jNy50ICwsVOFYHFsrmUUOG2lYgxnlI2lsEPG
	DHPaOvSeSfwXrGcHnqnkBrs258JPaktyWY8mZWPbw1S+XdrVPLhG0P7pYG6ODQdo
	Z9D14lOoTlz8qmG7nisL505X5AMt557ZHn3dPzfJQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 471g8dty36-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 03 Jun 2025 23:36:56 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 553MtHqs030803;
	Tue, 3 Jun 2025 23:36:56 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46yr7a2j93-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 03 Jun 2025 23:36:55 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com,
        vineethr@linux.ibm.com
Subject: [PATCH V5 0/6] Scheduler time slice extension
Date: Tue,  3 Jun 2025 23:36:48 +0000
Message-ID: <20250603233654.1838967-1-prakash.sangappa@oracle.com>
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
 definitions=2025-06-03_03,2025-06-03_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 phishscore=0 adultscore=0 spamscore=0 mlxlogscore=999
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506030202
X-Authority-Analysis: v=2.4 cv=Va/3PEp9 c=1 sm=1 tr=0 ts=683f8718 b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=meVymXHHAAAA:8 a=WsHKUha7AAAA:8 a=u0UryAdx4vDl0paApXEA:9
 a=2JgSa4NbpEOStq-L5dxp:22 a=H4LAKuo8djmI0KOkngUh:22 cc=ntf awl=host:14714
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjAzMDIwMiBTYWx0ZWRfX4H+Akm/H/xgD oIj1SdZCrtpfZ/8m2rQ+IG5ZlUUQLH6NyrrsnYyKaYGPs71gYxd16fuUP8bSCkVFQvnT77Y1Fuk gvIYvfRDL+/JSVxppSulwZPE+xuJAILurq2BEz5+gozwwtNikqCu2CORuZr5Ox1YI7IW2JMeoVT
 twSnOrd8GXw8iMYvEyGahW5WkBk75glgwjjODeGQdSid+Z7vQHonVvmiPohZVDSDUDhar9iUgWT qEtF5ECRsqrUEklaejz8tF5CXQWv1snvX1EeQnTguNwCL1bebOBM1PgIZtNSJ7KYRyVaswWBXwJ tribeFqE+q2uZlesm5VCU5jE2NHRx6/+ZrrxVcf4Bih6ErME/6/X2zHBdenorbeUAa1kequRF21
 Qj/0aCiTbaMlzmyZ2145AIC8ErfI7dHYxjqjVHvFHPSc7+qNBhL6ds8+MUfc+1yEPlkdIRMB
X-Proofpoint-ORIG-GUID: mYBJSDmCux_aK_RFVNQsNwULKRhsKgCh
X-Proofpoint-GUID: mYBJSDmCux_aK_RFVNQsNwULKRhsKgCh

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

v5:
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

Prakash Sangappa (6):
  Sched: Scheduler time slice extension
  Sched: Indicate if thread got rescheduled
  Sched: Tunable to specify duration of time slice extension
  Sched: Add scheduler stat for cpu time slice extension
  Sched: Add tracepoint for sched time slice extension
  Add API to query supported rseq cs flags

 include/linux/entry-common.h | 11 +++--
 include/linux/sched.h        | 30 +++++++++++
 include/trace/events/sched.h | 28 +++++++++++
 include/uapi/linux/rseq.h    | 19 +++++++
 kernel/entry/common.c        | 27 ++++++++--
 kernel/rseq.c                | 96 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          | 60 ++++++++++++++++++++++
 kernel/sched/debug.c         |  4 ++
 kernel/sched/syscalls.c      |  5 ++
 9 files changed, 272 insertions(+), 8 deletions(-)

-- 
2.43.5

