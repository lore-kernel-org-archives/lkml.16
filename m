Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DAFB2E612B
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:57:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750438642; cv=none; b=Ly57hxIKu2KD2ccNRzCDrOLM7Rygo7/RkQ2lY1kUyw6/FXdizF2VuPjDw/rIY/iGwcWvbejjKo6aFSjYEVMxqB1O1lOROeno7kBwT+7Vx9duqh49/ju03GJMOtasERNvgZp7l33m0L8cKs8YQnaXkMNe105OMqcXwhrNR7XNbOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750438642; c=relaxed/simple;
	bh=MTRrTMjk8gJcugrmcAJwb6WUoNgM0oitaPnoUyoLBzc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kja8gsChL5H9nkY6bv35Jw0sdEYUXNkJq1gFJ7IUk0ZZUvk0AY3VOm2yIzKOlz/hvkgI1/LPGvA64BbOhuHKuo+OXxfI7WHna5S0FiOjYXCMUZC8P72cP9vvzRJGCGrTKlHOfL6NTt2b6iYwmgWrNdly/J5OnZXXydW/ZfBfhAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=oAfEnH0L; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="oAfEnH0L"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KBiFpe000891
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:57:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	aH6iMtS8aVt02x/4hZJymbYmKZmSzX/zk1qluora9rA=; b=oAfEnH0LeNoYXcQg
	pwuWt1tSnKPkXXf4mHqj8b9TJ6Ohyu3Q5HWpqu4/l5sfVdYi8ZcqiWGhGqhWEi2X
	r6wl7sKefFcrg2/DVvRmqLKvuxJjmQryvzXjuWqE7BGa0V3nQBdlnobojfNhf17B
	dqC/FDBjSqqKq9ItL0Q4EeeOubnM9EP8vSz3DtEzWL19aXJ1WiuzsF32jaPk2Lar
	EdadcvY+jANazamAoA3jHCmKQzx2tgSOwXEZ4fVVAgVCs6gvF7SjkE9PokrO+maL
	ywHCBkRsDpWnIZ2St+vNFoslTt7DCdxAB0q4qacwtflCnpWs2DXmb0Bjb/5IBzwG
	AYtQFA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791h9kwdw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:57:20 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7d094e04aa4so58643785a.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:57:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750438639; x=1751043439;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aH6iMtS8aVt02x/4hZJymbYmKZmSzX/zk1qluora9rA=;
        b=ebpj4iABeSNwG9ndnSVsQQP47rVDFBcoM0nGo8OygniUhcdq7AdwlVMPjqMto1VWfV
         fWun2+O/J3277uBf072vQU/Wz3lwrUdpSBrX3U82M6gNDuGjVLEKreY4LKScHOyBnl2x
         Hnj4pgVvsEC1/qje5wFLTbamR3N6DHGoec6dnorfWkiW6UTD0Ka6rkLEQBGCD4X1R5Ud
         asP/oEpTqyghkLdu8kT39P+O8qdNXxtU/bFf2iQtOuvxo20QMCPlOYjSisn0POextCXr
         i9bnyQGDKtVq9wKW63e26MxwHuKXsCs01qSZUqVhY6D5lMvhTfmugAUXnOqL2adIXYV2
         r8YQ==
X-Forwarded-Encrypted: i=1; AJvYcCWu/PUkMrZgSE1jH9PDvvogRN5fJcY2bL9/Ojjp5BN2KR80fmIy5BPVWhVMjWyA6/QbF77tzYcZxzU9hic=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxmm0mKTA7IUlPP4UxostBUEQW+7igkOhN/JC3tbZDjZTcEL5U
	dfuETqdLZAoBWNgP8iVJBLBJt8UM7V6MLYXeUMgQvqkwCv/LnHJ62Av0cCZNShXgeBOOdb5zr0x
	mLJvkSChUKJQKDI1JZym9Qq/0X+lNpQfnjcFTU7EgjzrlJ2fmphkySjT1xgglh3wpQxQ=
