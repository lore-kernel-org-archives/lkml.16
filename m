Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8AE2DFA51
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744690981; cv=none; b=SGeVV4YIutkYASFU39yiHwEYveMuWUM4QSub3HPSgP7C29UPAfQcCR9IxpnWDFxv177LKbwifYOUH5qFEc22ABKcS17PCGPMSMkbqRuGX4mo32bacNaLK1WU5EseaJL3EKzT+NJraGF8DD/nZ8EQv34xOpQCLBgR6YVNgtuURzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744690981; c=relaxed/simple;
	bh=UySY5QTJHVg5GTrBaYA2PTmlS4zMHyVLJFT/hmWX9lc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FrneBEtiX3Z10lTzrpQabHL7YzK/VRe73yaWO5OT5SZZ1arytYEPXovLRZ4vBzYawmkNhLqZHMd6qlZ9igK/rSzmuSzLPLLfF2BtlF1pl1V04dUpf9d4CQgL+coqAqKsVAvjqC4hgoxqdUbJwY3PRRT1hzF8baVyR7oM8Cjlhc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=VfyLCIno; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfyLCIno"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F15dQd022162
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:22:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=QK5ggKjgEaGC+RdtEJ/3TC
	Ttyzna3JscU/P1oJ6de7Y=; b=VfyLCInoqbRmKp7Ehv7Oa+eiT0Y4PjdIOZl/gv
	T6q2ABWmf5HpOzU+ry+dkwxH5b3XbgqVdOpGOcIURkUpIMiSch+Req9pMmfgKHkj
	SpQnDJWFnzBcPL1xf0re4aTyEpjWjalnxRbmH6uR7wcSuVSk6OSJlFRj3xukBJGL
	GbfvQioOrKGEhWQ2Z9GZvQI+lY99oBocplALouEtGBMgsAgoC9hD5p75ZYhT4tI3
	VhIbeVfVAS86pPS1EdErmCi12OV+CmRUQhr+e6TZ7zq1fg/mzxPrE543czqMAibr
	TtrqwkkuqeNW4nvqI4wYcXS0fk3YtRSKpkGXVcTBR18eKxCw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf69pp40-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 04:22:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-306e5d9c9a6so7784781a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:22:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744690975; x=1745295775;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QK5ggKjgEaGC+RdtEJ/3TCTtyzna3JscU/P1oJ6de7Y=;
        b=bMUUr/kGC0OkkKAARHEFJWehEzyccZ2HjHGLSeTOoWNvDl7zFAvWBVAx8SZPl36yZ9
         b+Yr07Ji+rY2aHZ/Ac/Ct1FZARElU32zLhjYL3wItfCCaKOFGrurfbpklnly1ZzX4teJ
         MqB0PupFJDkjwuQlQY0sMtFsrnm0y3vz8sco7KEOx3/PRqC1zuCLRzOfODIXKJniEEJ6
         Po8ZYAsVt44Lkwt4xEvzZfFDLPRx3NN81TlIVYkF2IBybl9WZwVe5a5X+xmWvoAT+0P3
         ThEEP6WDWHb+ePG1zBrhbiGLuGxLYGK26UnmztXjFecBFLQ0Fi+XAMXeXNACbdMe8E/+
         uz4g==
X-Forwarded-Encrypted: i=1; AJvYcCWCS374e0JaBtLLTrFQZ/bp8bxK/6E219sNqhgdz7g/x4h9Bzl4K98uOoCL+pzjalZI0bIuS1zy0icvTR0=@vger.kernel.org
X-Gm-Message-State: AOJu0YziKhH9P3xkkr5kGGsL5zmhC8/KqZkcjJLv0NoebsMfok/aehT1
	/CY+MVmc4pE8cSQ1wSEJ4Tx2UY1biw63PaVam5tHko6dR/P+iUoGCizZdP0BRxTAH3lj7ojkz7D
	PX84jMp7ExQ5j7yy/DbcyrwJSuQE0iSvFK6adIx6LPuqu5S83byp2uMUr1SzmvbpbYOYAUrE=
