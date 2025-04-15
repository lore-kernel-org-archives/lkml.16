Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49F0B27B4EF
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744713434; cv=none; b=b0q2ieCDAt8P4i+6gIJ8SwSecPEsyY/d+Q4RBSAvfdm9ZWO9tcL1lzekeMjf6OFMC6vBoC+pgdR1Nu2kF52Q11qOOyhtPNFA+Qbk8afdoOLXf04ToIj5DLo3r2qsTa+OTSiuyIWdWQKUo38UYUnm6Z9oYWBn1PY31iTEbdgQAw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744713434; c=relaxed/simple;
	bh=+3lmL6oi2bASqh+SzBsmbskw2dAbEFAbMK1HUa1nNI8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qxL1w2RYRdq77M9kbZCXXNHlRUUsHComItjaRb4t2kb/nHEBbQi7IOqhQwcTXfLegvtmTEHsW2b/UZ91UGmk8d1WkOi1wDSmZ6Tpp6HBQsPCwy946FDor6aLNbCtfGFrieermhFn0K+Z1gTxEnrbIA6hImirapjADyX/q3/V9SI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=XNM0dWHT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="XNM0dWHT"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53F8tHlI002259
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3qYSG9EAZOKsDcJ830qpQK8lVa3VINumKE9Aa+BZiDg=; b=XNM0dWHTPrc+wN7d
	LZaZ2M6qX4bImCWk5GJh8adE7V87AJUyeFz4EwEJp48LqjywU88VHfokdyuLzl7n
	cdQJGZ23nmJpnN76hRZGVUY2Qh6dTw11p+dI11KlVWhM+R+VoD9rWDNjRblFYvve
	5NJUAyTBJ/bfrVeU/xbl0ew1f0GhoV6ZT7ft6xd3DQzSmOGhi7LFOL1irtx3+2PS
	kq42sRgaptaSDqQ0N+SCCCj08H+8p6FQbSa58eatznNauAXpexB9F2GkTvKtaC8D
	nXvl+jeqPqxTpWiUet2BYry+b+3X2txAbYx8c5TK5HmxYJ/fnAZfmXMLfuhxID5m
	mqTqag==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45yf4vfta1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 10:37:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6e906c7cd2bso11716606d6.3
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 03:37:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744713431; x=1745318231;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3qYSG9EAZOKsDcJ830qpQK8lVa3VINumKE9Aa+BZiDg=;
        b=CJ0sNR4AZ5ziS+FQx8ok7UoIDcyscToJwYxN3xlMuhkEP2z08GC4nkZeEIxtC78bG7
         /9Mqz4GmlD+dyTNzRAfcPsk5lPXrQgkImcMQH7vCIXrTZum15F9aEV2gtfcLPbMpvOQH
         74vEYvxZXDcTrOW4ksSVA8r6GLgyRYnB/8UVDCDwv30ohow5qRBihBm36Ot0qZ+9BxUP
         8T7a0jkOHLr/4FndpAWdk7kew3M0kEkv5LHCXeyfE+5OpuYShCHgzwWN6z09tlMSnVRD
         t2h1dtryF9bHlr28w9bxG4kAH67z5jYqrRGoUPOFevGcy4dHvR+uSOg4iN0C29tptmyy
         WIJw==
X-Forwarded-Encrypted: i=1; AJvYcCX+/lC8gHRwwQJhb0bqMgavTOS4+kjA11PsGhGq0ukkc+JSw3tVfpLV/LztrLewQ+U5Y3n7YZVjZAk0Yoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyiv0cIFrc1fJH10OdIP+BUmuIiSU/PkRxjJOWBp3xTZSCshI33
	wawNPoCbnOp/Wv0UTkN+lLWIQGAYAubbKEJAdb8el5R2wt/ZBdaianChyO8/HFj4ZsdajMj2vBd
	95U9teLePtXUGwv/U8puqBiJDtywQ7kYgl6S7F/WnS2paUUrqu9zfLSit2csqocw=
X-Gm-Gg: ASbGncuqp30z1p1FGuD/VoWTloEUoPuu5lI47f+U3FEO7TILRYoKo/ljUkvDbs/pwuk
	kfYY0yhl/2o7bI3q9bRZ/yVYBdvrI+MwzBi5feY7/mCBDSND1w90RzWvlGNv8HID2qfq81eurYX
	26THVXt3uY8K1unHlTwgfw0yWTQeLSaO7tAQ18NJlgJK7N6lsJY4bLA427E7+v1UmVsyWS9DQ77
	o2iagZzy+EBwQpjMg6kR8jlv++3KJxai8FzsV+Ndes+V9cRhFbmCGSjLOHNzxqKv2NgFPuL6ga+
	sNSa81pHhE1R1PmyCOiXuPpnFPU8mYVwKrLy11jX2CrVXD//qFBaw642Q84/tRExlEQ=
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c7af113d7bmr802860285a.9.1744713431223;
        Tue, 15 Apr 2025 03:37:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG8r7n72G0daVWxWBawKKMJy1SmTAH2H+0oI9U77ipAoFv9U+PBQ74nw/0I7ScuZs5wwwwN0g==
X-Received: by 2002:a05:620a:3197:b0:7c5:8f37:1eb2 with SMTP id af79cd13be357-7c7af113d7bmr802859385a.9.1744713430864;
        Tue, 15 Apr 2025 03:37:10 -0700 (PDT)
Received: from [192.168.65.246] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1cb424fsm1054699366b.120.2025.04.15.03.37.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 15 Apr 2025 03:37:10 -0700 (PDT)
Message-ID: <117692dc-ff65-4ccb-8eed-70f713daf67f@oss.qualcomm.com>
Date: Tue, 15 Apr 2025 12:37:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 02/20] arm64: dts: qcom: sa8775p: mark MDP interconnects
 as ALWAYS on
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        cros-qcom-dts-watchers@chromium.org,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20250415-drm-msm-dts-fixes-v1-0-90cd91bdd138@oss.qualcomm.com>
 <20250415-drm-msm-dts-fixes-v1-2-90cd91bdd138@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250415-drm-msm-dts-fixes-v1-2-90cd91bdd138@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: qzhzStGkGr5aNpIh4aVJ6-3EoDiSYKE3
X-Authority-Analysis: v=2.4 cv=IZ6HWXqa c=1 sm=1 tr=0 ts=67fe36d8 cx=c_pps a=oc9J++0uMp73DTRD5QyR2A==:117 a=FpWmc02/iXfjRdCD7H54yg==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=ugsCTDTZwSmivG4p0MgA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: qzhzStGkGr5aNpIh4aVJ6-3EoDiSYKE3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-15_05,2025-04-10_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 lowpriorityscore=0
 priorityscore=1501 clxscore=1015 malwarescore=0 spamscore=0 adultscore=0
 mlxlogscore=692 mlxscore=0 bulkscore=0 impostorscore=0 suspectscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504150074

On 4/15/25 12:26 PM, Dmitry Baryshkov wrote:
> Change the tag for MDP interconnects to QCOM_ICC_TAG_ALWAYS, so that if
> CPUSS collapses, the display may stay on.
> 
> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
