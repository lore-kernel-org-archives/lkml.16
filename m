Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D8DC15442A
	for <linux-kernel@vger.kernel.org>; Fri,  4 Jul 2025 14:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751638697; cv=none; b=mo/7vB87nPmZYs52T+gOhA49+AC3e2tCe0rR0dyjD5N+2nMcB7/gM4QknUr/YU+6lpu2Sj3huk8H1lTy+gAwEm8cjAkeJSwWLsTMWqYN5uxPcQwVZl5MaVPSIVwpWms5DlXcFacfcYi+il1TIbK9csTv4OWM05rkxNE0O8KnhX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751638697; c=relaxed/simple;
	bh=7Khl+Tc2okM9Yl7n5jd72UL+nmmwtHnAzlrm+YmIZFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dmi12KSgITR7gAC1okEdfkvlkOAi7adfDM6XnHxWR6UUoYkdbW3bMg4hDF5YIRC6BvqGNklxg4OqC0KlkwGqfVOevZTb8RFktu1C6xvchE4yGCBCkV86MYsYZx5hlRnUJgA8vFRjKRBR2zmbqOtCBqMJKIOWlvsC/oqhoUYi2CI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bSt9JMbd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSt9JMbd"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 564Dc43P018851
	for <linux-kernel@vger.kernel.org>; Fri, 4 Jul 2025 14:18:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=GBBzmHljWXgoTLIZWSViaVzM
	iA3PILweDxY7boLYrzI=; b=bSt9JMbdcDrVUARY0tqf+hwxdl+8IL3meMTSMAfj
	d2Xdo81IhelAIgOErpvRgOkU/uBOA1Q8LPq30+ohYlA6/qs8vROKVhNWerPKm2ds
	gt2uRFFFyxxDqH3ZtEK4rorDDjpVdMcNU5/pq5I2wtHZyNg7ct0F7b14Xn6M5sXb
	haR5WHx6cSr2pmpU7CA9I68ISr+WHS2cxBU2aYydto+zAP+ZCu0njCIwz+MpinBN
	DyVKilQgS66pA7sTiTpBq4SXWjFkEzlpe/JnpQhfYM3ciBrTOeHYq3ZhpasyuFRk
	0vuQktiy94Uc7ukA6DqZT6Ow5IxSAjKPS7yBzFiFURBhBw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47j8fxv9j8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 14:18:15 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7d099c1779dso148860485a.0
        for <linux-kernel@vger.kernel.org>; Fri, 04 Jul 2025 07:18:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751638694; x=1752243494;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GBBzmHljWXgoTLIZWSViaVzMiA3PILweDxY7boLYrzI=;
        b=MWzkTfrNgW734fKpZnlbsfvblPkR2rIJT6QVi6QxC5M2Tbf1Tn1Tw9WjYOdDl2vKg0
         VMx+YeVWeQGtGOaP5pUUE6OdGSwYg3oKj0xZPruSsEgjM+4dVSDeVaRxXZdXUOzWQgKw
         Qk9nDxQnClCXWF4YrwW0kW9a7AblRHQz4q236cgGcJv/OXglsEibz1kAHPEo658GwhNt
         90/yM5PXr4ggv+3Fdxs+DzmByzxtYRBRxFnztgdNzqM1UQIzfPfEVeyM+ikv0n67388H
         UCUPllBPTPm4RVnDGy+Mz2MjV0W3HKZo97/55fEq5nRjTL896nlB7xvqjUJYcVAT3Nff
         Qt0g==
X-Forwarded-Encrypted: i=1; AJvYcCUNUrCQgTvWsqZDf8vng8fuU2AY6GRqj3sDLbBJI0IDSpuF/+3DnNA/IiHV2juH2Iu2Xr/ME0c9uHot8A8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyVL9esJEWpMulMJwcJEE40lxJJmNMSFqAVHJFEKhzZzqVVvZBf
	p6a+yZzQiLFRTwP1i4SXmj79ofyrKqRbw1QrL6Lb/KM6iLJaVweCULHwM35b4tusNMnhfTaRZlv
	hE+9ojUN5jSb5L0G7u6n6R82nuaFPaa+daNlk4YGgp4s08eC+WFuUZy620ZGZGGrhLPw=
