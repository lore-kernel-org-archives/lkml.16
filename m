Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8D0B2571C5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750319319; cv=none; b=EwSVi0XRIA8Inid3O55PXweFgCcWVaH1s8G1xyKiclUwbhgRVCPHaC2Sju0DYYfAql1vm8BBdx74JUsGlPAiL/7Vy3sWIdXqESOVsCFNQiYtTYc8Dx98kQ9FqPi3Y8IhfoDQZmCq6mAlG1riL+FBJyEMb9RqQ575oFhvbTIsqd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750319319; c=relaxed/simple;
	bh=U2STGhzIXpultd/ZiNOod4EPJT/hThpae0fjp7R5nRo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=DjD9e6KdKsbzMlub3Q2ItQx9RSC2ulYeJtV/RC5xQXeV7QEpGjYUlOJ+bLFG9hE++a47gDjSns28fDUkjvZlBeuRBf5MphQuRjfmfnz0xjoa07uaU5BF9AwgBe6J90ocdK3yUnF+t06NwxjUgD9j2aIO8Ar8D52U93w9Wudiy54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HdNkR93b; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HdNkR93b"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55J7KYQ6008236
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:48:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=z8j+K8iVfjdH3xhqExCIq8h+sOQFzpM8OaK
	kF/g/qng=; b=HdNkR93b5bYukRDiPUxJ3ZmiXkykibBfhQdNkZbNCeHMH0IlfJd
	0nlgEfLTz6RIW8VTWJcAyQU48ahx/EHJi8vo5ptHbazBubLEC3gvFSRIIGloXm+g
	jWDhcu4KybyGT2d8ptyzB8esuoISJh/2mJsR8BeBIkrTRSaxFVWAFc46cfEJQYb+
	GOg69u3xGCDb8vTEOJ+ibnNhYbQDANB+qfpJthLJAwbXrXAknCXvD2uomO0GZlZO
	YIgPJTHARuLeC9y/zfdsIeUmGNOYaUDj676P+tc9RTvurpsUeFVcl2d5P6xMdCaW
	sjvj3cj88Iz7Vh93THHEU4D1mYxo8VrVWdA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47928mq08r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:48:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d097fd7b32so119758985a.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 00:48:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750319315; x=1750924115;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=z8j+K8iVfjdH3xhqExCIq8h+sOQFzpM8OaKkF/g/qng=;
        b=bt+B1I1U8Z0M5s4rlK9zu2CizX5TB4O8hf0rI2bpZK7kx4oNgHDNFeroJb6gItHlBB
         Jc47Kt3i9FYNvCKuZKre2uNfnWGstgYnES3q/dRrk65njlm5DIek43eFsr7CzELZTzVn
         /cKgcw92WrXYefDSzzuXuiGT8YJg1WF9dDqdEdMxGxE53z9bg1QhyONoahAm0LdShMcL
         lj7IjMyKy9fLVZm4wj+YG/9YEhCobsQC9o18VKhnFmuG7EerQNZFzhia4unk/WGOgn3c
         bICrpiKJUFFeVYnfUPntPi2givUVlP32qsGfK+KVE/3v3WSF1z23HNS74gJMbqUpcFMX
         uheg==
X-Forwarded-Encrypted: i=1; AJvYcCWnUPHsJtNx5eGtwy4M+qjg2fAUvKQc/cAvYDeO2sy2QOSnhmU2bvedRfhkNFikAM38rOFD0fyC4HJz/eg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTUDkSESwvUSYZ0gkju2i5gINJw0uZqfrqDB4BI5sD/OJn8MPk
	S/lknjYis5hG4BbzewYGlyh53J/mC2idENr/F4sQpVMbvoHbjRQhNYh+ts2dW6U99+yKQJrWrPn
	x57B+P/WrcGk/8XQtAG41JshjpQgWcV3vRlVAVWFVgauDzUcJnlr49Hmiw13hrRBGDCI=
X-Gm-Gg: ASbGncuV9M/FGRXvQ72YklDVQ6CQxfa+0wNil2oAlAeFXJm52GfWYsmZQjujpsYWUuY
	wYaQQo6Nd++eSobxyI0X660v8JZefW6r05TYTIS/Ma7+bO5ctVRezYr5+sawcyWf+S3xD/tqq9v
	32jOQbzkSzl/B6xgxl1NesZvaI2rkT9lZzuXMjegX7iq8lU/eZt19vBVVpFSO91mqSCGO1En4n/
	7O866/YeiWqfBNW2uflwHWw3ZcLK0QxLueiFI+dfx+njQBRs7P5klCLUnS2ye+uO9nhcpySpvCY
	FACpqJRnfPmOrJBPveQpbaRyNkHZ1nz09JdKTvo4Q/Q98f5O6pFpm0urckC1V3KnrLXdaoPQ19e
	Z
