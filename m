Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 636D31B0409
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 21:46:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747172794; cv=none; b=SpwpxIvpqJbuRN9++ED2K9La4ak16WFdvWNDrMVEAOzMcJIuOJrHI0MS7GrCaZNpgbEhLr6hUSdPZrDdg+pQGNz5G0jroiHgLTFilKTcNFn2R8INOJC3YkvID4DHeGnoseK5lffSoo0uC2wjCjWQQurm1heBw+lD1hZVeD4U6nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747172794; c=relaxed/simple;
	bh=K5q1xiyyJFaUIIB22v7MZcnXSC5lI0HSlx05DM4jBIw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qzDBBTzVSULfPcAEjudqg6ixg8onbSC9uil6GPZj32+fFxavIOu8OiauJr/shCOD6MfrTehygi3SjoRHTB6OzkZFcvtgfbmyDq8Xe0ZkVGwbrQsu4XuJghIq4PzUht0Vu2BudZ24YFNUTU5L7lWd4x77zOmUSr0B/FZv8lh6R7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MmTXZFQK; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MmTXZFQK"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DL0msY016339;
	Tue, 13 May 2025 21:45:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=yGTd8P+6zeWiDGO4DPhFVhjhH5GWs
	rCfAIPoHe++chc=; b=MmTXZFQKvSsypOcxBOBzItzLWOlwZze6Np0lKGUT8vpB1
	OgxYTl1QLVVTMgeVdRyiG386hjHbS10+rT+aBohGGaveXjBZ7ijrb5jqqAnt28ng
	2438Rxm02jmPW2hN+Gr0LBFWfeXKxh7HbPsB6Dsc71Cp3BTc+AcaLpFOgSJ21rgM
	Hr03esVSl/cATZwgzorW0oUm3Ua+73oUuex67PIAcPAU8amVGqjbvpGnCLuaHvF0
	V37nS03IkWweyJl3DcPzCe6IBpX6eH4K0TID6VXtgCuvzcMQEOErRnZhNJCDYLqm
	oSid8C9HYqlTiru0xrhtvC2xkpeKLEp08is7gRs9w==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46mbcgrb7e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 21:45:58 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54DLQjeL001890;
	Tue, 13 May 2025 21:45:57 GMT
Received: from psang-work.osdevelopmeniad.oraclevcn.com (psang-work.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.35])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 46mc4yv943-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 13 May 2025 21:45:57 +0000
From: Prakash Sangappa <prakash.sangappa@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, rostedt@goodmis.org, mathieu.desnoyers@efficios.com,
        tglx@linutronix.de, bigeasy@linutronix.de, kprateek.nayak@amd.com
Subject: [PATCH V4 0/6] Scheduler time slice extension
Date: Tue, 13 May 2025 21:45:48 +0000
Message-ID: <20250513214554.4160454-1-prakash.sangappa@oracle.com>
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
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505070000
 definitions=main-2505130206
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDIwNSBTYWx0ZWRfXzA6SGylAdFV5 No1zyeF+0b6/5i+f0e6h1MvIkQ+prh3rSbHFOGYv/klbyDFv1tNzyFBZhegkEoHW45hT5kZ391/ hHGzvqaBbpxvsAHPOzw7sO4TaaEBgenYHLb8S4vbwyxQiNELVvEVP3Z7YCjaqBpnroLpyIb1EQw
 ArYUYAYjtovCnetz0uvTPqqlGWkSWJZHxgeNRUEXBcC0AmYhFanQjQODP2xr/d65n70o3pfIe0r 5GCoNmcCfl+H1TMsU3W62bJtgOeiFREypFxl4bgq9L0JeS3CZaF7UZTKxDkYkd6loOx1AD/LBdV mLWkv4Y+a91KoUh/GI0xopwDYOV8EmVvyCEAuV0KdU5ysfAJJiLS60lSMMaZVZe0M7RgxEhZ0qr
 vHqULsW//0BN95qE1y9IAQ35tP28NgX5o9Gz4lJwVpTJdpIaK15kzElB4vuyT+UOtxH4wpjF
X-Proofpoint-GUID: ZNJLTshkXCPIku9nekxBjnE1VfxnCxB_
X-Authority-Analysis: v=2.4 cv=fvDcZE4f c=1 sm=1 tr=0 ts=6823bd96 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=yPCof4ZbAAAA:8 a=YaUg6xj48qkMv4yems8A:9
X-Proofpoint-ORIG-GUID: ZNJLTshkXCPIku9nekxBjnE1VfxnCxB_

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

v1: 
https://lore.kernel.org/all/20250215005414.224409-1-prakash.sangappa@oracle.com/

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

v4:
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

Prakash Sangappa (6):
  Sched: Scheduler time slice extension
  Sched: Indicate if thread got rescheduled
  Sched: Tunable to specify duration of time slice extension
  Sched: Add scheduler stat for cpu time slice extension
  Sched: Add tracepoint for sched time slice extension
  Add API to query supported rseq cs flags

 include/linux/entry-common.h | 11 ++--
 include/linux/sched.h        | 23 +++++++++
 include/trace/events/sched.h | 28 +++++++++++
 include/uapi/linux/rseq.h    | 19 +++++++
 kernel/entry/common.c        | 27 ++++++++--
 kernel/rseq.c                | 97 ++++++++++++++++++++++++++++++++++++
 kernel/sched/core.c          | 50 +++++++++++++++++++
 kernel/sched/debug.c         |  1 +
 kernel/sched/syscalls.c      |  5 ++
 9 files changed, 253 insertions(+), 8 deletions(-)

-- 
2.43.5

