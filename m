Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D426217C220
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 21:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743109436; cv=none; b=Rima4+qU5VmxVsvGiht02vJ1gIZnWZL2tBGYKR5SWHLDd/p2da+DmI17eRx1O2evia6MGWIPRW8jZSAcr6SHZf73i622EI9a9CpK9uHK/pEjrAJ5mU0czbV5plB9m5GS9ocVIEF1Q7pBSthtbzHAKxfRoy0WEKFaF4yWWqt4Eug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743109436; c=relaxed/simple;
	bh=u7ZDKvtT4hs1CYe7KiMi83zvkdUdVvfFErbJM6pAGXc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LB0cVM6bnwA3PxPvQIVW+q0nFVg3wJcSAN0TnQM6x/L5XAx1xQ626t85Q2kVOKG/dzanvx0RA1vGwWx4OyHF+EKKiYhwHHuXIZiNdvrmW9/kNVu4N02IABNoRsZPabtuzEo7bBrCBEkNMRpWuIhRW3UwkG57TXDhHgQZD0kuU08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fOGjGjfP; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fOGjGjfP"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52RJtwOj012361;
	Thu, 27 Mar 2025 21:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2023-11-20; bh=j3Njc
	Gv1JSYvnCYGX3BdR9Mcr/HGCCCZbFP4dwVX9Vc=; b=fOGjGjfPklZStWGtSlKfj
	q9TXMVltCI+UwFpo0qf3B7Jp6bUC9uasu/K8Qqdwd3ae4Bol/o5VjRiaYDojc5np
	KgRKlTwPZr2q1M/asVUrVl7fauq14ggYrDrMaBRXize5kowIGlrVyT2QZiyiFt3A
	gr8l8p3QFQDp3J42swcqGDYBliy+NbP91KY/AZshhyTLKHFRML46k8N9fV4lW+7/
	HwqyIlwwEV40inpaIgZMG7iMTCgvuaFgd4ABBdGH1o8L+fhnrxR4aGxkIpMxB2mW
	c/QS8v7Be0gajN6tDZUd083VoT9w321P6QYRwTUZpMvzRFrc9FSbhRzz83k/v9RD
	w==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45hnd6dgc9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 27 Mar 2025 21:03:29 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 52RKeCfq022884;
	Thu, 27 Mar 2025 21:03:28 GMT
Received: from bostrovs-home.us.oracle.com (bostrovs-home.allregionaliads.osdevelopmeniad.oraclevcn.com [100.100.254.198])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 45jjch6mpa-3;
	Thu, 27 Mar 2025 21:03:28 +0000
From: Boris Ostrovsky <boris.ostrovsky@oracle.com>
To: linux-kernel@vger.kernel.org
Cc: bp@alien8.de, tglx@linutronix.de, mingo@redhat.com,
        dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com
Subject: [PATCH 2/2] x86/microcode/AMD: Clean the cache if update did not load microcode
Date: Thu, 27 Mar 2025 17:03:05 -0400
Message-ID: <20250327210305.1694664-3-boris.ostrovsky@oracle.com>
X-Mailer: git-send-email 2.43.5
In-Reply-To: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
References: <20250327210305.1694664-1-boris.ostrovsky@oracle.com>
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
 adultscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2503270142
X-Proofpoint-ORIG-GUID: orSzZ4EvI3ArfKYVJyrSx0iNHudwmfDJ
X-Proofpoint-GUID: orSzZ4EvI3ArfKYVJyrSx0iNHudwmfDJ

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

