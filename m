Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A82F52868B
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:01:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751076110; cv=none; b=Tvuvmjtg6gUxmeoMysY38ZE0zf933J+A95tDRXpgHNewjNHtVZSdAPhmm7NPe5IJn4fPq/51R7Mr++2rmOLEfx8ru3n/L5Rf8l3sh+fYWyyN/PoUkms+S0m6/inVmNdLE/clw5wZUjGP1Fygqwkq51jDshI5t0niPZrDHPcMd5A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751076110; c=relaxed/simple;
	bh=YQKufK5B37dPWkLPPT5+YvQ4CcXXjfbMBWtmXldNfS4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L7mOPbf+/q7K0otEZG5rC2vKM3gE93RoYiQ7dIxm2VALBK82RYmSFgSl1rV3u4ZSFKLCeOH5+QFbYcZLjIS7LsmqhPN10mFt3lqF3IgSMvwwRgsOF7agPoyGvvLVGynuTVoM3UmNuRVS+KdhllMfsmx4YQ9JTxZK1lqu8l4wOj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jl4H4ZzU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jl4H4ZzU"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55S0DJal009178
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:01:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=wOafyhq0+mdzfsSrGok0cyzw
	J2NOz0wUDRPXuIS/tqM=; b=jl4H4ZzUqL8foLddZfS+0QS7JAgWW2lnfJFviL7a
	trNiy6130IGXaOMhNSXB4KeuYUmZ/0SliN3ga2lNtalyf0JiXw3ftzJxfe14GsSq
	/xCKoFa5Gk2MwwS/onuRFyd1IL3CnQhnmM93uPW4niHWaJlUY8OYfb559ZwwCb3C
	QJCW8/Hbc0ZslyPuPa/EIH4//A7gTEq5HfT668mwzA9E3v+pm+LwUJCvXCJsFs0T
	a4dt5a5rpctekYlp75ek2fnort4K92p1ubtaR4gKT0BlckItkOW79ede3BbuKSkL
	8GozKSpJJR/ayFmKPiPK+pzwTqzbzeFzEOS5llzwqQ482w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47emcn26nx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 28 Jun 2025 02:01:48 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c7c30d8986so732893685a.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 19:01:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751076107; x=1751680907;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wOafyhq0+mdzfsSrGok0cyzwJ2NOz0wUDRPXuIS/tqM=;
        b=lXzYcTyb8H8cOdfP9RmtDOJNdH9yEHzuAP+A+5CosVVdKHFy7bOd1t7JLOepw9rs74
         rIYlvtVMUVmUExD6/RvlLn/7DBVMsapdqZ8B2z8jORutU8QZFehYPQBZNppJHf5flCBY
         mMA1HBAXVsmlo0LegX1UIKXpOAQl7+Jd6JNPC6lF/iv2XW7cepme2wUQJo5r4M16btIg
         3uq3gJvGhwiXAq8H2hBKYaQICVy4KTiEU7dtDcL02Ly+W85oX0aI1glHViyvLzV6FrKo
         5xgSJ2kt6ka2AsD/0LZHVy3xIb4PVkv7c6Ea6m/jE/wwPywJwbQ+IqLJK80igrqELnTx
         IVdA==
X-Forwarded-Encrypted: i=1; AJvYcCXjd1ZTQiq9gnj5liBXwZ5+fQHfnFF2KCC0Qbx8LAn/PFvu55nlRysI/9DxOawebLuYKmKJ3ZnW9TAjsXo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1HKuP/Hi44qR7IiTjMzN2tMDuBykIlFudBk2W0taiEJuO+RdM
	TtDJ7CxDX2lBSNxDe0r37tLJpmvNkPDLbDaH0UK/rQ2MZAcLw/aL8SmZdtpbC2vFVn0HHoIeNI1
	Vr4feDrU9qtFvQMr80wnoLmNlVv6PE0O0w4qT55UtlOpXKzrpZiGlOHpXYj4yjO+43ig=
