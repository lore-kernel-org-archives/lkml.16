Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4181F27E04C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:21:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751386876; cv=none; b=Lz4WYrMJ70e20khjeLaf4szoYbdLiSaylfBMVbZznqdiVJ3Zk9gu2pxGhxRRiya06eqiNxFM5QANTtbc5lV1piSiodeV5SmmByUqkPyEqGzzh6MLMvMEzgRXLWYm+fYrUoFh9c77V4wkF/UqU1/qWCzUx62P5epJzcKY0/VF1OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751386876; c=relaxed/simple;
	bh=Za6lIWF/Guy1GsjD4sh7LPCArHr2/CqqWk9C2FJ2SII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Q4EB02zjvY5iELR6Gcioqu+nlOb7PUJ/6ci1uQ1cA21jVF0qELBben/Rf/fq6EmPWvLS26paBV4U5wb4pcftnmCevF44/tyKB9rFynEPZaCu3tmFXwTbo45F8+5eaOhpMWVijJ/UHoCRKGOIRmbxFg9V70ufURjA3pJjbT7byIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AXaP810p; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AXaP810p"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 561G6Jwi024702
	for <linux-kernel@vger.kernel.org>; Tue, 1 Jul 2025 16:21:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	azQj83Mmk/KxwVbKtYnkyraSdBj9/Y2r1xncvr9qZTM=; b=AXaP810pOvQYnQYk
	rPwxmcwtgmMQrvF33lMTlg4zr1G8pf1JLEf1I0LYm+z+kTbmXYCbwAwv/mqX8fVy
	wFuHJ/FdZ7OiFJ9KXTF9+Ghn+gAPxFXJqOKnUZH1QliacHWXZsSVRMHS6cmKAT76
	BIW3fjV7WfWmaCZyJtPYiUaUGQlLm7IKyDjZdPbR1/CcEOF8/81hJISfwZJX9nDc
	ePzYNkT1Dc19Ool0I7RIxsiKEDbU/KOE8GW6enaJJXbFJsmol5Tld6pojvh19vC4
	/EYVbO8aBnf9jrZuD04Zb+1nqPq4Jj2RWobfFI7noxr+k/OfwDrS3KwG5A4Qn9bX
	cR1Aww==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9hkda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 16:21:14 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-74913a4f606so3059415b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:21:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751386873; x=1751991673;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=azQj83Mmk/KxwVbKtYnkyraSdBj9/Y2r1xncvr9qZTM=;
        b=c60WlI0HPVfYPXuEij+BYEhvreFTPx2qqzPvJFzxjkJP6FvXqvKTHiAoYPx7BGLIoc
         +WUP/0478ylx9oMgZQV+43WXh1CnHS7MPRn4vTKMwMi3EupmhoICKKqQx5Q7oU+G6Ldz
         q2hbBb48lA882ikhHw1jvVj6ssHkNUkZ4UfuOFOuxS0B9MREVYNNlpKlBqoKY5ZSbamI
         Ax0JqC8RweL/US7sb7WU4t2rOeMGHz98L0dOqXI0Bl/UnjbWeLzzojkcIlmrThgQMgle
         rvdm2+H9k/tp6Tp+FTQm+A2Mg2byBezI+a9PzUANWxE1tq4vaMDnCL36a4J2PzT00efr
         C9FA==
X-Forwarded-Encrypted: i=1; AJvYcCXLRvc+HnbewgTrRUM7Q3LL/i0iyCaQgvRKlY960BHO+pVkZLI5APXAsdZkTiRM6Z6VURygvdTwE17zwzM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWmen6HQ6/EKqapNSxmfcZo1+DlHUSvqe5G2RzPXo+iSOIWDP
	jAIxfb6qJrs04i5zN2LywS5VLb5CM3kkj0RGPAOK0S6edyAifBcGHhbjHjcwWjd6ZhWnw/VUx3v
	4gS34y8+G4205Z9q+Nz6rG3GOeuZIdpy5xoppCmlSGujAnz2H2YRh6HoQPnBSUSDpNdc=
