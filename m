Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85C2D15278E
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750098002; cv=none; b=OSVAe20WNHMG/l1YLx+ht5GMT0ZB5/1fa9+jDyTj59TULxtZ1C4hDPfel5tGK+WyNMLWYdRvVB5Vly38Uow2tYvwiTvEy/iFuuaqe7nv1NF1UMdlnhleb966h2OSfCZaOM3SE+jwdu6hCReWmc615nk1dKDjV/HZzzYUBlp3uk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750098002; c=relaxed/simple;
	bh=v6EDMRKtKnbgoH+BBJ64hNYmsi+j0bmARWZDSnGtRk4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ojkHdT7F1MkiDs2X4vkygoWWI0m3lEEBBcFUws4vCxei97KolEalYVmp8d8+f6jJSlttbJfq85N/MDwCZufg7Bv4ICatT6swSjLq5hQo1Cs6Fb/dsjNJOPWU4LBwh36dJj70WBiFgTxQRnM2ZElbHj8JPPdqyIJugBpKasm9RwM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=oyGXx5ci; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="oyGXx5ci"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55GHuS92015738;
	Mon, 16 Jun 2025 18:19:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=ysAR0yE+Us1cnHYzApgdYXhn0CW6q
	ObAXT8BVYnrL7I=; b=oyGXx5ciUZJn7zjbXEHUM3gMyxFdMnWKG0HRNdMEsC9nl
	oMJlSYwnVILflVPuYChaigcshYdG/1wzY4okkvrdWZcIh5GoaBD87B3gtZfRiZ0j
	jjGuLBF13nYgh/DH4pBaLbFq+x1Sg5xrjOrNKYtRDWsuZsk4gTYD9ciTcG7n9Zcs
	o1GUAvxlI8PLhm9ezZpiBUV/t6l+0QycWX8Z/zw7/9D8Mo0VXPMJmn3jzWLafa0V
	b5TjusobDuY/xwYc8O6f8AYyR9lGUPpYddG3m8lvcCU3dNgtK5D/1biugG6JGLW6
	MRJ0tDHIpelL6GCqViig9bXV0duCRMQIKp67kQ7wQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 478yv53drb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:19:40 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55GIETOA032196;
	Mon, 16 Jun 2025 18:19:39 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh890ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 16 Jun 2025 18:19:39 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55GIJdEp016156;
	Mon, 16 Jun 2025 18:19:39 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 478yh890e6-1;
	Mon, 16 Jun 2025 18:19:38 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: kbusch@kernel.org, axboe@kernel.dk, hch@lst.d, sagi@grimberg.me,
        linux-nvme@lists.infradead.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org,
        darren.kenny@oracle.com
Subject: [PATCH] nvme: Fix incorrect cdw15 value in passthru error logging
Date: Mon, 16 Jun 2025 11:19:29 -0700
Message-ID: <20250616181936.2094176-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_09,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506160123
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDEyMiBTYWx0ZWRfXzQ65P/5oVfh2 ntoWhG3RTTMUfm74z8Ki+ivlEJoIzXKxWpyyDByOwEP+ouQfMj5HtxYhFYjEjiIZJgIf4sUKgXF GdhMUtjdgl8oZvBLH+nQzrPy5gJUlYMG3x7wZUAEqO4yCNlLiza0k6NniaHVX2cW2Hpixlw7/XA
 OZ6IwZvKFuDfvY2UF62F3q+nZbmLKli5L/3kkmVe17FQx0vYl2llDvDsgPC1rMKhf3th0mktTM8 PaxqTYMLcAg8WsTIO6YoKDw1ruxncsf7Lq3mfoH8f2mvc3U3TCFqRhs8r6MMy/nEBc9T3dupTNv Tv22u0ydY2tALFmz2NKuFdKMsFA8EK9GTkY3Z4VOyzY/GwTomC5xMLdk2Y5Pa6uIZKOIejzP8mo
 acYiiIXDaLP5cssNqDcwn25KGytUa56FiRdAdGgwTjtvXt4yUR5kZEYKzl8OzNioAxjhjijW
X-Proofpoint-GUID: QNIwZEwuSV9pJXpnom1oWen04q35hoO0
X-Proofpoint-ORIG-GUID: QNIwZEwuSV9pJXpnom1oWen04q35hoO0
X-Authority-Analysis: v=2.4 cv=W9c4VQWk c=1 sm=1 tr=0 ts=6850603c b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=AeMM1KqErxL4ncdj0kYA:9

Fix an error in nvme_log_err_passthru() where cdw14 was incorrectly
printed twice instead of cdw15. This fix ensures accurate logging of
the full passthrough command payload.

Fixes: 9f079dda1433 ("nvme: allow passthru cmd error logging")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
Is it ok to keep Fixes tag for this fix?
---
 drivers/nvme/host/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index 92697f98c601..f3e07cb92385 100644
--- a/drivers/nvme/host/core.c
+++ b/drivers/nvme/host/core.c
@@ -386,7 +386,7 @@ static void nvme_log_err_passthru(struct request *req)
 		nr->cmd->common.cdw12,
 		nr->cmd->common.cdw13,
 		nr->cmd->common.cdw14,
-		nr->cmd->common.cdw14);
+		nr->cmd->common.cdw15);
 }
 
 enum nvme_disposition {
-- 
2.47.1

