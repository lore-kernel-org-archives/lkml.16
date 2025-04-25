Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B96DE194A60
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745603235; cv=none; b=RpF/CcaCzMpUYjbp7pkBGREERWoF7xjIt+VhE5ATP0BMka/1lw3WCBO6/EidkUxSETTLao4UF/srYhxEuhuNVJgOJuYCc/l5WDLQTKyv+DufscanCqlGEBnap2Gfw1HEqEf9ufcA1YhBvvNiOLsG/twLfaUgBMzd68ovLHHIGHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745603235; c=relaxed/simple;
	bh=J08TN0ztRB7ngJ2Xbw4dsWy2SXPRknR9RhUG+D0mpHY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f4TGrKFUqfC2kn3DML6iVWuYQBcgbbcIZIeFuxAPe+LszH4ijR6BIuYR9CYUNeigM1VBshP+UPl6SjjdoyGj6nEPZWZOsCkTXU6Al1sjELrJCi/OTwwC6zqakZMrrAsVFh9saKL+YMpzDBtvQqgPgxvpmu+bxqTiYu3RPibirQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Sb0Gs5DS; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sb0Gs5DS"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53PGJtiB007897
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=; b=Sb0Gs5DSSnebJTdu
	4BFchMWOjEE0/t3PszXoumzDdAkbREcFkxZMObDKxurApR65XoWnli/37EbH72yo
	QdgmvX2e0TjNFLk1GcQ25hGJede+M8ONzPwznWoqqfqPTW1j6hvyEwqUyyq2bmXS
	O2de+4/nSPLREmLWKlhrzaMadHwe61rY5pniZNIrB2YG9dlBcUw+ASTRc6olK2go
	A8MBMfWEsY64NHJ7MziFAkl6y+pMlQ684oyYk61Z/JgCc3QkKLgZU491nhHZj6Tb
	ToW40fkBIQ03tEvNR8zH3dnwVuPdZcyuxfm1XlLddMOmEQ6nX7PiicKseKn1tgrJ
	FWHvzw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh2hxga-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 17:47:11 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e9083404b7so44074406d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 10:47:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745603230; x=1746208030;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=S9JEODdv7z0HyQoe8gmfrEdwLtIPX7H4ORLuaqxrBCY=;
        b=bBhRtXw8K2A53mm0mT9sifccS8X9AbQFEG6mkUK+Y90aM1J5HM/2tAkka0shdLUvVL
         f+LTKuqPqt/XGao8iJTCrRB8ZppYHIol9T8/ImLXfAQd62M6Bl8fW+5dY1C2evc3akOf
         g5il9VSNgzp+aOmgMuy9FqXMkflUPHzmUlgoFpQJiiJEeSq4uCEf+khvXFb86rl0ss07
         yXqKnwIGngY5r5dLOEzLq1sicMNwVO2c5pZTbY10412teRUPAYFAkuHJUDZv4a803cMA
         QE3CAg/r7zd33uhB+QFus2mlSjvJLsnYXl09oy3aBsz2fuctEIF8OF/+kv1IQ0zbhzv0
         AQpA==
X-Forwarded-Encrypted: i=1; AJvYcCWojbSbTjcVIuodopJ9eyu5wVvtzahaB7BYpqvA9oQVTkNUnTy8l+LJg9PP4xDDOCdO++qkIamizhDhUi8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzbKqquHuc1IYPeYQAxVc4z0EbfzJUGkMv4/6X60yr0CQ/cpwmV
	x3FAjNB3sUjGGZz6BKeZxD8Hin8M3ROWRnoGK5dGYOEwrxMdStve6GzC8/FQXhFzF9h2ta10XYB
	MUBFxv9rXtmGwiJjttBl331f4vn1GRslJKeznhSNxGwuqlsLjdb3JCWt7l0UaDEo=
X-Gm-Gg: ASbGncsAku54oDATK6mZimGqbqW5JoaD9R4ErpuPSapccNe06Af3geiuDSpQQobSxPX
	BlYgpJcxvkasEBCOaWSsfivrhC8Oe2ySPJir8Es/LVFRg7Hj5JLMNclVZtyRbNgDsEk4+/lXL/5
	HzG5iHMcftCj5xDL5XpAbyZTIqrRAdAQyNSkHMwxBHPG42vzlB7yWURIQrCnbo5tX99z26f9NaZ
	VcrAgfR4FNYP/Kbg52u3XHs7dY0GhnKnxIlFl0viIFzMWqNi5VptFEeoseDUh8lzzi4OtO1c415
	9A2itPI6X2cLndKdmUbk1Kybu2cfpS5PxYYvt+cslV3J2RLZADbkCUY7Eqhb4zi4S1GKUN2P6dy
	Ij/dN+gjA8sTE7zCj3WHvdZ+r
