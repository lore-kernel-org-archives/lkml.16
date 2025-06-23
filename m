Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02E602367B0
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750688061; cv=none; b=sULH765eOjNg75eD/+VlFfWua4mCipSU4Q/UOLX9e2YxS+EwSIHc8cGD2dqKbRpEukur3k7Ke03Lcuvg0zG6ts8excpMAnB7k0B0K0jDqAhzHudC1sbgY5ZdYGPqNcYDZuUGMOoqD8+rDWVQyl3Hlx/yOmslK6ulBqETIlINTqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750688061; c=relaxed/simple;
	bh=TCFdV3fJCtM692nAUJeh6Kg61bWHn7h/r/7bivD1ZOY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=M02mVgE79PnTOkK66F1lEE8NPQu5zFeD0gmSKjKQxmyN046pJ+ASzpDx3jiKpIoBpqmEJcq98kYlCQrIuYgc6V8TxgXcPzVe2osbm0tqUVVtOMmIuynyVihq/sg9EvI5nym1iOoLVPjJyNtoE5KIyzvEzcOx46MRCbGcxTQBq8E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=naGXnuY5; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="naGXnuY5"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55N9JKEx013471
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=; b=naGXnuY5npw8Z1Eu
	SABjSFnHk7x5gWyiwyNUahSEUH8bKSqsv7pFKXm/WhVLMLkCyHQAo4gHMSTXloFv
	O1Rt282vcukJDHGbP45RoPRmsv4XN6uI1LVfvYw0zQxirykQZDv5eYf/8LT1Uxlr
	2XuAwI7OMSOJEuGqf8+I73CXv9V+4qhtiu0dBGLk85m8tdkOyPByQEiXVQzJQy/p
	pvFZy+x1A5pJxLFxLOJHFOP19zT8XaTo81Rynce17c6i1jFdgB3FBeMYrQkK+C8h
	S0jds8VF0KPXcUFGar2mSdMwuA+Hcw8hBKTIxfxbuv9VU3W4Vdd7HiIs/BMF5kDH
	fLCHFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47eud0a34a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 14:14:19 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-31315427249so4254709a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750688058; x=1751292858;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=;
        b=luctvsj5i5Ee4ErBFkIQfr0oAHXJ6htb4cgHcVSvHAxhxwhqifFwnAvtxCNH46rJ26
         zUJ9du+EqNhwlmnPL64QmmPjpVFRF7BNqwb3K4nUUZDkfRs0APCkDJsDDhKEvqkTDFfk
         g/NmiHq/CAbpHu8YZSkeb60spzbwiqCuSVRDPLplvEAxfNgjYPZVoeE2xCIUW3KBqH+U
         /0JygYZXNap4wXB33kSvvFK/NMgeZBrkCNcsmEdhwmhEIMvYaeiJCNFCoI9nG5mUjoz/
         ra7okRMm1HXMxytYzFZAsxIl+i04TcOhdJjpLQvZ+ge1GuIJl2zQuTbqPPukNgYKVh78
         4rlg==
X-Forwarded-Encrypted: i=1; AJvYcCXKGGNN4Dp6hCAl27r3I0FnATbQU+YpZW0AYLDygytbX/F+atQfRB/Gbj2Cgurm/uu6Klpg2HXn37xwyOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyN/SDSqZ5bqD65XGGhDZIemUd/Jbb+mJ3Hb8nTtpVXfH+/Cd8I
	W8GGCpj8kwFE5IhEoPkXrjlEoagQY+TGWekWVq5ps0CoJLFpJuh7RgQKYOGioLRuQlhjSDdZbK/
	BSicHoD8Gm2vuLXnKcUMed0utZ1rMz99vm/s01EKObx986pGxYttlDOGFKJGEFaZF8Us=
