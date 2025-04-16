Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB7A22FE1F
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744792179; cv=none; b=Bn2+rkmjNCvK26YgBsR3QdaGBOYz9o25ccl3J6VFweINe4O2ZEYTtBSz4hDnJkh3WnjRe6U3MqAyhHBidXkmbz+Q28uh8CaCl0QYr5F5dybAMTJ34JJzN0adXAoFk0yUrJUmyAbF0q9TyOcVQMHazEdOLg9db6apjZK8eDlmL5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744792179; c=relaxed/simple;
	bh=SAyK9sJUeGV2KdHd8ZazsiTrrxo8/0P3PB/Buc6flu4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N/T3/JP1QSCnNJb/kvolDOoGq+oZejR+jlPkh3OREtxpYiY/twj4Qqf/qow7O05aqfhNstv01FqHcNdrcqsU2OpRc9AqGPQjkr6JWLlP6/gdv0MMcM5Ugec4txZ7zp4yNhzi1YoXc/yAU7jP7rZZPsNQg13FnWb4FeVORkwhvL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TO/F75jJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TO/F75jJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53G7JcE7011392
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:29:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UWNSmWOtUtq8/CJoI1vzXJVwJ8IgTPzBjgmc3+pQA80=; b=TO/F75jJPZd4f7LQ
	qJH84NNGPdM3fV1iHm1EBp47GO6jJ00mwqB4oxdVWjmBZ1RmP0RZO7fqxDMislZO
	DRpsU6BJ1+15pvMXwCsnL9sYJFFTDX+eMy9ZNL+aJoWK4Awr2W5hf+OpzOO0sMZB
	pMXsDHY+oBHFdIF1Ny7rjFqKJeY1UKe5CFmt/uNbkl/o/iUD1pFbEsYEMc4nZs2w
	nMH3ERWanTGOqWnOt+H0bPJy0FXWb8GdChPMjBQXcrickqtW/vLjZ+MT+JvpGS4G
	X9lpYVQmafg1VVu+xz3//Os+coWBVLF0c0te1Y4dYsq/9u8/i+6WHrIwpXFnHSZM
	2csuvQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxk2r3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:29:31 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-22410b910b0so45331775ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:29:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744792171; x=1745396971;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UWNSmWOtUtq8/CJoI1vzXJVwJ8IgTPzBjgmc3+pQA80=;
        b=Wo+Moh8/3bLnPjKWNf0q7O+paQzqxXNWKjOVQyTC00b5x3Vpq03d0zDLnvfs9ccbr+
         6Ddj82s/OCOS+xgCFLCBDs6gihh1cjV8FkZH2YAxYkx23ltxhP/YvQOJ8NzochSazYOl
         ClhmcnYzQ7mMYS3WwEU+/2IK8xEBn0ILe7VqfpIcS0h05jhXnNQV0lNvoLYHMi7/Bgqv
         CzB/lL8exi8DrM7A7CMsnCf3404wyDX+EHAfwq76BLbTtjrnJuC8A0JT30gaAMSBdL9U
         RmY54HSWmAfglXXAbmuciqCn5scL81uERl7Jaw9Hyu8cBkeftiaw/T9IUuckvNPCxsPo
         mIXg==
X-Forwarded-Encrypted: i=1; AJvYcCVAUQHmd0MsEhyQhLsbfWJKyXl7VmGJGm7HUqOc66S+keTSdwZEyuMMSv1IZ+qITyXkeTn47+K3dNjxKJM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjgK7INDXsjfd+9gmLgbjwER0TIozDd5h30KKCo12yDfTwoP/n
	upzDwfENt3hXETs0Q2vu75ZAdMsc7S/fIkKWMKo8ialb7w7vuBYlDONhAwSMKsK76d3rKOH7UZL
	4VSxVjVi9d/EMuES8MDxAUaZBNXILd+GchvPA2QbpTOQYY2Q3r+cUsHc1Dlw5YMk=
X-Gm-Gg: ASbGncu5hwdvknfPf7n9qTaq7bAnbL4QB9jkgstz/729yTQO/QjAHcLUlggPRCB7n8y
	EzjqUL4VAgkWRcadK3U7k8Pw+aO59UwNGk9h+fXAgAokVRCh6V69z/lfpxf/Kw6e1XAxkO4jxBO
	1S87Xna810tYEevzXZNbWxd7Jf/GRrWqDJL4si8XAMG28Kcd+4WAMA33vFq6dvOMngsOzFwiBwA
	sgLXT9ZVOCBSHjb3Gsn19ENm73Ix9eZVZccWW3qdniN3W6oKOYTPABBlmevLCV9pKII+ULBwoDA
	cEKDd128K46GDMq8PyGyh7bSO7PnauD47TqS3rnE7epz4x4cv2DkJHmiBRJDoEBp+5W43h8wTNu
	sJ8zD3LQZiJQic5zoStlOioG3D7Dc+o1cjpghUDjeCMvRQ64=
X-Received: by 2002:a17:903:1a0f:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22c3597443dmr18676135ad.40.1744792170732;
        Wed, 16 Apr 2025 01:29:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeUfHjjSZO1m7gR90fkswaHOTEejRvETuSsQKkbL+XX8T8042X1GJo4LJcRd89F1ItixjHIg==
X-Received: by 2002:a17:903:1a0f:b0:224:10a2:cae7 with SMTP id d9443c01a7336-22c3597443dmr18675835ad.40.1744792170409;
        Wed, 16 Apr 2025 01:29:30 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33fcee11sm8340125ad.191.2025.04.16.01.29.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 01:29:29 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 16 Apr 2025 13:59:18 +0530
Subject: [PATCH v2 1/5] dt-bindings: sram: qcom,imem: Document IPQ5424
 compatible
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250416-wdt_reset_reason-v2-1-c65bba312914@oss.qualcomm.com>
References: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
In-Reply-To: <20250416-wdt_reset_reason-v2-0-c65bba312914@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Rajendra Nayak <quic_rjendra@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744792162; l=846;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=SAyK9sJUeGV2KdHd8ZazsiTrrxo8/0P3PB/Buc6flu4=;
 b=mbNxlNeS9QipHP2Ao6yWsmbakQOC98yMhCWN30kr4omaRSzkfFDuyQxkTt0g3nr/kO9jTOdll
 7zEBuZD9HlDB03IudL6c7bMcxpxKcRUw6zPujmfMVFKyHCWXQaf5AU1
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67ff6a6b cx=c_pps a=cmESyDAEBpBGqyK7t0alAg==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=7sp3e_VSdAcdU5CosJ0A:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: VqNi89sYdv8DIsgowoizNC3cAUgpK5q4
X-Proofpoint-ORIG-GUID: VqNi89sYdv8DIsgowoizNC3cAUgpK5q4
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_03,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=900 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160068

Add compatible for Qualcomm's IPQ5424 IMEM.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
Changes in v2:
	- No changes
---
 Documentation/devicetree/bindings/sram/qcom,imem.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/sram/qcom,imem.yaml b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
index 2711f90d9664b70fcd1e2f7e2dfd3386ed5c1952..dec1b1ee924cf1386f559eb262ea864f2788c165 100644
--- a/Documentation/devicetree/bindings/sram/qcom,imem.yaml
+++ b/Documentation/devicetree/bindings/sram/qcom,imem.yaml
@@ -18,6 +18,7 @@ properties:
     items:
       - enum:
           - qcom,apq8064-imem
+          - qcom,ipq5424-imem
           - qcom,msm8226-imem
           - qcom,msm8974-imem
           - qcom,msm8976-imem

-- 
2.34.1

