Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A908D27FD4B
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759160; cv=none; b=mS6gege9LDU5IMZ4l065vi2y3Gjz3XFDnIHVwVnqdL/LeMZD25WiktyltcOoC022obpJhGrjvnincAxiIj2Ca4KfF/ARzaNRQoZpHxir/beEcUwML4QcgIN6idq99Fqywn6tr1DM3aT/EihjZpot7k/WhNu2LBGEDCBM6iwsWB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759160; c=relaxed/simple;
	bh=Del9Mg8qKsONs5GSrURtb1V+qrL6nqQjIupUZ5ualHs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mhlqAw5G3eW2TqfNIxIUyo4TE4oSDsDy0SICoBvsFXXT9Q9RlHRd/TbtQeR41c2XlPaPAnVWYe+gDlnV7Ug2qWWs9Eu/mhiAtNp8MgZJT03E8R2wA2RRvXprRyElPjgldsxXkddiAqt5wIw/tRZqBztKBLRDjuHYWmwlAL1H03U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MnYkF6Is; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MnYkF6Is"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8wjfu021903
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:59:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=jp0sIwX7E2E
	Ahi05BS45TpvyiGPx7g9xheU+qhe+MUs=; b=MnYkF6IsBN1ogjUE2DwiLZi0W9T
	RDqnLBoUN8cMX6Gszw5g7XjNWHH1HcyFAn46vAjaHPGRTnmQPJeyoYTGe7lvXp9N
	b+m2mX5rsTdwUPF/wJC3erh6rjuMOogVSuHhFoGCtg1AhgjDrNnXV5lsyr75xCs6
	MbtY/9+XD0uZUn9Ytaa/nMgjPsn1GWiLrCsd9xxngAck7SH7dKkBBudl7mJeBpqN
	VyMrof+Pmz/o5pPpZPIrCshq+dZWeSYMshvxKeqHeghf8L/spne0mCb8AatZqMIb
	u9Nmi0rVah+ee1NJAIURZJyrljL6R7ThUhri9jL9XGUvFQD1NXyfgY/0Orw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com [209.85.210.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f3bgbn5p-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:59:17 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id d2e1a72fcca58-7489d1f5e9fso458901b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:59:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759156; x=1751363956;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jp0sIwX7E2EAhi05BS45TpvyiGPx7g9xheU+qhe+MUs=;
        b=qR1RWf78sa00GEXyh7WH0U85QSOqmmTs9+mnIagI1NHG5PiQf9pwAtivv3CXh08aKv
         37p6SGvOY+iKrRqQXpi3gyCRSS/On8SEXhmfMqfQ7ulgqmSz1xGbIeF3xzqbYtJ4suDh
         Q/eQJ5pYxVdGp2B6PFxgnYSdY/P2v1kYJycc4uYS/PSIly0w5n57sgT/UCy6GuYA8aCY
         gLb4uQDCMqX2gRNfY4Cv5/+X5fm7NdailZD30I84HA5P8DKlsz4P+3ZeLD8QPwoTMUe1
         VrY4SMIUKy/pvrsk4vwz0wTyJ3hzaaZ+8EKBhe0x4FzLhyP/dsOuTXqUlFWEsmxVaWct
         Lykw==
X-Forwarded-Encrypted: i=1; AJvYcCWLvSYdM0C6OcWhttop0bWyDw2XQJr0NQMDNjNYZTfJCURN6wIOPtZydriFodBARps78nkZqylVElL8E38=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7MPHkn8EX0KpSW1vK/CgBeTG3q1OwNCeHwnnplqWe62De22Yf
	s7iiUj3Tn+8SLEwP/o3Zg2dlZ8LrsePHjs2uOJgxApZMIUXsOfyuHP201fKZjsw+MOCyx5NVeEv
	sOnv5fqWHYZNPtOUuyJlvLPW2ThB4bX5wUlFIqZQ7dRYq37FTCbDIJvcX/cibW2wj/Qk=
X-Gm-Gg: ASbGnctO+0MDPFQDsaB7QFy89p4w7smoirVRkUy4xa8t8zEPtpImdT0cWTiWoKdW9yD
	pJ7GR77Pe9XsBDuEWWffM7eTtVOAgooDlj+PTt5skfn+YMzHwPQ/tsBI8Utg8U+zY1Q0OIDKjs+
	uls6Ue0ISunGQ7pr48oDRB0MJilQavD7QXsZLlh9d/oJuFgauHwFoG8AuuzGNwR0bOBI1VrG5Vs
	bD7+ygw9HS4juAvOq5mB8Sv4+yFUU2wT95HHS0tCbp30FZ6kNAx+ra7Q6C6NfQUuGpwDdlX/ajd
	0c4RsC0+hrXPlGPIDqdvIrJ80SnKl/FCXVtUjqHhqLxFbzPf5hz4UedrR1m3pL+YzZdan1JWHE/
	ajQ==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr21503565b3a.13.1750759156373;
        Tue, 24 Jun 2025 02:59:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEBdcW94g6W6ZO1JsBLmEcLZoxaG/MEDeLrVmYb/zbIdyWpPel//mQz4saWpm6SU1788XX+XA==
X-Received: by 2002:a05:6a00:2789:b0:742:a91d:b2f5 with SMTP id d2e1a72fcca58-7490d6089e3mr21503538b3a.13.1750759155985;
        Tue, 24 Jun 2025 02:59:15 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:15 -0700 (PDT)
From: Jie Gan <jie.gan@oss.qualcomm.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 1/2] dt-bindings: arm: add CTCU device for QCS8300
Date: Tue, 24 Jun 2025 17:59:04 +0800
Message-Id: <20250624095905.7609-2-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
References: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: p0AB_B9AY49upPIedYHPi59GNZhw0wUY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfXzM8ivIrNVZfj
 8CF+IH1jpRYnCEw7DOl/BaUrBe7z7jITPCsqT9g2UeB5zA6qIy2N77tzYSsG+dM5wVfut13aVes
 7ZhlAIXejtRouN0MBVIVfPBnwvhIx5az4au+r75NtFO7Fc981nULp/RFlXDDyv5DXZ8ZvmQV2S4
 ppDGwu32IKkbkRHucouPaVWqtM0ejqCEaYpF000JuVCbj+Z4PpkvtMQHbp43qvU2CTIuRiO60g/
 m4yR2flgdQhVFi2Rj2Fd8oMCa6Mfrzg5OVl+r0g0SKTRxBR1+kxOf6hVj34YZUpjBMrLiCNuxsk
 5T3rgf9k9tXL4OrVFAFQ0ZT5P1OweF0feMsVq7Y4JZu55LIGuWn33Iqe/xsYpE4iq4/oAHPXNGm
 rLF6g/fxjshuG73hfb+AnuZD/ABtU0/zK5tVKGJaUO+DId33Uy6v7Se8CCEvQRIZWl+fIo0A
X-Authority-Analysis: v=2.4 cv=L4kdQ/T8 c=1 sm=1 tr=0 ts=685a76f5 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=T1NhNMajUKWQjJ4YovQA:9
 a=IoOABgeZipijB_acs4fv:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: p0AB_B9AY49upPIedYHPi59GNZhw0wUY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 bulkscore=0 clxscore=1015 suspectscore=0
 adultscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0
 spamscore=0 phishscore=0 mlxlogscore=999 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506240084

The CTCU device for QCS8300 shares the same configurations as SA8775p. Add
a fallback to enable the CTCU for QCS8300 to utilize the compitable of the
SA8775p.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
---
 .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml     | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
index 843b52eaf872..7f3aa503da53 100644
--- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
+++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
@@ -26,8 +26,13 @@ description: |
 
 properties:
   compatible:
-    enum:
-      - qcom,sa8775p-ctcu
+    oneOf:
+      - items:
+          - enum:
+              - qcom,qcs8300-ctcu
+          - const: qcom,sa8775p-ctcu
+      - enum:
+          - qcom,sa8775p-ctcu
 
   reg:
     maxItems: 1
-- 
2.34.1

