Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E23326F448
	for <linux-kernel@vger.kernel.org>; Tue,  8 Apr 2025 12:43:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744116218; cv=none; b=EMID1QxUyQHiDLL4/ai0nKX3u0qEao1EortIzjC9BeNcf/DXuNKYpwA6eL/xMQeyvZs1rp6u7kWbeRNqkAXsHLwKYMWvpokx8j7XQD1op1b54XW8jkVtSvbRo8XeRZ5SkeqpMuGZ7u12yBJ0V+6jRJs51OrwgCy1+swxw+4Z+4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744116218; c=relaxed/simple;
	bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=LPDVGuZnHl5Oe+p3d18KGfBlGWKxqQwj4ljGpnN654UWvjR96ssSkqGw+s9m+Z2BkDSx6ZSLTrXDWdDU3jFVBgRqjegyqFaI14w8dA9x82owuWx7DDaCrJ24axy8SI8WJAbPthowZOrRzp1lNH6vYEbmZyD0TOZXtH5+txgpbZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RrMdaAsD; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RrMdaAsD"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 538Aj2lk019568
	for <linux-kernel@vger.kernel.org>; Tue, 8 Apr 2025 12:43:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xpB3/REHEHCx3wA2Wg72W
	qgNxcZhB5rfGLsrI4xfBE=; b=RrMdaAsDwzk+81SRn8Ry13cSw6jPrksO3ssr2s
	0PV21O/KRUkSeyrXNHFxQiA2vE8cZBwtoXyjSI9WjaVZtHkLILgRG5f9po3w0aCa
	1bVFtO/QoRpRGkVdwGhy+9D9F7ucIwKymJq3CW8jxn3z6ffLOwW1w7MVoy5Twzli
	j0vK54QP3b44X+5tYJiYiXlfzOyCzq6DNP7i4eiEWNV3C0hxommPA+5fS4RuwIfD
	X1zCLQLvPh3EqNe2JVyR02euFVZNakQ6COvtiro8WSPAGufW8wIpCFD/JSmReogB
	9tLhvVdpjjPlQp/PSatIo/Thc8pdEg1t5fn+Tu3a4Qp/WENA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45twg3fr4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 12:43:34 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c5d608e6f5so1406536485a.0
        for <linux-kernel@vger.kernel.org>; Tue, 08 Apr 2025 05:43:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744116212; x=1744721012;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xpB3/REHEHCx3wA2Wg72WqgNxcZhB5rfGLsrI4xfBE=;
        b=wr4C7/GuGDoNcjjqYa9KW+bBkkawAb1TYA6n6bYaaWpvlSl6RGqL++85SjwX6A6Z3H
         vof0mvYyDCyutGsmPvhDfECqDHQYgwsp7dpn/zLj16TPo6/HbNMjzWn6h0DsXF4DCoWA
         iyTbyBOVHsODLZggHeKhOnXBd2gJUJ9CpJfnRyVwfigU40DYQ9Y4fJPvHsrPgTwe90bQ
         C4VDPhW/TPR1PqO2U6F0poo7ZgabK9LTyPxGl9du2K3ut8jqWVmxhiqKxR0DLUwdcBsh
         5Bh+KpFUa7Ajh5leYKiAfCgf3e+XXv8juY09LB10DQjABloV0iLULSuLLKrd61dyhqWV
         SkCw==
X-Forwarded-Encrypted: i=1; AJvYcCVTIEON8rIFMSMvfpjcXHJGg7lItvwBorxgZrWjS4adRVitt6liQfxt8sO1ivjnb+3QYftC0j+CzNitOxg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7WRDL3HV2upFsLBqhZMZxOijiM9XObCfjPSitfpQAQPlADL0r
	SUnUUgI/hq5rXP+WRpIZxcR66X7jb107VsD2xEF6vnffgZERXiG4DEb35DuZHxK/VyqPjSZkxAg
	hjrx0QbO1C5XwWSzc2dB9ZtabKDW7BPteYg4EbJj18woJcmt35sTIUd69Q8yjrZ/ZjVagrhw=
X-Gm-Gg: ASbGncsRbpLjnSLicHARhRSnKltCCXgAw7HThA5pzmkowkYmS2wDotNIqvoU/5pWCpl
	fKi8WDT/T2e28Ul7LOO1mkv+J2c3Sna9gdWhvHLKj4OGr6r8aQf4QXbkcQT/EGR9K6QtEg8IS1w
	nqdx9T1OU0Z8KzGau8Qi4s+ObSD9gs7gRQzAEhsGrnpXMrIYK9LKda4xYvIMEXUspARhWdytQ8u
	EgV/HM0RrYEeKpO1TxtPcGnfSlf2DlLXOHWyrLhYrwMfFC5DikJu43X+X9iSyIs8Z3DySMjBGPu
	aQhy7dYA2V7arAqhfyMxtteWhyMaD6yhTfCPKSNAB9V/p4sNQPKGomMuuv752GkHP9WYDnjw/Ir
	T0jjawfZkyj9cbyDkyE8m4s4pWeTA
