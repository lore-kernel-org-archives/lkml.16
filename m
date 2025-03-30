Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618BB17548
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:46:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743360380; cv=none; b=Jcy6oryerMN/P8gZDE2Z6azAc6IrFwo/BS08nFda1Nh40aCWxjpYVynMqJgaQplv5r0Ckwt140R+C6P2GneVC0M6e0LKfUnO87DgaMIX1D1k+WgNB33pAICyjjZAJcA/kH75wZrOxUSW29SvrnKT/CjKySyaObIM36rGzLIMHDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743360380; c=relaxed/simple;
	bh=pzWohy5229Toj/0yuwWM602KMW/+q+4wyvkjAKfOgXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ElU9h94+nUfF+3EnGHCYeyVOvfle3EL/Epr2kXGY6UYkM7M5uxxwSudZxpaHB2+X4h4kYmExPCyaaZ2H7vztQ1JtSqoHMOhaDrc/eIXS7tzfv5JMt2vNBraRgj+1aQ7JXCNr/Nddih2/CoLe0Q+w0LluLIbU3nIuDGJ57M0lK+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pqjWk2Xe; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pqjWk2Xe"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UCVm3P020977
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:46:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=vOlLqEjKwbxEq639/h9Id8+4
	Qr2lhoih+XgMY4+YVDc=; b=pqjWk2Xe+Qxd2TWYxD5R0zkkkpJp4aU9hxNpvESD
	JSCKTmjyyhp2hN0j6cLvS460Mex0QASMzc2YbgWiEEob5JAX7X7ApKLIIYffvKxd
	SM/54Z/9RsqHDad0My8RyGeu31hd/AuJCk0ElLO5OSjHq78Av+qKxsIFyP6OJuIj
	P58BDkn8E3UBhrTDTahFl1QDLFXDbkaH2EYbrY+rbIGuBrpAzm77Nno/lNEkOr02
	N75BSdSpBKn77TDclsLjuEm6qAoBTNYRYPCKR+p6MxZKY9Z8jyAyT54w5BvVJ1Rp
	igtGnz4GpOjeOoZESR2fOTzJrJLvpD4VpOlLFREDb52k4w==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9mjjk7v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:46:18 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-7c5c77aff55so921051985a.3
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743360377; x=1743965177;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOlLqEjKwbxEq639/h9Id8+4Qr2lhoih+XgMY4+YVDc=;
        b=FkA3w+lLQFDgnJ3Id+9u9UwwOKcYunlWOpiRpSYEy9pivk1eS2yDWh4R78JwMUM71q
         HFrR9GQmJz2w9raNZRsc2cvC+LTV8Kj+4C+4CVOmUqNIKGenkyY/CsKytQuCLsGxsJy1
         uJw7WyWgCn/X85J7VpgNnPYyLpcTRMkhiPRelDJqtGwo59x6DDZSowyoFqbHJfXIAcAb
         xEFwGHcpYrFTzQtsrLTJXdKGMvML++6+i+fDc5/0zSbGXxh6+4f2A77ntrFvrHr5F4v4
         xxFcN0lgb/ye/geSgyFwjoPYdGcNsbvV5XFgmf9yXOFkZ7yTPlVDwfTN6U8kYgcJkQA1
         Dlyg==
X-Forwarded-Encrypted: i=1; AJvYcCV1PwQLZcm+720HkJ2eJGNCKKL/K23EAys354P5NbnfF1CEd50ICpMtkgPTreZ+o0cLcdWTNFn8rwoByvQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyepzwMGUJ82vGmQrwHxnjODeQSgYRuR6YhCu6qeXNUy5zZFKKC
	Xt4w53W3xEI12c32iHv1VUxrasILZz9Wk128QFB9PpN5Reh1P+azXWWuiTaoszlrhahSlzsP6A3
	WKm+5dX4amAxyJoxofRkKFGlTnNYKCDME/g1Q9BV2LJmATMRTLTHQm786ZMdr+V0=
X-Gm-Gg: ASbGncsD1xk7y4Ufwz5pD1c/ANCiW4Z0knbsXTkd38e7ywpUcB62sVolS0HVRa4hdBI
	c0Ch3Z/Kghbqj9mR3wVO6a+iLnEAr0d+RMT/xnMrWZicJZfw9xoaa0wNQJ8kpIwn9+29fOvvS3D
	nMBreMTaDVsMt+1sT1Qudt+eEfqr58bdRjEponG4VhkgAEbaPHTJxUZja8OaAcxhxuVP7+RPA+P
	pmTTMQbw0/vpBSvdw1KQPNgTK0fTkzw2vsjxlVCFpfc4yGRIMgQUMsAi6o7U1X4rNY5RAucusui
	e526ZyyN9ZPgXaTCjwUOtNvHvM/UWOxTBKvfOlfrSrKWND08wOv+RzftpbOEN6sQREe8NGaeqVL
	cT1Q=
