Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E2119F40A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:18:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638723; cv=none; b=sOnDNdpLQaN39qyNAeCROIQeNYmQV/eXCEuUBpGNheNZVZ+A2yics7hlZFIt/59lkOil6sPDeueEy+c+oS+kXYZYIzPvw+6Gac4gbeHtjnQC42qaJJNmBZBei/04fQzg5YOm9f7obs2m5vCyxi5vZD2RHwuigPxq99w1S5EhMyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638723; c=relaxed/simple;
	bh=yKb5SrhL6MrA+CsE4Jh/Jd1VRcCRTY2ajGhaIxgCk1g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XbtdPRpqf3u8NI6ku0FdZ2OzisxcRLeDTi6XXDglTnOXXVitVhG2oT7El3N9p1C93u7K9KpOgJ8PtAQnQsFVoKI7uOgZ9c39fH7FiASitauAkaSXDvfaopAhU0A+Bx2eaR47aptgnnnPoZ1w7IssolBEeF6FvUuqnDGUhKQcrW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pNsLn6uq; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pNsLn6uq"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56479Ecc007218
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 14:18:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=xREkybw2FDzvYMizFF8rWZ1X
	RUqOCyiP8R0mJaXN15M=; b=pNsLn6uq4RZ3H8Q+RCuMq1AJRZwDznFhrdfcmATY
	gVY30zS68KDJfwKvCDEDfRmOZyThi7JVmemTaMliFF7SQ9xhDy7/opU2X+/ClkTQ
	tAF0Q6v95JKP28JtR2SIdTGyMLIF5srt+Rb78aKx0B+E9J/87uXAuuAf/2eJQhaj
	aVs4DO9cPT+g1EZl4vw7VojK6i9B8TfjSQsIgzRYdm9uzl6clfl3+VNdBhJhZ0oV
	B1Eeue3cbvuM7M9Bti+gMhlBnooRtIZnMqEf4vig9NyfiJw1Vpg6mBznD5I/Wah6
	nIqf4jHApFVzOToP5D/zKVJyvKdmibkMA4Ipb0OROIUSCA==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47kn5jrrkj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 14:18:41 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-40b9377347fso926773b6e.1
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:18:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638720; x=1752243520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xREkybw2FDzvYMizFF8rWZ1XRUqOCyiP8R0mJaXN15M=;
        b=VtEQZ4kCK64FF6K+9meH75ZyrKV1IbDrtSIzVfp+385BFWNmuUeqifhHNHtTYtkTex
         dRwBGdiFAFfqtpsvfgGWpC9UAelxSH0VeWJLa7zw56SaayRzX4Oq4Y9jsak4+9gGETAE
         X1UBNQac7S9x2UHlIgREkQ3SgYxe0qYlG0wBbn6tCncztTNU7leVSqHhvhkrSVwWh64C
         cxxdoLqJghLwt+D9FaHusJZkW0OwNau+kg3MNMZgGPnptniHk35agQrHfJ3MrJYjFiLL
         QYZXu/98p0FUSmX5yOKNgWJUFpCAQzuJBQ1xZP0BKfs93AFbxHbw2nAK1YKSucXevhrp
         wtsw==
X-Forwarded-Encrypted: i=1; AJvYcCWAoatqEu23vLiFS1ZHL3QDxKDjgfTVmdSbbj2SwiservRnd81JxM77pQn0ucLavG7EXnG8cUZPd8PEw04=@vger.kernel.org
X-Gm-Message-State: AOJu0YytFdXYS6Rsq5/y+hA6IMr67Z7B1OsUX/5SCJ5H8q/q/S+2tPvU
	GmbRl0kb0M5IYBof6Xpjq2X4hyyNgNECA43HukDJrXGQc68M2e+I4BPeJXRVAow5VOR1ex8Sui0
	3x1LZB0ouAqINZgWQsnfXmFglYruSUrzhkxz5TU2Lqgscaf96UEiwrDOjTG6sBU1PXMdbtUTtJX
	tsAw==
