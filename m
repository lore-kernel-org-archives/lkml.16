Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1ADF827CCE7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:53:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747248816; cv=none; b=NqbIFcj544IYeYZpC7GJzbxz0/ovFVPEaqny6gIdbxnwLkhvhsDimYgJi2D9CrXu5BTPBL2r/t5PqdG7AFXZ/sFticj7LYPa+vl33bfDR6Vp6nQXMWlvO6qdjU1i2d0tCz/KIYV2BNGo5kqbZjh3tXnoUnosnonBjWSSm+wMoiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747248816; c=relaxed/simple;
	bh=DenyVCoE0RAHWPP7ykajv60a+GLIC/b1a2OG1bz8byA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hcuSL11+bZEtxAv7x6ZEo+GaMjefY9yHeJNgyQ2BACdW1Edl80WIg/4gcb6wZJD8pMebV7U1am35RIAOV2HEvEs8eUCcp+YrySqYEZGB/RF7PGNI4WK8U47v2OnVmq628+r1yxCcqgEtB9GSZmqsDp+FAvFXfjv9T5PKs4GbuQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LGN1rBZc; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LGN1rBZc"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54EAugCw020138
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:53:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=g1u9AjxY4YHd0zzxyGQLIleU
	CRHdyFyktyL3hnCDzbg=; b=LGN1rBZcyZ6Fb2C93lULqvsXn2Y7OCTNQy9zeHPd
	3qdtlX2oRYfQ836qLHSHeqOUfQJNwnSgjTd8U1YkeMFNjP2EBX/xUnZy1edXmsJQ
	jUNqnPDYUlQUx0CA9ERhLlBCZBx9FC/A8p2X1pAZAlgHeR6gNXWXwzJ13PktAxup
	GMtgaSTpOJ/KzrkZ2OT8gZe4AF3+pBsvW9R/dCK8zWoXbxOP7hA2Bxs+CLCO8eXA
	MAlETUQyovpborVg/Imd1x4aDv0fZEIUEqp4aQWZeSQC83jbMHyUzIm6+fISg/Mp
	1/bU3TU4KhGKi2DymZV41g9xCmMtsL95ON0wF5/LtegNug==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcnkr3x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 18:53:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c5e2a31f75so19337385a.1
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 11:53:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747248808; x=1747853608;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g1u9AjxY4YHd0zzxyGQLIleUCRHdyFyktyL3hnCDzbg=;
        b=FFOHspk3MoNRvX3ZKAckpoIztjp/MaTMiXSe/e0q57yXv0iREVGRuRFdAbK8/XbgZY
         MYVryOu5cP0BIwgjPUjnCPnGDRkVSwB+Vy4Ica0y7BEg6HzA4mcovmujWcDz5DaWY3K/
         VI+BWNFKYhEJPfI4EhoncMguCq5/Vy0l1Rsv0mzYlxLVTzUBZbElI984CvaDPChg0q+Z
         oWKlgWYK7x87RPL3O1rai/9UJpqf5nhBVFQj0eEF4y1iYQiJQFOd1+1pEqxH9Vp1nfBc
         ZA8/uarKTc30W23DHsFRSkxvb0ig9CGB14pgcPDgoF6A5kToKB1eHR79Ow+eWstr+Kw3
         Owsg==
X-Forwarded-Encrypted: i=1; AJvYcCUNWuGrx/MTkrJguPKqU7a/lTPAF8mv4N+SEUowzgX8g1NyCvDw6RQDsIfIGWzJb2TBZdfTkT/E7JvXv6g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwNIrmA2tvcu7/U3ff/iH/gAG4UxVutL1eDs/cQdpIlU0XHtgdK
	MJfIFbRYI/OZWkoT//D2PX+kueNiu88iPHowTUASCOpLkoZ9d4bS7YomGurEYFrrl2mrCxjeEeb
	gbKwvErV9/wzxMwr57e5Wm9vADbSXqFNIm8YKHEEKO//sD3hIYin5j4szmQF1SGc=
