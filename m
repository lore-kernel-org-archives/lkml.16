Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 677591E633C
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110527; cv=none; b=g7q0ormFYUaDVEUjOYHDRA0v0kjXswk43HDs0kbcl6WL/nF3g+IsKnCsnuQi8wAr+P68u/ROfSZmHx3w2Z4IMHbmQD5M2NpmMzLw6BNeBENtSXBFt+BUkjx9slAa8n4hjDDMDwyfRR3IzEaACs4FPHG0gA0tRiv4kuZov8eRwSk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110527; c=relaxed/simple;
	bh=219mGIdybJeDtz8GQAmZgDg/UcfEorRh98P57NlV1zE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=b3g0DUfrf38XmD6jdmlBau1yLLqE0m5oF+WxB8Qhkzhz35pSv4JSO4399JlDPZoY6sUwJKJwWy8jpNIW3JGLT1H1Tkphfs/pxDmniStRHUD1xs7FpxtHI1XRu0JHtZP42Rd2JNxZyLdIaN7Wk+tOvHBNltJIeWGG2nMPlLcaSdk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LycLwXlt; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LycLwXlt"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D11nCt029278
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=W6GAILZe1jq
	2FdYPLrjjokTUXGgsX3z5BCNlHC9cgZU=; b=LycLwXlt7RoCmNdFiYWyOvk/9/U
	hkFK/hXQ+w36NMnBW3d1QMc26PrmtSz01Eey4sN5jZck4qRvLu8ECoUcUPqRJRMI
	itULNwyPdkLVrwgLJFGSVnl/gBq8LqGFzNbb8MfBA0jIKwEDFYF3IcOc9ucy0T9f
	AOw8Oo/uD+/5oELDmC1uXN4dPv5J2YSt6pgiO/4HCssP6u4mnbFzEws1XveLyws3
	gwDICGWS9pFhp/fzoXF2+/kTyVbp+1P3qnJ4ug58T+5gPnQbF0c4Oit9EtgJSvlr
	T4KPg/kklSbM2wBgJ3ktk9Ku2twY+EoQZpktb5V8Dld+NXx0l5henjbXuow==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46hxvxeckq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b2431e45064so4404507a12.2
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:28:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110523; x=1747715323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=W6GAILZe1jq2FdYPLrjjokTUXGgsX3z5BCNlHC9cgZU=;
        b=kpXehh2lVt8kRU3Ace9xG00rGdSaDe8YtqJ7w8pD8LFstyMiF1GqGOY3xNw4UBhsr2
         yZWHnyPV2vsDPo4EYgUX/32vGtFo2o5FnHJ+YvI4441H3UpgwuNRnqjOrXk0shKW9ePo
         iE4RDnfggZoY2ui22DV1nHV7Uwip9ZKvj1L+fQXStEvvOWRwc4WLxup+58aFegvWi5Ik
         +gEN+8VAdGtTnFa1qeNmpOfAQxv3CF4xCJdzgEC3G1klpghunt9wAxww27lKFtDuSAaB
         k5CcJHgn/qJwRMejUBc50rKK9cp4+amKfV4ZaXj/NoO2ZIMbdhnSf0L6yBs9Onz2PrNW
         qj5A==
X-Forwarded-Encrypted: i=1; AJvYcCVqr4q7MNsHsFFVRy1YBgy/JErNGASREVbi/GFxFiwxAvkFCyt/A7X7nFsX4ROVYbgw3fcHn+EIoFzx1jU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoEyL6vYC6Au/RxTzyQefJnjboDUE3Iy5Rfas5Br7Ho7aDF9ry
	aD/oxPjvHhdTyl4I8loItkPyMnokq2VVbZWc55ZgmsfK32l+d47eZh1LWM/4Xu9Qakyd7/INJH4
	eSSbP3xV5YN1GcCKBCufrgbonn3CkgZes+sD7Mw37beQQRXljAuOT53Tm2AsRx7k=
X-Gm-Gg: ASbGncsmr6GfLr2bcpvqMfMhQraKsBj/N7WQjdf9SbHu6EdMDFPST6naeessTsJl/Ud
	KOQYmAOzNfYTtbue8iRtYwh334/EwPwu+gPQAlwv11Y5/r2b9pFE9aMwPQKEwhzSU6cPI+hr8Wu
	7lFVvtEnEWBI03e0ajVmVLXiDcUljlcqGQBBU0mbS4ioeGrVoZjhir2kby/lzzlgP0Ai1pOHNNs
	Q/VUXyPchAUFiqQLJ9vJfX7vxmqXyt7gt+tnVQSuCPXVtRPLN7otbO9yzyWqed7w88DD7Zx85wh
	snX2p3Qswez237YNGGgmUBtH4Ozsla91As9KotxocUoD
