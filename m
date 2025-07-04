Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B4DA2882AD
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 08:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751618256; cv=none; b=Bod5f2Thp4FPrp6B0sxYvnNxe1AeuIQxRlRcnahaIoMviRVXPrRnS4pA/Sq5Vlsux6N1A4O1USBo+XM4Q0Yg+xW7iNLq/efdT9E/O/voBL8pH1erZbq5GVBBouUt1j0NvkYBoTH0SYZNn3OUKXznj5NYbi36rhTc+Eg2wWPFmPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751618256; c=relaxed/simple;
	bh=5X8sWKvvA8QUReoO4bKwECzn2HLyoBXROlN8g8oegfI=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=POuS8DYUs238NQSDQnW7kk8rEuITuEAOxGHxEk9mzQWN2tlEzLXWT3dZ0YGrZP/eN7i7u6tQqw9pR9+6EjDJFgzTykem5NFnmYEajK232m5TQMhyrrgEd73YAY8IR82Zq6s9GHyFSqiHjHM54rVKVk+uBXJgZJXIB6zlLFy7Q4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RwmFv/Vr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RwmFv/Vr"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5644MDLI001541
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 08:37:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=9mrH41Ue8HyV4g5LafeSKPRlgP+xtMSl2/W
	8spQJ1nw=; b=RwmFv/VrOxDWn/9MRZIwYu2i7s7JbsPFrYfxgkX483a2R4uF6m5
	dfpHEwoCR4SR68gRSkioB/IKfp4DebLK9N6/mZACFJ+VkTrxxXSrOocH1n2s32ya
	87/Fy6x4UJQl1P3XCXODeCtRYzwAYeqiRqqZOhSPMSSx9Zk1FqeT7rnIk6d7Qu2T
	Tx3leLTalQ4tZCA0ueqyZD8bjV7U/wN7Wbi1Al4ibzvIeuqssUIfW/ShusNnmATv
	JybGjLkhOMXBx4dpRx3zwCXP2UPtI1voJtpT0pngxMwQdI6ibfcXTV0S4cse8jbX
	3AiuZJLv/eIg+T9x718xyfRdnlxHwx9u0dA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47p7ut0pr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 08:37:33 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-740774348f6so712100b3a.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 01:37:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751618252; x=1752223052;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9mrH41Ue8HyV4g5LafeSKPRlgP+xtMSl2/W8spQJ1nw=;
        b=ek6pDfIWXWuoP4ZMAg8nV2YCEf988khVasNvON7XS7nd46eEUSCBx+AdZYXd0Jw5FJ
         dCLC0R89yiD3HFB3asYypGh8CwjXY3EA9AqKslgCJbZgGrIafICAxfm/JiHsz3zAKcBg
         q1TM87gu2SgCiVI1cDrqccxHpYE4WpwN0gYwHFidprE6NYNpvWuz37rDUXwp4YawDiKF
         yzOISTNWQ2Hn4eEbt/45pol21hx/k2irO8tYS6hUYYVPJ8rNFYxy9f8ta3+OmDnawjl0
         QaNdnWONFQwdlp2oFb3tMdHM18WV/e3NKLMpt7Uw+T2VjO0hmIdNhgfBFs5L2uxVosqf
         Ujuw==
X-Forwarded-Encrypted: i=1; AJvYcCUuGyvA41UfIKWovjKj2zCf2a4D4FXZZu4NMICZbmHkr3yOKFIjTWQAcRNEKDZ++uzxi2TUQeyKlrCgQKM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4L89JGpdjfuQ8iYfyKLxq0o+oInbfktHSM+Yzb9hWK607Fr7J
	zxp7VXMcn60MVcL7ZrYDcCFqJNa2/kbFpL0DSkRrvUFciEbR4fioFzEms50mj3bmm7A/69/twEV
	tS+ic7d2IwxLQPcrbJsL7MkOTpAsS2Z1Qm4J9MgcxgUmLl9Np6CpC2prmLk5v9Dj/qU4=
X-Gm-Gg: ASbGncvNcroPOeVJJyxGwQf8Cezs+hRegvohrDa/u8AG1asEay3DwV9vHSett1ukgwv
	XJlk4eX2GRhP//ZcmA+lUPa9+HhddwA7YwIFxkRIK5D6twkhpXIZ3WxpfgcZWpGTzAI+uciHM1m
	ziWhZ7jA1KW0iKCYGybGNtHPTgRDFPNQdklpVSpSiG7PdV5Bbtz46BMsCfE7ndWpTCYv+OwqFOm
	0pssEn2Vf0I2/IaM7+lOgp0vnZ0NEHCDKE58pdic7/eXcqvF8uDpZIyC8uKo5YOcbcHhTFPaB/z
	N7TNNuV6k8LdvSP0StrFoZZM+w7hUSz7otuibyhab4OGYw7rh+lrDqs=
