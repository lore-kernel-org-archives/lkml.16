Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B490F275849
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745906829; cv=none; b=eiBHHmvUPoHyEHwDG8QdySMh+j07oqO1QbwZJX+VIAN0jbLr0UIhrtFOYOt2Hy61cFirp4Oz1Jy5hDa2OvqdHjdnuIn187uw0G9bafk3MwsMn2fjH0dKehvavaIzOzhriQ9APRM7iLJLIGWQUEdp0MoptKe44Deok+DN57JymFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745906829; c=relaxed/simple;
	bh=W5kC8N4id0jgjxPJzXuRXDTRcStSEatZUDiitY0n/q4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pLKLVvbJzh9u1GAfv9bLbV+PWEwVkk/7vyeIGtgadfVjPMzsoOoZrC+pzBgiJ6PSE7odRSsm0M3NWHwCa3aBBwRiiaLtk7kWIRyfbw09YxC7qYUdUSD03QGYuPypuhFYYfS34du2ezPamfidM5hnl7LWzAZFUu0bjI0aMzPzDLk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JEX7SZIH; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JEX7SZIH"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53SNq4VN006066
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=; b=JEX7SZIHI969GEMr
	JsOaxoBPsOlCLrnFs9nGvRYTDD/3Ov7nOylb7CX3dcX84YCpEBgCyWFf6eTtpLyy
	D5dkvH++tyM3lRlqaCAo6qgsoaB/XoSH6PR/P0bOuDOTQgCz/YvZIOTSXIdjbCye
	KytCGXY89XS/icWX1DvXuNEeBW/0PtE5z/uV19NCbECqllaELKWkGkTcAIBx9ena
	c8+98nusZlRV9SnEV+Na/fQ83EkjAxrwYSDVHrSDS2C/I7doaH+2OvBABtnLsi5E
	bYagRXcYW40cgeOW3nprEM27gk1JykKr8XU5xhzVnbui+gyu7sRpb3HaDet/LBop
	gOmTyw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 468ptmkdug-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:07:06 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-6c8f99fef10so5974640a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 23:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745906825; x=1746511625;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lg7Nx8pcQfWvwE/UDeFmGOhXwmDLJxS5vqnqaGQtRx4=;
        b=cS5sxQrQUPB+4sRt1MFaL85CSssMRGIyVGX8zWzLOod25ZmlCYhcXtYkla20ihhoeE
         qoG9xIows8TN3RH4GfAUWNVEqE7u6Tkpc136iAp8fBJSrIhnd4ub1JvcOfgtUQ4K40GL
         EtdIJqhHLolQ47631fThlaXvrC4r3niWPEmM/pNMvWRL6pKKVjEiVl88zWqARmbY51lp
         K/2SfXPVY3o0aiRC35BmbKD/OdO7Ojwm+rVq87yzV6YOfCnecorh5t7gC9w45Xn4wfo0
         Lc773r1zlhxWATkTpj1MGftpyEG8T+YairnuRoCH/4O0K0ZYMcfPz/Q9YZ1EPJoKmqiu
         jYBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVgiLkhJqyxkk+RTnGRnXNU/mjoNYmHNlJbrv+4KWZ42u/3MGnEOxPFGyLpzDpzGMkf4b5KfdYxat3sj8U=@vger.kernel.org
X-Gm-Message-State: AOJu0YyfRAUTgLwdCmFN7M8mYi4tzNe9u5gWNaHHN0pHLxCPHtHjIBtn
	2/pbC9QVx5XXkVVXg9IQnOoN3bwp6ZfctoxYDgQwT8YyHHPOlnnsEAwOT7RoRbeCWh7BSk3WEmW
	M80TKXlD56MBCzIFkuIH1UP/l5WW4MstjKHWOX7Wv25xsWtHrS2ernjAgwwBaeA==
X-Gm-Gg: ASbGncs0/LCTsla4iHV+oLBLfH2rPg+IZbNLuA5MtwgKGbQmUaaZ9wOeKHx83+ervCK
	vjnVm4A4neUa6TMeenYTBkf6G3PBFPRiEQB/8TTsQAC7K8QmrXolGKg2H8rhV4wUoHYQHZMUUGZ
	PxdPuSPPnZbSpxTkcVhE76njJnhXnum3v0M5LT3DwtoU/QY7J2Cm67y5jJ/21nSgUUCBsJXhHQ9
	FUylXBm98VOzaldpa3SLvvPVkod5PP2WOF5MNRUtHKenbY7CFXfOzxXUP3j3NH4nofpH+ftUpk7
	T66SJMxBjzT+yj6R/t524cEYzWr8GFlAOkcvReNLdLQP7OimxcuHHIJOHdD5Vgx3vipQzDg=
X-Received: by 2002:a05:6a20:6f02:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2046a4660f7mr17453251637.13.1745906824830;
        Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEGglvLAHgrOV7iGI0hyH1ZbjgDlYIBAPRGE9nqhg3e33A4GqQ2E/mk1KOyhJNYbdwEI3f1mQ==
X-Received: by 2002:a05:6a20:6f02:b0:1f5:9175:2596 with SMTP id adf61e73a8af0-2046a4660f7mr17453225637.13.1745906824454;
        Mon, 28 Apr 2025 23:07:04 -0700 (PDT)
