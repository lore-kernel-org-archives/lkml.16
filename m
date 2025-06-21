Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97DE1270ED7
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535785; cv=none; b=oLgEmL/fdBs/M1goQtH0ZvGKFqjI4LISCivTsVHpJSUmMDC8UPOb9VuYLA3OZbl44Q+6V1lopuXTBf6hrAJ0hVvZOmF+YvkBCdrMGd//xkXd/6rDJiAwExqMrho6tdr5YQD47TXjk9JB8jS5JnKC7Fy7yecm3wwAmNZirM/SWDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535785; c=relaxed/simple;
	bh=21bPuONwZiRIZFNxfegj7j0cvEH9t3yTZXRBj64vmOs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hBn4rmDt9Q8DuBrq6BuuIaGzBJTqW7nksdbw+tjFgRT9bJFvOZiZAnm7HdtnunZDVCwRmzEr5uVTbrnunlvGDUYd/FkaKvRbzBp4aKzMR3KjlpOJoCe65DvZ2Hj4uJq5GW9WhpuEgjNUKLK62VnakhujX82jvwurRfbEdj269IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Qh68WRGY; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Qh68WRGY"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LATD4e024163
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XUVe7ITUPqyqYVHeOTH14ov/xBRaTDTuVazF2UDYYD0=; b=Qh68WRGYFOzGEb+0
	BnSqJfPWgfOQaYguqGUGi1PydfNm1gigS7ihX6Iqex+GIUIWf7QX0DqE8zvSiKnT
	Tzh6nStYjRIJWQD+F9tQKRzZNT/IXEGqKVTaejWFuKxVI3WNudWooV8YduifxTLF
	uGtx3Q0iHTll+df4SPMJvoCP1r8NCqx4XQkLuj4ZWmDsYrNtqPZVmqvQ1sYHuGUG
	y1hBfjnPd2UnD/n5o1ua5Mvat25r9KWg4sGgqdwBuAI30WqDT2EB5QsaPFcbC4S1
	rsfDmgms5mUzrQ6EoBkD7zjJagjBfOcaGCXEkyhA+ikVvjDVR4OjDEQFDRmeZbHN
	KQX7XA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47du0x0jr5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:22 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-4a43988c314so61574111cf.2
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535781; x=1751140581;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XUVe7ITUPqyqYVHeOTH14ov/xBRaTDTuVazF2UDYYD0=;
        b=noRn90GBdyW1o03+EFq0eiEe/eK1Vn93HVJY5pieAgpmSNpSXIW0kPuIohWbyuo5x6
         fBXkfQ0mYRrjEMPn0Pyl7KoWNIZ2V1ysnG1wsbyEgYfp5cQ2KQSt88o/L4CDSA8KZPJm
         5yT6FDnBVEr2132K/Tfe2qRA1BVK8Q/AUjlGQgzqsyDV8RI6Gs3A/UaMjzqzUF6Ku/rr
         0XGgUWWFyKopPcU/HShwqzoVAl76lo+P/2fbOB5kaixChT9dBNp1j8mJGlm8FLOL6hC7
         R/iOs2mUJBpLUgd/AxjjHfP0YPEWBjO1hdhEmbel8y9qoU7MbV5PzgnjzN7p3ILlQtYu
         uwOQ==
X-Forwarded-Encrypted: i=1; AJvYcCUUZcOLoULsgsrRuzR8tKMKPWpIvAME7GuNBYXu7PUZqgNybzc4Bfn77ckbKc+mlViCZJbAASeWrJ2p2DA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83IkQt7hIOcK091YEQNT2ly4JF2bxbuNLtjNuCMonhqL2RTHO
	UIY+DvoHTYNv6NBeG2S1D9PAFibX7suL0Uxz8W8GLgEtu2XJRZk4iYkzGEHWH9pgEh5EHPTK9C1
	VOw6HcJuNdYFA/2fGiZlm6QPenFSw4EzAqS9bn0DApg65l1vmDZoh8QWeiFFKNMETi/0=
X-Gm-Gg: ASbGncsZQRfSCzm/4M/hzyO9dfSYNF2YXatJT5XLtyvx0WgRquYwx7F+iK8rf/PG8t0
	LR8RjG1OzSi7pz6Sb89LqKQ2unDDjVe827GtqZAP2ADusIwyqnIjqbSa816N9eTrMkgeUf/E2Je
	vBzXKiRJ9dmi+qRAZv5CoXrZ0LZyk3Qqs4bbgjFARp/86ImjUaeLD2/7YPqIGEfClVkFniAs4aL
	/0ZzLW2XStSsJgv8DPzRC0yzoQtPYnJWNKFx7FnMB66FcHHKZ6ZYxLS9gJ0i2+ek+I6MZx57M8u
	Ann8RK6Ypa027RrwMo5rapj3qHdTktGm5iNzZ+RfynpSloxyMuxf1UWX/9gL6c+wtzyOwx+w3w8
	krEepxvkk0QVEBJEuZmwnMm/DyvifI/xYIa0=
