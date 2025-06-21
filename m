Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 224D4271454
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535786; cv=none; b=kq1C6ILdZjE3NGjlmZ1uGJrVrdjz+whAfpqE3QCfoQ9EqZXGhnc9pLMkLa5GFcN7y+YlDQJg06XnZJnsyyXUK+jbF0FYeK0weZsgaP6OlrmTPl0tQ6hDbQy8iyiuvPaIzA1MAjIlBkff+C43oqBEgu0USGC08ZNsNn7d7ipLim4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535786; c=relaxed/simple;
	bh=wG551jlH0C2VxSckm5aelE4czzDPVSQlL7LK/7YjW04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MzpbBhKSniIWS/hYyx/0rMfJXdPEu5OBS7bJi9LhX9w5dCv4a3JTCy8eDKR+MocypCmQ3QCs92kAyHAyzEzKNZsGrUGBCSbs2mdaTmfQds+TfYBt9u8ybBiIN43CiNa4u3UBu3Qd4VASmr9V0ngaoeFMs34mAMd4PsHYHZg1bgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=En2oluqK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="En2oluqK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LGsP0o030562
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvUFSAy9l8jMi9mogfX6vjAbGULsygLy9EYrsovMUQs=; b=En2oluqKJsfi2sBY
	GZDSccJMhBIav2jpxtLIkVUSKFjRkURyBuxzCB+Vy6oBl68MZp4uzMzVqYRz3prV
	PDgoHL7Yy5XLaw/s4Blf10RA4NcQZESWW8cF2e6kZtYA/K5H5gYgudEbAUkScmdp
	q0dhrCnv3zjEQJBrY4ZOg0wG2onRBNzT9wrL52nd1QKMLZVVqv4/UNGukAXOS3M0
	gQSIkvLqYVrXXkZXRcYVOPuHZ49V3cAo/0lvHuFpHQei1lxveAvysPZn0TPp3S+s
	5mS7alz11kowGOx3veyWQq89VD8KGtVnOV1JOySyC1k+YDI5itKR2eMNYbUYNe2A
	WOXgRA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dpqtrxnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 19:56:24 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7caee990721so673405085a.1
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 12:56:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750535783; x=1751140583;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvUFSAy9l8jMi9mogfX6vjAbGULsygLy9EYrsovMUQs=;
        b=M9I2YvjbyPLb8CJgOI+YvYGI8jr4grW6nwo2wdH/kDtxBoj1ckB79pZLSwfFi2Q5i7
         EvL7h3xP9N08eHIcqDZp5dgmZo8ktNPPaGX3IGJmiQI3mGzWhCydHXcfwWXTDqvoaqu2
         sOl4PiK9BGatMFUlDfnjg91EzQ7yJYLlvrD5Jn69RJJBwJl75WHVu7GtyFHncWcCJp1Y
         T59m2mnBkpa1WAlKerylwXueU/NU42zlkK9FzvIJ9GmOqzLiA/kmppgFSrLL7tzWG0to
         Yc+kdlkaIqMpntfEHpJME5+zR/BE0v4CGum95BuPPjyK0j73QiQ+cU2Uc/2DkzkUQPE3
         YMFg==
X-Forwarded-Encrypted: i=1; AJvYcCXZcus3V4Bu4Ycye3TvOcODQsIA64QMLhl2qcKZLKUghB5gm++n31kOLvMCzuXlvcTpSRx4r4Z+ETOvymk=@vger.kernel.org
X-Gm-Message-State: AOJu0YweBctqNlDijM6vXG31Wkrjd9DD78AfrEDb5nGkJhafNZJbm7s/
	XYtCpmdQqfo4B29uCUPzZJpnoerbX3tXAiCqyiAe0Xh5XxncRSkOnsqOQqm6JDZfEp71ni4ZxTh
	D4nPFUaI7JXTuOnXI3+xn8ae2dMKpZAq04sLAmYdmjve//DDdTPbJ2cWLl4uvpZBviAc=
