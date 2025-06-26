Received: from mx0b-00082601.pphosted.com (mx0b-00082601.pphosted.com [67.231.153.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793C02EA482
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:40:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=67.231.153.30
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750948849; cv=none; b=EoDmXaeyjnU4GkGaZ15Dxj0OiLEWsc07+pnorTxSCSejVe/l1za1Hdk3yF/5R/bD+KEyJcUW5jvnnyFGU9nsD3I1hvK0W+4nV1u7B3r6mmWUlABFE28316mQkNrTBRJRPPix+v+g2yQFa9bKA17zxBgdlDew8K0YMGkhYqID3rU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750948849; c=relaxed/simple;
	bh=I3Fbg4JvzGO/1YYcqzJZtepYrZGEVy3qIt1IJpuFATk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=QDa2zlXoMx7Jd6IXy5MEtZYBRKJA1MkznDlawUbYei9cdPZENhlZA2+C1A1O27Y1yxQDbrJ9SwNTPjRfaxxYETR4cpM918UgVqwSxylYdYx82uQPPY/a4qUygDTDO1Lm/5GwSS+hD9YmfmnWPrPg0G7XIdX0KLeV/RT6fwVCJpE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com; spf=pass smtp.mailfrom=meta.com; dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b=erFxkWeK; arc=none smtp.client-ip=67.231.153.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fb.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=meta.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=fb.com header.i=@fb.com header.b="erFxkWeK"
Received: from pps.filterd (m0148460.ppops.net [127.0.0.1])
	by mx0a-00082601.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55QCWHGN008635
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:40:46 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fb.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=s2048-2025-q2; bh=opt5/rfuYnmqv3Cl15
	e1xgZx0di929Z6fUEOjQjNUOs=; b=erFxkWeKqL6itEtDwNXuQVksepo1q9q3dK
	xFfibQn/aVrTOzB+f2qC3BsCD+jc86MhAPg8erLLXCORkHRAZpQVFz/OwYDc2u3R
	PwJ3AFQnnxWsGb4E72EjKhQyz36yl4wZYSWHs7kw0IboBk4PqwMuEKTClGXggTl5
	sJ8ejWJMF6MFp84eZ3DS204iibl0voTkwr6i6B5+AVJDNNMJgK2bZkNWBVBDE7Qt
	La4QwYEcwTDg8NPPHHIQbaNBQYfdmTP0+Gz42bZVYXSrKS+b4rwlTVClO7Kl5+MI
	zdm9mwrXS1vaKjZKW1JIwbCl7i0uFAMEtl/Pzuqb6JTZvF9fhCaQ==
Received: from mail.thefacebook.com ([163.114.134.16])
	by mx0a-00082601.pphosted.com (PPS) with ESMTPS id 47guhnc126-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 07:40:46 -0700 (PDT)
Received: from twshared26876.17.frc2.facebook.com (2620:10d:c085:208::7cb7) by
 mail.thefacebook.com (2620:10d:c08b:78::2ac9) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.2.1748.24; Thu, 26 Jun 2025 14:40:45 +0000
Received: by devbig293.vll3.facebook.com (Postfix, from userid 8731)
	id 093982CAA909; Thu, 26 Jun 2025 07:40:42 -0700 (PDT)
From: Chris Mason <clm@fb.com>
To: <peterz@infradead.org>, <vincent.guittot@linaro.org>,
        <linux-kernel@vger.kernel.org>
CC: Chris Mason <clm@fb.com>
Subject: [PATCH v2] sched/fair: bump sd->max_newidle_lb_cost when newidle balance fails
Date: Thu, 26 Jun 2025 07:39:10 -0700
Message-ID: <20250626144017.1510594-2-clm@fb.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI2MDEyNCBTYWx0ZWRfX4ZTq9FJcH2hf 5Kf87kRKjknzq6oVrwX0AegZTQMGBRThWHTYstqPmMBu4gC+Al9HtvQVfe00+RA2sZ7WmltpQcN aNHZ7sbML1WAHO3fsfj2mfnmsCtOAGZVOU0EEUjH2pTZzmUjJsARb+NS8gEXRzPomqSXrc+Zoog
 nSpwjon4c8pZ2oCNzmkgRJa7EjZSbWdtLdei/zZxUyehBk9VHFXpcgU/r0vWMWOPJk6P0KUXNcF cVFBoskl7ypfmE4nVsRo/18XTIlNS9HmeYGcHE+wvPYo4LcluhsRAHus5aXrD0CKjpHuxg01MOy /bGnPjmKDsDCaNio0Ymxr4UKtlpFr3E5BG6laH16ErirAjUsaJ9Wgd3XRHXS/6vv6LWQN2wMqEE
 Z4xa+Yo6F7d70SgH2Jc1nLFC9B4NDvYAd9kqokwwtFSk7mE1Wc2N0m8oBX5I4kSUeY/HxnzD
X-Authority-Analysis: v=2.4 cv=Peb/hjhd c=1 sm=1 tr=0 ts=685d5bee cx=c_pps a=CB4LiSf2rd0gKozIdrpkBw==:117 a=CB4LiSf2rd0gKozIdrpkBw==:17 a=6IFa9wvqVegA:10 a=NEAV23lmAAAA:8 a=FOH2dFAWAAAA:8 a=zY1a_J39g9qV8x1WtPkA:9
X-Proofpoint-ORIG-GUID: cTnKHQlZhI8gotLPBtobX-QXp5OAU7bf
X-Proofpoint-GUID: cTnKHQlZhI8gotLPBtobX-QXp5OAU7bf
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-26_06,2025-06-26_04,2025-03-28_01

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

The fix used here is to crank up the cost of the newidle balance whenever=
 it
fails.  Since we don't want sd->max_newidle_lb_cost to grow out of
control, this also changes update_newidle_cost() to use
sysctl_sched_migration_cost as the upper limit on max_newidle_lb_cost.

Signed-off-by: Chris Mason <clm@fb.com>
---
 kernel/sched/fair.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7a14da5396fb2..042ab0863ccc0 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -12174,8 +12174,14 @@ static inline bool update_newidle_cost(struct sc=
hed_domain *sd, u64 cost)
 		/*
 		 * Track max cost of a domain to make sure to not delay the
 		 * next wakeup on the CPU.
+		 *
+		 * sched_balance_newidle() bumps the cost whenever newidle
+		 * balance fails, and we don't want things to grow out of
+		 * control.  Use the sysctl_sched_migration_cost as the upper
+		 * limit, plus a litle extra to avoid off by ones.
 		 */
-		sd->max_newidle_lb_cost =3D cost;
+		sd->max_newidle_lb_cost =3D
+			min(cost, sysctl_sched_migration_cost + 200);
 		sd->last_decay_max_lb_cost =3D jiffies;
 	} else if (time_after(jiffies, sd->last_decay_max_lb_cost + HZ)) {
 		/*
@@ -12867,10 +12873,17 @@ static int sched_balance_newidle(struct rq *thi=
s_rq, struct rq_flags *rf)
=20
 			t1 =3D sched_clock_cpu(this_cpu);
 			domain_cost =3D t1 - t0;
-			update_newidle_cost(sd, domain_cost);
-
 			curr_cost +=3D domain_cost;
 			t0 =3D t1;
+
+			/*
+			 * Failing newidle means it is not effective;
+			 * bump the cost so we end up doing less of it.
+			 */
+			if (!pulled_task)
+				domain_cost =3D (3 * sd->max_newidle_lb_cost) / 2;
+
+			update_newidle_cost(sd, domain_cost);
 		}
=20
 		/*
--=20
2.47.1

