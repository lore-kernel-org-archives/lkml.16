Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9BC020E007
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750838138; cv=none; b=uYFebJ66WQnVkDXkrZx6u+m6D6Ujha+KqxRqngX1qrFtCuWSx+XqkMzhMkRJJW2hdnjpHqYGQ8gDvIG4BkgmjD0VqhyrGQ9MxIs0LdGD/zXXNgkygevZEinOcK9KHjVbeDUF5cVLA70fudcgesfwCqqOKRVvMWTmlA/UBtAn1X8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750838138; c=relaxed/simple;
	bh=zqovogRSX46BigAaRd2ImjZveYMUXSmm+0OkqYQfuoA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JXbLbgCWQ8Dbek3C0tPKB0hZf89A+ApDYYvvMGb9BJOx5fG2cejZEEfGHgBcyyPdqI/h/V239mnF/bYn4o/kL9BSvC9PMSSX+9fWXlbsbEFu+xhKCA8Qwfm0quYS1RrzPDcplvgQS8zbnxTUAauuMXOnKdV1LbTsUxeVY3pKEvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Dm7U80NF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Dm7U80NF"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55P1FgBP032301
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SE0wZGHjNk9ebTpFdYcQIUxoM8VbhA7KD9TRfAYBS5s=; b=Dm7U80NFuQWqLLot
	CE7O7K9VIKIHetH8LfEw7mBxwiXst060R+VkDcaOtQp1ewp0MhZBx/yb/j6tM8Cw
	wRfxyBaERL0cmAWdCYfXpXNSAFk07uej9CE0US1l/xd//Fz3IBpiZ+wpXLeZElut
	BVaf7Z9ieuT6PpjWumnKBxpx7n4zUk9MxC4+y+Jz6YcNw4Xdau4nZQ01tagB/HQn
	5o641gYAUyu9Xhpo3hR8NoC3GXcvb5qLfp1OLmDtS7EDkIo2HvpGrBcHKerCoeL3
	V+YdY5du5NTFnEeflSHmcjRu8ZtER3FI4oHbbvynBwnFp/O1fGcuoKfdxYZv5Nk5
	0x0FNA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47fbm1wkag-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 07:55:35 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-747ddba7c90so5267975b3a.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 00:55:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750838134; x=1751442934;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SE0wZGHjNk9ebTpFdYcQIUxoM8VbhA7KD9TRfAYBS5s=;
        b=dcOOfLr2lEbWjbkq527GqpZqJH6Sj7W82qa/DujChm8CeVqfI/efNkBzJA07m5nxVQ
         j5gv6PkD6AvMHTRN3oe5iSLn9z14vhksr8EBRtVutjJH2CZEq7VpDLfl6PblCGJOJ8/B
         mZqDFKm/wRfjRZcvTSQ9LjTB6M5UUy/P/5RKPEU2K7WmsMoK66iChOB0w8PpsEgAuK/I
         QBsvxzfZL7f60qSemoQJzFcd/GHeBBhyCuPuedEN3znq3F+W7SVdJ2SjZnQ0gfbc2PM2
         nzaSzy7AhwhlBT8si44kDnW6ljipTDLv/y8aYISNAsT6W0TcyjSkB49ICe6MDvkGOhxA
         OJPA==
X-Forwarded-Encrypted: i=1; AJvYcCVvvCUhoiRZs5IMuerolLfFX7NgCX7jSEBk7/+Pmxc2rKtgMvwKQqhIlewr5H4rWu+mSaBsRQy0Kyy8GEY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsE5L74F/mvDi5/IOzeBF+o6N7Mtft5sXjEHIm0dJIzeJIu0nZ
	1LYvG5LvYAScPtBIJWve0lsFdNJOWw+mNnfbFVZ9Lk+UuVqUKMU/1Aut87JI76BWUhPZ2JUX659
	XBa9Da0QGWi6rP7pgs42dM25kC/+ykYynga62qYrwo9diYNbNVMSKbUXMNnqD//Ll1yg=
X-Gm-Gg: ASbGncvgk8LQFwSzi8ezcbPCAaSBiDkXoYZ+niSYSRVMTtHHiQTiIdV58hjnb1aZ/z2
	EHpVQToMqOzLJMSQc2xTCpp+7R0keTg3wZgDWz9xHlqryeCuc91iYAdByqrbqadrhmfrLVgALoA
	PWHPlegL+StO9qd6UFzPuUkJRtKD0oNWhF4GvELqgcRWxviL7JW1Eg40KCVIVjNvpY9NN7Mjs//
	TWzDVrH4iYdyaQXspNf5/xL/gerJwrrebooUaXeMwc5xpNAMtKKi5mVW+LW1LQfjAsT50J0BcyI
	DbghDDJjwphwVe6CW0yqvZe//SS7B84Cracec93Dv0Mvea4og+doSdEIH772SlPq48oi5UyhhZE
	D2B7xe/2+fg==