X-Gm-Gg: ASbGnctNK92KDY3BibrIwCQeRv8JKrZSpbyR0LxbXp7bNQIKvP1AirbrFeqIEv35PAg
	X9LRS9twACsc9oq9QhcCPNIqKtuRxgwLri6H0dCHK0EvYnno/iW5hu4s6zyXXVi4OXlvo/Kodry
	PQgFw1BQQ3AWI+XYS2amUus8sqFG5RJDqc8tV647udX146Y5lnIxgqSA2IIFWZiGMHoAk9Jswtv
	qheux0ns5pnB/oNdEcgcnUfVEfRnN23FRszr1HwG8Ha/HaSCJNKT7F1dAtG17NqughrVmGZIYhE
	qhyAVN9v/R2Ti6hG8+VB2cT0Y2QjIx6S47K/N6oc879FNhq9dy5B8kLvUcDVjKjdBsp3swoD0wL
	JnDcH7BhLZUgjd85+EA08fPbEnlxWntdX/Q0=
X-Received: by 2002:a05:620a:25ce:b0:7d3:8d33:f550 with SMTP id af79cd13be357-7d4439a6a1amr774761485a.42.1751076107338;
        Fri, 27 Jun 2025 19:01:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQy4V3LUj6cP0goe39au344YNAhL03BMEkFdvQ5aKk+4bNvTbXNYZ2qFiGlHxlzTCN5cXEFw==
X-Received: by 2002:a05:620a:25ce:b0:7d3:8d33:f550 with SMTP id af79cd13be357-7d4439a6a1amr774758285a.42.1751076106960;
        Fri, 27 Jun 2025 19:01:46 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5550b2cdce5sm645109e87.164.2025.06.27.19.01.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jun 2025 19:01:44 -0700 (PDT)
Date: Sat, 28 Jun 2025 05:01:42 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH 3/4] ASoC: codecs: wcdxxxx: use
 of_sdw_find_device_by_node helper
Message-ID: <skelt3xhnonz2ixhik5dvrmg5tpquoxmioeeem2gs5espqcykj@eh47grxbpvuu>
References: <20250627155103.441547-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250627155103.441547-4-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250627155103.441547-4-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-GUID: aWSA1Ex7yqUIIG0rAVu0Hos0joek7Vwd
X-Proofpoint-ORIG-GUID: aWSA1Ex7yqUIIG0rAVu0Hos0joek7Vwd
X-Authority-Analysis: v=2.4 cv=J+eq7BnS c=1 sm=1 tr=0 ts=685f4d0c cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=XXM5SuZbuiGnn3J7RH4A:9 a=CjuIK1q_8ugA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjI4MDAxNCBTYWx0ZWRfX1lWb9+DMqhFK
 Sl7+k5o/FxH7xV2Y/RmIJkJ9kfiW8NTnEHwwJZ0McVH5tDe/5OgiA6Facx1OTtaAvcaf5qpu8xO
 cUCqFxMSXMS+awf1pwo8uw07QteS4ZvNrJGeVPIZqxGDwMp0ch7/E/+sFYDHPjXStL+g1wcNm4M
 xM0yDpdP/yJMtrlIC3jZM00dipJRmtHgXkC6RxxaCB6gEMseZnmPCAT3Emu8oqEfz78ZMKHUqBf
 IRn88ku7/AnqUM2lc4CR0kSYeiJy7MUufM+NuJ5YtBx9XpffB3eu3TtIdFigpVT3BiU8Hfe/DOQ
 ew9bt98gzc1iVxqFU/Ku1KE1vvEyGIvUavhuBcF4tmMusr2xiVYJ05NM2QW/NKtbXPdDSgRFqsy
 FLXy/oMAwtDWWjikcRrLfooQnjCzwyIrEGRpNwgrr4QkqVfdyn0aeUC7+wA37nBWsJ9XK686
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-27_05,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxlogscore=509 adultscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 phishscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506280014

On Fri, Jun 27, 2025 at 04:51:02PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> use of_sdw_find_device_by_node helper function, rather than duplicating
> this function in every codec driver.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  sound/soc/codecs/wcd937x-sdw.c | 6 ------
>  sound/soc/codecs/wcd937x.c     | 4 ++--
>  sound/soc/codecs/wcd937x.h     | 2 --
>  sound/soc/codecs/wcd938x-sdw.c | 7 -------
>  sound/soc/codecs/wcd938x.c     | 4 ++--
>  sound/soc/codecs/wcd938x.h     | 6 ------
>  sound/soc/codecs/wcd939x-sdw.c | 6 ------
>  sound/soc/codecs/wcd939x.c     | 4 ++--
>  sound/soc/codecs/wcd939x.h     | 6 ------
>  9 files changed, 6 insertions(+), 39 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
