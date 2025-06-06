Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646AB28466E
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 10:09:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749204595; cv=none; b=uSoYDK2POL0ZKJxUkSVX282MVJ26uhY+JItpibYKywGqbuicNhL7CA/zvVx73GEpZkaJ8Ku/NACBFnUi+HqfnRubxArOOy+chGnpqHlIkaeO+gtmabcbu9ce36VjD8NmU0FNK46pQL6uSN15nQ3W3bjMHiFlk3L5wQJP3E9tn+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749204595; c=relaxed/simple;
	bh=LpL31W6AKDCpdo/fRCicU1F0HGSNhPmft1JV8Pa5bLU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TM2PBxY62CSPm5xrezACcmvnLLLXti6bWHoU4p/Ee0qsMUNZgrza5LXlfTjmDcgrf2ysqoQ1fKE/xSAzOlNtBxxwoUDDP0/cYBr1GkOhRjxl7moCqF3Hdwz2ENWK8J6LINODorhnDmQT2dmyILyAeILYLr8rVdSPrMzdKh0uNB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AKGLe6jE; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AKGLe6jE"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5565ox32032298
	for <linux-kernel@vger.kernel.org>; Fri, 6 Jun 2025 10:09:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=1Rull5WUa5O/co7lCOuxKulj8U2Z6zdeHoH
	V9/g0S9I=; b=AKGLe6jEmO+oDiPNCgLtN/CuAN6XN+v1tEqUqlW4/pGOCi7POa6
	ILJ8a4+a36YxnCcp3T7ymkdEfvHdsphU5CNX4pNezkyYD7/aZJQal+2DhWPh8JMO
	Mr/AxO9Sfq0qferAyJW4M6cBNPWvk6a0q2V0oBE/C+qiOHWlESmW1qaZmbuzxNlp
	VIBYRRlyaLoymBzBgMtkKegF0MlUM8+7ourNSudo9QcHUyupWm7AFK+18iz8DxgB
	vTs4w1CjPnx5VrA9OGDFtRmt/7JYJPTtNFS6o4/MrVSdqcS/HJunrMaOfrg6Q+fb
	VtOn4Nev4Ub2PBSdqHFHGDlVd1ve3gLjBpQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv35jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 10:09:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7ceb5b5140eso337108085a.2
        for <linux-kernel@vger.kernel.org>; Fri, 06 Jun 2025 03:09:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749204590; x=1749809390;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1Rull5WUa5O/co7lCOuxKulj8U2Z6zdeHoHV9/g0S9I=;
        b=qYvmHUW38IzG481IDxIxd6ADLBVkbOAVGd31Fe/OD2jdqBnP1ziF93FbXGWbKAEpTC
         gPa+oCPXac86udofWSbr3YxZ9n984BDdedp0xohP0HQv3ER5rNyo0FwCbAfBkwnV4kq8
         xzlXrU/TQ3kWeS9giMlDoLUUn6zXUlhuq1OB7n1BKbd/Wop4aoFitnmgo1NcwcA4VWgR
         ZMUzjNwQk4QGEqm2WhBfyyb1zTyExxmEAbAsN4piJp3JqqnrDOhOugsb8LsBGrOWN6mp
         b8A3TG4AemeVW3TbgOoUA1In4/oXthqOCZIvnMNmVoNRkRxtt/2P8yqT294bML6KZhHa
         Z5tw==
X-Forwarded-Encrypted: i=1; AJvYcCU6Ko05ibcOv2B+K5euTtU0bWpu6twQu2ZnhL2/YogUgRQI1fKar1GPLc4lZ+MpOlLurDun97bLFIQzHrE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzM/+1UqZ9uIWHUbfOkmsG4OdQjrWyskAQ0F3X08rBOr64ANeft
	4UOqx0mH5PUkKC7LhCwsHjHnnxI/xWMhs6mNaWCxFDEd4RIG6FNz90xz4cbwoLF4zdmoa8NV38/
	OYrjt0mQDnaEOh0LRs2jISXbYxv3SEKKsPztl0DQcdfkEkV9MMGQIUlGlr4SWx4ssQsk=
