Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8089C33E1
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 04:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750826967; cv=none; b=EHfRPg2Q1/V/O0uMxUoRb4eMJenNbG7HAV3BB20IJjRrIr/6aGx0miMKZB5ag/oDbmB/u7aKhTx38dhFwnEwtTRg/FRceplYoUHaNCyHTKZ7MF4vnkAr8u8viXpa+IemxAVEbjfAr/H3RubShWD5XbMIMy+qGlyBKNbmm4rPad4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750826967; c=relaxed/simple;
	bh=h3vKZKMJLz6K9ecOFVhipEDXb3xrenVE3PPIaN08ogQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=D64OoTSee1Wr9Qqsgl9YUJacxyC8IDW8SAM/GMKlhuWYkw02yYTAXxSPfcwsOh60k63IuE7FUHFZIXg9mAOYSut5JxP/xt/af7Nf3aMziD80vrHR1fmFEH7XZLw3Il8iThxFfY9FyhHMRPsNRHomGoTFq0IbshEiz5U0hCq5R64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=q9qYmjC0; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="q9qYmjC0"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMif2q019163;
	Wed, 25 Jun 2025 04:48:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2025-04-25; bh=VmFPYnubK/xFPXJJ
	L2xpmltWzNgNE57L7HX+rHvMBoY=; b=q9qYmjC0NCgtx+NQBwunU+LsRhibY7WT
	EBZ2oiIKT2HmObQ/5HUsDz+gSxoXFbsZIi9kpx4cWHE1qUi173jgVipE9Wy/pgVf
	/xGo9g3lgNuT81lP/CVPwivzJn34rBz90EM8JMyLBwGY5646goKudvBrjC3QPyi5
	x7DvTP5+OC5lVK4aJQhBpXq7KKYyANQpyYUPFjg42IXm1/tsnz/+of/8hucEhe+Y
	e1xTm0u0aIwMmQuw5vEqmFVZypIl9kvAfJP26eRXtzL+P9OE0R6zrTbPnrG3yvFY
	D2RwtO8qwUV9ymIeMkgZW1Kr81r9uvUrhkDKEJDra/CLH+6LsWLghA==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxk9d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:48:39 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P2RaJC002351;
	Wed, 25 Jun 2025 04:48:38 GMT
Received: from aruramak-dev.osdevelopmeniad.oraclevcn.com (aruramak-dev.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.253.155])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehpe1p5t-1;
	Wed, 25 Jun 2025 04:48:38 +0000
From: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, bsegall@google.com, mgorman@suse.de,
        vschneid@redhat.com
Subject: [RFC PATCH] sched: Change nr_uninterruptible from unsigned to signed int
Date: Wed, 25 Jun 2025 04:48:36 +0000
Message-ID: <20250625044836.3939605-1-aruna.ramakrishna@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 malwarescore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250034
X-Proofpoint-GUID: cUOi7gHiT3tLZfx-LsVJf-VqMJQMAfUY
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b7fa7 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=pGLkceISAAAA:8 a=yPCof4ZbAAAA:8 a=HWCl2iI5DVSZb1gQ_N8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cUOi7gHiT3tLZfx-LsVJf-VqMJQMAfUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzNCBTYWx0ZWRfX9e7BpL4KA/G2 Vb8p0DD+03sshGndE6BCTccNHRG+74swKImBanbWfUNC5rrMCuF07WOGAiBr+A+0YTVyEXteZg8 icRFxL3yk0+Kb5DcD1TOUl4yMbt9h4CJbS7YFXlhIGoopPqf6cJxYQc6XSM1z69kbFeHoi7UKx1
 R3Y/K/3rLZfmj4V11dIdZ5s4rrCpqCzGqjZu6/n35TH20aq2OWmrTushs7mRpbKBxNlul3MLt3u cFCmfJINBRvtpgzlRFt1GPC4Z4C1wBzSUdhXNqc2AMJE2O40lHjk9LuB5Q65jPmDW3j65LKUMYA m6EohjZcAoeJqvQg+Aw9GxH0UmLzv2xuNVtjeGMcg2j7pnu1Mmb2vuy2Qu25c1IYKWGfHjRqWAD
 L35BkoDWuaVIbGllb9plQvAVQe0ZpHb2Un2xAb8NUDdhV/slg/uDOn2ltDIkWZcNhTcFuSfa

We have encountered a bug where the load average displayed in top is
abnormally high and obviously incorrect. The real values look like this
(this is a production env, not a simulated one):