X-Received: by 2002:a05:620a:4454:b0:7c5:6291:904d with SMTP id af79cd13be357-7c6908758e1mr863306885a.38.1743360376742;
        Sun, 30 Mar 2025 11:46:16 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGmBVhEQYU73drJz7EC/guyVz0cEaX8wDqOsw9gIjYHp01Ieg/NUkgxp3VYtEZx2GwJw2hT/g==
X-Received: by 2002:a05:620a:4454:b0:7c5:6291:904d with SMTP id af79cd13be357-7c6908758e1mr863304885a.38.1743360376301;
        Sun, 30 Mar 2025 11:46:16 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2ab9705sm12073651fa.46.2025.03.30.11.46.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:46:14 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:46:11 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.wu@ite.com.tw
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
        Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw, treapking@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/5] drm/bridge: it6505: skip auto training when
 previous try fail
Message-ID: <poqcbsiibivd7sguf7pe477noo67jp2hfli54j5yeqgvzw7vdj@wmfjdqf6akmp>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-5-756c8306f500@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-5-756c8306f500@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=Mfhsu4/f c=1 sm=1 tr=0 ts=67e9917a cx=c_pps a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=6XuZkpsQUAZ6t1zeVoMA:9 a=CjuIK1q_8ugA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-ORIG-GUID: BS7vytAMEcbQ8RFqqtExcvjuqDIYY9Qv
X-Proofpoint-GUID: BS7vytAMEcbQ8RFqqtExcvjuqDIYY9Qv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 suspectscore=0 clxscore=1015 impostorscore=0
 malwarescore=0 spamscore=0 adultscore=0 phishscore=0 mlxscore=0
 bulkscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300132

On Wed, Mar 26, 2025 at 01:34:17PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> When connect to device which can only training done by
> step training, skip auto training when link training restart,
> usually happen when display resolution is changed.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 29 +++++++++++++++++------------
>  1 file changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 2bbe787ccb1b57906f2a31a011dd92f327019b08..47f8134df8b6f5c2172c6cfdbc91da8063993a05 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -467,6 +467,7 @@ struct it6505 {
>  	struct delayed_work hdcp_work;
>  	struct work_struct hdcp_wait_ksv_list;
>  	struct completion extcon_completion;
> +	u8 step_train_only;
>  	bool hdcp_desired;
>  	bool is_repeater;
>  	u8 hdcp_down_stream_count;
> @@ -2457,11 +2458,13 @@ static void it6505_link_step_train_process(struct it6505 *it6505)
>  				     ret ? "pass" : "failed", i + 1);
>  		if (ret) {
>  			it6505_link_train_ok(it6505);
> +			it6505->step_train_only = true;
>  			return;
>  		}
>  	}
>  
>  	DRM_DEV_DEBUG_DRIVER(dev, "training fail");
> +	it6505->step_train_only = false;
>  	it6505->link_state = LINK_IDLE;
>  	it6505_video_reset(it6505);
>  }
> @@ -2477,18 +2480,19 @@ static void it6505_link_training_work(struct work_struct *work)
>  
>  	if (!it6505_get_sink_hpd_status(it6505))
>  		return;
> -
> -	for (retry = AUTO_TRAIN_RETRY; retry > 0; retry--) {
> -		it6505_link_training_setup(it6505);
> -		it6505_reset_hdcp(it6505);
> -		it6505_aux_reset(it6505);
> -
> -		ret = it6505_link_start_auto_train(it6505);
> -		DRM_DEV_DEBUG_DRIVER(dev, "auto train %s,",
> -				     ret ? "pass" : "failed");
> -		if (ret) {
> -			it6505_link_train_ok(it6505);
> -			return;
> +	if (!it6505->step_train_only) {

No need to. Just

		for (retry = AUTO_TRAIN_RETRY; retry > 0 && !it6505->step_train_only; retry--) {

> +		for (retry = AUTO_TRAIN_RETRY; retry > 0; retry--) {
> +			it6505_link_training_setup(it6505);
> +			it6505_reset_hdcp(it6505);
> +			it6505_aux_reset(it6505);
> +
> +			ret = it6505_link_start_auto_train(it6505);
> +			DRM_DEV_DEBUG_DRIVER(dev, "auto train %s,",
> +					     ret ? "pass" : "failed");
> +			if (ret) {
> +				it6505_link_train_ok(it6505);
> +				return;
> +			}
>  		}
>  	}
>  
> @@ -2599,6 +2603,7 @@ static void it6505_irq_hpd(struct it6505 *it6505)
>  			it6505_variable_config(it6505);
>  			it6505_parse_link_capabilities(it6505);
>  		}
> +		it6505->step_train_only = false;
>  
>  		it6505_drm_dp_link_set_power(&it6505->aux, &it6505->link,
>  					     DP_SET_POWER_D0);
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