X-Gm-Gg: ASbGncus64n5m+qrTOXFd0yeE6oaOpYHIF6//MZqO8hyTUaaq0Qqe3kotUZoVTKOvB9
	QXW0Gv97TKp7D52oM42wEbiZQAsdT0k9tTkXJEMZG6BQcm3obE6rxV9W2bijv+h50M5uwasWXX1
	a5vKsAL7VKxquFrfMpbhA7Y5YHMsnCy6tw35zBbBW8NjI7UZCLX1TjXjmmRazyRUz9rzaa8qMmy
	egb4R2eiSuA37fVFGxYQ41d1HI+TPGOGwYClxCYPBAPQV8sTl0gUjIGRcKLLF4SFA+J6Mui9gcG
	Y1hSMnCwx7PIFNRTsPyS8hCIdGYROiskjpdwsv5ovKZPEq0gPHGC0g3E3NLic54ovBvjwvvvdCU
	buhk=
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr176484885a.4.1750438639104;
        Fri, 20 Jun 2025 09:57:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpK+Z1a/STaxapcURqJfzeDBgLN77XcEzNViOUOIZ1OptR6KagVRbX/aeElcpv1q7LaDkYfQ==
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr176484185a.4.1750438638761;
        Fri, 20 Jun 2025 09:57:18 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae0541b7242sm186984066b.118.2025.06.20.09.57.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 09:57:11 -0700 (PDT)
Message-ID: <d045d7c2-87c0-4f4e-a853-7a3a3c5f596e@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 18:57:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] power: supply: qcom_smbx: respect battery
 charge-term-current-microamp
To: Casey Connolly <casey.connolly@linaro.org>,
        Sebastian Reichel <sre@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-hardening@vger.kernel.org
References: <20250619-smb2-smb5-support-v1-0-ac5dec51b6e1@linaro.org>
 <20250619-smb2-smb5-support-v1-6-ac5dec51b6e1@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250619-smb2-smb5-support-v1-6-ac5dec51b6e1@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: 9CsVqmdTfhlDuxGzJxAJD4F5HdhbOz7j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDExOSBTYWx0ZWRfX87NcusaQ4/vK
 K8Vnh4MkRR0tfJVxNDGUEqycJSlg2j76WiRxY89EIXCgct4pPaQu4/7xZxemAnNoCqLu9vhNAyn
 33cpGBsaiV3Wp+/GqMelpGkEgwvE312siG2NOYMJlNp0rOb3A2xjm8ohVajvnRZdN6+zRoKrq2W
 vaC/4rkI20q1UNq3aN/6A4lZiA8I6oBZBw9AxFn0KwCMSdYf6lowt03t05hs4RZ1KWUFxDpulTv
 DofoXSZrKcKHulQkTnaVEt6AN3fdtSdwzP5nExyv9nWipSr4p32oIweUhHBO51CmnGvcOfrS+SZ
 weuTK+qB/HqPZJ+D2Gse2y8dVlvMoki/jGePwBM5YwcjztVj96/prNN06fMFrL4BaWqODj+uZhF
 CGZbuXeThYSDDX2fo5/MSgHdwUsdzWm/q4o0ouMEobTzeVVpGISGch/OrPzQQuN6UvlFcEHe
X-Authority-Analysis: v=2.4 cv=UL/dHDfy c=1 sm=1 tr=0 ts=685592f0 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=KKAkSRfTAAAA:8 a=PGWYFjC4ci8_ood58tIA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: 9CsVqmdTfhlDuxGzJxAJD4F5HdhbOz7j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 adultscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 phishscore=0 mlxlogscore=799
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200119

On 6/19/25 4:55 PM, Casey Connolly wrote:
> Respect the max current limit set on the battery node, one some devices
> this is set conservatively to avoid overheating since they only have a
> single charger IC (instead of two in parallel).
> 
> Signed-off-by: Casey Connolly <casey.connolly@linaro.org>
> ---

The subject references a different, similar-sounding property

The change looks ok

Konrad