top - 13:54:24 up 68 days, 14:33,  7 users,  load average:
4294967298.80, 4294967298.55, 4294967298.58
Threads: 5764 total,   5 running, 5759 sleeping,   0 stopped,   0 zombie

From digging a bit into the vmcore:

crash> p calc_load_tasks
calc_load_tasks = $1 = {
  counter = 4294967297
}

which is:

crash> eval 4294967297
hexadecimal: 100000001

It seems like an overflow, since the value exceeds UINT_MAX.

Checking further:

The nr_uninterruptible values for each of the CPU runqueues is large,
and when they are summed up, the sum exceeds UINT_MAX, and the result
is stored in a long, which preserves this overflow.

long calc_load_fold_active(struct rq *this_rq, long adjust)
{
        long nr_active, delta = 0;

        nr_active = this_rq->nr_running - adjust;
        nr_active += (int)this_rq->nr_uninterruptible;
...

From the vmcore:

>>> sum=0
>>> for cpu in for_each_online_cpu(prog):
...     rq = per_cpu(prog["runqueues"], cpu)
...     nr_unint = rq.nr_uninterruptible.value_()
...     sum += nr_unint
...     print(f"CPU {cpu}: nr_uninterruptible = {hex(nr_unint)}")
...     print(f"sum {hex(sum)}")
...
CPU 0: nr_uninterruptible = 0x638dd3
sum 0x638dd3
CPU 1: nr_uninterruptible = 0x129fb26
sum 0x18d88f9
CPU 2: nr_uninterruptible = 0xd8281f
sum 0x265b118
...
CPU 94: nr_uninterruptible = 0xe0a86
sum 0xfff1e855
CPU 95: nr_uninterruptible = 0xe17ab
sum 0x100000000

This is what we see, stored in calc_load_tasks. The correct sum here would be 0.

From kernel/sched/loadavg.c:

 *  - cpu_rq()->nr_uninterruptible isn't accurately tracked per-CPU
because
 *    this would add another cross-CPU cacheline miss and atomic
operation
 *    to the wakeup path. Instead we increment on whatever CPU the task
ran
 *    when it went into uninterruptible state and decrement on whatever
CPU
 *    did the wakeup. This means that only the sum of nr_uninterruptible
over
 *    all CPUs yields the correct result.
 *

It seems that rq->nr_uninterruptible can go to large (positive) values
for one CPU if a lot of tasks were migrated off of that CPU after going
into an uninterruptible state. If they’re woken up on another CPU -
those target CPUs will have negative nr_uninterruptible values. I think
the casting of an unsigned int to signed int and adding to a long is
not preserving the sign, and results in a large positive value rather
than the correct sum of zero.

I suspect the bug surfaced as a side effect of this commit:

commit e6fe3f422be128b7d65de607f6ae67bedc55f0ca
Author: Alexey Dobriyan <adobriyan@gmail.com>
Date:   Thu Apr 22 23:02:28 2021 +0300

    sched: Make multiple runqueue task counters 32-bit

    Make:

            struct dl_rq::dl_nr_migratory
            struct dl_rq::dl_nr_running

            struct rt_rq::rt_nr_boosted
            struct rt_rq::rt_nr_migratory
            struct rt_rq::rt_nr_total

            struct rq::nr_uninterruptible

    32-bit.

    If total number of tasks can't exceed 2**32 (and less due to futex
pid
    limits), then per-runqueue counters can't as well.

    This patchset has been sponsored by REX Prefix Eradication Society.
...

which changed the counter nr_uninterruptible from unsigned long to unsigned
int.

Since nr_uninterruptible can be a positive or negative number, change
the type from unsigned int to signed int.

Another possible solution would be to partially rollback e6fe3f422be1,
and change nr_uninterruptible back to unsigned long.

Signed-off-by: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
---
 kernel/sched/sched.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
index 475bb5998295..f6d21278e64e 100644
--- a/kernel/sched/sched.h
+++ b/kernel/sched/sched.h
@@ -1149,7 +1149,7 @@ struct rq {
 	 * one CPU and if it got migrated afterwards it may decrease
 	 * it on another CPU. Always updated under the runqueue lock:
 	 */
-	unsigned int		nr_uninterruptible;
+	int 			nr_uninterruptible;
 
 	union {
 		struct task_struct __rcu *donor; /* Scheduler context */

base-commit: 86731a2a651e58953fc949573895f2fa6d456841
prerequisite-patch-id: dd6db7012c5094dec89e689ba56fd3551d2b4a40
-- 
2.43.5