X-Received: by 2002:a05:6214:76c:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f4cba46035mr54805866d6.34.1745603230595;
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFIEqY7ImncnVDphCtbnSGLOWmanZeVwVNunDzbKH6dvD3Kbv7e2FBrG3D+7RsO/6h6RuRDpw==
X-Received: by 2002:a05:6214:76c:b0:6eb:28e4:8518 with SMTP id 6a1803df08f44-6f4cba46035mr54805586d6.34.1745603230262;
        Fri, 25 Apr 2025 10:47:10 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb3bd4asm673193e87.84.2025.04.25.10.47.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 10:47:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 25 Apr 2025 20:47:01 +0300
Subject: [PATCH v3 01/11] Revert "dt-bindings: mfd: syscon: Add
 qcom,apq8064-mmss-sfpb"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250425-fix-nexus-4-v3-1-da4e39e86d41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1372;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=J08TN0ztRB7ngJ2Xbw4dsWy2SXPRknR9RhUG+D0mpHY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoC8qZUWSwuEll7v2nmDp8IdjOzzGjkt+i3ZClV
 2s3mTPvyBmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAvKmQAKCRCLPIo+Aiko
 1VIeB/9B6xPFhmfAsHDltpJxU10pORyD/GZK0TKmUo4EmLcQu/iAUyp7FAAxQ0dV2CKtKv3Yssc
 e+MOgqzwAA7xY30vFFnLWNNdVze4SQm2ozgfZfBU/8A5dRaF1qWhAZhhWuohkpuL0dziErXzkAS
 OdiHeAiZMJ9WR/co7mEq6OxK+gQDVOODLspiwszb1hushVDHWuptWhejp3Xca+Ndl7cUh5eFdrc
 FuBMaXzKBcz+r3bbd7Xq/tuMM1Jh/Y/2T4duIOaUb7FvsQfnYc/Js/+C1MiF64KDlJgARAvrgZD
 xktTjtjH5vqj1E3O5j07YJNwO0JpvH2sn2nuPHnhSb6Xv/GP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 8RvVNguLKhxAdubqqo80V4Ok2EzXxkZF
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI1MDEyNiBTYWx0ZWRfX3IqL7XJAkafH auOdlBFKDjEiFu8O4gCGtlkGNcO20AHyko60o8dnKcvv6joIczYjMbpYeJMt0drRmXPB7iNVbXN LuDwrNY1qXJu/d0bxV2rlzHyP6C+/4iMAjJUfNfJeX/tLX0rgTOODQ5kFvRJNb1BALF42nQkpox
 nUWUO0jBh6346yEWu7g+Nk6VsL/+5r/2jse23NyltQ1wDbYwEKQKoe2+garHE3zdCXcxD95+h9R gbAg/A9gKrrE8cv9K0Q2X/e6P4TAeykkC9da8ANbmtt9cyD9npU21bMVpKryRQFyEne0ZbEm01f mtmmFyuaAR0UcWNFTmYU6FoFNbFugPauyflhtKg3FvujgkuH9UwNj4Iga5vMNpYX345pBuxMbbx
 UAtVjrYRGvNYyJbOzklcSTfAbZa/xC/q5pz1Cit/+Ib3MKGBHsYxobAmaDAAXOYYZBkf6KPn
X-Authority-Analysis: v=2.4 cv=Tu/mhCXh c=1 sm=1 tr=0 ts=680bca9f cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=LOr32vULjwKzbL0q30IA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: 8RvVNguLKhxAdubqqo80V4Ok2EzXxkZF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-04-25_05,2025-04-24_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 malwarescore=0 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 mlxlogscore=999 bulkscore=0
 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504250126

For some reason Lee has mis-squashed two commits, picking up one chunk
from the first patch and one chunk from the second one. Rather than
trying to fix it, revert commit 2c8de7df7418 ("dt-bindings: mfd: syscon:
Add qcom,apq8064-mmss-sfpb").

Fixes: 2c8de7df7418 ("dt-bindings: mfd: syscon: Add qcom,apq8064-mmss-sfpb")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 --
 1 file changed, 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 71741f06d2fddd2d4fb6b69c1cfd2d449ce73f64..c6bbb19c3e3e2245b4a823df06e7f361da311000 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -98,7 +98,6 @@ select:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
-          - qcom,apq8064-mmss-sfpb
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos
@@ -202,7 +201,6 @@ properties:
           - mstar,msc313-pmsleep
           - nuvoton,ma35d1-sys
           - nuvoton,wpcm450-shm
-          - qcom,apq8064-sps-sic
           - rockchip,px30-qos
           - rockchip,rk3036-qos
           - rockchip,rk3066-qos

-- 
2.39.5

