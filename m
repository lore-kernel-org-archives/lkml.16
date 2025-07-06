Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BA632AE96
	for <linux-kernel@vger.kernel.org>; Sun,  6 Jul 2025 10:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751799047; cv=none; b=bGh1Jg0kbq/MOrpsUqx/GjQ9cywNbODG7GTmaSmk4MHfeDOeyIEuxBwTC3XTJ0qv2wJToMiiy3RczIYpKXrC0D0UqlAesRyFEAGaJLjxlmlnRUTct/nXvRIzMjpazmUf30lx2m7qK3E2ZS+GX2nPBzizMxLSdaoodzlxpYp+j30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751799047; c=relaxed/simple;
	bh=abFeflhuiqRXobFgO/j4I/E9aQ+Bpgb60piKwMt7tVg=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=JLrbApQCQaL0nomt3eOOHHGNDlwm0UDcF59BV3AbNT+cPho13ka0af9iFd9+f7cMAgpm1El7AaZI74FG0FGbpKv5tyPHYX/m1NQYKmumK/r2p+cRunKKqoyiMJuGZcbTs52khpb/sYr1D+NR6uo6zA9UA63Qn80T05Y9dKteXmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UBZjEbQa; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UBZjEbQa"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5669xEt8027876
	for <linux-kernel@vger.kernel.org>; Sun, 6 Jul 2025 10:50:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=Pcd4BLImn7q/BF7cV2K1Zp
	P7hDYqnAQYmYuUNx48W14=; b=UBZjEbQatqU9+Ki+/vwADmdgljBOhy94WKKtYR
	brIORsHliOrUBdtpp/1snSLoFcSLMKMMeuw1HQjWXELWRFY/GHkqMkhADf+10IV1
	51h1/cy/hBJu/SOOATkzZ/wUov/K5QHLqnCt73Y+PHRgwDgMQT/l5t629Kx4kX5I
	D46LFNOa+igbLveT3xDwiPEkpueEZtyPQTihwNIt/iLH6lF8s0e5XlXPwETZmPTU
	lW6wJ+Up2/19UHn8gIwITZyQWuGZ1Im7oXgc0NJGCFaXNLif6PFuISvbgoWAQNnz
	NaTtZraH7keq0mG4R92/XT0shESvgAAoXlUNc2RvxcPPib9Q==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pw7q3d4g-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 10:50:45 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-4a58cd9b142so48600531cf.0
        for <linux-kernel@vger.kernel.org>; Sun, 06 Jul 2025 03:50:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751799044; x=1752403844;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pcd4BLImn7q/BF7cV2K1ZpP7hDYqnAQYmYuUNx48W14=;
        b=NKBnkjDfoKaPyYDuHjPcc6BvHUPE88abW0ttzG0TD5rI3vY4QOqs7J97MJkVJku68J
         URCjLyT09BSvPWdhyJ5NPwv3oMkMXCbkbGyQJ63xNp2jmTNar6VkZ2QHBlUhG3mjl0pI
         XlV4ryYtlIgOr7QH1RiOvMDUDovkzb7egeiRtcfZUp1oWGnT5weGSPf5TstgLZ6yOn4K
         j39elBMnnsFmhXpvO9Rfi/n/CklFcbv2gAPlFUhBo/m6vwYGV2nwVpe7uGaMJ3bX9+Q7
         otaPO0ZyaOhl7z+KTdzqtdlwM/bKA1IRvUtjCAx+bXc0qoo+s7G7omX78sFskJcNJDZ9
         8fuA==
X-Forwarded-Encrypted: i=1; AJvYcCX4tdvvJLzG+4DOPurDCS/NFshoUBnK8yOSEd6ELq8S0fCdbTj2UF0m1MAlM7fyHjuslbHM2IdOn50aaK0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy9GQXpKbYl5Ru+qu0LBngW7DeV4sirxHM+7jJpqD5iOi/mfc1Z
	g1PStP4juxO9WHq8lHrU5s8aB3v6inJCAPuzrIA4MDfhDB2WJi1mIxafDSPMH8AdkthPGAT++Oc
	iCN1C6wNRmC4j1TB2DSDYBSVJn0oc1knzVTxb1PZEGeE3xapm5y4BlYzJQXlvikpwTFE=
X-Gm-Gg: ASbGncsFD5ST0UbLXA39h/Ns3cqVqMkNsolqtVcQPUKrB6ErM5SeF7Cjyv32s+WQsbV
	gKOkApc5Nzq7UJHtOHk40oPqC+wMOLj7rZRmG6GNUurimDWQT8R7ePhWmQllOs9MH1DPK4eNMJM
	xzCiKRp4WfUnLY3xuo1rimG0+3MDYZADj8KzLp8Jfe+yeY8dGpKylig03ImWQ/MNc2egFHIFd5u
	KXnw6Y2pZkCDzO/eHbD7WLu8j1eLJsLb3MqhY+Rp43qQo8RpvvJTUpIsujrVbRIPepOxHCLLm9h
	JyKtaoFOgaxf84yV7lw+qD1D7dC0hdE2hM9DuRvAXx55FpE9IZ2HwKx/lDfNdKFsXNF4pdlnfEz
	HMj8XnwLgFGYGc0baUPEFZh6BCyr5WcehMR8=
