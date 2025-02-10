Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E29A25E444
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 18:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739213092; cv=none; b=BQYtTfjNlrMi8HpxRV2L3IyvT5FaV+42OG3wJSSCGYPj3rcyfH+7V8zYPWeqinPWQ83rxh6rqFkDE1QBVebMPuQN9ZzyS4UXlNlydFg0rE1CI+/psxTdz7mfe8ovJyOrMSMFfJGxXDYQZiIrQwiDuYVkQclvOAX0D8nx/AOzhPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739213092; c=relaxed/simple;
	bh=AGre9BQxotedvxZKBXsmgoQuTy1F4TM0uQThdsEnGrY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=SWQqMXlwD4zxTJ2tfeRe4De8utW/daQkhPFpf9QqGS6WgeyC462yjMplrAx3PiV5GKu3PexAtJp0imOJ/SWoCBTdTt9x+GkIwwNRGjvM4tHnq44q7ZwKW8qZmN5/L4NKX4vv4qTd5UYW+BqlDC+QLlfOqI+81HvO1a/KGYBHwck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Ad/A+YmB; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Ad/A+YmB"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51AC7GSj014061;
	Mon, 10 Feb 2025 18:44:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=/sfZo4VnTTbgtBXOjHc1EMP0EjzaL6Vg1Lr6lCGxp
	sk=; b=Ad/A+YmBKeK9eO3NoDqP33y46uu9mSeY9lWQYBXfO5Y1z7ZmyEm/xf7cg
	/yXiWpDSNYBBtpRckRZDkRFrcvUh2iXEIB0sLSlVqkRDMMRaGIp0abrINLQ1veV3
	/E8XXjlk3+u75ZLgxioe1T0qTOSQ8Dbfyb90T0ZHDyqJwxY6uVwdIQwk5+0jaZ1T
	8bRtBpuFldXoMngcQO5nQAatmGBqDB5oVspspysgiJdCLDofU9RCKKpXSawxDyRg
	jxWj+ZC94N/vnBWYsse8K4RNI19ZLzaIhVnqpcsS36lHiFjQ37rinqJOZeQm0jW6
	qU8Be9RjhCQPUaCYoiNBL9hRlifDw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q89yvenb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:23 +0000 (GMT)
Received: from m0353725.ppops.net (m0353725.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 51AIXHXB030868;
	Mon, 10 Feb 2025 18:44:22 GMT
Received: from ppma22.wdc07v.mail.ibm.com (5c.69.3da9.ip4.static.sl-reverse.com [169.61.105.92])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44q89yven8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:22 +0000 (GMT)
Received: from pps.filterd (ppma22.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma22.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 51AFOCuj028217;
	Mon, 10 Feb 2025 18:44:22 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma22.wdc07v.mail.ibm.com (PPS) with ESMTPS id 44phyy7vkg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 10 Feb 2025 18:44:22 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 51AIiIIY50200834
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 10 Feb 2025 18:44:18 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 204E720040;
	Mon, 10 Feb 2025 18:44:18 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1BBD320043;
	Mon, 10 Feb 2025 18:44:16 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.ibm.com.com (unknown [9.39.21.225])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 10 Feb 2025 18:44:15 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org,
        christophe.leroy@csgroup.eu
Cc: sshegde@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        bigeasy@linutronix.de, will@kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v4 0/1] powerpc: Enable dynamic preemption
Date: Tue, 11 Feb 2025 00:13:33 +0530
Message-ID: <20250210184334.567383-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: TVaZM5MAqNqCkiNaS_iUsIIujLviuuZv
X-Proofpoint-ORIG-GUID: LPA-Cgz7nPLnLml3cyj4btBaBdbQBwiM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-10_10,2025-02-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 mlxlogscore=582 clxscore=1015 impostorscore=0
 spamscore=0 bulkscore=0 suspectscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502100149

Now that preempt=lazy patches are merged upstream, sending out the
patch to support dynamic preemption based on DYNAMIC_KEY.

Once the arch supports static inline calls, it would be needed to
evaluate to see if that gives better performance.

This makes the same code for arm64 and powerpc. Will be sending an RFC
patch to move this static key into sched/core. 

v3->v4:
- Use static key instead of using preempt_model_preemptible 
  (Sebastian Andrzej Siewior and Christophe Leroy)
- Dropped printing the preemption model, since it is addressed 
  in a patchset from Sebastian Andrzej Siewior

v2->v3:
- fixed a build error reported by linux test robot by including jump
  label header.

v1->v2:
- Instead of copying asm-generic preempt.h content include it in
  arch/asm preempt.h. (Christophe Leroy)
- Merge the patches into one patch (Christophe Leroy)

v3: https://lore.kernel.org/all/20250106051919.55020-1-sshegde@linux.ibm.com/

Shrikanth Hegde (1):
  powerpc: enable dynamic preemption

 arch/powerpc/Kconfig               |  1 +
 arch/powerpc/include/asm/preempt.h | 16 ++++++++++++++++
 arch/powerpc/kernel/interrupt.c    |  6 +++++-
 arch/powerpc/lib/vmx-helper.c      |  2 +-
 4 files changed, 23 insertions(+), 2 deletions(-)
 create mode 100644 arch/powerpc/include/asm/preempt.h

-- 
2.39.3