Received: from hu-azarrabi-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e25acd9cbsm9353642b3a.174.2025.04.28.23.07.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Apr 2025 23:07:03 -0700 (PDT)
From: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
Date: Mon, 28 Apr 2025 23:06:27 -0700
Subject: [PATCH v4 06/11] firmware: qcom: scm: remove unused arguments to
 the shm_brige
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250428-qcom-tee-using-tee-ss-without-mem-obj-v4-6-6a143640a6cb@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: u8bzdMvOB7q7GobGd1mS1llIq0EQm1BH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI5MDA0NCBTYWx0ZWRfX6OQN21JlH8Hd qclUjU3d7Je2yvoHwk5K9f6YBA9zcKMFBySudC+kxSCiwbpjAoqq2X+TjSG/ildd46R7ejQYgQz LPI9x+O1KIn/3Y9ocuI8/ObZHnDksM0wJfOPhL+HxtNXPoQp3DKgPSdl9ELIvDeo9J8z9yGsP7l
 YUi7b5ws1pdJiTlwbtDhVLZ6VWzJWVB5b69ip1jOK3itMwpF/EkCvuWGQ0hVtMI+68vaP0M1Ow+ o0jNSuMtVBAMlfaJtriunJP+aYMcfjmrGZclSaHR/f4jX4bZJzgjebdMKl6RFNMPhW+4xuTparP PrEjwlwbjXXZOEUQe9kriuxr1KZI5ZTE1yJaZzi7hqkJ/qkTX6IkgKwMS4JkNHpQxlNUYtsLuyI
 luuUrxA4oP5CNBeNCLPwMkx2VtbNZNyyT1tHFIpaYFOOSOZyWVPiW4JKFLgzubC7wY/j+BRA
X-Proofpoint-GUID: u8bzdMvOB7q7GobGd1mS1llIq0EQm1BH
X-Authority-Analysis: v=2.4 cv=DKWP4zNb c=1 sm=1 tr=0 ts=68106c8a cx=c_pps a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ViJ-rRY3MSY-B2NivjAA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-29_01,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 clxscore=1015
 priorityscore=1501 impostorscore=0 mlxscore=0 bulkscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 adultscore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504290044

shm_bridge create/delete functions always use the scm device.
There is no need to pass it as an argument.

Signed-off-by: Amirreza Zarrabi <amirreza.zarrabi@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_scm.c       | 4 ++--
 drivers/firmware/qcom/qcom_tzmem.c     | 8 ++++----
 include/linux/firmware/qcom/qcom_scm.h | 4 ++--
 3 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index bff1b0d3306e..9fd5f900d327 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -1631,7 +1631,7 @@ int qcom_scm_shm_bridge_enable(void)
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_enable);
 
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle)
 {
@@ -1659,7 +1659,7 @@ int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
 }
 EXPORT_SYMBOL_GPL(qcom_scm_shm_bridge_create);
 
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle)
+int qcom_scm_shm_bridge_delete(u64 handle)
 {
 	struct qcom_scm_desc desc = {
 		.svc = QCOM_SCM_SVC_MP,
diff --git a/drivers/firmware/qcom/qcom_tzmem.c b/drivers/firmware/qcom/qcom_tzmem.c
index 92b365178235..548dbd346b1b 100644
--- a/drivers/firmware/qcom/qcom_tzmem.c
+++ b/drivers/firmware/qcom/qcom_tzmem.c
@@ -123,9 +123,9 @@ static int qcom_tzmem_init_area(struct qcom_tzmem_area *area)
 	if (!handle)
 		return -ENOMEM;
 
-	ret = qcom_scm_shm_bridge_create(qcom_tzmem_dev, pfn_and_ns_perm,
-					 ipfn_and_s_perm, size_and_flags,
-					 QCOM_SCM_VMID_HLOS, handle);
+	ret = qcom_scm_shm_bridge_create(pfn_and_ns_perm, ipfn_and_s_perm,
+					 size_and_flags, QCOM_SCM_VMID_HLOS,
+					 handle);
 	if (ret)
 		return ret;
 
@@ -141,7 +141,7 @@ static void qcom_tzmem_cleanup_area(struct qcom_tzmem_area *area)
 	if (!qcom_tzmem_using_shm_bridge)
 		return;
 
-	qcom_scm_shm_bridge_delete(qcom_tzmem_dev, *handle);
+	qcom_scm_shm_bridge_delete(*handle);
 	kfree(handle);
 }
 
diff --git a/include/linux/firmware/qcom/qcom_scm.h b/include/linux/firmware/qcom/qcom_scm.h
index bf5e64f6deba..33fde08dce70 100644
--- a/include/linux/firmware/qcom/qcom_scm.h
+++ b/include/linux/firmware/qcom/qcom_scm.h
@@ -149,10 +149,10 @@ bool qcom_scm_lmh_dcvsh_available(void);
 int qcom_scm_gpu_init_regs(u32 gpu_req);
 
 int qcom_scm_shm_bridge_enable(void);
-int qcom_scm_shm_bridge_create(struct device *dev, u64 pfn_and_ns_perm_flags,
+int qcom_scm_shm_bridge_create(u64 pfn_and_ns_perm_flags,
 			       u64 ipfn_and_s_perm_flags, u64 size_and_flags,
 			       u64 ns_vmids, u64 *handle);
-int qcom_scm_shm_bridge_delete(struct device *dev, u64 handle);
+int qcom_scm_shm_bridge_delete(u64 handle);
 
 #ifdef CONFIG_QCOM_QSEECOM
 

-- 
2.34.1