X-Gm-Gg: ASbGncsFgUiPxAPsu0JERzr/CP0p47lvXNOWaY/0DW+4xLDQrP/pbF4touLyXAt8bps
	FbJk1lnP4Fuh5Wuf9G0fHS17RHY9m9dWD7llVu94igQqG5Pqh+V4AfnMU/H1QpbioB31AviNSGi
	9Tgw1t4HzHPciRlTOVgV1RZ7H64GbTSPurFQfagKE0KOUlFhqBR9/B1rtVWC0VSfVkKCnMmXrlm
	btXbnG8v+DoXjQgLXCnSWjQpv+HhocIUihoFOBwda6uQOPpN8btLaiOVF17nuDFwB0jWAM0MQgD
	DutAQXE3KRL+hysHJUOprDruuIc9ck3eY+ACBcGNKZayZIE=
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74af70a7cd5mr22530377b3a.21.1751386872615;
        Tue, 01 Jul 2025 09:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEecrO+V7Bz+q8mJ2CDKZ/SQ9oZaD+cS9NTiHZCC1vT0OJ9WMqoEMlvUTMNHQy3TEelC0HoMQ==
X-Received: by 2002:a05:6a00:928d:b0:736:2a73:6756 with SMTP id d2e1a72fcca58-74af70a7cd5mr22530329b3a.21.1751386872172;
        Tue, 01 Jul 2025 09:21:12 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5805265sm12573010b3a.168.2025.07.01.09.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:21:11 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 01 Jul 2025 21:50:45 +0530
Subject: [PATCH v2 2/3] dt-bindings: power: qcom,rpmpd: add Turbo L5 corner
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-x1e-speedbin-b4-v2-2-a8a7e06d39fb@oss.qualcomm.com>
References: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
In-Reply-To: <20250701-x1e-speedbin-b4-v2-0-a8a7e06d39fb@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751386855; l=878;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Za6lIWF/Guy1GsjD4sh7LPCArHr2/CqqWk9C2FJ2SII=;
 b=/qoadYRq2CIL3dDt2uzdosYg4pWF6aJq3+3r7tYv+cVDujCQFvGoNr2jCHbcRIo/G7YiE+DAY
 GzgGzFreaATBfb5Mp8vvtOk/qRs2irrznGDZk++QBrGbmk4hgKxq+O0
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=68640afa cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=S83do3EnnC4SDWe4yxQA:9 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: N-mbPRbA3ihvmYu_00S2y4vC-g99zVYT
X-Proofpoint-GUID: N-mbPRbA3ihvmYu_00S2y4vC-g99zVYT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDExMCBTYWx0ZWRfXxjHcuDtI5uyT
 Wsv6ecGl0dlTKkAHiTOCZz/Q1/wQxt1lX70csc6+Y/VEsRPUoNsJn12Rzp3ynY8UoRh6vvM31XK
 nK5ZxTMAwxZiIzQF+9YD2vLfPDMIRiUxeVYu/2KRfYEaP94cU7DAxruq7pSjl3bkaEmbKpYx1Ca
 KBdMMqCCUvGZhnTbdqCCa9hLWbz0R5nFq6Hr5vElgeQAeJ5DiJyCghuICxT8r116RIchm9CH3oQ
 qoSs6mBeI0INXFqxcElv8BzAKkdaLklqtIeKi8+M0PvPqjbFy3Tp9rJgOg8ucUEm4LZimGt0PRl
 7GfXa2+HZK+Jdv2RqZQOEeQU0SIeblU8eg4YdcQLzLy+UgB/zu84mJrpKwaVKChFoZ03RSnJHV+
 EQzksaKmkR9PnCMKhj1SrR3dpvqxAmIxINqDJKf8vciXKXra+UYfFbwijJnVYUj+QycjEkrl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=721
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507010110

Update the RPMH level definitions to include TURBO_L5 corner.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 include/dt-bindings/power/qcom-rpmpd.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/power/qcom-rpmpd.h b/include/dt-bindings/power/qcom-rpmpd.h
index d9b7bac309537cbfd2488e7d4fe21d195c919ef5..f15bcee7c9283e74dc8e6f9b6b6f73c0ced009e4 100644
--- a/include/dt-bindings/power/qcom-rpmpd.h
+++ b/include/dt-bindings/power/qcom-rpmpd.h
@@ -240,6 +240,7 @@
 #define RPMH_REGULATOR_LEVEL_TURBO_L2		432
 #define RPMH_REGULATOR_LEVEL_TURBO_L3		448
 #define RPMH_REGULATOR_LEVEL_TURBO_L4		452
+#define RPMH_REGULATOR_LEVEL_TURBO_L5		456
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO 	464
 #define RPMH_REGULATOR_LEVEL_SUPER_TURBO_NO_CPR	480
 

-- 
2.48.1