X-Gm-Gg: ASbGncu6a/3ZL+22IQvH119mhi+A3Bdtb05wKcLCY/Pbko9eUe8RTQ/ua9oh+gRfyLw
	dptLDH8Ygvg2ulgptrj7LOCHLhtQCGP+crcopn0IQdNAzmkWYOuGKfHii32cyU6r7dpsxOOpKCT
	HTxfB0mpe7onbINIZ+94YS5EGoGwoz4tj3h01lDSzhuqJCpx1TBz94Y05OWChOfrre+qL4Qd2j4
	0+0X5AaU2bOyTciBoVm4ao1FDkPEU1oROqKlnxFbVYancBInHdkB64VO4DTxpJ6xR5af+bP/Zof
	YhPbhbrlLOIJpHO5UO5C7YF8T9lRAlVJXj6mJTmrS87PLuWhhtwzwb1ZR/GUlJmTWDHP9fSZ0/9
	dQ+mlnHR2efwlbmUhqPSpp6AgfrDZBU5Qx+o=
X-Received: by 2002:a05:620a:4403:b0:7d4:2515:6aa8 with SMTP id af79cd13be357-7d5dcd248c2mr370970985a.43.1751638694158;
        Fri, 04 Jul 2025 07:18:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGLHIXjNSFpNrcbwpOUhUE81GvbckTMere4MIy6Edcq4yoBKqpL5QpPb0hH2I887hahpywyeA==
X-Received: by 2002:a05:620a:4403:b0:7d4:2515:6aa8 with SMTP id af79cd13be357-7d5dcd248c2mr370965285a.43.1751638693499;
        Fri, 04 Jul 2025 07:18:13 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-556384cc5c5sm261767e87.241.2025.07.04.07.18.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jul 2025 07:18:12 -0700 (PDT)
Date: Fri, 4 Jul 2025 17:18:10 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: srinivas.kandagatla@oss.qualcomm.com
Cc: vkoul@kernel.org, broonie@kernel.org, yung-chuan.liao@linux.intel.com,
        pierre-louis.bossart@linux.dev, lgirdwood@gmail.com, perex@perex.cz,
        tiwai@suse.com, krzysztof.kozlowski@linaro.org,
        linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 2/4] soundwire: bus: add sdw_slave_get_current_bank
 helper
Message-ID: <jl2i62jhzfetyy3tc4lmo5cdvjn5xakawyhja3tpwyu4z3ksov@k7ahrflfmvqi>
References: <20250704121218.1225806-1-srinivas.kandagatla@oss.qualcomm.com>
 <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250704121218.1225806-3-srinivas.kandagatla@oss.qualcomm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA0MDEwOCBTYWx0ZWRfX0+ufdzmV/ZYn
 5AyGq+LiEvNjPSvLNn86+H5w+C3Ucb8I+6/OcPrxgHYQvwyCAReo8v78UhmvV7Suny3r4Vhb1x7
 1pq6hfW0LmVcoOyS3o12ywXzUyr28Y7NeCvOnlH4Sm0SrL8R9Ut4vuvGe0/P0sLsGQhd7PoYWdO
 TGqntqlb3160bEg3Mp4eed1CzZbGNDmIfB9F3JUepYWbmmHkjEtmeY8sLgu3BisFOX5ep318wW9
 UgpiRW0kTlJvYpd21SOjC7dGCBSpg3Bbfs60yyCOBCDoyQUyXLQCTPQT9jAWCQCVYwd8qMffMWp
 /M+J/sELieT4e68YR6v1FeP+gO5RUSozsUVDxRJJWDi9llIkDdNPcC7H1ljtDBnNZLJsI3gNIiY
 nFzOaiH8J5vPnocBnhRDDbGMXWq23IxAW6p911E1wVYgUkwTWVDS2JjgP9Uv8K/1hykc/Ycy
X-Proofpoint-GUID: K154zHSyvxCfl2cYr_avvVInXJqZltbx
X-Proofpoint-ORIG-GUID: K154zHSyvxCfl2cYr_avvVInXJqZltbx
X-Authority-Analysis: v=2.4 cv=TqPmhCXh c=1 sm=1 tr=0 ts=6867e2a7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=hef_X4T0R7yqAl_WHRIA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_05,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 mlxlogscore=673 suspectscore=0 adultscore=0
 phishscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507040108

On Fri, Jul 04, 2025 at 01:12:16PM +0100, srinivas.kandagatla@oss.qualcomm.com wrote:
> From: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> 
> There has been 2 instances of this helper in codec drivers,
> it does not make sense to keep duplicating this part of code.
> 
> Lets add a helper sdw_get_current_bank() for codec drivers to use it.
> 
> Signed-off-by: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
> ---
>  drivers/soundwire/bus.c       | 12 ++++++++++++
>  include/linux/soundwire/sdw.h |  8 ++++++++
>  2 files changed, 20 insertions(+)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


-- 
With best wishes
Dmitry
