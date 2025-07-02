Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0431254AFF
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 10:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751451474; cv=none; b=FvIEQtNc7CWz4eFIg5ceH62p/Rndhg6JmfswlLMwSL1Ryk0/P6a/JxBZhXiXIsOCWVzYHerH+35VUz/mWQFqrcOQeMvxQKxllchx9fhIn8MH3njFoYwJCgzyMYnWVzRH9yWFbUDFFBP6znOqoMkVg6Mkj4OLfoe+njxDA0f3+Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751451474; c=relaxed/simple;
	bh=HTG5mnN62E5lVvmR9M3o5ZKUlGwP4DrQ+BOVs5noMkg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VhiIbxgr77f3P0UZ0v9rIJrrIngasVdBFSk5AUq6m++kQeIUWJicEo49A3IFz/d1Ioel6Cl6q2kzaH+a6QKPFZNdFS2Mlm+Yxnt7TYmdHHfCAcuuaGq++5RwFxveWU+W9gD97lSTxkzFHX6Sf5tuP7o/zkWOi+IxYBRiIFGY6GY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fc8zhPZa; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fc8zhPZa"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5625PjA1024651
	for <linux-kernel@vger.kernel.org>; Wed, 2 Jul 2025 10:17:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Qop/b5pDG6wy5PweIeJVl0tyyRvgJnpZddFhEDO1zb8=; b=fc8zhPZatNCHII1u
	n81VDJmS1mrAASvOVy4nOlX5JXoBdtrk2v04GKSwsTpR/32G/yqal/h+I7bc4usV
	WiEx08lQcAK+uflmq6y497Nl15SLyJQO4+ZY3+9HzBJ7VaF2fTMYlylrOR1IiOzV
	bbuNs7QsYyOJ6oEF91gxw1clCIepWU4ZuLKmz/BWA+j7MwTj9jnW9lIlh5VtksWu
	/7eWGUt0j8dWStc0S9uWNVMXWxr+Pfk4RP0r/ltSrrCFgZkBMMdpzaLVXyuP55uA
	zpUJOjbRcGelLvgWFALtZNha9dOjU0cozjWA5nZjKdyMoIrdlMD4xRfsoMl/aplg
	W++O4w==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8s9m82v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 10:17:51 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-748f3613e6aso1974125b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 02 Jul 2025 03:17:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751451470; x=1752056270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qop/b5pDG6wy5PweIeJVl0tyyRvgJnpZddFhEDO1zb8=;
        b=pf40MaPJuRRH1aNdlOcY7Dudj8Riuor/dhRCaGfxu0CCAeRkEqkoFHBwkHul9Y1oTq
         Udq9uj+GybG0FxzGNceHWkYmNO7H1Yoc9xeNRFbVeuW71ap6OVuxY1SsATnkU/WPxd8M
         Ht9763gKIy5luNN44J/lO5k+RdYNSR7JxSMcTRYQ//UH3bvAQoiJ6NU5nqo6cg8IlbH/
         vknJXra+KHX8Vj2QXR+l6S7JO5HERQgN7Hiq4vLrqDN0AA4RnYH3oCsMz/3WouUT+/Ek
         vkthUmW0DI2tJ0cnUukzrpWNl/eR4raMQ1axeWiNzQuYgXYb8n5ynZBzKjzh0kc5DjiF
         Sqow==
X-Forwarded-Encrypted: i=1; AJvYcCUODvfPDVGOq3i2ncT8b2ZO4oCPTZIC40BwNaDb96MT1PdTDhjRqs7ilQl0+e0uCXywK/TYEd3QImyyu6Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjduET6F6PIqZme8Zvf8YRXotVKQTeLg1TEM4f1VMppp6/fwkL
	rOHRSRMp822Y8UqIGT/v+0i3RsCxbE2jRZ10NpGm53hWo9bHS+uIrdj2mXxhhcEklfhZ2glC6R+
	lwpUK7CK0YgTMbRsKVsAHIFj7hVruQ3BWJywW6Ni49EtCljsbFlmRj1bDC6q98FjOJmU=
X-Gm-Gg: ASbGncuBAsK2VMjmLhHn7+YoDvPYADjHkVk97bJbVd2WAKWDLvIN18OWK+RmHbLvu7D
	oN/meNCqstsiKwj1x9L54uTTBGQ8IOBWGX/145kAjEBTizvH3GA68SU0JHxkuThKLuzquz5QQaI
	tXptyMvet8cVCOLG7WIoY9McpKvdt18R3BgOcZaeOyotIMVL2t490leOXr7tgViNCoS1HTcuU2I
	Ps03ebBhWvQMKCYtru0XWvzeH/uWOwrsuPvHO2TEtkDccr+vxJh7Es2VVJuOTse8aphj5kYVn+O
	Dt3DS5XSHSdLt6b3nvDQ5MgnmKIvdKAVcthFy2ztSCDBSw9PQraOUMiUdmEEkWSs41mrrZWUXa6
	IVuX9UqQsLSuOtNhqk2jYw/f58O5lG94/7+8kdzpbxiIs/yYbJG5THE8byA==