X-Received: by 2002:a05:620a:a11c:b0:7d2:265:c2c1 with SMTP id af79cd13be357-7d3c6cd9fb5mr2912746585a.27.1750319315526;
        Thu, 19 Jun 2025 00:48:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFa/bitPn7p+wO5BNUxje2vR0gnJrH2y5gFcyJKjUCeyoovv+2bLDtbOLvQj1g7gFSI/tM28A==
X-Received: by 2002:a05:620a:a11c:b0:7d2:265:c2c1 with SMTP id af79cd13be357-7d3c6cd9fb5mr2912744985a.27.1750319315088;
        Thu, 19 Jun 2025 00:48:35 -0700 (PDT)
Received: from trex.. (132.red-79-144-190.dynamicip.rima-tde.net. [79.144.190.132])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568a73a7bsm19107586f8f.36.2025.06.19.00.48.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 00:48:34 -0700 (PDT)
From: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
To: jorge.ramirez@oss.qualcomm.com, quic_vgarodia@quicinc.com,
        quic_dikshita@quicinc.com, bryan.odonoghue@linaro.org,
        mchehab@kernel.org
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] media: venus: hfi: explicitly release IRQ during teardown
Date: Thu, 19 Jun 2025 09:48:30 +0200
Message-Id: <20250619074830.1708453-1-jorge.ramirez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE5MDA2NSBTYWx0ZWRfX+P3MSqGBG9kw
 fu16mBZLAdCo5HDuQINISHOkj2apL2s/5UtpusGy6WSkLeksxY1Zz7xfxLOtBjTMdAEkTW/ujZJ
 XY56s3XYJEynOmbrBhoySDtwEmFy8HJA7/XupDCEfBSx7N1lO6ZRXNUXClAkAbph2Cc32zsR2l1
 WLotU0vOoP2CFAzAjBxJ/FFr3F3mEOgb7wyR9mVV8lvLHv074lW4YPXmKkT5FckJA0tnt1wp+PX
 5w5AlY3J6+Y3RWYefW88pxQVgWzx9Gm4h9WdQFw3ynbrC/a63wi6mPKaG3vFbxPW1HcqujFrk94
 p0YnIc2AcQEu9/YN/NJhoi80TIcJWuVr+Ba1JhuD5j4lJTudcMbmjuz2+qeXpse7zlU0OCI0WRD
 Cbwz2JXn6H7NTbsLRfUIt3CDWF5bx41GtQA1dsBmzq75yaZJjBQVtkG2axCq6VjIBq+Vj+8G
X-Authority-Analysis: v=2.4 cv=fvbcZE4f c=1 sm=1 tr=0 ts=6853c0d4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=wjE3nLva0YkvARyJ+Gfmxg==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=8RyGSdXC0efAYOFA9KgA:9
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: Y2M4-QWbqsEX6VF2nc6jMQ_wk8YcDkN5
X-Proofpoint-ORIG-GUID: Y2M4-QWbqsEX6VF2nc6jMQ_wk8YcDkN5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-19_03,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 mlxlogscore=761 phishscore=0 clxscore=1015 mlxscore=0 impostorscore=0
 adultscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506190065

Ensure the IRQ is disabled - and all pending handlers completed - before
dismantling the interrupt routing and clearing related pointers.

This prevents any possibility of the interrupt triggering after the
handler context has been invalidated.

Fixes: d96d3f30c0f2 ("[media] media: venus: hfi: add Venus HFI files")
Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>
---

 v2:
    disable the handler and block until complete.
    allow devres to release and free the allocated irq

 drivers/media/platform/qcom/venus/hfi_venus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/venus/hfi_venus.c b/drivers/media/platform/qcom/venus/hfi_venus.c
index b5f2ea879950..ed003adb0282 100644
--- a/drivers/media/platform/qcom/venus/hfi_venus.c
+++ b/drivers/media/platform/qcom/venus/hfi_venus.c
@@ -1678,6 +1678,7 @@ void venus_hfi_destroy(struct venus_core *core)
 	venus_interface_queues_release(hdev);
 	mutex_destroy(&hdev->lock);
 	kfree(hdev);
+	disable_irq(core->irq);
 	core->ops = NULL;
 }
 
-- 
2.34.1

