Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C01DEACE
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 03:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746674356; cv=none; b=uz6ws+1FGLYlwJcJbgoTKPyq1sJS+Kxpl5ZjbBEuLglaqNeYdQPuIP8AQ2NiqCsnHt8vZpiWfvCHMy7y7ezS4Buzdgcx9UpOqSkXYoIQMEd57ZFtPSYCR7YcaNQf+1CY7IdquTHC5x2+2gwN8YOm54ZtqpEvsQSwG+eqfSgDDeA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746674356; c=relaxed/simple;
	bh=kpPByy1MSXrE7XHQOlhVnbaN3SQjFBP8cL/CCVkZ1pk=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=n0JUqV7XW050uPQsoFMHOfZ2byU/ClGPrlJqa2YDFEix/xqxfH+u7QTTzxm6KeeWgE5UErtBmFn3eo20J0eSmg+2G0pz4PxOsl/XAGSJE4dtuxKlhfNT2vVrrAusRj4KP3H+5m+43l+bSVsETvqx0ocgFV7LWgGKHGbJ50G9Ep8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com; spf=pass smtp.mailfrom=quicinc.com; dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b=bY5KmB7Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=quicinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=quicinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=quicinc.com header.i=@quicinc.com header.b="bY5KmB7Z"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5481DJHo029148;
	Thu, 8 May 2025 03:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=KCwUcTW+JCBXhA2O5sLNJv
	cXCcHuUpmaH1Y5CqHoX3Q=; b=bY5KmB7ZnC7NQkyOAArnluwxXM214JmkyckMHv
	83sT9yA/YTWe0S9fDoGYfVzfGy3xDhTR6MaBq04oA/4ErePHDJy5M3mGJKi3sFtH
	KCEz9pLs5Ai4m2tuk5KJpiD8WTbbs+NQUBlZ9zNWFtA2MMZWoYcQ7BiSK3eKc9zW
	YDyFSELQhGdtGvPazZS4zZYioPG9dTLW59NYa43+JIJh/NLp54l1pt29j4mb8nVT
	V2YwPgnTNX6nzhtS9NPGh+VH2bJ04La0JkGvH9C8b1wRBadAEQu4Ket3VKigjqIw
	Ryoryk9mKNKILk+5Jam8o5s2OttgbAQ5U+mXR25t7rTgiSWQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46f5uuyuw0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 08 May 2025 03:19:04 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 5483J2DV025109
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 8 May 2025 03:19:03 GMT
Received: from hu-jinlmao-lv.qualcomm.com (10.49.16.6) by
 nalasex01a.na.qualcomm.com (10.47.209.196) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.9; Wed, 7 May 2025 20:19:02 -0700
From: Mao Jinlong <quic_jinlmao@quicinc.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach
	<mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        "Alexander
 Shishkin" <alexander.shishkin@linux.intel.com>
CC: Shilpa Suresh <quic_c_sbsure@quicinc.com>, <coresight@lists.linaro.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        "Mao
 Jinlong" <quic_jinlmao@quicinc.com>
Subject: [PATCH RESEND] coresight: etr: Use noncontiguous api instead of noncoherent
Date: Wed, 7 May 2025 20:18:51 -0700
Message-ID: <20250508031851.2566235-1-quic_jinlmao@quicinc.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: nalasex01c.na.qualcomm.com (10.47.97.35) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Authority-Analysis: v=2.4 cv=L9cdQ/T8 c=1 sm=1 tr=0 ts=681c22a8 cx=c_pps
 a=ouPCqIW2jiPt+lZRy3xVPw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=3H110R4YSZwA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=LJGOv-cUfqeUQQqDYsEA:9
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: Cs70GVF0RP2iA7c48ktTqSrR84qtVv9b
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDAyOSBTYWx0ZWRfX2GtiCQUX1nV/
 7kDIYtnKjSvdGKjSIQX7Mf5GCr1Op1sf4eoLZFjHO2+CaVbR/Xkm79OhtFCsTlmep7IsLAB7BAk
 7JVIi4dd6P5BIuIL6JdaWBwwGMTUMHRZw30XEgOUcKEa33HBPRb7rR5D5RT8IqW64erl2BQfJOc
 m9Jpqhdw4xwrRKysSmTijzFGxF5voHiPQsLJJC94QGRWhAmy9C9mbK5n+gYde24a00Agou04Lut
 OqFQ8vGPseul74gRUNaXqXLY69rT57oUNvsnVrB+3UlErnqtW5LxIl/QYEd4DdqZybY5BbPTj61
 DWKp02ma/82KG1dkIPzO6YB6CHNi6e8/gkot2NkAaaKYeQ1Rd2PoUHf6sE/1l2XbLs/WBIxjCsK
 nCV7JhFuHOroiNbNLctU958evUEPYCHyShetxYvdA4b1mdM08LeFuDNW0uvsALF+f4H0CZMy
X-Proofpoint-ORIG-GUID: Cs70GVF0RP2iA7c48ktTqSrR84qtVv9b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_01,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxlogscore=852 spamscore=0 suspectscore=0 impostorscore=0
 mlxscore=0 priorityscore=1501 clxscore=1015 bulkscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080029

