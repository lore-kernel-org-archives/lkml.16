Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2307621C9E7
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272844; cv=none; b=secuxyhKzv+uQT1O2raC7pqhakjoZ182B8vLaNyF/dzUPAAHzlC9Y+qpof7YzIowkoRPFkjCmZdpctYr8xdghOn5Yxo5vMIrofdsCYjGertAXQYd4BVWviip9aljRZ8F3oBfuRb65od5J8sXZhqE0No/ya7UfKLvu4ElMmxlrkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272844; c=relaxed/simple;
	bh=/teLQKUqqqqInwDBMhtvz2ZoYlg5NLp/HJndy5aOQCs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AXiZGPk72X2onjOHcWDKcxBfCyk5gIf1Uunrs9i6HwCiYkqOZOQzZ2l5rY+UGpDIa6y2OYyYBp2yhtbavUK8fjymfiZVSwSHeH9VTv/Y7JiAhPThkFT4HYH3YkCZHPho+dXlGsXjY2Kc02lXw3ys8sfYzt4v8LY7X/tXVSiSyxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=aaGE6rkC; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="aaGE6rkC"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK40YW027161
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=; b=aaGE6rkCZtdvG9tc
	a1qJ8uhw3iP4HEmPkIB9O7+6NRD1tTXAbC63ftEebmgZjiue074qGi4ystuDl6U+
	DsnqM26bSQWEJeZUgC+/1Vwm0JTGiko1mm3gy7ph+P4ZOFZXnNwrhurZ3uPD+lUU
	9uclUqLnPUgUHQ6aK6vJFSTuN0raWCwWKmK0TK1y8GGqsbZiBoYoXVmpRdylZ87t
	VjlHmU//+4TjwtmPTnKPADrHpNu9ygdOEMuZWAv+mQyX1vc5li5G+Fd09UmfeKx2
	uI5b3z5l/gcd3RW5dSnU3TpHpVUIOgbEHk95ECd4RxhwGqoAcZXC5+GWu+42BCHG
	MEbuxA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4643wwnf0s-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:40 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-736cb72efd5so3340143b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272839; x=1745877639;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=85FTf5dq3WUxvPAL+FcZsdyjl6Gon2Kpy0Ag/qYK1so=;
        b=REiwyJCPIw+2vq86fmcnPpMmQs8qUDCcZC0rZvuD4h7e/UHU+tt0VBnYFxujeqpbQx
         +n0VYyzkCr/xXsmMjBI75Xk6D2o1SP/WGciFxLDN/qqgFuPnD6Hh9kwQgHqElS1bbPwP
         NDwIQC1dYM8nf1xXXk8hTpqbqmkqEEGEsIpyAGOkUR7FtMl2rGcPlvSOrQnu/QYhPFsG
         MTMnOuyGWjikd5m1VUldiQq+b1I6+Jyy5clq2zqGWIyK8rS/5HrUnruY2qVH5l8EwcDB
         t0pLp/N5raMGLjjdm2NaLQGvaLjhapKU7dne3JdLi7lEX4scky3FXOIW7ZRn9rIEmAgP
         zoWw==
X-Forwarded-Encrypted: i=1; AJvYcCUo7m1BKTjTIQkWMYgL7DngOijhI9xSNb9jDXt+v01N7kF78mOfjI0A7rhtJnSzz1KmoB9emCrpQIWDjK8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcmSyY9J+T0QnwggnOb55L3z6t2ZCZVJXiGAL/IlavasR3klUo
	H+S13aQgq0WRqTcDy6P6s8JOkGcdrl7w1E02nPkAuMmT7uYEsuCIGpZ++jRavEAszUDILVI92X5
	MoZRvM2J3FkHtOrcXefjpY6JV9n/1oqao5uM7vH/43+em7EXjSs3Rf4iLKUpOSM8=
X-Gm-Gg: ASbGncuEUoaaLdsN8qIGh4Jl0dXqlPFNGSCvMwY85Qe5HCJ2q8LBsaNvhLl2vVnU9+5
	VaBF2z/bkxNP+Mnluy0WyLmiYEj5N1I7t1AAvr3Feyv8Sdhe8fGlDChRm1eF7Pmp8meYbKFDnhP
	qObXrZ39NAdojXfrhkIPjbrhZoQN926xW9AhbZINeF907852piYarHnH3wcAblp4ngAFdcA25+M
	orYbnJOJSD5YX18bu6m6sizaw2EjjBii9BzW4PmNfal+0DsVpOcU4MdY5FhSmvB9/o/fcTA5UJL
	L//Ililr76A5twCkW8v2SUOcuWHqxJMDMmcdua+rKygJpmnbdcenJ8LKuzN7B0TRDsg=
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001105b3a.11.1745272839441;
        Mon, 21 Apr 2025 15:00:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHsdbfJsm0KdV60HiBE6DxPravmfAWBBMxUJAVErJZ8Mc6PzUneSapkKYNVVusWvrtS/jXXkA==
X-Received: by 2002:a05:6a00:2182:b0:732:5611:cbb5 with SMTP id d2e1a72fcca58-73dc14cca88mr17001010b3a.11.1745272838817;
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:38 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:15 -0700
Subject: [PATCH v5 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-8-25c79ed01d02@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=1288;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=+b6x2t1UZ9tBSOYbcUj0Sk6c/9sXGEBZ/MeOUGfqqx0=;
 b=soft0JCqQzQ4F8eO5+nGm1bNhAoWmg05DsdBm5joEmpWCGlAn4jtQjnOkgw73BUZ0YG2wzdbV
 MIzfiTfDUVVDzggWNSMwA7WyAd2Y4JqKHO6Gfg+pWQ3VJBsB2Wx28pV
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=IpEecK/g c=1 sm=1 tr=0 ts=6806c008 cx=c_pps a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: V5a7Uxoas3_yHYorqa12JIFQbLPbC9ml
X-Proofpoint-ORIG-GUID: V5a7Uxoas3_yHYorqa12JIFQbLPbC9ml
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 spamscore=0 adultscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 suspectscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=816
 impostorscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2504210172

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Wesley Cheng <quic_wcheng@quicinc.com>
Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8750-mtp.dts | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
index 72f081a890dfe49bfbee5e91b9e51da53b9d8baf..d28e45111b8d01c2753493a7a4ee248bbb334aa8 100644
--- a/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sm8750-mtp.dts
@@ -814,3 +814,27 @@ &tlmm {
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

