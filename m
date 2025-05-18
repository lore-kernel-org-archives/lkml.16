Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E688A41C72
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:03:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747566212; cv=none; b=tlSLz1+xs3Kt9FtHfTuE4HR1EX+JcNJJsbAA5kn4oM8d6/Nyp0um5ByVTV1FvbOe3zHOCzaBFYoWd7zcHKh+t2TLJ/1vZ0SZ+Y1c3DpXktHkn2Ugm0xXy1wI0NzdUh8zjlXw2IfXKab0rAj44l/NpSf1sCAQpPDAE1IvIogYmAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747566212; c=relaxed/simple;
	bh=jKhYoXTiCVLVCQ8YtO1O7KlJsBewVo9GkOrWAqttTQI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FsoKygbx5AJ+VvLNr7DUjIWO6KC36FiCuBBu1CIhkb1vlpQbtBvHfdIFPlSa2Ke6LNDLtO9C45RWZWuayVbyN4sffr1UL+xkzpp5+s5hWMCeMFnCC7EiZmq6xQT/ccrK/c9miqLoFBzgn+TnCnIgHqO0k3n2jMRdYwWEVooJtLg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hCX+a5hj; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hCX+a5hj"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I7qwYa018064
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:03:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=s7Zodl8u7V43jJfdZC59QA0w
	/oqjwY/2qontwKvBiL4=; b=hCX+a5hjc+O/br/Rtar7NXcE6lzauX3Tanqi7Ej8
	xfqDh3f97ksLoAjK9hhsgyNrqQmzrAWMHBHtAnIedBNbZE29CaruKf36zioACSSO
	IwPd9G4dYK2MlEhXrOQCpW1uhabTI9cy/X+x528AU9KVQoBisCnt0Fla4xK+Zc0u
	WgqWaab0HQSerutBpXX7CNXb3KyAevkjuPtj9/t08w7wov+7odVK1z1Rhkc2byWJ
	kDYp34VrUe6D97ztcPgeQ/MCufjwF0bkTFUdy0s0HnsSHPlJJTZ/VsV7+qPqB+P5
	hSEeiSoJtFWmdvVtzIIZJsDt10VgQD+/6cLW5HLb0BsXTw==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjmesvgg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 11:03:29 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6f8d0c8e917so3880646d6.3
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 04:03:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747566209; x=1748171009;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s7Zodl8u7V43jJfdZC59QA0w/oqjwY/2qontwKvBiL4=;
        b=R9wR1YqYmjoOzxV+MYx8r3C7tbiLf9vJ9GPzDmXLMw6okcTeFhy2DpVFXCzvmSLAg5
         nccUWasmZX2G+evrGrbhAWoaymDCSmyza0Wa1Jh9f6xfRT0EBH5D8f+IgsFu6nhGP2Wv
         owhOjrKvhPhJXHeeb1pwGfEjfDrIJeVsf5dnyXd+jEgDfSKvkiDaxev3JfFVgIhdZdRb
         sTSC76UEtftjrcKOAxlSm4ez+Mh1HLC8NI2/HrUgIcFhgmo8jRL/s/imNBAOSEgMj/Aw
         VwcJh+HjF/hXzo76a3+nYCTQ2AgYwOR8bm4t/Hi8ALEtZQtTMhIiTaWvBxM2CglIUpwi
         9C5g==
X-Forwarded-Encrypted: i=1; AJvYcCVOWT3FsJybMXcd1QDITyxS7+fATVq/QR30mWnYyAUNKL87aPWfHbjaB+ze7O6SWjJZBxgHc5TXe129fjE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyOKQREcc9y3Ah9dhlL+RUPqNRncwYn9Is7gu56PIANmFZcSvQ
	kMMYpJlgKluh+7q+zIICigrcJRDA70CyE6MHDxx5BCVXiqhCMmM1uTAPLtTSACqKvPrr8mZp7f4
	VT7bfi+jYGUkXH2u2f1txQxL11EP+IG8xgIpUIA5BRzLbJwixe8Vz2j90bIEfn2YQRjw=
X-Gm-Gg: ASbGncs1BaIHe3r9p6vPoAlhr2XbyZOtyi71teB/PotfIXE809ymojuxkyRDl9MhscQ
	bT1uEf7eWrB4HNo2Ek3z7A0qz8jShc2tP0w9pbmC/FVejy9DL+ADhCO6+nSl3OSeZr6EG7VXT7Y
	z2NydAjoHSoAqApWCLWQWWO+2osKYNZZrbtPnBGN2FemaHQOU07OOY4bn1C33cuVP9twUnOYST3
	YATnVIKr39tvYQiIcCtZoQL7jF9KzHdp0e+CJD5ZmJFSmvK9tB8Mg98T+uwMd1mS8fxQmbsPi1o
	FhnAohTDwBGgta+7gDPjsHBm8w8qOZysavqebspj8590SZXt4NnEAZmejk/51umM1ZN6K4pOrX4
	=
X-Received: by 2002:a05:6214:d6f:b0:6e8:ff46:b33e with SMTP id 6a1803df08f44-6f8b094a1b0mr164965756d6.37.1747566208736;
        Sun, 18 May 2025 04:03:28 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFX9KX+BFsa3NUoYxEGR8XyvRdKkf0qln6ioT3s6rTaHSqkLSqf3cbumVbWxdH5ju6b5bIE3A==
