Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A61EF19309C
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750584100; cv=none; b=hnYt3O3ioRJvcd5/3HyZNMlY5SWXIuEB6ioN877FWQUzMDfBGfJrJzR+BW7DVRR56jVDsnev1jXWu4GG9aiQ2FU/tmYW9q0fyox914NFssgeMmNOGrr5Z4IWYJVKIKQts/o6F39Lc4bLJPZpSQEC2Eh5gCIH2GHPAi7T41dRc7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750584100; c=relaxed/simple;
	bh=ZD2dBMnqv7ukXVZ/q4Quk1gmVKu+daZNR2JC5ty+zKY=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=RUEke6oGb1O24tmL40nJOT6Z3P94e1YL/nAKeiMF8qjF7VbiUxwHO8TVa2fNz6wwNa4jNF4jMsm7Zri9RzpXnK+JaIjGGg1Ot6wvTpNj1DXwL3Xl75Jw33q2YYs1gysFup3SEvl7bVcrzRuhCxkGDAuBD3lXuFrMzFZ71uhRHtU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=Icn1diLx; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="Icn1diLx"
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55M528BE012266;
	Sun, 22 Jun 2025 05:21:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=IzI9E8zeRCOUVGz34LlSmO2mT81
	aOyrMCdnorg61OSY=; b=Icn1diLx/wdOYQmcUXHfO0YnodWfCSMyYOCUnOJaIeM
	7aHJ2QOKsT2qckxmmcp4DNuUdH24M28AoTgCtkLEL4CL5SMTEMfZ/4kehm89arER
	tRLjDO1zQaYiFTFlwKKOe2QMR6Xc1wEXHLNMhuh5GVnyL7ZwDtCHk3nZygmk0tuK
	KylWv2l38KR30+GDxJPAG3AvbvA0MbH24hKKp6ItFGrJ1Mxh/v98YTOsmxv4uXPl
	nQvrQiLglnGxNfcyhCgRsxHdGwQovNTP6v2WBNltWjGwBA2cG4V+UF8tAOZekHtb
	x1mQtdckXxz4vF00GiNClqlLe17PlCuT8Wuicq+WYlQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 47dsn7bkpb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Sun, 22 Jun 2025 05:21:20 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 55M9LI9q063063
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 22 Jun 2025 05:21:18 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Sun, 22 Jun
 2025 05:21:18 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Sun, 22 Jun 2025 05:21:18 -0400
Received: from HYB-DlYm71t3hSl.ad.analog.com (HYB-DlYm71t3hSl.ad.analog.com [10.32.14.29])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 55M9Kvw9002297;
	Sun, 22 Jun 2025 05:21:01 -0400
From: Jorge Marques <jorge.marques@analog.com>
Subject: [PATCH v2 0/3] Add helper methods i3c_writel_fifo() and
 i3c_readl_fifo()
Date: Sun, 22 Jun 2025 11:18:57 +0200
Message-ID: <20250622-i3c-writesl-readsl-v2-0-2afd34ec6306@analog.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIHKV2gC/6WNTQrCMBSEr1Le2kh+miCuvIe4iMlL+6A2kpSol
 NzdtAdw42r4BuabFTImwgznboWEhTLFuYE8dOBGOw/IyDcGyaXmRnJGyrFXogXzxBJa3wLlSRm
 t+rsxGtrwmTDQe5deb41HyktMn/2jyK39qSuCcYbcWuG46H0IFzvbKQ5HFx+w+Yr401Fr/QJoa
 4MY+QAAAA==
X-Change-ID: 20250620-i3c-writesl-readsl-e2836534b665
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Frank Li
	<Frank.Li@nxp.com>,
        =?utf-8?q?Przemys=C5=82aw_Gaj?= <pgaj@cadence.com>
CC: <linux-i3c@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        Jorge
 Marques <jorge.marques@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750583937; l=1664;
 i=jorge.marques@analog.com; s=20250303; h=from:subject:message-id;
 bh=ZD2dBMnqv7ukXVZ/q4Quk1gmVKu+daZNR2JC5ty+zKY=;
 b=Jz4FBf6WqiUWhcWD1OhwnUh34Ly7LlDbCBPIMqU09rOK70GkddDhbBR+DNN06KRp37hfrWxb4
 CPkMAZkudMuBsLkCnJKb8b+C3CRObWnAGs3Tlfv8f4x4sDaAzO1rYP1
X-Developer-Key: i=jorge.marques@analog.com; a=ed25519;
 pk=NUR1IZZMH0Da3QbJ2tBSznSPVfRpuoWdhBzKGSpAdbg=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Authority-Analysis: v=2.4 cv=GLsIEvNK c=1 sm=1 tr=0 ts=6857cb10 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=QMVJh2PuZ69kPaAn0y8A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIyMDA1NSBTYWx0ZWRfX6y51PVxAHO92
 W+UqfShEnjRLfq+vEzVqi0QHL/ImB12li6i4Coy4RQrSciM8K7qR5hfH+n8yjwcaT3g7Q1iCKSJ
 dy0Pr0lemW9IuTqGAD5jcpRcSmiPY3wZWxo/esQs053sbVj0SEgAjZyR8+aAtHB1iuTBB8tMVur
 uJBIscp/vRDXRBkuOEGjhxvoWI7BI87snkkcFhw2RODCh82ay1Eslnc4KNeObD3aAhF3rVqBOLP
 fJS9XQz/4jzXaxj65490ODd8o2M776eImj+Ax9lVG5XKsJ1KWXJa8b8IDdTJ/3d4iR4N+0eLB/7
 qlAIX12lhvP9GXTW6hGBSpfvg75l5d1di5F/aFOEifhSAsixY0PuOw+ZvjKuSvFJm2d/Hy63r0s
 cdxWlbZqdOQYi9s1g0NxKi0kOM8aGh3tXbC+eV2BBwmtruIlwvEnlpSEIZ3xKvEnU0zBuMwj
X-Proofpoint-GUID: qYeAfYSnSAjJhuAexrzOA3azL2HTSDmz
X-Proofpoint-ORIG-GUID: qYeAfYSnSAjJhuAexrzOA3azL2HTSDmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-22_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0 malwarescore=0 mlxlogscore=635 lowpriorityscore=0
 priorityscore=1501 phishscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 adultscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506220055

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
Changes in v2:
- Rename to i3c_readl_fifo() and i3c_writel_fifo()
- Change type u8 *bytes to void *bytes
- Move methods to internals.h
- Reword commit messages to include new names and ().
- Fixup dw read fifo address (master -> master->reg)
- Link to v1: https://lore.kernel.org/r/20250620-i3c-writesl-readsl-v1-0-e0aa1c014dff@analog.com

---
Jorge Marques (3):
      i3c: master: Add inline i3c_readl_fifo() and i3c_writel_fifo()
      i3c: master: cdns: Use i3c_master_writesl() and i3c_master_readsl()
      i3c: master: dw: Use i3c_master_writesl() and i3c_master_readsl()

 drivers/i3c/internals.h              | 37 ++++++++++++++++++++++++++++++++++++
 drivers/i3c/master/dw-i3c-master.c   | 25 ++++--------------------
 drivers/i3c/master/i3c-master-cdns.c | 25 +++++-------------------
 3 files changed, 46 insertions(+), 41 deletions(-)
---
base-commit: 51963783b876a2f493a3eac0ea9eba271cb6809a
change-id: 20250620-i3c-writesl-readsl-e2836534b665

Best regards,
-- 
Jorge Marques <jorge.marques@analog.com>


