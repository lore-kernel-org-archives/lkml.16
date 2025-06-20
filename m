Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D00A201000
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750444547; cv=none; b=IDVAb2Ia5TB9jBzS8Ghn3gZoUvE63um1GCp6rgCLXgyJiSpeHSYQGw3mwhBCq0yZ36+Jff0zueoUCPB9mUerbO/0UO/jlYaDYVXcvmc/PbKAbeVes0ath839QGi8VY/yLnfeLXmC6LmwjiRDK4TLjcMUzH/T8VOeYECrnGpVlqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750444547; c=relaxed/simple;
	bh=JWMSYzBtLnLZCvwsZk3KkGLaQqwSbdl7evbVSyyidtQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Wos4LqrZWaJAYLZ60E3vXhRwtb2D/zt+dewchpI8B4J++G+cp+n63kC/PoPE3EMRlMKZt09C5MwqovlOAvnKfP+Foay+VJvOrc3vtaei3JqmbQrM7gPjSTbjszx2FmNnwRrDLurWEysY6UiDGgjFoWZYQaTNkQ4K2GU38ws/JVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=X5nx7/Gr; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="X5nx7/Gr"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55KFxDYM005077
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=; b=X5nx7/Gr7MmRCnEu
	ylS3DFsjLg6Dqq3SlAo/V3lwIKBV7b1RxrEClRzwr7TloClwe3i3vX1hRNTY20O0
	lltwffkVdYLQYVcoP51FkX7yBVYgwGWFV8j09CNuUWVKjpaa51WYwOQMDwiOZEux
	1lUFguT22EJv3rd4mMGu/LYPAjC2sYMHxd01+T6xUUAx3Gxs6CF8RimcXXzYeSyZ
	ZD2VcC5CJiVw5ZGvX1R/XdzA9kIPNxvgDL7YFboE4Gi7K/5KaAY4v6XU8tJiq5a2
	SRJJ2gF7NBP5vOtA6dw1LgPkl/GNwb4otu6qBuRAwN0KTGIph8WMJsI/ooBcCcfe
	PmmcNA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47darvrdd0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 18:35:43 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d40185a630so91740285a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 11:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750444541; x=1751049341;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gJw9p79NQp28rgL0YjqCtfjNT9ZaiNa7ynXf7QFlFhE=;
        b=MDmCoNuHALeg9wEXo/12L7pmyktYaNrtq0RIgawK6RxDSnxfQY+1iUB3TXQaKrEnVS
         hW22K5c5PXbC5aIx+NrW+V6y6Ft2lS8I/Wu+E0/FhpOK90qp24+MFXOhkNFTukXZ3vuF
         5LWi/z7jJRrQTQ6AMaUp0kl5JpqO8W52z3qQ3TiaFXETG2sMiowayBXth48EqCp2OtgL
         EjxHI9N8DWAQeS17g07rN91BfV5H0ZifDALK7KcUbEz95X4Zzo04QTpvZuhY8vm8Amz/
         jxDVeoMF/u/onLaXeH5tHKraB5oh56CkUMQ1vRIBzRahn69fD81v6SQNhC6P6HIbH1hJ
         Eg1w==
X-Forwarded-Encrypted: i=1; AJvYcCVPZBgHfV7lChFfbETm+PtfyYSlGc3Ed+qKLYFQCrfYwfH/gSuCK4xgYOEK9EJlPS4KQ/atBpj7xFMrhPU=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWKTlkGHKPdi9Ji3EtxVFy9Vb4zdRGCcU9wBsGphGYv5uVtIx+
	LjrYnB77dwLnKf7NPIibRGQ9HxGrHQGcc2iwedHovleSeahoKPt7uT4N9UiGz02Wi0VOiksisRf
	6IL4LrceD8mzsQnZOd/yl9qDtq4+mMUgGQdITJHYJp/0WVWILwxInJERuBhJFVjN3MV5++wog/t
	w=
