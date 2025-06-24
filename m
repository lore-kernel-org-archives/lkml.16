Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B506C286D53
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750761417; cv=none; b=DFreoTbY2RZESrYFUB/WV8ZoTYZBbGDmCUq0zz+YsquMLbUYSkkWzQgoPH15YgTCisNGsYfSR3d2rWURx9eNfOZFrfFXnaxlGc82NNVMpqkBjB/vaYlMTX73w2dR/e72RsPhi2CmvQlgCjX1jDYws7jkHRkZWu7WqpDzCSmlz4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750761417; c=relaxed/simple;
	bh=FWxibcNeoUrwd5pY9mHTYhwEDhN6YSBaZ2tj26tMzMM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=lMJmYiuJKnEsK82nvwrFNymbEpCsVh/M0TbGjIfHlMm+xKsXb/3/CqGiKk1RgxiGm9ckv8EVC2CCv6C6dwAsL2D1gcqO6ne976FJKbNsbjzFUPT7lT96UOC2t5XEmYilcqwP0bQsDy0pyTvUdeDRvBfALp9fQ/rrEndBED8OFFU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hJC9YcOI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hJC9YcOI"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O3sKuS016971
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=EukidgrEuMOj47GtkCmNs/
	Aethas1AU3JO0SAf+anLM=; b=hJC9YcOI0l4bJ3N5ngxsAypV1LOYq+HIpC5tBa
	W4chmcU24zLgk3cTeMzpbxNs4Dd3e2U6NiswS7fz4xVgq1yiDQq0kiuaHCEbLhIy
	XCuIBVnNJwcYs33qae+oE1DrHLa36+4ZaXhX3zmiw+QQLcB/SpbUbQXCF7XkllrE
	2iJrdIu5jIQrPBRahvaFSrgSVhzHvu16VV0sgt83yWsL4TBhOQpD2Fn//WyM9Jtv
	4Ib8UvfJ1ziJIM7JeLrL0dt5mOKkQuD34321PezuGJA2IG8wvCPn/7GfeUlplKNd
	0t6aoHWuN0ub3K4ACIyMP/tFU/A2oVkPDfxdTSInAShAcR9g==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f7tttx9b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:36:54 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-74880a02689so325938b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 03:36:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750761413; x=1751366213;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EukidgrEuMOj47GtkCmNs/Aethas1AU3JO0SAf+anLM=;
        b=Gvjym5Oq81fq+hEFDGwOML06Ui3zgQLK0Y5OKblagFB6bIqfAVi0gkgL9V6s5Ff2J7
         f0notTL8a0vkNfW01Io7xYDpkdM9GgGIldtkDpAPKX7BH9SSHkkmpzdC9gYpfgCuiR+G
         85iiBfhIZEDf4pCg0KPTJhFgZMQx3X/KbI0p4nbFzaQEu3PLW4D5zCeUTkVcu71tQ2N5
         Qv7CXZ+0fTeYDgCQMFTTYQJYVkxFi3L6GOY6oC2BmdRyzWG9OdgxXaRngG8yf8d2jnFe
         g/k69NeWcNG77V+jnxkcZ1Kr2rzsc+3UXGYAtEA77T43y9qGX5d6E7QX2SGfv9Nn4K4D
         067g==
X-Forwarded-Encrypted: i=1; AJvYcCVsSnsQXTHiI7NUbwJG1L+Hffm999wXsNNLmVG1qPXDzKiOisRdtajzHAk2/ZC8zpNmgJwa6sDcHTw3mOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJYqrw6NuY/7C+D4Q4bMBc5aCyTzDuJWamdDhOquVW45R/JLoI
	EdI3f8ad3VU7ER6/HEuX6ScX3w0Fl1Piw0m3Pt68eChTmAz/CPe8u6M8LTirIffeSbp0AoBKvfI
	BjyOzfziMZrxOdI7QG4YVaEeuQm5AvwIjjk8kN7zQh+ajQ2rGFtsxKmoFETuQzMtSEJM=
X-Gm-Gg: ASbGncsL8MwE6jlph4GjmmLwQYxJ9q8RCSke/aKm/7rys9qhmIDLrjEEftxL9PDWxSf
	tTiKPy1E66NVvQcnBLShep/avYDg4YUORdq/aHd0lBpPZHOTx18bM75oPNPV/EV3Q3gbhB7HQSB
	FF0zp8X0CKg5vuHPo36x5yuZTP7LcLxNWjXgx9wYvO3rcWTFSGgIUSBq3FoXrypn5+AcjwCaJVD
	B4Xo2ZHYGu3S50EZ8qZTDp4JYKKo7+eKeuTc/2Lb+dkpyLeDQgJXbe94i7XC2ZUiJiZNwP/hSCx
	5jk9VgJbTxaCS25kn5ubS+9Js/qmRAAn+57QWiZwac3T7iZkwjMHGgV+oczxqdHVH5gAIQyJBT+
	3psn8RuNYZgR0Vtv1oogv17cvFF3nDgZhLpgujdn81Hy5Gdqhe0fU3MN9uA==
