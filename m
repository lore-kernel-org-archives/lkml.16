Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E1F372632
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 10:47:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746701255; cv=none; b=i2PRjpWkOx7pp7p1h+zLChbwQIwdJQMM/ciBgHCffSnDxjvi42SuFIWaLWlPOSB5zIhIXTFzJPC2YJZRDX9up83yZ7KcbQbtwnQnYudadD2yKAkhcZRJqr2RsBJ0b18y5DNs3VdqRY2vY6TxA5+C7kc851vWcDea6U7e6FsITgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746701255; c=relaxed/simple;
	bh=0cKobRXvUf+DFCw1YjKv/NXBgtucGhl1ZO6NNdoT2Uc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XOZqjERC5oZtiGf8GoMKV6eFQcp9Ah2FILrtUYLyaEyNyUlB09TogJsElPnK/ftqPzminXJYCRDEy8jekkRQfAS0j5bg2naCyzq1TONO7qZBzkTXxv08qRVliZesw/s83qwxlEumC9P+b7EbNkCGppZg+NPmd35IS4GR1fgyko0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Gv/Kb+64; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Gv/Kb+64"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5484WiRd010134
	for <linux-kernel@vger.kernel.org>; Thu, 8 May 2025 10:47:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=DJLcczpvmaxUKxKji1M3aDjS
	LMp22wqvdaaWQcNcABU=; b=Gv/Kb+648EnqCkbT8oiSS/nnHx4/i6ee1pUgaNmQ
	FnUjCk/UAGVjGYH+VGq/D25g+DQq0qKGlcFyPwANejgQf8y2UpnO8/UgdIKBKLS1
	aNytjGviDAntLa98J128KzbAgX0nDDcuJKdVacTi4UbTMa+c9gYx8ac6c43JnapP
	KozT/27PhRry8eHLRrBG2B90VDf1lG0SvYLz2qY+R8mAQBuFFBu/Uhoxlh20tF3s
	dWlzP2EdfoLOwoF7dLiuIQM/wLZ51WSrniBRSogGH/tKt3XWmyTbJOAaocLoJYIt
	NwWM4ZCfcXW1BbLRm//hlmW5SyCgvTk2Pu2lMwPzxU+VdQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46gnp791qk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 10:47:33 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-6f617f20b2bso2501526d6.1
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 03:47:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746701251; x=1747306051;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DJLcczpvmaxUKxKji1M3aDjSLMp22wqvdaaWQcNcABU=;
        b=WSJo0ag4E8fcKpT268BQk2B+ZZglDoIm62IFK6Y/9Fo3abBxi82G/90CtX39DKeyRL
         c6BOC83FGdtYdAFHh07PQ+qwEzuDVLKFCIh0iEMjqHwtTjjdUTXBOx+hldGrJD7nyCDK
         YOAkrG/eTi6LiMrkBxFFKx4DPm7wBx0b1IU8pEOuALsj4nojI0N1W+h2u3JgI4e4laBW
         5lpVJ+tKcpnfIKb8HwL4VM0RjmjyAGsW8KefjYOSKmCSgYbe8T6ugW6Wt9+JyZMpXq1O
         CuxbTu2P1B4JB2v20n1v/CBFi0OOa2Y7npAxU4lxdEdtSZiSR5qT3jh/nH9cSZJUwknw
         fdwA==
X-Forwarded-Encrypted: i=1; AJvYcCXld66ZqwpX0kLyjru4rISuDDZdpuOUuAPn0gNManUogGhK0+SN76cYU1BBCcxIjb7n1lej/wGNa0XZtbU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzz/sJL2Rs7x/KEc+7pWXztYaQhceQmvlXZn086cAmM4jPcQrVP
	t/fUXrdB4cPsjNnmcr0NE2+lf1yjb1dpN8V8zMMcV5kh+sYEfnbTUiTFxNv1T+A1JnD5WQl/LoD
	Qbshe5d6Nti7YmhtvVs8SMfsSjqDdmpuuczk5cRKAHoYPuslTthlAjEbr6z0eVKDjguhIRX2wLw
	==
X-Gm-Gg: ASbGnctWiq5gcQFlnd2A9Cn09ipCTmq5oaERGyn9Q05fqZYhMgBkH7x89HNWzUs+xfQ
	sT0pPCHwxndRtt/5Zrt0ZYJUl6nrVtTk7ryVEQp7ERcIErokCt3XQNCRQzhVfXU9cn3zteKA5xx
	9Aszv3JRDUtl6EkY9EFIkEsoLxGkDW7yNMm0sS74W92XxxTHj+kIzN/1MDxqARwjSXjrURt5FC2
	gpbntPAvqTaLK9TszHm5vO1C+axvDALeEyI96BQdJ790hXSuJm/nfTxn1wiPzRf+W8zKelzE/Ih
	Io8qGkUVdwKg1kLoIs0dAxSN/H1dxP22tyzJ8TefAYZLqbRiZYGtFSQBWfjS2VXsLW9NPW7rFZY
	=
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6f5429e1f20mr112740446d6.7.1746701251154;
        Thu, 08 May 2025 03:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEHl4JUcuFrO/9rVeQzXi9JZCdORJB3CJB1i85DoLPVXTX/Y5q6n8b+WwBx6so7vshDBnZtiA==
