Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56FB0207DEF
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748329052; cv=none; b=uCPeCArgdKflGTSI/Y+2WrYeP7C2LYBUJvL9vCfC/X6MdExhtDyqwjf1OtcXWmxvx5l3no9iT0oelHNp/x3zKSGveDo6u9w17TOJx8Hg9eea1xO7Hi1m4vlRQUWkpvO3l6Gr43w3r3mpOXQjMTooYn2n7tbWFwqcgtLt7oV8CcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748329052; c=relaxed/simple;
	bh=7/v8pHGMu5tZ7WvXe6QKV3wxG6RFDr9pfxy66V1wC00=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oI0ilis0QEKXlMAXRGe+XmKWzTlXTvR83aphRaYPBK9+YntRaJ4p+iAw3e7L19aU0An7GBOUPQ9u38qEx6coMbKPsk7a7/7fC7WiFDuTlyEaya+yD7+oXmqUvUJJVWgaWzktjKBtTo97tTaDcAiQrekObbWZbeNKf5BrdvVddbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=gqqw/CxB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="gqqw/CxB"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54R3YFca024736
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r7p5wIcucyhHrQxwAItjNvN0FjGJcDbXXW5crNDRZCE=; b=gqqw/CxBBoqY5ULM
	fhcwR2ESp+lUhMttOnb6nQUvjxqQbxsjrr+MgvEYDEZOzFFqdqhVRCcr9XCA3d8D
	1dJmXS2w2BEJswAvb/fF64dW6c8lxAUNLcwPgyGUM0jKknOq/lfBYoAsNtTG79ei
	/timmgLU6ND9wxd1rSg6PC6NcKobi5/7jKSEMeERXmZ117DvyM7wN0pEmeFjJhyT
	PhlbVzAJLncHtJySvLPpezCG89r68mdEbBPmhjOm15NZjYvqve0klavWogw6WU3y
	Lqlmr7ywNB+Eip+HMH4LsMcfHaOBIjSykk1mS1X5yKIjenZcM3DQRtDsxiapt9Qx
	DLGt/A==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6vjnxb8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 06:57:29 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-742b01ad1a5so4328348b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 23:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748329048; x=1748933848;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r7p5wIcucyhHrQxwAItjNvN0FjGJcDbXXW5crNDRZCE=;
        b=XppXvs2rak6Ogr9L7LvHBhcYT4FWaZEfVSjzG/GKbXt0A1oVSHsTP0TDnM+kRr03WX
         8+UXzL8k6rLojqciBvybEvYgHm0m94ZBwEFM3Hm0d0DfTRn7bhJubaOViLIMw4ur3LRQ
         YrsFGg/TD1MwPK+nee+7vGe7vym6sLU2KmMGiGv49Hx6lNQN4lZ4sF709Wl5KhYr8sRk
         0FyD2RqEa5YeAsfBlSG0kvZfQI/SPRSFcZkfTRLnkhMjh8tsSR/YOh/mk8SpJHqw4bqJ
         yXyJhCi5/cf2FeteM1TvCT53behbAl5ofsC2Fln6Mej2kxwKyiEpM8BZ/sca+C0ZOrpH
         VKAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUX8EU9iex7O76GeOMD0iWf+ktC/iQpdxgjw78Sw6Y5gKM+c9nH/eqoMXWCuM/3z7D5bLbvxEMl0t8amFY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzt8oEcehmS26xiDg6DfQruHJkdI/Ia3lGlkLcOICbYJdvLQQQh
	Dyd2Fbk5fOvavS4L0Z/scAs5Zy0Frem1SpFROHKt7V9RQ1HkR1AD/HNWzp1tisvkKcIviQxULq9
	Sxcgr9FFL+zt6EQ98P9LFEGmvp4PbFZfL9BXMe3lVj6zxaTtV+ysT2Ifw6anf4K5eiA==