X-Received: by 2002:a05:6a20:729a:b0:201:2834:6c62 with SMTP id adf61e73a8af0-225c07dfa94mr3176308637.25.1751618252193;
        Fri, 04 Jul 2025 01:37:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG0wtR64pukP0DCbAn0UqUe6kuH+yno3K+Yfn3NeYIHerc5XDeRwKrBM9aqYfHqvE/NWPkUHQ==
X-Received: by 2002:a05:6a20:729a:b0:201:2834:6c62 with SMTP id adf61e73a8af0-225c07dfa94mr3176276637.25.1751618251747;
        Fri, 04 Jul 2025 01:37:31 -0700 (PDT)
Received: from hu-ekangupt-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b38f060165csm1281630a12.10.2025.07.04.01.37.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 01:37:31 -0700 (PDT)
From: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
To: srini@kernel.org, linux-arm-msm@vger.kernel.org
Cc: gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de,
        dmitry.baryshkov@oss.qualcomm.com
Subject: [PATCH v1] misc: fastrpc: Add support for userspace allocated buffers
Date: Fri,  4 Jul 2025 14:07:26 +0530
Message-Id: <20250704083726.1901705-1-ekansh.gupta@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDA2NiBTYWx0ZWRfX5+TmqBd+ymNq
 z69AD2eXoDVQzX/8fSk6OQyGtYyLGlY/vl9ZMFEh+q6s3fIZkSZcZtjIxOA5fIXdAWecz0xFMyJ
 ou+UcoMdUBdxpBa3gjVn+uXZo1H9Z6wLoYCZknrLzEtj6gvCX49LHUSCL1gZ4gUpadY9Zi6nPU5
 ZPGiqX33Zl7GVeTS5+Uo3yEBYhJl80P+WBFkaLYJAoei21q+RkPz8d3+Mwx+CeTWb8bGtihL07S
 4xcSuEj2b7DjDUEPClkk+4KOHhevrLI428GsUenP8czZVnvfUmxp2wG0Sai0ZSSfL4r5jcpWfXC
 P0r+RIhQcGaiUSTmxoEjeN/3bKQpC3uU+fS/x0m2Oz5BwwugC7OAjsSvd1EJrPV0CFJCJiRMNb3
 ui/8DiFGVMc5BByXAgYZd15PKcPlc0x4JbPLJbAUxeoc47VHoIzFxzHOpKNILJ70nWhtvKia
X-Proofpoint-GUID: QCKXVyU8zdkQYCWnRA8a_Sy0RFhuBzqk
X-Authority-Analysis: v=2.4 cv=Ncfm13D4 c=1 sm=1 tr=0 ts=686792cd cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=cATS2htxDwLtVxRmqX8A:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: QCKXVyU8zdkQYCWnRA8a_Sy0RFhuBzqk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_03,2025-07-02_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 clxscore=1015 impostorscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 mlxlogscore=999 spamscore=0 malwarescore=0
 adultscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040066

Support mapping userspace allocated buffers. If userspace allocates a
buffer using rpcmem or DMABUF and sends it via a map request, fastrpc
will map it to SMMU and DSP. Add support for both map and unmap
requests.

Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
---
 drivers/misc/fastrpc.c | 188 ++++++++++++++++++++++++++++++++---------
 1 file changed, 150 insertions(+), 38 deletions(-)

diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
index 378923594f02..3c88c8e9ba51 100644
--- a/drivers/misc/fastrpc.c
+++ b/drivers/misc/fastrpc.c
@@ -1797,17 +1797,16 @@ static int fastrpc_get_dsp_info(struct fastrpc_user *fl, char __user *argp)
 	return 0;
 }
 
-static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+static int fastrpc_req_munmap_dsp(struct fastrpc_user *fl, uintptr_t raddr, u64 size)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
 	struct fastrpc_munmap_req_msg req_msg;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
 	req_msg.client_id = fl->client_id;
-	req_msg.size = buf->size;
-	req_msg.vaddr = buf->raddr;
+	req_msg.size = size;
+	req_msg.vaddr = raddr;
 
 	args[0].ptr = (u64) (uintptr_t) &req_msg;
 	args[0].length = sizeof(req_msg);
