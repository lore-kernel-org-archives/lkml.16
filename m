Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D671A8BE8
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 13:31:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750512687; cv=none; b=tDTtyNBnL0kVSDzHJi3anAEWlY+ciHWw2ZsZ6Yqhdo+b7iLgwudWXMElwBKJrtpJhVfrJ2MoXwstHcp0rYfn4BAAxs/U1BTkh1mb9Vmn6Im28gS99KlAzdn4cU+pocDmhYxaSUELFp5eoVy+37uiA1nvQJwM3l02cyB0bDu08a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750512687; c=relaxed/simple;
	bh=745XbM+R293U6NPlApp30t2HMHXm/4v+Q8H+vE8yLsA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pQeWzJn5xIb50kW2wZgtR47AFm+t3lCIQe1eCxzuNxqPTh08UUZe26dySjHZ4n6Z+hrhozgxAWHddMCpgfLTyIEq1vp/hds8xEFymsUAJXMHHZs9Nq5bPWu42J4V/ltjNj3tD3o6cDxv/gHazETkQeLrI1dAwAy+RoSWYolPceo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwJe017W; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwJe017W"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55LCcn5x028658
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 13:31:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	T9imrZN8KkxLJw4ZcE6UYLM4xvLjHma6UdnfjLX804k=; b=NwJe017WtgcjFxiY
	FvI0KGvr8CIJ0WYscZffC+8JtmHCN3ATnnM83sZaOdVyEOHsBGTkB+GfKUf9z1ad
	NjOpRHKlsqrNTd0+Zo1rASOr1E4cmBUBO667y+tWFP4eDjS6f8PaBezGRDkQEeuN
	665QYRJhZmAbtdaiycPnSk+3uiQwCdrQHXneGsIqt8ZYPwuZNiLrL2k2jd31P1OM
	GxpWQ5sWL1DKvSdeXBApjYvd44oEfMw0uPEe9yQOvuJTA+LuPfNXXKtK443GfeIX
	69r7jNugbcIk/0z6a1XNwSsHG4NhM5BxtjAiRJKnqgTMFL0KeOo4i1oLmICQdbgj
	d5SOLg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47dj3q0vtu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 13:31:23 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5af539464so74965385a.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 06:31:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750512683; x=1751117483;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=T9imrZN8KkxLJw4ZcE6UYLM4xvLjHma6UdnfjLX804k=;
        b=SUndY/2UDGthhM0PJUNOBLHz9/HpTxjHD+dJwl8hxW0LQkC55dRhwGgTPrMGmpQnfa
         I448SxF73oKF0zVTfVMLRK4jH8cj8EMFtT8jycuAnrTVkDTfSx+wPdn1VuBlQKyO9Ycd
         0V0ZEsknb9Tsv7jSQttZ5VDJGHCiBh+0hvoR8XhWcryGs79AIiBgqELzKcu57RkdyKxy
         c1JmjyejPhhPy7in7jLmTfOgmgnlVllF3t9lAVXbd74Mgi/X8ozKJotmRQ6CRHHm/iT5
         xeqoKivwAsT7zLF45Eh7NF5NjYuaCMQW9MRy7nMv/KmhsrEdp7XgDuF1tcjyNkjwqBfm
         RSMQ==
X-Forwarded-Encrypted: i=1; AJvYcCWf7TFo/bmAAbZmoNYyz/TLena59HHkYoPtXKwEr283vCwH5F+5H2aZPzcL4MJTrqrTLCoO/ImNRDFAwBs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxV6QOBdI9evMmR9PQkriRm32POJ/0pY0BQi8X5tbkGmFTYNVI4
	1AHp7cFzNrjDN16F3wtX6rtxHDqJtZzGGZDJyOOXHe067sxEyce4Jpo3DRzU0ZS/zsVMrg/ugrj
	jXcm6An9APdmL3NT3fnKdjgZk9J+i7FNm4EEDhUDtGFadW/IiVarZ4z3IrdIdsRfXHJM=