X-Gm-Gg: ASbGncsm7X/CVMk0EaRhureeu4Z4hOmKzhPNO76y0wAnrlnnRn6KW6fao+LV7CWrbs3
	cYu04crJ0baFZ6ig5QE4UtQKKkEbh/CrPtI10v5Hrfn1CoLebfWLd3WhuA5/FcO124gjQWuTVFZ
	E3GxEcz4KGVJllRbnMHj9LaovT19XSPartlCpgtjVJlETDrYzqC/wyItg4NNX8viHYvgMsjOy5X
	fA4q/f6hiysJhPlQQ33IqPDa7CfUyUO/i5o8i462TLDbVENMg2k1vFeUHGekX7Hljz4bD3i+YDn
	IBjdLlsYJ6n+JLWEeFFYWG1+8yeUSgRf+2VVLkJRM9AVxm9zZE6Hlah3TcHNR9GD2xPj8ngH9t6
	n/v1NrcZYBSEevGDb2dhS7zpym54PzuZjrME=
X-Received: by 2002:a05:620a:838e:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d3f992984emr990755185a.34.1750535782842;
        Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFZsniGGE82LOZjwRAMI5j6W4GAYUxfr852uUROLbuTM1uCFwwQFLWBmWdG0dysN50HDbWWaw==
X-Received: by 2002:a05:620a:838e:b0:7d3:8566:e9ad with SMTP id af79cd13be357-7d3f992984emr990753185a.34.1750535782462;
        Sat, 21 Jun 2025 12:56:22 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41c3db9sm777299e87.179.2025.06.21.12.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 12:56:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 22:56:11 +0300
Subject: [PATCH v2 2/4] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250621-more-qseecom-v2-2-6e8f635640c5@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wG551jlH0C2VxSckm5aelE4czzDPVSQlL7LK/7YjW04=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoVw5hrZNIIHb3EMyqf6Z+9AjkHJP7lCsaTgcap
 Gm6t6cOvPCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaFcOYQAKCRCLPIo+Aiko
 1XBXB/93mfYFN6rPVvIwDX6qQhPHy1n69lh35gdzG33CjTwN7punDuUBy27NLvuPV4/Ypy25qsh
 FLfe95P+RzWveANHcWnf8oCiHq9A82d6Ix1mBnG2rSQl5b6ATcO4ynG01u5v1avnDrsDSyhgQOO
 YbUYFnSgliLIIrotj3kf3C+Jt8CXWHmo8EosHYcikSKJ4um7HtyutNQMaoJvUl0Iwla2eaydr4t
 5ztvfo+WtgKlc4odf2pmILw2b1DIIv8xiEUYXUhbHOU0axvHVuQbzJbfy0kMvhoAMAyqKqDOkx3
 ZrHVoYY7SKsDSBLyxAUti+HoQrKQ0KtSrFrOPiFjIjrv4WS/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDEyNyBTYWx0ZWRfX4ielwlPn+1Rr
 BnBxTWlwnosUMT5v8j/d3oQwvDBDZ2/BY21GEGVwA9A+q5wW0s63pwfhYpu/ZlkpjR7JaAFs/SH
 T/KTIuIAq1YOU6/D/zN7hOT3RZHPSE+dzjjUUHsN/5Oh7pvL4SuhdJ8wNxHAsehkqDOkNEHjfM2
 ihAjopI5Cl5TjoGA7xFcPyQdC8pb7MF7wcwSt49WV+EnjzhIfrpoxSyn3c3n0qzVuDkNE52bNr1
 DxXH1qYXPHcBBLevXT3clLHPxVfzlDACQtf7otFAxuD7GrR0jJ5Li/7RbPbyhki6DN+TVPhR3U/
 TzYIr63FEoOZXNIVmSWxquRcV/zlmIpBJdI2LszpWM0YLoQOsKhYUysPJK8XUvspNPNfbTjQqP8
 OQk3ZWNDyx/arjyRQBaTpfxlmbdOVG6O/YumdO6TESpfauEYc1LSzMpGBpgNu0/S8xzsQc6p
