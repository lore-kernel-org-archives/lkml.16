Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C690C21CA07
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750731250; cv=none; b=pHlQzS+hPixRoUnaSprLsW1FlJBVS1YNKI3NofPrr4NhUgG3TYOqf/d9yiaxC13xEsKRUucSB0xUpnCUJ/wDRSijWbQA8X03ww0kArJD2NawtLQM74vyCArDzGepc8rSBpldbkRxRXgQbcOhiBi66DK9fjP0EfU7yINfbCzK2dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750731250; c=relaxed/simple;
	bh=wG551jlH0C2VxSckm5aelE4czzDPVSQlL7LK/7YjW04=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JRyQgSLUWFPncCbTyRlTpccPtg5R3CYf8lTYp7FEFPt2vzZnyjSxLsp0HGWCqLDqP+ctJtxC/FnLGSwlU57JFirqC3i1zQ5+EL0VJR0B/BDU8tEw2nHqrwlroE5bRHDMiVzSvpiKN1C99zpOQO3H4l++sbD3qi9JOnIp18BXcqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pjdmwOXO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pjdmwOXO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NKlQ6a008157
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cvUFSAy9l8jMi9mogfX6vjAbGULsygLy9EYrsovMUQs=; b=pjdmwOXOmVPsTvYX
	Wx8Schg4YuQH/zvPFHiWsYud922Kza1sKs9PvLHBX3ff7uGQ8v2V69Fk79Oc0+37
	SwBpK2gx6ND9SS3jbcakmeahzK3QHNlmSNw4qcbCIt70d9Khslr4e4Dx9l/fMY3G
	Kd6UKR6eVGyV93+uKd4xqCcxIOAra81gmFd0lbh9i+2nIPrbkCRAdKtApMSEisTR
	yLDBVP8BYOxTtD3wiKmM5fJGHvmjv1aBn1QayuVt/laImqRysMWnTSrvcd+05M+t
	VN7d+ixaqmk/ZBQsTRsrThIn2NXXKS/QbZisf8MiNs3pRC9W9qcFR13/dH5WIkXx
	VO6DSA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7ttspvy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:14:07 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5e2872e57so745956685a.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:14:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750731246; x=1751336046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cvUFSAy9l8jMi9mogfX6vjAbGULsygLy9EYrsovMUQs=;
        b=ekpTH8XjdbEBEOTJGJdIN42CjWPLAvsNBR26g3Q39O9jhVhM+4J1ueESAslcF5cC6K
         ds4z7vyxu+9x8oLqSZXi+pdxdcZiK5bs0L5Ih5Qk+y3TCXtT3RDb4dDFNkRLEbxdQ/0d
         wOQZYdtnjURIUplaGdR0TvUta+nFjvprqH04adMx2HcQO6ktFiwtutzs3JrrC0LPjhGk
         /J7+71EAKX9gY4xb2HMqpimJAYP24/444XCw9Pbsja2BBhxOjWDkDPNOsm7oMW0uV7Vf
         Y0bWCIcu/cklTYaC2YSebtLT1kwig0Xhhp9wg6STW1BWnbfxrAGeBd2dniE2oGLwkGke
         Lgkw==
X-Forwarded-Encrypted: i=1; AJvYcCUvENPR+idFzQr5IZT0QO44DVIs8uvGVZ2fYe8RHTPqqvW6ECnILjdgY3E/4ylXsBIi2KX+M5lZj3SwG9M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyj02WvOf8BvLVhqMat9x7Y3ixuuU1NPZDSzvvisPKg5pOdpkVi
	Nc3UA5Ph838qpXiJyZ6mWWxrHb55Bi2Ch1lNFa7b7piMAitKuV+6+dXAbUZM60ITGR+gKUNCvKZ
	zpm+PbD1o/HUsCm6e3nk5+IQbZL/UmCOD8xTIO/kprhpDa7prvj3cFnk+MQFFjl5MbD0=
X-Gm-Gg: ASbGncuXBe8++8x3SQbLbUdplbj7/XEewgrVKqGv8REbEVeGcI8UGOKm+F7R92Ym6Sz
	gft1BwClYYJC+lnnu4ECkyzvGk6cqWIv2qYbcFfY+q7LPKMuiMpI9Dw7HSgy6+XOWmflFPCLtn8
	2/z7Ne7PGy+3KON6t1bRa/6w4bbIT14aLdSwJmgs1RIXkWPmH6OJwTkVyDOjb1wfvxCBz1vO0E4
	7wjDK4TP/7qeMkCmusdZG97ROkFxnMui33r5klEY1SEoV+z3n5BBEXAR5DDWUqSNePUjb/cwg6/
	KqSyRALjvKN2kD5ANmLN4JNdVVAlBpsTym7b7sNEAflu8DPeqMCS8ZeXPMkrTesChF3pIreb/Qd
	XbqJmq84u4idUqjLgfcCnBp/KWBfIdGXKs04=
