Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E624629C34B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744631577; cv=none; b=WfLXb8xsPZQqGUyTZ6JG3ve+bN5iYY8rY8QWZ8ZyxZoZ9dds1Ob0bi9rrTnKbn0XH0UFRKQZPOEgYTCwp46rQeuyl0YXSI+am57doIkKNjOKiMVDnYcHmd+gqGc1L1AoaBGHAfaHICsgScYzy933JZcft8w+SW5F1/q/m/3EIKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744631577; c=relaxed/simple;
	bh=fQ4qPB+Mli3z1n5LezSzg2TJ0AglAvt1CrhfoGQTVsY=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JxtscWSWbIFYm9OZpmQ/SSiIw0f+QPxI73Oo5TSY9ARZag66Fe4oK/F4qNdLNdqEvS1xs4FOyUSqUp5paG1ejyM5CInAC7SXMN72P7nxa6AMn52yS1pfUl/ekGY7IUdry+Ya/1D/Q/5LCMt3UnItBFihsricZEJn+JNEo784skA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G3s06/37; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G3s06/37"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53E99nis015705
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:52:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=s8nngil2zyr5bKlo3biA6U
	hMXvQ4bHWgj1yHs15aB8w=; b=G3s06/37W7W3HvHlliNENMudE6nK+uOpP/x4xt
	AWL6OHYzhKBvpK1KBQkFgMz09CsWq7TI7cfXKO6OFw2t371sFbMwKG0hYKnkMF+b
	WK8ExTobmeJGbNCFpk+Fg+Qeip/u7UNH6o945D7w1LvKd9f0HVSWsqhL4V8w+hcB
	zrag0xZDIju8wJ+CA1DZOC5O3Rgt2qpEVHyOWs7aWS4KFdsbC+jf0wPKPOIX6qMD
	uz/mVSRU2lHEkORYA1ZurRu1p+25Pa7Xy8MW0tWEXxpFbFdF0CtXZjQcsR5Q1DCV
	0FFLSIV2jCq7JJ1LKrw+2SYIOY+cKW0QxAaNWf3C9LNR+eow==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45ygd6cejq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 11:52:54 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-22650077995so60224865ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 04:52:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744631574; x=1745236374;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=s8nngil2zyr5bKlo3biA6UhMXvQ4bHWgj1yHs15aB8w=;
        b=hPoM8FJcBNsh7hgPzYScsP++h1l+gnV6r2wmzQOTKcVt585BMfxiyz/PMzoaFhNw3J
         2T8zKm26YzJa8t4Jur3WbG3aGBd8mj1EdBJN1U/7KB9ETZA2cYLudmQrVSNFE0dv7EyB
         IGpbyG9iJcRqcPZE22V3u/JXcVKJ41913KPcSve59B1uTBa0JNBBXyxhecDQ5ZqZqr1i
         U8DF6+wsgyOmAzJa1h+ZimRJb/0AMXgqjJK3A7WCGd2rwrtHrN8Y/Tu8rqLcO6IbYRj3
         JOR9jDgvEUHp5HJb898i3j78uTsmKz8eAKq7ARbgl3urvYENJEaOt1B5OMDT9DCvTtP2
         hWfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWddTztKsLD/q3f4BPqbRMUb/E1Wzk8Fh4VokhGsZQxFOmXoyXT6anAQ77G6ISPcYl+DEENdJn2MNTCgSQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxglmtl3kFoDn0T4GTtBqM8aqUt9ZoRMDrViY/S0x0HrDNBEXEW
	U6kuS8qH5xeIbT1NscdY37QcttxxkIJJD8ihsPNvcAvmC2GCw8GMqpd6QLKiH6eKvEiIkzZWDVQ
	nfKEbHE2W2rHbwRkAGoOjTyHCJd+r2Ok0jUllzUkhmTJXmcN8VSnut54+QYeijWQ=
