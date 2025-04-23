Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B88C27C87C
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428758; cv=none; b=g1aRXQ6uHmlK9FyIbBuHo4+raPITOZYs506nx2wWIEvedAr5LlB/y9p57aBebsWlKq2zNui0Bsa7JpMbA1kc80jk90W+aJ11/vUP+75VC+CZ0JZI0784d0LoAEzCRDtnBEOyedbhiOwFuUQ1k5HWMXYxbgihu6Bz7lVpf1YZKdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428758; c=relaxed/simple;
	bh=rgZFysdk5LmUyO73ZnnoheqiOjpTCHaMicgS32wqjrU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ucjdYPyhqRjJl663u20raKEg+w51nw7SewmybiRjDu5i2n6H5M1ItKLU2CrVboy6NSSvphIQjH+NMFqBramS7xL0yZrv5aiXonL/O1wgpyTmy0ndwydcKoWnfP/0wKbPbNUScojC66QELNfR0AHeKVi52w8j6ufFLKwlG6q+BEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LbsbPK9Q; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LbsbPK9Q"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NApUK9014055
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:19:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=v9wH8EHVA6LVjlvvVtjgsb3t
	nmFIETCL1aHoZSy3M2Q=; b=LbsbPK9QvehrWUBZgBjDZUrBzdkFbFpsxxVum3z7
	BKdawnQthAVJcR4qIZJHn/msKhRnEElT+3YCh6JwYLP0nm8qIzOIObQ8Ap8bDq9o
	c+fb6nXxfgxTHdoiIGB9v68nWkC0OvVHQEubi6D3m29lZ/u9JYs4NvYGy3EG8Ntn
	EvHJTS3wrs8+XSnRhSUMwM96Yz/sINB30n5X+WpnBUNd1XcCAXJNRYJHyIjZGzW5
	WvUKRMWk9OM414DcH/q0gXIwBn1YkSPHXO3rrk9Nfmvt9wmQfn6NtLvqDolfJJ/k
	Mq7gd3gdwwLX8OZ9H+ZaOrqMu5g/HdoFhfG8eImpXvIl1w==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3avrk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:19:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5d608e703so11409985a.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:19:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428755; x=1746033555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=v9wH8EHVA6LVjlvvVtjgsb3tnmFIETCL1aHoZSy3M2Q=;
        b=oDyJrdnEhGT0LJVmAgVEBUKuInCK9COfcRZ5XIKKvya1qQaKhW7a8FNXyVh9UugIDi
         4Q2CVJR3WqNzmeb+doVepz+vMJAa9306Jz9aqSzXgatczpVcYtMK6+MMQlUuwc8mQ2cy
         OogGUd0RtRY7WIQjvjrp16Z8TH/PcS5fuMLrAe34sqr7bj7xOG08+I7L16CyFvl2ySdc
         121GrSb+OG5N1LOJiUNb0RFEkR9ZQgMJyjp/TR1nKYZIxu34e/s2LkET5W7HJciD9ons
         j7+boZS6R8Uz6rTUtTuz7mGXsIgB9vAZ3wftSLWCju5TUG6fhfRurpB67RNib4FrlbUP
         gUHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTIjl5n3WEQB39ErweHMCmCJEMPPTEqgdFzggukwo0L4Qtekslwkhcz+qkhBwr0AW4klrgpTMJ4YK+Uto=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxo4VSu5/9YwmcVmHjFTojOngNcLGAUDye4AYYELjCdAaR7fz+T
	QsDiVmT4mev2gzTLrePONJ+jkvDJg9TnFSV7Jxsth/OGNT/xobQ68vZT6UCG54vC83sMyuhk2E3
	wkdxFH+9QYNBtcihUAgDII04lPhCWbWoAroc3njJgmugYbTItyhDLLHxqU63xBZM=