X-Proofpoint-ORIG-GUID: wAP9OjpoyzvWKt-bZuwzNKazkpIo7Voq
X-Authority-Analysis: v=2.4 cv=cbPSrmDM c=1 sm=1 tr=0 ts=68570e68 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hoImanld2GFzOgiN87EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: wAP9OjpoyzvWKt-bZuwzNKazkpIo7Voq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_06,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 priorityscore=1501 phishscore=0
 mlxscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506210127

For some platforms (e.g. Lenovo Yoga C630) we don't yet know a way to
update variables in the permanent storage. However being able to read
the vars is still useful as it allows us to get e.g. RTC offset.

Add a quirk for QSEECOM specifying that UEFI variables for this platform
should be registered in read-only mode.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/firmware/qcom/qcom_qseecom_uefisecapp.c | 18 +++++++++++++++++-
 include/linux/firmware/qcom/qcom_qseecom.h      |  2 ++
 2 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
index 98a463e9774bf04f2deb0f7fa1318bd0d2edfa49..05f700dcb8cf3189f640237ff0e045564abb8264 100644
--- a/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
+++ b/drivers/firmware/qcom/qcom_qseecom_uefisecapp.c
@@ -792,6 +792,12 @@ static efi_status_t qcuefi_query_variable_info(u32 attr, u64 *storage_space, u64
 	return status;
 }
 
+static const struct efivar_operations qcom_efivars_ro_ops = {
+	.get_variable = qcuefi_get_variable,
+	.get_next_variable = qcuefi_get_next_variable,
+	.query_variable_info = qcuefi_query_variable_info,
+};
+
 static const struct efivar_operations qcom_efivar_ops = {
 	.get_variable = qcuefi_get_variable,
 	.set_variable = qcuefi_set_variable,
@@ -804,7 +810,9 @@ static const struct efivar_operations qcom_efivar_ops = {
 static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 				 const struct auxiliary_device_id *aux_dev_id)
 {
+	unsigned long *quirks = aux_dev->dev.platform_data;
 	struct qcom_tzmem_pool_config pool_config;
+	const struct efivar_operations *ops;
 	struct qcuefi_client *qcuefi;
 	int status;
 
@@ -829,7 +837,15 @@ static int qcom_uefisecapp_probe(struct auxiliary_device *aux_dev,
 	if (status)
 		return status;
 
-	status = efivars_register(&qcuefi->efivars, &qcom_efivar_ops);
+	if (quirks &&
+	    *quirks & QCOM_QSEECOM_QUIRK_RO_UEFIVARS) {
+		dev_dbg(&aux_dev->dev, "R/O UEFI vars implementation\n");
+		ops = &qcom_efivars_ro_ops;
+	} else {
+		ops = &qcom_efivar_ops;
+	}
+
+	status = efivars_register(&qcuefi->efivars, ops);
 	if (status)
 		qcuefi_set_reference(NULL);
 
diff --git a/include/linux/firmware/qcom/qcom_qseecom.h b/include/linux/firmware/qcom/qcom_qseecom.h
index 3387897bf36843cccd0bd933dd562390bf674b14..8d6d660e854fdb0fabbef10ab5ee6ff23ad79826 100644
--- a/include/linux/firmware/qcom/qcom_qseecom.h
+++ b/include/linux/firmware/qcom/qcom_qseecom.h
@@ -51,4 +51,6 @@ static inline int qcom_qseecom_app_send(struct qseecom_client *client,
 	return qcom_scm_qseecom_app_send(client->app_id, req, req_size, rsp, rsp_size);
 }
 
+#define QCOM_QSEECOM_QUIRK_RO_UEFIVARS		BIT(0)
+
 #endif /* __QCOM_QSEECOM_H */

-- 
2.39.5

