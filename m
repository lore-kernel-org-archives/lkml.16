Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79BC721CFEF
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603250; cv=none; b=EVT1cj4Rwx4c3fDlc1OAR7MTWlM0PFqoHXdfacH8dpMqM59k9h7O+9ajYy2jKjRz/QRX3i8biJWfyQVWnb7OhZXdvdEULu3tEs5m4RpND7bIy+Cfh32NrkBXqx+SBjNH2jU+bL/FFDR8zSfar4MiFoRCgTaoZQnf+A5qvjf3tus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603250; c=relaxed/simple;
	bh=rGO8ljRJj2lTMiYab3pEL79ThIPqrqw2LC84J1Wlwas=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=PSyK+OQMdQeihWTfKfI+MCeI6T3DTmFD1oeTcVQHIcywzSdWY5ppz7jo8lONzhwMvUIyzBILJyO/dpsyvS8CqW3KPEg6PEmJG62tngcL8p0Vo+QlGMSFAbkT6BEyHuN9Zt2mwfZz4a4uDXD3QMMXL5WnmpK2H/X51ccT72aUQvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Xkr3egGP; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Xkr3egGP"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJqSx004615
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=; b=Xkr3egGPvQBMqfvZ
	sHfJnV7mOhh9cU8rDpnIyogIh5trcjpGubkLRxGW6stErGedhZciMiZf3SzO2grS
	l9RQ696ISHdprxMvlgXp12YInFEXFWmCP9AqxUOPAhMSx5Kslc4Cj6bb4BKeTmHt
	I0LP3aLbpYOtkZqFHgxfV4rIEO57oAPRUBRFLp41+kLLdqt1n/bjHP3xrP2Bo9rE
	hBGqKvHszSrOA4DcIf/mctY1ytr+0iHf4031VExvKaDyWrgyQemGhsU5r2pJCsDA
	qAw8QTSwnJMWGr94lmcALuRsOqppXmbg85a5p/7VSdYjLQwT9qcfoTeZToBApM42
	Bz9vmw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh09w81-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:27 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c92425a8b1so419610685a.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603246; x=1746208046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L8yxRMa5j4oUptRKWHe6HWZoaMIYXuESwxb2I3uAvtU=;
        b=vt0DcuFMPX6Ktop4to8UqVCpidKwV6t94ad9zT01cygB78Oc8cge2tHALWJGieTyMV
         XPT+xGfg4dCpPDcJTDyEJ+eyJHmAXZn9ha8g22eySUeO/eNaFXvpVevXBxCoMmBB3oEG
         3vuipBes6gqllImCMQOOgNjs4PFLBsRyNJ0SOwJfietJOlxWOPHIhIDm6QwOUATc5Qjm
         5wHUmaXYYwLT2Ca+assyzvESOCgWyU5UBxOhtr1Hx6XVxVpbcjGxXCe8rZpT71YanJul
         /5Opjs8jH/KrMlqxjatiLrgeG0gracA+DwTtMM/5lbRytR+7S/3NHgBME1vIGZcNaaZy
         QxfQ==
X-Forwarded-Encrypted: i=1; AJvYcCWwxlfe8rrrm9ti6c3/ublQx/KwAxhkGX2OxdK5zWQDvqXSnja1Oo8fJAZYI4gWAM7ngkwTaZY2vDn7q/w=@vger.kernel.org
X-Gm-Message-State: AOJu0YwakrYplS6MSGnCCHh4PnwC57bV6WiGiUulE4znnPmKispfIKSc
	74AyR20lLpyemL6Z8vcHdm/NRXoSqfAe6lwTQ5q2xW9JC8BLlNGhviII5c4SO/etYpw8oDQwWQV
	abur/2skxsiE5Bd3lXz4F+SjKZMR5ikfAKg+wkWluMWCkRVaOhrpBht9+aPuWGV8=
X-Gm-Gg: ASbGncu6oYDgnMGBLdzh9vZ3SsWYWmmJkCpBtRw5Uvmse+pUeecWD50QErCCmV1c4gv
	TI0Jj0KBEOsGUToP7mb7hn8pQIhKjHWKdzLxgewPJO8zHXMfZgkrdg26KIPl3vYqhrbG+0V9Pq9
	zFwM0iQPUZiKhPNOifH7OhziqlhGoSz3mBqsHjjUphGd5WcTTJrA/WIHqM5SxDUT/mFINA/UifB
	s7NlqevOHPJvUsbkV/dSsux0deNZEXo0W4l5lRk9mf/qubTJXrgAZk8/m3t1fm9+Pn8pC4VltMM
	F7+3GpY/mCZVADCrQwDaN6Xn2B+3GWEwAca7pahIQDvxrICsEAjGwW5Q5su6p7mb0rVN24hrvy1
	iyTN77jf/J4Eu+kqD4anBM7QU
