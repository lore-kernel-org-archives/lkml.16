Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4C2A2F8C4F
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 16:32:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751646722; cv=none; b=c52RY5XnVhaOPhNdwqJ2nPmJlUf2qiQp3m8QY1CX87pqPOb9A7/WVv7aRzzeSq5/4Kl2JkuK0CvWwMkJDIkKc4l2XeEwRcCz1gom4bWoTlr/CjRW5/vaDNAhPZhmm2s6IZeo6wPZ8fOHQB8CKIPZWN31Eu0yfbEF27HGiil1F7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751646722; c=relaxed/simple;
	bh=Wcfz4bb2UH4k4iauZC9yeDtbL/XAGvi5MpIvhkWE+84=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LMFrtDClRlkYT9ySo8NUcOXAAFScjGZTAfm+aOEbc3NLRhGLw+nwwAB2qhmLGcr9s29OoZEKRm3rcEvRBABPN/t4udN+01Y05r3sRUwhLG83zHpGW/U6ygdQr5z86TkIbZjlQTwF4BZn2gUDwCsyZAiPouqYlVUNLWyGa3zDOVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pzJZNgZo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pzJZNgZo"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564DGZ48032417
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 16:31:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=; b=pzJZNgZoGz5A7zuo
	dinNmipmBGQqxA76MP4Jan0muafX0QVn2EfCIw1yEcZAkF38webrqcQBW2BHWbD5
	OutQGEAqFDeB/WLDbImmiTGnWkUjamw7Q0s558jikPc8JKmYcNgtDAmav74BwPpR
	4T0fRbSwrcPiP+YJnKprkbvVj13LAbSeIExG6ceaQgJVX/aiSHnUbbfuLYnE/YM+
	AX36LvmKAQB1Gxo1jSMICHIpWtinERqnhXs5geNeUAoGzIF7iMThjJS9XQOjRIsZ
	mEZ0UOBM2e43c6xEi2ClE60/zhl9GWBz/RQxCRQEDu+ec5+hC2kd2DclFnhWJui2
	4kSPLg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9vgr9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 16:31:59 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d3d3f6471cso174811485a.3
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 09:31:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751646719; x=1752251519;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qjHlmwArjTOMKWmC6+bgZpFfSvKDIyWSaR3a4YOlmAs=;
        b=a03ycisqEZUKCgoSp5p3J6ypJKWVe/Syd6+jelFbtUgDtM9q5xCILf3bcPmJmy01/U
         nrMZiSrFXOWKFLx62GKRlHxAu8Eqh5CfUZqbJVVMepOsuDtRCfAEghHbCphYWEQNx/oW
         wYRCC7ay89RegA/rzR+CSM8xhhCF8emiZ0h34y4XsaOEIr/3KC+LII6MR7VAsxwFwqVW
         gczlf/Oa/+GcGhmhHxi8xLNNqVG19WQZcHDrBnaWRt5gF1qimqF/At4A4RvYSi2Ymlfy
         ks56Ph6rS8SWGEc6umVJUEG/+KjtlNMii7VWH229WsxcDWncx0WE1XnWWWHR0K/44E9n
         Ut5w==
X-Forwarded-Encrypted: i=1; AJvYcCXI2GLrXSHHjADXsFgYuu7MMi+g4nIhDMgodLYXdWV8o6Xw8MjP1mdpYxrcT/MLucykjEvBzt2VzJFRayU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzztwM2Wsw9ZgOjg3cDwByHhEhQOLuU7LbFlwzrLdAgO0f+hOuV
	8EV6Pa9YJEeTU0TsPcEyH7wKau2H8ohZiqqYSW3cE7qnrM7cH8xYuGMNPzbXh4dnXNLTedkJTkz
	ytKPWHuDTcmmjnCiPVEglu9SmrwlAc90imHnLl1Yo/ubpAVpJKzCH+ah3OI/WHLm6Gmg=
X-Gm-Gg: ASbGnctN7eeY9vFzJ5M+WyTKvpz9Hytj7DsaFuL496J4Wuv6OMLS3eVQ45RNZYiGP7n
	BQLIgtOBX2+vLeNwEtyVO9byksl5WLHd/pSgfH2MSzDlL0tiMtED+FhRKBdXnj1sOkp7qWLxK/t
	b5r3UNPzr/zwDF4AJ/MBNjGTbo1AwA5XVz5QjaUtXGl4zGeXBgFUVXoA/giPUsEUK8BddVKfCfO
	tNW5vgYoGilyh6/sfBpqkk6DwUZ90eAqOWbaPvB8BLmIio6JaoTY0d9CthHmyFIKOilTLuJHkJh
	wNqgzjnnNwFNSFsc/cUiYajcdS6z26foGU2juxztRyR03gmeirU9k5YAfXgWu23xABopgA2bSCw
	90697a27/1uqbQPRU98T9VtLpx8MGMjQFEJ4=
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id af79cd13be357-7d5dcd40ec1mr456502585a.56.1751646718732;
        Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpMRUrk1CDVU+F2WTSjBGZWFGqazNAhn/w6PL2+6knrtMnP4ChdfOP+UWbEaeEkMn89T79Ag==