X-Received: by 2002:a05:6214:d6f:b0:6e8:ff46:b33e with SMTP id 6a1803df08f44-6f8b094a1b0mr164965406d6.37.1747566208311;
        Sun, 18 May 2025 04:03:28 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-328084b46d8sm14286041fa.17.2025.05.18.04.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 04:03:27 -0700 (PDT)
Date: Sun, 18 May 2025 14:03:25 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
Cc: srinivas.kandagatla@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        gregkh@linuxfoundation.org, quic_bkumar@quicinc.com,
        linux-kernel@vger.kernel.org, quic_chennak@quicinc.com,
        dri-devel@lists.freedesktop.org, arnd@arndb.de, stable@kernel.org
Subject: Re: [PATCH v1] misc: fastrpc: Fix channel resource access in
 device_open
Message-ID: <cq3ib5nunqiuysyfezkrr5qkcqutwjxjmabpeihpsizbx5tmm4@rhhjhzaq5km4>
References: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250517072432.1331803-1-ekansh.gupta@oss.qualcomm.com>
X-Authority-Analysis: v=2.4 cv=RoDFLDmK c=1 sm=1 tr=0 ts=6829be81 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=OHL9Fh2E-Su--KGKRvQA:9
 a=CjuIK1q_8ugA:10 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: x1mI_QsmTDM4wLTv0woWSRcAebeg3PKg
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwNCBTYWx0ZWRfXxBIeUd5W+LsP
 Ak8cQLjuKXsdg6TjvuFOxnIyLCsxT094Ml1NEf6VdidTVyLc9eYrV6otQOGXP37qvvsgoMesNXK
 fX8rQK9dKF5xeL6cOQFWKDt/AAMx0nLD+LLKAbEHhpCr+TS/0OlDON4FRSYTcMit7V1NDzhdGkB
 jhVfCMqJKcK7XFgGVLVbxmqYDSOnmgKx9cBY+aXjWl4ftUAr4gp0jPtRXNH/8VE1PTulM7RGs+V
 tb4B3rnoWQ3SAjr/GlGYbyvRwubrcBweyskQ+CaMG+JHxDqf+t9ipI74mCPqZt0L33CJFA2Umyl
 OFcGrcQCbUTSvVhu9SBm4ClkAyn5uZQGnK7ibFKUwyj0Wk2Peed8kYDNf6kpZ7fIKN46B4PxyPZ
 pYunGu3aeqzyPp1BdIeouC1whGqRRLa26cSrRcoAFLEQHBjTBpM23xERmXQ8H+JIVYuxB06N
X-Proofpoint-GUID: x1mI_QsmTDM4wLTv0woWSRcAebeg3PKg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_05,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 impostorscore=0 malwarescore=0 adultscore=0 lowpriorityscore=0
 clxscore=1015 bulkscore=0 priorityscore=1501 mlxscore=0 mlxlogscore=999
 phishscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505180104

On Sat, May 17, 2025 at 12:54:32PM +0530, Ekansh Gupta wrote:
> During rpmsg_probe, fastrpc device nodes are created first, then
> channel specific resources are initialized, followed by
> of_platform_populate, which triggers context bank probing. This
> sequence can cause issues as applications might open the device
> node before channel resources are initialized or the session is
> available, leading to problems. For example, spin_lock is initialized
> after the device node creation, but it is used in device_open,
> potentially before initialization. Add a check in device_open for
> rpdev and update rpdev at the end of rpmsg_probe to resources are
> available before applications allocate sessions.

Can we fix this by registering the device node after initializing
channel resources?

> 
> Fixes: f6f9279f2bf0e ("misc: fastrpc: Add Qualcomm fastrpc basic driver model")
> Cc: stable@kernel.org
> Signed-off-by: Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>
> ---
>  drivers/misc/fastrpc.c | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/misc/fastrpc.c b/drivers/misc/fastrpc.c
> index 7b7a22c91fe4..40c7fa048ba7 100644
> --- a/drivers/misc/fastrpc.c
> +++ b/drivers/misc/fastrpc.c
> @@ -1568,6 +1568,9 @@ static int fastrpc_device_open(struct inode *inode, struct file *filp)
>  	fdevice = miscdev_to_fdevice(filp->private_data);
>  	cctx = fdevice->cctx;
>  
> +	if (!cctx->rpdev)
> +		return -ENODEV;
> +
>  	fl = kzalloc(sizeof(*fl), GFP_KERNEL);
>  	if (!fl)
>  		return -ENOMEM;
> @@ -2363,12 +2366,13 @@ static int fastrpc_rpmsg_probe(struct rpmsg_device *rpdev)
>  	spin_lock_init(&data->lock);
>  	idr_init(&data->ctx_idr);
>  	data->domain_id = domain_id;
> -	data->rpdev = rpdev;
>  
>  	err = of_platform_populate(rdev->of_node, NULL, NULL, rdev);
>  	if (err)
>  		goto populate_error;
>  
> +	data->rpdev = rpdev;
> +
>  	return 0;
>  
>  populate_error:
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
