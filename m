Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3FEE1E1E0A
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 23:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743116737; cv=none; b=uz9GuA767UIJ28ReXUyRO/RWrSY8tJIqWCeB5v/rRcIjM42OUiodTiRdRYn/R5F5sC7MwGo6ZxhRK5rDp+l3o4HO0bnEBoCjxcL/oPUMeSyrYBAurQZGJQhJ41LpxBocZ66pRDcc3qRpKgZueyb5LwkerMzMIQZowfsoVTm6cd4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743116737; c=relaxed/simple;
	bh=u7ZDKvtT4hs1CYe7KiMi83zvkdUdVvfFErbJM6pAGXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SfGNITjABGpHJtAAzaHq3A8z2nfE5TUbzOVoUHaUFTrl+ka4THP6cFz17QBcoLC+rrduadMFbM0H5YesA9faX+phlAWAwJJIJIp6uV3HmuA3ndJver3a1AKzgCJbqAZXbGirnNx9OY0aAqrGiA6jU+osj3r2wQMHZQa/Rat8UDM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=kEX+jo99; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="kEX+jo99"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RLNN9h010442;
	Thu, 27 Mar 2025 23:05:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=j3Njc
	Gv1JSYvnCYGX3BdR9Mcr/HGCCCZbFP4dwVX9Vc=; b=kEX+jo998x110sH+nhO0n
	2CbwpHv9jkUWf/AK+HjOYL+fQPJImQKcP8kmuG9Vcl8HpuVR3liyqMxMMfg0cZWN
	nmN8mFEMMn79m6N4dFzwoCH6DVbMQyHqtrcxw/WCEwqKI83XNMCUsqLH8popC97y
	K2UD/vH9FcAT6Xlt5bJSd92nsJ/oKbgT8Gup1Pibeg/mlwGoEtbrkWKiM6q1C3Sw
	MHDo0MORHKqOeOodd79TlfpyUmKqt88vOhTwdMmMRgQz2LgbKQF94b9XufUVKQBq
	lmbOqmjbJJhsDmInrZiUMDLcwg/EP5EUMK7J2+0qRIxYFYjSm87T8BuyQ+w3Hjip
	Q==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hn875nd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 23:05:25 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52RLwVrq022844;
	Thu, 27 Mar 2025 23:05:24 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45jjcha7wj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 23:05:24 +0000
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 52RN5HQZ033345;
	Thu, 27 Mar 2025 23:05:23 GMT
Received: from bostrovs-home.us.oracle.com (bostrovs-home.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.198])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jjcha7sa-3;
	Thu, 27 Mar 2025 23:05:23 +0000
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: bp@alien8.de, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com,
        Boris Ostrovsky <boris.ostrovsky@oracle.com>
Subject: [PATCH v2 2/2] x86/microcode/AMD: Clean the cache if update did not load microcode
Date: Thu, 27 Mar 2025 19:05:03 -0400
Message-ID: <20250327230503.1850368-3-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250327230503.1850368-1-boris.ostrovsky@oracle.com>
References: <20250327230503.1850368-1-boris.ostrovsky@oracle.com>
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
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270156
X-Proofpoint-GUID: CUcefQI1OGRO47q26K8P7GSoeQBLjty7
X-Proofpoint-ORIG-GUID: CUcefQI1OGRO47q26K8P7GSoeQBLjty7

If microcode did not get loaded there is no reason to keep it in the cache.
Moreover, if loading failed it will not be possible to load an earlier
version of microcode since failed version will always be selected from
the cache on next reload attempt.

Since failed version is not easily avaialble at this point just clean the
whole cache. It will be rebuilt later if needed.

Signed-off-by: Boris Ostrovsky <boris.ostrovsky@oracle.com>
---
 arch/x86/kernel/cpu/microcode/amd.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/arch/x86/kernel/cpu/microcode/amd.c b/arch/x86/kernel/cpu/microcode/amd.c
index b61028cf5c8a..57bd61f9c69b 100644
--- a/arch/x86/kernel/cpu/microcode/amd.c
+++ b/arch/x86/kernel/cpu/microcode/amd.c
@@ -1171,11 +1171,18 @@ static void microcode_fini_cpu_amd(int cpu)
 	uci->mc = NULL;
 }
 
+static void finalize_late_load_amd(int result)
+{
+	if (result)
+		cleanup();
+}
+
 static struct microcode_ops microcode_amd_ops = {
 	.request_microcode_fw	= request_microcode_amd,
 	.collect_cpu_info	= collect_cpu_info_amd,
 	.apply_microcode	= apply_microcode_amd,
 	.microcode_fini_cpu	= microcode_fini_cpu_amd,
+	.finalize_late_load	= finalize_late_load_amd,
 	.nmi_safe		= true,
 };
 
-- 
2.43.5

