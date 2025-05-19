Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8D3E280006
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747662257; cv=none; b=hYL3V2KjlietwsJXTJZK/SZDuZGKMsA+LHhz2+Tff5WJj31W+Es9PjMSw21n8NKuA0d6G5LjODjibSS5t35HAQ74yM/fDiBZOufpRxokAvggdzQ6XCxWXXKKAZOhQqwIJiRop6XtbeJbazWG4B6O5tD6h/8GJJ7zTkcFTXT2eEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747662257; c=relaxed/simple;
	bh=yolDzczYpjPodf29Rfbyb9DI2HpvxGwqgiLVvEp10jc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=KICC5mKb0SXnHI/EvpwLLMhqMxRlXeIarRzucIKlg4tZl7OVr6SctVHomXMRJn/w//PWNTb6DbsegjEgGb++MVnyQjQRDXriRSaIx/nUFfC18/h/+eu1I3MHDIU5yrii7OIO06SQNXsLPVvMm78doHJqOo7vx3J20LUIFKAPI5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kIUFAD3a; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kIUFAD3a"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9W9vF026158
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:44:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=xRZkj0PsbJSbrYHAqES7DG
	XowTaGFY8sh3Gy0YZ8AWg=; b=kIUFAD3aULLaEX9l0oph1yfdN3gsuTdSGmaJt8
	dE+KVxnDUXIHcNYzQGoy87z/uTS30P0DDTNRe7fwdLiZaG3o1qzOmsBSi84KTOzr
	cOXWOy1xKIRk4BXHHbN8FhzcD1kkwZD6kcBdJSe4MTewKrMQTyMAuICHhfMa2xa/
	i/HL9USX6o/A4cxMU5YmkTJCUl471LsseroYxemPg+SVJk27xQHTbb8Qu6u9KRh4
	1Bi2yWrCrwVM+IUNSUrcvZNbXqKySyrt87IfnzeQ+iBfpquPaqgR6gRb1b0LV0WR
	aUK1U1kb91vOiLaDM998UUY7MCoc3NGbLYKzWwY5YepEmh7w==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pju7cgkk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 13:44:14 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-73e0094706bso6099745b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 06:44:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747662253; x=1748267053;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xRZkj0PsbJSbrYHAqES7DGXowTaGFY8sh3Gy0YZ8AWg=;
        b=Q2cESkon0P4MRshaWpuNgUw5RcLqFveE9IKIdDktAyw8k4aeSy4/MaOPMNtXEkrffm
         UHJHIoHFmTu3zjuKbjy9VpkFX9GgODv39tEEaN9ZwtBVJnejaBhPtHz9ovwEn6h8GBmS
         g3LK3fLtzfo4RL/MYrjWr+VL7+qc357LgIqHLcOzn6Z7CvHBUJIPZfzWFeu0z02YvqqO
         S7z4EkLYoSdc8D0fT4/q2VI3QtkA2F21OujtQoeLheGY+lqE2OJ+5W28yb3jUsYUQMNH
         KgSo+hyWKgTqFbtB3tEn0yQT1PeOaPDKn0fT1BfmjKBTYF2WVvGFK02+i1j2UbqqU0si
         baWQ==
X-Forwarded-Encrypted: i=1; AJvYcCXyQHwWn7dwkZVQp5rgR7zC4Enl918pH8CoJEO6TGzDpRi+KhOOsPg6q9g1FR4Dv0hO7ntdW4iYYLgpiRo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzQNlfX7jk6AiuPX9W1gCta10Flq7QELsLI2xIjCZWuc9WxWqYi
	n6KfWlMieeAkpny72oUTAma1rvtYSCawR7AvZ4GeDB93ethN057574xpn/tjjnDSizIx0liHKoh
	7GXPLrlpXqSqgFlq50KI+IgRDYvB//Qvlrxl+nZ71cMR4AxvG4YZ1yX7N+KsuVx4ZkR4=
X-Gm-Gg: ASbGncvlRBIVo4BmOQPAV5u1i5fexYyBiLS+Z4E7ztEUhb/2W+SDPdaNqL1Aj4SS8wo
	UwRumL2jZmfzcJ9+bXqE2JXnlff0fpyzsG81KGzZonmQNK1ydOwEI0Q6HBZb5It3il45+U7EsOx
	/iv3D4MHDCZ8bmWCxgndhKTtfg5KZlXE4JXm4XuySObGzOJXB1AuTNxbTa7s9A/nBVYDSvP//os
	d5zfc88XgQDlT95mKy0KuJ/HEUoc7C3/IlAmTC14QKGqgYClOkisik5c7N/wIzqNyPKhZZ+gMm5
	srRGJXHzc1jYrKCTL4tvkEv4e2BZonD/HQw9ZcRtAu2G/bbKnUOxLUHL09pwhQ6Cuk88p0FrpSk
	LyWIJZWDEDxnHN4aAZKa8uRVJo5fI2EpElY/HUDMOLUKyDMc=
