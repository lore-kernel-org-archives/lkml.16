Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E9FE219A95
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603244; cv=none; b=Qw/0oFzs9jVkQcWz+MJLpClqXkppgAJTBYi4apoJXZurdb26MoSKeMhlCvvdCQbN5pLesAttx6MtShldogpZCS5AKm0erVHxSIU/00G5jA6gob/Qp+V4Pf/n7grgBSUlaksDtVN9+CZMTpmoi6qSagOlGVP2xndt6l5Fu+l72iU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603244; c=relaxed/simple;
	bh=5HBnCldiWHLrXedPtP0eh7tSY9v0q49sDGZQ3m9ia6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U/BIqsDuMnpDLX9x/ohDMZch/m6rUnv0gDGnOdlB1nDj45UDwZKeAypm5AWe1Xb1j8bnj9bTV8HSoY9JXOKJFvadg5rS2/U0J1gnvXIHHngseYY4+A4kvDqZvrpU+RK37aeS5Ks39xmYBHtfF6YkaeuUF/ia7yliMvB1ZBl5Dcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AcyWkx4X; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AcyWkx4X"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqPc004641
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=; b=AcyWkx4XzeiO9Il9
	s1j7pEUeaWfbuMvXnAv7+p97vGZvhiFH26iQhomeGjdvS+C6FMY5DSjJUFG/gf+a
	/j3tD0G5POLIfguBs/Pp1urdT50p9cubuycbsDMTobosEzzHIItHdF7/4zpyQkn8
	LCTDs4ZyoUUbCbBO5VYjKCgaazrnqJzBJc7yPF4lQd5fzCBdKMBcB4w0vBEoPClk
	Ya5/TuFbjyRv0MNAHeSzgbI6lp+nsdlTYySfV7n/VvVyNkwkJPCAuYLjjTFKa+fR
	TVbap5Tttx/tH3i4oAAswkXJQUMHo1tsIBgCDEEXnP+5jQux8dlUH/Ksg8lowWq7
	2Enyyw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09w6r-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:22 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c95e424b62so245053485a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603241; x=1746208041;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhnk6SSgfomPmCfcGwVXghFWX4Fy/d/emuU0HBNmZgI=;
        b=Ni3ASAyXsg6eQLLUWuGAxMATnRKAoHmkAsfmuKlXmCQ+X2x3DuTOLHvpIiS9lSxwh1
         xEjdaTh9d332R2aNav3B5TlpfLMLcolkEMhP+aJFwco+t2SQYAXjaE5UQZh4nhSueMsy
         pbHz5Ex3nZIj6NCFGOHQ4VH2Ybz13TkGH0PTmMR0DcOZ9HCpbe8w/5eTBkDqkEo4wkca
         Skd58QW87Hnw2M3SYl06N3MQzVstFHeOrBMd2anY36fPQqlnjYsOJB6rbbdLVb+ZrGZT
         wATknkzM8OL2vONLb5BCKSl5PIynYGPRa+7wI3iesYSMo9T4gbrT56xI0Ks0lG0cqDQk
         RUNw==
X-Forwarded-Encrypted: i=1; AJvYcCV5wi/7qFx1ublEuBCTVy3oi3VrdA2yok1P4KTb/kqjYounA044ER84jw3wOA7CmDu7mk0pRUImZkysozA=@vger.kernel.org
X-Gm-Message-State: AOJu0YybSV/+deauJJjfKPNPZh9iQjfMkFfdoaGP32NF21Jxb1a6P/7I
	NPSUxaF7X1xv4IeviO2gasolCsstmblbKSS7biX1QcP/2Nd+6PK1AkbkuchWg5Mmky4eYzBoWYH
	PWV1dvbClocOrcZQ065oH8gimp1UpODYKRHc2JrLw4DrTnM/lCDGXt87/vGhUBerI/nfsHxg=
X-Gm-Gg: ASbGnctpuCDlpAF+qrIs4niU9UBgdoYLf7zLVn+m8lr7rfdQReyEwEefXg1/w2/0K4x
	q+BQ3mA56YW+iZsUhRSZlyJmlCTp0PgRHouSXMswmgKU8P1cbvHcMkOjt+14BtGRvWJr9eAd60W
	cym8pcdyx9pM/SAKf41ZaQgJhvQG3eAoT/WKCLUzVreCxpS2SAmdw7jLbuk0Saxc5bl0g28QOrP
	nN00JqLscArsRXlNg01tAHVNK88cIQgkwKsWfFGxZsBTsLwr2qysJckhaMq7j0OQROLxQXvQjh5
	zVzZL6Q/q91JZx16uDj2cuPfRL3HU82qLrqDuaBVo9s5v9TUXCb9lsM/SV7eZ8/zeKikA9sQWKU
	CfXOE5/WyLdLXLzBu3fazKEk7