X-Gm-Gg: ASbGncuRiM0t96DXK0IdRmxgINbO4JZ6kAG25ftU87Y0p8wRiAIWg4/8DmZxD/CEDQz
	+jHx1yCRrsTquut3u0zV+IB/WgykLltE9WLTRjm80uNANKlEecXBGB28+nYNwoQzATt7E0yQtSd
	EOd55PIUBmAwakrV0VBzgw6+ivAqdtFxOPl7QhxkfOpGOQYhul9QFERJrhsyYlBXZV/inZKM1Uw
	193FqyeJapLVyWCJLriGY09eLb8AIDl8FeGOkbSMCB4wDCw4qDCyAleT2U/mHcVyKAoUNYGhgml
	LghWP9SfOD7KRXN+BTjWQn8BPDRsLHgL3ZvOhO7YDnfYuxNdwcZvzedVGtW0uK/oV5EAWvymf28
	Yj/pjo5/XNujC9qn3kNrvVOX3uB4eV5LJde+bd+62AuT1oOk=
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr210194925ad.16.1744690975364;
        Mon, 14 Apr 2025 21:22:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH7+uvkdGknQb00oQUI1NfaDMk4fzN02uM7D8bZc8IMJdJh2THCZXSQRaS1L2fXBEdTdfKOLQ==
X-Received: by 2002:a17:902:d58b:b0:223:501c:7581 with SMTP id d9443c01a7336-22bea4ab90amr210194655ad.16.1744690974929;
        Mon, 14 Apr 2025 21:22:54 -0700 (PDT)
Received: from hu-kathirav-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22ac7cb5047sm107381865ad.170.2025.04.14.21.22.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 21:22:54 -0700 (PDT)
From: Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
Subject: [PATCH v3 0/2] Reuse the IPQ6018 QUSB2 PHY settings for IPQ5424
Date: Tue, 15 Apr 2025 09:52:49 +0530
Message-Id: <20250415-revert_hs_phy_settings-v3-0-3a8f86211b59@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABnf/WcC/4WOywqDMBBFf0WybiQvte2q/1FEUh1NoBqbSaUi/
 nujq0Ip3QwcuHPuXQiCt4DknCzEw2TRuiGCPCSkNnrogNomMhFMZExxRWMIfKgMVqOZK4QQ7NA
 hVUWuZCPqIrtpEp9HD6197eJrGbn1rqfBeNAfOlb80k2ccgr1SYHkOWh+ujjE9PHU99r1fRrPV
 mIsBufnffwktqq/OydBGY2RYw6Caanlt7hc1/UNrV9NLhgBAAA=
X-Change-ID: 20250414-revert_hs_phy_settings-47643d2c75ba
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Varadarajan Narayanan <quic_varada@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-kernel@vger.kernel.org,
        Kathiravan Thirumoorthy <kathiravan.thirumoorthy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744690972; l=1328;
 i=kathiravan.thirumoorthy@oss.qualcomm.com; s=20230906;
 h=from:subject:message-id; bh=UySY5QTJHVg5GTrBaYA2PTmlS4zMHyVLJFT/hmWX9lc=;
 b=SjKOYhH6N5+aNsnBq8lsBu/EjLKWHVVfmg98xJODXNImkUJXu1K5vNVvJ9ZpeHZIoNkwAEPEy
 8ZCGdEF7QgCAxhRUg4Yb6LHZXffABOj0A6UChS7Vq+ZZW9Jalpy1XsY
X-Developer-Key: i=kathiravan.thirumoorthy@oss.qualcomm.com; a=ed25519;
 pk=xWsR7pL6ch+vdZ9MoFGEaP61JUaRf0XaZYWztbQsIiM=
X-Proofpoint-GUID: 1b7W1pRNGv0-i_L4j_pvdBYLjyHFAMsL
X-Authority-Analysis: v=2.4 cv=JNc7s9Kb c=1 sm=1 tr=0 ts=67fddf21 cx=c_pps a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=5a8PNGn9bNKLW8I9e00A:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 1b7W1pRNGv0-i_L4j_pvdBYLjyHFAMsL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_01,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=702 lowpriorityscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150026

With the current settings, compliance tests are failing, especially eye
diagram (Host High-speed Signal Quality) tests. Reuse the IPQ6018
settings, as mentioned in the Hardware Design Document.

Merge Strategy:
--------------
Both the patch in the series should be merged together to avoid breaking
the USB feature.

--
Changes in v3:
	- s/complaince/compliance (Mukesh)
	- s/design team/Hardware Design Document (Mukesh)
	- Link to v2: https://lore.kernel.org/r/20250414-revert_hs_phy_settings-v2-0-25086e20a3a3@oss.qualcomm.com

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

