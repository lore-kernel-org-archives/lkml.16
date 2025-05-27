Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05F87218AD1
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:05:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748379910; cv=none; b=SFfPGy09NpYndt+gqx1IuyulM0FxLG0hTL4KLg7Ysf0GHGu8hZU+76z/huMpQvsMbCkg1Na9gQo0TBFbn7LYiD354/IwgkLCKu2kzyRbjCiCW32PWkajRFk2If4xGD1OYNkr/pIPjfiwFM2YUtr/RoC+5qiZZsIFXBoG8flI5O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748379910; c=relaxed/simple;
	bh=SzHbHz5W+oX3YfTw8d3BpgFZXwsUINC/XLP2fP7cIaQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fpfspYeykffruPuKjMwCHHshrpmN0AH3ewwFw73hC4CqnYs3CBZJGTi6vodCbMyN9mlurz6RXXFlvpIjThSgdFdgyxWSNybZuFOdhQsznVSOMQvgj1TTSHpdOgQSv2EdgM561MZ9jLijvif3cK76hMH26HR1oh8I9XLC2DcEJpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XXLFu+zJ; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XXLFu+zJ"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RKFpIB016904
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:05:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=; b=XXLFu+zJIXzaJOnH
	6MmY7OJEfvk+vqpjXwDNKNhnTFbtvufAnTxh0w43zpikEqqTLCYhUKVa5MY8XzVA
	XBJAD1aHs+NBai6fjOp52Bx1RzbDkUatBByTbzuPgJPwfMLFpVgb3Sg+OBnHvkA/
	oidME/ep06EwgmBqQCMHpldraWVqtH46MEqXGm/cDll02vDhM9tqtRNubME16HPs
	eXvwB16TAaTZTGAow/4+PY82BOZt+CAxfoeQ3g4lgi0gGrlOs+YoQG+zookZh7Qs
	0rEtKo694lDbsfnxz3eDjrRTZBJxvSeklAkL6fncQHDV5vP9IV+ZEF3QLKGRcvSq
	kKqKaA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46vmgcvpxq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 21:05:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-742a091d290so2604476b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 14:05:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748379906; x=1748984706;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=teg98KnCXRHpbibmB3t0iTGw5Sr71vWVJCSu3Gc6TZo=;
        b=Hl/TF7LyOtZMQNguMFOhLaTRw5M7CQrksZRiNUwDSZSnrFFFcQYubWjC2pUurXViD1
         m/6YMYxlVwMJXwuuhU3tkpIY1OO2oC/05J1GgICXzAS4fVR50FmxNHxo72Lt9ghOJmj0
         0o8Ugon/Tl0Ls+4DF+RntZKYMowSvVqykvkMItRQJGCDG1vyHNCMLFrfGG2muQOsU4bx
         1DZwAQyu5UPbgd3uXq+ArNCKRO1viIP37DD+IdTTAy7+5WBCOvHhKrv9oIWXQPlt63TT
         kwCByss8AUu8A/ZEj31hZyz6op0LI2DwN8hbsRh/qyvC8LGGxsmjZ39K/ssTTQknuaKO
         E1ug==
X-Forwarded-Encrypted: i=1; AJvYcCV1Au6QMffeN5IWuQWA1cugnKUPNaSsTnlM6XiBudChCWOgDi4P9D/HgI3YXFcc17oQaKHFoErpjo5xQ5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlynViE3FtVTTaw+KxPYcNphPVGx7frSriU/NXX8OwVocVHXUB
	ITstS5TqP9WQae4om+J/8or00+6cUq0dGoYomjq/eJwWMKKAccyzGvMKv/ijudV9jz7eLHpar7u
	TUCJ2L3NV4SmvdiEzmkXgOjeXo9hxXhZMUm+4+ls9AoE7EKtDuJAfsTrfYcMVvlWx78c=
