Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DEDA219A70
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:23:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744690984; cv=none; b=B+5X1yf2m47FQCy6ihH8WjL3pa9BlM1srF7PIb2IMnMpYdsOCoqRgiwdWIjOMd9uwwBlYT+2XpNekiZHdGKWFGwVOrxjssqkhYfi5N2o9X5cH/yb+Dpc6ssabpnQkDzsGuBEEa8A/z+G7CWxKS8Wxb7PnJWLUJ9CkgJJgKS4HvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744690984; c=relaxed/simple;
	bh=1qgyXPTe8cPcaxUv+bBjP4DpTNp5myZOf+LMbrL+u38=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=B/SS97kkjc1oPwd5KNeuDFLPN6Lqmbpyr1gzdXL0WSn94kbfIK2MQ3ICNc9UULuwkQR0TCRYBkTgHU/v4r/hnhIKYx6Ue1eV3eubojjW4qSxq6mMO/nSKw4/fcydyhX61uhKMa/sH18gnOY6Dilpt0AKgHhiuYEZapOQCqYby1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VMFdCWK5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VMFdCWK5"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15X2X004798
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:23:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	8T7lOJ76Xmdt352Zaj8TCw/f2lloVkkzYTw7CuNrRlY=; b=VMFdCWK5656p02xa
	t8by6aDEFplIvgljBTnO5nxLyuwAEMINNKTOaX8ThHCilmI84FcY8vWtc4TeP1LZ
	oyFiEw37e8Ips8UyQNommW4u9ZjXPqPhPh8vMhiEvhI51NX6TV+zrtULOKm70sPc
	aq34TUJGKrQ74/RTqeGXFudPMcFNppOAVFryyX+tZJBmRDslczGWBdB5C7eXQehv
	gmEPHN+3gyN7gycncZpyntKwcEAJBN5ctQtZqlTxW1M7JsqMHUIN3BZw9CCmkXFg
	5KFf9ilDnM5K7cpPMweVetJjzEse9vLx/kKTCjk5x8cSC0UBpXHmMdmw6laA1ly6
	S8HHkg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yhbppfb2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:23:02 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-3032ea03448so4730750a91.2
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:23:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744690981; x=1745295781;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8T7lOJ76Xmdt352Zaj8TCw/f2lloVkkzYTw7CuNrRlY=;
        b=KtReZ+Od08N45eNI83OW0zC2wU2UiJUe1h88oK9KU4hJyU5eNXBhDYwCmtwD932rVH
         vyYjxH/1V/x1LumAWCkBCFUrZ4Ewser6I0U5DGjCaiJoaKIQ+Pu31H/BHTSq1YhpPCM2
         GdVetLkAuAu1tI5XS1plCdJR72gXFfHgzycA53Wc+FEBzFaTYyGLfEnyfy/ylFcbIO2Z
         h+xsi3HJERg51j8IL9DA0UZof2zi7i7KAhD5Zorb/7+KkiMFiqfJ7GIjARps2mTua74d
         lmtBTnUejuaY2q2rUpfFl5yxKBXhUv2tvv1xlGoW9edpGQMjSOGuYFbGXNX6JR5IH4iF
         9Sjg==
X-Forwarded-Encrypted: i=1; AJvYcCW5R6AxKkoXz08giZxg6iRXiohooK5B0ZGWUxNKXVpNDKUhNnhmHupt+BPAImAMKbrrr5I0ot5yT42zyk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaSU1exBZPaM+cqGzzlYDgufalQrbUqpTq4kMW9CBp1WDXkG8p
	R4zfxQIinm4917bYfuZ9jrS/Ikw2JRG63iMIPAV7XinQ/9QF7hZGPdVg/kRt5POOqgDgVivZrEL
	xFv8TIY2WVmysWKjfhUlu2RGUSZS7YFiw/3y2wsPmhqBaMHZZ+SSlf3mnd8EzeYA=
