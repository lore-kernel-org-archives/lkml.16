Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB53521C9E0
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:33:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748511199; cv=none; b=uPHjOouJGAZ/ztVi6O317vahMU/tQeKJa6+GM2kRuANLH2seDQvaqndjFNGfYDpBaFOJjZ0utcljyg8/ck6f5bbnSFbUxJlcBEAkWpVz7coKvc6U3bPIrlJFd1/4Tuz99Bd18ISG8SGrGZh8sSAv26XoMyMhQlp8K7C9WEjp0K8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748511199; c=relaxed/simple;
	bh=upaHpcoQNaYRpzfjT5IJF09oP9mPC/4FHbCQA5gbkaw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lcLadJUXq1FMqnF4axdVzzWrKSl32m7EUZ4SgcjANGkYgB2JVV85uxt/j6VzPOsxBIeCkaSD1yRsk4AHXexOSXCq1gFOBY2/vvprjInDMY/sJKemnT4E2UMyrkTeMBhKCiP8515nrvLoKtmHBq6AX0KNfxyfu+CaEMkFB7pPNSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G78IVkSj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G78IVkSj"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54T2AfQE028239
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:33:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=; b=G78IVkSjKa2cFUdG
	TQimbwKv8Sbzgk/GS0OyD9/a1LlaBbCdVjBWFXr8yM3OX5WigqO0oMsV+etu5rNX
	ens3zoETm/wB7RwxyKTIxhvivztq8I01kS3KqZT+snFp7srDPWorfR0va2ZokDKg
	mJMT8zgo9xx2YMmCTlkhUmrclZW1LA2x0Gfbrg6xTokzvgIRjMBW9ODBwhrPxNQy
	9pszzhrFoi4zyS6eIaWLsl7HMr9ZnVaDkJ5GEyKPgKRqX4b0O1tYxGQpV+1JBhCO
	IG02JIHj1Bkavgu3tpzrz+jA1y7XF8WpvpifHS3dKvZxXRCH8X4T6Mozc4w9wuQx
	pnqbDg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46w992q9t2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 09:33:17 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6faa53cbc74so12255226d6.0
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 02:33:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748511196; x=1749115996;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=J19CTIdOjN4o9N+SR4QD26ilvGTAu4kkXOBnmt8QyYw=;
        b=OCLqoRrgHlCqQp85I+6z2BYmhgNknbRfFcGbW83kk8WepHO88/HdrmDj+pAoAv7orc
         AaLjoQ7UWSxwK5hsZshVItiT2XaliZ1qbxkP66EodUoVJZM29jnI1rHG0xoDbsksXuh7
         EadbihPynI6lMrEW0LBTUG01NfvntfIblF7k5NaSl9hObuPz4KkOqo1A61s07m//OVhC
         QI8R5vZt9gySs0bpcaO6ezAMmj8Fcy/esuyXXgBzfFDiqXFhB7Vx0u56bVKg0iHJWMJg
         mtuS7KL2u4bb7mji/hxhNFCpp/s/XCL1hUiq9Z3+3jE9TED3SFLAOWzHszkx2IIlt5it
         cXSw==
X-Forwarded-Encrypted: i=1; AJvYcCUTArkKjl1umxzp4BfIPn/Kfuill2LVW/nFqORzPX41y0V741gJLpV8e30EkDJA6vPb8sSZTcfxMu/gi/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YxQdMWMSViY+P2ZVybDl3pHzhtol7l1f9cFCvOCooOyUOLqQdwF
	4BTdxAZfSnQ06zWTRf2edLUlYN0yeDJdWlIIARtasMLxBxC02dxlWkQ/fkqbQfhbwRPLaVjfSZR
	C4MqznbexzXLNnuwq2tWnZ52TqNkdr1CTLBMI02D/URSj+ugLcG5UQCkTVKSQmsijn/o=
X-Gm-Gg: ASbGncv3PonUpeDLfBvKgVAGhO2GoRSPD7JO75/oEmXheHs7XTfYn7do1MObVH6bSYe
	cRKpO7ay0hvVIUN5yHcbTUimzYxem5ACtesOKWxlIaX+izmuHcTk4be47VVOxXugsuClZnemk6Y
	faoiKLbCAOcQmH847Cx/EvBk8AyMz2gcMcS4FIPoCv3ZCaCTE3SE/WS2+QDUQeKa2JxUfmVu6kc
	O/qKS60CYgB+4XRJ0pSq3iXmIM4cPFn7xVVFRj9ywDn8Yin4bcx3CDOcg2YQsjaYsSDPKpcwcQ6
	UfDmv68W7SZc8a2nepA/3+tCDQGCITTe/GiLwQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528606d6.15.1748511195792;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGA79GLpD3HZiK/IRAurUe6TU66mlX4HbtpUZm3DMIN5fjfS4J9m+gB7K+ZJszdXMACo2cUIQ==
X-Received: by 2002:ad4:5ccb:0:b0:6fa:c697:97a5 with SMTP id 6a1803df08f44-6fac841db7emr19528356d6.15.1748511195376;
        Thu, 29 May 2025 02:33:15 -0700 (PDT)
Received: from [192.168.68.109] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-450cfbf498bsm15179805e9.1.2025.05.29.02.33.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 May 2025 02:33:14 -0700 (PDT)
Message-ID: <a4c0d421-9062-4424-a750-ee74e2f0407f@oss.qualcomm.com>
Date: Thu, 29 May 2025 10:33:13 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] ASoC: codecs: More const and unused member cleanups
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        David Rhodes <david.rhodes@cirrus.com>,
        Richard Fitzgerald <rf@opensource.cirrus.com>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Support Opensource <support.opensource@diasemi.com>,
        Oder Chiou <oder_chiou@realtek.com>,
        Srinivas Kandagatla <srini@kernel.org>,
        Shengjiu Wang <shengjiu.wang@gmail.com>,
        Xiubo Li <Xiubo.Lee@gmail.com>, Fabio Estevam <festevam@gmail.com>,
        Nicolin Chen <nicoleotsuka@gmail.com>