X-Gm-Gg: ASbGnctaKjRq1Nw1Ct40YgnpVxkJVPyR++haax6q/0MQe0sEJSFEoezRoKhRbtWmgc8
	N3zt3rX8NMERDPscUa8t/Zby/D63o3CizGT23K2I06/UYJl+DwYyaTU/gw3jj2zb/W1xjS/4aSu
	KewelfgoWeaAUKGKMyfiJkfgJCoxZrLe5N9TtvSfg+xhlftAMD7xHKatDeFquwU/abCYoBeaiy/
	w+VF7VatbauI/UjJRO7wdZrv5bu9RArWqYUJYB62nb71J0nUyyqe193Hs0iK9miz/WYZnKWOxey
	CZGyUC5FCDvMWFUfUZnSSKqM//URBoCj
X-Received: by 2002:a17:90b:3506:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-3159d8c7c8cmr22958706a91.18.1750688058188;
        Mon, 23 Jun 2025 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE36OaUgAuAzm1zkswuN/1LVRm779C8aiQthxLaXOxOz/CZTu4jbvzkHS2TORWEEglAA5uAtw==
X-Received: by 2002:a17:90b:3506:b0:313:2f45:2fc8 with SMTP id 98e67ed59e1d1-3159d8c7c8cmr22958623a91.18.1750688057492;
        Mon, 23 Jun 2025 07:14:17 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jun 2025 07:14:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:06 +0530
Subject: [PATCH v4 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-1-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=1923;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TCFdV3fJCtM692nAUJeh6Kg61bWHn7h/r/7bivD1ZOY=;
 b=ETabZqcXTpK9ISzvEMm1GGFzT3eN0ByVbCE60cr/JNzTmMAlrzM1bK2CWqhi3ZP4d4IF96zRT
 FJvZjKgub0OD0uTow4rTdGcZTwcRlp+OTMjAwTcNRLZTA2pOJL+p/8Q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: 7hXYBUrMx_XZOhrfQW3a7VWdGov1Szbj
X-Proofpoint-ORIG-GUID: 7hXYBUrMx_XZOhrfQW3a7VWdGov1Szbj
X-Authority-Analysis: v=2.4 cv=eco9f6EH c=1 sm=1 tr=0 ts=6859613b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PEQATVZ-5NWm0mRdv2wA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX1skvsWugaxIU
 EncWs05dlAaDAdSYWaJIUYDoMVQxz+Py3CRvVBng69fXr6RlIY2hjcK0fz93uxsHpye5lUDdINV
 2YFGRUyQ8yFDvQP5GZ+llF5ub5Us9Dua1AujLKwD6Q163XJOSNA9fQ8A4Wq/ZcpjZ1D92GiYEJa
 Kx83S1Wh3oP3wkXYAGXV893e6uJpOoGkbAd0yqv+Q1OKbyKWho0l1IYszF+g9F4aYtPvkrcnlV6
 ByjAbWoup6yBjAUP+weLUKWETMi6LZb+s1y94p2ir4RB8cTWJBEzJAeE484hd4u+mqwtr3YwsnJ
 u29B/QVOyCXmzFCVnmD2Fk1GvJ/9WXENPzEAtLYP/xGbA5SDXI9TWYLCdoKU7jT2pjMczlk7ZXP
 PtXdoUClmmE1SdAT5l+bYCy9no1YaRJU7ai7eIvQVmdpfGMDJSupMVoN4dKKxCdL1ndHEtsn
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 suspectscore=0 adultscore=0 clxscore=1015 mlxlogscore=999
 priorityscore=1501 phishscore=0 lowpriorityscore=0 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084

In some cases, an OPP may have multiple variants to describe the
differences in the resources between SKUs. As an example, we may
want to vote different peak bandwidths in different SKUs for the
same frequency and the OPP node names can have an additional
integer suffix to denote this difference like below:

 opp-666000000-0 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <8171875>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0xf>;
 };

 /* Only applicable for SKUs which has 666Mhz as Fmax */
 opp-666000000-1 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <16500000>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0x10>;
 };

Update the regex to allow this usecase.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-[0-9]+){1,2}$':
     type: object
     additionalProperties: false
 

-- 
2.48.1

