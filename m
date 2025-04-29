Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AD39275870
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906830; cv=none; b=X4SHtpYCVMIA5GGMlCtnHsCMm756dF/6NrKuxQQNMS1qbu01Z3SFxdO1XKtQZujbFUm3WkPKwf0vnO+OMYBiNTEWxRWz+mesQ+TBIJgEDWPGcI1ovdxI1YJA+etJi1Lts8Q/oopZYvY5bch8Aqmwkfyoyd23Jpxk56xgqxtLUDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906830; c=relaxed/simple;
	bh=NZ9UoQrDtsa/bdxaCCDtRbtSyRUdRiMoDWerA6WxR6c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J9ywtGmj9H7LpoQJlpAzBgx/TL5xImI2xhBCShNajWl6ATpa/haWGTa3yUAld7N2edKz359hVhXD1TBaI95HO4le1pnt5K1bZpsbefG3DIvXGXDWSPOmdHV74stFbTwNv9g+qlHuhVL+a6832fnMtgqFBihxSO7ny6ds8L251Bg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZtGsl3FO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZtGsl3FO"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq3ru011884
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=; b=ZtGsl3FOipkDgsFh
	sqDrYwvaDlCxRraUKyTkAY2kyqTLRhOpjEueW1qs4N1ci4Uq0fQk2V19q8Fd7+g/
	saIziV9O/f4wPl4M1WqF+s9jdoP8qyqhrEQr1+G3iuRixS7YIzhVaR3FLgVAMjBl
	i+YFR9AFQes6TpagJlMJwMdzCzbXNRqhb9pz5Dnr1MHZYOyOYoWYmCIzC79JnVSH
	YC00uGLspjsZpfWy3AT07Fkb4WWYbT91+puv48Rj1ryPRmOZ4O1CC4JH2Bmh7x+D
	N8pwe11pumMtETD09Y3nDZj+puX41l6+exAEGcf1+dOhqR0M2ZdPVNWDQTGrj8l2
	d5PeyQ==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468q323cs2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:07 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7395095a505so4253623b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:07:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906826; x=1746511626;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IWH0nupKGoXHcFbzQxDgDKgTTIrB45evqE6KF6xol4Q=;
        b=ivp3LGQ+kunnKDn7iYrIAlBSmvaBKy8iWvKfgx6+ckkvatMkm9E/pzDo9jkfz8ZqvV
         V9z6hPwY3EQCrL7wkQou0CspIAWbjQHlGmH+8w3JEqWMsEabHC6SJ/z6n9rz9EihFb70
         EeFo+WTGXu+1sp/OozwpHARXLM5/y6ze4p0e4V4hgwxzEmUAyRqc6LVx8yFjt4BOeEQK
         2Pp0mixRVMwySMcTH5luk0c4ZzzpBO457VrvEJz7sAJZwZQb7bM2ebwcMepZbrTkHxZc
         Bk8uaMflWuC1e6TsUE2eVV4kBY7P+wRPMGaz9vuhQV0p5kjl0990afJXh1cwSnlP6occ
         U/PA==
X-Forwarded-Encrypted: i=1; AJvYcCXUrUwdPdeTjnEbG5Vn1jM3b18AqMfXtkWbVqcfHKF+q/AC3Vh90VKk1pxSQBPSFuWswRiX5QEQOYMGESM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwneCe071tZ+bdQ5ebH2SxvKH9soSJWUFliCjzfTxGQxbjc5FEf
	P8xbvThDqgCIIN7gxvJ177udQ9CFSGyEyguULk1hHyi2jTyj0V8id1Rfs6Up3JYt+GAUD8ur/uw
	H//fEp8b1CThD2f0jQUje0u6ZSwhsgoaA7MJCi5OEOJpilh2qX7Zp+kdMIf3oig==
X-Gm-Gg: ASbGnct4qyiWiWJsJXykuUOkSxGJOqNv50tDhPvkEoh1FY0Twpssxmm3SsRxyiRSuEm
	/Dh0GMR9EUZj9UBgi6xKThj5Nyxkqf/qhWFmqAikZK9GlC+e5P4jA4jBtQuvDkNnPE78j08wszC
	HGBfphYezQyzfgcjdNvANB6juFJu7P45F6CECWYehgm9DMNUXIprPk2ZhF0RT4oRsKKyvCd3ZZU
	LBOK+jmvUaqCJuC7AbjoEpTV84R5jr7vr9VxkN8ctp3r9YpX5GIE8A4QSBSPRjCPHuqwv+nHjty
	XBbz8rgvBE+p5uitNPCJJNgw/wiUBfFVvt3B8X+O1HN4Lo5WTiLt4ZmdKxeQ9sBWYN60qCE=
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73ff7246ffamr16789998b3a.4.1745906826418;
        Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE/Iw5QWLjVAX0CA1a1Lr5eZnBvSqfuSz+6cNc/A6mOFVZZHAZTnGn+CTOmtVDh40vcM4lMOQ==
X-Received: by 2002:a05:6a00:ac2:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-73ff7246ffamr16789968b3a.4.1745906826019;
        Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:05 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:28 -0700
Subject: [PATCH v4 07/11] firmware: qcom: tzmem: export shm_bridge
 create/delete
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-7-6a143640a6cb@oss.qualcomm.com>
References: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
In-Reply-To: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-0-6a143640a6cb@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=M7xNKzws c=1 sm=1 tr=0 ts=68106c8b cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=F9FMNDSCD7THEPBdllMA:9 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22
X-Proofpoint-GUID: -VQPZ78_04dkEht37Q8rZJ8k9LZcQaDs
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfXw/WkuTFuwCp9 Hn6meu7AUJXRBfhkaqqrwlej6Vmtng7Frg77qIdmrmtTiEOUy9POl2+iv6VknzE6omr8AiDywbk B660H67+DApkyGRzde5NJ2HpbSYfhIG1bLWngmqknMzFRIUko1qgFwAZ7E6xxjAmrACz4ZRIKI0
 EG0UoQVZkty+eyUPLDzQuc/I3qg/JJZqjRBX4DLG5r0IaWrMGA44A6gqTvLLeTEvfeKExhqlX09 Ms2hc0j6Xyc4X72czWrdM9nlVZuuR2Krks1MKzvGBiWSa7vFDCLLna0CqVrEDZaLU1QwDRcNBtZ my324+hIeHMOD12gx8T6XqXx5wwaXSTlOyMHqpDSuARVNoGWAUR0F48rezYsaM/3YlZkm4HEz7H
 /qlPmM4n/+emKBm7wjxohIOBJfgylqI6E/KV3lTpbGT0NBM7h8WIAyr/o8IdHRdKNKAo+ALw
X-Proofpoint-ORIG-GUID: -VQPZ78_04dkEht37Q8rZJ8k9LZcQaDs
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 impostorscore=0
 priorityscore=1501 clxscore=1015 mlxlogscore=999 spamscore=0 phishscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

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