X-Received: by 2002:a05:620a:1792:b0:7d3:ad4f:ce0d with SMTP id af79cd13be357-7d3f9939029mr1228160285a.47.1750535781304;
        Sat, 21 Jun 2025 12:56:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEczp0MIcOxWZp2evH4mmB+hJLicRclZ6gwYKbDPv5vCTz7lCxR1k8cqWFdZUfuUURN6+8D6A==
X-Received: by 2002:a05:620a:1792:b0:7d3:ad4f:ce0d with SMTP id af79cd13be357-7d3f9939029mr1228156785a.47.1750535780843;
        Sat, 21 Jun 2025 12:56:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:10 +0300
Subject: [PATCH v2 1/4] firmware: qcom: scm: allow specifying quirks for
 QSEECOM implementations
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-1-6e8f635640c5@oss.qualcomm.com>
References: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
In-Reply-To: <20250621-more-qseecom-v2-0-6e8f635640c5@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4151;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=21bPuONwZiRIZFNxfegj7j0cvEH9t3yTZXRBj64vmOs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVw5hbhGFspHA26nzXWOV4TXa6iy2zuIB1+khU
 ktHc4UyitmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFcOYQAKCRCLPIo+Aiko
 1UAPCACZAdY8K39NMIStkMZ1gjcotQNyiawh6SOFVEfo0h3PrR7JQHtGBG5tS/IoZ9PkZFc18DG
 UVdLBsg0fEG46ox5IAKmwiZaU3nb5EoCRYWOFuaS8jNxh9UcYF4bPxpmHcKpkUJnZmcM46+ggxA
 4dCAle8tUJQQp2WzkvWjrUNMNVrcKKrb5wgT3dmu/bLbeTClx9ekyRPYz+E7/6cA3quDYi5cn3y
 s+se97uLfpuEPvoQsAYDi27IN+gCjuTNyDLYJnzROpEb/TevKJYlM8wNY4mNxF3qRlj46GxYIiJ
 LZfmiWPBbW2fpPwHY1IDTpwj+L9a7DeVXLQYsarvQowTXcpO
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: vNe_h6KXDiIH16Ya5gPKdsL0Qz7W_vmZ
X-Authority-Analysis: v=2.4 cv=fYqty1QF c=1 sm=1 tr=0 ts=68570e66 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=wTlJEWXFZO-q-0qxHBMA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNiBTYWx0ZWRfX+4ij2vK1EkPm
 X9GiI6pdfhJ3TWEQoJnRtxLR3Ppngppw75rPrXoS9TAlU7tP5vnS/hnLw/jtgYyUnjQinj3S5JS
 gLsLRnqCkTj0upFrhVl0GssQlbXRRsP47eee9XMPXwu8B52xjvEkr03AHeEA7ZDSM9Ml57aWHXz
 P/pKB0fT1ObmnvnNUHmgEAnrgCp4cme6UyZLuukSWBMpvePOiKtkbxOf0gDQBAvBX2v9hDOlwqO
 pjqkUpWcNKeAudXfdvu75O8sup0FGpbMgK1e0rZXFXaij0/0UF4Zd+nVt37SD4vm/QFDLkuxJWs
 TT8wpKBogg1GfMl0xIICjMdPaYEhB0rY0KPqyBFZtCOHDKeHsSAz+dgqDJMVOqMDcpVTd56zVVg
 4NUQSujmJWQuyfPIfstCDWgamJ7gUj1BSgdF0RdS7mBZhTphoVXXBgnoRHt6zHwkfvbJUjlx
X-Proofpoint-ORIG-GUID: vNe_h6KXDiIH16Ya5gPKdsL0Qz7W_vmZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 phishscore=0 mlxlogscore=999 adultscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 mlxscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210126