X-Gm-Gg: ASbGnctr8OC5/mJQJGu5ov8ZxeK5C4TmwTwFFoBu1LsrHcfy65/aCwTt3Vi0LGdQXch
	Rs4cPo0vAOlGOrLzXssJ1D7dGTaquIzrNOAm6pwBe+Vk1xF/q4UHRrYtWdygK/vMZOQjbNrAxgz
	eO61FEhKM60br9jXhPhAiuLJKrp0HJiWddZ7iZ086ls7JAhzhKXCyQzRd5KqQiNUc9YV+LYrzlj
	UsjyC39zMFS6xI7fDqm0BGsd+cLj8BoR66RNJGN53BSGGd1TA+8Of0SUH5JKzNyFyRpt7hcP/WQ
	TbVyIge0eY1FN+5xgMGoVsQ63Ord26w9kv0mpbdKCavEV0zxcUYzugPHmXyl+xWPSUs5i+KUpj8
	=
X-Received: by 2002:a05:620a:2685:b0:7ca:f021:4d3a with SMTP id af79cd13be357-7cd28846e89mr557328685a.39.1747248807895;
        Wed, 14 May 2025 11:53:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEni7d5kUjD2KP2PjQKe+EW9a164yH0fjztcPSlhC8TjwdgfR6PFawkMxitDxR1Q62D/acBqw==
X-Received: by 2002:a05:620a:2685:b0:7ca:f021:4d3a with SMTP id af79cd13be357-7cd28846e89mr557324885a.39.1747248807417;
        Wed, 14 May 2025 11:53:27 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54fc64cd303sm2361639e87.245.2025.05.14.11.53.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 11:53:26 -0700 (PDT)
Date: Wed, 14 May 2025 21:53:24 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Srinivas Kandagatla <srini@kernel.org>,
        Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
        Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        linux-sound@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [PATCH] ASoC: q6apm-lpass-dais: Print APM port id in decimal on
 enable error
Message-ID: <xtq5rvhihppgmi47sihvz36k3t5zrj6lmuskoevilzdffrode7@nlxr4go7hwo4>
References: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250514-topic-asoc_print_hexdec-v1-1-85e90947ec4f@oss.qualcomm.com>
X-Proofpoint-ORIG-GUID: LS1pAlkJRh5XuTl24efnAgSVQpvv4EbR
X-Authority-Analysis: v=2.4 cv=aIbwqa9m c=1 sm=1 tr=0 ts=6824e6ad cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lIfUitz33hkrLK1uG6cA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: LS1pAlkJRh5XuTl24efnAgSVQpvv4EbR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDE3MiBTYWx0ZWRfXwSeA7HSs6XSA
 NDft2MXVhQraNi9XTidBd7PLXK5PB7quU7+gqK/zRyF8/dIOztF4eNNG2FuL4UlZ3E6fqU1ggaG
 CY16sisGIyuoGsczPqiZm3JypKQnZ4tXvMMp9ZcRyx+qnENWoargwBYOPjWAjUrKNnH1SQgZrf5
 Gv7A1862sS3GD0Ut56Z86nnDNYSTlPXx3C/Vq/IGCWX639Y+WLNmLp+Zyv08wEIzFavyJZXNUGw
 +1m3NmpR6PpCh6iBn1O06OMTjHr5y+HSjhwhDjuQHt0jWv3MyKzqSXHFC81ThptZR0yID9xqblp
 crLWFD5k0IJ5OoS0gLKCZ2QOHliqA+wLVRsncgllR1jQda4FxyLjarPG8fDhbIZtInP8Si2QUqx
 LuSvpJivq1bcursIeZYJrhFg89v+UuP8UW6yROfgwQeKUNzH1PudJ6OFPvhNo4L3HdWqtCc1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxlogscore=743 malwarescore=0 bulkscore=0 impostorscore=0
 clxscore=1015 phishscore=0 suspectscore=0 mlxscore=0 spamscore=0
 lowpriorityscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505140172

On Wed, May 14, 2025 at 07:53:38PM +0200, Konrad Dybcio wrote:
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> 
> Change the port enable failure error message format specifier to make
> it less confusing.
> 
> Take the chance to align the style ('fail'->'Failed') while at it.
> 
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  sound/soc/qcom/qdsp6/q6apm-lpass-dais.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
