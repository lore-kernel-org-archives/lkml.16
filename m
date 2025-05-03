Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE11F171C9
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 04:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746246855; cv=none; b=W+nMAajr43ANPItqmJiCVUhJKUEI1c4+87RTaKyvhKY5PTm6QxCLraZW5yzXNzNdxFor1FKpID1DCi6SvBx3VZLcELQ4i7IeelqGL1iqqje0u/QPkPbgroydWjgc/HkLb3uFS4P+0m4ToADZ7qgBoOxVt2nrHt1GuNMbpODkO/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746246855; c=relaxed/simple;
	bh=R7eh3ISHlYxc5GGzwM7XT6sydBgX7ObFkDhbGijofpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hDBESlI7MRZO1JHefQjFYadGK9tAV9lAS7V4RP26N+aSNPS8XyxNxlSLCARaMaRkmxsN/vCOsj6zUDn15fQXcmPGci8rkqjmEp7hnEj9wMxG0qL2gegygrTbw5njpBsBq5C2NLTTt3N4Z4OBOCbIXmaXvEfAJCqyNMR27gXviw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QB7sVZsf; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QB7sVZsf"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5433SBis025094
	for <linux-kernel@vger.kernel.org>; Sat, 3 May 2025 04:34:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FRHnCwMP8vhcj5PnuVB1xzbC
	QCSf4DjArkeySLBpK0A=; b=QB7sVZsfQTCgW3AICbnLx87aYv6sTr5FIegbs5lW
	Qor3n68tLChW0btMz5wxZFXZbQ/lOtgVBaJXnex1MgAJbMfeoKCQo1MFyTXUHNom
	p8wOybQmaGK9toHAfwMI7tQ8ZesmvgsEJ2+eFfU3gQPAbsXih8B2dEyAIypFFrIf
	6xCUr1vxX/WAbLUDC0TgOFRFmjFIsU2a40K9t3z0afV94ngXC9awXkZkr2UYIrdp
	RK/ez6kVg62kPzYlxbxyP/mOGgHkNite9MFW8YgEJKsTn27E7qdcRV9cR9GExF8s
	4uHmelGi0/oCyrqaLcYLwRM7o5pxrEui+asCvYEPByv/sA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46d9c6g7cy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 03 May 2025 04:34:12 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f2c7056506so47247266d6.1
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 21:34:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746246851; x=1746851651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRHnCwMP8vhcj5PnuVB1xzbCQCSf4DjArkeySLBpK0A=;
        b=gmrQjiRy68V/wuJoq9SipHi/3an5hVojabjQ9MlmNW8qOwtHs/vZuEppcpdwLPgd0h
         liI53Phw1/hlMXqSJTgb5mPLfLBEr9o5yqG3cGl+2/JG87EWXAeie0G94t7w6AJ8yF8E
         XmVoMHsAk0je50GP1YvIFN2njcNMs86FMPrC4SZFMw0bJpQS6CZO36mFqXM6nBIep4c4
         EyZ5YNhfvlQhi3s9M9RQdh7nUYDvx7RsnSKfdfxK/UjCSrd20bF1pjdEqmURcpGuqaol
         CX+sxawqs4U9fgv9XbK8hjWEIIPXHLIBWtw67pXxiJLPZkRYv9Q8aqm7BWYB6/Ts89ot
         bEgg==
X-Forwarded-Encrypted: i=1; AJvYcCXFjNpuYRoS7s2NSSCnwXCvogR4LGhEntUf+MTI+3UP4kTyiN1o7oeyApvtmG9StPyLihVh8B7WEyeM0kY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwihvAT3+u4P11erTjr3FL6c1/AbAxg5WmegLmRx1TF02NrTep4
	05HYx5E6U6SjiisohuEP2WNvapaF4hmtg47OSSsl7B9tz0nU5ex/wmWeAGqyfyP6KmAD4Ic2C+M
	xMD89nbroP3b87HTb/wd7//6b02bM3AOe8W7UoTEf16i98+wNKEbyCrxG+OIFsAw=
X-Gm-Gg: ASbGnctk17UTcE30TKX7XngZJSChUFFNaCTSYfPhzurMvt0MvWGugVyKtZbzTmnGg4R
	I4DWHe8U0oUDEvSK4GAVkvleu/KbIVS9zV0A2u5Y3AjGcU82uQq/IEmJeo12yQ/QqyIjLZ6K6ZR
	UtaypEz4jj3dMwCQ8dA12Ln7IN+1f0j4DKPfzFUAoadV5yVT4QDlXUOiKxa0JwGvm1kOvsbzRMW
	Yj+6579jonUZGkptWxteKZ9NBF0ZzQaehGIbVkMDQG76cyuGTdWyTzXnrEHxhHeRKs+YfWjjsBc
	8xFowLysiaaXo+rpADe7TFte8TWgelSjiBGT/So30+585pmamOU+fcw+RlCY4rNYNTrI6xAjFHM
	=