Cc: linux-sound@vger.kernel.org, patches@opensource.cirrus.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org
References: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Content-Language: en-US
From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
In-Reply-To: <20250528-asoc-const-unused-v1-0-19a5d07b9d5c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI5MDA5MSBTYWx0ZWRfX4K0g51p5on0H
 JvA63Yb2nfDRYXCi4UxNBFe+C1ZTuzLD3qKv3yDZDM5NJxaEOUkuyFwE4R32+77as1iAaXZ33Mi
 tBNzZMY+A4ug1oPi0w/qxm9um0klwPK+09dcRzY8yAxx9nOvAJHCMsiISsWyTa+AB1kcS+pi2Vi
 edm46nlSAkY7QJbbXnJ6+lI8WQBLKWVAtrpsDian74MQSssNUpAT2oP7vCs3ZXOK2/bBGtsxdNQ
 rCGyljyWvCtYLOuuXXeMGK+/BYv1mVO1lcPDwrdGrrS0gkjHVHqkkIGsVJ9fPWu1D6HM4UkCYSp
 XO+i1w1Qxt5EC3kgpHJVajKZ7DYt/ZdfS7C4/Jk+W2L0LVgvyUusJbg8hJbi5t/2ZV68Oo78+nn
 W9GZxfZtREEZ925+4MdDvAnML4EqWeDrJRNtC13F2XldbdUd0nyL2uV1XMjAtrAKaX+oZIpB
X-Authority-Analysis: v=2.4 cv=Fes3xI+6 c=1 sm=1 tr=0 ts=683829dd cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=ZsC4DHZuhs/kKio7QBcDoQ==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=b5hiRvTwp8EW11ydFUEA:9
 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: bJL83D-q5aN6JzPKEplN85B2MRV40Uzk
X-Proofpoint-ORIG-GUID: bJL83D-q5aN6JzPKEplN85B2MRV40Uzk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-29_04,2025-05-29_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 impostorscore=0 phishscore=0 clxscore=1015
 lowpriorityscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=965 spamscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505290091



On 5/28/25 8:59 PM, Krzysztof Kozlowski wrote:
> Make static data const for code safety and drop some unused fields in
> structs.
> 
> This is based on for-v6.16 branch in ASoC tree for context in wcd938x
> driver.
> 
> Best regards,
> Krzysztof
> 
> ---
> Krzysztof Kozlowski (8):
>       ASoC: codecs: Constify regmap configuration static variables
>       ASoC: fsl: Constify reg_default array
>       ASoC: codecs: wcd9335: Drop unused sido_input_src field
>       ASoC: codecs: wcd934x: Drop unused num_rx_port/num_tx_port fields
>       ASoC: codecs: wcd937x: Drop unused 'struct wcd937x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused 'struct wcd938x_priv' fields
>       ASoC: codecs: wcd938x: Drop unused variant field
>       ASoC: codecs: wcd939x: Drop unused 'struct wcd939x_priv' fields


Thanks Krzysztof for the cleanups, its surprising to see so many unused
stuct members in qcom codecs. Did you use any static analysis tool to do
this or was this manually done?


--Srini
> 
>  sound/soc/codecs/cs35l36.c        |  2 +-
>  sound/soc/codecs/da7218.c         |  2 +-
>  sound/soc/codecs/da7219.c         |  4 ++--
>  sound/soc/codecs/es8375.c         |  2 +-
>  sound/soc/codecs/max98363.c       |  2 +-
>  sound/soc/codecs/max98373-i2c.c   |  2 +-
>  sound/soc/codecs/max98373-sdw.c   |  2 +-
>  sound/soc/codecs/max98388.c       |  2 +-
>  sound/soc/codecs/max98390.c       |  2 +-
>  sound/soc/codecs/max98396.c       |  4 ++--
>  sound/soc/codecs/max98504.c       |  2 +-
>  sound/soc/codecs/max98520.c       |  2 +-
>  sound/soc/codecs/max98927.c       |  2 +-
>  sound/soc/codecs/rt722-sdca-sdw.c |  2 +-
>  sound/soc/codecs/wcd9335.c        |  5 -----
>  sound/soc/codecs/wcd934x.c        |  4 ----
>  sound/soc/codecs/wcd937x.c        |  2 --
>  sound/soc/codecs/wcd938x.c        | 18 ++++++++----------
>  sound/soc/codecs/wcd939x.c        |  2 --
>  sound/soc/codecs/wsa881x.c        |  4 ++--
>  sound/soc/codecs/wsa883x.c        |  2 +-
>  sound/soc/codecs/wsa884x.c        |  2 +-
>  sound/soc/fsl/fsl_asrc.c          |  2 +-
>  sound/soc/fsl/fsl_sai.c           |  4 ++--
>  24 files changed, 31 insertions(+), 46 deletions(-)
> ---
> base-commit: 22d449bcd69e66f25fe847b678738950dcf9301e
> change-id: 20250528-asoc-const-unused-1e39b434e427
> prerequisite-change-id: 20250526-b4-b4-asoc-wcd9395-vdd-px-fixes-0ce64398f9cc:v1
> prerequisite-patch-id: 104000f7254b9cc81be49af9ca584544718e52f1
> prerequisite-patch-id: 230fcd1b712c5a3199e7c9d8250e98e5d55c0a40
> prerequisite-patch-id: ecdbe74955eb7b710f72af1e3cf32ccac52890d5
> 
> Best regards,