X-Gm-Gg: ASbGncslVe+zRrxVi1qWbC+hZdj31e36X5tYPRsi4JwlnzwMz7arGKGZcH1vqMrCQNl
	k4PEzeTY/fJElCVOJMXUDCvPKpuCKFTboXYYpqPjoaGe3jUU6PHkHmrMesJf3hLzpgou21jugea
	Qb7uFxyYRiTlDXFCKgXFTfI/hzFVSs21KB/YpQuqhmz+1laUbYb2Gp0zh0t6CL7dTPqQetI+5we
	aKXSNSOOGU1gN3YzJFdZuvtUsp45EqYhC2vcoHQnoc/bItC4NmabqFajbvlDGjWRqfHUXuMn9QY
	DRYrSjJ0zA9BlrVHaITVoOMn62LPV3RXFu4KX2ERHOdUQkNfeN6g5MdTJQUm8MeAzYlqOZg=
X-Received: by 2002:a05:6a20:d486:b0:201:b65:81ab with SMTP id adf61e73a8af0-2188c28d896mr19833046637.23.1748329048477;
        Mon, 26 May 2025 23:57:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFexkA4NHo5Y8HvWG8uKoYr+LSlplsErj4F0+4oeGi5eDPlEZ9aK+pCe05GQcMii+vdIgVS7g==
X-Received: by 2002:a05:6a20:d486:b0:201:b65:81ab with SMTP id adf61e73a8af0-2188c28d896mr19833015637.23.1748329048099;
        Mon, 26 May 2025 23:57:28 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a970954asm18037286b3a.46.2025.05.26.23.57.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 May 2025 23:57:27 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 26 May 2025 23:56:53 -0700
Subject: [PATCH v5 08/12] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-8-024e3221b0b9@oss.qualcomm.com>
References: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
In-Reply-To: <20250526-qcom-tee-using-tee-ss-without-mem-obj-v5-0-024e3221b0b9@oss.qualcomm.com>
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
Cc: Harshal Dev <quic_hdev@quicinc.com>, linux-arm-msm@vger.kernel.org,
        op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
        linaro-mm-sig@lists.linaro.org, linux-doc@vger.kernel.org,
        Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Authority-Analysis: v=2.4 cv=UOXdHDfy c=1 sm=1 tr=0 ts=68356259 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: cqxBG9I62pVKPgVRNFqJHRz-v7jhmSCn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDA1NCBTYWx0ZWRfX5RgaCtNMSc9+
 HxTlIzg16akD/EVfGoj4xJoVU+zlg2vq4TNUUYEgCQY74xlcb5DNbcA3lJ2DeXZCKjI7SsBAJvN
 cEpEhDdDn2lY2fHfRBqP41R2gMHTo6kpXbaBoSYgWreef4xwJjJhzluCdDBOoRrVFEfKCCdCYMl
 8MDcIQadldlLYRtDf68hDS0cApNOvtERZypFY8xsiNDBeKOY+GIvsDuyjK2C35OOEE0FcIKMynK
 JxkA2yIUVmanNjD5ioHKYojmFiIoOlOREBQv4+papxc+vojjIOAysjPZzZK2wadtDnHVnL0+6vb
 mfYodils72pJ0+mqbA5nAUIRjy3krVHpP+EEsgYIkeQaudXmmpYsYYTcRit1nDAxdSPuoA8Ti3L
 QpcS5Dhw9tg8rhq6YBhi80hBfQ5ote4Si/NByt/UKP8fiDrBcX0FaQ89NFm3WjSsIUFDZBXv
X-Proofpoint-GUID: cqxBG9I62pVKPgVRNFqJHRz-v7jhmSCn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_03,2025-05-26_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 mlxscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270054

Anyone with access to contiguous physical memory should be able to
share memory with QTEE using shm_bridge.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_tzmem.c       | 57 +++++++++++++++++++++++++-------
 include/linux/firmware/qcom/qcom_tzmem.h | 15 +++++++++
 2 files changed, 60 insertions(+), 12 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 4fe333fd2f07..e9e4f06924ae 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -108,25 +108,61 @@ static int qcom_tzmem_init(void)
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
 
@@ -139,10 +175,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
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