X-Gm-Gg: ASbGncvdcjSyACY6C5Rtd4WIO0sabnyG27J7y2tSUajr2uyGP+q9wTjmVCT3DFj/JFs
	RqZZFKbbJpL4Zqd98HxEPV6PvcLYWH6oJd/66D0Qf+6E263K2LFFXW4iorZPRr4VVaPQ4Y52mDW
	m2ZnaMuKxhkjPdn5c8DL9T5lasJCcq2Nj702VgFvVl6iYDKGSB3jLMJkdcZRuLAo8eJNwjXUp5g
	hodMUUehc7sAWdp8s335RWHhfnKXPtmmSbQl5VpVjYxG2wuMTVI2zVnhOhcH2SfDaiPIG5fhuGx
	h0vi2QBwGZr1NZpYAXx+jcqstZ3zbeH0B5Aq31ZvU6PnWq7uK1Gt/7oww4Bhk1gmAxk=
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718624637.6.1748379906514;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFurMh4Ktwpp0qvzyqJkXxlrwd4QWROOgS0twx82tbgVIupB84blzpNgeeLHqbI8CEKvbsTDA==
X-Received: by 2002:a05:6300:210d:b0:203:c461:dd36 with SMTP id adf61e73a8af0-2188c20df49mr23718567637.6.1748379906065;
        Tue, 27 May 2025 14:05:06 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7465e64836fsm29167b3a.26.2025.05.27.14.05.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:05:05 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Tue, 27 May 2025 14:04:44 -0700
Subject: [PATCH v6 08/10] arm64: dts: qcom: sm8750: Add USB support for
 SM8750 MTP platform
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250527-sm8750_usb_master-v6-8-d58de3b41d34@oss.qualcomm.com>
References: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
In-Reply-To: <20250527-sm8750_usb_master-v6-0-d58de3b41d34@oss.qualcomm.com>
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
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Melody Olvera <melody.olvera@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748379891; l=1355;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=Nx4I/ZG5m1Kxa6LCnqamndwPnsXvis3d+v65oICH37M=;
 b=Hp/G/DtacnwV0EhGyfZOVZRkpEebZE/+1C8caI/kuGc9Mek4iJ/VNGTuOQB6QRMqQZR9IOssZ
 3IGYp9vp5sFCd3IY2cf3mgW1K0ADTPQeQ0gcHgh7c9fof70ePb4DYOm
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Proofpoint-ORIG-GUID: cwqKgxFgBzMiRTND4y121d42dldWOh_H
X-Proofpoint-GUID: cwqKgxFgBzMiRTND4y121d42dldWOh_H
X-Authority-Analysis: v=2.4 cv=Ws4rMcfv c=1 sm=1 tr=0 ts=68362903 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=Tsvuh88POXG944tnl6EA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22 a=TjNXssC_j7lpFel5tvFf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE3NyBTYWx0ZWRfXwEOHi5BG5JoN
 wHWPdhQWzKohpsWcZzpg1AhgCYFwD/TIXvqlOaydpaldxcH6jsL0uiL9mG7lZdCr33+RH6I1q3U
 fU4x6dtg11a/Rwi6znJLoV4ocvH5SnHNM6TJEGIsdr9JPZn+Q2IkuWaRBUXWLVpAiRq3V6YyIf7
 Te9hGPRtsYTOO5URgGGARrQr1yd1leSRvF80LKSzl6tc8wglFw4IzIGrD8aBxMAi/+5MUvcvH1w
 9Fv9WZleIVWWlE4VUei22pMxOelVLcMORhGBVBKZ0KHCkykFuwQPbiBLNnqiNoPfKlVy9YYpg4L
 azHUj3RfWiytC7rLSAnqhtu/OTbctQK0A/nt+IiT9zBuo0T0o3ioEWDK47+bMjQG7cNK4t6/nSf
 aFa8TKsetKQHFbdRt34LG9ZUsCBziQ0zpP+n9jJbybU6+Pgy5eE4f1mn2+qq1+kbIaevhY/G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 spamscore=0 adultscore=0
 phishscore=0 mlxlogscore=823 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 bulkscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505270177

From: Wesley Cheng <quic_wcheng@quicinc.com>

Enable USB support on SM8750 MTP variants.  The current definition will
start the USB controller in peripheral mode by default until
dependencies are added, such as USB role detection.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