X-Received: by 2002:a05:6a00:23c7:b0:748:de24:1ad4 with SMTP id d2e1a72fcca58-7490da9d641mr20898127b3a.17.1750761413052;
        Tue, 24 Jun 2025 03:36:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF0EPM60iHqu/wX+54c+M7UsbyOIw/F4FG2R9p17WZCLqPcF5YSQi7vCK+MDFvlHOW0xwJzvg==
X-Received: by 2002:a05:6a00:23c7:b0:748:de24:1ad4 with SMTP id d2e1a72fcca58-7490da9d641mr20898100b3a.17.1750761412679;
        Tue, 24 Jun 2025 03:36:52 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e21466sm1472393b3a.49.2025.06.24.03.36.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 03:36:52 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 24 Jun 2025 16:06:47 +0530
Subject: [PATCH] arm64: dts: qcom: ipq5424: Add reserved memory for TF-A
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250624-atf-reserved-mem-v1-1-43b1940e2853@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL5/WmgC/x2MQQqAIBAAvxJ7bsFEK/pKdKhcaw9aaEQg/b2l4
 zDMFMiUmDIMVYFEN2c+okBTV7Duc9wI2QmDVtqqVhucL4+JpLrJYaCAS2/Wzhm7iAXJzkSen38
 5Tu/7AU4dT7JiAAAA
X-Change-ID: 20250624-atf-reserved-mem-b84c7d45b624
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750761409; l=1349;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=JjAbPqvQATV3mxxNHKLMuXo+KgMzphIdVgAZtBEoIiU=;
 b=BDqkqAbbEG18WuRAkb/fatoDzzoX4vVU9i7N0SWURagr2F/UXiqBnqisYaMdnGxKe8tmpHitv
 Kg1hXLhFsxaCKW0IN5rJ3V+Ffi7ECyFamAnmf2Y1hraBAEE/ScTr62l
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=QINoRhLL c=1 sm=1 tr=0 ts=685a7fc6 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=LHHpOU43DGDhQHPplI0A:9 a=QEXdDO2ut3YA:10 a=IoOABgeZipijB_acs4fv:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: o1y0F93afNTSv0Zi0WG_XokPqpdTdQ7H
X-Proofpoint-GUID: o1y0F93afNTSv0Zi0WG_XokPqpdTdQ7H
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA5MCBTYWx0ZWRfXyHdN3swl8HDa
 KJibz5eChnJVDnQ4mdphyc2Xiw+3WNoohvNZ+qs7/JgPlgfx8eXMLBHZ346F2LIWiKbEmGN7ADV
 dM+HmDW3umEAaGq85Ln7y5xV0l+6lOf8wl2LDIWxNsZz2bKmfobvX7hDPB0XDBlNFo0xEvlygAN
 kUULwD2GRI060U1rCWOKI+H+sp4qkvq4JbdCmpHbrlccJSFO+m6vW+K3NKNBMF2arn3ZpMcG1ly
 VmSSxeSOpENupk19VEGEg1vMIdmmfhDX82zyoz3wCniGKSvFWyGqyOdFsOD9XyXeNAGEVLGQWq1
 pvY3mlSuGHEtwixbvqJXcBFuutclmu95VYZJWovv3tsw239yqpIbrPJxxH0RFQB753GvNyY8IJf
 4Qwkg7UqQjXSz4JfHdow9QaB7NZIPvcyAYnN2kbz7dTe+v4EMKGyVs6xL4vCDOjIGBGjqfTq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_04,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 malwarescore=0 adultscore=0 mlxscore=0
 clxscore=1015 mlxlogscore=685 bulkscore=0 suspectscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240090

From: Vignesh Viswanathan <quic_viswanat@quicinc.com>

IPQ5424 supports both TZ and TF-A as secure software options and various
DDR sizes. In most cases, TF-A or TZ is loaded at the same memory
location, but in the 256MB DDR configuration TF-A is loaded at a different
region.

So, add the reserved memory node for TF-A and keep it disabled by default.
During bootup, U-Boot will detect which secure software is running and
enable or disable the node accordingly.

Signed-off-by: Vignesh Viswanathan <quic_viswanat@quicinc.com>
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/ipq5424.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/ipq5424.dtsi b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
index 66bd2261eb25d79051adddef604c55f5b01e6e8b..d7264f7e2423510ca1f33bd208becc33bf231094 100644
--- a/arch/arm64/boot/dts/qcom/ipq5424.dtsi
+++ b/arch/arm64/boot/dts/qcom/ipq5424.dtsi
@@ -150,6 +150,12 @@ smem@8a800000 {
 
 			hwlocks = <&tcsr_mutex 3>;
 		};
+
+		tfa@8a832000 {
+			reg = <0x0 0x8a832000 0x0 0x7d000>;
+			no-map;
+			status = "disabled";
+		};
 	};
 
 	soc@0 {

---
base-commit: f817b6dd2b62d921a6cdc0a3ac599cd1851f343c
change-id: 20250624-atf-reserved-mem-b84c7d45b624

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

