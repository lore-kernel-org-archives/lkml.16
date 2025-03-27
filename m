Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6589A1C84AE
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116735; cv=none; b=Sh5MfpGfp+lPMHTc9VbDTsaPBTmxGIvnxRkk5CqzQn1aNhXx752hX+PROL2J46npu4f0JTPckzNYAwelYJW63HxE+HCYawDEbtEnkc899vWZzlRCbQTeVnXD0cY9G7z2XfBewfRQSxle5jgHbQEl/rGHLIDwN6mPBFqwVavgDJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116735; c=relaxed/simple;
	bh=PJ+6I2EbSAnfXP7d+faEBd0EZvuO0Nds94k6QHogyTI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QywkEEPR38x40f8kmKCx4uKEYQeBD34D9lsbWEpD1t17qNbjpY0zTz7g8Xu4ovD2gFXvsVJtjX9iGQzB5b31+phD5jaZtQyBTNCaUy6xWG3K+rrxUaXn6M/F2q1Kr9Pe4bYJa8AsfI4Jhj/Ob+YttDuJUX6uGB7RHWX6b1Fy3/k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=F8JTJSW6; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="F8JTJSW6"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RLMtqi019553;
	Thu, 27 Mar 2025 23:05:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=ymnaoPKtcRA+Qj3VPSrtT0AVyz0qh
	DBItTxmLgoj3w0=; b=F8JTJSW6B6HhUnQh8Q+9LQyQ7KnSwP/p243mTE3DC15pY
	1XvOLSwOnbQ0oqTg+LTlf3F6BnfetoXhvLtn36TmNmD9D+x9G7PX1IJXms2QhORb
	Bg1gI2beSOlJDw70WO7yP0ZJgnk7AvrSI8ucOf6BHGHOBt25nMbvEXykdJyL0mkP
	qzHji8a+bbVQ/SO1CoUImJoNryWx3FZHYksGZXlp1hOCOjU9dBKpnHUFKyaFglP2
	BRQiZZfpfP25TyztsFrTu5/SSqbbBQfZoTy7GrvSzJ9I+0Rdk5RW/qy7v6XzKVGy
	pWeJXan8wCOT4k6OAKGYA3bn5IPw5O3E47lbbSMHQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45mqftbe0e-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 23:05:18 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52RMKANw023846;
	Thu, 27 Mar 2025 23:05:17 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jjcha7sr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 23:05:17 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52RN5HQV033345;
	Thu, 27 Mar 2025 23:05:17 GMT
Received: from bostrovs-home.us.oracle.com (bostrovs-home.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.198])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jjcha7sa-1;
	Thu, 27 Mar 2025 23:05:17 +0000
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: bp@alien8.de, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v2 0/2] Clear AMD's microcode cache on load failure
Date: Thu, 27 Mar 2025 19:05:01 -0400
Message-ID: <20250327230503.1850368-1-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-27_05,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=746 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270156
X-Proofpoint-GUID: YVvOtGZOtwEr3t6FuhFDkRHL4DXhVeEJ
X-Proofpoint-ORIG-GUID: YVvOtGZOtwEr3t6FuhFDkRHL4DXhVeEJ

Drop microcode cache when load operation fails to update microcode.

Also make __apply_microcode_amd() return correct error.

v2:
- Copy stable on the first patch

Boris Ostrovsky (2):
  x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
  x86/microcode/AMD: Clean the cache if update did not load microcode

 arch/x86/kernel/cpu/microcode/amd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.5

