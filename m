Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E68A52AD02
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 07:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746431654; cv=none; b=rYPL3nfBhx5ZBjwohGP6PTTFUYS1gx2yZnKSksP6YNz42DgsVVx45XDzfxkU32qcv06bc9stRD6/d2e1nOj+SBA5JAVnibzh7zf/uZn5r52OOEgLFojsRVnrCbRnEH8EzOmH6o+Kt/d1PhaH2D3Spje0w1egx35CM+86NnyQbo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746431654; c=relaxed/simple;
	bh=lIPrO0RWzaEhvBpeE2YQkDAuBRI+c2+iIGVlbMeD/6A=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OZiL8b5gA0sAKd/azkE6pl8TTIQqbMpsTm87B05kkag4wTsvupO5MEiadbbI704H/3ih2inLsoYuf8dEkcAUumRmn+46/P5ALBRJz2TR50j67IOROZahUadD6YBk1HyIQD+tGmJF+l0PL7bAH7sWePy8De1L8J8Zz0ooiQ2nRIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=dbYKgmuD; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="dbYKgmuD"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544JrsS2015827;
	Mon, 5 May 2025 07:53:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=zSg6q4w8GFrHmnk6F9LccDvj3EB4lnCvHDLF5Aam1
	4Q=; b=dbYKgmuDo0/Bx7K0x2p1WFcICiL4CTxgVxgdWBGr4Nl3rLbWQORIT/b+i
	cAAaceF2qS0o56pMZBoSlgyNVBTkM3jJp1vUnYZeXATnJ6WwZtATrr81WtFfT1Ux
	KuRQ/yThw9hXoXuJpZayFa7uXlT3hsyD1HA/g1G8ezOJashJK1qVPz5oU8lfHoE3
	w6sfkQDn8j1pZf1osM2cyY2Pt8Em99qXrslmgPikCaPtP5/yiTlb9+6UweBFDRbm
	UbKxcf06syIQJg/CJBaDiRfpy8FoiJvP6672F2IexCbkes+1XLGvIcESXMuaB1/N
	zhm0COXBEW94zDZzQTofeKLZUUoHA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hu99f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:57 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5457q4h4030120;
	Mon, 5 May 2025 07:53:56 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46e65hu99c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:56 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5453q8mV032252;
	Mon, 5 May 2025 07:53:55 GMT
Received: from smtprelay07.fra02v.mail.ibm.com ([9.218.2.229])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46dxymd4ea-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 05 May 2025 07:53:55 +0000
Received: from smtpav07.fra02v.mail.ibm.com (smtpav07.fra02v.mail.ibm.com [10.20.54.106])
	by smtprelay07.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 5457rp1n52625812
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 5 May 2025 07:53:51 GMT
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6EAA22004B;
	Mon,  5 May 2025 07:53:51 +0000 (GMT)
Received: from smtpav07.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 6665D20040;
	Mon,  5 May 2025 07:53:49 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav07.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon,  5 May 2025 07:53:49 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: sshegde@linux.ibm.com, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        mpe@ellerman.id.au, peterz@infradead.org, ajd@linux.ibm.com,
        mahesh@linux.ibm.com, hbathini@linux.ibm.com,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 0/6] powerpc: use lock guards for mutex Set 1
Date: Mon,  5 May 2025 13:23:27 +0530
Message-ID: <20250505075333.184463-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=UZ1RSLSN c=1 sm=1 tr=0 ts=68186e95 cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=JfrnYn6hAAAA:8 a=VnNF1IyMAAAA:8 a=b4va75BfmSkk2aLqjCIA:9 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-GUID: KT6QfzeeIRIZZpNqErV0zQOnHpaqG7ld
X-Proofpoint-ORIG-GUID: mPP586Orw0TUNq-3VMWGwsAiaqdRv-Dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDA3MCBTYWx0ZWRfX1ZOs1CfwDvIr 67777wiXn5ktsSRp65CiLX7MANBCq6HFRQIdoB04EMAzSU11uL7ZVf1YvJwPTyFeT0sFlLcH+yy xg0c7lN9GowoABYm/zB+E+XFx0Tqqz5cQMSuocFYFVYXFWYtICJ5lgeeBWMWylMGppSNh6gSz4H
 +QOtteJuQOMZ+JvrwnZCJbqS8t8G3iWw06GhnhY08NLiKIZ4HEVB1klw3TmOfx7KF3t1Zwji0zN zmCQFOO+KqIxLZVrGyRDWDXRFCII5LxqHjDQmY4VDV9QT0cSlAFK8tMzC9c9qG//qHGexKF+YUr OkbzFfxNOhHThV2lpyFsaNY2dsuSgD1nJF4R1j3vzwsxXA3BZ7dGsGxN9PCdUokl6roJKfSBJGQ
 sJelh9r1FNDAGK9RUURetUGcKO+Z8UwYKVxaNghUhnvOi/XlxbklHfVmtX2hV/Apr7dHTVSs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_03,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 suspectscore=0 malwarescore=0 bulkscore=0 priorityscore=1501 adultscore=0
 spamscore=0 impostorscore=0 clxscore=1015 mlxscore=0 mlxlogscore=843
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050070

This is an effort to make the code simpler by making use of lock
guards which were introduced in [1], which works by using __cleanup 
attributes. More details in v1 cover letter

v2->v3:
- Collects tags (Andrew Donnellan & Srikar Dronamraju)
- Address comments from Srikar Dronamraju 

v1->v2:
- Fix changelog of powernv (Andrew Donnellan)
- use scoped_guard in couple of places to avoid holding mutex
  un-necessarily (Peter Zijlstra)

[1]: https://lkml.kernel.org/r/20230612093537.614161713%40infradead.org
v1: https://lore.kernel.org/all/20250314054544.1998928-1-sshegde@linux.ibm.com/#t
v2: https://lore.kernel.org/all/20250314114502.2083434-1-sshegde@linux.ibm.com/

Shrikanth Hegde (6):
  powerpc: eeh: use lock guard for mutex
  powerpc: rtas: use lock guard for mutex
  powerpc: fadump: use lock guard for mutex
  powerpc: book3s: vas: use lock guard for mutex
  powerpc: powernv: ocxl: use lock guard for mutex
  powerpc: sysdev: use lock guard for mutex

 arch/powerpc/kernel/eeh.c                   | 20 +++----
 arch/powerpc/kernel/fadump.c                | 11 ++--
 arch/powerpc/kernel/rtas_flash.c            | 64 +++++++--------------
 arch/powerpc/platforms/book3s/vas-api.c     | 32 +++++------
 arch/powerpc/platforms/powernv/ocxl.c       | 12 +---
 arch/powerpc/sysdev/fsl_mpic_timer_wakeup.c | 14 +----
 6 files changed, 50 insertions(+), 103 deletions(-)

-- 
2.39.3