X-Received: by 2002:a05:620a:4114:b0:7d0:998a:2e64 with SMTP id af79cd13be357-7d5dcd40ec1mr456496585a.56.1751646718065;
        Fri, 04 Jul 2025 09:31:58 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32e1af83102sm2813571fa.6.2025.07.04.09.31.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 09:31:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 04 Jul 2025 19:31:53 +0300
Subject: [PATCH 1/4] dt-bindings: display/msm: dsi-controller-main: add
 SC8180X
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250704-mdss-schema-v1-1-e978e4e73e14@oss.qualcomm.com>
References: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
In-Reply-To: <20250704-mdss-schema-v1-0-e978e4e73e14@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1468;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=Wcfz4bb2UH4k4iauZC9yeDtbL/XAGvi5MpIvhkWE+84=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaAH6NdCA26k5w7rflaL/C0ZoQBv6Ah0F9ug1Z
 Y0jE0oTs9eJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGgB+gAKCRCLPIo+Aiko
 1d3tB/49669MgQgqtdl5XpVt4x+mRqFwJOfQhto4TFrSToyu4TtQroVaUAA0a6PXNNJnQKjjNaI
 zFcWAAfwkbz2xbvtLvaz9CEuHTV7yq1UGmSJdfhIWDdx1UMkgcpTBkt03Z2JXQDiCdpYW9wHeQe
 VE6dOe0zm0s9ZZ0k8z/RoPPerz2ixTynYeSrH1FrVYczgX3FPjxmAHmPmWKgLoMDpe+GeyhhiaU
 kh2E7j7iwjoP5uijoLT9MNEVA+bqzIB6KAMqE5ohGphvVzjTpZqoH1bIxc7GsrlhMZwy9U5ujE1
 SwLVtNqyyAH5k88oPBL3fDVVygagjafuxZSgqDdaJgUc3fk8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=686801ff cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=93dKIss0COAcHyiF0SEA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: W4aYnhNois_yPj5htb6YHaRRJxERJow1
X-Proofpoint-GUID: W4aYnhNois_yPj5htb6YHaRRJxERJow1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEyNSBTYWx0ZWRfX8EeZ+UYxwp7S
 r1zlYIZIrepyEwMwRg+zGBLzJYw2G7MeVTTkvOgldobD0S/V2n7UnLJp0Y3y+CZNBioWm1on7A7
 uO/czqFDy1NY4afnFsd/a1AE2UE0zclAoQxra9hBO3rBhr6KRZ1MGUs8Rj0Ukfhfou6QSH/02Sf
 nJxvyqwUGiYD5e/Fsxcg0tgq23gPylquEBE8azuPY2vh9a2wsPTmJe6Igphb0ENG1IgzEUGGPCv
 74F7Rh3sEZriEkedL0mB0ZZznh/rNMs25pE0pfjb/3Pncts0ztsE4+e1Rwv5VKBiXj64e4rK44t
 fyF7ixlnPnkIsmf8XNH3Sb7o/hlGFoOUwYsgPnOPonVVG8wl/4av8MJcHKUFEqcSBQlZZkJ1Kfv
 L2+/NKxl/LH6pbPDo/nKI304d/JKSiMRkWdDayW48N6OG1tMZlxkh7pnMrgXQvbGJRnFEUb9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_06,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=959
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507040125

Describe the SC8180X-specific compatible for the DSI controller persent
on the SoC. While the current DT for SC8180X doesn't use this
compatible, all other platforms were updated to have one. This change
makes SC8180X follow the lead.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index d4bb65c660af8ce8a6bda129a8275c579a705871..4400d4cce07227c2f8938f126c77213b2e4bb9a5 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -27,6 +27,7 @@ properties:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm660-dsi-ctrl
               - qcom,sdm670-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
@@ -332,6 +333,7 @@ allOf:
               - qcom,sar2130p-dsi-ctrl
               - qcom,sc7180-dsi-ctrl
               - qcom,sc7280-dsi-ctrl
+              - qcom,sc8180x-dsi-ctrl
               - qcom,sdm845-dsi-ctrl
               - qcom,sm6115-dsi-ctrl
               - qcom,sm6125-dsi-ctrl

-- 
2.39.5

