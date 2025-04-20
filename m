Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08C801C8629
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745189747; cv=none; b=Wsp9S3JljGzuu9Qt9gisBMsjEikgtXjw3SS8lsLEogDktOYEOqdiT0Su4s7OIwYk/KxU6y6vTEP6Bc9S4dr4b5A94nDL6Pon5bfbKHZD3XVbzv44DQuL0gqjAYuYIEHOLa0vzQbzJVykZv6xPUbDRZhCjCGfk9n25F5lOLBEpmY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745189747; c=relaxed/simple;
	bh=KwpU6k+4yQUwbC5p3yNryYWxVF8SQPmT1RXIBL946J4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ENhiq6Ll51ZaLOeuUy8MrqboeR0bv6VCqizlUmpuMLhuJvj9kMfvxeO5sHwqy//u+0g5y2HIkDTro3MK4Qhw2HYVbqrBx8Od+DV4bxLHf2wDiIlPJF6aMMM3uStm94Ac6DetfNvL81dyr7IExDQsEQgP3UxnaRMJBlZf3N9pOLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=nXg2sM51; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="nXg2sM51"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53KMUkj4014505
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:55:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=18GmJcn6aeR/AFeji1S+mQX9
	A5J0DZGsqXTXSspaYAw=; b=nXg2sM51t1OC17M3K2PLSY9mQNTisFallNJZCPk8
	5tfSDxF+C277sjd2GjqRlSMxe6DPOrBZXG0F3lsj5EyjKKfZZMTMvcjXVOZE/cJZ
	vzfFaS+QKuUyliIgHH5wTluxTJdLamMPNDyhRiwwK/f/mmvIr3MplQoxr7ZXWmN2
	g1v1IidhTLlK1ct8s3tvmd7GYLu1PLPR7b/oia/srqt8CG0fhkmrhGeq4Jpy+Ud4
	UnH2e3GDTi9Al07A9MgdNX75L/uzMUBJhe88udsDtCxfDp+ePQoqsDg70VIzBpVn
	LcftKm2cspFI7MSGwPHny2MrSBhK38z1y/+KePQ+y2rxqA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46435jajas-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 22:55:44 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6ed0526b507so52657636d6.0
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 15:55:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745189743; x=1745794543;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=18GmJcn6aeR/AFeji1S+mQX9A5J0DZGsqXTXSspaYAw=;
        b=scWafNqU62CewX22306wTkYEejj2/oMCVAnHPY5seCACN96qrEohLbrtHnndo3qqly
         qsv74qnYT4ElUIgjZnd7LO0DGpYEvYzqfxcrZjzS0ynW3R4mePzg5JgnF4mYHbPzV2R5
         6ChqS5gLkJ6ZyxHyAB+OK+yq+D4Hi6V4c4Y4JxNsnBaE09EHFxrXXz/Ntj5S4sFQJENf
         xOMoMO3kRMpxfezq6sfc6G7fNTX9vy6vU6U/XCAD3r0fhZPWhXKsy0D9IGdWpQocFOZo
         qnWVcMO0UYuEFpHIw6BRXe4rWx56DiiOnEd7y7CmQlYqv/ZabCKIUqXgV90zHjlalB28
         MB5g==
X-Forwarded-Encrypted: i=1; AJvYcCWQZSkbvHlmI3AH+nYO2iOw+NnRZh5RdF1bV23tTjIP2UNo8szzG5ELCsPTt8fug64S2xKnDWWmtUOfFhU=@vger.kernel.org
X-Gm-Message-State: AOJu0YznS+LdGjkLwKOVhXeiGc/WYh3wRpoVAcNN2GsIZ5gnXT61fqDI
	N2uZt5BAN6KLrmqzDJlO6ojAtKVQmxrH3ecWoNdyU8s1BTLUIehHnCatDMKUvSMlVJJbTJilynw
	VVv9JprtcDQZ1cyKuVQE+o/HxwElklWzarvwXZ5kd/jWTqJ/eP5NhTAKVm1G/DiM=
X-Gm-Gg: ASbGncs9Aw/biNavPtmTam50+pFAjIvTMRB8VNous6OiOcKdnmc6sZdakgx4Q61cWmr
	CIYctU5KePXmVrwCF2pn5Dt7Gup99i2kpESHzHBxczP4AFtPOUWhU0NOOJx1zcbm2nP1KTdPYkV
	NGApAGKjyBSqywt4YVr93dJJqL2jNdC+/3c9Eg6/JWgYojPgUMi9AVb/51MG2N0XD4CRa6q4kR4
	8QwIDwoTruclEJRqxhZHPJgSGv2rf8NOspbH7HwXe/u3nhA5rsAQ99AhdIJf2GvCz8S2c+bzd0O
	6rft7p+rc/9M4hhHraKZKNfhUAt42tKVKMM47ilXHQfp6cQtIBxLHABKCbq+YOZ3vuyLXMqztho
	=
X-Received: by 2002:a05:6214:20a8:b0:6e6:9ce0:da9d with SMTP id 6a1803df08f44-6f2c45c16cbmr195964626d6.27.1745189742761;
        Sun, 20 Apr 2025 15:55:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEYHiGuUL7anzQP+hRVdRIw1exJtNoZHjg7PsuBTXU0sOzexbcuqptDxCR2/PMYgAyo7hG3VA==
X-Received: by 2002:a05:6214:20a8:b0:6e6:9ce0:da9d with SMTP id 6a1803df08f44-6f2c45c16cbmr195964376d6.27.1745189742375;
        Sun, 20 Apr 2025 15:55:42 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54d6e5cfc2asm774587e87.136.2025.04.20.15.55.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 15:55:41 -0700 (PDT)
Date: Mon, 21 Apr 2025 01:55:39 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Neil Armstrong <neil.armstrong@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/7] drm/bridge: analogic_dp: drop panel_is_modeset
Message-ID: <r7xoe6tuj2njktvfx67yd4dfbtt2tawaj7xh26rcmjunpwdvzm@xktz3jbz63th>
References: <20250401-panel-return-void-v1-0-93e1be33dc8d@oss.qualcomm.com>
 <20250401-panel-return-void-v1-3-93e1be33dc8d@oss.qualcomm.com>
 <d16755ba-8a68-46fd-a92c-9404512ae6c2@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d16755ba-8a68-46fd-a92c-9404512ae6c2@linaro.org>
X-Authority-Analysis: v=2.4 cv=EOYG00ZC c=1 sm=1 tr=0 ts=68057b70 cx=c_pps a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=EUspDBNiAAAA:8 a=OVPB_bV0BH9eLidssw0A:9 a=CjuIK1q_8ugA:10 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-GUID: U_zV1diaodB1yoB6EWykXflKm2u5cSbL
X-Proofpoint-ORIG-GUID: U_zV1diaodB1yoB6EWykXflKm2u5cSbL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-20_10,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 mlxlogscore=835 mlxscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 priorityscore=1501 phishscore=0 spamscore=0 adultscore=0 impostorscore=0
 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504200190

On Thu, Apr 17, 2025 at 05:47:00PM +0200, Neil Armstrong wrote:
> On 01/04/2025 07:11, Dmitry Baryshkov wrote:
> > The dp->panel_is_modeset is now a write-only field. Drop it completely.
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Neil, it looks like you wanted to respond with either a comment or an
r-b tag, but none were present in the email...

> > ---
> >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.c | 11 +----------
> >   drivers/gpu/drm/bridge/analogix/analogix_dp_core.h |  1 -
> >   2 files changed, 1 insertion(+), 11 deletions(-)
> > 

-- 
With best wishes
Dmitry
