Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7152725B684
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750805742; cv=none; b=Oo/0b3hN8UfhQuyrc6oUGSq6kcoF8c2Uv9jVBeGDkz026F/NFaCwkAwlTg7Tr/ACpun614o558hbbbzThX6BVCq7yGjT1K4rBOlad/hG5KFeWbfmu8leWbYNkl1sMs3SG0LEkWpyxtaZp2gJSE6PFaC6S18IfEHOyFQ+HfYI5fw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750805742; c=relaxed/simple;
	bh=th3Ae5B/SQAWX6qLmHXpAPB7x+Q8bgonubks/T4X9/U=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=c7Yl2BmqQ70Gwl9JgJ9w3UiDzJyEhvo7xUdnlnehQB/HgflCAPKvrx8aep7ILB3lsXnSH7t2Y8fWuOEOIYVXDPN9KhInvaG+g0dpmjJTPnTkT/BAxgmTSMj/8NtaflWi389zV1Yzh7KU2BPHWbdqtXppcuRgqTbsFScQnYTtrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=N0Gk3GSW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="N0Gk3GSW"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55OF3wlA031794
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=bgLdW+b+xrw
	utFkJoAS7ASliarNli0r6EfO3VZgj67w=; b=N0Gk3GSWnwDK4e0ANrY0jSWtvFf
	1UOfU2wZw7mu35MG5xmsMWjfKHNZGPn5FTeGMZl4A0zOzyquAXkfseASogx6oQ/3
	98liObGVWZlnn8SwmsWAQ8su7FW8HwVRGPpC+NuOqcqixLCInUd7Ggl58AWg5BWC
	iZMKIb57fwCV+3mN35raW7yGiNTFgdqfThoKPMahiOCEWa0s8iVmvXhrOA2FP18K
	m0NqGwZJyiobz5TI60uzSRGMDSyoLkinu76LSzl40D7k/QnxOCLePTY+W+Crs/3T
	4ipj7V8LXWKwztEhrQYIopxEHxgZ+REBp6md44ySOW+cKppRKe5PPly7DVw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ec2682jj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 22:55:39 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-b00e4358a34so3673717a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 15:55:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750805738; x=1751410538;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bgLdW+b+xrwutFkJoAS7ASliarNli0r6EfO3VZgj67w=;
        b=dWdLp3/JPr8NkQNpj1+aH51T5AGjSrrV/m0ZQH0sIBEKcVqvjn6R2ZcrPMxTUrX0io
         4K3POh7vKfIRuWLPphj+Qdv3GBx3dY8hBbZmPT9MKNjVUC77EnrmFgO9w9+EiafQQsPr
         +qa0ugsxP12dyMQm/08in7dkUapP6b05DJDEmEjkUlPabawpPUdvAqcLtihlbPnvhbrT
         L6rfg+2M2mOUJZuUvWkxaA8+EnsVYMPRPvrzrlHikYeaQCXhgOUklLA5zOUQrFlr70oi
         njtjqZFoCtcP7Ylua4rauD9g7ufUFqlWyWSKzsuxP27F0QP4S3dEv3QwcLckw2aMLbkt
         nJeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6VMKyePyCDhclEko+RwagKHW/nbH88EX6EK5zn4YDHgnVNmXN1xPIKh3bL8mRqdjv3E8z/clvoqqtc5w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYNy7VjevODEZg3Bd0APOoEFzQkKB65BOjxLcvUW8fAfHFketh
	/9z9rJxQN3TCD3GROytin3bHyBjyCVHHQIvOg1kfYs/hWui3Y2zjaVCjy1x3Ja5+sb8Uq+3ckBq
	NIxXtLOWMWnKjlkp3OViVjir6jAs7wwm0SsTMaWZkn1RLav6C+FckyTP7SJ6cYW/iXbk=
