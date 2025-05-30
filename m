Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE88227876E
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748627278; cv=none; b=akqtCg+0zKvqZZ3OT1U92Frd4hT4vsX7sMIwo2mwyWuCjHlZEsbyTBr71WW1D+Mpac4fvl6NBcNaALDeqosMCzWn6gJ/fr/i5qnLgjHa+tm9dHUQgmkvFjuSsQQ6BLxNF9wsPgWJd4au/JNkZUA6ZtFM7e0u6mE12MVwFrcjoGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748627278; c=relaxed/simple;
	bh=IFPkcO+SBBwiLHryCEam38Y/ThA578cS13ChJk/L3dU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AmrycYLZJAkVp7ELsKtwj9TyOfGwlw4eY8YIIVv+pp58FY2+Wi4vaNuYC14urhXTZDLRFQmg94Ss4FFhWIiKGQvuvHq1fZfi7mB951Z6N0/3m5vJYJJ8Qp8s2zAdwzMqwQy3zHKOiulDaIfbe+XGjMBeTMfCK/qay6aEoLxY5UA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ivU11vWF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ivU11vWF"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UAwcaO011696
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	udvmo1kOasn0QS3/qdfX4+H38+qgrrNA8t6VayqEHFg=; b=ivU11vWFvW7EScUz
	KtK1O3hbxxvHfpR4zmrqB3AG1qA8UY2GmT6Pr8GqtB9zp0vwF5tIFUCARU7Ag/Gq
	cOx7ntis8kMdBP33dzBpxRjP3zSEFob/3pU7DlDBsPx1Ok8uGinvVV/ACmRVGHZ0
	RRdP03XuxewEMU6dFE2lCDIqphRyRQh4UPvNPM07S6wJy2ReY0WTyMRTmBeC5iM2
	13MRFoKRaE+6JY7Yyr5y0jkmtEe9c+WpdXLhyQZvk6lL35St9bq5791YD3kkGUv1
	jHU8EiFRgJLJKb5xscLcTRUBok7G+x//1WK0RakfUd5Vy/VptsCVNrEts0l25sAg
	/fzyuA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u6g9a1w0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 17:47:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3124291ffaaso919152a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 10:47:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748627268; x=1749232068;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=udvmo1kOasn0QS3/qdfX4+H38+qgrrNA8t6VayqEHFg=;
        b=Tme0eXRKheFwiHGSDEfZWF+OK+FPtWJoFzsj8VJWD/1I4NwuARI6DnB6aCfBadIm5F
         uzrWlO14vP0MFGZA7/534hXEJ0YxY7lOhIpVdJgOYw2qezgtI4G32Z/DkIxsyGN3ugwt
         yjA3GXunedlx+hVwLXLdfJMrOe4OaawAvnsKhC9Czsc45TDQTdcm8sAt4kiNwozTIMiM
         eGr9jCAJWaxVPl5A2Xl9lO0XuxFTX1JmnEX92qLWA6V0x7E1qNqqKfNuAfWxA2kISdfi
         AiWInh1KlxE6/kGoZ2adahARlWyztUPLUw0ZmjOFkaHPFdRbphIfzluOwsGBaPW03oDS
         ZIoA==
X-Forwarded-Encrypted: i=1; AJvYcCWUZAnyVACXpkv0bP/WcY7rcH5TubrI0BLrIB+5YQOSeihYfecDJSrjYiMTqn/wiKkViJ28sB2ESiGeXbQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yygc0/NybsW11QjgB23XIMaJoOu9QkAueEQQ+QxZ8HwapH8LKpD
	3N8Ub8b8/Oc91f9Jh5SkJI0zaH4wJNrwg1P1rE4OnODglsimnDJqFc2OffnJwv8JrMRcIvQgpKC
	lFvXvkG5i6EMHALUYO8POYDiO4oxdX8DowR7DPzZ/44JB3D32Y0wOSrPvYPunHA/RAaGCbOk6b3
	k=
X-Gm-Gg: ASbGncsw06OXzpmWYd3WU1PjKDQe9rIRdTo8nTAMmJ+KaqZDj7ndROG504i3z+CMxAX
	lO/UTw+yoLJFqTH4/vYhH9/vT2DGHgpM/pR98hlvtC3Mt225ibAp+Ve5rG83hiM0rdRnMKtaWxp
	CdIiwlg6Y77+N2KwpLPv/E1dzgUCA5tWIKR1z42LCy6quEvldl5AfwJDkU6u+0zRE07uOArmvLM
	lHvRTh+WAnCQckZPUWJNv54octFgZ0VlzJ6GJkBxoNEw5yz+AhkZcUNsEfkuv5/vmo0pgHir/eV
	o+DT2yy+MqdVa8JZLODyjWtvmMblTnDIXPFKaftVCbMyxdwm6I3w+JKJ82SPeMVPOkM/105R
X-Received: by 2002:a17:90b:3eca:b0:310:7486:d60b with SMTP id 98e67ed59e1d1-31214ecdba7mr11895009a91.14.1748627267662;
        Fri, 30 May 2025 10:47:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFYM6Tq0PT3L6Et0ngnLO2GAyc7Ioe4U+bK3yEkIDizDcSa6y+xjFo072yssMT+EmgOBPqQIQ==
X-Received: by 2002:a17:90b:3eca:b0:310:7486:d60b with SMTP id 98e67ed59e1d1-31214ecdba7mr11894951a91.14.1748627267236;
        Fri, 30 May 2025 10:47:47 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 May 2025 10:47:46 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:26 -0700
