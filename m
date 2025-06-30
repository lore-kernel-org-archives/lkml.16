Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381D5246BB0
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751279834; cv=none; b=vBltdqGuo4IaZqvHtyX4HwwygmcqqOa2uaLklB9xzILaxFwPHxVzaac08wsVLFcgNUycgzBNYpb6L9sgSOYy0sf7+xm9IczjEVUHujDhAEnwaDb3THAPoP62ohf2cXJ/hlDIIZI82NFOGVmj4EKexSo+ZRrpR4fmixXr530dJdo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751279834; c=relaxed/simple;
	bh=0f52qohZfhQFKtLyzx2hd9c5RiVAiaxNXfQ12Lv3IAY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Pt7xoY4m9pggkQUUxyv3YGMlJlld7G5teHeOCqS5mEBi3xpwn446ipM7plcNURylSB49khakFX4105xO7alKy6ffhl+t2SfIsKMA2fDxG8g2gxOAHwoE2h7XoQdnlxyz0WoYsFPRrKaZy2F/OqgTZeWlwNlFvft24zkABNaU3H8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=myknMIRL; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="myknMIRL"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55U8DEtm000314
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	chQsJ4qdSF7F+EHHfxbJYAztwZBfL+CDuaIhJc5vZW8=; b=myknMIRLEcQ7/yes
	WtpXZ3URf2iLaegN/xE0HfVhnGxNdbya1BgJlfsCC0go4GO7wst+AbE/XFK0MYvy
	GnujcTKh/iXj/vR2TCQZQDrJSPKpjeMPk0iPBJuy60D+kieAH44yQwMAWyIi4gee
	50BiWHNkNKVHv8FwXPav97Wu7H29YdQb04mA71Gm0DoOEr0rYU5d9uBs7GJjPw7c
	pPji9iyKfv97e/bLNOCeJsyrYdUjX2VL8RAiMeZVPL98Caf8RKL+g+AzFD0tn+ro
	y80qjkwwpv+276VusWCEjEyu6E3V/wgb6+Xe9ihpCw+3A1038A/HoJEdbkaKfQl3
	BTsRXg==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j7qm4bdf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 10:37:12 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7d21080c26fso48872085a.1
        for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 03:37:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751279831; x=1751884631;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=chQsJ4qdSF7F+EHHfxbJYAztwZBfL+CDuaIhJc5vZW8=;
        b=DQ2Oi2SH6pqsdo2D0TTRUT4k4nIa0dnCFCTxkFrLFlUpEo1aYhM7LRrl49Bb7lE0Yy
         qujTxt27D4Up/5zJAzDpRXLqTmtcWl1IBLoCS6FkmiLQZPpP4shcOeUG94WsYSR5UU3J
         aTgQNoHItHaNn0E78JWjrLm8en/CcgIQBDbmkmpSvKNiLRmTxb+T8Fi5ISp5gqGMK7cG
         9ye3tJ8JrGFgkvt/fwFUHhRlZ7VxttdLsQOqAIAuACwUCEPM6/VjBKcgmh1jxVVJnT2j
         HIwJGXGX5iMffHhKL4ERCTOxCrxoa6iayEn6EN+eDwAedYju8D4i473XkKN6pPSAFG55
         SqHg==
X-Forwarded-Encrypted: i=1; AJvYcCUO96MWXQdKs2jdnuQ8nGK4N8g92JSfW/iOsy9j7rsjwBUfODWG/AjbmUoG8GfS3nK7mNRegIjklVfjjdc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAG/z1m/DOhc5NhwbE5+UdTAsK7SNbWts0w74T4Ri4ua9GDHP2
	kbVt4ITCgBKlZJEOCt+un3bA0F2ALOjOQzW5CgUNh870dY7GXHlDzT9kLhpuAOuuwXY8eCHDb48
	lKTsmQBrifi+DFmwkxrq/ezcfzbu54ZwCw+rYJ0q+LTqDOHkgcS6Xqj46jusX0V+KhnA=
X-Gm-Gg: ASbGncstwUjbmcirll8h8UGr8Zf4meKXd1nrlgNJTrls6UI7Q0+QKQp6G5xMHKA3vwf
	PZ2JtKTqC5ZLT6v8kmy3Jbm/iWKSiSug6gTT3vGLvOG0VBvaydnsknkKnSdVEKyLZbTzZM2FkzQ
	rESU7cxh+BUFTUNPg48QyqcIdYfFoasx6UilnUz5SV1X/33B47DPePiU2JZPz6fPBbkJ2eDPGVQ
	JtbzX+O72sfYZgrZM61YVgia9mLtKcjZgty0OyCvzZbThWQD9hVGSFB4CKs0eyAkPPbFk45UTHQ
	qbin559c67M+i5qWUBUBGhLxasbrmAmcun3kb7rkufqxxtvY3S6b7luFZe2N3LjflFaoCaOcVWw
	9p8NGj+f4
