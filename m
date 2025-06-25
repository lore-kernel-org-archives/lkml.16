Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDB9EA48;
	Wed, 25 Jun 2025 04:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750825059; cv=none; b=WauSnkqiJVi97LCuQH1LiN1sGBe8R8s0LGC0rpB28AUPSukrL4OqSaDgmJKCwV9GZiO/n0KKYbAfQ9tXvdhzUIxgOkjj2/pfGLTfGVRN1KewJ/xiKIL+6mVpR2/7f5kV72X9zjOa69ytgrveujEhPjY21iEq2+Zh65OCpXqZl/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750825059; c=relaxed/simple;
	bh=ayz0ddO8nsSjDXhUrpotgHNzVxU0EFw4zfpcC/d7MPA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=doquu8mTO0gTxsgtPSZ2oUrC1N7lwnWWFg8jCXul0Vx6MossTkENnTVma7DRdMzal8SkyVGT76MPo3hu3xFgftC6mRHORkC22gDI3RnbcbD0/v6RR+el49YMTLOIDt5vr3Q2D16/AlxNzjC4a11vLJuEPwx0keeOjiFhFfnSzeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=qFEzvlro; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="qFEzvlro"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OMif1S019163;
	Wed, 25 Jun 2025 04:17:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=F6lc3
	DSqQYj9CtY6Jlxvu1LhuvGfPj9itOscaOVFwY0=; b=qFEzvlrotHs9pAPB4NBwd
	h3CGDoQ3vc/5nI/G9UuoURGeHfhzEa+2bV/Q0LYp266HAw371YxJhcu54lwacVj4
	20gIrGrArqqSohqxoFI133QGw7IuepQhEp/D11Haxe3B8VSqj19e1lPIW+0Kz8q/
	llRuGTOYzT7Tj3DUJr6h8MOiqSTqJd/telG+e+bYZCP47ZJZVr0ojNZ8SxzuqjPX
	qP2gMKR+6il3na04T+36Ofv8HNVkPC1QPoT+2//omnxdgYwE5NEVRcI44dtN02V7
	2hJT2XSRbEWSoOeBxmii75G/sDt8dmdEs+/uiMF+djmhY7xJl02B8x9rOUIsyx1L
	g==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47ds7uxjfb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:21 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55P3Sue9024338;
	Wed, 25 Jun 2025 04:17:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 47ehkrhfga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 25 Jun 2025 04:17:19 +0000
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55P4HGqc029022;
	Wed, 25 Jun 2025 04:17:19 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTP id 47ehkrhfem-3;
	Wed, 25 Jun 2025 04:17:19 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, rdunlap@infradead.org, kbusch@kernel.org,
        axboe@kernel.dk, hch@lst.de, sagi@grimberg.me, kch@nvidia.com,
        nilay@linux.ibm.com, corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] nvme: Fix incorrect variable in io cqes error message
Date: Tue, 24 Jun 2025 21:16:31 -0700
Message-ID: <20250625041643.174110-3-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
References: <20250625041643.174110-1-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 bulkscore=0
 suspectscore=0 adultscore=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2505160000 definitions=main-2506250029
X-Proofpoint-GUID: cGEJcelzIzUfI69AJ7iKTjCVqb57Dtow
X-Authority-Analysis: v=2.4 cv=CeII5Krl c=1 sm=1 tr=0 ts=685b7851 b=1 cx=c_pps a=qoll8+KPOyaMroiJ2sR5sw==:117 a=qoll8+KPOyaMroiJ2sR5sw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=JfrnYn6hAAAA:8 a=SRTLixNVdz0Y03tMcBAA:9 a=1CNFftbPRP8L7MoqJWF3:22 cc=ntf
 awl=host:13207
X-Proofpoint-ORIG-GUID: cGEJcelzIzUfI69AJ7iKTjCVqb57Dtow
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDAzMCBTYWx0ZWRfX8LPr2HxVY4Fi dG9dNes1JoAMnhHsPuCP+IXi3lfSl1qyq2u8hnTDXgMXt+lg92aY5yET5020RQTt1bnS1upC3hw WwXs+mltvo8RMguQ4ryI1W9AqIFXJj/E0Wc+ASoEOepRZivkASJgRBe1AKJckLLN5QlEsrCpi3q
 S5Dw+A02OYK1cHQtN1p3ACmq7xCGJ7ok6nOFEXTkVKFKmvWNDxpF8dLU4zmY+l8JtaA5ei8K7cM jdU1It2AVVVoVvwMry8WGE3Y85JwGqlxUU7EAhc6OTxWrPwpH9OKznHAt+ROKqBqXf+wObxLMuK VNmoZ1CD4hV8su874ksnFms2jnznl1WGo8/KtFAd79k+NiDbfZQ9G6l9n7MCrYBOqiOI/TGV0ed
 q/KwL6KqJANLhJvWQtOJPyCHt87E8Kb5dD/v0sDG2CJ7ONdAgxF5/wpQZTvaFlBcZObsZji5

Corrected the error log to print ctrl->io_cqes instead of
incorrectly using ctrl->io_sqes for the io cqes size check.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Randy Dunlap <rdunlap@infradead.org>
---
v2
no changes only added Reviewed-by
---
 drivers/nvme/target/pci-epf.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/target/pci-epf.c b/drivers/nvme/target/pci-epf.c
index a4295a5b8d280..44288d8f5aa11 100644
--- a/drivers/nvme/target/pci-epf.c
+++ b/drivers/nvme/target/pci-epf.c
@@ -1860,7 +1860,7 @@ static int nvmet_pci_epf_enable_ctrl(struct nvmet_pci_epf_ctrl *ctrl)
 	ctrl->io_cqes = 1UL << nvmet_cc_iocqes(ctrl->cc);
 	if (ctrl->io_cqes < sizeof(struct nvme_completion)) {
 		dev_err(ctrl->dev, "Unsupported I/O CQES %zu (need %zu)\n",
-			ctrl->io_sqes, sizeof(struct nvme_completion));
+			ctrl->io_cqes, sizeof(struct nvme_completion));
 		goto err;
 	}
 
-- 
2.46.0

