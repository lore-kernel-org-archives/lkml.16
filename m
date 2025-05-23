Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A91929B213
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 18:15:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748024137; cv=none; b=bb5FGKm7owlyGZ+Q9J9LiT1/G48eZLxQwkoKFi5L3bbf0w5W415xW+Bjw1OHFABnu36qvHYOXUzaBRm36vSYcahd9Pv8ZlYfq37n/OERs/TjtLF1LvIQWKjCQ42Oj4Zz9kyZ4EmZydYmePcxaimxTGkEdlmxsMWSvjJfdsEwgZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748024137; c=relaxed/simple;
	bh=nnyHGB6U1C7Kgu6nFbXrmHpQU0Zq4siWHKTYtL0SA4I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0nugCnTpSAzA0VHLYaUg54XudGXzsHjjfpeM1EFLkENr/qqmTi6yqrLEbygfMbtRCnzkpPyXz0f7VaIC2xTFUz42NTo7gn6m4c73+vBlBsHph+IXjlSPODuQmUjoL4i8qQVJCy6T+jVEUojcgnVcQkXMyaloqnHn3u2kZisrlw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=hFNdGPTc; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="hFNdGPTc"
Received: from pps.filterd (m0353729.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54NGWEaF008733;
	Fri, 23 May 2025 18:15:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=Cwj2bbP73sprJZTIk
	y8dfVd0Rf+prF9LI0VrT4FGTOE=; b=hFNdGPTcF4BBR9ImsYLStRXNghJSjgMkq
	8OLzgYd/oNJSVC30qjH3/nOF0jGjfvF1R+7BrBMhrEWqadfEt+PSJtvQLA2Ly9v8
	JwSS3uD1v6Hh0RsZB66HLh0kK24YFRjcSPAaOH/1X+1tmg5o9qXl/jILUD/Dxjcq
	KY/twxhC6Ik8zLA01Y/dnx97ios6+w8hUYLlycKImsoL2BN6pTxGeyJjtY0i/vRi
	wFgrZTpibVNOXS6xHEDHIMYQ4Yh+kZs5CUS2J9jWu1vzqK7jR17IhR1prYkPyqot
	btloRoNkmMhyZDHDR/2p2TF7VxI9khX1ltS84pjymKHNgRFKMHfRg==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhwhesp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:15 +0000 (GMT)
Received: from m0353729.ppops.net (m0353729.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54NIFFpU000308;
	Fri, 23 May 2025 18:15:15 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46sxhwhesm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:15 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54NHa88R032024;
	Fri, 23 May 2025 18:15:14 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46rwmqfvh8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 May 2025 18:15:13 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54NIFAx928770756
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 23 May 2025 18:15:10 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0EB922004D;
	Fri, 23 May 2025 18:15:10 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 88A2120040;
	Fri, 23 May 2025 18:15:06 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.124.221.90])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Fri, 23 May 2025 18:15:06 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, tglx@linutronix.de, yury.norov@gmail.com,
        maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, vschneid@redhat.com, dietmar.eggemann@arm.com,
        rostedt@goodmis.org, jstultz@google.com, kprateek.nayak@amd.com,
        huschle@linux.ibm.com, srikar@linux.ibm.com,
        linux-kernel@vger.kernel.org, linux@rasmusvillemoes.dk
Subject: [RFC PATCH 3/5] sched/fair: Don't use parked cpu for load balancing
Date: Fri, 23 May 2025 23:44:46 +0530
Message-ID: <20250523181448.3777233-4-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250523181448.3777233-1-sshegde@linux.ibm.com>
References: <20250523181448.3777233-1-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIzMDE2MCBTYWx0ZWRfX4aSuiwL5n6c8 wBsEekn/gjJagKBEvEwkxfLqe0dx2Y9bzMbEOBmSjE6n58KtotB4gqjPZJuBAMWx2S4g9C7q7i4 995snCu9zaIzCcS62KHC8BeKNninEQfTpUN/EUqPWgltruzOrB8/PMTZTRPeLCAYzyBVSBy2Ljp
 YaPGoVD0WHTW4sCV79dafGlKjrjW5CHFHCWx1dZjiPkUFp+4PudS1blAnSlvvnPF5B5vo4dkAnd W8lqKhAhWCTPUBQIhLGQxQ8fUzivdSXC70MUCl6NamfQUIOWh6XFR6tS3EZdwB7NqnT399UiXWl zk0riaBiI8/7sf81IUNRss6ffS2m6PYqTt0dQ/nf/ZEfQ6cVP72jSQHn8SQ3RpDjIm1JiS4gV7K
 XwKtXag5NaR3Z/PDhSwH1/12t0+70PEu/0uVe3a6jFSvGEtQ6zRELKbdfbSzZ+8xmMce7xPC
X-Proofpoint-GUID: eaGTPgHY3EZr-nUxp4AbzqN_hzfpbuK-
X-Authority-Analysis: v=2.4 cv=O685vA9W c=1 sm=1 tr=0 ts=6830bb33 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=A_CrLDhOnlH3o789EtUA:9
X-Proofpoint-ORIG-GUID: zIJN5OVqRKkafCGM_wMMIM7SQAR6Rykl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-23_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0 mlxlogscore=579
 spamscore=0 mlxscore=0 phishscore=0 bulkscore=0 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505230160

While doing load balance, don't consider the parked CPUs. As far as load
balance is considered, a parked CPU is as good as offline CPU. 

Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
---
 kernel/sched/fair.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 125912c0e9dd..f48f55ca1522 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -11761,6 +11761,7 @@ static int sched_balance_rq(int this_cpu, struct rq *this_rq,
 	};
 
 	cpumask_and(cpus, sched_domain_span(sd), cpu_active_mask);
+	cpumask_andnot(cpus, cpus, cpu_parked_mask);
 
 	schedstat_inc(sd->lb_count[idle]);
 
-- 
2.39.3

