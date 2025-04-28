Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208F0269B0B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 15:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745853829; cv=none; b=EiWufV54IVDhloXJCkswv/3pwY+bibooXcEG+TfjZsN1rcJttqvKG0RacRdTW4XsJf/z3TZkbBTTmsIP4P7OPTXc9UdMGrp5YzvFD2En0AQsJILwb8NF/0T1dgPx9x8G4Az96/MHxExbsnWEDcPXk8VgVqasunHdth8RzdVYPVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745853829; c=relaxed/simple;
	bh=DlngDrpSAJU1CgBcg6saWcOelaYTUbK5pSWA+0iQIFE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ocvW+paLL2MMaFz+kfIDInT8cDPsH+XQLhHNcW9JM0nmKV+EpqayYd6EQsOe5zXWngx8dXhW94NjB6+d4JGm0djJFvWP6QEiccgrc2YhnTPW04mqT/iQFrhnySJ5+Uyu8ulcsRumcn5RCLPOZQ5iAzzV89kjdGu94xJhIAP6NJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=VcVquC4R; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="VcVquC4R"
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SAed4A022802;
	Mon, 28 Apr 2025 15:23:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=NREGAPGQsiBxhVraNlIqNTVtWZA576N2w2dMZUE1N
	AY=; b=VcVquC4RRooloBZ2a7LKxpGmWTmntiIkKHp5BVZVwC1yhf5Q27HzOa0uK
	zTzc4krTZakiA3hxqZ7nTu+YDC2rlsSJtQvJ7gk+FHdCtidgYE/T2mNQ2tSE1XCZ
	s3YpueF1S8WIHlNSG0FKcDMK/dbAihd3jBzvXU5RPMgCr0glJ6X0Z0M3bEOgOFom
	BcWyK1Ahpp4No7BBblUQDHM7FuC+OlZ+nASmPo9ww541dSM+U+R4n//eo5SSdgbK
	N4QT/O+D7fKm/PIa7Vr0ZEX1v6W/Yb+N2OLnVBFXVeJ5fjP3cgcKja153AUzBuQX
	FojBG0QG8jhvYACilJThH8sKPuGnA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s1bvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:08 +0000 (GMT)
Received: from m0356516.ppops.net (m0356516.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53SFN8fg024180;
	Mon, 28 Apr 2025 15:23:08 GMT
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46a84s1bvv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:08 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53SBZDV1001799;
	Mon, 28 Apr 2025 15:23:07 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 469bamexx2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 28 Apr 2025 15:23:07 +0000
Received: from smtpav05.fra02v.mail.ibm.com (smtpav05.fra02v.mail.ibm.com [10.20.54.104])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53SFN3oL31064542
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 28 Apr 2025 15:23:03 GMT
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 109B220043;
	Mon, 28 Apr 2025 15:23:03 +0000 (GMT)
Received: from smtpav05.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37F9220040;
	Mon, 28 Apr 2025 15:22:57 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.30.54])
	by smtpav05.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 28 Apr 2025 15:22:56 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, naveen@kernel.org,
        neeraj.upadhyay@kernel.org, vschneid@redhat.com, tglx@linutronix.de,
        frederic@kernel.org, ankur.a.arora@oracle.com, sshegde@linux.ibm.com,
        bigeasy@linutronix.de, kees@kernel.org, oleg@redhat.com,
        peterz@infradead.org, tzimmermann@suse.de, namcao@linutronix.de,
        kan.liang@linux.intel.com, mcgrof@kernel.org, rppt@kernel.org,
        atrajeev@linux.vnet.ibm.com, anjalik@linux.ibm.com,
        coltonlewis@google.com, linuxppc-dev@lists.ozlabs.org,
        Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
