Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F39929C321
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:52:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750431165; cv=none; b=EIoKRwY3tpkLWLzFucQyAdVTJu+ePOqOPiVMxBTnpw3IWWciDUtDMUM6Jckhgsv7FCdSuvCSS2BV/7dtp2ve2ycw7yQUG60s191nDAHmNUlo7NnslsVjUL251Xs8rVCIIQyhaRmbhQ31gHHUzLomR18EZojFNZMNp1V28+0gdgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750431165; c=relaxed/simple;
	bh=+81yvo31v7QMHWZeaNt1CEAELQelIHwFryFAymk9iSY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aymW7pWbpgo0VGnrCAeYmq/46q6xWDTZOc07o2L/zT/3Qbn7Ys1Y7Y8sCttIWpP6ET8hsQQd9ULaI0ZjlT7fM4McI3WI1NJsVvHjEMO5zZ5zV4sK/TmolZELTD/JlnQhYuxBVLXn+ALgD5Hw0C2cR4gt9oxIMbshoaL+dxatyjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZAJtHpAg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZAJtHpAg"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KCwQJE017863
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=; b=ZAJtHpAg5TytFv3W
	kvuEP7MlYXk08pMf7BPEgfge3rI6e1pJiKr99ASdea9Wguhu2WqaLVwo/hjsVtL6
	3dgUGZpz/CmqkHIg007vyaJ7HlUJ6R/Bo/Df7i0zzmZgjH2LHc8yzNCo+GdNTkny
	mn0iLXTk5buYeTmE5nZpfKBmadFdmNILbOOEp8XNX3eEEd1w64JjX5vndaZrlLlV
	UQInlFPbKPV1t+Nc2WT+3Dz7TAjHCoiZpzHzR1tTtT0xetNlcDAPOxVuQG2iJGyk
	RzcHwfFAGdEqnujpE0OrkBPgJQkxfSCd49PTSZwf0l6ZaXuDRJXwaqGntp6tRXIy
	igOgSw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47d0pchn1x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 14:52:42 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d0976a24ceso55751185a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 07:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750431161; x=1751035961;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bAvY378g9pdTybx5+IbpDJkH/ia0/TW9evSfILpWJuo=;
        b=qnpmVyG091SHwDC34o3AirqrXdpQwzbAkZInSAZSutWSa6hDuHsmNRugNn8aDU1I0n
         Kc+ZkrdYXlR3Tjfk6NK4Dyuyf5uU2nV3lizgX42wh/mCkMA0AxZBofg7YzvNFVIvxC7y
         xbxhHtFXjabwn9zCpDbwgMapffmGdtfNm7YocC4//0ZtHI/UExqQAzXflkSedMJqLRh1
         bSdXXWtp5HT5uWKoBkoY24cVjGuynh/aka2VV4D/sIJPtfzIo5DQgiroB++FYkk34UjT
         mZX0YvHk0x3i+AJxngSeyYLRlwOe0kLm7in1/rRnV1hom//45t4WjPpwuD0zNypKgvqN
         /iNA==
X-Forwarded-Encrypted: i=1; AJvYcCVvMbxajtkBnBzpIi5xVG5WJKf+Qnzm0Sa/5LAO5v983x+HuDgBlBJ7hAuri8SpepL/yLZ9b3KJOfKrAcA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyG85PeSaFzj743+W++VkF0NFpit5sKZRdHkDjt7nCnTsPH8JPz
	9Mb/Yfymnyp7Ul728Ni2qwr+DGQaMv9jZx10cmyiXXea3O6i6RMJyNd06bAirX7UlHj3IIO8N6s
	xwt3bBL13+y7wC4jRMXW7+KcYoIOisqkVNH7GRPPnRJfn21SwT2m1Z4d3fXXtNTspmLQ=
X-Gm-Gg: ASbGncuN/v9vj418X0/hE7knpIPYej5P775fVe24Aa/sSxInhj+Ntzar8WKZx1QuGMB
	8KfWe0sGvGe4VFg/ca2f+OF8CCoxIw29mQeiBuymZU/GS0wVBO6TQsvKfHV3bDKkHK6PC1WvSqa
	+fKg8Cw/bTU6ta4R9FJSRlpj+D0UnMh1vH3zhAMYO86AlaHohnE17xPAPhpM3aT9mDlrCnSTFjr
	cpIc6wC2LBPFtxMroR1z+WF2kUmMe60L99ilUerqGkLxwNl4GtS4tm7SsQYoD3SVjMmRoKQEw+z
	i2hlInkmTwlLaCdPrQPLXVGX4ljbB0WJYsl5jW70jp04x75DgV0x30j1v/80VGpNmRGT9EVLW2a
	y74E=
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr155711785a.4.1750431161595;
        Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWSbj3zLVYKtfz8K+lKDPK0MngK/y7uQ3TDDGuLOc5VoymNZIeGKtQmf1ZbkgF7OimM7IZMA==
X-Received: by 2002:a05:620a:448a:b0:7d0:aafd:fb7a with SMTP id af79cd13be357-7d3f98d9073mr155710185a.4.1750431161098;
        Fri, 20 Jun 2025 07:52:41 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae053ee4ccbsm173800966b.70.2025.06.20.07.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 07:52:40 -0700 (PDT)
Message-ID: <e1b552c1-de9e-4c6d-9340-232427442620@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 16:52:37 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] arm64: dts: qcom: Add GPU support to X1P42100 SoC
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
        Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org,
        Jens Glathe <jens.glathe@oldschoolsolutions.biz>
References: <20250620-x1p-adreno-v3-0-56398c078c15@oss.qualcomm.com>
 <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250620-x1p-adreno-v3-4-56398c078c15@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: De2yljgQD3Xf9VpQhKB9cADhW7HP32NO
X-Authority-Analysis: v=2.4 cv=YKyfyQGx c=1 sm=1 tr=0 ts=685575ba cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=EUspDBNiAAAA:8
 a=5RVeKMBEKdVlAG-YRsMA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-GUID: De2yljgQD3Xf9VpQhKB9cADhW7HP32NO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfXxFCZ11lg5pwx
 /Ag8w8IXx9D0TF5UPLlnXmzjsHpB+eGJP2j4VrbKoSEkBHduIdhOfvT3CMjnXuK+Wo6Wbv7rPik
 9Fa+/gfXis937p7y1V3r8Vzru/k5u5jAHINn2YeD23Jfp3UTkIiOvrXYWiUQ8HwI38uOI16SWbO
 7j90mwElpkxUaWXfZ6aYyVcfeqpwQ+QMJ0rMOMyosYTEJIFKDe7wgClP5TqLBQaSbpWDGXzbNVu
 O3MqZ114eFGmnFG00L9h+4j9e7HaRkDj70CifSzMWRIE0HBtLJDziLAC0pMLR1uiTfhH7rfZysm
 6FW5O49zDrvKOfY2Hq0SYF9nNVHJWKicVRJcichkFLbQNzS8ngHzRgDaG8TFaJIKJwD13JMeR/a
 /0eBaQpPFcv08zr/KuzpWNBJXOdF8/0bXde1evFKoEKD75/AAnp3q9dX9lu97p7ENJeNgWaY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 mlxscore=0
 malwarescore=0 mlxlogscore=761 phishscore=0 suspectscore=0 clxscore=1015
 lowpriorityscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104

On 6/20/25 8:54 AM, Akhil P Oommen wrote:
> X1P42100 SoC has a new GPU called Adreno X1-45 which is a smaller
> version of Adreno X1-85 GPU. Describe this new GPU and also add
> the secure gpu firmware path that should used for X1P42100 CRD.
> 
> Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
