Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9E637261B
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 14:47:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749480474; cv=none; b=LHpjZV+SzHh16BXd7HsctA118ZCXLhj0tl5dwQUe2rYdZTvyCd3U6H1YuFzC+5d1vHxZL53pl7VwqBCb9jBNQbL300+aq/19+7ML2+XSgAQl1az4XSPbMuB8DUbrBhWGT13y6uXVCNihg8g8QEv7jzU1unzqoeUeC3AKXDiPBHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749480474; c=relaxed/simple;
	bh=t2H/PV27I+6OsQidRIxbGZeAfK77X/pAZrruQSHwRVc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UDOZ7ieqzCyVTyr/NHp/x1jbX7E1a/Li8xongRqtX5yREcHgcJ92bsiDeYFECyJUzh+c9cyh7cBmNhvcOExglot3oFG9j8Bb3iprE0pvp/bPOrveqGRsKYp66Ev8Du9//ZzihWMbGHW6SD1kguLDidt8QT2Zvy+qYzyOGyqQKY0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UzHTThpB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UzHTThpB"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5599Lj6L029862
	for <linux-kernel@vger.kernel.org>; Mon, 9 Jun 2025 14:47:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=tuaiCNKngsyuTcrXO4lY5lHn
	ox8s7k7WOsTYEjpg4UY=; b=UzHTThpBROAclNP4kYRtw2hgs+cIFI+Ns8+D06xI
	2QX19W3nKhoQWqy+lhNiHpBbDVoMipsjLpj7usoMWLcn/0bAqXMpFwe9eY5TBaQU
	KSQd4Jk0NohfT5IJ96bEScFkG3ScRjuMv5WXw6swSMH1JGel7zcNYx/dx8pPnisD
	8Yw2EBWFUk8JptUvUjAYZfOd9v2DQig5RKZYtVsuKrXVMVh3/lM4Supzl3rmqVv4
	1pjbyp8o9HTOwPFt1rsrEGIAFoyCly13F+2ANap7BuQyle9gHh0RsiGJsuknGBaF
	zxyvCkn31MtVaCDx45FVe2yoVRYnFXpxXLexOQCmuG4M3A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474eqce62c-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 14:47:51 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c92425a8b1so706332585a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 07:47:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749480470; x=1750085270;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tuaiCNKngsyuTcrXO4lY5lHnox8s7k7WOsTYEjpg4UY=;
        b=DeYP9YQQffpWmKQofuWXGoU54bGmIwZS7g8+wgTZHYXZpQRsmvF8L6PgVsKCIJKRXK
         F3KiUcKCJqlcdcEgyLpISdfYryxn/EUewVaR0LRv+CEF4OSeoZBRy1B2eh1C477U8Kt2
         rAYaL0d7x0WnM/9dcL8dgWQ8Ig48fmKKtf8f+1tsPjDcENtEfRTDUUV92hbskgdJkuqH
         /ARvHPuz3JDoOU+Op3xVeBrvJ6ggFbB7urBUbnZ//rvfda3x725upt6ib/SDqcayrLJo
         yUXu0XermSJdsrm8aDGU25QPrymigpG8jMAiUvhAEbiVU2t/6NGAnMWb1EsGF3HuqJTV
         w0GA==
X-Forwarded-Encrypted: i=1; AJvYcCVXM6EzwRhhReKEWGeFuhO1w4Ss10m7McoOTM0KO8rRonZcvRkpnB9RJTM0fRCCmy/6JfZqQKCjvD2i69g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF32IUxHlP0wwAOiOjVM2G+DsR19vuP8mmaPwdC4oezY8HXjHf
	7u9nN58YASvhZNN7nouxBi0E9KirC2LPnqyh57jPkgIpwmGgTEIyVVQ4XF/a5Feac/+J2y7WYMg
	CItBt/xgbclZmrq99kxsrdlA4pvVRwCrIg/vE2vRNbhzSTITowJAJJ9nJzuP5CqQ5pxM=
