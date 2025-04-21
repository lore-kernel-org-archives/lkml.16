Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 388F625745A
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 07:07:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745219262; cv=none; b=ro9It1H6kcyUsdczYU/ikI1P/JL/LGyur36np3G5X6LaFYO/A5pzcLV6OEvsCBa/IFDBxr69hJSItVTYYJ0GBTOqs0uugSKXMXCc+7pzTrc1eEFk0AQ4lyOvWjBdns3z8TnqgQZ2mdHqPb/6Pq/22DAAYkCJFrPCLPadLJCsM/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745219262; c=relaxed/simple;
	bh=3Zrf3MUKlqum689zYYNEZaYnvzivASMfkIw+Gkr2k48=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=F9jd3ZVCUq2OqkbTcfuj1kTc9Xjcffh/iLPeGC4MjR2tI+WuvbVKEqksnXtkwbEfc4umdRbF03V5zO/a6LavveuDv9O42qU9YR6JPkpqUt2x4D0WBC/B+j4DazlHIWJION28KpynJNCczbgHu0KoimyWHrgYqobXEke+KKP3i4U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=il3oWtAL; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="il3oWtAL"
Received: from pps.filterd (m0356517.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KLd6he027485;
	Mon, 21 Apr 2025 07:07:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=V3Vko/gqq96uGLnxOadA3hVwMtgUOy61nIWLzv9Ba
	5E=; b=il3oWtALznZ14bggatK49DkuhtnGphoJmsrnal0c7I5fweqmAn9gMiuB3
	0Aivhtb/0hEaf9z26OZh20XCprjdx0InXeYcxBO5DZKPi0+L3U2lmZa+ZbA6p1+O
	nYSkOUJZ0cNITEENiEI+Z5HJIus3jPkpC+hPSLu8mIRecrOkfCDIvruGRP7BV8Lf
	iDxz0HMZK09Ny+d3C4dFNQaW905xIkqGOo8I7QXSmxILaZ3AdKMptKA+AmqIY8GW
	poV7STL69+IAC8QB43ai/F4AJsJTo4bERqDdi2CAvQUK6jQIB4CGPsbShuoeFtEc
	qe0s/YHDw2CyiiKWaIOSs7+Wmu7tw==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4659189ngt-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:07:26 +0000 (GMT)
Received: from m0356517.ppops.net (m0356517.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53L765OD012535;
	Mon, 21 Apr 2025 07:07:26 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4659189ngn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:07:26 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L6hlZL012501;
	Mon, 21 Apr 2025 07:07:25 GMT
Received: from smtprelay06.fra02v.mail.ibm.com ([9.218.2.230])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 464p5swen8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 07:07:25 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay06.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53L77LsZ11141484
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 07:07:21 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 73C6C20040;
	Mon, 21 Apr 2025 07:07:21 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C12F22004B;
	Mon, 21 Apr 2025 07:07:19 +0000 (GMT)
Received: from li-c18b6acc-24ee-11b2-a85c-81492619bda1.in.ibm.com (unknown [9.109.215.55])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 07:07:19 +0000 (GMT)
From: Aboorva Devarajan <aboorvad@linux.ibm.com>
To: Madhavan Srinivasan <maddy@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org
Cc: Mahesh Salgaonkar <mahesh@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Naveen N Rao <naveen@kernel.org>,
        Aboorva Devarajan <aboorvad@linux.ibm.com>,
        linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc/powernv: Enable CPU idle state detection for POWER11
Date: Mon, 21 Apr 2025 12:37:18 +0530
Message-ID: <20250421070718.162783-1-aboorvad@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-ORIG-GUID: zWZOhs00BzUS4BZRYKdvKgGvp-tmEVLW
X-Authority-Analysis: v=2.4 cv=Qt9e3Uyd c=1 sm=1 tr=0 ts=6805eeae cx=c_pps a=bLidbwmWQ0KltjZqbj+ezA==:117 a=bLidbwmWQ0KltjZqbj+ezA==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=zskvb_C41MTQKxbhWUoA:9
X-Proofpoint-GUID: UHVJovQ_T7rk6GA8cGISLu1oDKesZ5aQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_03,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0 bulkscore=0
 lowpriorityscore=0 phishscore=0 adultscore=0 clxscore=1011 mlxlogscore=999
 suspectscore=0 priorityscore=1501 spamscore=0 malwarescore=0 mlxscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210053

Extend idle state detection to POWER11 by updating the PVR check.
This ensures POWER11 correctly recognizes supported stop states,
similar to POWER9 and POWER10.

Reviewed-by: Mahesh Salgaonkar <mahesh@linux.ibm.com>
Signed-off-by: Aboorva Devarajan <aboorvad@linux.ibm.com>

---

Without Patch: (Power11 - PowerNV systems)

CPUidle driver: powernv_idle
CPUidle governor: menu
analyzing CPU 927:

Number of idle states: 1
Available idle states: snooze
snooze:
Flags/Description: snooze
Latency: 0
Usage: 251631
Duration: 207497715900

With Patch: (Power11 - PowerNV systems)

CPUidle driver: powernv_idle
CPUidle governor: menu
analyzing CPU 959:

Number of idle states: 4
Available idle states: snooze stop0_lite stop0 stop3
snooze:
Flags/Description: snooze
Latency: 0
Usage: 2
Duration: 33
stop0_lite:
Flags/Description: stop0_lite
Latency: 1
Usage: 1
Duration: 52
stop0:
Flags/Description: stop0
Latency: 10
Usage: 13
Duration: 1920
stop3:
Flags/Description: stop3
Latency: 45
Usage: 381
Duration: 21638478


 arch/powerpc/platforms/powernv/idle.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/arch/powerpc/platforms/powernv/idle.c b/arch/powerpc/platforms/powernv/idle.c
index d98b933e4984..10f4d7d5eb44 100644
--- a/arch/powerpc/platforms/powernv/idle.c
+++ b/arch/powerpc/platforms/powernv/idle.c
@@ -1171,8 +1171,8 @@ static void __init pnv_arch300_idle_init(void)
 	u64 max_residency_ns = 0;
 	int i;
 
-	/* stop is not really architected, we only have p9,p10 drivers */
-	if (!pvr_version_is(PVR_POWER10) && !pvr_version_is(PVR_POWER9))
+	/* stop is not really architected, we only have p9,p10 and p11 drivers */
+	if (!(PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER9))
 		return;
 
 	/*
@@ -1189,8 +1189,8 @@ static void __init pnv_arch300_idle_init(void)
 		struct pnv_idle_states_t *state = &pnv_idle_states[i];
 		u64 psscr_rl = state->psscr_val & PSSCR_RL_MASK;
 
-		/* No deep loss driver implemented for POWER10 yet */
-		if (pvr_version_is(PVR_POWER10) &&
+		/* No deep loss driver implemented for POWER10 and POWER11 yet */
+		if ((PVR_VER(mfspr(SPRN_PVR)) >= PVR_POWER10) &&
 				state->flags & (OPAL_PM_TIMEBASE_STOP|OPAL_PM_LOSE_FULL_CONTEXT))
 			continue;
 
-- 
2.49.0

