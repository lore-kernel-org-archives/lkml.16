Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 145862DF3EF
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 19:12:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750878745; cv=none; b=hQXJhCP/lrx0yohUmemCRtbVApBXC2zkZzy70TX7MowYjbBQDPfPtLz6QxgafV8HJQ7eMOjndJ7JjHNkJKHektGIAxtuiBNrgzQdMejIsa3DQzp2H2N+J40csylrfCFxDu5DF/BUR72ehh0M6GSRIAzz0DhpME74h9GtrpMKy1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750878745; c=relaxed/simple;
	bh=aL0NE6+mLDuaQA81sxmKw6NRbyzWHbvR+USux8MumOE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAGCSqey54qIqWnY62lwWF23pFOodn+p5KiLpIDv3EneibJnE1XLOg1CjtUQj17i2Nnih/5DZ5+ZIZCuGCvjrr3IVkbzlumy3xrlhWBUTrfHVA0T7h/ACB6xg5mNVEOsaDGMADbjcE5SCKfrIR6v/1igejT9R2nL/3vx9XD2mDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=YI2HwbLv; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="YI2HwbLv"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PJ1kVw025791;
	Wed, 25 Jun 2025 19:11:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Gg+BKnhQwKdK9OcNk
	LiWh4xXWVgQ9j+Jef5Ks83o6qo=; b=YI2HwbLvfy/u8r1dTxFOW92OPi2nWsFHH
	YIkCNZ5aRDpvg1dW7xc5l3DSv9AO/kVDcA0RhabwG4cDKRVJ0G0ElRXfiy0qD13i
	HrSxI8TUBffrZKnYUXfGTEzfaBEtjvxHMlCDpdZ738lfMnB/O93lKppP8xEyLqGz
	ZnP8zzc887/NoQS5bI6yQDUD1dZC6kU7rwrKsY9yhnOFdU0MDFe76H2Y6jME1y38
	CgqffYcH55sLDARTSJOd8tqF5sd7p1KHFQ8AqSI+qxZUsxTO9uob/75SRMN7g4py
	UubVg0s2JG7ea0n3QEVm19IuyzhrmFgQWFXaE2eJl3QsATx+Zv8Ug==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gpwhr27x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:50 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 55PJAemw012006;
	Wed, 25 Jun 2025 19:11:49 GMT
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47gpwhr27n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:49 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PH8aYD006329;
	Wed, 25 Jun 2025 19:11:48 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82paxvw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 19:11:48 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PJBim456295884
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 19:11:44 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 5E01D20043;
	Wed, 25 Jun 2025 19:11:44 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B5FE120040;
	Wed, 25 Jun 2025 19:11:40 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.209.143])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 19:11:40 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, kprateek.nayak@amd.com, huschle@linux.ibm.com,
        srikar@linux.ibm.com, linux-kernel@vger.kernel.org,
        christophe.leroy@csgroup.eu, linuxppc-dev@lists.ozlabs.org,
        gregkh@linuxfoundation.org
Subject: [RFC v2 4/9] sched/fair: Don't use CPU marked as avoid for wakeup and load balance
Date: Thu, 26 Jun 2025 00:41:03 +0530
Message-ID: <20250625191108.1646208-5-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250625191108.1646208-1-sshegde@linux.ibm.com>
References: <20250625191108.1646208-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: Bkm9rZTZ3Ey8h4d0sez8YChxm-xlEoG3
X-Proofpoint-ORIG-GUID: 7MZ_nsFenaS2xnJn_vxkGEUnLcWuDv4Y
X-Authority-Analysis: v=2.4 cv=dd+A3WXe c=1 sm=1 tr=0 ts=685c49f6 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=R63sIUGh8Hs7vTQp:21 a=6IFa9wvqVegA:10 a=VnNF1IyMAAAA:8 a=5kU7IP4gcsCI17dftJ4A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDE0MSBTYWx0ZWRfX5hVljC8FRYal oX4WAk1oDGJK7Ne7imfLdzIwmJzQ1hZp8pDe4rLba1ph29HhU8lfB3QE45lHMY1k/XlaYGNHnOe 7w0Y9DpDMNsWahixdh8/VxzYXh4cwe2CVxpGMz9BRUDOMy5Lk8eAY7mDV636Xhw/E19i2CERTox
 8aACcIQzhRWuq48jRzRqzcPqoDiFwzHQ7ashyUsPq4hjMnFZHMohBPd6+DvXPfqMkgjuOzdyzYY 3WxsS2wdTCeRL29wOS9SSnL0DoY3+UezNcyVLlNbvsRwaCFwgaIA9dCoakD5mU2toymLota7Gig ZDhmrU8zWFm5DaurlxDun3oTo3Bovy04t9o4bidml3EPFQrZtAVxgFw+d8/PRMsYnTDhja6sNMt
 PcE+5uT+W0okks7peUD4MAmon/IQWZ+xSpPVvSQdrtIItyRg0Ojfms1TLF2r2NZ1VZSErAuk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_06,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 spamscore=0
 mlxlogscore=812 priorityscore=1501 mlxscore=0 clxscore=1015 adultscore=0
 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250141

Load balancer shouldn't spread CFS tasks into a CPU marked as Avoid. 
Remove those CPUs from load balancing decisions. 

At wakeup, don't select a CPU marked as avoid. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
while tesing didn't see cpu being marked as avoid while new_cpu is. 
May need some more probing to see if even cpu can be. if so it could
lead to crash.  

 kernel/sched/fair.c | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 7e2963efe800..406288aef535 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -8546,7 +8546,12 @@ select_task_rq_fair(struct task_struct *p, int prev_cpu, int wake_flags)
 	}
 	rcu_read_unlock();
 
-	return new_cpu;
+	/* Don't select a CPU marked as avoid for wakeup */
+	if (cpu_avoid(new_cpu))
+		return cpu;
+	else
+		return new_cpu;
+
 }
 
 /*
@@ -11662,6 +11667,9 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
 
+	/* Don't spread load into CPUs marked as avoid */
+	cpumask_andnot(cpus, cpus, cpu_avoid_mask);
+
 	schedstat_inc(sd->lb_count[idle]);
 
 redo:
-- 
2.43.0