X-Received: by 2002:a05:6214:2405:b0:6e8:9bcd:bba6 with SMTP id 6a1803df08f44-6f5429e1f20mr112740036d6.7.1746701250806;
        Thu, 08 May 2025 03:47:30 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54ea94f21a8sm2573813e87.197.2025.05.08.03.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 May 2025 03:47:29 -0700 (PDT)
Date: Thu, 8 May 2025 13:47:28 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
        Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v9 01/14] drm/atomic-helper: Add crtc check before
 checking plane
Message-ID: <b5kl5whmagpxn4saimkj4qloowh73xggehdh5rnl6lmjvqf65j@esycoi7w2nmp>
References: <20250506-quad-pipe-upstream-v9-0-f7b273a8cc80@linaro.org>
 <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250506-quad-pipe-upstream-v9-1-f7b273a8cc80@linaro.org>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA4MDA5MyBTYWx0ZWRfXwTwERwe4xTNO
 ZiBGByDu2SPgJyX4xX1xrCvjgZhRPyXwbkvwFm2lbZULxR9SW4m5bIOVUlu556SnIxE8T6OAl8V
 hf/xDPUW/7W80JJWWdXczvzurG8xE8lXSmBDLY4BYGvkCIlIxxUjzHfzoxeii6BVeNAC8sXP+hE
 coH3N3LGIumeEN9CbNVOqXS2EwW2uvrFqSolKrurFnkvD/0MS/ArZJHGzxVLIkwqW1RyTVSKE7u
 zwmzm6z1egm+/kxlk6L75727ZZX+rbn880DJf0StpovWc4Q2jVJRXwQPauHGbWoYURdccCUYgzQ
 Nua7SvSbzn2pLinN/v9nnI0H/AwTRBQHbUi6c7xOdoxLHvc9/8tHMUdvqH+takIScNj90K+s1jN
 hTCbavegLG5a5a15wjT7CihlPay34nv9BAlu4z57mtVw5SpGaB3x4y9VFr5tr0U8RnbQ57w3
X-Proofpoint-GUID: te1126rJXdnLfpP9QMWaKUfxVqz2_JkR
X-Authority-Analysis: v=2.4 cv=B/G50PtM c=1 sm=1 tr=0 ts=681c8bc5 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EgBjQOAtpNY6-goZWe0A:9 a=CjuIK1q_8ugA:10
 a=OIgjcC2v60KrkQgK7BGD:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: te1126rJXdnLfpP9QMWaKUfxVqz2_JkR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-08_03,2025-05-07_02,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0 spamscore=0
 suspectscore=0 phishscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505080093

On Tue, May 06, 2025 at 11:47:31PM +0800, Jun Nie wrote:
> Some display controller support flexible CRTC and DMA, such as the display
> controllers in snapdragon SoCs. CRTC can be implemented with several mixers
> in parallel, and plane fetching can be implemented with several DMA under
> umberala of a virtual drm plane.
> 
> The mixer number is decided per panel resolution and clock rate constrain
> first, which happens in CRTC side. Then plane is split per mixer number
> and configure DMA accordingly.

Here you are describing a behaviour of one particular driver as a reason
to change the framework.

> 
> To support such forthcoming usage case, CRTC checking shall happen before
> checking plane. Add the checking in the drm_atomic_helper_check_modeset().

So, now drivers will get two calls to atomic_check(), one coming in
circumstances which were not expected by the drivers before. Are you
sure that this won't break anything?

> 
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/drm_atomic_helper.c | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
> index 5302ab3248985d3e0a47e40fd3deb7ad0d9f775b..5bca4c9683838c38574c8cb7c0bc9d57960314fe 100644
> --- a/drivers/gpu/drm/drm_atomic_helper.c
> +++ b/drivers/gpu/drm/drm_atomic_helper.c
> @@ -816,6 +816,25 @@ drm_atomic_helper_check_modeset(struct drm_device *dev,
>  			return ret;
>  	}
>  
> +	for_each_new_crtc_in_state(state, crtc, new_crtc_state, i) {
> +		const struct drm_crtc_helper_funcs *funcs;
> +
> +		funcs = crtc->helper_private;
> +
> +		if (!funcs || !funcs->atomic_check)
> +			continue;
> +
> +		ret = funcs->atomic_check(crtc, state);
> +		if (ret) {
> +			drm_dbg_atomic(crtc->dev,
> +				       "[CRTC:%d:%s] atomic driver check failed\n",
> +				       crtc->base.id, crtc->name);
> +			return ret;
> +		}
> +	}
> +
> +
> +

Too many empty lines. But the main quesiton is: why are you calling it
before mode_valid()? According to your description a better place would
be in drm_atomic_helper_check_planes().

>  	ret = mode_valid(state);
>  	if (ret)
>  		return ret;
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
