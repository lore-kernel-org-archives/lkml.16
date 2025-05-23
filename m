Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D11F09B0
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:15:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024128; cv=none; b=Ijo/S5qD0uiJQUjy2ZTh2nayjxxVIqmt4RIK0eAb/htaS0dbhNa5Y/udn7ydad0s7Y/N027ePF9N03/NpwF6CJTKNVbTj0CVyjHZETV2TeJP4ylOz85jgHsayKCGoG2a0A8W/yvXgxUX+mZsu0C6ZPglc52rzA8qzMvvEdQS/aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024128; c=relaxed/simple;
	bh=bA2tb/gbZ9vLACnUTycgkzrONOltJo19V5hokCYEZ8g=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fmVe4VZI0uJlcP+smyxR4nGtqG/1takWWpGf61dJfApirWd7JkVf1kZROmAQWIXELrLIGmLhcxyxvbnZKSqGZyK7LAJ+xB8CIBLUFOKU+vIkEb+Zwsq+ZljZd73p13ES7HPRoLkjge+IZHXYDD7Vw3HnWE5P/4MF8YZEa9jpnLM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=CGvqDVyK; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="CGvqDVyK"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGWOg0012767;
	Fri, 23 May 2025 18:15:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=igrKVMqQJrNQRjV8gK5zL6GuwWW3i1MiJkBhqPKo8
	yI=; b=CGvqDVyKzYcLoo+ARKCZed4iI/wSVaa64Upd7m/h3aN/1AX3HsBL+Xwq+
	K2y1C3qENhS9BiG+KUR+MrxP7SyVk8BXwvscQqUX0ZC4bCqz3PkSzsJ0Y1C/lyN/
	uJs67uJQ7lSZN9eNkAV3F3ANC5h2slCA+aPktv8lfQg3yE0isZgM1X1WgO34k+yT
	DSIqSeca+BJ2OL/fe+5FMtlseE3Fqij4nL/CgZZWid1R2h4WbYiT9UQs/ImpwErR
	nWJU6iL+hESJn7qSfQ8kmTKOqiyqRfr1m+nUL7uWq9Y07BZSfZ24lmCrErXzqxS3
	nz2Mhgng8vOLtkBLdidRjBl2X3Usw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t14jrhcy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:03 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54NIF3Vv001828;
	Fri, 23 May 2025 18:15:03 GMT
Received: from ppma11.dal12v.mail.ibm.com (db.9e.1632.ip4.static.sl-reverse.com [50.22.158.219])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46t14jrhcv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:03 +0000 (GMT)
Received: from pps.filterd (ppma11.dal12v.mail.ibm.com [127.0.0.1])
	by ppma11.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NI1cKT032084;
	Fri, 23 May 2025 18:15:02 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma11.dal12v.mail.ibm.com (PPS) with ESMTPS id 46rwnmquru-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:02 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NIEwq149086858
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 18:14:58 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 77BF920040;
	Fri, 23 May 2025 18:14:58 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id A753B20043;
	Fri, 23 May 2025 18:14:54 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.221.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 18:14:54 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, jstultz@google.com, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: [RFC PATCH 0/5] sched: cpu parked and push current task mechanism
Date: Fri, 23 May 2025 23:44:43 +0530
Message-ID: <20250523181448.3777233-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: bwqalqVwbZNakS9AEH9qbVNcbXidcckh
X-Authority-Analysis: v=2.4 cv=XOkwSRhE c=1 sm=1 tr=0 ts=6830bb27 cx=c_pps a=aDMHemPKRhS1OARIsFnwRA==:117 a=aDMHemPKRhS1OARIsFnwRA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=VnNF1IyMAAAA:8 a=KKAkSRfTAAAA:8 a=zd2uoN0lAAAA:8 a=qTwRuvxXuo9f76COlL0A:9
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2NCBTYWx0ZWRfXyJaJ6x44QuVC 5t3Te+huHHYwXrf5ebuVeouwElMPvCs6k3CBfiIxp0WSVXSFSnW4Z6K5FX3VR28BT0/RxxjTjs2 bYcWsHFQj1aSmORhuTg7LE7e+D69ohPRf4EoI2MWmQUboj9yH6L2ZdshCsmoIbqHHSFjGXNG4GE
 pr5Behm6QKOD7vRMRW6C5g3axYBOhaBHyadLntHiKcq80i/YfpJtlW09gpdAoWMUFGp1Rhu+mtZ CcLogh7k+W0K0pC6W6AWEwwXKjwRxtMUV1yx6jmMRlmwnho19qDx2/uX/c2zXbOaytzCoh6R9TE jM5XCrJj7DVDdE7iVXm4VoTIqZ2XC0+aTVcTGNXDByOEzx7NTfuH1/47pycLsyLsfHRm3cBVfog
 fs/AiDbf6z+7cSbP6DlvFyo2ielSVXarsy2cbzk7h8kTqI/DjIX/hc8OMoh1gm2HJk3uDdAl