X-Gm-Gg: ASbGncukOntS+QdWCmIpyNvGEjATENssDlVsOhQEA4FHojyj6J1XVSA9/tw8y6iz9XN
	kXOkBKBdXWRCf2uoq+a0v6uq0SqieOBZgXquXNLJUAwzw/JDxgqPUvy9x9UXxJdRdZ5MbJghpt6
	SzVguPADKVf9WSa2CFsq+ZKVVDI9Ks6+JaK4TnQ+6749XXa0RPgsZvcT17BXZz7fuyRGMZCr+vK
	+7SKjbJlZs+spAu2anX7hNQtGzA8YFIRQ2Q+G6mpZfjA8HSuRj1oVXIQMUqUT0KfX/UNF/BipAy
	IMDbovtg41xLL4LRYC/kTpU4/wzv/yxy2RzNQ4YDJVXDY1Ug84B/g9LXSmmDxAupgWG5aq2E1s2
	9NlQ=
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr348325985a.6.1750512682878;
        Sat, 21 Jun 2025 06:31:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFPnraGfBvL4P9bykA/yT+Cv+md6ula2ABkfuQgFa8vkKOqRNiJQoz/xtOasxclp10nTjMA/g==
X-Received: by 2002:a05:620a:454d:b0:7ce:e99e:bc87 with SMTP id af79cd13be357-7d3f98e6631mr348324585a.6.1750512682368;
        Sat, 21 Jun 2025 06:31:22 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053e7fc5csm371954366b.30.2025.06.21.06.31.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Jun 2025 06:31:21 -0700 (PDT)
Message-ID: <3e8700fe-7b02-4802-893e-2a297b7b5a58@oss.qualcomm.com>
Date: Sat, 21 Jun 2025 15:31:19 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] ARM: dts: qcom: msm8974: Sort header includes
 alphabetically
To: Luca Weiss <luca@lucaweiss.eu>, ~postmarketos/upstreaming@lists.sr.ht,
        phone-devel@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250621-msm8974-rpmpd-switch-v1-0-0a2cb303c446@lucaweiss.eu>
 <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250621-msm8974-rpmpd-switch-v1-3-0a2cb303c446@lucaweiss.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=BPWzrEQG c=1 sm=1 tr=0 ts=6856b42b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=dlmhaOwlAAAA:8 a=EUspDBNiAAAA:8
 a=CZQOM7k-GMDgjQxx0LUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=y4cfut4LVr_MrANMpYTh:22
X-Proofpoint-ORIG-GUID: LLfLBpxXfW64keHS5s0R0lI7N23DDJMD
X-Proofpoint-GUID: LLfLBpxXfW64keHS5s0R0lI7N23DDJMD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIxMDA4MiBTYWx0ZWRfXzgisDQlWslZQ
 P0Dp/5DDCXOAWpURytBXiahCUOJNexHk9xsl55MnYFMBya4H2oF0MyGUg15NU7kEzqC8WKLmV5V
 Hyf/f+/dWicAlGlSM+javS7qWznmtcIuifjBzmo7lYH5CpPaxBeBUUYPY4CmnBOZIiTKoTzzo9X
 mBtO82xbJSHnfG72DcYawgxSvBbM3U8GnWebxwGRB0g3SDqRivftzzruT03VTMtpB1M3hffFI41
 kJbjBR99jTi5LCN1yaHnIQLBW6fqJEGjbpckakWoVMMd5lJxgzLlp6vNra4G4YUDBCv6LdMuCS9
 i0rhHBIZ700Og8dy/hphKwjUf090XLjBuoV1R0bE3WDtJKz2loqIpuooUTXeKz5rK7LH1fAzMeu
 TxqwTKLQLUzp8Q15ewUgGQIfDykqOJUPiWD29WKlpa5EuqiiHYLpnttii/y4bsZ1tFbr537k
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-21_03,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 mlxlogscore=700
 priorityscore=1501 suspectscore=0 bulkscore=0 phishscore=0 spamscore=0
 impostorscore=0 malwarescore=0 mlxscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506210082

On 6/21/25 3:19 PM, Luca Weiss wrote:
> Before adding more headers in a random order, let's sort the includes
> once so that's done.
> 
> Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
