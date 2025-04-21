Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E9AD20C038
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:29:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231356; cv=none; b=OMQyIjOXDCle3dbiwqmldhK2bc6ujjCEe8eQFP2WgON6Jh5XwOhFlZ3nhl39qPbnMznnivJh5NFLDuUaKOuanMkL1fEGGX8O2TjUI4kyLsHwJFWJz7RXsOUNB3LDq61V1vaRiNIzhlrs57i8LV82n53taYZni8VAj/dzcQRZCKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231356; c=relaxed/simple;
	bh=NxT2z/be0WQ4SEAHjWAeDMh920sT/0xtV+KfkSRykfs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EJyDbbLIPgiuAEPfOwZLw5FPV9PlPGo6tFyNCHb7ZVXzsLszTl6oD9rCboMecq/hSt7xlTPUhibpuxl6l57XSfR06Dq7YxxmgT/KM/esSSuR+G2NrcyetTU1FHZTD69YpE/C1p6VeUHJBUGAEuQOPhwzyEkcOIk04V1f2u9h+UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=c+67RXue; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="c+67RXue"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA4Opr008043;
	Mon, 21 Apr 2025 10:28:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=L0xUgiFjBF9ckzvpFPtv32i8AsR73TYYMr2z5xC99
	YE=; b=c+67RXueBPDsUErB4DNy+mnHfbFsvwehEKesq+y/PPEeNWrfgVsryy8Yc
	jHjnhtL3X86G2B76PByUYOCcaabIgVtpuoopUkWhv1VlsS20uylTR4GYpoERFie1
	BAw5asegE0qopKe8Z6817qnfnRJhrsb3rbAfVrLmKDdlLA5JgyCGXr+j1fT8hHOZ
	BLnctUvxp5eGgFGb+hkDcj4NimUCWe0YRs+VpJSvNcyoEKbH6yuXQ18J1DZOlwPz
	LXml46oFc//cU/zur/Wkqyd0O6GaWauBUVq33UWMeYbpRttAkuNSq6c2wBU2gSqW
	nxDVx9Laat/B68ooVmtcD7KbfpXjA==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj82cf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:54 +0000 (GMT)
Received: from m0360083.ppops.net (m0360083.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 53LASstf023811;
	Mon, 21 Apr 2025 10:28:54 GMT
Received: from ppma13.dal12v.mail.ibm.com (dd.9e.1632.ip4.static.sl-reverse.com [50.22.158.221])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 465kxj82cd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:54 +0000 (GMT)
Received: from pps.filterd (ppma13.dal12v.mail.ibm.com [127.0.0.1])
	by ppma13.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 53L8UFkf001858;
	Mon, 21 Apr 2025 10:28:53 GMT
Received: from smtprelay02.fra02v.mail.ibm.com ([9.218.2.226])
	by ppma13.dal12v.mail.ibm.com (PPS) with ESMTPS id 464rcjwp69-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 21 Apr 2025 10:28:53 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay02.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 53LASnC837290416
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 21 Apr 2025 10:28:49 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BE53D20076;
	Mon, 21 Apr 2025 10:28:49 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 0227620073;
	Mon, 21 Apr 2025 10:28:48 +0000 (GMT)
Received: from li-7bb28a4c-2dab-11b2-a85c-887b5c60d769.in.ibm.com (unknown [9.109.215.252])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Mon, 21 Apr 2025 10:28:47 +0000 (GMT)
From: Shrikanth Hegde <sshegde@linux.ibm.com>
To: maddy@linux.ibm.com, linuxppc-dev@lists.ozlabs.org
Cc: npiggin@gmail.com, christophe.leroy@csgroup.eu, sshegde@linux.ibm.com,
        gautam@linux.ibm.com, vaibhav@linux.ibm.com, bigeasy@linutronix.de,
        linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] powerpc: kvm: generic framework and run posix timers in task context
Date: Mon, 21 Apr 2025 15:58:35 +0530
Message-ID: <20250421102837.78515-1-sshegde@linux.ibm.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: e062lehdojYXH920C7zR7zRas0Puc7uv
X-Proofpoint-ORIG-GUID: qJ84MpjFxkvipmNnJenQY64OzvN8LPYy
X-Authority-Analysis: v=2.4 cv=HLDDFptv c=1 sm=1 tr=0 ts=68061de6 cx=c_pps a=AfN7/Ok6k8XGzOShvHwTGQ==:117 a=AfN7/Ok6k8XGzOShvHwTGQ==:17 a=XR8D0OoHHMoA:10 a=VnNF1IyMAAAA:8 a=4hYohHL7dauzwWFtQuwA:9 a=ZXulRonScM0A:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 suspectscore=0
 mlxlogscore=887 mlxscore=0 lowpriorityscore=0 clxscore=1015
 impostorscore=0 adultscore=0 spamscore=0 phishscore=0 bulkscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210077

From: Gautam Menghani <gautam@linux.ibm.com>

This is an effort to use the generic kvm infra which handles check for 
need_resched, handling signals etc. i.e xfer_to_guest_mode_handle_work. 

kvm guests boots and runs stress-ng CPU stressor on PowerVM and on PowerNV. 
preempt=full and preempt=lazy was tested on PowerNV and in both cases the
KVM guest boots and runs stress-ng CPU stressor.

Please let me know if any specific testing to be done.  

Kept the patches separate since they differ functionally, but kept them
is a series since 2nd patch depends on functionality of 1st. Also this
could help in git bisect.  

This is based on tip/master

Shrikanth Hegde (2):
  powerpc: kvm: use generic transfer to guest mode work
  powerpc: enable to run posix cpu timers in task context

 arch/powerpc/Kconfig         |  2 ++
 arch/powerpc/kvm/book3s_hv.c | 13 +++++++------
 arch/powerpc/kvm/powerpc.c   | 22 ++++++++--------------
 3 files changed, 17 insertions(+), 20 deletions(-)

-- 
2.48.1