X-Received: by 2002:a05:6214:b6e:b0:6f4:d60d:dd29 with SMTP id 6a1803df08f44-6f5157301d3mr92485316d6.5.1746246851595;
        Fri, 02 May 2025 21:34:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdtTMunWJIdNzuGE3JjLa6Bo7EoaBJJr0Rr3GrubyAqm13CmOAIBUkvnjIlDM/WcwlSPlOkg==
X-Received: by 2002:a05:6214:b6e:b0:6f4:d60d:dd29 with SMTP id 6a1803df08f44-6f5157301d3mr92485046d6.5.1746246851197;
        Fri, 02 May 2025 21:34:11 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94ee6ccsm637203e87.122.2025.05.02.21.34.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 May 2025 21:34:10 -0700 (PDT)
Date: Sat, 3 May 2025 07:34:07 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Robert Foss <rfoss@kernel.org>,
        Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
        Jonas Karlman <jonas@kwiboo.se>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Dmitry Baryshkov <lumag@kernel.org>,
        Douglas Anderson <dianders@chromium.org>,
        Lyude Paul <lyude@redhat.com>, Andy Yan <andy.yan@rock-chips.com>,
        Al Viro <viro@zeniv.linux.org.uk>, Vitalii Mordan <mordan@ispras.ru>,
        Sui Jingfeng <sui.jingfeng@linux.dev>, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [PATCH] drm/bridge: cdns-mhdp8546: unlock on error in
 cdns_mhdp_atomic_enable()
Message-ID: <f7w562h4ulorcxsnukbgdcizeg3g6yfhlst2o3467wihqnkdn5@qaw3kiicavqy>
References: <aBHZBjiOVkI_8Shg@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBHZBjiOVkI_8Shg@stanley.mountain>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTAzMDAzNCBTYWx0ZWRfXywJ5F3saEyKp
 Fd5gW6+YemD8ZN6dAGt4ZecXjDv+QJekhtxWyMe/pdH4iewtK+2HzXwyfmOju/BwFKcSVqNuMA4
 q55alQNE4K/hxGv/8SxioMPIa0ZYAsiNO+kqjM6FfwsjoJ4rliUMkwJSph+0I30NO1uhI9RMtnq
 ZARHchda58z+RuemYyU+IimF6TqtU5ZBR0ZXqnhMFaiWXr+fkTAsL11zL8bjw4fS4jhZ/csI+vs
 fag2RFQoxUMTbRUrc4WATuq+jgYWiU9q9lpYhdJnxMm4utQYkTRcrzZNx8BWfPaetmyMIHUs0gh
 DubDZNLlYtivx1sRj3zsPUp90d7V9CdB4FG9fEzYVG7rgUSJ0UNcRt34mCqdpFSw2+pA7KET2ve
 BZJOrnQxbm3v5yzHaqpYzaLVLG86fdfup3w5dICv4ShSrMqwcbU/nn39mExZbm0VT9X/HKfE
X-Proofpoint-GUID: RZmw_tVvNxqFSPeesPL8kjp1SVyr-fUQ
X-Proofpoint-ORIG-GUID: RZmw_tVvNxqFSPeesPL8kjp1SVyr-fUQ
X-Authority-Analysis: v=2.4 cv=BYzY0qt2 c=1 sm=1 tr=0 ts=68159cc4 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=7MWD5bQIOqUMkJ40eKAA:9
 a=CjuIK1q_8ugA:10 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-03_02,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 phishscore=0 bulkscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 mlxlogscore=999 impostorscore=0
 suspectscore=0 clxscore=1015 malwarescore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2504070000 definitions=main-2505030034

On Wed, Apr 30, 2025 at 11:02:14AM +0300, Dan Carpenter wrote:
> Unlock and reschedule if drm_mode_duplicate() fails.  In real life, the
> drm_mode_duplicate() function does a small allocation and those never
> fail in current kernels.  So this doesn't really affect runtime but
> the missing unlock triggers a static checker warning.
> 
> Fixes: 935a92a1c400 ("drm: bridge: cdns-mhdp8546: Fix possible null pointer dereference")
> Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
> ---
>  drivers/gpu/drm/bridge/cadence/cdns-mhdp8546-core.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

-- 
With best wishes
Dmitry