X-Gm-Gg: ASbGncslMp45KKckPzT/zzKy5u4S7m4O0dazTsMS5e6afYolhBwjOgxT/btsiOJ2pXi
	jHHSyP/gtr9zezdoHOjAiKwafI/M+g3kBqoTzxfPiAjfBOIP1TChSPBl8ROk6kZvgO6RO1vBjjO
	Z3bZkD98Huo/2cG2tS8XAt6sJZn3Pd52+MCwfpzv4k6xdbJVCZbrbbRQ1rivWbRp5iaRvYJjquU
	kXXS+YuONYVF8QQeK3qgbuptHzNwLF8fB/TBamtzvoVX88I/vrOXHHyN3K/fsMsftO5dzFu/NnQ
	5nUnaM1RXItxX93YkrqgXuXSiLPy24DtiTc06HIUcFs8xvL3ssK6h5+1Kef5REXQfB6m9K57Zim
	ngS3JLddneWVRtQZsrSr7xA8R4EU1+aSgIhI=
X-Received: by 2002:a05:6808:1918:b0:409:10a6:41b1 with SMTP id 5614622812f47-40d0444d824mr2216336b6e.38.1751638719996;
        Fri, 04 Jul 2025 07:18:39 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE55trtrcvfMvQ50U1in5p4/u5VIdRpePmzlTLLMw+K1L0TgUF2JLfaCgovy4RVVDL8Gwf5PQ==
X-Received: by 2002:a05:620a:8014:b0:7d5:dbdc:ceef with SMTP id af79cd13be357-7d5dcc9a32cmr410173085a.18.1751638708650;
        Fri, 04 Jul 2025 07:18:28 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-55638494e29sm262902e87.102.2025.07.04.07.18.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:18:27 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:18:26 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ASoC: codecs: wcdxxxx: use
 sdw_slave_get_current_bank helper
Message-ID: <xglngdprknerf3uoeixiocagoml26kw4zcwrnmb7c25m3zt3ol@2vnglqifcb2e>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-5-srinivas.kandagatla@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=KtJN2XWN c=1 sm=1 tr=0 ts=6867e2c1 cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=XXM5SuZbuiGnn3J7RH4A:9 a=CjuIK1q_8ugA:10
 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-ORIG-GUID: pHOaaAPwWovceO3SlBUc5jtAxAlCUdmB
X-Proofpoint-GUID: pHOaaAPwWovceO3SlBUc5jtAxAlCUdmB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfXxuU/0iCEbsgk
 NwsCWXm7ZBjg6h2KfnoCiZnOB2tIFKMBinuM57jOPr96dmppIFnNLPI8Csm7n6D3umf1E/W6LkV
 g7zup4g3Sfgzr3fo/7N4FpfYen8DMsvDhM6JBtiweWuoSNNydQk/bRIEPSJULS5U/gJJ9LtHB5f
 CJgQ7U5lZxfTODooVdqAqdP2RzLhVagffn6Bgze23oxtRlAuI2Jz+tBqwudKorfEN/oikMswVzf
 ShXLnUE4e5toDR2PBfjc7hRvNqKfZcMGIkP6ZEhRo84SQR2Eipm2E7DptWFX3lPtXJopnkRgddc
 D5pMYRKlzZEhAzCO1fDFDB7hlGRsrFMeDwrtHhYobIj5xLWHrFOcbbPHXygxAhDIP0okHhCmZ00
 JZX1w8zSIM4BkOd+tUjIbyAt8AZ4XfobWa/TiWY9lCXlVSNtZc+idgyYsOajTFZSg6Jk0Hko
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 mlxscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 phishscore=0
 clxscore=1015 mlxlogscore=536 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040108

On Fri, Jul 04, 2025 at 01:12:18PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> use sdw_slave_get_current_bank() helper function, rather than duplicating
> this function in every codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd938x-sdw.c | 10 ----------
>  sound/soc/codecs/wcd938x.c     |  3 +--
>  sound/soc/codecs/wcd938x.h     |  7 -------
>  sound/soc/codecs/wcd939x-sdw.c |  7 -------
>  sound/soc/codecs/wcd939x.c     |  2 +-
>  sound/soc/codecs/wcd939x.h     |  7 -------
>  6 files changed, 2 insertions(+), 34 deletions(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