Subject: [PATCH v2 3/5] dt-bindings: display/msm: drop
 assigned-clock-parents for dp controller
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-3-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
        Krishna Manikandan <quic_mkrishn@quicinc.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Yongxing Mou <quic_yongmou@quicinc.com>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=5805;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=S1XB9+JaEMa3iAt9Xnmf/DC2ThwkEN2OZRdUbvXaoBc=;
 b=lSebu3NXgPMqfVrX+ZExdEw0Qt9hbmK4Ngu6DhqZ8NRNYqWLC0MYOXj3XB+BigjIDIQIaX7Gu
 Xns8rhdsQs+CIcPDZ5zlZf1FMy3EZgvEUmv3T8M8JY4/s5MYN9ipqak
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=d4b1yQjE c=1 sm=1 tr=0 ts=6839ef45 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=wErF9Qt5opcPDqNnyToA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: PsgEAX6YIDpGRE3uPmONAIcr81a0k8Dh
X-Proofpoint-GUID: PsgEAX6YIDpGRE3uPmONAIcr81a0k8Dh
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfXxCjnzysMpuwg
 KMLLKfAp0x5GQkiwMX9d7RMZEp4vc5qI+1iosKqqP4GOcciozvJq/aH8xOPFew+VEqBa43sBmcZ
 79Eu2Jm8Y6ZOTPprAmRNPCzMxbahAhCNM9YmeM1dvc3WsqkcQwEJQk05bYvKrgJl5nsf6pvAiMn
 ZuOR9AEW9BOOPn2s1Jvr08pozx7qqZetEcOW1M54zLC0R7q/77wz1qvfN1ucC9OYKZj2WDx8EH7
 XhWKbOlEMEb7Q+6XZhpUAnPA+JJcVqv50BlNfPlaR/Q9WNCqXAlBGtYCu8Nue3pxZSkzWIDGUDs
 srZ0zxJyR3yxIEeESKhPpVbaXPgFGXixOzfgvHgDw2KDTVZrTRAeSNTxHWWQFVwbHWZw4cMW9M6
 UUeV71/KNK9+kYwCcTxkJ/kwDeraU12+9hmR24N8lfvP60mdlf/MrYZivloSI/5R6CXXKAQG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 malwarescore=0 phishscore=0 mlxlogscore=944
 lowpriorityscore=0 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015
 impostorscore=0 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Current documentation of assigned-clock-parents for dp controller does not
describe its functionality correctly making it harder to extend it for
adding multiple streams.

Instead of fixing up the documentation, drop the assigned-clock-parents
along with the usages in the chipset specific MDSS yaml files.

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml   | 7 -------
 .../devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml         | 1 -
 .../devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml        | 2 --
 .../devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml          | 1 -
 .../devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml          | 2 --
 .../devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml          | 2 --
 6 files changed, 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index 46a50ca4a986..a63efd8de42c 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -74,11 +74,6 @@ properties:
       - description: link clock source
       - description: pixel clock source
 
-  assigned-clock-parents:
-    items:
-      - description: phy 0 parent
-      - description: phy 1 parent
-
   phys:
     maxItems: 1
 
@@ -208,8 +203,6 @@ examples:
         assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                           <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
 
-        assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
-
         phys = <&dp_phy>;
         phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
index 1053b3bc4908..951e446dc828 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sa8775p-mdss.yaml
@@ -393,7 +393,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dptx0_link_clk_src>,
                               <&dispcc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&mdss0_dp0_phy 0>, <&mdss0_dp0_phy 1>;
 
             phys = <&mdss0_dp0_phy>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
index 870144b53cec..a1f5a6bd328e 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sar2130p-mdss.yaml
@@ -216,8 +216,6 @@ examples:
 
             assigned-clocks = <&dispcc_disp_cc_mdss_dptx0_link_clk_src>,
                               <&dispcc_disp_cc_mdss_dptx0_pixel0_clk_src>;
-            assigned-clock-parents = <&usb_dp_qmpphy_QMP_USB43DP_DP_LINK_CLK>,
-                                     <&usb_dp_qmpphy_QMP_USB43DP_DP_VCO_DIV_CLK>;
 
             phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
             phy-names = "dp";
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
index 7a0555b15ddf..f737a8481acb 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7180-mdss.yaml
@@ -269,7 +269,6 @@ examples:
                           "ctrl_link_iface", "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
index 2947f27e0585..7842ef274258 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sc7280-mdss.yaml
@@ -298,7 +298,6 @@ examples:
                           "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_EDP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_EDP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&mdss_edp_phy 0>, <&mdss_edp_phy 1>;
 
             phys = <&mdss_edp_phy>;
             phy-names = "dp";
@@ -389,7 +388,6 @@ examples:
                           "stream_pixel";
             assigned-clocks = <&dispcc DISP_CC_MDSS_DP_LINK_CLK_SRC>,
                               <&dispcc DISP_CC_MDSS_DP_PIXEL_CLK_SRC>;
-            assigned-clock-parents = <&dp_phy 0>, <&dp_phy 1>;
             phys = <&dp_phy>;
             phy-names = "dp";
 
diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
index 13c5d5ffabde..3cea87def9f8 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm7150-mdss.yaml
@@ -401,8 +401,6 @@ examples:
 
             assigned-clocks = <&dispcc_mdss_dp_link_clk_src>,
                               <&dispcc_mdss_dp_pixel_clk_src>;
-            assigned-clock-parents = <&dp_phy 0>,
-                                     <&dp_phy 1>;
 
             operating-points-v2 = <&dp_opp_table>;
             power-domains = <&rpmhpd RPMHPD_CX>;

-- 
2.49.0

