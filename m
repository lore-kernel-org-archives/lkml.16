Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8256C1DFDAB;
	Mon, 23 Jun 2025 06:41:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750660891; cv=none; b=SFwAhZHf3kOqBKfhcsf4WAr6HhF/9qXK1KTg095iWZ9CgklBMUuI3e0fbstroGBpQu5Ju4teU4oRsKe6DKDOSj2q2gr2RP+5limANLlVXYAl0c1UerjigbN2juPRHVzxZAwLUylpXjQRjjm51P8YzSKN7I9C/sJ+wiDOlaInXNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750660891; c=relaxed/simple;
	bh=hqf53sChU4p2obNB+5lGs4Glo3hO2GltGF04zEjaMw8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ltNB1vlDhNVS5txWJ/LCNkT655BlissZNtzGY4/5KIMxbbXQonHopxEQR/LlihONue87u0TVvxDOK8T/Jj2LrlQNtjnzriS8i25mkyQtoU7w846AMdJgTvcZNObU1GovcC49wIQjpjZ1bW6q7vgeco/E54SkXZtXZB5b+oXVuag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=mvpire8q; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="mvpire8q"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N0RYBm014906;
	Mon, 23 Jun 2025 06:41:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=corp-2025-04-25; bh=6RhxZ
	4NYWYnwNolnd/NRWxzQE99/+94N9JG71P7TUE0=; b=mvpire8qocfQxGZYV83O8
	LEFoW+HP9PU2z0v951boOFJXoBz7EiYyhnZyqPfwx+5rqYTHwrDo/QOm0O5aRbvV
	cm3b5Hxoe4AFiGdTVblNhhm4yaCPgrB21t9r4smSLZpVzfSKbyZPCnsK1g9HDV8c
	JArcdrrJXHssHGSwaeZJ/liYc4uOVegTLIaOBg2JMFervDFY3d3Uwb3rwO8TYrqT
	WSL4nDmmQWWgNufx3N4Jufjo/Y+nHeX1TGdhCpzkWFvSoNEsSn4Blg45E/qi28ng
	rq9iIy6npQrPhYCEs7+A6cvevA1098SRCkR7r8eP4H9OoJ677VvIvIr51ujZ+Pgv
	g==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47egt18wjd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 06:41:12 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55N4xtJR030685;
	Mon, 23 Jun 2025 06:41:12 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47ehpnfduc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 23 Jun 2025 06:41:12 +0000
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55N6fAjs006422;
	Mon, 23 Jun 2025 06:41:11 GMT
Received: from ca-dev110.us.oracle.com (ca-dev110.us.oracle.com [10.129.136.45])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47ehpnfdt5-2;
	Mon, 23 Jun 2025 06:41:11 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: linux-nvme@lists.infradead.org, kbusch@kernel.org, axboe@kernel.dk,
        hch@lst.de, sagi@grimberg.me, kch@nvidia.com, nilay@linux.ibm.com,
        corbet@lwn.net
Cc: alok.a.tiwari@oracle.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/5] nvme: Fix incorrect variable in io cqes error message
Date: Sun, 22 Jun 2025 23:40:20 -0700
Message-ID: <20250623064036.4187788-3-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
References: <20250623064036.4187788-2-alok.a.tiwari@oracle.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-23_02,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 spamscore=0 bulkscore=0
 malwarescore=0 phishscore=0 suspectscore=0 adultscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506230038
X-Proofpoint-GUID: 5JJfxtA_z4WTFMur-lkmZnxXOu7cA198
X-Proofpoint-ORIG-GUID: 5JJfxtA_z4WTFMur-lkmZnxXOu7cA198
X-Authority-Analysis: v=2.4 cv=cpebk04i c=1 sm=1 tr=0 ts=6858f709 cx=c_pps a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=SRTLixNVdz0Y03tMcBAA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDAzOCBTYWx0ZWRfX9r2QIbbfzSIE tNa1wAJozabi5VEgMP0o3GWt54ulo6PJ92UmZmyFcjMqtne9K0Dr/W3K7F7/0ACLJimedeKcW+W V5FzUDQR1LEP7QyeCeqgi7qd3RVC0vrZdVwWtTPDSL5lgX9Y6Xt7Pcta0dtihOk7geEO1XQ2UzU
 x95LqDgnujCHOd8r5fBa+RGalBhCRKWnn1e3/jf9zHwECBA6OF1emKiJLnh174DcAlIlhg79jpX mM64ro5tpXxBRWOjd919B2zpgYW4ji35/OKcLBT7sfJ3bnEzHAPdwqwRz3n2RMccUExoRJWAOyV CCNQBVo3dV2bqyoAg9C2CJ0JLSlb6WzRB+OZ0ar3pwxx/ivOYvmEtGwueDLVYhUTVAbahVB3Djf
 0RyfpQl5cPDIh9mBem5HbPZz6d0yxhIDd465qIR/1Lj7WMZbU/lhWVsstAudVk0B2Hv5BvqV

Corrected the error log to print ctrl->io_cqes instead of
incorrectly using ctrl->io_sqes for the io cqes size check.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
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

