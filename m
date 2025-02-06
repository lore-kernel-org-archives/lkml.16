Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACD1B22331F
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 10:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738836631; cv=none; b=aQZC/AVXmZV3XdeIzvEAu2MKns2S7H46shhTUxCw8qVgobtD+CDZI2OheQzqWLso1d0zNuMZTBON+zZJV4/0+5AcqvTcL3L0WbTH5lVhgtI8wynz4HvCvzxeNBWfIRz5rf2EINkn/ASBL5YqIOa9D6KPqSv3T+In8fUO7OlVCtI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738836631; c=relaxed/simple;
	bh=8f8034OL+cutSRceHZhMdda+h+5yVL61It9YemNpLfk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N9lmJqYj8v/xeGjuh7F6isar0YfCeLwqffZUkmLr36zBMaabsI6E+Mt5PkRHgO5J3kXSR2Jley4zKaoVmXCjeamnjzP9OMqEIpsRGXdowbIsVysbMnQUFwaNgceExu5kXsvyy1J9ZJlocBPGl3FdDtf6itakArHxHDeBaR0zTAM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=iTA7Vug/; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="iTA7Vug/"
Received: from pps.filterd (m0360072.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5167WkSv005463;
	Thu, 6 Feb 2025 10:10:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=BKe363xUYdTGSVnLtLxWIoU4LNfPlnwqtWO22Dr3y
	mo=; b=iTA7Vug/CC3rO2oOXdwjqHqu4z5sf185vohHhj8x0RNCoc5QCdpBYxydD
	ZCXgvnZ4c9QMj3AXdBsc3IcyVc7jkZ3BXpEw7jCaMwb9E5yVSow4R3QOwyRANP69
	Z/i2I2lnLXObE/LwVrO2kOKK6ThZrSF2YMt0o948/xxdc4Djg/iV1o0oB2Gmb3rs
	2B45lgNo3Ilk9TzEw7g3ccZTtTbQw+1V0jZbTgu6SgqAYHKcbS3Y9/yHeYvgW9DB
	iaKFWKpdG26l0o1zPTAPAzzFICSrIBCqmXwKTcEJII5uInTm8mLIWfLbs8JRSF5C
	2W76XOCvp/AcDsF4VWPU1GssK6Q1Q==
Received: from pps.reinject (localhost [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mrsp0pxp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 10:10:06 +0000 (GMT)
Received: from m0360072.ppops.net (m0360072.ppops.net [127.0.0.1])
	by pps.reinject (8.18.0.8/8.18.0.8) with ESMTP id 5169tPLC031332;
	Thu, 6 Feb 2025 10:10:05 GMT
Received: from ppma12.dal12v.mail.ibm.com (dc.9e.1632.ip4.static.sl-reverse.com [50.22.158.220])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 44mrsp0pxh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 10:10:05 +0000 (GMT)
Received: from pps.filterd (ppma12.dal12v.mail.ibm.com [127.0.0.1])
	by ppma12.dal12v.mail.ibm.com (8.18.1.2/8.18.1.2) with ESMTP id 5166hIfF016288;
	Thu, 6 Feb 2025 10:10:05 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma12.dal12v.mail.ibm.com (PPS) with ESMTPS id 44hwxsnv8t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 06 Feb 2025 10:10:05 +0000
Received: from smtpav01.fra02v.mail.ibm.com (smtpav01.fra02v.mail.ibm.com [10.20.54.100])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 516AA1ME58327340
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 6 Feb 2025 10:10:01 GMT
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9873920043;
	Thu,  6 Feb 2025 10:10:01 +0000 (GMT)
Received: from smtpav01.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 1FB5F20040;
	Thu,  6 Feb 2025 10:09:59 +0000 (GMT)
Received: from li-c6426e4c-27cf-11b2-a85c-95d65bc0de0e.in.ibm.com (unknown [9.204.206.66])
	by smtpav01.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu,  6 Feb 2025 10:09:58 +0000 (GMT)
From: Gautam Menghani <gautam@linux.ibm.com>
To: mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
        naveen@kernel.org, maddy@linux.ibm.com, clg@kaod.org,
        brking@linux.vnet.ibm.com, vaibhav@linux.ibm.com
Cc: Gautam Menghani <gautam@linux.ibm.com>, linuxppc-dev@lists.ozlabs.org,
        linux-kernel@vger.kernel.org
Subject: [RFC PATCH] powerpc/pseries/msi: Avoid reading PCI device registers in reduced power state
Date: Thu,  6 Feb 2025 15:39:53 +0530
Message-ID: <20250206100956.438888-1-gautam@linux.ibm.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: RygOwVXffmHk1_hoB5psPTYDI9SMW8yq
X-Proofpoint-ORIG-GUID: v-t-pT3qbGANSnVigATCvmLFtqgu-MX5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-06_02,2025-02-05_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 impostorscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 adultscore=0
 spamscore=0 phishscore=0 priorityscore=1501 mlxlogscore=828 clxscore=1011
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.19.0-2501170000
 definitions=main-2502060082

When a system is being suspended to RAM, the PCI devices are also
suspended and the code ends up calling pseries_msi_compose_msg() and this
triggers the BUG_ON() in __pci_read_msi_msg() because the device at that
point is in reduced power state. In reduced power state, the memory
mapped registers of the device are not accessible.

To replicate the bug:
1. Make sure deep sleep is selected
	# cat /sys/power/mem_sleep
	s2idle [deep]

2. Suspend the system
	echo mem > /sys/power/state

To fix this behaviour, read the cached msi message of the device when the
device is not in PCI_D0 power state instead of touching the hardware.

Fixes: a5f3d2c17b07 ("powerpc/pseries/pci: Add MSI domains")
Signed-off-by: Gautam Menghani <gautam@linux.ibm.com>
---
 arch/powerpc/platforms/pseries/msi.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/pseries/msi.c b/arch/powerpc/platforms/pseries/msi.c
index fdc2f7f38dc9..458d95c8c755 100644
--- a/arch/powerpc/platforms/pseries/msi.c
+++ b/arch/powerpc/platforms/pseries/msi.c
@@ -525,7 +525,12 @@ static struct msi_domain_info pseries_msi_domain_info = {
 
 static void pseries_msi_compose_msg(struct irq_data *data, struct msi_msg *msg)
 {
-	__pci_read_msi_msg(irq_data_get_msi_desc(data), msg);
+	struct pci_dev *dev = msi_desc_to_pci_dev(irq_data_get_msi_desc(data));
+
+	if (dev->current_state == PCI_D0)
+		__pci_read_msi_msg(irq_data_get_msi_desc(data), msg);
+	else
+		get_cached_msi_msg(data->irq, msg);
 }
 
 static struct irq_chip pseries_msi_irq_chip = {
-- 
2.47.0