From: Shilpa Suresh <quic_c_sbsure@quicinc.com>

The iommu support for noncoherent is removed by commit(dma-mapping:
remove the {alloc,free}_noncoherent methods
81d88ce55092edf1a1f928efb373f289c6b90efd). Use alloc_noncontiguous
function for etr flat buffer allocation.

Signed-off-by: Shilpa Suresh <quic_c_sbsure@quicinc.com>
Signed-off-by: Mao Jinlong <quic_jinlmao@quicinc.com>
---
 .../hwtracing/coresight/coresight-tmc-etr.c   | 47 ++++++++++++++-----
 1 file changed, 34 insertions(+), 13 deletions(-)

diff --git a/drivers/hwtracing/coresight/coresight-tmc-etr.c b/drivers/hwtracing/coresight/coresight-tmc-etr.c
index 76a8cb29b68a..3b204f3bd45b 100644
--- a/drivers/hwtracing/coresight/coresight-tmc-etr.c
+++ b/drivers/hwtracing/coresight/coresight-tmc-etr.c
@@ -24,6 +24,7 @@ struct etr_flat_buf {
 	dma_addr_t	daddr;
 	void		*vaddr;
 	size_t		size;
+	struct sg_table	*sgt;
 };
 
 struct etr_buf_hw {
@@ -616,15 +617,24 @@ static int tmc_etr_alloc_flat_buf(struct tmc_drvdata *drvdata,
 	if (!flat_buf)
 		return -ENOMEM;
 
-	flat_buf->vaddr = dma_alloc_noncoherent(real_dev, etr_buf->size,
-						&flat_buf->daddr,
-						DMA_FROM_DEVICE,
-						GFP_KERNEL | __GFP_NOWARN);
-	if (!flat_buf->vaddr) {
+	flat_buf->sgt = dma_alloc_noncontiguous(real_dev, etr_buf->size,
+						DMA_FROM_DEVICE, GFP_KERNEL, 0);
+	if (!flat_buf->sgt) {
 		kfree(flat_buf);
 		return -ENOMEM;
 	}
 
+	flat_buf->daddr = sg_dma_address(flat_buf->sgt->sgl);
+	flat_buf->vaddr = dma_vmap_noncontiguous(real_dev, etr_buf->size,
+						flat_buf->sgt);
+	if (!flat_buf->vaddr) {
+		dma_free_noncontiguous(real_dev, etr_buf->size,
+					flat_buf->sgt,
+					DMA_FROM_DEVICE);
+		flat_buf->sgt = NULL;
+		return -ENOMEM;
+	}
+
 	flat_buf->size = etr_buf->size;
 	flat_buf->dev = &drvdata->csdev->dev;
 	etr_buf->hwaddr = flat_buf->daddr;
@@ -640,9 +650,12 @@ static void tmc_etr_free_flat_buf(struct etr_buf *etr_buf)
 	if (flat_buf && flat_buf->daddr) {
 		struct device *real_dev = flat_buf->dev->parent;
 
-		dma_free_noncoherent(real_dev, etr_buf->size,
-				     flat_buf->vaddr, flat_buf->daddr,
+		dma_vunmap_noncontiguous(real_dev, flat_buf->vaddr);
+		dma_free_noncontiguous(real_dev, etr_buf->size,
+				     flat_buf->sgt,
 				     DMA_FROM_DEVICE);
+		flat_buf->vaddr = NULL;
+		flat_buf->sgt = NULL;
 	}
 	kfree(flat_buf);
 }
@@ -651,6 +664,9 @@ static void tmc_etr_sync_flat_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
 {
 	struct etr_flat_buf *flat_buf = etr_buf->private;
 	struct device *real_dev = flat_buf->dev->parent;
+	s64 buf_len;
+	int i;
+	struct scatterlist *sg;
 
 	/*
 	 * Adjust the buffer to point to the beginning of the trace data
@@ -668,12 +684,17 @@ static void tmc_etr_sync_flat_buf(struct etr_buf *etr_buf, u64 rrp, u64 rwp)
 	 * is full.  Sync the entire buffer in one go for this case.
 	 */
 	if (etr_buf->offset + etr_buf->len > etr_buf->size)
-		dma_sync_single_for_cpu(real_dev, flat_buf->daddr,
-					etr_buf->size, DMA_FROM_DEVICE);
-	else
-		dma_sync_single_for_cpu(real_dev,
-					flat_buf->daddr + etr_buf->offset,
-					etr_buf->len, DMA_FROM_DEVICE);
+		dma_sync_sgtable_for_cpu(real_dev, flat_buf->sgt,
+					DMA_FROM_DEVICE);
+	else {
+		buf_len = etr_buf->len;
+		for_each_sg(flat_buf->sgt->sgl, sg, flat_buf->sgt->orig_nents, i) {
+			dma_sync_sg_for_cpu(real_dev, sg, 1, DMA_FROM_DEVICE);
+			buf_len -= sg->length;
+			if (buf_len <= 0)
+				break;
+		}
+	}
 }
 
 static ssize_t tmc_etr_get_data_flat_buf(struct etr_buf *etr_buf,
-- 
2.25.1

