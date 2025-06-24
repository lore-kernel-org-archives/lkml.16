Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE3172571DD
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805740; cv=none; b=bmE2gmMd9ncBqajmxmdwdZKfOmsIy7fBk1o22DqnVgM4GsWSUAgRdZ7CopTrQOeq6BB7K7qEY6eLCl4EXfxirDRjYNjEQbRC2AL7XNhawz2vxBa0lf3LSTHpowrh68x6ED9OQcSc7l50tt/bQQtEeJBjN9jsMFrdBbZ5ASvSQ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805740; c=relaxed/simple;
	bh=GKgbBRhzEz04QuaakUJXbQIvwgTsuH+O20uET/6koFE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=l34zHEjgF8MsfcgT4Dthuo6nMHnzLZrnc2Kdhwi2YHRuAUljhPhfcFBe4+di0SHlRO/K+4HIbAfOhxuAgASiH9uF0Fwu1eTWTziXGMPJE7D/VL3h9CfNUJAdjd9dZuJ6/1e92D/P5AcyATO4SYljL16pl3nIuYymRPhA8kv3sWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DGU662D7; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DGU662D7"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OEWNIB020990
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=yDujKkp9EGhxEGJXr7U2EwrKJpZFzJFRRW0
	Cx8wz8PY=; b=DGU662D7YSlzrw/iONvswLf1zxNUXnsgS/u4pN0xNsYT05C45PT
	WBbqyTfcnKeLnlP8JRTWm+uOcEBxIKDANO+QLVudbEpswX0s5qWVxXjhwOrT08w+
	LDuc2orao/xlMO+RVvJy6lPkcHf98daoQQEdRJX1zj7ude4RKNK3AdCmcJwArhjc
	PYcZNvMnpzWeauFPBCIqLAlW/InGT5tvG5uTuDk2dAiiP6nr1osHQNzbygXQNlKx
	LRd5brwO2eYLoknpbFSR03THdMHOR1I6+cJU44E4oGFZnPKuDOHgSY0lYyXkwweK
	2yaQb04fJkCPdb9wxbhSNSLt4H6V9F+bS2w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f4b3wnyh-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2349498f00eso2554365ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805737; x=1751410537;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yDujKkp9EGhxEGJXr7U2EwrKJpZFzJFRRW0Cx8wz8PY=;
        b=lTddeqExU0YZkITK9MxLCSFGFHzTMkUVFuxe2vG6KTVoqgJTbCL+mPDL4pxwNTs7iX
         GtFZ5A+/u+esXHzHNdUNxAeskSgK0fwwoU+1EXwB58K/6VkAb7APLX3nlLI4tRTg0qCZ
         bFaL8eetTEozjjbybkjrYKpZjGQHKVcuvc8ZQpCMjh2TN6F2U4Kondef1ZJ7z6Il6Bl1
         r9pmXewdc3j8wNkNM95cciPivtDir4xDqE9+sGQziT6b1dvdMRLlU05RH0q7ihBwmag9
         ImUjM42LGMw64WIGpGkI/ibGvanx1V9GUNLTPaaZuYNy56+GHUk3WoVajwBa0L+iJ+SV
         B40A==
X-Forwarded-Encrypted: i=1; AJvYcCW+HFz6oOKu9tnPg7MNQRxJx3wfr+tjRnN5GLb7PLptciu1bgrjnnt4SPn0nbZMVdpxZWLobMm8n6rfUEo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKoiqrXsq5Tn6YRXhfJTqYaGx2SF4sWBJzIgy1VMQG1hsGZ/ha
	NkRxIeAFOrNO28H2j6TZdzzadlyj4/skafy+xNIcPqkWkPpJ519s66YmcWwCIMwm0x3gfJuH6tY
	T8y6yX+t3b5RNNGbV3mv2yXFA1qjhszDKkgS1ZJfsJbbLD75cTVYQHrbLWsQV88Ej8/o=