X-Received: by 2002:a05:6a00:22ca:b0:748:ff4d:b585 with SMTP id d2e1a72fcca58-74b50f683a8mr3088670b3a.19.1751451470348;
        Wed, 02 Jul 2025 03:17:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnytX/3KOhg2rvmEfuN3mvtRnpFknOUM5Iv99FSaxslQSVdJLuzMlQ1h9brA0rm3u6YY5ncw==
X-Received: by 2002:a05:6a00:22ca:b0:748:ff4d:b585 with SMTP id d2e1a72fcca58-74b50f683a8mr3088644b3a.19.1751451469934;
        Wed, 02 Jul 2025 03:17:49 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af55749b9sm14486315b3a.73.2025.07.02.03.17.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Jul 2025 03:17:49 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Wed, 02 Jul 2025 15:47:34 +0530
Subject: [PATCH 2/7] arm64: dts: qcom: ipq8074: Add the IMEM node
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250702-imem-v1-2-12d49b1ceff0@oss.qualcomm.com>
References: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
In-Reply-To: <20250702-imem-v1-0-12d49b1ceff0@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751451460; l=1197;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=HTG5mnN62E5lVvmR9M3o5ZKUlGwP4DrQ+BOVs5noMkg=;
 b=gZmB69MHK7JmUMfujejANSJG7lomSA8NVYOzbwUJDV7RLCErYSxNCPLb20SF8DIuqr24D4sQj
 iNrljTsnDiVChSBxRIO9pLM06GLnQekbvTj5JJvB5UGz0t3BTFQMaBS
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=H/Pbw/Yi c=1 sm=1 tr=0 ts=6865074f cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=g_gtcTFTaut2jdyMrvoA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: z7bUF86bYHG90a7UKxyqEX8boHxd9zAY
X-Proofpoint-GUID: z7bUF86bYHG90a7UKxyqEX8boHxd9zAY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAyMDA4MyBTYWx0ZWRfX12hFk25Zwakz
 MD+C/ailulIpS/EazkDBsjI0/OTK4bSRnGbMD9RnsOrvtLJsVsVkBmyVhIwwPknxOwpt8eD5loj
 Boh8lP5h83eW4C76jR67e0k3s2hTLt+KFIpWtOnKbIGG917NBhPrnn8v0feP6eQNK4Hx5WMDNRf
 axZj46nV2JWsPP7h84Lsrkevq1/8vBCbKBJnWwxKYAjd5JHU/rG3tpP1Py24DZZ4DfXlLmtVP/5
 sml5IxbdG/hmZY9FPsggDyPozB7DfocYD/S/zrjHPG1/RfFVis2rEtZl3UrYkGTv9voZRc5YPkJ
 YxMAEqWdySylmW7cxbjlIQgfRG1gW3vmSx0pkM0hi10jySSfOAutNXrwaT+V4HhC/otZlc8R8R6
 3gO82vQY9Ar6kCdtIOhZfIWtxBpqw0c4hQGOrVSPwa0eLlmTXKlvHqZkbWOb9l3m8M1hcBkL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-02_01,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 suspectscore=0 mlxlogscore=714
 priorityscore=1501 clxscore=1015 mlxscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 bulkscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507020083

Add the IMEM node to the device tree to extract debugging information
like system restart reason, which is populated via IMEM. Define the
IMEM region to enable this functionality.

As described, overall IMEM region is approximately 24KB but only initial
4KB is accessible by all masters in the SoC.

Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq8074.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq8074.dtsi b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
index fffb47ec244899cf45984adbe8c4f9820bef5c5f..93dd11c394589132f3d5ecda32bcaecad2509029 100644
--- a/arch/arm64/boot/dts/qcom/ipq8074.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq8074.dtsi
@@ -625,6 +625,15 @@ qpic_nand: nand-controller@79b0000 {
 			status = "disabled";
 		};
 
+		sram@8600000 {
+			compatible = "qcom,ipq8074-imem", "syscon", "simple-mfd";
+			reg = <0x08600000 0x5fff>;
+			ranges = <0 0x08600000 0x5fff>;
+
+			#address-cells = <1>;
+			#size-cells = <1>;
+		};
+
 		usb_0: usb@8af8800 {
 			compatible = "qcom,ipq8074-dwc3", "qcom,dwc3";
 			reg = <0x08af8800 0x400>;

-- 
2.34.1

