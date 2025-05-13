Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A06631E98EB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747110531; cv=none; b=umYiZeRD4SqsqZ4g4Y8pkiDEkH0Ly7TDxd5U5kGF6L1L9GUWLOTfvRh9p73Y1HDcpAUBYHKRLrrfPqK185dFlFcPdOzDOugKIaro7aP1mg8+baUHTGvak2hGTR5X8jgur8fFEcN2xfcNLR+VBUcpAhBcwtFailLougLpeMxxauc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747110531; c=relaxed/simple;
	bh=b/jdrld+JHj+dMZXOOpKT68s1sxFCgElAgmgr19swG8=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=EhWnS+vP/kgaatrg+Mj9LUn94VXusJNYdmByYlETPldUVKrI8ZcxC5u0EjMx/uh7covkpDAZclzVqLs4ewYHldQec4Sogvrn5vsfpwEjcgEeHL52GT4qF3zdFeINau7d0vn/j+Bumotd6SNye6/6KMIEWx8r74cYvP2DNqEDy/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=clTGICtS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="clTGICtS"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54D3Y1vb023210
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=qholBjkmu03
	FdHRvMAFEHiCnlryUcq+WCE0WsE9Lw7w=; b=clTGICtSj2YYasarQEdnigsEtQN
	1UT8M62U46N245c09+C/51ctES6Tg3128eZijR98FSW6063mS6gmg3vWCExn5jA1
	HxHOEDjuuM+RpI73EOuZ5Jbkessxk/V197ZAxaaimVcSSnHcgRyVPrQjuPzEbc6d
	FkihbXrK7v4FwHkFrFBrJwSlDbJZMCA7v2qih512O8V318lh3vOp5OGriOtC3/vE
	OA4OJsaUAktMv4vKFFcfk2bGiNSAbWqRC/KU2vKKDWyWq25hA8DuWsA0L8PMsilp
	36TYkTHCsHglJrnm037fNcxKru69Pz2enzw936vvkW3gl/WVLeYMHtsubyA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46kcfejwfs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 04:28:48 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-30a29af28d1so4489620a91.0
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 21:28:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747110526; x=1747715326;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qholBjkmu03FdHRvMAFEHiCnlryUcq+WCE0WsE9Lw7w=;
        b=PyUazIYPsOSY33v7HfwNXK1PeIwHsFyWF88tFD0fvA7c3XEUItkITVjVyPBvC/cb72
         hpBL5vTgEXVmTEFVlxgg87PPTBRqs7DuyzWbfXYjQml+HRp0CfBNquFQaDkd2IWdJp6M
         Rg6S8bFrqKddpfIc37sKe/rpF/aGcV8BI3xhy0tsf56U7pOKKrcGA0Z2GS2kijMyDFSP
         0CFVd7udW/ulkZXNK9Ot+1wqwQRiO8oSseBGJEz6EgIdIm30buTb7aYAhhX/UZsxddMV
         ofNiZKSUr9EOdb8yHgyWMGDkQh4Cl8IM1z12MJumnUA2cqx8CIC71HoCp7lQqvtfyrBU
         YAFw==
X-Forwarded-Encrypted: i=1; AJvYcCU7OdDOPOKmCliPAtEuH7lhiHvAsG7nHup8nUEwOg6R+OE0PHSyBkWKPhRW6aarBjhSevr2uoMg/lzKP7A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwH6qQyuvmWq8f0qsLUkDKghbz5MhreTWidQN0+jTBXq8VkmR8a
	xiVLBXCyd11wgFJ0O4PVFPhUxM8xGCpJvE/E4/d3pCUuq3T8XXO44xZTiYRWjal2LGdMFiumASy
	yT+EY35L79TelDxtrQ9jAbf7kAH8PLAWLUaWQbXFwKwnbG6blijiuOGIaQuNEnypEfZA2A50=
X-Gm-Gg: ASbGncvq8JwbBvgmfxDg2+ugI0ke3VRdm/Y8q8cYErVNndbi3C8ToRS1FrVmaEqqzNC
	Z+Jgi0wf6w3+DE+ybTrUmCWkWkWPvk9D0kf4YPypMGB63Tw+cPmKQb0Iud3LFLkOT7MeL8jiVcn
	XivxEAwUMONnPPUkF03dobCqn3fgwLUclj0TQNnyMC2F3WrcqwEZHHT5OQEwKaP5j49wKU1iWaW
	Ly6EGOn7he5DOibE5LuqvoR+lYV6O2Jj0r0eW3Vt88NpzTPJb6H4pLSPFvjQ6/mWbI22EFMuQ9f
	6Ly20k3kR6MgMqjtgJNOoJospebomwzlpsBUfRxxopmP
X-Received: by 2002:a17:90b:4b4b:b0:308:6d7a:5d30 with SMTP id 98e67ed59e1d1-30c3d3e0a86mr27034337a91.18.1747110526294;
        Mon, 12 May 2025 21:28:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6dBAWDLUjqJ4kvsD4zVoy0B09Mb6RcQq2ArhYi6gGrcPHxd8tFxTtMMDWjf6AjNgGa2lz2Q==