X-Received: by 2002:a05:6a20:1124:b0:215:d565:3026 with SMTP id adf61e73a8af0-215d5653229mr6842195637.20.1747110522848;
        Mon, 12 May 2025 21:28:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH4+gbSS6s7qSuU5YmGTKTsPTB3m3lJGYEwqEPy9irPtLLKsH0Ru/ril7XSm2s95m5IamjdpQ==
X-Received: by 2002:a05:6a20:1124:b0:215:d565:3026 with SMTP id adf61e73a8af0-215d5653229mr6842165637.20.1747110522505;
        Mon, 12 May 2025 21:28:42 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:42 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 4/5] misc: fastrpc: Remove buffer from list prior to unmap operation
Date: Tue, 13 May 2025 09:58:24 +0530
Message-Id: <20250513042825.2147985-5-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
References: <20250513042825.2147985-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfX3CPIOXe5/8vF
 fpeuEOIksqSkAlId0o6ywIvCMugGYpZRfO8wE4fUsIjHzpRJRBh/nE4pM55/Dh4VFvajZE6mXBP
 h27qqFiZgxISBaGPXkl9t/wBwM/NkzAUvkiyzsGT7UJd4HLxSgEiMPGupOtvisiUSZnrJPEm0a2
 wZY6ecTlTEtk3qwUdwhzI8t6NZpxBU9CCt4LMqdb3+TScT4X12jU7yqtO+gKKJADmNkdC/sOglT
 4sFZeataGwXcgmAY+nGWMYlred4sW+VLJzsyB4OlQK4Kh/zZUFEyvINi9HBDxrcScVLv2ghO/xC
 vCyjk1iTdlNy8e4y89saegvhJQ5DU5eJ0pQsyyEvMi64lUQwTSWLieICGhySB3AMEoxQtXV2/IA
 N/Z7L6c6i9hbKYZfqVsqU1Df0FVzz3bie8BfaTF71POHZd7FcRF4XBsoACC29lQLRd1D4GOb
X-Proofpoint-GUID: 8BEm8Mj5dvtGzKXN_xfgZbeK258DnDCV
X-Authority-Analysis: v=2.4 cv=WMV/XmsR c=1 sm=1 tr=0 ts=6822ca7c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=BnVeGx0dmUjw97O46OEA:9
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: 8BEm8Mj5dvtGzKXN_xfgZbeK258DnDCV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 priorityscore=1501
 malwarescore=0 suspectscore=0 phishscore=0 impostorscore=0 bulkscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505130039

fastrpc_req_munmap_impl() is called to unmap any buffer. The buffer is
getting removed from the list after it is unmapped from DSP. This can
create potential race conditions if any other thread removes the entry
from list while unmap operation is ongoing. Remove the entry before
calling unmap operation.

Fixes: 2419e55e532de ("misc: fastrpc: add mmap/unmap support")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 29 ++++++++++++++++++++++-------
 1 file changed, 22 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index b629e24f00bc..d54368bf8c5c 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1868,9 +1868,6 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 				      &args[0]);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
-		spin_lock(&fl->lock);
-		list_del(&buf->node);
-		spin_unlock(&fl->lock);
 		fastrpc_buf_free(buf);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
@@ -1884,13 +1881,15 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_buf *buf = NULL, *iter, *b;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
 
 	spin_lock(&fl->lock);
 	list_for_each_entry_safe(iter, b, &fl->mmaps, node) {
-		if ((iter->raddr == req.vaddrout) && (iter->size == req.size)) {
+		if (iter->raddr == req.vaddrout && iter->size == req.size) {
+			list_del(&iter->node);
 			buf = iter;
 			break;
 		}
@@ -1903,7 +1902,14 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_impl(fl, buf);
+	if (err) {
+		spin_lock(&fl->lock);
+		list_add_tail(&buf->node, &fl->mmaps);
+		spin_unlock(&fl->lock);
+	}
+
+	return err;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1997,14 +2003,23 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
 		err = -EFAULT;
-		goto err_assign;
+		goto err_copy;
 	}
 
 	dev_dbg(dev, "mmap\t\tpt 0x%09lx OK [len 0x%08llx]\n",
 		buf->raddr, buf->size);
 
 	return 0;
-
+err_copy:
+	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR) {
+		spin_lock_irqsave(&fl->cctx->lock, flags);
+		list_del(&buf->node);
+		spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	} else {
+		spin_lock(&fl->lock);
+		list_del(&buf->node);
+		spin_unlock(&fl->lock);
+	}
 err_assign:
 	fastrpc_req_munmap_impl(fl, buf);
 
-- 
2.34.1

