Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FF323595C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 20:52:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750798348; cv=none; b=gfUe8em4C2X2TjVfZmG+Era+Kxwp0lyxjRf2tOS3LSbzCX/zdWj1PwThNS/oN6Qzto958iXh9vSQ1RLaKffMo3jplIlM1ZWyl2pEgyArMgg1Jf+HH0/CTD+5ky9qBVxbjvMI3cGDPAobxIjdu6dms9C1zIUGAihxaTVx2J6K7Io=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750798348; c=relaxed/simple;
	bh=6UyOqrH7qxcOuRrrgD9lYWCTwEQMvxJK23/nRICLv08=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=FQcDUUPwjA0zayDUdTZ7bHy09GCT64ww1biRQHYH1dYveNNg6KM3xZLDP8+QejzwjN5Qf7R+sVzSbFOtFaq6fRl7T0UdphcHUMKTYgFjccyWCBa9uOllFWMw0DjqZwT+6JrzuXd6+eO+CffDJqAqtdWe3MfDyQzBZWEBR1cWN1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b=CcUFyF1N; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fb.com header.i=@fb.com header.b="CcUFyF1N"
Received: from pps.filterd (m0109331.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OKqOFv006072
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:52:25 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=facebook; bh=dK/E+vj4jarXUT1OgxiHr2H
	9tj7HVQ7vaMJr548e1Lg=; b=CcUFyF1NJCDU41nhP4yofw8rjt+UZfmylux+0Sj
	6OJlw9g27mGDO27KiosCpTDh32DVOlxE28iyfEG65bA95xStO4rlyCzJ/iJX0Rcc
	6upjzzLRwZ3jGCDX/QcXEg0a6YYXYzo4ICEA++rwMxhuQy8k0YY5uGT/nELe2/OK
	ObcM=
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47fxnpaqey-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 13:52:24 -0700 (PDT)
Received: from twshared4564.15.prn3.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::c78f) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.24; Tue, 24 Jun 2025 20:50:13 +0000
Received: by devbig293.vll3.facebook.com (Postfix, from userid 8731)
	id 96CDE2BB1BC6; Tue, 24 Jun 2025 13:50:00 -0700 (PDT)
From: Chris Mason <clm@fb.com>
To: <peterz@infradead.org>, <vincent.guittot@linaro.org>,
        <linux-kernel@vger.kernel.org>
CC: Chris Mason <clm@fb.com>
Subject: [PATCH RFC] sched/fair: bump sd->max_newidle_lb_cost when newidle balance fails
Date: Tue, 24 Jun 2025 13:48:08 -0700
Message-ID: <20250624204942.715206-1-clm@fb.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-FB-Internal: Safe
Content-Type: text/plain
X-Proofpoint-ORIG-GUID: KTtkQmePsUMPhB7p7j9MeWisvwuhNpNO
X-Authority-Analysis: v=2.4 cv=evDfzppX c=1 sm=1 tr=0 ts=685b1008 cx=c_pps a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=FOH2dFAWAAAA:8 a=Y_41IzqnXrIDLEliK7AA:9
X-Proofpoint-GUID: KTtkQmePsUMPhB7p7j9MeWisvwuhNpNO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE2NiBTYWx0ZWRfX8uTIDx476GOQ UB9YotlDVTU98RD7EumALqMXJ/YzLUIOHhMlOiIhbPvxS/+ay584FwS3boZ0xBCzoCy3g598iM+ tht8Gg8vYyaEtYUcRI3ezemdSUwzLWcxBdT3SV3H/jStNkoMEN36eLQZ5ESSKmuWEtedOfd2qBv
 e9xi6xvldK6exOSHPAaQiLMNQj32mRVBrfs1D3X83tNE/usw1TZlFUl2mJX0oPRsa3td0lRihzT SRgqB8FlFTVG2dMEG9oqbiZbqTCo14jnIoecSmZAPMCgjfk8FvRDRvtLBcbyKfHMjvbT52BTXQg QGblCXuWXkbTkxhRqySidxgG6Yd0U6j1JtFzspLnUbeOpVnFfWXZ/MTBDVhUPv6xuc2ZCB3NXTU
 V9DiI0RRD+6a3K1UxoCVc6gBEg3JK1Lu9942lXfE5FIxMudubV9fFWWVTGjgL1WclM5OmUM/
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01