X-Received: by 2002:a05:620a:4510:b0:7d4:4b29:6eb6 with SMTP id af79cd13be357-7d5f2f3f4fdmr574460785a.40.1751799043770;
        Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIukBC1av8TGs1q9stHT+YVv5BfUre5Y4Hxy81XIwRrW2ee07LeCFv+0xcxt99ugtxwdvE5g==
X-Received: by 2002:a05:620a:4510:b0:7d4:4b29:6eb6 with SMTP id af79cd13be357-7d5f2f3f4fdmr574458885a.40.1751799043328;
        Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Jul 2025 03:50:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/3] drm/msm: drm_gpuvm leftovers
Date: Sun, 06 Jul 2025 13:50:35 +0300
Message-Id: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPtUamgC/x3MQQqAIBBA0avIrBvQARO6SrQQm2oWaihFIN09a
 fkW/zeoXIQrTKpB4Vuq5NRhBgXh8GlnlLUbSJPVTo8Ya8SUUXKMFwZjyZDX7HyAnpyFN3n+3by
 87wdslSUWXgAAAA==
X-Change-ID: 20250706-msm-no-iommu-c15212a0e7ac
To: Rob Clark <robin.clark@oss.qualcomm.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=876;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=abFeflhuiqRXobFgO/j4I/E9aQ+Bpgb60piKwMt7tVg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUB7YNmLatqn6ankqSO0Hfjb6vNG59uNUcyR
 yfJ92XOnBeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1ZbiB/95vo+RcFcLBiOFi/mP3tiH9pE2NWoK8npFIpTpCeQvnianNFvEoT6JbXnLTQ1/tIINrGR
 Crby7aelzzZERQY7AONv4DgzKnW+nwyERsa+RG6vPlDNlNwzY1e93D2bMC+enH6SpHKpZqzXiIF
 xgY46g5s5APYU3+APnXEQVl3Ir2X6sUUgeJP44ZYAzafQIJXDcq3YKWsMfp/AH5dlU+DVl654im
 HTizMM8Y0BJ2jYmO4gQKvnv9KuBj90jW5TFh3x/yvtwq4rPzxsZddT+b134io96Zy0uFVi2fpqT
 m2WWrSEjS0dXQ0q1G/HVBbBhJahvmlZx/DBArw+3++tE3Sdl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfX3LvPJKdHKu2l
 2dF+cItgtSwRuQYzX2UKZwcDBCxkRWFJkNRvUcXCB5YF1EgVsWk/FXUeXQc77lNXm+Lql3lH/CT
 dNv19se5pRUnFsAIzsSKIHAF7xM6ADFu5fJCKOB0d0RBUC9XzIK6Vl3htHn6JJI1UgJeNvbWMrg
 9cokBnsy+pKOCXsj/uhHliJlN4ZUcfpaXF3IW8hmGQ8cEl5Tkpw1jR934gaq6cBEk4MfCdGAzCY
 T9o6codaaUxUYzPQ8vqMABjUs2IWELS/DYbjHAP64hAH/kCigcu277CzMcvz3WIvxDkf+2gE7T6
 F04GoFIY6rc5AbBpiOyCgfLjhb03HfrB5eUNeaWkDz8iyUwiP1kfZybUDfLyB4YjsQfLsanLzjH
 LwDM/hmjYCf9+2VbcWQzObU4l6TgGpbAFsq6mekkF++RGq2lSO9xSpjomhaNoyp84A0NzhC6
X-Proofpoint-GUID: -F6EmD3artTJUiPUnbFImF5LBTp_DrxP
X-Proofpoint-ORIG-GUID: -F6EmD3artTJUiPUnbFImF5LBTp_DrxP
X-Authority-Analysis: v=2.4 cv=SOBCVPvH c=1 sm=1 tr=0 ts=686a5505 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=OCoH8Ai01jLj_7CUrnwA:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 lowpriorityscore=0 bulkscore=0
 impostorscore=0 mlxlogscore=938 mlxscore=0 phishscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507060067

After switching to drm_gpuvm, the IOMMU becomes a requirement even for
KMS-only devices (e.g. allocating a buffer for DSI commands now also
requires the IOMMU / GPUVM). Disallow non-IOMMU configurations.

Note: MDP4 patches were compile-tested only.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (3):
      drm/msm/mdp4: stop supporting no-IOMMU configuration
      drm/msm: stop supporting no-IOMMU configuration
      drm/msm/mdp4: use msm_kms_init_vm() instead of duplicating it

 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 27 +++++----------------------
 drivers/gpu/drm/msm/msm_kms.c            |  4 ++--
 2 files changed, 7 insertions(+), 24 deletions(-)
---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250706-msm-no-iommu-c15212a0e7ac

Best regards,
-- 
With best wishes
Dmitry