X-Gm-Gg: ASbGncvhTpRIJKk2AzE4WSyU4jwz5kIt1r+n8WIBJv1BjnTOxrw32Iazt2lLWYK2FHw
	4H44XcYSKBnubxOCy9ZxHMdFg3LNCUl6V0jBkctYNHVHsBkkp4/bO073JP+Sp0/CpTpjWxW1esR
	TQIXgHidut+qDASp9FH/1U8ZWs87SCGGZWQVLOUtjqRPIZq8kDOi84dFZ6rM6Yf42HqyR/HWG4u
	3vnKoybM2FRF0WZ0akdqSgshD2hfEOb93+Vnp0gTG8J9G9+aa8jbmUGeKx6JPemp+ThZlt4uTIu
	pPyLWhAN9ABv2HEx+HCZ+9/0yP75HqvlNOZnena/ucbqthkoiGi8A3jDM4ZVsbwIni3eSTH7AAA
	=
X-Received: by 2002:a05:620a:4626:b0:7c5:b90a:54a6 with SMTP id af79cd13be357-7c927f92454mr3558193585a.13.1745428754604;
        Wed, 23 Apr 2025 10:19:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVswqy1ybTqryfuU4lsmS6U3oHGTuYaamZGD3V21r6W1eTAM4iafXiw5YygTNGYAOdB9TvOA==
X-Received: by 2002:a05:620a:4626:b0:7c5:b90a:54a6 with SMTP id af79cd13be357-7c927f92454mr3558189385a.13.1745428754176;
        Wed, 23 Apr 2025 10:19:14 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5e518fsm1569937e87.188.2025.04.23.10.19.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:19:13 -0700 (PDT)
Date: Wed, 23 Apr 2025 20:19:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm: panel: himax-hx8279: avoid using an uninitialized
 variable
Message-ID: <lds4bnrjsnqxjjcskq2quzqqlkmwwmxwatbfhyjc622pjrjxw2@eqcw5bdwd5xk>
References: <20250423163214.2276114-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250423163214.2276114-1-arnd@kernel.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDEyMSBTYWx0ZWRfXxuEjm1kd1eKM ynkLeNSKo0I53GF50LQfjekaaYVewZKo1btpoGxIrIaQtW+Tdo7/OedovqFxL11QmNbQ4n+GAkO QDPgqsAt/aKZarNhErb3FvcQyWK0FEI3Y8rAMhgkcqua4eH1Im1czIP1nAEZfOunnWneGWw8NOu
 gLevDJVGSFOjLD++NlapPWu7ycJfo/2LcL1Hu8IazH5/IWlAgpx2eLy7y2IwL5jgYjdBff/BrRi sa+MODqldLYGgq+I6oUR652trzHOKaCUS8BoM/TaMzqXgslvWGmC5pcvwwpV64vjoYG9ZnVbnD6 0pM/hqI9csNyfzwa9Dzn8Ez9iDMWk/PN0DnvlDcO2uRmOTMyrwW/CO8LKhCnC5Wj8/vuNOYOxXH
 xhGRuhZVmcsc+JNVT7NNmpM0kqIiAZqoZLpf6UeTqNIfteYOTjQom34+0eFmfYnbgG4EWuPM
X-Authority-Analysis: v=2.4 cv=bs1MBFai c=1 sm=1 tr=0 ts=68092114 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=QetOEnqPXbbGsKDQW84A:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: _VJn4FnvuRRY6-j0aDm54JA1Us9LepZc
X-Proofpoint-GUID: _VJn4FnvuRRY6-j0aDm54JA1Us9LepZc
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_10,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 suspectscore=0 mlxlogscore=911 mlxscore=0 phishscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 malwarescore=0
 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230121

On Wed, Apr 23, 2025 at 06:32:07PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> goa_even_valid is only initialized in one branch but not the other:
> 
> drivers/gpu/drm/panel/panel-himax-hx8279.c:838:6: error: variable 'goa_even_valid' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>   838 |         if (num_zero == ARRAY_SIZE(desc->goa_even_timing))
>       |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/gpu/drm/panel/panel-himax-hx8279.c:842:23: note: uninitialized use occurs here
>   842 |         if (goa_odd_valid != goa_even_valid)
>       |                              ^~~~~~~~~~~~~~
> 
> Change the initialization to set it to the value of the condition instead.
> 
> Fixes: 38d42c261389 ("drm: panel: Add driver for Himax HX8279 DDIC panels")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  drivers/gpu/drm/panel/panel-himax-hx8279.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 

-- 
With best wishes
Dmitry