X-Received: by 2002:a05:6a21:6e4a:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-216218c9b00mr18986024637.17.1747662252949;
        Mon, 19 May 2025 06:44:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGigiSPG56p4nzNA806fGLVPlqz8iHmGoh9R+kqK0uOaBp+WtDnh7QYxYoYPX/S8Opata9wyw==
X-Received: by 2002:a05:6a21:6e4a:b0:1f5:67e2:7790 with SMTP id adf61e73a8af0-216218c9b00mr18985987637.17.1747662252576;
        Mon, 19 May 2025 06:44:12 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-742a9829c7asm6224051b3a.85.2025.05.19.06.44.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 May 2025 06:44:12 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:14:01 +0530
Subject: [PATCH] soc: qcom: socinfo: Add support to retrieve TME build
 details
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-tme-crm-version-v1-1-a6dceadc10aa@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAKE1K2gC/x2MSQqAMAwAvyI5G2gr4vIV8VBi1ByskkoRxL9bP
 Q7MzA2RVThCX9ygnCTKHjLYsgBafVgYZcoMzrja1LbDc2Mk3TCxfi56S433FXHrDOTqUJ7l+o/
 D+Dwvm8Gba2EAAAA=
X-Change-ID: 20250519-tme-crm-version-a1c7aa3ce820
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747662250; l=1476;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=yolDzczYpjPodf29Rfbyb9DI2HpvxGwqgiLVvEp10jc=;
 b=hqd+Frb16y2/LvEKRCK5XyT3xzYM+U1MeoW7Z9/rtXv9jRgvhAzxVi1Q4xpKncJnRsyi1tuHg
 kE4F9JRgGbJAEc6RNKsy4QZMj7aqeR6PBqCFCqI9GWMKITIRloUnrxI
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=XKEwSRhE c=1 sm=1 tr=0 ts=682b35ae cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=0tr5gUXQH48V7W0Z41EA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: QonNYmmSEnxz7IiZETZWNR5p7oX1mXB_
X-Proofpoint-GUID: QonNYmmSEnxz7IiZETZWNR5p7oX1mXB_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDEyNyBTYWx0ZWRfX282IefEwetnO
 p9p0VqwgjHlYuaGQQqkC2BN0gFC3MrPKGsPx4iy8/ipMRAzfxqQwgv8vjaQOFZ2f/ASW2oa95C2
 2a7xkhedlkD1rFxDpqRHcD/IeON7eHXaUjFlrD7ZobUIqhI7saUDwx647E5pttcRIdZCi7Kg0N/
 NzIIUUumfCaGCmP2GmFDPAKHU/OBxi6IMVVhy02b5HSn4g8ZU9tc0LSOrgGtQMQ9/Bvnz6fetTh
 i85epBJ9bSOdM25qqTFWEDu0V1VdjqYwW5ejR/85nmMcXgKeJjOipYjJu9cUqFcyGvaI4p5G9wB
 YitWBpTndtLbznnyzns8xnCrEZxLyqHQPMTu/pep2ReTTp3g+ombF0b/8afERsItebhxkMAFMAt
 PCEWekkCEUzmv+Kmv24qTNJbFfACAoOS32wqKzUsuhF/cj609Ar/flO4bzWjsIFVpr5IpZvI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0 mlxscore=0
 mlxlogscore=841 phishscore=0 bulkscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505190127

Add support to retrieve Trust Management Engine (TME) image details
from SMEM, which is present in the IPQ5424 SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Note: On IPQ SoCs, the Trust Management Engine is referred to as TME-L
(Lite). Other SoCs from different business units may use variants like
TME-M. For consistency, the image name is retained as "TME".
---
 drivers/soc/qcom/socinfo.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/soc/qcom/socinfo.c b/drivers/soc/qcom/socinfo.c
index 8c4147737c35e3878db2def47f34c03ffc1fea52..391380820f082d8daa5c764d5f3c44e6240e18a2 100644
--- a/drivers/soc/qcom/socinfo.c
+++ b/drivers/soc/qcom/socinfo.c
@@ -48,6 +48,7 @@
 #define SMEM_IMAGE_TABLE_CDSP1_INDEX    19
 #define SMEM_IMAGE_TABLE_GPDSP_INDEX    20
 #define SMEM_IMAGE_TABLE_GPDSP1_INDEX   21
+#define SMEM_IMAGE_TABLE_TME_INDEX	28
 #define SMEM_IMAGE_VERSION_TABLE       469
 
 /*
@@ -67,6 +68,7 @@ static const char *const socinfo_image_names[] = {
 	[SMEM_IMAGE_TABLE_CDSP1_INDEX] = "cdsp1",
 	[SMEM_IMAGE_TABLE_GPDSP_INDEX] = "gpdsp",
 	[SMEM_IMAGE_TABLE_GPDSP1_INDEX] = "gpdsp1",
+	[SMEM_IMAGE_TABLE_TME_INDEX] = "tme",
 };
 
 static const char *const pmic_models[] = {

---
base-commit: 8566fc3b96539e3235909d6bdda198e1282beaed
change-id: 20250519-tme-crm-version-a1c7aa3ce820

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

