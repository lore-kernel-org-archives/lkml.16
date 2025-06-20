Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81F3C18E20
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 17:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750441036; cv=none; b=jQfef3/q5K9TccD0ARlr+6wilDndH+dR7F/pvcJTDVykiSG1OysVzaNN238CB/HSMJv6W+7zj/92z4EFCyZ7A87x7+YpYhVfZYZ0ngNHwrLdtrLfNUeZPZo9IHCLtDDyRnWIwovhWZeB0eiVJOx1VjcoBpv/9e/Yl9BVea6Ey8I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750441036; c=relaxed/simple;
	bh=uelv5JTKscE4VtpyIKD73oWY3yr7rNnU4obvZC7dloA=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=sqBQRzHJHtpPKCLQyAtZc9LVvjy1xXnCwKF3yUoVtlCEjr3gqPxczXjXzNMPaV51MDp1Mi5WgdJ2hzyNJk4KeDeIrOhnaxW0a9cW/bVnn+PZALYZ0NFyTh7vpgJuJmtqCnImq1Uhayl9w5MbRZ70rpb/wk7t3Uk37EGFlG6v7yc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Vj+96s9C; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Vj+96s9C"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KE7FfP025047;
	Fri, 20 Jun 2025 13:36:46 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=GAd7qOsxjRXtW3vxj8eLbyxX0qL
	FrUQ1eY0AIYF2Gk8=; b=Vj+96s9CEBt5NHi1kHrMfq9Zn4IfrEW5JG2J7lGqBy9
	WfGYLsYHiZqqvDPPQH4cUNl6TcsDKUUyUAdTZr04HVHUDbioHdKyjEVhbfE2Ltmf
	U7YpdaKCHyJibFDewt3V6RBHy9w3erB1V38SyTo8E/JsVTy1+jwTNZNEITcZB0Pk
	A3QfLtxMJyRckBexcErBzleHtPDG3LecKZwumlkELRdD7JQOq5i2IDeeXtZ6B0yR
	oALmOg1sxxfB32AMMU71n/LaAcmji7qSv+M9oEZWPBLleso7UyzwxsFJ2OY471gR
	UTbrlTkizcfQQkskdKB6uoyho8mRbCEqCxZ0PxzJb9g==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 47d350auud-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 20 Jun 2025 13:36:45 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 55KHaiGX008648
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 20 Jun 2025 13:36:44 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 20 Jun 2025 13:36:44 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.10; Fri, 20 Jun 2025 13:36:44 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Fri, 20 Jun 2025 13:36:44 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55KHaUGk030654;
	Fri, 20 Jun 2025 13:36:34 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH 0/3] Add helper methods i3c_master_writesl and
 i3c_master_readsl
Date: Fri, 20 Jun 2025 18:54:58 +0200
Message-ID: <20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGKSVWgC/x2MQQqAIBAAvxJ7TrA1JfpKdCjdaiEs1qgg+nvSa
 ZjDzAOJhClBWzwgdHLiLWapygL8MsSZFIfsgBqtdqgVG68u4YPSqoSGkEHYGGdNPTpnIYe70MT
 3P+369/0A5saivmQAAAA=
X-Change-ID: 20250620-i3c-writesl-readsl-e2836534b665
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Jorge
 Marques" <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750438498; l=1304;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=uelv5JTKscE4VtpyIKD73oWY3yr7rNnU4obvZC7dloA=;
 b=QDku2RakhV02l/YuRSKYAbw4ju/L+0ciDvAmwSPnDXHCNDmClAD771ag8ZX4dqCh03iIq/RtF
 PNYNruvJ4WmBgR++3HxlNwAYV1VKdpGyJqHm/jbOf2ttU6+W7HPyPah
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=WJB/XmsR c=1 sm=1 tr=0 ts=68559c2e cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=QMVJh2PuZ69kPaAn0y8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEyMyBTYWx0ZWRfX1jDIXnBmm4iI
 N87UaJiq59N4ldHcpKhNQ/KT6xnXHrh1l/OSriJ9AUbIuY51ReRwsN+IR6qdZ+47kDWvVL5ZVN/
 wL0beRS/yJQIbM1Im06MwCatZyjWrpmp+UBYohQ3D4Mcn81FkgRvB8njTKQceyp3aJbKmty5Yg/
 KUYJbmC+8cZtTowuy5d+KTRqj5ZfazzuZBjMh75BqS4xDNq8HPZUTJHvGdV82o2u38ppObLFkCy
 iC2Lfx9pc0DgUZ4B+zm2ZZ0n4UJs2NvRTnwURJlpXtKpoNnfvvtEp6F5+zw7vIyZ2zsv4u+UmcV
 hqI9/OeWoR28r0FIJdyKuzurhGafbBZ8sZENv8hbQkb1xE4J6xBB4bBbHloDWem0T5r/C4Lnpf9
 303x7blDoom38AgXg9y3N0hRokPaSwWfH8UxmRLEfhLJbIAJZd/NQzjCkL56iWLDG/AsIjUz
X-Proofpoint-ORIG-GUID: 6uDUG_vaSQSJuKHuDajnGvMVuy5243iq
X-Proofpoint-GUID: 6uDUG_vaSQSJuKHuDajnGvMVuy5243iq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 mlxlogscore=622 suspectscore=0 phishscore=0
 mlxscore=0 bulkscore=0 adultscore=0 impostorscore=0 clxscore=1011 spamscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200123

The i3c abstraction excepts u8 buffers, but some controllers have a bus
width of 32-bits and don't support flagging valid bytes, so it is
required to read/write long words and to use memcpy on the remainder of
the number of bytes by 32-bits to not write/read outside the buffer
bounds.

Add two auxiliary methods to include/linux/i3c/master.h and use in the dw
and cdns i3c controller drivers. The adi controller driver will also use
these methods.

Related thread: https://lore.kernel.org/linux-i3c/aFNziEj7j31xy%2FmY@lizhi-Precision-Tower-5810/

Signed-off-by: Jorge Marques <jorge.marques@analog.com>
---
Jorge Marques (3):
      i3c: master: Add inline i3c_master_readsl and i3c_master_writesl
      i3c: master: cdns: Use i3c_master_writesl and i3c_master_readsl
      i3c: master: dw: Use i3c_master_writesl and i3c_master_readsl

 drivers/i3c/master/dw-i3c-master.c   | 24 +++---------------------
 drivers/i3c/master/i3c-master-cdns.c | 23 +++--------------------
 include/linux/i3c/master.h           | 36 ++++++++++++++++++++++++++++++++++++
 3 files changed, 42 insertions(+), 41 deletions(-)
---
base-commit: 51963783b876a2f493a3eac0ea9eba271cb6809a
change-id: 20250620-i3c-writesl-readsl-e2836534b665

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