schbench (https://github.com/masoncl/schbench.git) is showing a
regression from previous production kernels that bisected down to:

sched/fair: Remove sysctl_sched_migration_cost condition (c5b0a7eefc)

The schbench command line was:

schbench -L -m 4 -M auto -t 256 -n 0 -r 0 -s 0

This creates 4 message threads pinned to CPUs 0-3, and 256x4 worker
threads spread across the rest of the CPUs.  Neither the worker threads
or the message threads do any work, they just wake each other up and go
back to sleep as soon as possible.

The end result is the first 4 CPUs are pegged waking up those 1024
workers, and the rest of the CPUs are constantly banging in and out of
idle.  If I take a v6.9 Linus kernel and revert that one commit,
performance goes from 3.4M RPS to 5.4M RPS.

schedstat shows there are ~100x  more new idle balance operations, and
profiling shows the worker threads are spending ~20% of their CPU time
on new idle balance.  schedstats also shows that almost all of these new
idle balance attemps are failing to find busy groups.

The fix used here is to crank up the cost of the balance whenever it
fails to find a busy group or busy queue.

Signed-off-by: Chris Mason <clm@fb.com>
---
 kernel/sched/fair.c | 52 ++++++++++++++++++++++++---------------------
 1 file changed, 28 insertions(+), 24 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb2..0c4701564ce01 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11744,6 +11744,32 @@ static void update_lb_imbalance_stat(struct lb_e=
nv *env, struct sched_domain *sd
 	}
 }
=20
+static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost=
)
+{
+	if (cost > sd->max_newidle_lb_cost) {
+		/*
+		 * Track max cost of a domain to make sure to not delay the
+		 * next wakeup on the CPU.   Add a bit to the min so we don't
+		 * have to worry about <=3D vs <, and to handle the sysctl set at
+		 * zero.
+		 */
+		sd->max_newidle_lb_cost =3D min(cost, sysctl_sched_migration_cost + 20=
0);
+		sd->last_decay_max_lb_cost =3D jiffies;
+	} else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
+		/*
+		 * Decay the newidle max times by ~1% per second to ensure that
+		 * it is not outdated and the current max cost is actually
+		 * shorter.
+		 */
+		sd->max_newidle_lb_cost =3D (sd->max_newidle_lb_cost * 253) / 256;
+		sd->last_decay_max_lb_cost =3D jiffies;
+
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Check this_cpu to ensure it is balanced within domain. Attempt to mov=
e
  * tasks if there is an imbalance.
@@ -11782,12 +11808,14 @@ static int sched_balance_rq(int this_cpu, struc=
t rq *this_rq,
=20
 	group =3D sched_balance_find_src_group(&env);
 	if (!group) {
+		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_c=
ost / 2);
 		schedstat_inc(sd->lb_nobusyg[idle]);
 		goto out_balanced;
 	}
=20
 	busiest =3D sched_balance_find_src_rq(&env, group);
 	if (!busiest) {
+		update_newidle_cost(sd, sd->max_newidle_lb_cost + sd->max_newidle_lb_c=
ost / 2);
 		schedstat_inc(sd->lb_nobusyq[idle]);
 		goto out_balanced;
 	}
@@ -12168,30 +12196,6 @@ void update_max_interval(void)
 	max_load_balance_interval =3D HZ*num_online_cpus()/10;
 }
=20
-static inline bool update_newidle_cost(struct sched_domain *sd, u64 cost=
)
-{
-	if (cost > sd->max_newidle_lb_cost) {
-		/*
-		 * Track max cost of a domain to make sure to not delay the
-		 * next wakeup on the CPU.
-		 */
-		sd->max_newidle_lb_cost =3D cost;
-		sd->last_decay_max_lb_cost =3D jiffies;
-	} else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
-		/*
-		 * Decay the newidle max times by ~1% per second to ensure that
-		 * it is not outdated and the current max cost is actually
-		 * shorter.
-		 */
-		sd->max_newidle_lb_cost =3D (sd->max_newidle_lb_cost * 253) / 256;
-		sd->last_decay_max_lb_cost =3D jiffies;
-
-		return true;
-	}
-
-	return false;
-}
-
 /*
  * It checks each scheduling domain to see if it is due to be balanced,
  * and initiates a balancing operation if so.
--=20
2.47.1

