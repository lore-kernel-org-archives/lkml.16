Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ADA728E5EC
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 11:53:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747050827; cv=none; b=mj0ISp3zmLAs8D7g7b3lcN670awm0Xlh7q8bkeJqbDpVg1LDGcd4MTGKj/jmy6BC+1ataArXXi8kBFQSYcNy7iDe2XY8PndLHq3Zg0P39Ore6uLKtcvhbaX6bqHBbkrKoXQ6G2J90cbibFrZkfN4btNzcS7WFwXACigzT6QhVxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747050827; c=relaxed/simple;
	bh=fERv0qxRGHTLMsyf66AHOVfHnTHJnU+2cOjgdsoHdBE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TXWVynhkIzo6LigZulEz73AzYzhfPC0VFXrd6PkWTIzkv/h3kLuXJkSpT1UL9PORZ4LyZYuBjp5x3kHuiL1bzL+XncgtgXh8/6QgAEwHf1KsbleQyTZCbDgCcfd6+++bfeZ6e8PVOWu57Z+Ml9j0Ie6nGAyjr2xPl0t5iQ2p210=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Wr7hXvkV; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Wr7hXvkV"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54C9ZGfb017744;
	Mon, 12 May 2025 11:53:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=xoiAncQNw9nuyx5N/O5nXjUA5OuhVg/KOSVXkOWMO
	ZM=; b=Wr7hXvkVW9vbKOJ3cmNcKOWf2ZNW7KdAjUiZgsZZ9aWKfvuWNmyrnGm/b
	wfv7S94MJy68RQV7RR+ulecJA3AdZ9lqEis71MXrWUNAD0wD3ly5XdISuzmo15nN
	i4KXrMRnNLyjA2UMV3cwA4qbEzvYZLFx6+ohBoU1hmmwgnDA5oQDFjtTZ7ZYBkAS
	8qIb9SWuIne1bCv4LolcS/hDz+9uaE8PxVHlQ6+33mm4CW8JDlrIUFfF8fFyg9b5
	nOvO4DALk1tAF16uFH9iovc3mcgRFV2onUru6+WocEkXmL80p3zQzQleAzK323db
	e7+ZFXg8ZC6DdAkS0rnZ60UzoLTtA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46k1k6k1j9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:32 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54CBgV24018297;
	Mon, 12 May 2025 11:53:31 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46k1k6k1j7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:31 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54CAGcYL024470;
	Mon, 12 May 2025 11:53:30 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jjmkwnpt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 12 May 2025 11:53:30 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54CBrQqX21627414
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 12 May 2025 11:53:26 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C02CD200E6;
	Mon, 12 May 2025 11:53:26 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0532E200E1;
	Mon, 12 May 2025 11:53:26 +0000 (GMT)
Received: from IBM-PW0CRK36.ibm.com (unknown [9.111.90.223])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 12 May 2025 11:53:25 +0000 (GMT)
From: Tobias Huschle <huschle@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com, sshegde@linux.ibm.com
Subject: [RFC PATCH v3 0/4] sched/fair: introduce new scheduler group type group_parked
Date: Mon, 12 May 2025 13:53:21 +0200
Message-Id: <20250512115325.30022-1-huschle@linux.ibm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=dNSmmPZb c=1 sm=1 tr=0 ts=6821e13c cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=j3NHNQmsH8o8r10dKhYA:9
X-Proofpoint-GUID: h0catcOXRi6NpclZ4GEwyCSv0rG-aZNF
X-Proofpoint-ORIG-GUID: StPOIwViPTKGQpqg7DZBuGIfb91PpHBB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEyMDExNiBTYWx0ZWRfX133LJ3w3X74C +I5uDiGMohUv0ZIuzMOpkzrQXwXQih8Ly6OLZA2jb9jAPk8KdFghdfy1szFj6xom2frP3go5uo7 VSiJk117qDzZS3PnL0OQFge3+UaJKqEXzan9vhJY+GkEFzYgm7otHNopKS6mp0pfO4Wi3cA8GiZ
 GUUEdZJTzcp+e/YegJ40m8stWfY0OSumd3sJH0o9Nb9D5F1VpuwfDl/M8BVigJaGH1IwKouNm82 vNzUkE6FD8DmnZR1lgYjTdYnOB+slAO8uKeXMwXtlH62FV35ysQDiWJGgvNnB2QTDWyl0y4zzxN vRFd9rXzGcLHr78b7zFlwbmd/IGfQcdIFonDrs//fkIn0WFqDa4kQH+Mbze5OIAd5HN9J3LxIzJ
 gs/xa4RtgH9f2Tv2c4H/F17nplHyadpV27DxjdL6KPF+D+s6rmd8Rxro2C/klEikrCDSpF/p
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_04,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 adultscore=0 phishscore=0 clxscore=1011 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505120116

Introduces parked_cpu concept. When a CPU is marked as parked, 
it is expected that nothing meaningful runs on it. To achieve 
this use a new group type called group_parked in the load 
balance path.

See cover letter of v2 for extensive description.

Adding an usecase and performance metrics:

