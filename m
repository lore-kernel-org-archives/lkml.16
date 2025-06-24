Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 090CB27A931
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:59:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750759155; cv=none; b=rQioK9KtPZs/NRNE7WbkW3ROjRoKNrVSR7/TO3Psh25voeLCZEZ/rTdFGp3ptZjUbg+4EdX6snMZbQDzWjfqMxUa4TNYwYtVKJVBGsblsnHzJcOuTA612MXtIlwm5OkowuBFtRhKU8S/SHvbTHv1Amqn1LBTGT3g0n7Y50JWlXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750759155; c=relaxed/simple;
	bh=GOGOmrv07Qnn+0/ASPIoh6ungfDggmWYrZEZV92PrI0=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=nOwKO3I0GrOlMyxOVLa7AFEY1qXKSLhd89lWzUjSqUpzPQqnIWf2M2AqLJItswoOPmOxqrjLwGzSKeTB0eBkVt2o9VBMmgRU8O3z3mNn5qJJQZ62gsOrcqj7bn3jPa/cRRqIpTglD9Z58GhKvXhSNQ78dnhukReYk9CVtK8VaHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GqT359pf; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GqT359pf"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55O8wV2K014954
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:59:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71p
	EjKRjj5g=; b=GqT359pfX7b7whMgZwF/L9obKTwK7y6qBY/6WkZPNHrSGrFZe/9
	E0F82c5Ljd48IO1e4VtYF9yJjo5jRO7JHetqXehhNh2+HhjWKXkMSNBcMDqc5Qch
	QSl7XBppGg8Zpn5g4RA6srb2eqaYloDhxeO8UWd9HSC5pXC/jDvoTz9XyFE44jiO
	JXVI94LWRGtdFPKuhwBtYlf3UXL7TpolOL/+BRwkzQVuS1ea7TZZc/GrZ4bGs9mT
	OH6tYrKbaXT2KbZbgzDEqe4MX0jowFkKVKzhdGCKy2jMJt5/5pIb6fPHR+D4Kfjd
	vl9NeCCSeib3X3fW+cyc1c6R0m6TtcHPfHQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com [209.85.210.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47f2rpuu3h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 09:59:12 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id d2e1a72fcca58-747ddba7c90so4489021b3a.0
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 02:59:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750759151; x=1751363951;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eE22PGjBKFzGyDFVc/1k5HN/ro/sK3VY71pEjKRjj5g=;
        b=sRo+jV1IS8ayq7KpJzU3DHKxcx0nQjH7zc/CJFa3Rhhx7am7440XV4tp65Ke5bGqOI
         RvMdLF+sqn5Yd5YyX08TF1W0786Emx/KJJY4blH5rLmBSbqZWn2qKLuB7GzWlEOYE4Ch
         Z0Y6xlXc3E6YfixJ+pC1y6mIIn9K0PTJQJ+wZ1i3VBtVF+0gyz6GDMfvB8S60IocRGwQ
         rTQbcdn/g9dpOahN7dV30W6WJp1IdNaH8RAoBG152yBcrVmvhnUsrhBTcOUO99jYHSSG
         +VnbhmsuoPlKqW3hP6xSvOb+2XROv2YyCvRKW8v7WRdFb0ZIDVO2TWQNtN0NPcjmI6Zw
         cl4g==
X-Forwarded-Encrypted: i=1; AJvYcCWVK7TutvR+jWFRZxQDGW7F+Bo67y3+wv7NiOArmA2vuYudYW1bL+Y3ByPqaZjPapDfajgGR1WxAYOOpH8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxGfIq1e6tU+74pCtDC+vIjHjeRKvzNhY4uKHFGnV2J5Xq5dSDJ
	RI7dL3WrLfUvuwEd2sEgNGMBtPmViG8jKmDhpBD9scrnEH3oHInpge2XYZGqG1JZimVRAzHzEfJ
	/hoifEbao6Bdmyye1j1XBqmiz1t8G8oigGdmrDMNgDrlU/5MiGZlxE36Zq+FUYtY4iU4=
X-Gm-Gg: ASbGncvI9xLsMLtqXfl5bI1WUjErEhZNRyUNLUCnKbXRG2SD+DhvdTMd7sxySjyynw/
	nvC1G1N6OzQa2TuVKjbEuA4hiCh9SbEzOnDOvd9KYJDiqNtEIpctjAwSiad0wutMWqPf4n+hTNn
	wqRQiJ0fpMVOE/IFeJ7VtEOjc5F7s2FaAjueFJDh06iVrEK8r7K56xgnb3xHYOgqgtyL8c7NGgo
	o/4Bb55PW9J42SpFJq5CR7N6+mLWsGk9BIZd3UcKU59b2Vr930ixjDtMKdEKWhwWCffGDJvMaMJ
	JfX0jyFkK+kIw8XYT0+1WmOWU+3Rs7E/z04fPQbfg1TVcLmjVRULuEqX3/j2+WAxvyNaFMkYB11
	86A==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr25041528b3a.4.1750759151611;
        Tue, 24 Jun 2025 02:59:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGOm9pE/XE0KCyZahincUuLaxeNo/FZ4J8obLA+YEkBc1thYs8fF2DXtsxLOS2iwxdoEPqTmw==
X-Received: by 2002:a05:6a00:1804:b0:73c:b86:b47f with SMTP id d2e1a72fcca58-7490d6636a8mr25041505b3a.4.1750759151248;
        Tue, 24 Jun 2025 02:59:11 -0700 (PDT)
Received: from jiegan.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-749b5e08ccfsm1456443b3a.6.2025.06.24.02.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 02:59:10 -0700 (PDT)
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
        linux-kernel@vger.kernel.org, jie.gan@oss.qualcomm.com
Subject: [PATCH v2 0/2] Enable CTCU device for QCS8300
Date: Tue, 24 Jun 2025 17:59:03 +0800
Message-Id: <20250624095905.7609-1-jie.gan@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NdDm13D4 c=1 sm=1 tr=0 ts=685a76f0 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=pe-aGEEqWberZWJlMgsA:9
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI0MDA4NCBTYWx0ZWRfXwwrM7n+ub0jp
 wBZu46yDqeE98Tfdl3qcnUCIT93KBd7BNxEFFLnAtmKkaUb1/RaNGoc071Iuh56PiUwVldIXjko
 uly0ZgRvOiwZqF0CHzRLtdM5l/RLDP72awvKGtfscSvH3VtwkaGGgxnaiUbeiEJrIko43TCm8J3
 6mk0KomUxGdaoYr34eal4bkSTybdu1QroO+afFK582wPkTzxbD5PJjsOxnvzjggry5/BbnPPTfZ
 a23B8nnh92v7i/Ym6B+Kr8LLZ7V2AnFZmuvKBF3+zc+IUeT7bLVwyrBv0ZB977heXg6xBMObHIK
 nr0lvilmj6oPwGFC9gmhcKsCw+dxLrU9A+latcsKzmyXERSqGfUhIXqZ66sAzGxTKZvD/vIFhHV
 FNrtPWh8rabNtWQw4TUPWjEZiTIx5C12vfOqYdMTQZCzIDE/u8mn7cvkYEN/pqGrh4SIyl8s
X-Proofpoint-ORIG-GUID: AK3x55hkg48V81mrWwG-TvsBUxC9DCfF
X-Proofpoint-GUID: AK3x55hkg48V81mrWwG-TvsBUxC9DCfF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-24_03,2025-06-23_07,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 mlxlogscore=845 adultscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506240084

Enable CTCU device for QCS8300 platform. Add a fallback mechnasim in binding to utilize
the compitable of the SA8775p platform becuase the CTCU for QCS8300 shares same
configurations as SA8775p platform.

Changes in V2:
1. Add Krzysztof's R-B tag for dt-binding patch.
2. Add Konrad's Acked-by tag for dt patch.
3. Rebased on tag next-20250623.
4. Missed email addresses for coresight's maintainers in V1, loop them.
Link to V1 - https://lore.kernel.org/all/20250327024943.3502313-1-jie.gan@oss.qualcomm.com/

Jie Gan (2):
  dt-bindings: arm: add CTCU device for QCS8300
  arm64: dts: qcom: qcs8300: Add CTCU and ETR nodes

 .../bindings/arm/qcom,coresight-ctcu.yaml     |   9 +-
 arch/arm64/boot/dts/qcom/qcs8300.dtsi         | 153 ++++++++++++++++++
 2 files changed, 160 insertions(+), 2 deletions(-)

-- 
2.34.1

