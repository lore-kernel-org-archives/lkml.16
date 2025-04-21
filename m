Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C3EE221F04
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745272846; cv=none; b=a9Je8IiI9ZFeFmK7y3HVy2y8Mj27//xalogHROiu9xG21W4qMdb1DbnwLg+OX1DsxTO6P8oP7d1FGIXtRmwgn6O0e/sAFx05OyaJwttfFT5eu1ZvfFpkqfFhL71zwZ8mFeuaepEfsZo88qmf5lGX+vaeHzbYNppsZHIUCVnUf0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745272846; c=relaxed/simple;
	bh=V+if1JLkseIXHxqMs/xUBPBndUeGFuwmXk5nZsv0vMk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NdmoGmYMSQe4XQyhmv0VkCsViIq84XVuEwMXZjcluE9AQ107418LbbF4uR8FSuqPHf62rfRTpHAYypia2nmfHUvc5MqrhuF0NZjHqCJqHxxxthZuudxSbVqa5bh8lj7nuWWUuGyptwtG+sRhE4fopcIbz0ZyJg9vdejlLKimkvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=inqe26SM; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="inqe26SM"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LK3lFq023211
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=; b=inqe26SMWzgk+olk
	8pb1BlcpihFC1gP192aJ1bTHekvehUB5atwg8oPVJHx45bycmq//3/05qtgYt5sj
	sqod74pnbPzZnGqQ1Tu4++7hglC9JaEi9Ncda4LPdGgPlqFdutsa+wPr3ZHOVg4z
	UGJRPhvg1xDpvhmoFIr4uOLPr5SicmhxxC2SZmFSpkkygV3f3hoQFrWOlVLGBxhY
	EzYTExkAYKDc4EGCku7UPeBBcA6zKdZ2iebVNVcSZKSF2ol/zr1nWSruq5/hzlDi
	DHsX3HNQT1D6RMTi3yV4mm8JctTtOEDEBnVq68g67O1H8MpHp08wp0yCOxrC9z9h
	z+OTvQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com [209.85.210.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46454bna3p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 22:00:43 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id d2e1a72fcca58-73917303082so3042053b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 15:00:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745272843; x=1745877643;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qWTXURAP1xs3OjY3ekXdGEHaecX834c7vUjqi/j8RkY=;
        b=ENkl2kGs8cNrzo3ccGohe30sPxSH+NpoXRwn/wsNZGIsXscOH1wAfzf0UcwTFVUp05
         1tzfmrM4Zgg0/jUB64u6wt4GDrIrUY9ct2vVf9kPlzbRLgbkmCJaw16EglW3a4yCm/Ko
         johKXkbkQ/rvKB+0rbhgMYsqTtFm1wUjSbIu6jtEDePRdeezAAm0ZIHrKoqCYbrqNZK4
         gnyv4IiZr+lBxnetkNE2TIHdYrjCU5r/paBhfOMmd16wc/dxKbAAaP86fENSl1tQ+PjZ
         hrPtDNAN0cLcvmdnBfdPFeUPpMxAhmIOMfcfykFfI0uQZfaSotCgjkONv7nUkKgue/jS
         E6hA==
X-Forwarded-Encrypted: i=1; AJvYcCXkXVhuMEBK4la94/Tl7wrtj1vXorXnr4eQaKCH1p/L2JSfk6KqDGu78FvET66JJgpl8ThRmkTu+v+rxNM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWQRPqwT1Uu7DIDDfyrGhKdgbL1+FCeN/7lNCtnNo5uitUn3xe
	dq/LNdW4+UneLaW8cvnhcXUuHyzbuAuVvq0NfNc02N8f1grfyBvAYYDB2xos133Yf01RU1dqFEH
	+7HDn6pUuP4O0MCFG2COu1V/tPWwNVNCdQ3Dwbml4AFsJ/kMn6P4KVx1Fu4PJLDI=
X-Gm-Gg: ASbGncsYVMDCJ/1xk9RoDDos3v7RhvjejM5S5qm+Z4ruBbfFL7GtN4ONT69emNDPPbq
	rN1iNFYmQf9vHgyJVXl/EYJtnveEWTm6i1jNK36xpCRABxyFmk8cZ15tHoHuweidejOrr+MSNMz
	bxo5DTubrwwIqTwP6E5q86jl4rp4xAd9p4XFcumq5qUkc6G94YivZtD3+y/YZ4LShj32l0c8cdz
	rBtHLlY/oWgcMMDrVFNXfxUdsPtF9Rc4ZHypGXiTj5IXmBBErRx3j1R1GsShdarUGmoP0ng4OKt
	8A+Fgkdy/4FnFnv6u84/9bl/mPjDaIW1dG0kxSDbj/E6F30CSC/rosCzp5tHuImwLpQ=
X-Received: by 2002:a05:6a00:8d86:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73dc15f1a87mr18386196b3a.24.1745272842534;
        Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH3LJ/nbFki9xpBGx4aK9cppDDFvMSSRS0eHYF1pJ6KN0f3/2PsOfl+A4A3toEqxCnFOpG7Lg==
X-Received: by 2002:a05:6a00:8d86:b0:736:9fa2:bcbb with SMTP id d2e1a72fcca58-73dc15f1a87mr18386147b3a.24.1745272842129;
        Mon, 21 Apr 2025 15:00:42 -0700 (PDT)
Received: from hu-molvera-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c04c5sm7107917b3a.24.2025.04.21.15.00.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 15:00:41 -0700 (PDT)
From: Melody Olvera <melody.olvera@oss.qualcomm.com>
Date: Mon, 21 Apr 2025 15:00:17 -0700
Subject: [PATCH v5 10/10] arm64: defconfig: Add M31 eUSB2 PHY config
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250421-sm8750_usb_master-v5-10-25c79ed01d02@oss.qualcomm.com>
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
        Melody Olvera <melody.olvera@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745272824; l=899;
 i=melody.olvera@oss.qualcomm.com; s=20241204; h=from:subject:message-id;
 bh=V+if1JLkseIXHxqMs/xUBPBndUeGFuwmXk5nZsv0vMk=;
 b=P2msdcQ+cRrE1nqqLOLNemRor9mB4mfi/qU6Jdv8heLzSYFu9kZh7yW0+lYDdXdjlRFRSNa0F
 7kXdxM9uxuXBejERREp0R9xpV0FE7WRSvokr6+5C9Oawzj9wlxiv9qg
X-Developer-Key: i=melody.olvera@oss.qualcomm.com; a=ed25519;
 pk=1DGLp3zVYsHAWipMaNZZTHR321e8xK52C9vuAoeca5c=
X-Authority-Analysis: v=2.4 cv=cdrSrmDM c=1 sm=1 tr=0 ts=6806c00b cx=c_pps a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=kAC1uNjDR6N9yz4uFL8A:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-ORIG-GUID: EDM9aFRbQhno1KXUjB9ZUi0RpaQ7ubjP
X-Proofpoint-GUID: EDM9aFRbQhno1KXUjB9ZUi0RpaQ7ubjP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_10,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 suspectscore=0
 phishscore=0 adultscore=0 mlxlogscore=517 malwarescore=0 clxscore=1015
 spamscore=0 priorityscore=1501 lowpriorityscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210173

The SM8750 SoCs use an eUSB2 PHY driver different from the
already existing M31 USB driver because it requires a connection
to an eUSB2 repeater. Thus, for USB to probe and work properly on
SM8750, enable the additional driver.

Signed-off-by: Melody Olvera <melody.olvera@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 9e16b494ab0e258908811be082f678099ed2cf4c..f0ab5ba8df045bbcbab16ab736342f3d261f4297 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -1575,6 +1575,7 @@ CONFIG_PHY_QCOM_QUSB2=m
 CONFIG_PHY_QCOM_SNPS_EUSB2=m
 CONFIG_PHY_QCOM_EUSB2_REPEATER=m
 CONFIG_PHY_QCOM_M31_USB=m
+CONFIG_PHY_QCOM_M31_EUSB=m
 CONFIG_PHY_QCOM_USB_HS=m
 CONFIG_PHY_QCOM_USB_SNPS_FEMTO_V2=m
 CONFIG_PHY_QCOM_USB_HS_28NM=m

-- 
2.48.1