X-Received: by 2002:a05:622a:8e0c:b0:4a8:83c:3fd0 with SMTP id d75a77b69052e-4a8083c4046mr31804901cf.8.1751279831175;
        Mon, 30 Jun 2025 03:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEVTE4gfc2xS7ZFMYXNiDjrAAjdrlg3gSjjHLpNFckqEJ2em8WfYVERrLqJ1eKY9ndnkmrDCw==
X-Received: by 2002:a05:622a:8e0c:b0:4a8:83c:3fd0 with SMTP id d75a77b69052e-4a8083c4046mr31804761cf.8.1751279830634;
        Mon, 30 Jun 2025 03:37:10 -0700 (PDT)
Received: from [192.168.1.114] (83.9.29.190.neoplus.adsl.tpnet.pl. [83.9.29.190])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c831ccc90sm5470940a12.56.2025.06.30.03.37.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Jun 2025 03:37:10 -0700 (PDT)
Message-ID: <cb863e23-79c9-444d-8511-033dd75c02e6@oss.qualcomm.com>
Date: Mon, 30 Jun 2025 12:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/3] Add initial device tree for Billion Capture+
To: cristian_ci@protonmail.com, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org
References: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250629-rimob-initial-devicetree-v4-0-7cf84fa142af@protonmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=C4TpyRP+ c=1 sm=1 tr=0 ts=686268d8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=fKQzr7EGRj+VoE0XNsDNvQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=sfOm8-O8AAAA:8
 a=ezlFQH_qwS-UVO2EMFMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=TvTJqdcANYtsRzA46cdi:22
X-Proofpoint-ORIG-GUID: nI0dWjRDUjZVIiCeuibRTgVv3xq7f8y7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjMwMDA4OCBTYWx0ZWRfX33wKufPQexEq
 wzn9mQvzTbbsAt8sUcYjy3pibmOjGWly4SMWU2PoObI8LBAfXCQbhvgVfqGZ7Uure/FXTboeTUe
 vfjE5BXdS/Nh2rVwz8jx0D4ifFblhbgs0dTs6S/kTHtnpnITwKGWqxAf2n7z2KTlsn6mNq1fX6O
 aN7lfHOlIYHthWRCy40utWR8JUhjADzpsfokYH0dMryZQJwVZQejpcU6UHZKKSW+VM93K28nz3j
 lIbo8oGMz2rjIlATZdREEup5/LEKKHz4qs5MsKP1z5SZezQT6s9ItpW7JKyZDYAleyTSh2HU6Bq
 QZNvavLq03jz+FWw+FgPrluMemdSCrklNpBe9PFC1b58/ABQ5L8i92xFirxzq2ZHqQiAbhM0Lys
 EdCSZaADsnDayxUHVWj7iRu5aYnGBwRfOUNT7k4cswDW2md1DyZEsmp9Y/Q6I/QgxoDkHMJT
X-Proofpoint-GUID: nI0dWjRDUjZVIiCeuibRTgVv3xq7f8y7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-30_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 clxscore=1015 priorityscore=1501 spamscore=0 mlxscore=0 mlxlogscore=765
 adultscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506300088



On 29-Jun-25 08:44, Cristian Cozzolino via B4 Relay wrote:
> Billion Capture+ is a handset using the MSM8953 SoC released in 2017
> and sold by Flipkart.
> 
> Add a device tree with initial support for:
> 
> - GPIO keys
> - SDHCI (internal and external storage)
> - USB Device Mode
> - Regulators
> - Simple framebuffer
> 
> Signed-off-by: Cristian Cozzolino <cristian_ci@protonmail.com>
> ---
> Changes in v4:
> - pick up tags (Rob);
> - Link to v3: https://lore.kernel.org/r/20250626-rimob-initial-devicetree-v3-0-4017ac9fd93d@protonmail.com
> 
> Changes in v3:
> - (patch 3/3): pick up tag (Konrad);
> - Link to v2: https://lore.kernel.org/r/20250624-rimob-initial-devicetree-v2-0-34f6045ebc30@protonmail.com

Resending just to pick up tags is not necessary, maintainer scripts
take care of grabbing them

Konrad
