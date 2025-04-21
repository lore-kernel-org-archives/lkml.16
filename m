Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC9E1221544
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272845; cv=none; b=p6V/duhPOwysApo8ZOt+zLzJUOPaE+5+qzzBwFPVPS7LLp4BGhIb1K8qE22XIltwmjvSMtKax8t73ZNPpQpF5t8sKDrqeZhr9KWEgVQyFemFYFVON5m4ZnjZClMatiCX0+V3/A7RbWRrFdCj+hG/QAKZ0cPyuobfeGXRi6/5pLA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272845; c=relaxed/simple;
	bh=ZGTzQ2ZkkvsSC/rklcWp3298b4IazTCUmDRyNqAhQoQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=s0cWUU8aWFgwIk3NdfKmcsaVw4dQil9tOBfLnzD0iXbTKJpBa7CMWTkTOidb79FoxAr8MPiD4upiUiYp3si3dHptkPKw0aufG4gvY4dHNe/YsV2c9h24mh9h9lARtMrxkNO2V0Fp12UDXQHRrtGmCKdesCHkNpAdQUHwu202ZkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LIEZACNo; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LIEZACNo"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3q6Y027140
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TNZhdDbQ4CpO6odDNFgTaspOuazgSLRe+Qho8Mt2o/E=; b=LIEZACNoFs8EkWUE
	JqgZHQL2t2pC4FguW+h7jj5lVZJkKElBNg2NiOt231JD58DlKcTUPNsqi7nSBcKL
	6EnSPEskBuaAF5SBVERnTHit8CkhS4eAbe1huYHE7c1MUJB1rBJImZyJmX0OwNQ7
	dbCecxY5ejTK+OugSdCui3LnVhekJmCRGug6ApwycxSvMpZQUGO3+eRA8BpXU89E
	DzZ5yStoLDPTEwl/qDbVs6d/HsGrHcmG6ob+DwUMWl0/p0j0+U7gf9qvTmVqhoPs
	oS0wfLPWeVeX/uS2R+Xc0bs0u3YR7n0KhlMiJj64zKKdgoJ2WfpErRsPcf/MMXPo
	nd61/w==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwnf10-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7391d68617cso4468345b3a.0
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272841; x=1745877641;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TNZhdDbQ4CpO6odDNFgTaspOuazgSLRe+Qho8Mt2o/E=;
        b=v9iG56ADFQJOvOKuQTfBLxLyJjzbPd7YdhjkVXXGg2Sr0XBiIe/zlWYZlvQIOdn7Nn
         /1ORqQdinUu9Ap0RoCD4bddWvLRkeb6KFXnMTCOaCZPfVTzznJWIhmQbegeTjBEX0KzP
         6uEDZGw055mvEM17ixs7L890IMPup98TozFJaT1KnsCyZLyZqIwE933qIFYERtMfj2MA
         ZIMPc8Fu3jF6RHPcQ1uZ6wbPKdWSALjsjhI4GlKJotMFgEvTzHK6n5sXeIuPTDvozOcu
         8DfOhb3GIaFoz2/JBAPM9PLDBqC/v4Zbn6j02kNpybe2uLgALabQcMCEmsydA1lkpdKd
         mGkA==
X-Forwarded-Encrypted: i=1; AJvYcCXr4zHD9AyxXvNNFGPlvMhMRQdLyrJD1GVTi9apuODLA7G9D2A7escydZKQo5gThn9EGlHoelLTpwFmrGE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzI/Hs/kAtLLRzr5lU9mPlMfCBClYIf1/owBssnlmx1xG5Z1QVp
	q5Vl1BgolGVa6tn4R5B3hJQJQtm7E3CWKLeSs4K3Zq8GWHN/Ggeuc8IBLanW4p5fwXD3r0XHYbC
	rNUHFB0VmGmZdf/2667uHk2ykhg1tcv3SwLHkKUWwoycn1WUNiwGeOUIwzemqNMU=
X-Gm-Gg: ASbGncvqljW0QO5/sPiWxnfXvGmP5T/Mb/sEYKR9kpPhPRxj8Rs4KLM4ITS7DuVzJiw
	5pYHe423ZSJbZsLjEgugBcd9RQlUoauNeHi/nFlNajAuPW9yUTo+6eCiaYIOsIwIQOJK8QAtzpf
	ZipFCkzypzeScWaAFRpu/srfmpM3FddrUC8XccwZh4txWobfJLQhPBSC3spg2723ZNH/bqjZELO
	GUI2coG52dzL+OTffuwMyGk/68F7gNzJ8thBc1yuPqbieT8G0bFNzzGrjQGlohMHmMy03MOOBsp
	xjnxp/8NO7nb4M/RoggpX5ZhKzeYZh0cq/rrMb76NX6vPPWspV5YOwHaAsydkZW9h5s=
X-Received: by 2002:a05:6a00:374d:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-73dbe4e3a0dmr15296400b3a.1.1745272841007;
        Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsQtDnYNApQLqy5KcA6mhITkSBM1PN+PtOnFK1BaG3vcBYf9dQGt26si6zv5LYrESEmcgS9A==
X-Received: by 2002:a05:6a00:374d:b0:727:39a4:30cc with SMTP id d2e1a72fcca58-73dbe4e3a0dmr15296341b3a.1.1745272840467;
        Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:16 -0700
Subject: [PATCH v5 09/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 QRD platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-9-25c79ed01d02@oss.qualcomm.com>
References: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
In-Reply-To: <20250421-sm8750_usb_master-v5-0-25c79ed01d02@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Wesley Cheng <quic_wcheng@quicinc.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1346;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Jejw3tXebX3bwJYOfSSXxknK7DywBDBkNV50yFQ7X10=;
 b=+GRxjHBRFn26nN9usdJe78ZckstTGCijyHpDp+HOdoS8Rc7Vl5bI+yCSW4iUjQhxfeVs1hCRR
 Lj3tARvPpC2BYVuRGFVWOacXsJocvMEay3m/G9qxURxaeKr3RptnY3s
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6806c00a cx=c_pps a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=EoOMd-xwxZjzz6zYUw0A:9
 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: miCwgn9Tz91dOM1Ftl6_Bl5PmJrJQXbN
X-Proofpoint-ORIG-GUID: miCwgn9Tz91dOM1Ftl6_Bl5PmJrJQXbN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=781
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210172

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 QRD variant.  The current definition
will start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Tested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-qrd.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
index 840a6d8f8a24670a01376f8fce511da222159016..5cb18ef1bdbece09a7626b57a852379a62985995 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-qrd.dts
@@ -811,3 +811,27 @@ &tlmm {
 &uart7 {
 	status = "okay";
 };
+
+&usb_1 {
+	status = "okay";
+};
+
+&usb_1_dwc3 {
+	dr_mode = "peripheral";
+};
+
+&usb_1_hsphy {
+	vdd-supply = <&vreg_l2d_0p88>;
+	vdda12-supply = <&vreg_l3g_1p2>;
+
+	phys = <&pmih0108_eusb2_repeater>;
+
+	status = "okay";
+};
+
+&usb_dp_qmpphy {
+	vdda-phy-supply = <&vreg_l3g_1p2>;
+	vdda-pll-supply = <&vreg_l2d_0p88>;
+
+	status = "okay";
+};

-- 
2.48.1