X-Gm-Gg: ASbGncsDkH4Gd3xpj51Ze75o3QwFEM6pxWn+I+rtggoV+qjN6p8ZgGEBq0kadLLVtyh
	gdwD4III2vrQJIGNhOohuwQeQHnM8MtuI+xNU2kkFtlPYKWhxIhp54INLh043Qb9/FBWoVG60nn
	xPSll03XN5wq7oEN7BuRgV/E4S3vKWEncu8b0M1xTJDunI5KIB1wsFOv+95L/wvse+K8EdT7xKl
	JvGOeiHq0qy6uiFUDuDla/aCiS/HrDZX6AF77oXS3HIl3KsowpJGRuRLZq7sj37sLxleso8JQ6D
	SR2qvQ1ou+IF8XMcR2GKVWY/9lORO2o0AIgS7z7jxsZicgPdo7peNbiUuQz6EYmVfp2XFERBjFO
	mZNR1auoLTA==
X-Received: by 2002:a17:903:1aef:b0:234:24a8:bee9 with SMTP id d9443c01a7336-2380243286cmr84876795ad.4.1750805737382;
        Tue, 24 Jun 2025 15:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZQUxECsK0cz7E0Wf1H/BLEGfMGaA5fxjMnQoJMUXwdAmehx6B3JOrs6qWDXwa6Rp/SniUtw==
X-Received: by 2002:a17:903:1aef:b0:234:24a8:bee9 with SMTP id d9443c01a7336-2380243286cmr84876515ad.4.1750805737005;
        Tue, 24 Jun 2025 15:55:37 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a65adsm154949a91.11.2025.06.24.15.55.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:55:36 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 0/2] soc: qcom: pmic_glink: Add support for subsystem restart (SSR)
Date: Tue, 24 Jun 2025 15:55:33 -0700
Message-Id: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfXzaDkx381Tivm
 c1O7nv/Xt2I+IXsnFCjnIjXeLS4fncrlp/wOcbfescwt7coK/HMRPkAhRKgEl9YcHR+f/xOsFEN
 cx6zLqwBAm8WTYg1kgnoM6wEEdFz0ZGv6UB4tz90KKC8MHekLBl7+JVExFAIuXEKVggz3PGqslF
 38lIWJYsuNECqvALizYrL25BTGApZA1pkYOj5tpdv39MDMYxKp/IuwqZt2oNaXskRkZwFhBnauu
 AS2DO6Z5XsgBjOGiqbdCUeFAazKCKIVo8UttHd+isnP3cYdLu3UPcpYJagTIVma2gmRvrXFNS7R
 fB3jXXWTSHZoJ6tJEWRSai2erbBWLdsp4F7LSQVGk2e/pXst1WR9WXnIxzeysiRR+yCnvnL9aFy
 RbzmMxwgR+IpDwqsQvFoQ70MDHmVXCNHPEPaNZ9IEu0UNWFU7MlRHaziPB7q3DN+QDOpciw0
X-Proofpoint-ORIG-GUID: t-s4DrJ_itIIAA_yAyXSkksvykTX_6T6
X-Proofpoint-GUID: t-s4DrJ_itIIAA_yAyXSkksvykTX_6T6
X-Authority-Analysis: v=2.4 cv=A8BsP7WG c=1 sm=1 tr=0 ts=685b2cea cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=RMJmDFgMWbxiTDYyVGQA:9 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxlogscore=999 malwarescore=0 spamscore=0 bulkscore=0
 phishscore=0 adultscore=0 impostorscore=0 suspectscore=0 mlxscore=0
 clxscore=1015 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240183

Add support for PMIC Glink subsystem restart (SSR) so that PMIC Glink
clients are aware of when subsytem come up or down. If SSR is available,
the subsytem name can be defined with the optional "qcom,subsys-name"
property. 

Anjelique Melendez (2):
  dt-bindings: soc: qcom: qcom,pmic-glink: Add qcom,subsys-name property
  soc: qcom: pmic_glink: Add support for subsystem restart (SSR)

 .../bindings/soc/qcom/qcom,pmic-glink.yaml    |  4 ++
 drivers/soc/qcom/pmic_glink.c                 | 43 ++++++++++++++++++-
 2 files changed, 45 insertions(+), 2 deletions(-)

-- 
2.34.1