X-Gm-Gg: ASbGncuYp41QNIrSK8wchF9CPn/+RpB6sj01rnZ67N84TdaMIi8eAigR91UE2kJAoTb
	HAon+EwZG5oseYoo980HmmeQR5olIawDLMBUOyMbmRupa2aTkRLe1J2OrB2WMMT6OWx6HKrL/8Q
	JNSeEcdG29wywvpSf/pHOgSJvd2rOIH9CB88t4VJ16R903S64McI+NfMjoaxYYMaehjPXNeQQUc
	UklwxwK8ZrtTvi1czD2WuWPVEsReGQJPGhqhHXSuMzO4s/HQQgtrwfZlSP8HuHezRZE6FxZnz9d
	B2LfAyYeeP+GoJZU+hY0BHNLW6rHARcg8yraFCppP4YvBA30BKXu3+m/uweSWtBdzA==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4adb:782a with SMTP id af79cd13be357-7d229851bb9mr483085685a.9.1749204590316;
        Fri, 06 Jun 2025 03:09:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENkAzJPgUxlRrOfxnaDBFgN+TY7Ep3pNndFgZuX9TRNL3Vyzjg5cluQwW3LY0RCEI363Xj0w==
X-Received: by 2002:a05:620a:1b99:b0:7c5:4adb:782a with SMTP id af79cd13be357-7d229851bb9mr483076885a.9.1749204589288;
        Fri, 06 Jun 2025 03:09:49 -0700 (PDT)
Received: from trex.. (142.red-79-144-193.dynamicip.rima-tde.net. [79.144.193.142])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a532464581sm1415418f8f.95.2025.06.06.03.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Jun 2025 03:09:48 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, stanimir.k.varbanov@gmail.com,
        quic_vgarodia@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] media: venus: protect against spurious interrupts during probe
Date: Fri,  6 Jun 2025 12:09:44 +0200
Message-Id: <20250606100944.4104715-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=6842be6f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=jucdD076RO8dzeEYkB3eYw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=4rlHZoThpNXEEVWAyUMA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: nBTk1AwF4mK5yzeo8-BEybU9qkQGyKtQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDA5MyBTYWx0ZWRfX8Fr4FIwbcYJx
 I3E2TBwGXCAG/1aBvfJaM+hhGdPWHmKEvMr4bXXZaXaIgR7X3E9/WXKZ2MlFkyb7eKmuaoEoYnK
 OEpPC5iCb5fwIqYWKH4epozry1KWc2QlYXvWc7vmc9R8tzdPxBj2IZW7XV7IcGm85MAc73RnQNU
 jrNqaKrQxbnl0Naeg2AXgpnZOWAOp92YzCkQIpHGRmMq+89vKTo4z1h/nkCqYXBWlvNUu6EaRxs
 MoTrmzlhMgIH4OHppx1WyAlJr4sCYEwm0UuYAtI5toV1R5NQoCNOgJc8NxR2Al69v2fv+QTVHl6
 U/RCq2xYFjOqfWY/LyU/sE5Kd4ba4ZuQzSpFdIReiVe3YwhhJeRGLOgW1WzyfECXOgjmEluRB+f
 mXf8e0lP86uMfRzlVTLcbwz9HBNj3/wPqq4sel8B7xKrnRxWt41z6dlybz/dpPnqx1fw3DwD
X-Proofpoint-GUID: nBTk1AwF4mK5yzeo8-BEybU9qkQGyKtQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_03,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=986 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060093

From: Jorge Ramirez-Ortiz <jorge@foundries.io>

Make sure the interrupt handler is initialized before the interrupt is
registered.

If the IRQ is registered before hfi_create(), it's possible that an
interrupt fires before the handler setup is complete, leading to a NULL
dereference.

This error condition has been observed during sytem boot on Rb3Gen2.

Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---
 drivers/media/platform/qcom/venus/core.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/venus/core.c b/drivers/media/platform/qcom/venus/core.c
index 77d48578ecd2..04641a7dcc98 100644
--- a/drivers/media/platform/qcom/venus/core.c
+++ b/drivers/media/platform/qcom/venus/core.c
@@ -424,13 +424,13 @@ static int venus_probe(struct platform_device *pdev)
 	INIT_DELAYED_WORK(&core->work, venus_sys_error_handler);
 	init_waitqueue_head(&core->sys_err_done);
 
-	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
-					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
-					"venus", core);
+	ret = hfi_create(core, &venus_core_ops);
 	if (ret)
 		goto err_core_put;
 
-	ret = hfi_create(core, &venus_core_ops);
+	ret = devm_request_threaded_irq(dev, core->irq, hfi_isr, venus_isr_thread,
+					IRQF_TRIGGER_HIGH | IRQF_ONESHOT,
+					"venus", core);
 	if (ret)
 		goto err_core_put;
 
-- 
2.34.1