X-Received: by 2002:a05:620a:46ac:b0:7c3:d711:6ffb with SMTP id af79cd13be357-7c774e003b7mr2286227585a.41.1744116212587;
        Tue, 08 Apr 2025 05:43:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG/Nz8lK9iMbIJtrIxVHXEofAsKm0l5bjpW/a54PJaq3+8xRjj1sYavaFIxtR7N8enoCNOugA==
X-Received: by 2002:a05:620a:46ac:b0:7c3:d711:6ffb with SMTP id af79cd13be357-7c774e003b7mr2286224785a.41.1744116212259;
        Tue, 08 Apr 2025 05:43:32 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f031263b3sm18622891fa.22.2025.04.08.05.43.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Apr 2025 05:43:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 08 Apr 2025 15:43:28 +0300
Subject: [PATCH] media: adv7511-v4l2: use constants for BT.2020 colorimetry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250408-adv7511-ec-const-v1-1-6a7f86b0a5f1@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAO8Z9WcC/x3MQQqAIBBA0avErBtQs6yuEi3MppqNhoYE0d2Tl
 m/x/wOJIlOCsXogUubEwRfIugJ3WL8T8loMSqhWaNGjXbNppURy6IJPFy66M0PXaKGbAUp2Rtr
 4/pfT/L4fHOt/WWIAAAA=
X-Change-ID: 20250408-adv7511-ec-const-b46796340439
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ/pXyc/7Tzr/3nbxyZQHCn9lOVX3zlrMICrNyyvkeDy78
 /Gfy38FOhmNWRgYuRhkxRRZfApapsZsSg77sGNqPcwgViaQKQxcnAJwo6ez/48TlVzoF9mrXfz3
 JfvkJS9Dk2e0JS1d9ewu26L1Vx8rrJ/xcV7axOgtbXnsOq2yKyrK5sgHuizutwzjZxUJUJH3iQn
 /vWRdaFxksbrJrPbQNXZqexdKPLJpl1X7fU5Mcv2mNAFD1+/1G/6whzK9SyoPfKEUkmTCoW3hav
 Bi5nVFi2YnbecPUa/6p18TkLc0fyX3J2KDd/jxe3db8312ifCcTm9Qf8FUz/fm0DRVgWst79dN1
 gpK3PVNtbXhoQa/7cy6+r8xwfwBDDHbEh/WPdgvL841XXA3B4PHI2EjMenZZbquh2VNFMQjTHO/
 vq1o3Bmycm8s12r+4lSG98pscauNWM0CjaI2nnEJMAYA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qg_z0hTqLJ5--ENHCE729wZHxZ-TO3dA
X-Proofpoint-ORIG-GUID: qg_z0hTqLJ5--ENHCE729wZHxZ-TO3dA
X-Authority-Analysis: v=2.4 cv=I/9lRMgg c=1 sm=1 tr=0 ts=67f519f6 cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=19vmYW5QbdR4jg4F7bgA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-08_04,2025-04-08_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 mlxscore=0
 phishscore=0 suspectscore=0 mlxlogscore=811 lowpriorityscore=0 spamscore=0
 clxscore=1015 malwarescore=0 adultscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504080090

Replace numeric values with constants from hdmi.h.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/i2c/adv7511-v4l2.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/media/i2c/adv7511-v4l2.c b/drivers/media/i2c/adv7511-v4l2.c
index f95a99d85360aa782279a127eee37132f9ad08fb..853c7806de928da2129f603e7cb673440a1fcfac 100644
--- a/drivers/media/i2c/adv7511-v4l2.c
+++ b/drivers/media/i2c/adv7511-v4l2.c
@@ -1370,9 +1370,9 @@ static int adv7511_set_fmt(struct v4l2_subdev *sd,
 	case V4L2_COLORSPACE_BT2020:
 		c = HDMI_COLORIMETRY_EXTENDED;
 		if (y && format->format.ycbcr_enc == V4L2_YCBCR_ENC_BT2020_CONST_LUM)
-			ec = 5; /* Not yet available in hdmi.h */
+			ec = HDMI_EXTENDED_COLORIMETRY_BT2020_CONST_LUM;
 		else
-			ec = 6; /* Not yet available in hdmi.h */
+			ec = HDMI_EXTENDED_COLORIMETRY_BT2020;
 		break;
 	default:
 		break;

---
base-commit: 2bdde620f7f2bff2ff1cb7dc166859eaa0c78a7c
change-id: 20250408-adv7511-ec-const-b46796340439

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