Some of QSEECOM implementations might need additional quirks (e.g. some
of the platforms don't (yet) support read-write UEFI variables access).
Pass the quirks to the QSEECOM driver and down to individual app
drivers.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom.c |  6 +++++-
 drivers/firmware/qcom/qcom_scm.c     | 28 ++++++++++++++--------------
 2 files changed, 19 insertions(+), 15 deletions(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom.c b/drivers/firmware/qcom/qcom_qseecom.c
index 731e6d5719f9e3e9e698f5de0117540f51ebab63..aab0d61f0420c4f3d6c1a73e384195b9513f3ef9 100644
--- a/drivers/firmware/qcom/qcom_qseecom.c
+++ b/drivers/firmware/qcom/qcom_qseecom.c
@@ -36,6 +36,7 @@ static void qseecom_client_remove(void *data)
 }
 
 static int qseecom_client_register(struct platform_device *qseecom_dev,
+				   void *data,
 				   const struct qseecom_app_desc *desc)
 {
 	struct qseecom_client *client;
@@ -56,6 +57,7 @@ static int qseecom_client_register(struct platform_device *qseecom_dev,
 
 	client->aux_dev.name = desc->dev_name;
 	client->aux_dev.dev.parent = &qseecom_dev->dev;
+	client->aux_dev.dev.platform_data = data;
 	client->aux_dev.dev.release = qseecom_client_release;
 	client->app_id = app_id;
 
@@ -89,12 +91,14 @@ static const struct qseecom_app_desc qcom_qseecom_apps[] = {
 
 static int qcom_qseecom_probe(struct platform_device *qseecom_dev)
 {
+	void *data = dev_get_platdata(&qseecom_dev->dev);
 	int ret;
 	int i;
 
 	/* Set up client devices for each base application */
 	for (i = 0; i < ARRAY_SIZE(qcom_qseecom_apps); i++) {
-		ret = qseecom_client_register(qseecom_dev, &qcom_qseecom_apps[i]);
+		ret = qseecom_client_register(qseecom_dev, data,
+					      &qcom_qseecom_apps[i]);
 		if (ret)
 			return ret;
 	}
diff --git a/drivers/firmware/qcom/qcom_scm.c b/drivers/firmware/qcom/qcom_scm.c
index f63b716be5b027550ae3a987e784f0814ea6d678..fa7a3c4c8f006599dbf6deec0a060e1158c91586 100644
--- a/drivers/firmware/qcom/qcom_scm.c
+++ b/drivers/firmware/qcom/qcom_scm.c
@@ -2008,10 +2008,10 @@ static const struct of_device_id qcom_scm_qseecom_allowlist[] __maybe_unused = {
 	{ }
 };
 
-static bool qcom_scm_qseecom_machine_is_allowed(void)
+static bool qcom_scm_qseecom_machine_is_allowed(unsigned long *quirks)
 {
+	const struct of_device_id *match;
 	struct device_node *np;
-	bool match;
 
 	np = of_find_node_by_path("/");
 	if (!np)
@@ -2020,6 +2020,11 @@ static bool qcom_scm_qseecom_machine_is_allowed(void)
 	match = of_match_node(qcom_scm_qseecom_allowlist, np);
 	of_node_put(np);
 
+	if (match && match->data)
+		memcpy(quirks, match->data, sizeof(*quirks));
+	else
+		*quirks = 0;
+
 	return match;
 }
 
@@ -2034,6 +2039,7 @@ static void qcom_scm_qseecom_free(void *data)
 static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 {
 	struct platform_device *qseecom_dev;
+	unsigned long quirks;
 	u32 version;
 	int ret;
 
@@ -2054,7 +2060,7 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 
 	dev_info(scm->dev, "qseecom: found qseecom with version 0x%x\n", version);
 
-	if (!qcom_scm_qseecom_machine_is_allowed()) {
+	if (!qcom_scm_qseecom_machine_is_allowed(&quirks)) {
 		dev_info(scm->dev, "qseecom: untested machine, skipping\n");
 		return 0;
 	}
@@ -2063,17 +2069,11 @@ static int qcom_scm_qseecom_init(struct qcom_scm *scm)
 	 * Set up QSEECOM interface device. All application clients will be
 	 * set up and managed by the corresponding driver for it.
 	 */
-	qseecom_dev = platform_device_alloc("qcom_qseecom", -1);
-	if (!qseecom_dev)
-		return -ENOMEM;
-
-	qseecom_dev->dev.parent = scm->dev;
-
-	ret = platform_device_add(qseecom_dev);
-	if (ret) {
-		platform_device_put(qseecom_dev);
-		return ret;
-	}
+	qseecom_dev = platform_device_register_data(scm->dev,
+						    "qcom_qseecom", -1,
+						    &quirks, sizeof(quirks));
+	if (IS_ERR(qseecom_dev))
+		return PTR_ERR(qseecom_dev);
 
 	return devm_add_action_or_reset(scm->dev, qcom_scm_qseecom_free, qseecom_dev);
 }

-- 
2.39.5