X-Received: by 2002:a05:620a:40ce:b0:7c9:230f:904a with SMTP id af79cd13be357-7c9585e1f74mr1027150685a.14.1745603240671;
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEF1OMILgqcMRBKDsI/gW82SYrhxky6zn26t5qp8XKhWVFRLacJKvCEjJhdpZqwtvrIl/ynpw==
X-Received: by 2002:a05:620a:40ce:b0:7c9:230f:904a with SMTP id af79cd13be357-7c9585e1f74mr1027146085a.14.1745603240078;
        Fri, 25 Apr 2025 10:47:20 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:06 +0300
Subject: [PATCH v3 06/11] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
        Lee Jones <lee@kernel.org>, Suzuki K Poulose <suzuki.poulose@arm.com>,
        Mike Leach <mike.leach@linaro.org>,
        James Clark <james.clark@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Leo Yan <leo.yan@linux.dev>, David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
        linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1445;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=5HBnCldiWHLrXedPtP0eh7tSY9v0q49sDGZQ3m9ia6s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qaZmynFljv4w6xMUGoHpAJkHDp5672WeqRE
 D/14aaybTOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmgAKCRCLPIo+Aiko
 1emIB/9l333ri39KxaMB53NlK1gyiMEjNLjnvFIEVAJxwCwhtYdqBrZgFgdToNy+ycpYzSTWq4l
 IRh4/aSli9s1i3reS7uGeOsM8lHpmTe18zlJwK92JCc5eT1D0H28FllNZYWXMidVH7JlUGSC5pU
 rRaSs1t0EtnDzl7gYiG/7gpPXz58ty0JN9u7elZHKCL8gAdKuMJCBlk9vgVG2NuAJqWPik9Egfi
 nVIKXQDYpmMGwVIcGHMTVcGLSE+s1YeM1UTTbiJSIwtdC/BbF1yTP67odyyWSIgC0MvqKd1MA8R
 kyrk6t+l50g3VsJ1Alv3LqrJx2BuIW0f2zm6MfDFmGyj6vkl
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX5jMNxSk68SEK 97hh2D1oHcdWpfWdSVdjvNnt4OaJYdC2L0owbbOgEky1b5R3sldwca+ailJZZHP/qbzTlQaA2KB KjfUSdjs1+S6Q6COk7XXyMnk5vO1myvdKk6ZiZYlN35v1P38Nu7aQZMtuiQMhcpM3Trjd192/xp
 XGYHL8BTp/g1PzlE2luLZgn/QCJqene9phnU7NqnLMQ4rEncqwSiWp6UlRQtaPlsEFuP45yz8pF 1mRYl/rOLwumC5QheIYMrUEycbJ5bzffRsYRTh9fENSlu/cJeXlwLHC8Qun+szM/AGgA/xHUih9 Kv5SK34dKvF8tohtm9W3fNdUFGd97kRNN32C3+1wpYfEUpkyCneDwzBbp3BGhaPlm2Y92ZWWYS4
 ARTOjUj19/hzJoYLKCMDX349gzzKxOatq9jis6CH7i8Fm/MHbYTav8uD60i7JWce+sJslt72
X-Proofpoint-GUID: 09PURBVNGN_coGsz5iNxeKRgF_oO4g5r
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bcaaa cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=kFHV7R2MqMk9-nUzAmsA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 09PURBVNGN_coGsz5iNxeKRgF_oO4g5r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

As most other CoreSight devices the replicator can use either of the
optional clocks. Document those optional clocks in the schema.
Additionally document the one-off case of Zynq-7000 platforms which uses
apb_pclk and two additional debug clocks.

Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
--- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
+++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
@@ -30,6 +30,19 @@ properties:
   power-domains:
     maxItems: 1
 
+  clocks:
+    minItems: 1
+    maxItems: 3
+
+  clock-names:
+    oneOf:
+      - items:
+          - enum: [apb_pclk, atclk]
+      - items: # Zynq-700
+          - const: apb_pclk
+          - const: dbg_trc
+          - const: dbg_apb
+
   in-ports:
     $ref: /schemas/graph.yaml#/properties/ports
     additionalProperties: false

-- 
2.39.5