X-Received: by 2002:a05:6a00:92a1:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74ad443da00mr2785474b3a.5.1750838134034;
        Wed, 25 Jun 2025 00:55:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHpuEfD0kUF0myq+IHmlaXzl+QhyXAvsi7n5BM8WeSKzUKhMn5P3e5TVU1eiij9XrOqr9BEcw==
X-Received: by 2002:a05:6a00:92a1:b0:730:9946:5973 with SMTP id d2e1a72fcca58-74ad443da00mr2785441b3a.5.1750838133617;
        Wed, 25 Jun 2025 00:55:33 -0700 (PDT)
Received: from yuzha-gv.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749c8853133sm3707478b3a.129.2025.06.25.00.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jun 2025 00:55:33 -0700 (PDT)
From: "Yu Zhang(Yuriy)" <yu.zhang@oss.qualcomm.com>
Date: Wed, 25 Jun 2025 15:55:06 +0800
Subject: [PATCH v2 1/2] arm64: dts: qcom: qcs615: add a PCIe port for WLAN
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250625-qcs615-v2-1-0f1899647b36@oss.qualcomm.com>
References: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
In-Reply-To: <20250625-qcs615-v2-0-0f1899647b36@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        "Yu Zhang (Yuriy)" <yu.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750838128; l=880;
 i=yu.zhang@oss.qualcomm.com; s=20250625; h=from:subject:message-id;
 bh=zqovogRSX46BigAaRd2ImjZveYMUXSmm+0OkqYQfuoA=;
 b=xTwwjjH5SxkF999PcDAjZiAx4d/S/RGwv5NL+aviwMacHE5KE2aCQU6D2HmSrtxN9xsvVJy+T
 +ATBIhi1xWRA086Lgxb6+jF0fWX/OsgFA2BtfIV4Q1Bthh4CD7p7je9
X-Developer-Key: i=yu.zhang@oss.qualcomm.com; a=ed25519;
 pk=ZS+pKT1eEx1+Yb0k2iKe8mk1Rk+MUki89iurrz9iucA=
X-Authority-Analysis: v=2.4 cv=YYu95xRf c=1 sm=1 tr=0 ts=685bab77 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dI-8CA4c5Xf8_vBnWYsA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: XjnnSyMC0G0D-QzOJ5B69kcRBfnZnOzc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI1MDA1OCBTYWx0ZWRfX8sW7cdNM9Mf2
 uww4dfVTIr2wuxz5i+cxncsHAsvYhoNiQvzgLAZVe8rRmGZuuxYAzvTDGRVJ0lCZd+7ioxX10c0
 BAgYZGO00yze8RPlBamNHFvhA9CJzT4G+PtSJYDoULTaDsz5VCs2zWBwnSwJOnQ30DIezTO8Etz
 LhF4fE9rVk/rq13zZyWenlpJ191TV77PWx7c+e1JZEeliSBy2CjlcMW7p1HRbMKcI25pDvdPWg/
 WjEcqtnFGcAY13auMPbKQRKiMBcqNWypkdnvbswQbw4DnD8s0wxcJCczExXulFLJ49b5lK+DtfB
 F65Ou501EHdb1fU4/eJ6XL5JYy3muH2gySfyZwmv4dX68hkxE9/rtblP0m0PSy6EXJAr2E1D42C
 IRf6g6fdGuo0Q3dtGiotAJ4CmLbLQutezFMbPtgeTJW/vmazA71z3KuLsfHAkSY0gAN5VHur
X-Proofpoint-ORIG-GUID: XjnnSyMC0G0D-QzOJ5B69kcRBfnZnOzc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-25_01,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 impostorscore=0 suspectscore=0
 lowpriorityscore=0 priorityscore=1501 phishscore=0 mlxlogscore=955
 clxscore=1011 mlxscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506250058

Add an original PCIe port for WLAN. This port will be referenced and
supplemented by specific WLAN devices.

Signed-off-by: Yu Zhang(Yuriy) <yu.zhang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/qcs615.dtsi | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/qcs615.dtsi b/arch/arm64/boot/dts/qcom/qcs615.dtsi
index 7cec7f643a84bd59dadfc4f7b8d95f52fc81c7f2..c996d5a9e31ce283109d55fb61db8e09d7edbf02 100644
--- a/arch/arm64/boot/dts/qcom/qcs615.dtsi
+++ b/arch/arm64/boot/dts/qcom/qcs615.dtsi
@@ -1181,6 +1181,15 @@ opp-8000000 {
 					opp-peak-kBps = <984500 1>;
 				};
 			};
+
+			pcieport0: pcie@0 {
+				device_type = "pci";
+				reg = <0x0 0x0 0x0 0x0 0x0>;
+				#address-cells = <3>;
+				#size-cells = <2>;
+				ranges;
+				bus-range = <0x01 0xff>;
+			};
 		};
 
 		pcie_phy: phy@1c0e000 {

-- 
2.34.1

