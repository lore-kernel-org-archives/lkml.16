Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42151624C2
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109435; cv=none; b=Lvn8xmYThourn2Yy/Fc793/uyoYEqiks8rR/usM0XtSLDSH570J/TZoviy4Lzvym9ctlwn+XC/b7CWOCFqC2LXapBz18x8yL5nfNul3B06/mL6FLGHWZMyzpYAXARxlxPuFjnDfemhnmO8mLT1b1SgiozSbZxstTDFL4iB0y3+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109435; c=relaxed/simple;
	bh=SldcgiPsOXZKQeDteAaACfja3TzGxDWHfGck/q0lfT4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WA37ieFhHlBoHs3H7boCpTg5QiDxIWIptCJAWsIxWTmGh2QdN1r4xQQz0EZteMTMOn82j5KIxTLPqsOq7ud8FeNomt7oIZb3M03kuZCnNpXxExGOoADoJ6E3tT8LOkPurtOzGtomJJBFznpVUZRaWYfM8rrO3xx91P6jmeRXtOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=n0KCurXx; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="n0KCurXx"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RJtwEK012355;
	Thu, 27 Mar 2025 21:03:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2023-11-20; bh=vXcExucxMeE2W2W40F3zoCxuAaNbp
	RBOz0l0+00HEq4=; b=n0KCurXxNpseCGXZBcd+BL9E2ErgzqLa5Jw8mOtT/MI9C
	f8w3v8IaeVTk95BQGUTttnkzWrvrN8948Ib1WU8VMX6jQcMBSuPaLnQXaYhTawbb
	+qapq+BJSC4XyyCqGGGqVIguUdCbRoU+WbvxQToTaA3QXS6VHxBN6kFMPmVtqbwk
	YAr6xGRIqUTqDM+vALE6PK2QjqEy0pK4LmQmjV2enpdUXGoHl5IlTYQ9rt4Z0bUu
	5ClgCweVcc+rW/sXrzMDhbCCvVTv6y92NP+M5bhyRNEOVYZ7cwOwNLbhcy1yiv6l
	wage/qpaQJst/LOMicq5lY4ZwNjAUwC/BjlPDkMyw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hnd6dgc5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 21:03:28 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52RKeCfn022884;
	Thu, 27 Mar 2025 21:03:27 GMT
Received: from bostrovs-home.us.oracle.com (bostrovs-home.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.198])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jjch6mpa-1;
	Thu, 27 Mar 2025 21:03:27 +0000
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: bp@alien8.de, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Subject: [PATCH 0/2] Clear AMD's microcode cache on load failure
Date: Thu, 27 Mar 2025 17:03:03 -0400
Message-ID: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
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
 definitions=2025-03-27_04,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=799 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270142
X-Proofpoint-ORIG-GUID: txihwyVDAcZfwlU6f167oXMJBLYwt8Ic
X-Proofpoint-GUID: txihwyVDAcZfwlU6f167oXMJBLYwt8Ic

Drop microcode cache when load operation fails to update microcode.

Also make __apply_microcode_amd() return correct error.

Boris Ostrovsky (2):
  x86/microcode/AMD: Fix __apply_microcode_amd()'s return value
  x86/microcode/AMD: Clean the cache if update did not load microcode

 arch/x86/kernel/cpu/microcode/amd.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

-- 
2.43.5

