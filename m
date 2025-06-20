Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FABC2253A8
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750402523; cv=none; b=Jwyeerr4WZnQiHgFhmW+VTMl1FESIoTUxG1Nu1I0GxgKyd177BQ3UQ4eCAoWX8AvBkpFfcPQGBjP4LbG/LVpeiNOsxhU/gT6P18gu4XeVwd0Tc/Ht4Jtm7TT7nhR7JsVCo+Rdbd6at+yQEQDfXNtObqTqIT6td/+PZh6DdOR7OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750402523; c=relaxed/simple;
	bh=Jtd3nbg/Ox1IZzmZs1FmDMcvo0C/VyluJ+Ezh9idyY8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oehn9QFhHHfLJVGXGGoafz9vaC3XVFdM0oiebdhI8B7n4oHKDGdIpdDYPYSFhPgxOjYwrpM9EGI01itHG54X6GkxjvZzXTYdHJkZqNMGwRclX12k8B+ZwfjmvKVk6m+jLsQa13wM/GoSisZt/8xU6lJcXE/uxHYE8RKCxo/3L7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Vkjrk8oZ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Vkjrk8oZ"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K4dH91022895
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=; b=Vkjrk8oZKMq2xXIl
	mNC6vNs074IW/Y5LUKAZcX+EeITRGSzjKAi8JHm8JOX+iEh9tCNmfBPZrhWCX2Vl
	dJH13mhNgoewXPBWcWGiRzj7DkbvetfSwZ8RSpJ6OrCoOFE+WqIl9ropVyc6l9m3
	WkA7CPk60wYuVzFOOWF3qCBsYOvlEY6Q8Ydypt4lp+bcSb7mfUhypk5SNl0yxNhb
	ElX6TTu2wXtFGlIgKge8a7eAOoVC73FZzQgE0xIt+h6e/7QOu0gPJxy+Yp3yOhNN
	YBpwCSi4nVG/DYWmN6NJ/STY89laFZp0a7HtTXfy/J7qF7ykkyiVw0mo08txwsmg
	2fp1Ww==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hdae3j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 06:55:21 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-235e3f93687so23764465ad.2
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 23:55:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750402501; x=1751007301;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dE+rpElHU4skARhx/mUuXyFZobFHD8PzZckvgCz0Wyg=;
        b=bGnM2w+DUmcye4uL3NsEyrt8Wl1pLsprVQ8TTO0bdmOT7KM7Y+kNXvPYOQz5h5zVsS
         8ZU0KPMulRqUjAmNFMygvJcUGUYruvMU+ghIeVzXoJRCjFrOtLn3QFnhjvGvfzdp3SgH
         JjrGPCbLm2EJOikm7h3Z42e1YWNT6ehY9J+cKdMpAITFIwGMSU7rscXZt0CVcazROyar
         8DzCbr8HZfUxduIsI0zaG5urCXBhrffFGqXliCYS27psC5//WF0+PY+UYG/7UNW5tGnT
         qjX/ApJTS2dq+MYQg4RxybCgOAyLYMTkgDKJxOuDiAKViNyVtX8itFH0XZFX12thWzcS
         u/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCUSs45zwfyVyIqAKqhy598QTu5GXuiqw2YgQQyKZDVWgzOI+9QUqyz98GFSwandBG5DZ+V3qdQkN7JrscQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvseCAY++MpuoYI2hK8CCcLan408AZMD/9LF0b7m3k6zfLh317
	8qmHPdHTA/618eU9umkEf24iPiTZYlqs9PYByg4qyui2p1XLk7aVt00K9crmI3b+xPJX+h9OnZr
	UJjVxpqR92Kk/l7fIg0o1zSdRpNv+dlSgzdUnXJY7z5p7ipaCcOGtArKF7E6IsubHkWM=
X-Gm-Gg: ASbGncsu2g96FRaQPQ1eUCYF6JgPHsS1wXtKz7RucGiBxkvuEHCVHD7rSJ2uspNXXNm
	vQs6tZFIEZ/vbgfN8+rIvzlwMVmeU5ytqvSuUsp8caszGP1Iwyu0krfiEFj0F0vhkpS6WBMlGh8
	DyXQ+Hop7jaAz7kdKi5SZp00OqQhXQojKereL4muEthoVwbEejSsNzXDobZ1nlLhjO+Lf/coI0P
	0GW0XhU/7Tzumek3dvyYDOxYvRpq3yhXhIXC5teP1W6P8wp4NplisFI3FyYZiDj3+tM1BKBgpak
	vs3yHULM7NjacK8ezKOkeSBXdlxEUThA
X-Received: by 2002:a17:902:d58d:b0:235:f18f:2911 with SMTP id d9443c01a7336-237d980c6a1mr28550075ad.2.1750402500673;
        Thu, 19 Jun 2025 23:55:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMDsCNHSiBKMs1kY/KjnuipJmlII9kCnPO7IFtdMURRQwxNK64L+TG4Mrupen8/n1We9Zr/g==
X-Received: by 2002:a17:902:d58d:b0:235:f18f:2911 with SMTP id d9443c01a7336-237d980c6a1mr28549725ad.2.1750402500248;
        Thu, 19 Jun 2025 23:55:00 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d8701c0csm10636185ad.223.2025.06.19.23.54.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 23:54:59 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 12:24:28 +0530
Subject: [PATCH v3 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-x1p-adreno-v3-1-56398c078c15@oss.qualcomm.com>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
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
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750402486; l=1734;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=Jtd3nbg/Ox1IZzmZs1FmDMcvo0C/VyluJ+Ezh9idyY8=;
 b=LjU0vVC1hUPqnFgJGxkwdrUm7NneephzJaIH4RMyAS1VSeQdKXhhIleM945Mr6+vbjpelI5WK
 afkcNVHNlA6Cvp8JSahtciGIKbP5f9LD41HiTH9T3/d5UKd14jd0GvC
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDA1MSBTYWx0ZWRfX8GJvQQgUx0Iq
 7rfxYVuQvilYMVJQ0kUPShFyXqlEt6DgXkn5Cky2prokb9QCUCU+Mfq9ThCuRLOC5EjhV63qujW
 wXEjW77+Qkx588JyQHpCSC1yT9hJl5VR9IzJOz8oCclMh/E/ghUZqx3xeAayLca9w9xqcC+Nug4
 JheaeHc6QkPX1y8WXmESzYtoRpaXcEbALJ7B6OXAjO+As51m59e89YjNgfRndZMKyNWLZcu4Q3u
 Cl94Td9qqqrFO+lcC3Ys/NKumj3MEJc9E+/Zim9ZkvRU3eU3YBpKjLNhg3GnlYsDTN38w7u80tQ
 rWWKqEF2Fjj5iFfnZz7PtfKIn81lD8FV+mF47luppbGshf/bKVET0m5t65YUha/ts5BbWb2FK16
 IQf3Qdi9Oy9DBbIH6jSeQ6xkm17BsJAQd9u/M+deng/FvF4Q+pabc86VPCujUIdGjJQVB5RG
X-Authority-Analysis: v=2.4 cv=PtaTbxM3 c=1 sm=1 tr=0 ts=685505d9 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=PEQATVZ-5NWm0mRdv2wA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-ORIG-GUID: dTj0xd09F4TsD31nJ-bMl_4RFYEKiB12
X-Proofpoint-GUID: dTj0xd09F4TsD31nJ-bMl_4RFYEKiB12
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_02,2025-06-18_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 spamscore=0
 priorityscore=1501 phishscore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506200051

In some cases, an OPP may have multiple varients to describe the
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