X-Gm-Gg: ASbGncskvDKTKeaoeHBGzsCqc2oEDzdkW4u7S4Dl2Obdjk/04+KAxxv9jGVTBm0hcoL
	n13lSqFrZGyEq3MmL7M3xGNMktAmBJ82Fiohg3fi8yaCL2l1HnAPbXDiRp2+3LQY/9k3vK8pvD6
	YBhY3I6wI+CtqtOvg4xoHmghNPrcVGmQjYfIDS+zV+jhztpZOFOoKBpO7U5Rj/ZmAGTyn5y0ecL
	0f0hVwBhz1Q/mCMFKtDeKWVtieGfkDbC3SMAEyUiRk1tf447RBp90CR8CsBWQhi33svb8jevTOp
	BCibbIlzRqmUG74X6+XuT6L0QgvsHT27NIsWLnoUWD+oCSgJZn5+Nt1LJD2W8icA2VAdyY+Pwu9
	oCcoxq0jVAwxkijCmN9NNYN6vkM7qbYChX/kRlLSShEjVAEY=
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr169760795ad.16.1744631574012;
        Mon, 14 Apr 2025 04:52:54 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEgqzwIYoVFf1FpG2p39nVO093y9ug3V5NlwPoSdWoLWQWnXODX6iVg/8xyBTblPnMlaKR3ng==
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr169760495ad.16.1744631573646;
        Mon, 14 Apr 2025 04:52:53 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7b8b73asm96425735ad.86.2025.04.14.04.52.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 04:52:53 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v2 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
Date: Mon, 14 Apr 2025 17:22:48 +0530
Message-Id: <20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABD3/GcC/3WMwQqDMBAFf0X23EgSo2JP/kcpIY2rCVRjs6m0i
 P/e0FMvvTwYeDM7EEaPBOdih4ibJx+WDPJUgHVmmZD5ITNILmuuhGL5hDFpR3p1b02Ykl8mYqp
 tVDVI29Y3A1leI47+9Q1frpnHGGaWXETzk+Ptv9wmmGBoO4WVaNCIrg9E5eNp7jbMc5kHjuMDQ
 zg5cr0AAAA=
X-Change-ID: 20250414-revert_hs_phy_settings-47643d2c75ba
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744631571; l=1101;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=fQ4qPB+Mli3z1n5LezSzg2TJ0AglAvt1CrhfoGQTVsY=;
 b=kgepGMZcGaqZhH5hzO36PqOvZutcLa7n3nhrg1HBepTjF2w51aDhkXXu/oOVtMQVc3NAFWJpK
 f54hdIhYHMwDlFVC4TI3Qp+B9Jlxl0MwPWmXH+qVIwrKO5KE8IPasHL
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-ORIG-GUID: HzX8uHqd2uoAZ3cAs5u3WoLEpR5T7TgQ
X-Proofpoint-GUID: HzX8uHqd2uoAZ3cAs5u3WoLEpR5T7TgQ
X-Authority-Analysis: v=2.4 cv=ANaQCy7k c=1 sm=1 tr=0 ts=67fcf717 cx=c_pps a=IZJwPbhc+fLeJZngyXXI0A==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=__A2vHsfkmyGJhSVeV8A:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-14_03,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=659 suspectscore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 impostorscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504140086

With the current settings, complaince tests are failing, especially eye
diagram (Host High-speed Signal Quality) tests. As recommended by the
design team, reuse the IPQ6018 settings.

Merge Strategy:
--------------
Both the patch in the series should be merged together to avoid breaking
the USB feature.

--
Changes in V2
	- Splitted the patch into 2 patches, first revert the commit and
	  then reuse the IPQ6018 data (Vinod K)
	- Dropped the R-b tag from Dmitry
	- Link to v1 -
	  https://lore.kernel.org/linux-arm-msm/20250407-revert_hs_phy_settings-v1-1-ec94e316ea19@oss.qualcomm.com/

---
Kathiravan Thirumoorthy (2):
      Revert "phy: qcom-qusb2: add QUSB2 support for IPQ5424"
      phy: qcom-qusb2: reuse the IPQ6018 settings for IPQ5424

 drivers/phy/qualcomm/phy-qcom-qusb2.c | 27 +--------------------------
 1 file changed, 1 insertion(+), 26 deletions(-)
---
base-commit: b425262c07a6a643ebeed91046e161e20b944164
change-id: 20250414-revert_hs_phy_settings-47643d2c75ba

Best regards,
-- 
Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>

