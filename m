Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 861C421148C
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743130114; cv=none; b=H6XIHzE/bh3306prF3rs6BnKqnOQ7w4oGFUl4WA2yiauFdBWegSqnGbgE/zA/HeyMBx2bdL+ZAwIG57vW5i+d9Thlx6yknEHhC7pvIy/D+qsmcJFJYAc5K6sybq6aj0F1dr/uZXzuGGUrzLmaVqfbXQ6oru/7oqDxSxgjt2EGfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743130114; c=relaxed/simple;
	bh=NZ9UoQrDtsa/bdxaCCDtRbtSyRUdRiMoDWerA6WxR6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oDhQEQ3f6YcvSMuoRWYBqqWo1kdD+ZcWgCZa9g1dv9jMc9wsDhrbPSdzdpzvuAu/bOg3MDcKLZZX2kkknWyDAmCZXzZGsaQuWQZpgOmewSo4HWA2wNSNnf5UstJe0iaSkGQ3cDF07QNtKF6MbfLfRFPe6YH1OmqB9RpIRxMioJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cmm9uEWV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cmm9uEWV"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52REQB2P003117
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=; b=cmm9uEWV1oeL8jPl
	MZVPPVx/4ZLP/0uZyhNkOysZJYIlURsbiOcbhp9287dAHOSzVN0owQEWzpoX/U8M
	u8oYodI8dXj+TQxf3nKFcTYpAi4L9fGBEUROs7Js74yaAxRGvgOO7Rbpep+2tcOe
	xwqrtdBlTdc/5NQH+ntXoKRX+LR8MR046dAHHNV/t1RfGB9EuzQJtSZ9B/VM5Kqv
	bQkOQ+jHKDRYEvqfKXAlZnCaTB6YHWYadkg0U8MCQmNmBeRvg0Bnq8RGE90NCqcG
	DGrU37NkA8q4LlNmN2Ig/EOany7qaIVdGR3LwCdLHEeeyGcJXWdoYVbQDZAE1Kk4
	e9q2qA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45m0xe03wh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 28 Mar 2025 02:48:29 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2242f3fd213so27704915ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 19:48:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743130108; x=1743734908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=;
        b=V9LQ+5MH4Cw85cByADkDqg29O8N2tyvIxe6soiilzmZJdbaLZzZBZQJaKFhWT2wPt3
         yZuNWfW1enO6NPxuDhfH1GYYdcAZ2e7FTku+k2x+oCblDi1q68e5SUw9DMR07L/2gAVc
         dQpnQGhPlzIXr/ze3ZAOmPHjm0T8XIlqw3AZqtoRebhUe4ltYBrnhQj9pGjZAZ1FXq3o
         GNrDgQ1IuoX6F0sMZDJAtQwJ5ywvnNmtIpDXsGe9KeD2nSJV2hbN1Gv8baIB8cg9EPWq
         p8AezEQG2IgUOSpFXIwTV/xkSnp11zeZA+Ry13P6VZH8ZVEF2E7NdS/j+ZYVnyatm5BQ
         nwuQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUncgJfKt7Eh9Z9OsLryBdEgmes6fdoOpOu/VahXp4K+lslSIYY/Yn9NzP6JSWHwH5EKjEF82z6bXHPDM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZ4HQLaISjp5KoWuR40LVCwaqQgClDOyAYVFCKbpUysp5iZtW/
	4cY2fMbr9riPeOyp5/0blW9GybfXcrrhbtTLFD6MRV3O/t8y0FE+/qKHVxklBr/3wA04yodzkia
	cWW2aAOdbLjKuftAJbXCVBiFORHuh64jg/dim5H9h9zJmZIdSMagWmRgAZxodLQ==
X-Gm-Gg: ASbGncsJHqTgOFSrAegSudL8fW4l7ffnVz2zLPIUUwM6rAmZL/3MM9LZrQ2Q/vJv+On
	iqFW8mErqxPQldR3WyOxL4SnZ6+N2JlGYgkJjfUQ+RQUktGYnnYH2ehGNVIxuEUwavx87EurO5/
	b3Jg0S4nQIHjXCu115WVhTCAv6RJ+BxoYTpGtS6a0JyKjEp0GACCbA5qokCbXqRFH/h4qpVpG90
	khGvrvuZBdSkJgyAwmt0RSQuslj8Lu2btv2LBGC+hQxIRWAOIIu2LeRG+nAWUZoDfJOzQbeZRxp
	oPtscTwAVebF4N5LB2zle2iUREAqDoIuDzZivUsh5InJUvICHMP4TaABPB0waETcIRgWxM6UFu0
	=
X-Received: by 2002:a17:902:cccc:b0:224:584:6eef with SMTP id d9443c01a7336-22804931682mr102373995ad.41.1743130107548;
        Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG376plMAvRztvVxrFSFDPsbw7FDsAlz+S1si6EBOZRDE9gW0Z4qYLof7JAVDpMRLsJ8rwJEA==
