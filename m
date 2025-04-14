Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A84B29AB0A
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:53:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631583; cv=none; b=IKBWNj0RPrPNlKUIBKlSrzrZgWM31dS8aJ+t0J88WEt4R3/8FTXtkIA1lGnrk3eRR4ymQCyvGktfqZ+c3UXVnvhkgII4ZfCHEH3VO5MKIhArpmEsnC6Z2wI9YWLbp/qrtBrhREqCN1FCDcQwhdzxu/U5Ef64785hJKBpI0nOrPc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631583; c=relaxed/simple;
	bh=wk/Fhq9Q3rutgnD4Qc6wZpn1xULO5MLO0XKdfB5uUPQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NRcP/FpZazyz8b2vK7bRiIdVK5ugDmPVT3rW6FvnikhFEUNPHui0VwdJvxYCl83pwRD+e2ZZfGJFnljDQz/ojMRzgjAJdKERRlDRufsm53eFf1J0ENLrzEEmmi3MuejiUgS/QTNtjjgu5c8NrZ4lIV+5kZ3Ic7+t94j33jQ2o7g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T4L48kaf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T4L48kaf"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99on9031332
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:53:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qRH0CgOt7qs92GLKK4hmTnFI4HEOYb6qRnDMsfUX7Ks=; b=T4L48kafgUFhvliy
	7SqJqXxDFuT0IZB0mSlADmRl3I9MZM/KIyO5Tj8zaq/Bwk//KS8g35NRpiJHx2U4
	02M8wJeY6yVeuKJ2WROAPJ+y4zpDtaAWQ6BWPSTgzJ8or4U0mf+adW+qkui/pFl7
	6+I7PG9+jzQYqI1UdqOL47Gj8Gun1D24BiZ0u91uGsSqcMVKNaWiLTd7knL14Tk+
	FzHJhdMs01fHFU+9bb88rRQxxzc2TuIE9BDRQPXEA+q5SBrbdhS358eXOTdggCCl
	o2Z7g+k9hiXVzmPqnA1IO6tCw05ImGVWxp3EcYy/AwXNVccqv68EuSf06gtqv76p
	Shd7bg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygxjvb0m-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:53:00 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-223fd6e9408so33749255ad.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:53:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631580; x=1745236380;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qRH0CgOt7qs92GLKK4hmTnFI4HEOYb6qRnDMsfUX7Ks=;
        b=SEXs2lgYwvpkPc6z74bqS2VTatXjplgc2BSczZ4Pmox64nFwqVX5IQkVWQWWV0I3bn
         lN9Kqn5H3Na4y9of0Tex4pOk0/lSFufDRWE9qz4qWqra0PWIpQjeM69s+7OF8LLVlt46
         KvakoVo2REZcPhglZh2RvAcaBLUuDsA6Ob5qg/CIhtWsBPURLQLFaHQthyV871Orke8V
         BhABNwJoWh4A93e0hSRPT6+jRKM04/srp4xReGuUgJ2F741TvSjKaKRHQVhTd4W6o9aU
         ZPHqLTrivN9NCJHeLIenvvyzN6+7Z9GsvL2Jnk4dhObKC+KIyQwGPGOVJwI88HG0osZj
         UOiw==
X-Forwarded-Encrypted: i=1; AJvYcCVUPqY/O05Ip2E818yrwtCVcra8Xe8wXEcdgIeeDIvlApwxZ9vCGXNHXIfUEugG08mlUSO0sjxX/dznr6E=@vger.kernel.org
X-Gm-Message-State: AOJu0YxAjXe1MS9vOBYoE+0VNbCSdJmIEDeqxjvaPWW9zdhVdvoBztZn
	zxs1yeDLhEOUA/PVTs63qizNMbn00Vp8idHjSiOrLp/iW+vuK0IX20XLqTkGx7tEHlE02AweHTs
	lZwuzD2HVkcYqW56fiskRo/4Ps89ABHZ1Uwpu7vnm51Dzy+z6rTDfRoeDwzjqvt0=
X-Gm-Gg: ASbGncv2g9xXeDm/bW96s5Fxh7G+mOZPhc68nrey3qS/coRiJbjY971mG61rmUKfcxR
	kzKWE7c9m+rJdGHo7YxbR8oTIP2byKwkdBBaD7P4GAhTuQZsIwbPMTEof0WrREf0v4BP3FwI4E0
	6g6YAedm9fmroLe5rRMGEf/Eq8n79eP00LSMz+YskS9wuKCzvgJIteRcMWntCBjaNzI+v96kf1f
	RFGIr/kZDHCey/+ZRNVupm0NEUSeejcN8IPtEmjSaZuqwRCGaW49UtM4Dh3t9u6Luo2FoaHDf8F
	321K4e24OqTkQntMkZFQHyUtwiBiXLZrEI/IKr6yj+X02FkV0/xj0aG2LnmIMPMoXZ6AcpNpm2E
	uu7iTBkG3uxcNvCFR4LtgjRxLIC8pOJxwQquFhva9qo4PFE4=
X-Received: by 2002:a17:902:f54d:b0:223:517a:d5a9 with SMTP id d9443c01a7336-22b694c18d9mr213896085ad.15.1744631579791;
        Mon, 14 Apr 2025 04:52:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEPXOEiRYhXgMglgs11kctzcDXDK3b6W0HXJff+ysU258rbYV0ZpyqGT43lZkTX3t1fwWlzJA==
X-Received: by 2002:a17:902:f54d:b0:223:517a:d5a9 with SMTP id d9443c01a7336-22b694c18d9mr213895835ad.15.1744631579375;
        Mon, 14 Apr 2025 04:52:59 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm96425735ad.86.2025.04.14.04.52.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:52:58 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Date: Mon, 14 Apr 2025 17:22:50 +0530
Subject: [PATCH v2 2/2] phy: qcom-qusb2: reuse the IPQ6018 settings for
 IPQ5424
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250414-revert_hs_phy_settings-v2-2-25086e20a3a3@oss.qualcomm.com>
References: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
In-Reply-To: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744631571; l=1188;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=wk/Fhq9Q3rutgnD4Qc6wZpn1xULO5MLO0XKdfB5uUPQ=;
 b=hAqdX7W+eHb4WuShSmXpBAAbTWTL9nQNSkf60MHrsSQNnXnMxz0CKkqs+q1bbkIziNaftbaw6
 tYEmHNpWr39BVfmO5b9O6k/4HC+Qc6igstYAHGbeJm+u/uWJQ6tdEC7
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Authority-Analysis: v=2.4 cv=WecMa1hX c=1 sm=1 tr=0 ts=67fcf71c cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=45MnPZ1KAyxS56gpr9IA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 5f5izK-MHPfWiYyBfoZ4zSDnvAi0m_jG
X-Proofpoint-ORIG-GUID: 5f5izK-MHPfWiYyBfoZ4zSDnvAi0m_jG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_04,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0 suspectscore=0
 adultscore=0 clxscore=1015 lowpriorityscore=0 phishscore=0 mlxscore=0
 impostorscore=0 mlxlogscore=999 spamscore=0 malwarescore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140087

With the settings used in the commit 9c56a1de296e ("phy: qcom-qusb2: add
QUSB2 support for IPQ5424"), complaince test cases especially
eye-diagram (Host High-speed Signal Quality) tests are failing.

Reuse the IPQ6018 settings for IPQ5424 as suggested by design team,
which helps to meet all the complaince requirement test cases.

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

