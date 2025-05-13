Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C8EB12CD96
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 16:40:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747154416; cv=none; b=Je6SI6bJ4/fkwDzLXNP6oVI3qPkVxb8gFKR+kZGEiDd2FlKsnxcP1PaiM/eL36rB8YYF/FsGChsPQ1IiwPEe4vQGKfWh1RevDBxzWGEPWXjZvbszQecq4/RbMgMHvXyJYOYWoZ1xGn+y0NYPIagpwvsaP1cVqmnwj3SxtgWlT64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747154416; c=relaxed/simple;
	bh=t8s4LlADrong56MlLY9Ro5ipz1ZWGzMxHsCJyavnHKY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=sFRsF7q1xkT0SjyCjfxb/MW1q5UnDpTTZ2qEjjyCmLoOTi5oKgmax5hqzgZJsTuSNQ3ExwNOoV5M1UlXfRMw7lp9zrNrJYCJSXKetq8IrVswOxh68ArJ+5/H/jrqsFOpwZcRUzyWPE7Mt+Oc4wu5WJ8xE2hRiLUMN8Qodj1MAmU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=EpvWxgeA; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="EpvWxgeA"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54DDnTbu031932;
	Tue, 13 May 2025 16:39:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=9zkEZlz6iaOShx92FbCpKeW7/yGm+3aiYj4NIkO1L
	qk=; b=EpvWxgeA8Iw4zKWQHbCVF2IfKb8Mx8jSc1qNt8CJ81dEP1iIjBrjed0/T
	z7QY2y6JIp0IptsMDmijsbcf2EyFW7x+jQchu+nxO055YqKZia/h9Mh2aPNru7i4
	2KrYuOs1EVm3Mt/K5davy8y0p754OSCnWeMfC2kYpaisGCf0/DlOyKTj+rGT2Y69
	Ny6/z7GCN4TBTtlzDX0e7+m0Lhorx80AzZZZ+0bRUn1Z5kSbDtM5VnEvYzA63huB
	Ah2DX7m6KUq9j2i4gEKnTdrF1bnEWodsLAf3kaRLXfWA98xd897+xlzR+pDim9Yf
	lNYEYrcdJssCLzFXipgHECfInnGfw==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 46m7a70trc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 16:39:59 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 54DENFDo024437;
	Tue, 13 May 2025 16:39:58 GMT
Received: from smtprelay03.fra02v.mail.ibm.com ([9.218.2.224])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 46jjmm3vw3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 13 May 2025 16:39:58 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay03.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 54DGdu0f57868698
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 13 May 2025 16:39:56 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 8F12620160;
	Tue, 13 May 2025 16:39:56 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 37BC72015F;
	Tue, 13 May 2025 16:39:55 +0000 (GMT)
Received: from vishalc-ibm.ibm.com (unknown [9.124.211.212])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Tue, 13 May 2025 16:39:54 +0000 (GMT)
From: Vishal Chourasia <vishalc@linux.ibm.com>
To: tglx@linutronix.de, peterz@infradead.org, linux-kernel@vger.kernel.org
Cc: Vishal Chourasia <vishalc@linux.ibm.com>
Subject: [PATCH] kernel/cpu: fix comment typo
Date: Tue, 13 May 2025 22:09:42 +0530
Message-ID: <20250513163941.261240-2-vishalc@linux.ibm.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=K8ciHzWI c=1 sm=1 tr=0 ts=682375df cx=c_pps a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17 a=dt9VzEwgFbYA:10 a=VnNF1IyMAAAA:8 a=1gxIP76fRNyjLo5ydUMA:9
X-Proofpoint-GUID: Lt4Dph4VTPXHd4k4gxzLts_oB8dH25Dq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDE1OCBTYWx0ZWRfXxl2+9M5OVIwN JQBXT2bgjW6V/+p1BQ/gO5o3dht3rpTEs/UlSKwgplffBK67TtKvBQ+cJRVTURkbz70MmbVyDma q1p0bujjWL6OVV1Hzymj8t5NgeaT7wyndqwgfFWgIDAQVnYx1kp7d0kGcA+xqI3RVD4ZZho8401
 ZJu1eKtLMknG1aMPthlJTlDt42C8iGsLqrBdrcMxqJdDrkNo9LwuJL7O3dBBHAjZGuPAj1XZ6bk KX1FbdF0ug6eGKrwpeTaU1yPWWEuzJ3/h8fWWyngIUlwHYpuOOtQd+WYKRjG6L7OLfWHw/fD8A2 U5DKGCoq3tESs/9JAs5dZ/mmS6MBgeAVKb8SCF3Xsr07paK4T7T8QeJc60ENE/5tonE2OIzjpIO
 XHl6LYiuPo2ib3L+mh9+o8NzTwXuRVlIKewY7ZJooSUOWt1p1ykiy1F79JyvvNaEysUSqBr/
X-Proofpoint-ORIG-GUID: Lt4Dph4VTPXHd4k4gxzLts_oB8dH25Dq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-13_03,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 bulkscore=0 suspectscore=0 spamscore=0 clxscore=1011
 lowpriorityscore=0 mlxscore=0 priorityscore=1501 mlxlogscore=838
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130158

s/Archicture/Architecture

Signed-off-by: Vishal Chourasia <vishalc@linux.ibm.com>
---
 kernel/cpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/cpu.c b/kernel/cpu.c
index b08bb34b1718..ff9d0b5313d2 100644
--- a/kernel/cpu.c
+++ b/kernel/cpu.c
@@ -656,7 +656,7 @@ static int __init smt_cmdline_disable(char *str)
 early_param("nosmt", smt_cmdline_disable);
 
 /*
- * For Archicture supporting partial SMT states check if the thread is allowed.
+ * For Architecture supporting partial SMT states check if the thread is allowed.
  * Otherwise this has already been checked through cpu_smt_max_threads when
  * setting the SMT level.
  */
-- 
2.49.0