X-Gm-Gg: ASbGncvxWLv6ny18F/8mKxqwJKd7MC9YTsvQX56G1V0eK2GfOOxi99ggwCvsq5JQVeV
	+RfX4YhTJHWhyLJcFi081aErzNz/0jCNsy1FYAY3BaZh36yoz8/c1c7zTITQY1g/cbqnAybGBEn
	eJAhp3G/v6XNrIzEiO6T9W+Y46SAf0oSUxxx9zgW08Wr9LaS9mIVt8OxCWZH4MoeMFq2URdupEj
	484FssoARJMo+hmcvDN9KWgWZgd1TcRGoZlF3ulVRhUKgD2DTLWu7vWRqNU7WUjynbdO7d1uu2N
	USvhfOoy3q2exjsYkk6pxqfh0Yt5Jjbc0a0YFkCFId8jr1ggdALhGCMtfN++PeRrx+sseEyJgg8
	DUSnmeh1A0hlpn9oOgSQiY0DrYDK3QWVT9mgYkP4NhRhAqyVh2Xd2Kji4fzuqn69/NmVA0lD6ek
	Y=
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464035685a.16.1750444541644;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFsuEvU180uOuJG3lc80Lg0/m23ATne7omtzgMrhGIFzbRZsPZTYyD0LPioJVHR3t63qkWJcA==
X-Received: by 2002:a05:620a:7003:b0:7d0:a1ac:e83a with SMTP id af79cd13be357-7d3f98e00bfmr464031685a.16.1750444541092;
        Fri, 20 Jun 2025 11:35:41 -0700 (PDT)
Received: from ?IPV6:2001:14bb:a2:64d7:15aa:a456:4eca:f826? (2001-14bb-a2-64d7-15aa-a456-4eca-f826.rev.dnainternet.fi. [2001:14bb:a2:64d7:15aa:a456:4eca:f826])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-553e41bbbe4sm369113e87.110.2025.06.20.11.35.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Jun 2025 11:35:39 -0700 (PDT)
Message-ID: <f9f96bf0-3539-4e77-8d3e-b87ddc561925@oss.qualcomm.com>
Date: Fri, 20 Jun 2025 21:35:37 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ASoC: codecs: wsa883x: Handle shared reset GPIO
 for WSA883x speakers
To: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
        Takashi Iwai <tiwai@suse.com>, Philipp Zabel <p.zabel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc: linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, quic_pkumpatl@quicinc.com,
        kernel@oss.qualcomm.com
References: <20250620103012.360794-1-mohammad.rafi.shaik@oss.qualcomm.com>
 <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20250620103012.360794-3-mohammad.rafi.shaik@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: euVUfn8MgJ7ZuE6HWbtRz-ZEnE1Pa4ZP
X-Proofpoint-GUID: euVUfn8MgJ7ZuE6HWbtRz-ZEnE1Pa4ZP
X-Authority-Analysis: v=2.4 cv=YrgPR5YX c=1 sm=1 tr=0 ts=6855a9ff cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=5BTet7WxsRtOupFzBhsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEzMCBTYWx0ZWRfXxVv7rCTMz/3S
 EVlW57H8oWtFzodPDRx4vkEVUK5GABj4fcPnBXTKNqDpgWL5RPsdiQ2qlSwmq/jN3dQiZSHKsx/
 u8A+CqTei8Ne0hkzgy/utICKEaFepCMFqXkwL1HmjT0zj3cO5lVIL3eFwgKvH+gdF1bPIZJZPbm
 SCd2s7ZhtxZE17za/7N3FFdulltrvCCZe6U2RyyaPle/6lYGKY/Q7Da7dKNYz1y0vLBpag0A/Hg
 2aejZHSO5gvdkQ5bX9WIJyyz41K3dP0OjOEW3WaqaxxZiKdglz+U5UOsxF5G7P7knOBAyhBEntk
 /33PbECCWXTi5Z1F3YM/TAB9kVLMUKOhPmNh8Sh3aPEdMkVQQz1bizi/AeIyvyttF7pEdgZ0B5t
 wYjpuEJt8UF/EUmng24susmcFZ1e87Ih3bZfPTIL+L6u6bDFWAXPw58bNNRZugnC+RA4eR3K
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_07,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=748 malwarescore=0 clxscore=1015 bulkscore=0 lowpriorityscore=0
 mlxscore=0 suspectscore=0 priorityscore=1501 adultscore=0 phishscore=0
 spamscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200130

On 20/06/2025 13:30, Mohammad Rafi Shaik wrote:
> On some Qualcomm platforms, such as QCS6490-RB3Gen2 and QCM6490-IDP,
> multiple WSA8830/WSA8835 speakers share a common reset (shutdown) GPIO.
> To handle such cases, use the reset controller framework along with the
> "reset-gpio" driver.

How does this handle the fact that resetting one codec will also 
silently reset another one?

> 
> Signed-off-by: Mohammad Rafi Shaik <mohammad.rafi.shaik@oss.qualcomm.com>
> ---
>   sound/soc/codecs/wsa883x.c | 57 ++++++++++++++++++++++++++++++++------
>   1 file changed, 48 insertions(+), 9 deletions(-)

-- 
With best wishes
Dmitry
