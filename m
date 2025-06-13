Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A1EE1F1932
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749843198; cv=none; b=WQxyrt1mCDsFzQt0KxdNoTTTfb7103V0HNgLjl5zucRtwVOZ3ZDSwamfiMlaN/epqGmwn2rN/c89rc3Vzgo10fUIU8IJG8KzWzHPzvhtRwuRplfHB9PHgTXT48DPRw31L32r5INEWcm2LspSUM/UQZDQO99UjWhhWes0LUmswDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749843198; c=relaxed/simple;
	bh=iiB66+oX+U+GFZBgfUZSwNWdiYU/TMn5GGDQJGHDrVs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ty1kz2HS6hY2Qs2JYuhEPIPGl22cP+RNJneaoVLeg9L8vutRag43w9s6RCDqPwUTWfC8yQhh4O6XCvuxa4OcEVK7CXMsESoF1WvFuKn8yYJdczFYctMB5TUzDwdm9tU4r08ZpqX35/eYBiQ/6vuwd24iEKv2dE68WPzTGeZWKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSrPdwDy; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSrPdwDy"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D2pSJ1024289
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:33:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	+fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=; b=bSrPdwDyVHDVY1cE
	FDtMc/JMZFLYRhZ6Ok535aWwgysIfTSbOug82ixcVXoINnwqCpHnxgxth9CGTkt6
	1irMAbqWu328Fqi67WFjPzuMDQ5ze21UntANglhyM8TeBdAqRJ+M2ZUdxs7RxbbL
	iJJ1m5cWBuV9fC5OBzkuAsa+dkUbglhBcF9fRHz6CFOK6JWSfQDOt1dMdvuqFz0O
	CRvZ+Z5KoNVmTjF7lk/K0FYvzIkpdH/aUI8iJNjxTVgKTV4AlLNhmqZT2tqcW1y1
	59EOksy005Df3zdjpMZeX+Bzba1rLEH+rb/iweSD62YV+X6px09i96UZgAWe8ym3
	BYigNw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 477y3gusme-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:33:14 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5af539464so70884785a.0
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:33:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749843193; x=1750447993;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+fMLdwnRPpM/JGdtaQkyjB4OdZw1gHBXH2ofPLgbcHk=;
        b=kdo7yBXub2vCQo0Xc3WqjVJVIGBvj9AmkuuhSzkd8YM2BcRKj8gl6XNUHithgv7Oww
         pzCoivjAspdMx/xutfuTnRI57BdTDLvIH5QqQkGm8rP0ZDLihzpwf5WArvyslnB64UUL
         xB4lIfi3Rzs54MycMUc4TcAxW8PftA//NuW4UzsAapvR3cqeAFUKi/iv1UsZnXD+wGwQ
         8fdiU9fcMj9Ziw6GeXJUd/qwx54bkS2QChJNc7Qwxor7S36Qex95x3dAd5Gpc+XcGHYR
         P/wOCzFhX6F5sDwqQ64ytbU+1UP4rRTJ6sSu09iwW6CfcV7lHYCg8q0W5cQ32Vh8i+Ow
         HJcw==
X-Forwarded-Encrypted: i=1; AJvYcCUx/SPKyPPX5dRMR/UP+Ta03wy6oBC3xnYtNmot69lIxDb8pq/2P4yoBV/fjtxjlDx4ta39N7wWT1Vdyd0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yys5xrwsp5mEpH9YuCKvKh/44w7THF0CtG69iCa8tKEpSjLO4st
	Xso9h0vRLEF6JeTrBXF62CqdPvn9DiZe70K+WEsj3JI97XGBO1vffzOlCXSMd3JgVJAfp5nkPKf
	hY3/aQXcVwK6H9eV7VrLYYjm9ZwmfbU/fCA31rLHTDDjDc1eX+GBW6kHXzEs3aNYwHjc=
