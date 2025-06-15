Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB97264FA6
	for <linux-kernel@vger.kernel.org>; Sun, 15 Jun 2025 13:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.165.32
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749995544; cv=none; b=eqRjVQodIbOBZ9S/lThFIWqh9L56V9+VeabJJwFy6BmH0Uzmxf+O36OeF4JsgW1d1laDvghCXBpM0v3GUbZDz189lqipeKEF88H/9KUGFbX3kVis3giOvDLlG6V1Ax1yNOL3ELTPX+OKDCUw+rKOtB6d3xWX27bJCM+Ygmj4CU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749995544; c=relaxed/simple;
	bh=BqY8a5sCl9Yc+7wmyMvixA9uhqJo9I2TcbqTykBw3Ag=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=H8QAehIhRYDyoWYL7pMuMZc8iXFGRSR9l39wcA0T543lHIvLUkzxLVEC5PhUQyBq5H7qjaHt7CiurLudKWu7oQ7LQaiqnQdk77bzecYr9gFMIo5Qws5NAfYwGFqojMrxgRVbrfcEAJ6JOkn39ONrvwW9GrLzmDVbEPItORGO9Mw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=MJnAVLXG; arc=none smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="MJnAVLXG"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55F5g96V009181;
	Sun, 15 Jun 2025 13:52:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=corp-2025-04-25; bh=z+aPRJ9D9wGKp2em2GFeo1QKRtzV4
	A266ZxBWZwN6Sc=; b=MJnAVLXGOKpQ+sROsNCB0adXvoPyzw7Twf8vLn4DrEOUu
	9g6fqrpOHmTqpcLikITBmVwuLxXTXlQ5OTGlA3/lEWRU0sROiB0NTRUKzVu7xLzb
	cMXPKixVK//4u+Q0ECn/+Xb6RudzVQKRCHTvouhiMwRf0eDLOvqMbjmDcdtj5qAi
	A1rAXgvRLULJCxhWa4Ztot/rMzQZSziT0pIQSa1omAovy5Tunf6uEP8cqRttarHM
	F0i+/KK1O82u451TNu7O6JF/e0zBwEA1ttT2sUIpIe94qZYFtWTzb1We//rGiUtD
	OHfh5pRutRdrFoUaqnrUYcuPdl4Z+Tt28I1IIV9vw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4790yd14sx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 13:52:20 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 55FBlcdm032782;
	Sun, 15 Jun 2025 13:52:19 GMT
Received: from pps.reinject (localhost [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 478yh72v2s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sun, 15 Jun 2025 13:52:19 +0000
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by pps.reinject (8.17.1.5/8.17.1.5) with ESMTP id 55FDqJbi010140;
	Sun, 15 Jun 2025 13:52:19 GMT
Received: from ca-dev112.us.oracle.com (ca-dev112.us.oracle.com [10.129.136.47])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTP id 478yh72v1h-1;
	Sun, 15 Jun 2025 13:52:18 +0000
From: Alok Tiwari <alok.a.tiwari@oracle.com>
To: srini@kernel.org, linux-kernel@vger.kernel.org
Cc: alok.a.tiwari@oracle.com, darren.kenny@oracle.com
Subject: [PATCH 1/2] nvmem: core: fix memory leak in nvmem_register() on error path
Date: Sun, 15 Jun 2025 06:52:07 -0700
Message-ID: <20250615135212.1356469-1-alok.a.tiwari@oracle.com>
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
 definitions=2025-06-15_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506150103
X-Proofpoint-GUID: jtzHF3h_wPGvKHk5KcsymCkBFLQWMkWy
X-Proofpoint-ORIG-GUID: jtzHF3h_wPGvKHk5KcsymCkBFLQWMkWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE1MDEwMyBTYWx0ZWRfX+f5CRm7TGxsa BO6PMoNlpEAS8/ZmO5GWTJHQFvcrsSBYxwIY8VdB7HAGVdCm0awlREJPIM1LBmB+AW2k00XDdJS iabSPuV6/IxY+f7C8dEv56WEpHIEypDMlcJbHSf24Bw8bdZPAxZH8jYN6Xo8uUYoH66yZl5YOqL
 LjNPnn2VQy3SNxVN/aV7nKVB5feMKYcAxbvU5dRvlmygvv9j2gKJaXdL0eSyrGQbRMk4ACtMVV+ Jl+joUtHsz1FEfQ1gV+5M/M0TZDs2PfmSI/foaPfAiRGCalVzK1t13DlYurBybSisCwBYKyFP3B tTX9DPor7t2HrVYJCkrq9ksXyorQFRSa5TesdQKxShXbzOar/ihtez9U7saFzcs/q0NkUtAUa1p
 g3EuZ8oWP8VN5SNuSaIWo7gDRzKAAUdfaTTQ5cKx+D5ko/6VvtAtiesUSSRYsyrHEMexsxJZ
X-Authority-Analysis: v=2.4 cv=XZGJzJ55 c=1 sm=1 tr=0 ts=684ed014 b=1 cx=c_pps a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17 a=6IFa9wvqVegA:10 a=yPCof4ZbAAAA:8 a=zNO-cWCSDjtehot-uPwA:9

Ensure that the allocated nvmem structure is freed if device
registration return error code.
The missing kfree() caused a memory leak when nvmem_register()
exited via err_put_device label.

Signed-off-by: Alok Tiwari <alok.a.tiwari@oracle.com>
---
 drivers/nvmem/core.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index fd2a9698d1c9..3203524ad49f 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1044,6 +1044,7 @@ struct nvmem_device *nvmem_register(const struct nvmem_config *config)
 		nvmem_sysfs_remove_compat(nvmem, config);
 err_put_device:
 	put_device(&nvmem->dev);
+	kfree(nvmem);
 
 	return ERR_PTR(rval);
 }
-- 
2.47.1