X-Received: by 2002:a05:620a:2947:b0:7d0:97d6:e94b with SMTP id af79cd13be357-7d3f9935975mr2351199585a.31.1750731246381;
        Mon, 23 Jun 2025 19:14:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHkXbJittVHOSyXOOLR1ysMuHaAOy9QfdW5AffuasgX73iivo36XMGte8oHvZuzT9Ip0TpTtA==
X-Received: by 2002:a05:620a:2947:b0:7d0:97d6:e94b with SMTP id af79cd13be357-7d3f9935975mr2351196685a.31.1750731245967;
        Mon, 23 Jun 2025 19:14:05 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41446e2sm1637764e87.32.2025.06.23.19.14.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 19:14:04 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 05:13:54 +0300
Subject: [PATCH v3 3/8] firmware: qcom: uefisecapp: add support for R/O
 UEFI vars
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-more-qseecom-v3-3-95205cd88cc2@oss.qualcomm.com>
References: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
In-Reply-To: <20250624-more-qseecom-v3-0-95205cd88cc2@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Maximilian Luz <luzmaximilian@gmail.com>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Johan Hovold <johan@kernel.org>, Steev Klimaszewski <steev@kali.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-efi@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2869;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=wG551jlH0C2VxSckm5aelE4czzDPVSQlL7LK/7YjW04=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ0YU51MeVrlae4UlrlnnYqbzb/6qnhx8TOdaYcICmbnXL
 vuwf7vXyWjMwsDIxSArpsjiU9AyNWZTctiHHVPrYQaxMoFMYeDiFICJeL9n/+9jxL3+bqdxJOf3
 82b9bDekLtscEFZocS+zqC/6L9v3QYxn35TgxxHVi7a0uIXyOr/tVTP443dSgyVdu+vWF7WEjdk
 LDsj06Lc8+Sb6QFjiRrzcNPd/EzPfRTxuXMf3q6nBY0eL+1kF+8MLd8Qec1jW+qBH2+bGL/+ab9
 90/ee8WHO/PCjX6VifckiR644jxVEH3zax7TZl2hB3adYWnc97Nx4IqO3TZSxy7t9SxH0sYE7a0
 S7JPKZ5/161PklOz27bEGGdWnlOsijIz9y3frPxrq9FZrGH/od+ehryMO78RmZn5TmbX/orJoSV
 rXkQt9x/6dbFz1U3Ky/slucy47q3dGJsZrZy0rxM3y13AA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a09ef cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=hoImanld2GFzOgiN87EA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: 2M62LhOgB-SxuFX-pL6znuNLh4gm0OHU
X-Proofpoint-GUID: 2M62LhOgB-SxuFX-pL6znuNLh4gm0OHU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDAxNiBTYWx0ZWRfX4jhvFIq+7Ojm
 DMeAe3HUF7SCFT7NsoIqfP6Vi3YgPS6AU8ZrsSCvypu2W0KY/kykZ+xQI0ORQV+q/nW5PVkD0vM
 qHrxQBlm++IINO34YMcqa6r9aSIjkPBxYJoAoZRMVk6qPynTXXMRYRZmpHdf6Zox8OvQFLoqnKA
 GqGuF7sSjt1UwQ1r+fwC+XMW6WiEs5EK1Y4q8kW1IQ8WEjK/hKxru7yKTU6X21BXBwTTwLvpmes
 KD9FhAB6v2CBtmhdvNJu22W50lRZ3D1+tlqdMUpP1rS1wdKcMT3dd1aoUz0ha9VttSMxHB/T5p4
 /n7wM6e1UTNT4rLQYWq8ZdF5dZCNQzwEvVXnxpKkgSX8agVClZnZi2eYuqeTvQszXkbuc0mqPxg
 o48J8zgWgzkNkMyUX7USZDMvpi9N9OZdR/wLSuU9lTSixxVGCT0wxgPMeR9ia58d+oArdkp0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=999 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240016

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