X-Proofpoint-GUID: xkbT5iK_f8J4QzVUjGaOpD3Jn1LdpyTE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011 malwarescore=0
 mlxlogscore=927 bulkscore=0 mlxscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 spamscore=0 phishscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230164

In a para-virtualised environment, there could be multiple
overcommitted VMs. i.e sum of virtual CPUs(vCPU) > physical CPU(pCPU). 
When all such VMs request for cpu cycles at the same, it is not possible
to serve all of them. This leads to VM level preemptions and hence the
steal time. 

Bring the notion of CPU parked state which implies underlying pCPU may
not be available for use at this time. This means it is better to avoid
this vCPU. So when a CPU is marked as parked, one should vacate it as
soon as it can. So it is going to dynamic at runtime and can change
often.

In general, task level preemption(driven by VM) is less expensive than VM
level preemption(driven by hypervisor). So pack to less CPUs helps to
improve the overall workload throughput/latency. 

Architecture needs to decide which CPUs are parked. Currently we are
exploring getting the hint from the stolen time and hypervisor provided 
statistics. There is simple powerpc debug patch which shows how one can
make use of it cpu parked feature. 

cpu parking and need for cpu parking has been explained here as well [1]. Much
of the context explained in the cover letter there applies to this
problem context as well. 
[1]: https://lore.kernel.org/all/20250512115325.30022-1-huschle@linux.ibm.com/

While trying the above method, on large system (480 vCPUS) it was taking 
around 8-10 seconds for workload to move. Which is a longer time, 
so this approach, where workload moves within 1-2 seconds

Pros: 
- Once tasks move, no load balancer overheads 
- Less need for stats. minimal load balancer changes. 
- Faster. Since it is based on sched_tick
- system maintains a state of parked cpus. Other subsystems may find it
  useful. 

Cons:
- stop machine based to move the current task. So couldn't move it
  before it gets scheduled.  
- Depends on CONFIG_HOTPLUG_CPU since it is relying on __balance_push_cpu_stop
  (might not be a big concern)

Sending this out to get feedback on the idea. This mechanism
seems lightweight and fast. There are other push task related patches
sent for EAS[2], and newidle balance[3]. Maybe it is time to come up push task
framework that each one can make use of. Need to dig more into it[4]. 
Need to address RT, DL, IRQ, taskset concerns still. There maybe
subtle races too(no warn/bugs on console while testing cfs tasks) 

[2]: https://lore.kernel.org/all/20250302210539.1563190-1-vincent.guittot@linaro.org/
[3]: https://lore.kernel.org/lkml/20250409111539.23791-1-kprateek.nayak@amd.com/
[4]: https://lore.kernel.org/all/xhsmh1putoxbz.mognet@vschneid-thinkpadt14sgen2i.remote.csb/

Based on tip/master  at fa95dea97bd1 (Merge branch into tip/master: 'perf/core')

Shrikanth Hegde (5):
  cpumask: Introduce cpu parked mask
  sched/core: Don't use parked cpu for selection
  sched/fair: Don't use parked cpu for load balancing
  sched/core: Push current task when cpu is parked
  powerpc: Use manual hint for cpu parking

 arch/powerpc/kernel/smp.c | 45 +++++++++++++++++++++++++++++++++++++++
 include/linux/cpumask.h   | 14 ++++++++++++
 kernel/cpu.c              |  3 +++
 kernel/sched/core.c       | 43 +++++++++++++++++++++++++++++++++++--
 kernel/sched/fair.c       |  1 +
 kernel/sched/sched.h      |  1 +
 6 files changed, 105 insertions(+), 2 deletions(-)

-- 
2.39.3

