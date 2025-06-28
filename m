Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE47C1A239F
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 18:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.177.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751134381; cv=none; b=BznXSEVBFPdZn1EaNf44089iL3u0AFOn1Z+kyYdT9WteC/JaiK388AKTOQZJ6F+Khjh7fXfnzwKKcrsfYSGufj28hm75FTxMycBlO5eWMrhC6iVXd08mi4UaPczX+ynRiEpm/M+lOMKH8yc62GQ5PeN8ALrqenM/0ib8ZJ2I5MA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751134381; c=relaxed/simple;
	bh=wS2ta0jPf5nj5DXS3a2vuGruPycuqzuirMGWYz+QfSY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Xjn7ROfYelmlYUwsSjNJWVTgcvk8ZK3RyBXArQ1Sz40qxTCVxBUfmwrb2DNuWf6SwEmhzvM2J2MH+7wXoo3DwuDxEAdClqPkM+maGa23L9UsFqNUomLrEEgDjqxk9j6YrYcIsUazO+UK630VZ5Zk9cwG/SVJIk/7GXEO+vLLqw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=nMlefoxd; arc=none smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="nMlefoxd"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55SHJURv017534;
	Sat, 28 Jun 2025 18:12:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=L+3Ml7MGMvKIhp7iPbG5EBDt2Nn9V
	yKSNRG0no/ATvI=; b=nMlefoxdOJjxvoSgVov+mpb9MO3drxho/Buj6OKQ/+9u0
	+UlTyndICv2ckFuWi3Y2EFRTjKtbzMXdP8UeRGa5aRmueulni2kIdkJxGpTX2Lc2
	3RFbSV22y2lZQhSoh/rYZgdAXtaKXwQs/1vXTqaxwp27toQRmBsGNKrq+NOixNq1
	YJoTXOe24drIyLg8SOvwEtou1muuX+KcgMVK2ONsEzKRecprvNEKNW8e7iPQ72gL
	Nm+Kn6tleCA2HaiD2ETlYNrwMliiiUapI+/JKmNG34K/+xUXzKyc6MhtT498p6fT
	0u0rI69gWhTyppxDhMZJzsHSLpqbEP7vmQxUfJN3w==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47j6tf8f4k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Jun 2025 18:12:38 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55SI9KAp028997;
	Sat, 28 Jun 2025 18:12:37 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 47j6u6ysqn-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 28 Jun 2025 18:12:37 +0000
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55SI6MIm010792;
	Sat, 28 Jun 2025 18:12:36 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 47j6u6ysqh-1;
	Sat, 28 Jun 2025 18:12:36 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: kbusch@kernel.org, axboe@kernel.dk, hch@lst.de, sagi@grimberg.me,
        martin.petersen@oracle.com, linux-nvme@lists.infradead.org
Cc: alok.a.tiwari@oracle.com, linux-kernel@vger.kernel.org,
        darren.kenny@oracle.com
Subject: [PATCH RESEND] nvme: Fix incorrect cdw15 value in passthru error logging
Date: Sat, 28 Jun 2025 11:12:32 -0700
Message-ID: <20250628181234.3978844-1-alok.a.tiwari@oracle.com>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506280152
X-Authority-Analysis: v=2.4 cv=CMMqXQrD c=1 sm=1 tr=0 ts=68603096 cx=c_pps a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=AeMM1KqErxL4ncdj0kYA:9
X-Proofpoint-GUID: W_q7wwMP59uDsSMHsfdD9MRpvRaGL7Mr
X-Proofpoint-ORIG-GUID: W_q7wwMP59uDsSMHsfdD9MRpvRaGL7Mr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDE1MiBTYWx0ZWRfX2kjbMkP1/PcF 4irX/vCShlxU+dNmdA6szhO06UC8fbN2O1LIVD6aAdkvFPqGdct1xkzuyg6uhQzaNQDgiPQ7Ln3 DUTkvLn10ps4boUscF91/DS+WRXv7wOmQhT9+EN1B9qgZMkvf1PDIcu5vexpXT3MiU+3y1aTuq8
 9gdlVlG0cQqgoCFdP0gXtMurthw081ETcQxpzURshgLGOIF2YFYXG4oTJnakoT65tc6cnSWkPCA 6ZZazigxQbMzjfBvcwBIWtI72pslCKk60R+GDxvqqh2x7pi74z0dkI+ede/1m/je9/84Sm4NlrW NuM7ZWTMkQQs/8DCAcdXte/K0txd5VQcBrg3Yodfylx+PqufulsxL4TIhDOMyhA0B8i2sM7ENbm
 VKO74Adc5iPHEQcFt4i1Ne/tZV2BgZdyc/2at3g67XwjSjtDfTyiLGEsaqMfnrdIvO//9GkJ

Fix an error in nvme_log_err_passthru() where cdw14 was incorrectly
printed twice instead of cdw15. This fix ensures accurate logging of
the full passthrough command payload.

Fixes: 9f079dda1433 ("nvme: allow passthru cmd error logging")
Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>
---
Corrected Christoph Hellwig's email ID
added Reviewed-by  Martin K. Petersen
---
 drivers/nvme/host/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvme/host/core.c b/drivers/nvme/host/core.c
index e533d791955d..2ae36bce615e 100644
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

