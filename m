Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB95522DF9F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 07:54:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749542064; cv=none; b=Ba4N2pTgcsPqMjQwqXo9G3hXvj3OM5/5asWjzE0HzqsxBqmiMV4z4OLnbyzJEI0YXtl+shhhYrl9r8A6ncBc5ZPR1Qs+FAJ4t+4V5r0PUtzN7oQC0sf3JoDzSnRRR0eUgVeVqy871S39NUF0lLcktuXMclLeq8+s9r9GzU8Qdfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749542064; c=relaxed/simple;
	bh=mIEKRI0apLmPAPbbXja8YD3Mf1mZuved7FxMZGp6m8w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dBMJMGWOfw0kb05fVvnYJYNRojovB/zWR/ynfWA8luhWNIYDbb8LdL88M4dBDoju03PGg/Y/0aiHBjprqTjeBXdgM0kXuO0p4mHNIzQwkoFnWd0IJ305z+xeovbFT+7EyV12HyKvERGp0xWJWGWcngDwjpgUzCFT1TMA3fNsC1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=NtcNAb9i; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="NtcNAb9i"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55A0tsC9022393;
	Tue, 10 Jun 2025 07:53:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=nWI2vyz4t9Hm1uJBAIFqKh7zBZp8XHdjbxbhJ0GHS
	N8=; b=NtcNAb9iGMlLdIFJB6q9fBbueqFYRFuPUs0kmFYiJaIuQG1yRMSfBjQWh
	QPQ3UAMPIwJeCcfOOIBUAOXp3WjgFctgOFXQmlv1rMZZi4cAQZLctFzi/jeQzlvI
	6nEo/j59rQyy/61FkLWLUXfobkSqq3RfV/pwzNVr6NRDVfgyL7bz81W4quLCbzWf
	Enc8oTcebZ7U6pKakAFmndUjymF7/1Xw6k7LgllXVodr7IUWXdC713JTMfKExxPI
	jc/UUyf7z9ivlKw5f9NpBOUhi3vK/mloWwM7TNdCwNKqdXWuu2raHmQWhSEFJw0r
	AcgNtAGIrYvUT9WOVEtGimzYN7apg==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4769wyhk2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:53:58 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55A5AHcd028076;
	Tue, 10 Jun 2025 07:53:57 GMT
Received: from smtprelay05.fra02v.mail.ibm.com ([9.218.2.225])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47518m9a1d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Jun 2025 07:53:57 +0000
Received: from smtpav06.fra02v.mail.ibm.com (smtpav06.fra02v.mail.ibm.com [10.20.54.105])
	by smtprelay05.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55A7rrWU43254156
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 10 Jun 2025 07:53:53 GMT
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8C23F2004D;
	Tue, 10 Jun 2025 07:53:53 +0000 (GMT)
Received: from smtpav06.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49BDC20040;
	Tue, 10 Jun 2025 07:53:50 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.27.113])
	by smtpav06.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 10 Jun 2025 07:53:50 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: mingo@redhat.com, peterz@infradead.org, juri.lelli@redhat.com,
        vincent.guittot@linaro.org, maddy@linux.ibm.com
Cc: sshegde@linux.ibm.com, tglx@linutronix.de, bigeasy@linutronix.de,
        vschneid@redhat.com, dietmar.eggemann@arm.com, rostedt@goodmis.org,
        linux-kernel@vger.kernel.org, catalin.marinas@arm.com, will@kernel.org,
        linux-arm-kernel@lists.infradead.org, mark.rutland@arm.com
Subject: [PATCH 0/1] powerpc, arm64: move preempt dynamic key into kernel/sched
Date: Tue, 10 Jun 2025 13:23:43 +0530
Message-ID: <20250610075344.1379597-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: D934p1EPpeZLVRP5Kqwl-WPSBpTaPzGX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEwMDA1OCBTYWx0ZWRfX+q998gK2+o81 EvfmeDKzstb0L4QBibqa8pkC6Q/5OXOlWvQbezZSz7okUDsULCW2K0F53law64XzcC3WUkasouK nkDIMPvu6O+C0WNuG0lImhVrE9BFqihwIymnGp/I8ycCWrM+yqZk+HnbVs8WwQ43lXrObRYAV3P
 EP09TggIBjfmCLHO4HPqxi7NVRBO53cjCleF3Z09Y3k7VdH/FCkE02ex0ENJAENTzp9kluYM6s4 dBvlglvq97nYciWfN1YgGBTgrD25JuR8Ho8rouaGtnfIWq6LbwONGp7fcxs0+bS5lLA8Bdw/u6E STtkV997MgOeanwIRj7FVFQiaoL1miVVQq2t7JTAJrkZJSMS7FX+6kubbBtLlHrVoryuamvm2DZ
 71jG+qpgxB/WVz/hzqG0t0U0RPpsPDXJnkajYzvs7W5yUkNtpnh/RQawpF4quxxjqNZCNrJA
X-Authority-Analysis: v=2.4 cv=YKGfyQGx c=1 sm=1 tr=0 ts=6847e497 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=6IFa9wvqVegA:10 a=cMfPdojDCaELe1LC6y0A:9
X-Proofpoint-GUID: D934p1EPpeZLVRP5Kqwl-WPSBpTaPzGX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-10_02,2025-06-09_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 spamscore=0 clxscore=1011
 malwarescore=0 bulkscore=0 priorityscore=1501 phishscore=0 mlxscore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 mlxlogscore=616
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506100058

Current usage of preempt dynamic key is not specific to architecture and
can be moved into sched/core instead. Most of the code around it looks
similar. (same code for powerpc, arm64). 

Since preemption is more associated with scheduler rather than
entry/exit, it is probably better that they should be moved. 

This is tested on powerVM PREEMPT_DYNAMIC=y/n. 

Only Compile tested on arm64. It would be great if someone can test both 
PREEMPT_DYNAMIC=y/n configs there.

Shrikanth Hegde (1):
  sched: preempt: Move dynamic keys into kernel/sched

 arch/arm64/include/asm/preempt.h   |  1 -
 arch/arm64/kernel/entry-common.c   |  8 --------
 arch/powerpc/include/asm/preempt.h | 16 ----------------
 arch/powerpc/kernel/interrupt.c    |  4 ----
 include/linux/entry-common.h       |  1 -
 include/linux/sched.h              |  8 ++++++++
 kernel/entry/common.c              |  1 -
 kernel/sched/core.c                |  4 ++++
 8 files changed, 12 insertions(+), 31 deletions(-)
 delete mode 100644 arch/powerpc/include/asm/preempt.h

-- 
2.43.0