X-Received: by 2002:a17:902:cccc:b0:224:584:6eef with SMTP id d9443c01a7336-22804931682mr102373515ad.41.1743130107044;
        Thu, 27 Mar 2025 19:48:27 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291eeca203sm7317565ad.30.2025.03.27.19.48.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 Mar 2025 19:48:26 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Thu, 27 Mar 2025 19:47:29 -0700
Subject: [PATCH v3 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-7-7f457073282d@oss.qualcomm.com>
References: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
In-Reply-To: <20250327-qcom-tee-using-tee-ss-without-mem-obj-v3-0-7f457073282d@oss.qualcomm.com>
To: Jens Wiklander <jens.wiklander@linaro.org>,
        Sumit Garg <sumit.garg@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
        Apurupa Pattapu <quic_apurupa@quicinc.com>,
        Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: linux-arm-msm@vger.kernel.org, op-tee@lists.trustedfirmware.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        dri-devel@lists.freedesktop.org, linaro-mm-sig@lists.linaro.org,
        linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Proofpoint-ORIG-GUID: VedKsy9SG6gKRvAhR9kS4hbP0-ZIK3Ok
X-Proofpoint-GUID: VedKsy9SG6gKRvAhR9kS4hbP0-ZIK3Ok
X-Authority-Analysis: v=2.4 cv=Q43S452a c=1 sm=1 tr=0 ts=67e60dfd cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-28_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 mlxscore=0 priorityscore=1501 clxscore=1015
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503280017

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 548dbd346b1b..a02913665801 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -107,25 +107,61 @@ static int qcom_tzmem_init(void)
 	return 0;
 }
 
-static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+/**
+ * qcom_tzmem_shm_bridge_create() - Create a SHM bridge.
+ * @paddr: Physical address of the memory to share.
+ * @size: Size of the memory to share.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function creates a SHM bridge
+ * for the given memory region with QTEE. The handle returned by this function
+ * must be passed to qcom_tzmem_shm_bridge_delete() to free the SHM bridge.
+ *
+ * Return: On success, returns 0; on failure, returns < 0.
+ */
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle)
 {
 	u64 pfn_and_ns_perm, ipfn_and_s_perm, size_and_flags;
-	int ret;
 
 	if (!qcom_tzmem_using_shm_bridge)
 		return 0;
 
-	pfn_and_ns_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	ipfn_and_s_perm = (u64)area->paddr | QCOM_SCM_PERM_RW;
-	size_and_flags = area->size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	pfn_and_ns_perm = paddr | QCOM_SCM_PERM_RW;
+	ipfn_and_s_perm = paddr | QCOM_SCM_PERM_RW;
+	size_and_flags = size | (1 << QCOM_SHM_BRIDGE_NUM_VM_SHIFT);
+	if (qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+				       size_and_flags, QCOM_SCM_VMID_HLOS,
+				       handle))
+		return -EINVAL;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_create);
+
+/**
+ * qcom_tzmem_shm_bridge_delete() - Delete a SHM bridge.
+ * @handle: Handle to the SHM bridge.
+ *
+ * On platforms that support SHM bridge, this function deletes the SHM bridge
+ * for the given memory region. The handle must be the same as the one
+ * returned by qcom_tzmem_shm_bridge_create().
+ */
+void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+	if (qcom_tzmem_using_shm_bridge)
+		qcom_scm_shm_bridge_delete(handle);
+}
+EXPORT_SYMBOL_GPL(qcom_tzmem_shm_bridge_delete);
+
+static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
+{
+	int ret;
 
 	u64 *handle __free(kfree) = kzalloc(sizeof(*handle), GFP_KERNEL);
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
-					 size_and_flags, QCOM_SCM_VMID_HLOS,
-					 handle);
+	ret = qcom_tzmem_shm_bridge_create(area->paddr, area->size, handle);
 	if (ret)
 		return ret;
 
@@ -138,10 +174,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 {
 	u64 *handle = area->priv;
 
-	if (!qcom_tzmem_using_shm_bridge)
-		return;
-
-	qcom_scm_shm_bridge_delete(*handle);
+	qcom_tzmem_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_tzmem.h b/include/linux/firmware/qcom/qcom_tzmem.h
index b83b63a0c049..48ac0e5454c7 100644
--- a/include/linux/firmware/qcom/qcom_tzmem.h
+++ b/include/linux/firmware/qcom/qcom_tzmem.h
@@ -53,4 +53,19 @@ DEFINE_FREE(qcom_tzmem, void *, if (_T) qcom_tzmem_free(_T))
 
 phys_addr_t qcom_tzmem_to_phys(void *ptr);
 
+#if IS_ENABLED(CONFIG_QCOM_TZMEM_MODE_SHMBRIDGE)
+int qcom_tzmem_shm_bridge_create(phys_addr_t paddr, size_t size, u64 *handle);
+void qcom_tzmem_shm_bridge_delete(u64 handle);
+#else
+static inline int qcom_tzmem_shm_bridge_create(phys_addr_t paddr,
+					       size_t size, u64 *handle)
+{
+	return 0;
+}
+
+static inline void qcom_tzmem_shm_bridge_delete(u64 handle)
+{
+}
+#endif
+
 #endif /* __QCOM_TZMEM */

-- 
2.34.1