X-Received: by 2002:a05:620a:2806:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c9585c34e3mr1115673885a.7.1745603246462;
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEyO7skjdxEitddsiiY5N9GZywVEp5UO6PuVT+RDOkZj0UhA+nqJkEF2t1jDX/OPZY2TrG84w==
X-Received: by 2002:a05:620a:2806:b0:7c7:b570:e2b1 with SMTP id af79cd13be357-7c9585c34e3mr1115669185a.7.1745603246100;
        Fri, 25 Apr 2025 10:47:26 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:10 +0300
Subject: [PATCH v3 10/11] ARM: dts: qcom: apq8064: use new compatible for
 SPS SIC device
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-10-da4e39e86d41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=918;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=rGO8ljRJj2lTMiYab3pEL79ThIPqrqw2LC84J1Wlwas=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qbH6ks4F2IG+geZ5nLFwIQL5PdUZWUhGgvS
 bsECHmZTLeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmwAKCRCLPIo+Aiko
 1W81CACQKxfSv9/Wvb30KQhe+Zl+zbWPGvxuxRYx+QZjGBjGlV/G5PTEoRk4Zun3MN2GndY6+1e
 mkHqQybOLnPd/UaztNZPBj8yYPjC4KLEYzL2ftMjk4uU2Ytjuiq4/RI23IGqgFN5HqhdeOhluFW
 GB8hEnBc6FQBDM85AJ+pZmR67gt8249s0UYMW3YJwH+90zd8x2VzUE0055ywB8k9HIUmzlSsMjZ
 8kEZ3O5+fOHj3iAU79FiGZloQdwzcrFZ/3A+c6k3RFDLK4j3ZyNbH3V6zUvSEcDK8JiRpFxm7RJ
 5586h8evUzfqCB92ud4/C8JvIPndzud9uhp3vVGfXeKMlLcV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNSBTYWx0ZWRfX5Zt2oOr8VSig xcSaiJLKMMKwGBVQSx637cNF7V3M6LxWxXiJMlYxFQL/OVch7Gj9uamUua3heiVjhCGyWqOA01j rUZr6cOa4tRk2oIYA9XqqXbCmNAmYHMHu3A9D4HbeSh4nvzgtCvFV0Wg94uAnKW+XapnoAbBogS
 tTywB6jvncgwWBv+cMu7xw6KK5lrQJ7w8TT7lqwzSOMXG62KZf0V1dxtV1brwBjJRguvUrkZELP ZJIahBOHEDHY1b6KA0EwcNCA7WY3rRywSJJW/rtAkdP8ih6auYyj7dConGNqffuUiSpm80Z+e2u HPJA1UQ1iP6eP0mTuKfsfRYL0nhSFg+z3ydnp9HRQoPcDzU0g4tHodPZXFgxRM/fLZGoBPqvkPZ
 mPUidGUBUCzte3Umqe7MdJGdCL2RUagWDr1cn3JovyC+EbfCR/FWCqedOln2g5DjSnr4gmC7
X-Proofpoint-GUID: KM4oKYY3UzvpssCbOrdT3NA1h2pvBbm-
X-Authority-Analysis: v=2.4 cv=ZuTtK87G c=1 sm=1 tr=0 ts=680bcaaf cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=p_EMIZExALG5VSdhSekA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: KM4oKYY3UzvpssCbOrdT3NA1h2pvBbm-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 phishscore=0 clxscore=1015
 impostorscore=0 bulkscore=0 mlxscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=580 priorityscore=1501 malwarescore=0 suspectscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250125

Use new SoC-specific compatible to the SPS SIC in addition to the
"syscon" compatible and rename the node to follow the purpose of it.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 arch/arm/boot/dts/qcom/qcom-apq8064.dtsi | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
index a5aad4f145dd368aabed44cf520ffc037018b37e..b6533630e347c8fc5e3f0791778cd05760b3f3c8 100644
--- a/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
+++ b/arch/arm/boot/dts/qcom/qcom-apq8064.dtsi
@@ -402,8 +402,8 @@ saw3_vreg: regulator {
 			};
 		};
 
-		sps_sic_non_secure: sps-sic-non-secure@12100000 {
-			compatible = "syscon";
+		sps_sic_non_secure: interrupt-controller@12100000 {
+			compatible = "qcom,apq8064-sps-sic", "syscon";
 			reg = <0x12100000 0x10000>;
 		};
 

-- 
2.39.5