Subject: [RFC V1 0/6] Generic Entry/Exit support for ppc64
Date: Mon, 28 Apr 2025 20:52:20 +0530
Message-ID: <20250428152225.66044-2-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=Mchsu4/f c=1 sm=1 tr=0 ts=680f9d5c cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=XR8D0OoHHMoA:10 a=DsuCdF12KTDp4NqqrKwA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI4MDEyNCBTYWx0ZWRfX+rPuy6ApPZAw 9oXxxxHmPcxnEPoQO2Xw17aWeFQj5Th2YG2L5fQYhYQiB/XOFpNhcETqkRBQ1VNhoHPHcIAvvri xxNAF85ettyP7AWfFmAyMwXqwwIi8cO3YQnRIj3qX1mYtd7OeQsrOK4MjFei8B8unU1WTzu1/XS
 PVf3wexZ3GfozRoGpyvwu+wNnV1DV8hBc+TGWR8RlL+/YnPGPNkOfO+6mQbYclLHa3IBQSs5xAc oe72f4KN0kx+DoxTfj7cFijaUL1I2D5efuhRUxlwyYmrYZMe9STEHsyi/FAhov3nxl99Zqb1p4G nhdCTWEJLEDGhF2ZAyV/RkDvQHlcjMBKYyRTqDSsJegnrj6DHmwgarcw8D7tNL8C4fuXQeynRS4
 HRDvRiE/HeNpSYz+DFWfsThsmQsxWZ1XoOgGGHpRDvzYhlaSMfhrinoiC0wMjqQgnD0HuScu
X-Proofpoint-ORIG-GUID: cloEjq8kPuPb_0w3RuAky1WIVkphzUGU
X-Proofpoint-GUID: 6cilolTtHhyjrqOQgKnE3NJ23TppTuz9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-28_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 mlxlogscore=734 impostorscore=0 bulkscore=0
 malwarescore=0 spamscore=0 priorityscore=1501 adultscore=0 mlxscore=0
 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504280124

This is a syscall only implementation of generic entry/exit framework
for framework for ppc. IRQ handling is not done in this RFC. 

This will break the ppc32 build as of now which will be fixed along with
IRQ handling.

Below are the performance benchmarks from perf bench basic syscall.
This is for 1,00,00,000 getppid() calls

| Metric     | Without Generic Framework | With Generic Framework |
| ---------- | ------------------------- | ---------------------- |
| Total time | 0.904 [sec]               | 0.856 [sec]            |
| usecs/op   | 0.090403                  | 0.085638               |
| ops/sec    | 1,10,61,579               | 1,16,77,086            |

That's ~5% degradation as of now.

Mukesh Kumar Chaurasiya (6):
  powerpc: rename arch_irq_disabled_regs
  powerpc: Prepare to build with genreic entry/exit framework
  powerpc: introduce arch_enter_from_user_mode
  powerpc: Add flag in paca for register restore state
  powerpc: Introduce syscall exit arch functions
  powerpc: Enable Generic Entry/Exit for syscalls.

 arch/powerpc/Kconfig                    |   1 +
 arch/powerpc/include/asm/entry-common.h | 158 ++++++++++++++++++++++++
 arch/powerpc/include/asm/hw_irq.h       |   4 +-
 arch/powerpc/include/asm/interrupt.h    | 117 +++++++++++++++++-
 arch/powerpc/include/asm/paca.h         |   1 +
 arch/powerpc/include/asm/stacktrace.h   |   8 ++
 arch/powerpc/include/asm/syscall.h      |   5 +
 arch/powerpc/include/asm/thread_info.h  |   1 +
 arch/powerpc/kernel/interrupt.c         | 153 ++++++-----------------
 arch/powerpc/kernel/ptrace/ptrace.c     | 103 ---------------
 arch/powerpc/kernel/signal.c            |   8 ++
 arch/powerpc/kernel/syscall.c           | 117 +-----------------
 arch/powerpc/kernel/traps.c             |   2 +-
 arch/powerpc/kernel/watchdog.c          |   2 +-
 arch/powerpc/perf/core-book3s.c         |   2 +-
 15 files changed, 336 insertions(+), 346 deletions(-)
 create mode 100644 arch/powerpc/include/asm/entry-common.h

-- 
2.49.0