X-Gm-Gg: ASbGncupgdAthxh+Otp/FZwvTxQBbAPuE9NxDQJbh0tfXjPzoQLw7yO8MNPcJZEPaxL
	CFE+je5xJb98C3hn39drwcDavYabLIcMt2TmlBn2KjRHAUYa6q2AD0YHVu5y307KfjkvZRrHQjT
	rIvUb912FgbH7sbZE60q8Cz+FDoT8KP592BcvpR320Y1JAZTEWowRlhYAvgJgCMPHK1p4stg4H6
	IFecwbtk/FiML91eZ9iIpajqnc4OmeyKG8zboBjX6OkTi0EqMvFpO+c7qFRfVXgE332YhMiftRt
	VmXXbqC/ztRgbM0fGJzLPDvRK1sEwyg6FmTpVq8i7+ldWxvvpY7b/Za/AM9R2uVf8Bbv/LIpIIH
	1XFcJjmVjXaW/fdIxCzkM7YY7dg0MBGRBXo7CxvgDhgShbv0=
X-Received: by 2002:a17:90b:254c:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-308235c7f7bmr26548448a91.0.1744690981279;
        Mon, 14 Apr 2025 21:23:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF3+lFYQm1Lb3iNLP+M6nJSx9YN29FsGYZdIHS1UCct9ZZj2wAMP0FIRD3AbVju5FMgqNuH1A==
X-Received: by 2002:a17:90b:254c:b0:2fa:1e3e:9be5 with SMTP id 98e67ed59e1d1-308235c7f7bmr26548412a91.0.1744690980844;
        Mon, 14 Apr 2025 21:23:00 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm107381865ad.170.2025.04.14.21.22.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 21:23:00 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 09:52:51 +0530
Subject: [PATCH v3 2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for
 IPQ5424
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250415-revert_hs_phy_settings-v3-2-3a8f86211b59@oss.qualcomm.com>
References: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
In-Reply-To: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744690972; l=1205;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=1qgyXPTe8cPcaxUv+bBjP4DpTNp5myZOf+LMbrL+u38=;
 b=mMLhPWrhpGCi6Df6Y+VfgT63nzaugIMVz1NzPuE0G2fHWeA0F6tzZh+0KnkSvdclp7Wr3M8ag
 CYsmeVhWrm6CB5U5mWtfOe9gVhF79i+IxQpWswfcmlpYhWJcOFvo2lD
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: yLqUkJTt4fqY045KyVMKwfSM3x4KooCU
X-Proofpoint-GUID: yLqUkJTt4fqY045KyVMKwfSM3x4KooCU
X-Authority-Analysis: v=2.4 cv=I+plRMgg c=1 sm=1 tr=0 ts=67fddf26 cx=c_pps a=0uOsjrqzRL749jD1oC5vDA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=45MnPZ1KAyxS56gpr9IA:9 a=QEXdDO2ut3YA:10
 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 spamscore=0
 phishscore=0 adultscore=0 priorityscore=1501 mlxscore=0 lowpriorityscore=0
 bulkscore=0 mlxlogscore=999 clxscore=1015 impostorscore=0 malwarescore=0
 classifier=spam authscore=0 authtc=n/a authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150026

With the settings used in the commit 9c56a1de296e ("phy: qcom-qusb2: add
QUSB2 support for IPQ5424"), compliance test cases especially
eye-diagram (Host High-speed Signal Quality) tests are failing.

Reuse the IPQ6018 settings for IPQ5424 as mentioned in the Hardware
Design Document which helps to meet all the complaince requirement test
cases.

Fixes: 9c56a1de296e ("phy: qcom-qusb2: add QUSB2 support for IPQ5424")
Signed-off-by: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-qusb2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-qusb2.c b/drivers/phy/qualcomm/phy-qcom-qusb2.c
index 81b9e9349c3ebb4d303cb040b5c913336bb6b6d6..49c37c53b38e70db2a1591081a1a12db7092555d 100644
--- a/drivers/phy/qualcomm/phy-qcom-qusb2.c
+++ b/drivers/phy/qualcomm/phy-qcom-qusb2.c
@@ -929,6 +929,9 @@ static const struct phy_ops qusb2_phy_gen_ops = {
 
 static const struct of_device_id qusb2_phy_of_match_table[] = {
 	{
+		.compatible	= "qcom,ipq5424-qusb2-phy",
+		.data		= &ipq6018_phy_cfg,
+	}, {
 		.compatible	= "qcom,ipq6018-qusb2-phy",
 		.data		= &ipq6018_phy_cfg,
 	}, {

-- 
2.34.1

