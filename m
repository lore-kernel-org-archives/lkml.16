Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 933EE10E9
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:46:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744843568; cv=none; b=VHWgdLHcxnra3ZdnaDNaKVto2pzXQ4zzqR/dJlh25/C+THrkLMNJgwoBhbXgEYWMxP4aCiDYUdwue9CXS2dlDNy0a4p8S+aeoMoqwqcH1yLbBAHeTAlr+iMfslKAkJV1cbQrQtTKyNIF9RNQvCVKSqQ8OzifwmsNZSW3gjYGZLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744843568; c=relaxed/simple;
	bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BxXxpMsGc1zCRNCgyDVtByBhoa4OVz2W16lACO4xq0kdPJ2XGB60ODszgNhYxzeKbnKKWajvxG71gLXQuBG1Iad8bGaovDu+sFciV/KBW5N2Zb2O/8DqgMFjnziBEOHdgHOs31ost3WA0I5sPgaVTiyEA/eLdwahIgHkzExgaUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NGMIisRs; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NGMIisRs"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMFCUI020644
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:46:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=3xpB3/REHEHCx3wA2Wg72W
	qgNxcZhB5rfGLsrI4xfBE=; b=NGMIisRsFClNE6vwKm6e3TRKimrTBkQkyUojKl
	KltfrJg4MEb6qIVMs/UFZ0QBt09WkBCEmqCVnSXVq3TwJPdPen2ECZP2eZqYjvd4
	epbDgAQBGKakoEl2dUqjp5ScGG0GSveKv5mmTtgQZFVlH23WQczoldhTFSjT6DAs
	aRiwn/AGpddY179CNxM7QmrVjx/AdUrDhueOyrZckcqYRZTxBG7L/kWAZeHjqz7f
	020bnZk2jenqYR9KJYAGo3VfC1jVhqimKG1ydnsMcBcPW+EPTP6+o0SQnV0Wr4/u
	GndEjYS1QQjrjpENQVXktgz2/Q9j9wctwhM+AxEskpb2wk7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wmyry-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 22:46:05 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f2b0a75decso4779036d6.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:46:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744843564; x=1745448364;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3xpB3/REHEHCx3wA2Wg72WqgNxcZhB5rfGLsrI4xfBE=;
        b=xO7bRQ2rqka6h7r3CMO20G1QQ6Qq6/jz8Mt5ICvOEF5YxhR3z7V6e41wZEABE+6VLr
         /Ob1OANhZpoECNbsb0DBAR45Ypuk4JH1FN23m2ua+Sqk8YavPFAk5IjK2VVCiKWVZdqb
         AD8dxZMAkSWG1usnYtKjkO1Li7g6GfX1nDbE3XH7rQIuHe3UvkyR9OKlxQw+ezU1G9fn
         4d+0Vmnf0RIx7B0UTouQ15r90VcfE92ZdkvbhQlbTGw8ysHZ93Fbs/BOvNaAaI2FGued
         T0naSAdzkwDgp3aSlc8nsiujftF+76NYeVHkclz2RtJZk7tY7t9xYEqZC5TPIp+XXnS6
         r9YQ==
X-Forwarded-Encrypted: i=1; AJvYcCUccUD5bqyhsksNY+QNL1mKCyq7lJES+wjMJdI5Q4jkYJAkRPYBTB1KEqaTFhw6N4OZ4veyBv/efBhAQbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzeG+2o0QOAJiEsJ1sNQmuWJwtFDEAwJK/cEbpA1NAbTFPwa+Jn
	g3XylCNNE0b+5KmK0MpkGK4/IJaY6Fy3Ntc5g8mjWPMCJ7mm8p7f35Ch9XtsCZd+fF0/nx8r6yn
	+l2TjyBBJh6fDt7hTcKwRiWp2yIGUfXAb/MdX9O9sX3/3LbgGRSP7poG7bE6gWyU=
X-Gm-Gg: ASbGncvO4V55/HNKmMYkpOC1aAToN41Fst3D+NzL6lznyURnFQDFjG11jT2+AsOPUTr
	AJGSRN52co3i3iQyDwMuSRCA09VuAYYqwdeBkwg9uuFlQpTmnzRCWIIHY6auXiQrsoxpnXWzqEB
	N3JgerpoNX846fODdoXE1v0b5QAGaR7tNDLOIPvaoqsw1kcd3vQFUiLwJIcmxiIR/XkFiJUFIyr
	KHIYoPA1hyI0RPgBz4Zg5L+NMvgQBQOzPVHRtshGIhcEOldO+PHd5oj4gUdFdk7utnQcD24PxfL
	2QsV9I9PoulBzmpy8tRiyNYjHEyxC+x2GHl6hnF9+N1XDXrACz3jzSeM/VKsu9x5pNaC0loJdhG
	2TUPV3iBY51kljmcUNORi6oR4
X-Received: by 2002:a05:6214:d4b:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f2b302858dmr71349926d6.34.1744843564570;
        Wed, 16 Apr 2025 15:46:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9tZ/XnA8LdET7DMlXwkk7hqnEIeM28Aor9U2eHv6gu3wYYeeudC2Nu3p2fsDBtVqdBUYDkQ==
X-Received: by 2002:a05:6214:d4b:b0:6d4:dae:6250 with SMTP id 6a1803df08f44-6f2b302858dmr71349696d6.34.1744843564325;
        Wed, 16 Apr 2025 15:46:04 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d660aa795sm181278e87.192.2025.04.16.15.46.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 15:46:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 01:46:01 +0300
Subject: [PATCH RESEND] media: adv7511-v4l2: use constants for BT.2020
 colorimetry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-adv7511-ec-const-v1-1-74301e17646e@oss.qualcomm.com>
To: Hans Verkuil <hverkuil@xs4all.nl>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1122;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=CtIfV90G/+TA7lPkVgwMhnh2oIhA1bParUvjzjA8nuw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADMrEiDk/OfM3hC9M8DFAReZrjB5dH8MS/HXe
 +UksddrMhqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAAzKwAKCRCLPIo+Aiko
 1dppB/9zli6R0pMGVsGcTpyYKryn04WnXMRVtL9AT0HBT43uyPCrRco5ufy3iQipaBkwiIdF137
 8q77vCCNpN0nhOaBmBn+6TtUkonNvXmmY5ymekHwxK2/2hlMTEWQZcIrniu0TffRrMP41bLW2sB
 Y8s9d6+vnIPvMA8inN8Uaoplk2bJNl6XlNEPEH/yeomykjYW3FySqZ3IEFufti0KmQXHTu8UsIW
 JmMlqjK3DFWpLdIwtZ/uCn1hqMMDaPaHhaoqnk3cui4krbrl8LhKhvWVuxPIBcpSYv2ohTOJWxf
 oI0HD5hyOdZm54O1/fDE0GrZ2M2y+EnJESFkmDPszH/rXUVH
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=6800332d cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=19vmYW5QbdR4jg4F7bgA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: G1eBAx9TM65fZW_IMh_NPD0pnCa2lO0J
X-Proofpoint-GUID: G1eBAx9TM65fZW_IMh_NPD0pnCa2lO0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=828 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160182

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

