Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF4F1990A7
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 08:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748419344; cv=none; b=ekdVuvgDcQqgaaMpni74UdgTi+Q12nC6IrjZ3T9o8KSmFKxk7I3rSiqpT6NqY1j5CHa1YMruYBT2ROfinxDUTel2d1AygTofnAq8AhjVuVR+sNosuorGGQ1qjnDLN5Q3f6qRrGw2zWSoKCDSjZRQKcrZJ2L96b9Lz4v4vVd1N7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748419344; c=relaxed/simple;
	bh=j33UOVfCtP+OBLlWoSq7L3BIIjfPLyhaksFfIeuR9wM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=NRhYEW7AS/0878SfVKTOzSsNetsPkwUWQwdjPKfLKTGJ5YMzgYTWipDdAdXOqTUYmlYCM6wUEsjiYS3blSm3cVQqBfwIDFKU0ZPZcqrjS/AoMspyJTGWm9n/LVTvZnSxRbymv57ST91As6qS3mnCvZgPlmwxcJ6hr31RCT41rXc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Lzh+O3CL; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Lzh+O3CL"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54S0LQnu005029;
	Wed, 28 May 2025 08:02:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=aDNoI7l2gVyFTt1uPUySpwZBuVpBknjRexryaYxPI
	Oo=; b=Lzh+O3CLLRbdDrVpWxvRdChTiSFRBmNUkMqrWYeFwJTCDT2PbCHVbWZ8e
	9yTQ93bkNJTDeqfsUMI3J0mP0ru4wocdlQoso1GwStpW1eKMvrc+xN9mRqVajIoD
	5xg6/rGGRC6X7wgdinPgIkmWtD0j6O/EYWWMBITf6NAlkHy5h7q+sJM0t/AkT2ei
	2vfds/cZhyBAI30OcdPRKSZp+yL9YeKao4vLUtVPCY9Rv2s9n2FDeWLqnx74nRy/
	FKtJOB+kFimgj7xL4WAqVALWb53gBgPkqoPBBurYlYyaTI23ids2A5uclK1C9NNW
	34iwae9kPvaIUUPdsXtNxrTg0dLFA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3jbu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:01:59 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 54S81xxi021733;
	Wed, 28 May 2025 08:01:59 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46wgsj3jb9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:01:59 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54S6FGP9021349;
	Wed, 28 May 2025 08:01:51 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 46utnmpbp2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 28 May 2025 08:01:51 +0000
Received: from smtpav04.fra02v.mail.ibm.com (smtpav04.fra02v.mail.ibm.com [10.20.54.103])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54S81mq033161680
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 28 May 2025 08:01:48 GMT
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id F31452004E;
	Wed, 28 May 2025 08:01:47 +0000 (GMT)
Received: from smtpav04.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id C85DF2004D;
	Wed, 28 May 2025 08:01:45 +0000 (GMT)
Received: from li-e1dea04c-3555-11b2-a85c-f57333552245.ibm.com.com (unknown [9.39.16.188])
	by smtpav04.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Wed, 28 May 2025 08:01:45 +0000 (GMT)
From: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
To: linux-kernel@vger.kernel.org
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com,
        christophe.leroy@csgroup.eu, arnd@arndb.de, jk@ozlabs.org,
        segher@kernel.crashing.org, mchauras@linux.ibm.com,
        linuxppc-dev@lists.ozlabs.org
Subject: [PATCH] powerpc: Fixing typo in comment
Date: Wed, 28 May 2025 13:30:52 +0530
Message-ID: <20250528080051.1351779-2-mchauras@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=IcmHWXqa c=1 sm=1 tr=0 ts=6836c2f7 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=8gZw5ORUxxO3s-nOcEQA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI4MDA2OCBTYWx0ZWRfX6Zbl3gEU7qly HmOkeo5f68AI4NExUN+Yv37CQWrZtOc8iEdMiqIDk1FWCLA1whVwLSyiJx8PNpc8+i+VMT6rbDe tvQgkKu67yz1Sb6yCfbbE+6gRyiQaxwtIQhUq8329wEwe5TF38RZ96Pz48kYjXV4s65hphYPFv7
 HRCPnbyEG/LRsAbFxyNfVsevylJWSCbMZH7Q9vOgqTGUl+wgtii+Kl8o3oF3ZMPpIdPLnT+YSoE Y8sfh6581GN78lfT8mlWM6Jq/zewq3ss3Togzh6g5P44MIjgv9Id+NSVVBxd6pZto4dDFaR5KOO BXpjbJPoYmf6U1LvVI5bA/Yc4YJV2VNr43xDgl/zz53FMYHhZ6L4ARBNYc1+4EeJl4LZd2LQLum
 zIg8NuloAm5d3+SPwMsaFCijOaT1EF35Qo5ZLrOp5uxviNfGtkZh3ZUlaEamhAbpGU8TRwr/
X-Proofpoint-ORIG-GUID: yNZlvGQnOUJ6IprvLClb59YNjDANaIwP
X-Proofpoint-GUID: G01uFiV0ldAuktpyn0RK6Jn7Yi0IyIVJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-28_04,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 priorityscore=1501 mlxscore=0 phishscore=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 mlxlogscore=547 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505280068

fixing a typo where iff is supposed to be if.

Signed-off-by: Mukesh Kumar Chaurasiya <mchauras@linux.ibm.com>
---
 arch/powerpc/kernel/exceptions-64s.S | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/kernel/exceptions-64s.S b/arch/powerpc/kernel/exceptions-64s.S
index b7229430ca94..53667dc7fe1a 100644
--- a/arch/powerpc/kernel/exceptions-64s.S
+++ b/arch/powerpc/kernel/exceptions-64s.S
@@ -393,7 +393,7 @@ DEFINE_FIXED_SYMBOL(\name\()_common_real, text)
 	.endif
 
 	ld	r10,PACAKMSR(r13)	/* get MSR value for kernel */
-	/* MSR[RI] is clear iff using SRR regs */
+	/* MSR[RI] is clear if using SRR regs */
 	.if IHSRR_IF_HVMODE
 	BEGIN_FTR_SECTION
 	xori	r10,r10,MSR_RI
-- 
2.49.0