X-Gm-Gg: ASbGncv8AbCCVuAsC4Uifv5YmARRAaR/ArlkpIaFMwQGAMvKJ5fo7muxTJujCZ0wmrt
	20gOkIKRKY/weiFE0wptqJvQPvMXoAccl3VHWkDo9irinTJNA+JTkIQu61vsaGC6CxkYFuSUdG8
	4EPjYAv0AYEEg8YQk3sTjEa7o5VLQ2qKEV1+JNTdHbFVKO8IKYhLRjnPRFe4vv3m6ETvVlJVH6H
	DyOLDhDexDnDhHOpJMbT2hpgB0BfyA8SFmADBY/zWxrh0uh4yM4Np9GYed3CbqTJO64Atob71rk
	TCWvFgA5swmNJNzlZOvzNvvo/u+VoANyFafm3+tOfGXAWzYTHQLa+s3TJCv8bBshZjlk7vg1PeM
	=
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id af79cd13be357-7d39d155b1amr16768185a.19.1749480470631;
        Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF1IE11ont/nfDyhFTaWdajrMX3DfUNne8k9aK+3myxAzvAYnGnjtSxABOB2Bn0WlsuVIf9WQ==
X-Received: by 2002:a05:620a:608c:b0:7ce:eae9:43a with SMTP id af79cd13be357-7d39d155b1amr16765785a.19.1749480470260;
        Mon, 09 Jun 2025 07:47:50 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32ae1cab5c1sm11928561fa.54.2025.06.09.07.47.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 07:47:49 -0700 (PDT)
Date: Mon, 9 Jun 2025 17:47:47 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Yongxing Mou <quic_yongmou@quicinc.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
        freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 38/38] drm/msm/dp: Add MST stream support for SA8775P
 DP controller 0 and 1
Message-ID: <xx6v4lfd5cv24ce2kqtt7kverk36snydypeaq7h2hgjti5iadq@japcugke524t>
References: <20250609-msm-dp-mst-v2-0-a54d8902a23d@quicinc.com>
 <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250609-msm-dp-mst-v2-38-a54d8902a23d@quicinc.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA5MDEwOCBTYWx0ZWRfX/Qh976KGuAhB
 qda525Q0HRkZtWVNE8188p0FuYiUKvK6R6WUz9f4aqn2Nd48vrA9WUASq8OO2pDhqT/AkM2u7eo
 a3NE9xo1Kf0Y4MP4HhPRrftSJUGoTfmRICxePxiEXFqlaBLO1Wq2wMxjl63t8zRc8enBl6wSVjP
 rKgO0TC0Go0V+gUfGDWYz7XGJ+JhnAq11vIzIF3DPqyBIaVYtePyDNvFsi5nswAEVgSzL9/N48Q
 bzad+iiHd7Ot3GToj2Xs8B1pfKXgq8RqECdKkSJ8XnZtVxZTmnrx59tsKQ1h0GRJg+q8LFfhlLN
 thkh/A82Bryh5Tnq5fSI/0FPSVt7iVx+xj1dn2f9XuD78Wu9C/gT4SrwA4FhVIGbbKp9vrPj35f
 RRSWO/o/60xxTkGZoSiSQP8TBlgHYI/ujiHw/PpNrLhcKOAE1C5sZXj2N5CZoHzlDq7yy0wX
X-Authority-Analysis: v=2.4 cv=Q7TS452a c=1 sm=1 tr=0 ts=6846f417 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=COk6AnOGAAAA:8 a=xwcYTDe4h3asnKb2uucA:9 a=CjuIK1q_8ugA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RiZMii2T2pRCaluxt6HGC9ZvFkVvAOpI
X-Proofpoint-ORIG-GUID: RiZMii2T2pRCaluxt6HGC9ZvFkVvAOpI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-09_05,2025-06-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 mlxscore=0 spamscore=0 mlxlogscore=999
 bulkscore=0 clxscore=1015 lowpriorityscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506090108

On Mon, Jun 09, 2025 at 08:21:57PM +0800, Yongxing Mou wrote:
> This change enables support for Multi-Stream Transport (MST), allowing
> each controller to handle up to two DisplayPort streams. As all
> necessary code for MST support was already implemented in the previous
> series of patches.
> 
> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 75f2fd7c75eae81e5c843f8ae2d1ce12ad0cad7e..16196dcc9ff4ac6a35b6bcd8d433b08f7d18fe5b 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -127,8 +127,10 @@ struct msm_dp_desc {
>  };
>  
>  static const struct msm_dp_desc msm_dp_desc_sa8775p[] = {
> -	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> -	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +	{ .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true,
> +	  .mst_streams = 2},

I thought few patches ago you wrote that this controller should support
4 MST streams.

> +	{ .io_start = 0x0af5c000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true,
> +	  .mst_streams = 2},
>  	{ .io_start = 0x22154000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
>  	{ .io_start = 0x2215c000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>  	{}
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
