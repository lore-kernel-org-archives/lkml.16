Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23A23289371
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 15:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750866177; cv=none; b=tDsYB9cjyeP0qXRXeyfH2tNhaSfz7W5CqJA3vA7DODwRfIzpnaR3iln0ICZDuPhGG6dRRTxi1RYp+fjhYAWntk/yQgVJ9FyIZWIftKpol+HxV5PPrdbi12cao01L7Ag9DhryeA6SXZP/d/9f5ErudjfSxjYp6+qO/JgGeEGeIX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750866177; c=relaxed/simple;
	bh=VcF+84fWOFxgm6aai/jYVbAI6P3TqUUBnMxN6s3ii04=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0mCu8GJU7WWxRRfBZEE+FRcQ9qUC/J2nKFqhz83aAcumvUxkwHoYUY1jFSuzLhXsJtWL/eSIh9c/Jp0OnWgppeyx85y11mF6f7ohmEKSdFa+MNugFy5xrEcZ5US6BR5LzqhK/10jQNWj9rGL/NU9oCAPl8mbmTAWe8stAGQUy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=mLjGMfO7; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="mLjGMfO7"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55PAxWDF000567;
	Wed, 25 Jun 2025 15:42:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=SasyG8y5fJ9VfEPkrIMLCz9utjNasKGcoRaxAq14t
	R0=; b=mLjGMfO7rWgrdW7ZNz2EAk5A8mB19Tv8dP3sPLeGeI8+xNkbXJEmr7pDm
	lZ8i4yTRrm/6BNPFU2pZONYcgXVHYCVvIkGCEucj0CQFLN2JqMsait+DdqZT600/
	WBlwv9CpZGNndsIDZsRwEqPJ9A+4fQ1aZE36h5GLkiBf/AK5zApKNcmXUEZaYKe6
	STB2AnEGUae0sj8KfbpPdkbePSQN+Hy+ywNlMZARwPpIRbcmjFvIzThdlBnHc6iq
	gz7H6ZNwUNSdw5OUK6Zmlb1aOPs1WtmYpggc6oNxX+46d7cKVw4X6wB7IM0tof2A
	tqMRIjtS6V5GJKqBrPup2KQ2bUCEQ==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 47dm8jgfx3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 15:42:45 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 55PDfUwv006513;
	Wed, 25 Jun 2025 15:42:44 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 47e82pa4re-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 25 Jun 2025 15:42:44 +0000
Received: from smtpav03.fra02v.mail.ibm.com (smtpav03.fra02v.mail.ibm.com [10.20.54.102])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 55PFgeDC56492538
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 15:42:40 GMT
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 337E420043;
	Wed, 25 Jun 2025 15:42:40 +0000 (GMT)
Received: from smtpav03.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id B2C3C20040;
	Wed, 25 Jun 2025 15:42:39 +0000 (GMT)
Received: from heavy.ibm.com (unknown [9.87.147.188])
	by smtpav03.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 25 Jun 2025 15:42:39 +0000 (GMT)
From: Ilya Leoshkevich <iii@linux.ibm.com>
To: Jan Kiszka <jan.kiszka@siemens.com>, Kieran Bingham <kbingham@kernel.org>
Cc: linux-kernel@vger.kernel.org, Heiko Carstens <hca@linux.ibm.com>,
        Vasily Gorbik <gor@linux.ibm.com>,
        Alexander Gordeev <agordeev@linux.ibm.com>,
        Ilya Leoshkevich <iii@linux.ibm.com>
Subject: [PATCH 0/2] scripts/gdb/symbols: make lx-symbols skip the s390 decompressor
Date: Wed, 25 Jun 2025 17:36:50 +0200
Message-ID: <20250625154220.75300-1-iii@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDExMiBTYWx0ZWRfX3zCtNlIxrhSS mC4kYYYAKnPDmWcDluophxwzVZQ2GVj8Iii19TtI8L60Qeo+HN/eTKIgNgYnpcFHvZlSm2VE/6R tiKUMC6kJMo2dk932hY2n5pMEpMxlhOiDJXlO96n6rD2SFElWQA0npV/TWww4Dfd1UuOh6sznex
 xPNvXxx/bpEW8pCSP54itFvbv3XUDSOGpIymC9vHoLdBn/4wBWrv/gk+NETZLnJ6RRhNZJ77wge 0JmmGqJCYlHcUSGh4DC+W76tg76ye8xasDGVZmvVuScg9itl/RfoJ53vcAk9FXxoiJhySgzBqUt +IO2ZaRPc1gPINrOx0MvTKPS2KKY/xSib0hgpVOX+flrER3UiFaLphjj4aySiUi8qJTvlVS2Lvp
 YVuM8MjQFOJ3U8PzLkJ/hNrd/vPj+WqF/ATonk5wvsGfjVGLVmnTjpdrimhqHGkM6NN+XzPH
X-Proofpoint-GUID: Pn7eaGAnygSbjxSczSh10oJNPug60aXd
X-Proofpoint-ORIG-GUID: Pn7eaGAnygSbjxSczSh10oJNPug60aXd
X-Authority-Analysis: v=2.4 cv=combk04i c=1 sm=1 tr=0 ts=685c18f5 cx=c_pps a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17 a=6IFa9wvqVegA:10 a=rS_mzF_E3Pri1V-3OsIA:9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_04,2025-06-25_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 mlxlogscore=556 clxscore=1015
 impostorscore=0 suspectscore=0 mlxscore=0 phishscore=0 lowpriorityscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506250112

Hi,

In order to debug the early s390 kernel boot, one has to skip the
decompressor code, which requires some private scripts or memorized
commands. This series makes it work out of the box with the lx-symbols
command.

Patch 1 adds helper infrastructure to the s390 decompressor code; it is
already acked by Heiko.

Patch 2 is the implementation; it would be great to have an Ack from
one of the GDB scripts maintainers.

We would like to get this series via the s390 tree, if possible.

Best regards,
Ilya

Ilya Leoshkevich (2):
  s390/boot: Introduce jump_to_kernel() function
  scripts/gdb/symbols: make lx-symbols skip the s390 decompressor

 arch/s390/boot/Makefile      |  2 +-
 arch/s390/boot/boot.h        |  1 +
 arch/s390/boot/ipl_data.c    |  9 ++++++++-
 arch/s390/boot/startup.c     |  2 +-
 arch/s390/boot/trampoline.S  |  9 +++++++++
 scripts/gdb/linux/symbols.py | 26 ++++++++++++++++++++++++++
 6 files changed, 46 insertions(+), 3 deletions(-)
 create mode 100644 arch/s390/boot/trampoline.S

-- 
2.49.0

