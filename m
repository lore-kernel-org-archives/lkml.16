Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF5624BBEE
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744845403; cv=none; b=pspthQLLeo/cgIP1P0jbMj0sGMVVda8Ex5/xFfg4nss/ab0JZ5dv6skqhLuELdds3hYnaHUUogmTKdoazSpJ2q3/RgUBLwshu5rw+j7VGhvrrzyiXg77UpcNCp3hjwt4HZDll5d4E1s4UKBilAP1zKxhAJ2rih5MMi4hFfwzrc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744845403; c=relaxed/simple;
	bh=f5nEiMxpCpJ8tG4rxgWOSIOxABVTgec4J5cSa+ld9WA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fn+FJD3DH2CCcG00FIehNYlSIZFFJsSYp6Pbp/f5gkUCXh+Il5JGusPuVWfheAMmsh2ceLGzTl+yuV5lL1WjiPpVbNetbHAnMcoEDuX5I6ludvncwTpYgX+NIr+Gd5FHJn/JgH7dJQGLzvDyrPBX7PBgW73IlJ6vRscxA9u5X9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=RZO1Ah/c; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="RZO1Ah/c"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53GMebkp020643
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=; b=RZO1Ah/ceclr+4Jz
	o62CH+mByuTgwys/1QUnFkihF9CjkZ0e6doBZ8JHfEj/A3MlN3w/mV3/w/YDe82f
	TVRr7SpsAnvfBI7VLzv0kg4DeKo/0IzdKSMB3nRnQ5hFMxBFRE4Krmqpdy4DYwx9
	fofmqdT/9JlgbCsSKFHDFbKUDC5fmBjpC7LZywygKUMv1S1ae8HmxeesfYJ1l57I
	AWuph3Uaw2gej2+fWtQkydhOqvlE4lcQYURU3J1GJfh9ao1Eih0mRbOKEyUfFjwD
	IpBAihqfzKGKPmb4laWv+SKaVSG08MC0hlx3M72Mz1Pux76Wc2K4bXkuHhNcILz+
	pfg6tw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yg8wn1d8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:16:40 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6e91d8a7165so4816806d6.0
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:16:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744845400; x=1745450200;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EMjst29DNTaDM7RdBr29Vu4Zmfecm1OtVXRpr93QCUU=;
        b=YOzZZQvqYwR7YPJ9Ycp6LzG7ewLJ7Lxl26CMpJaXRgz3ci04tRX0SV3E2rPXeQJzaN
         +c4As8LMXuzD69jeMi6emsHRI54qE3WUpkZ2DqTeUDfjRbsoEA0fXeUK4V6Au3sh5Obh
         6Grrmt30unrTsnj9t6vufURPiR76dHxoTSMmFO7uzW4iHCk327HBsZzHkVPf1GQ9LI+9
         IYFayxvX4cHHhaks/x60CN44wi5Pl11tGhBoUyXG5IMdYzzNFMF7/ABwqzpqFDS5aWnN
         pgRAEBA/EXgH7QN6WvlORbdcVNjv+mK0/vDx4DMnjNLErTtGRN/a9lPhDHzB3MEZP23k
         0OEw==
X-Forwarded-Encrypted: i=1; AJvYcCVbWxJhxDGEF7YjLY2fiNGuJ5T/MVujmvTH6UrLPNcOt8xVsoOfHg1q7cAww2lxo+qg70V39O69GXQl6YM=@vger.kernel.org
X-Gm-Message-State: AOJu0YybawMWtTtI1eELIiNexyaMFnM6F9ve6t6Dpzy1vkQs1oZQBity
	Fn588XCXW4dwN2TgVfMfiRT3S4gWO3T6xGopSWjBiDEZ+VyBfz9hEdJH154jK1Ocu+LevDHHnaf
	XATnlVrZNyHZuyNV0L1nmLFfU4rljoPtwG1RdbvejpZdldgIcVNhCds+/35MEyeU=