X-Gm-Gg: ASbGncs0RiI6M5ZqI8bDN8xxpMKGXbSqUNFJNLKzmtCEY69ft397fM+ZAHgfY0IAu+k
	+cuPVFfKjTYjJROXfF5V0QW3+vqJa0jUO50cdU25hoyEQE6k1tsHCV5XcTM3/vqB7MnE669a1LQ
	olEUKX61P/mBw6drP71/VVYVDq30yWoMxGYCSlOW40TseOGvTmEhjw2X9ts9l2AffuyA4I2sNsS
	14bNz4m8Fa3IaFF1AQMwsqahCLZowPNIaq7NmXIgvP1MFVIrdbeQRU1So50Aqd2Eny322HEYTdL
	lHY7l6c9ZrLOQElqKiAm6XvzXFza+bD/uL/0vsIUxYUhDoPERf8fMX3iSgSekMhOaIceCKxwyou
	C6t0=
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fb477fe024mr3165266d6.9.1749843193259;
        Fri, 13 Jun 2025 12:33:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH01QDZOiXpTt+NsBhAxASqjmghXoKA9xtVp0rzR0/hmDEEoJUb0ozfkNkgF193N2L9KBI4Iw==
X-Received: by 2002:ad4:5cc8:0:b0:6e8:fee2:aae2 with SMTP id 6a1803df08f44-6fb477fe024mr3165116d6.9.1749843192890;
        Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Received: from [192.168.143.225] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-608b48a8477sm1589010a12.6.2025.06.13.12.33.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Jun 2025 12:33:12 -0700 (PDT)
Message-ID: <89b7c681-45cb-4729-9684-4d1f13595859@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 21:33:08 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm: Fix inverted WARN_ON() logic
To: Alexey Klimov <alexey.klimov@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        open list <linux-kernel@vger.kernel.org>
References: <20250613144144.27945-1-robin.clark@oss.qualcomm.com>
 <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <DALHS6EU059G.18NCREBNOHJ26@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: sKazCM9Sk24Ad6mMSlJn7IcgKW1aL15d
X-Proofpoint-ORIG-GUID: sKazCM9Sk24Ad6mMSlJn7IcgKW1aL15d
X-Authority-Analysis: v=2.4 cv=DPqP4zNb c=1 sm=1 tr=0 ts=684c7cfa cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=BU9CULlEoaguDH3JKbIA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEzNSBTYWx0ZWRfX8gANFfb1/Jtz
 8zfDeY1uEaPvm3MCE7EpDw7e5++Q7Y1rC0r1/tD6xVef7Pwsj3pFoS2l0nxYznGl64htSSt3GFr
 fl9v8aNaPMPkFxhM/dj4Maow7VppB3j0pf1YOMXF+o65/c4fovVlYFtGeJJcp97Yh5X1d9TZ7bk
 cR02ezGHk7CG4ZkDL12GrLn3V1vRX6oRz/4cWs05GYOfLHtEeHf/6VrbNJTUvnR59p+2wdGRrZI
 MyDn4ATcUMKcI/Y8Wq/6T5Usxb6ZqCizrwBxjv6t+0UfAcJNZsqmqhUgH7zf9d8vPEHc4uMFkXJ
 HSrTjLZr8m7KOFkR83ElkGyntkDrp6KTOyqeZetm1w1knHqDCWQ7Qn9YsvAumh2NMY2AGamZ9Kr
 g55edsVziNr5aitVdfTV7SgXH8gKC9MsrHsgZ4Opx2mlxUCcbS1tzc49y/DV3g0M+vMgOqpE
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_02,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 mlxscore=0 impostorscore=0 phishscore=0 clxscore=1015
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0 suspectscore=0
 spamscore=0 mlxlogscore=888 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130135

On 6/13/25 4:57 PM, Alexey Klimov wrote:
> On Fri Jun 13, 2025 at 3:41 PM BST, Rob Clark wrote:
>> We want to WARN_ON() if info is NULL.
>>
>> Suggested-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>> Fixes: 0838fc3e6718 ("drm/msm/adreno: Check for recognized GPU before bind")
>> Tested-by: Neil Armstrong <neil.armstrong@linaro.org>
>> Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
>> ---
>>  drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
> 
> Apart from tag problem it is usually a good idea to add relevant people in
> c/c. Especially when you fix the reported bug.

with Alexey's concerns addressed:

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