X-Received: by 2002:a17:90b:4b4b:b0:308:6d7a:5d30 with SMTP id 98e67ed59e1d1-30c3d3e0a86mr27034300a91.18.1747110525743;
        Mon, 12 May 2025 21:28:45 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b234ad3e9f1sm5486101a12.35.2025.05.12.21.28.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 21:28:45 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: [PATCH v1 5/5] misc: fastrpc: Add missing unmapping user-requested remote heap
Date: Tue, 13 May 2025 09:58:25 +0530
Message-Id: <20250513042825.2147985-6-ekansh.gupta@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTEzMDAzOSBTYWx0ZWRfXwGWjbAPWOBQu
 oINtuAR4rtIsAQZ5BSUEO9odeEa22EXMhSUwi1aF5LRffgax4X0bznTc5yWABRDcnb4iMpZBTyt
 xdhuFHTfUg2vrLh4ztIoXjyj0yVS61FTRHVg9PcusRwm2vNIldFvgHottxaPUeM59WET0+cCS4A
 j6vaoAeyERaCJXWVholAl4ENIT/CcLSiMWem6aQ8ELZaydqf+82kvsK3Lz95hHHDKDvHaSYiZTk
 ABmwgi/0FqbdI3TcwvOnLX0o8Gy64eqU8tBQR5DaRBSUC25beI95FizXJZtpm6y95sk7BfOSdk+
 YxrERtk5DJ81E28HqWaG0Xyc4JObINbPeR8L1BwfKCUYbCQkf2WoqGV8qjKgnmHKONFRsmbawll
 NwZKVwTGQweh/t1t4Fa5vsZwg1E4wbM7FZppmwncoJTLvs4PhAo7dgQS0hJKe/bNxDW9uWwe
X-Proofpoint-ORIG-GUID: WEXIDMvjzAj6hTD4DHVXr1AlrIy1Cd0b
X-Authority-Analysis: v=2.4 cv=asuyCTZV c=1 sm=1 tr=0 ts=6822ca80 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=8BRqyYDQAlS27bmPn4kA:9
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: WEXIDMvjzAj6hTD4DHVXr1AlrIy1Cd0b
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-12_07,2025-05-09_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 impostorscore=0 malwarescore=0 mlxlogscore=999
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 bulkscore=0
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505130039

User request for remote heap allocation is supported using ioctl
interface but support for unmap is missing. This could result in
memory leak issues. Add unmap user request support for remote heap.

Fixes: 532ad70c6d449 ("misc: fastrpc: Add mmap request assigning for static PD pool")
Cc: stable@kernel.org
Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 62 ++++++++++++++++++++++++++++++++++--------
 1 file changed, 51 insertions(+), 11 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index d54368bf8c5c..b64c5b9e07b5 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -197,6 +197,8 @@ struct fastrpc_buf {
 	struct dma_buf *dmabuf;
 	struct device *dev;
 	void *virt;
+	/* Type of buffer */
+	u32 flag;
 	u64 phys;
 	u64 size;
 	/* Lock for dma buf attachments */
@@ -1867,8 +1869,26 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
 	if (!err) {
-		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
+		if (buf->flag == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
+			u64 src_perms = 0;
+			struct qcom_scm_vmperm dst_perms;
+			u32 i;
+
+			for (i = 0; i < fl->cctx->vmcount; i++)
+				src_perms |= BIT(fl->cctx->vmperms[i].vmid);
+
+			dst_perms.vmid = QCOM_SCM_VMID_HLOS;
+			dst_perms.perm = QCOM_SCM_PERM_RWX;
+			err = qcom_scm_assign_mem(buf->phys, (u64)buf->size,
+						  &src_perms, &dst_perms, 1);
+			if (err) {
+				dev_err(fl->sctx->dev, "Failed to assign memory phys 0x%llx size 0x%llx err %d\n",
+					buf->phys, buf->size, err);
+				return err;
+			}
+		}
 		fastrpc_buf_free(buf);
+		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 	} else {
 		dev_err(dev, "unmmap\tpt 0x%09lx ERROR\n", buf->raddr);
 	}
@@ -1882,6 +1902,7 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
 	int err;
+	unsigned long flags;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1896,20 +1917,38 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
-			req.vaddrout, req.size);
-		return -EINVAL;
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
 	}
 
-	err = fastrpc_req_munmap_impl(fl, buf);
-	if (err) {
-		spin_lock(&fl->lock);
-		list_add_tail(&buf->node, &fl->mmaps);
-		spin_unlock(&fl->lock);
+	spin_lock_irqsave(&fl->cctx->lock, flags);
+	list_for_each_entry_safe(iter, b, &fl->cctx->rhmaps, node) {
+		if (iter->raddr == req.vaddrout && iter->size == req.size) {
+			list_del(&iter->node);
+			buf = iter;
+			break;
+		}
 	}
+	spin_unlock_irqrestore(&fl->cctx->lock, flags);
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock_irqsave(&fl->cctx->lock, flags);
+			list_add_tail(&buf->node, &fl->cctx->rhmaps);
+			spin_unlock_irqrestore(&fl->cctx->lock, flags);
+		}
+		return err;
+	}
+	dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+		req.vaddrout, req.size);
 
-	return err;
+	return -EINVAL;
 }
 
 static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
@@ -1977,6 +2016,7 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
 	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->flag = req.flags;
 
 	/* let the client know the address to use */
 	req.vaddrout = rsp_msg.vaddr;
-- 
2.34.1