X-Gm-Gg: ASbGncvy/ZESN5+Kh5pFwGaWl4Ao/IIqYB4wWfedcLb6Wt3p+mlAZLL9CRgBOK1mXol
	fPcIGIIJ9Vo49+os4mFYDpcPXuaRvvesKOskxXqGRuScXlhjyruTuHlKliZUoLqn6snvigue5cu
	9qUQ7Ru2rxja70mlODJPRuVlO4VBdVuqBzz2uBa1xVucIX5xt5OqROmQ6dr311NqBUlyFwCXqHq
	Qmvir0aurhpCiYSakihiQ4yChI4EUmRBCPg+lb1aHcwzI9oZfJcbVUYg+Nc499Ex195LxIjbqK0
	5vn46mHNn92+s+2Yi4A1IETiN/kh8XcD9AfQl+9J9E9TyfKZp9MMSsOlJihHXjwySjNps0z9BUz
	vnjmee71/EDIzUyy4cvaydG32
X-Received: by 2002:a05:6214:408:b0:6ed:cea:f636 with SMTP id 6a1803df08f44-6f2b2feffb5mr54521586d6.26.1744845399708;
        Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPl0iNL1yZrGzwcc1wmgq2I9+Il7LL8tKM3efE7HvmvGzTveUlWvBBNCOuR6INthBXgAbk7w==
X-Received: by 2002:a05:6214:408:b0:6ed:cea:f636 with SMTP id 6a1803df08f44-6f2b2feffb5mr54521006d6.26.1744845399287;
        Wed, 16 Apr 2025 16:16:39 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30f4649d79esm26062181fa.15.2025.04.16.16.16.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:16:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 17 Apr 2025 02:16:32 +0300
Subject: [PATCH v4 02/10] dt-bindings: display/msm: dsi-controller-main:
 describe SAR2130P
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250417-sar2130p-display-v4-2-b91dd8a21b1a@oss.qualcomm.com>
References: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
In-Reply-To: <20250417-sar2130p-display-v4-0-b91dd8a21b1a@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Kuogee Hsieh <quic_khsieh@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Bjorn Andersson <andersson@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
        Joerg Roedel <joro@8bytes.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, iommu@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1325;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNM3/R9939920NNRFa+kSPKtbONWgfGTtTNO9ijO+vE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoADpReZo3CdA2iSf6xGsT8icNwhKZs/duIWtjg
 l6iKLErEImJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAA6UQAKCRCLPIo+Aiko
 1aM8B/sEZ8X8fCws7n4EK9j4dvr6ycshr9W52/GqqvdUiI+rEPJqEXgG+HqP5Jp83DiILIvjARq
 UAbhdF61UozetCzt2w6riZWWkt/dpZrefumM0jEZaFjENwz3HhW0Mw43vKVkjwJANh/ohHV56aG
 LrH7n7Xn2O+MoLcwEm1v5fffgTXXO8iGLtQ9HxhODSg/UNuVSi2s8O+8C1nSglfggjvxJgHJ0L2
 O6SIi/sGeaIhnP33QAfpyVZmAOxE3D1NmL6UL/Pdw38bS6EVwx2px/geD9NcQKqAbVy1WMCtFHu
 Jriw0VHG9qtM3QMJq8KVtC89Yvw6Y510dLe9pHn4kDzgwK9M
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=E9TNpbdl c=1 sm=1 tr=0 ts=68003a58 cx=c_pps a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: FIKd6rC-l7x9fMucRry8zBN_qOhMD1wh
X-Proofpoint-GUID: FIKd6rC-l7x9fMucRry8zBN_qOhMD1wh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-16_09,2025-04-15_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0 adultscore=0
 mlxscore=0 bulkscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 mlxlogscore=865 spamscore=0 priorityscore=1501
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504160186

From: Dmitry Baryshkov <lumag@kernel.org>

Describe MIPI DSI controller present on Qualcomm SAR2130P platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2aab33cd0017cd4a0c915b7297bb3952e62561fa..a3e05e34bf14dd5802fc538ca8b69846384f8742 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -23,6 +23,7 @@ properties:
               - qcom,msm8996-dsi-ctrl
               - qcom,msm8998-dsi-ctrl
               - qcom,qcm2290-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
@@ -314,6 +315,7 @@ allOf:
           contains:
             enum:
               - qcom,msm8998-dsi-ctrl
+              - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
               - qcom,sdm845-dsi-ctrl

-- 
2.39.5