@@ -1815,6 +1814,16 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MUNMAP, 1, 0);
 	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
 				      &args[0]);
+
+	return err;
+}
+
+static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *buf)
+{
+	struct device *dev = fl->sctx->dev;
+	int err;
+
+	err = fastrpc_req_munmap_dsp(fl, buf->raddr, buf->size);
 	if (!err) {
 		dev_dbg(dev, "unmmap\tpt 0x%09lx OK\n", buf->raddr);
 		spin_lock(&fl->lock);
@@ -1831,8 +1840,10 @@ static int fastrpc_req_munmap_impl(struct fastrpc_user *fl, struct fastrpc_buf *
 static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 {
 	struct fastrpc_buf *buf = NULL, *iter, *b;
+	struct fastrpc_map *map = NULL, *iterm, *m;
 	struct fastrpc_req_munmap req;
 	struct device *dev = fl->sctx->dev;
+	int err;
 
 	if (copy_from_user(&req, argp, sizeof(req)))
 		return -EFAULT;
@@ -1846,35 +1857,91 @@ static int fastrpc_req_munmap(struct fastrpc_user *fl, char __user *argp)
 	}
 	spin_unlock(&fl->lock);
 
-	if (!buf) {
-		dev_err(dev, "mmap\t\tpt 0x%09llx [len 0x%08llx] not in list\n",
+	if (buf) {
+		err = fastrpc_req_munmap_impl(fl, buf);
+		if (err) {
+			spin_lock(&fl->lock);
+			list_add_tail(&buf->node, &fl->mmaps);
+			spin_unlock(&fl->lock);
+		}
+		return err;
+	}
+
+	spin_lock(&fl->lock);
+	list_for_each_entry_safe(iterm, m, &fl->maps, node) {
+		if (iterm->raddr == req.vaddrout) {
+			map = iterm;
+			list_del(&iterm->node);
+			break;
+		}
+	}
+	spin_unlock(&fl->lock);
+	if (!map) {
+		dev_dbg(dev, "buffer/map not found addr 0x%09llx, len 0x%08llx\n",
 			req.vaddrout, req.size);
 		return -EINVAL;
 	}
 
-	return fastrpc_req_munmap_impl(fl, buf);
+	err = fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+	if (err) {
+		dev_dbg(dev, "unmmap\tpt fd = %d, 0x%09llx error\n",  map->fd, map->raddr);
+		spin_lock(&fl->lock);
+		list_add_tail(&map->node, &fl->maps);
+		spin_unlock(&fl->lock);
+	} else {
+		fastrpc_map_put(map);
+	}
+	return err;
 }
 
-static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+static int fastrpc_req_map_dsp(struct fastrpc_user *fl, u64 phys,
+			       u64 size, u32 flag, uintptr_t vaddrin,
+			       u64 *raddr)
 {
 	struct fastrpc_invoke_args args[3] = { [0 ... 2] = { 0 } };
-	struct fastrpc_buf *buf = NULL;
 	struct fastrpc_mmap_req_msg req_msg;
 	struct fastrpc_mmap_rsp_msg rsp_msg;
 	struct fastrpc_phy_page pages;
-	struct fastrpc_req_mmap req;
-	struct device *dev = fl->sctx->dev;
 	int err;
 	u32 sc;
 
-	if (copy_from_user(&req, argp, sizeof(req)))
-		return -EFAULT;
+	req_msg.client_id = fl->client_id;
+	req_msg.flags = flag;
+	req_msg.vaddr = vaddrin;
+	req_msg.num = sizeof(pages);
 
-	if (req.flags != ADSP_MMAP_ADD_PAGES && req.flags != ADSP_MMAP_REMOTE_HEAP_ADDR) {
-		dev_err(dev, "flag not supported 0x%x\n", req.flags);
+	args[0].ptr = (u64)(uintptr_t)&req_msg;
+	args[0].length = sizeof(req_msg);
 
-		return -EINVAL;
+	pages.addr = phys;
+	pages.size = size;
+
+	args[1].ptr = (u64)(uintptr_t)&pages;
+	args[1].length = sizeof(pages);
+
+	args[2].ptr = (u64)(uintptr_t)&rsp_msg;
+	args[2].length = sizeof(rsp_msg);
+	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
+	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
+				      &args[0]);
+
+	if (err) {
+		dev_err(fl->sctx->dev, "mmap error (len 0x%08llx)\n", size);
+		return err;
 	}
+	*raddr = rsp_msg.vaddr;
+
+	return 0;
+}
+
+static int fastrpc_req_buf_alloc(struct fastrpc_user *fl,
+				 struct fastrpc_req_mmap req,
+				 char __user *argp)
+{
+	struct device *dev = fl->sctx->dev;
+	struct fastrpc_buf *buf = NULL;
+	u64 raddr = 0;
+	int err;
 
 	if (req.vaddrin) {
 		dev_err(dev, "adding user allocated pages is not supported\n");
@@ -1891,26 +1958,8 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 		return err;
 	}
 
-	req_msg.client_id = fl->client_id;
-	req_msg.flags = req.flags;
-	req_msg.vaddr = req.vaddrin;
-	req_msg.num = sizeof(pages);
-
-	args[0].ptr = (u64) (uintptr_t) &req_msg;
-	args[0].length = sizeof(req_msg);
-
-	pages.addr = buf->phys;
-	pages.size = buf->size;
-
-	args[1].ptr = (u64) (uintptr_t) &pages;
-	args[1].length = sizeof(pages);
-
-	args[2].ptr = (u64) (uintptr_t) &rsp_msg;
-	args[2].length = sizeof(rsp_msg);
-
-	sc = FASTRPC_SCALARS(FASTRPC_RMID_INIT_MMAP, 2, 1);
-	err = fastrpc_internal_invoke(fl, true, FASTRPC_INIT_HANDLE, sc,
-				      &args[0]);
+	err = fastrpc_req_map_dsp(fl, buf->phys, buf->size, req.flags,
+				  req.vaddrin, &raddr);
 	if (err) {
 		dev_err(dev, "mmap error (len 0x%08llx)\n", buf->size);
 		fastrpc_buf_free(buf);
@@ -1918,10 +1967,10 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	}
 
 	/* update the buffer to be able to deallocate the memory on the DSP */
-	buf->raddr = (uintptr_t) rsp_msg.vaddr;
+	buf->raddr = (uintptr_t)raddr;
 
 	/* let the client know the address to use */
-	req.vaddrout = rsp_msg.vaddr;
+	req.vaddrout = raddr;
 
 	/* Add memory to static PD pool, protection thru hypervisor */
 	if (req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR && fl->cctx->vmcount) {
@@ -1956,6 +2005,69 @@ static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
 	return err;
 }
 
+static int fastrpc_req_map_create(struct fastrpc_user *fl,
+				  struct fastrpc_req_mmap req,
+				  char __user *argp)
+{
+	struct fastrpc_map *map = NULL;
+	struct device *dev = fl->sctx->dev;
+	u64 raddr = 0;
+	int err;
+
+	err = fastrpc_map_create(fl, req.fd, req.size, 0, &map);
+	if (err) {
+		dev_err(dev, "failed to map buffer, fd = %d\n", req.fd);
+		return err;
+	}
+
+	err = fastrpc_req_map_dsp(fl, map->phys, map->size, req.flags,
+				  req.vaddrin, &raddr);
+	if (err)
+		goto err_invoke;
+
+	/* update the buffer to be able to deallocate the memory on the DSP */
+	map->raddr = (uintptr_t)raddr;
+
+	/* let the client know the address to use */
+	req.vaddrout = raddr;
+	dev_dbg(dev, "mmap\t\tpt 0x%09llx OK [len 0x%08llx]\n",
+		map->raddr, map->size);
+
+	if (copy_to_user((void __user *)argp, &req, sizeof(req))) {
+		err = -EFAULT;
+		goto err_copy;
+	}
+
+	return 0;
+err_copy:
+	fastrpc_req_munmap_dsp(fl, map->raddr, map->size);
+err_invoke:
+	fastrpc_map_put(map);
+
+	return err;
+}
+
+static int fastrpc_req_mmap(struct fastrpc_user *fl, char __user *argp)
+{
+	struct fastrpc_req_mmap req;
+	int err;
+
+	if (copy_from_user(&req, argp, sizeof(req)))
+		return -EFAULT;
+
+	if ((req.flags == ADSP_MMAP_ADD_PAGES ||
+	     req.flags == ADSP_MMAP_REMOTE_HEAP_ADDR)) {
+		err = fastrpc_req_buf_alloc(fl, req, argp);
+		if (err)
+			return err;
+	} else {
+		err = fastrpc_req_map_create(fl, req, argp);
+		if (err)
+			return err;
+	}
+	return 0;
+}
+
 static int fastrpc_req_mem_unmap_impl(struct fastrpc_user *fl, struct fastrpc_mem_unmap *req)
 {
 	struct fastrpc_invoke_args args[1] = { [0] = { 0 } };
-- 
2.34.1