X-Gm-Gg: ASbGncv7O6gQAe2aqoNEtGcZuPeu84ZTf9O/leD3Cpj2sP4nULk56FU260L/LjBY7es
	bQbYptYuOt33Co98nEXVQFfkEBtesEOWxptNAf04jUlNGU8k3B/yu1tfGHfZOTDCK5llLHX42Rf
	koE/RoXvi2HXiFhOtKjV/gRDJacTgcBsI/E06wKqAQo7uZWU+wLhjtCeiOgq4CrBOv1BmRot4On
	n8qSVuY0e7c9z9t58G1Lqs9ccfZkM8WanQ/JpW9fNkdci2rxeAJpMR0/pG5+dTRxXn2KeDrAgc0
	Hmdso/IAXxRKLFL8xuMkNgnIqRjEfA+1IEfFESVpCCXgo23Tq4FDhXg5zyTU44bmlI5ymqXBnvk
	c99sNKqAQZw==
X-Received: by 2002:a17:90b:5867:b0:311:ba32:164f with SMTP id 98e67ed59e1d1-315f25dff48mr941735a91.8.1750805738583;
        Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA+1PGk3DwG/2p8elRCOrzngH3sOpe34iA4o54hpHWqXeVT8z7hYLta/eMScjWi0EtA4uG/g==
X-Received: by 2002:a17:90b:5867:b0:311:ba32:164f with SMTP id 98e67ed59e1d1-315f25dff48mr941699a91.8.1750805738114;
        Tue, 24 Jun 2025 15:55:38 -0700 (PDT)
Received: from hu-amelende-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-315f53a65adsm154949a91.11.2025.06.24.15.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 15:55:37 -0700 (PDT)
From: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
To: andersson@kernel.org, konradybcio@kernel.org, robh@kernel.org,
        krzk+dt@kernel.org, conor+dt@kernel.org
Cc: dmitry.baryshkov@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: soc: qcom: qcom,pmic-glink: Add qcom,subsys-name property
Date: Tue, 24 Jun 2025 15:55:34 -0700
Message-Id: <20250624225535.2013141-2-anjelique.melendez@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
References: <20250624225535.2013141-1-anjelique.melendez@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDE4MyBTYWx0ZWRfX31Knr6QLNQpD
 RoAx0jL83BCL4oQ3ZnNmfUNdxp7y+JscXcdtbJ0FB11lxfMgVcl8iayckVHbYu0jTrJ/XrA4dSf
 /YyX6JQv2f2bX50d7V10gbz+M6GYl3yfh/0XsyTsUhLV2fXvCbuNGiueesSxA/qoUnJSeOdK9Lw
 muizl6HKg8ma9apj5EIntf1uf42q5miGCaqq7humj/glQC0+UnMc0OT7gWORqmrGCQ4tR80XovE
 z1NkKOr3AJzy4AEoNrjcLbNeohmVW5sAf9Ba0eJzWp1MBoW0iaM9/cavTFsV6u7LMttbiuReTsn
 ngIzYWurrKZwf6FpLDbuWJ2HNfGs03+mMf60DdjLLtIcrvHFGmr9gkKPtnmu6NzZ84E5bHsfSi8
 hWhxzZZ//E8o8LJI0S9lmyU1t2sqejVgF6zmkkHSJWjo86JHJLd3nk7fW7T5qQUejcIl+f9Y
X-Authority-Analysis: v=2.4 cv=XPQwSRhE c=1 sm=1 tr=0 ts=685b2ceb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=dMs3LNW3c4SnNh3c2sIA:9
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: aZRYwqcSx-wlSX1tKyxOb9KEQngDkn_B
X-Proofpoint-ORIG-GUID: aZRYwqcSx-wlSX1tKyxOb9KEQngDkn_B
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_06,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 clxscore=1015 suspectscore=0 mlxscore=0
 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0
 priorityscore=1501 adultscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240183

Add new "qcom,subsys-name" property to set the name of the subsystem in
order to get subsystem restart (SSR) notifications.

Signed-off-by: Anjelique Melendez <anjelique.melendez@oss.qualcomm.com>
---
 .../devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml         | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
index 4c9e78f29523..0d1f30fdc579 100644
--- a/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
+++ b/Documentation/devicetree/bindings/soc/qcom/qcom,pmic-glink.yaml
@@ -49,6 +49,10 @@ properties:
   '#size-cells':
     const: 0
 
+  qcom,subsys-name:
+    description: Subsystem name used for subsystem restart.
+    $ref: /schemas/types.yaml#/definitions/string
+
   orientation-gpios:
     description: Array of input gpios for the Type-C connector orientation indication.
       The GPIO indication is used to detect the orientation of the Type-C connector.
-- 
2.34.1