The core goal is to allow Linux systems running as guests under a
hypervisor to run more efficiently. Virtualization usually implies
that the total amount of virtual CPUs creates an overcommitment on
the actually existing physical CPUs on the host.

==== Scenario and workload ==========================================

Therefore, the following scenario is used:
- KVM host with 10 cores, SMT 2, yielding 20 CPUs
- 8 KVM guests with 6 vCPUs each, no SMT, yielding 48 vCPUs in total

The following workload is used:
The guests communicate pair-wise with one another via distinct Linux
bridges, so we get 4 bridges, with 2 guests connected respectively.
Each pair runs an uperf benchmark with one guest sending 200 bytes to
the other guest and receiving 30000 bytes on return. This is done
by 50 parallel workers per pair. All running simulatinously for 400s.

==== Comparison 1 ===================================================

1. no guest vCPUs are parked
   This implies that 48 vCPUs are used, overcommiting the 20 actually
   available host CPUs.
2. guest vCPUs 2-5 are parked, means only 0-1 are used
   In this case, only 16 vCPUs are explicitly used, leaving 4 host
   CPUs available for virtualization overhead

Results:
Setup 2 provides a throughput improvement of ~24%.

==== Comparison 2 ===================================================

In addition to the uperf workload, each guest now runs 2 stress-ng
workers: stress-ng --cpu 2 --cpu-load 99 --cpu-method matrixprod
These 2 stress-ng workers are meant to consume the full CPU
entitlement of each guest.

Results:
Setup 2 provides a throughput improvement of ~50%. 

As an additional metric, the bogo/ops reported by stress-ng can be
noted where setup 1 outperforms setup 2 by 23%, which is expected, 
as stress-ng will pick up all available computation power left 
untouched by uperf. So, a better performing uperf consumes more
CPU runtime, taking it away from stress-ng.

This yields a trade-off between improving interrupt/lock-using
workload like uperf and penalizing purely CPU focussed workload
like stress-ng. With a 50% improvement on the uperf side, but only
23% regression on the stress-ng side, it is probably possible to
find a sweet spot.

==== Notes ==========================================================

This is of course only an initial sniff test. Additional
configurations will need to be tested, but the initial runs look
promising, in the sense that it is possible to find performance 
improvements by passing information about the availability of CPU 
resources in the host. 
In the presented runs, all values where set statically and not
dynamically modified.

The number of usable CPU resources should be seen as a part of the
topology that the system is perceiving from the underlying layer.
The host running on that underlying layer has to determine, that 
certain CPUs are currently not usable for the guest. 
The guest would receive this information through architecture
specific means, as it should perceive, that it is interacting with
actual hardware rathen than being virtualized.

In the case where the host observes that all of its resources are
consumed by the guests, it can pass the necessary information such
that the guests can start parking CPUs. If the host observes, that
the overall pressure on the resources is relieved, it can instruct
the guests that it is safe to unpark CPUs again.

==== Open questions =================================================

There are a couple of issues and corner cases which need further
considerations:
- dl:         Deadline scheduling is not covered yet. There is
              probably only little overlap in systems that would make
              use of parked CPUs and systems running deadline 
              scheduling.
- ext:        Probably affected as well. Needs some conceptional
              thoughts first.
- raciness:   Right now, there are no synchronization efforts. It needs
              to be considered whether those might be necessary or if
              it is alright that the parked-state of a CPU might change
              during load-balancing.
- taskset:    If a task is pinned to CPUs that are all parked, the 
              pinning is discarded (similar to CPU hotplug). Thoughts
              need to be spent on how to properly notify the user.
- reporting:  Tools like lsdasd and debugfs should represent the parked 
              state of CPUs.
- interrupts: Interrupts should be disabled on parked CPUs as well,
              most likely responsibility of an implementing arch.

=====================================================================

Changes to v2
- provide usecase and performance measurements
- add support for realtime scheduler
  The adjustments work fine for all kinds of real time threads.
  Only those which are running at 100% CPU utilization are never
  interrupted and therefore never rescheduled. This is an
  limitation for now although scenarios that would profit from
  having parked CPUs would probably not run such uninterrupted
  real time processes anyway.
- use h_nr_queued instead of nr_running
- remove unnecessary arch_cpu_parked check
- do not touch idle load balancer, it seems to be unnecessary to 
  explicitly run it, the idea could be reconsidered later

Patches apply to tip:sched/core

The s390 patch serves as a simplified implementation example.
Tobias Huschle (4):
  sched/fair: introduce new scheduler group type group_parked
  sched/rt: add support for parked CPUs
  sched/fair: adapt scheduler group weight and capacity for parked CPUs
  s390/topology: Add initial implementation for selection of parked CPUs

 arch/s390/include/asm/smp.h    |  2 +
 arch/s390/kernel/smp.c         |  5 ++
 include/linux/sched/topology.h | 19 +++++++
 kernel/sched/core.c            | 13 ++++-
 kernel/sched/fair.c            | 95 +++++++++++++++++++++++++++++-----
 kernel/sched/rt.c              | 25 +++++++--
 kernel/sched/syscalls.c        |  3 ++
 7 files changed, 142 insertions(+), 20 deletions(-)

-- 
2.34.1

