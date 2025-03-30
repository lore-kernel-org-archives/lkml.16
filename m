Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 125531DDC35
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:43:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743360228; cv=none; b=ubf+wMzshipc4hdbZoRaSJwiBlPEdI4p/iATlB4M6JlZm7swl3FG3QVY/WMeUcET2a01A9IJgDQ4wuq/aC8Df2Ltozl67yOdDiaDSGVlHw73DbmrH37+cSJHL+ZSwX/NOB+fhC5GRJwAyO00Rof6LlHko1/MqwoGvuOfRbbvG6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743360228; c=relaxed/simple;
	bh=Oubkl3HgNA3HBfy8rVa4HE3qSOOtTivQ/Vw2Yby7NmA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/8Q34J1RagSGdVXZTdrGv23A0fftoBBIxXONF3F3+B2P9kzNToaQl4TvBg1ghi8m6cIiWJMBWjWSLqYLFp6ONis/F9usXIL+/3mgaxV+hNtzxbay6mkekRUj7xBZgUZYHukK5zlml7aX8ntV+7YnGlg+j3YGLJNRnTpSItlZww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lnhCwLvl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lnhCwLvl"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UHVEnk027466
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:43:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Kpfc/NFzZ1WMuMvGu1P2hqQL
	dzPYzaOT3QNvQ+BqJ+o=; b=lnhCwLvl5tL0oWk5TWjFyTs57eLRdAwf4khuSFuI
	XnJkznzdR5nfrQztcJR1z/jJ/2bc4vwezX8hIjGYwnjtV/E7ni0ztLbU88NarLuo
	Ch/uyPKpFEu2MiBZWbXcJ3Y4LWeKG32XgKlIY5mt+5uYWV34ug1gv0vcKghv0MFn
	cEFRG6mUrUeiXh3yglrzelKoVLkLdyMv448dPhUHO2HCYaZZVMV/api8XgKmDO8p
	eXNFAjYNzfeUNR3k0rVlii5DyDfzf8SClGZplQVBXFm80AzWiSnIV/zT+4vZUzZ/
	FIc2qfaJKWvEzrXrL4lYywfmN7zIrtv3kc/vKkbpDC0i7g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9892mfr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:43:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c5c82c6d72so695101485a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:43:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743360225; x=1743965025;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Kpfc/NFzZ1WMuMvGu1P2hqQLdzPYzaOT3QNvQ+BqJ+o=;
        b=Kv+LJFUAXJ6iEZlmF2FGNic3nBJ3OtRyM3Q41+c1ZiqmVFnvLrpHlxHAQtWCmRMvSm
         Oqdi3TRuFVcjPe/N4EbVhd4s9AWYLC2iBR1l/U8GWqemhNFIhFr1xj+CuQ1clGZECxO1
         Bkp1LUdMEgPlhlMPAxljPVWT3se8yMVY56IcHy2+HNTz9wsKSyvdGXgKzmIvff/oVfkD
         DgwfEO1mVlfKe3lp3QkKKNRS57OivIwxaGMDHKPi7oiFvZ0TGoEtgKRTEb5yxk8t8vFQ
         7PBhM1um6Jz85fb9esE5mQMSNFoE1x2fhpzxpXLin+66kGHFP7afHifjiG07+BSjmuz2
         PDrA==
X-Forwarded-Encrypted: i=1; AJvYcCX7FM5BeKnjR7aQ4+LSb6MKwMph4xbl/LZhSPzXRZnIsJdJZHxkqVdZ+GXD5cf9JsR6coGkc+1CKr76wjo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0VkOhIMEWhGBaRz/jAypzvDO8U6v1flr/jvmYyxMEdRgnhblG
	8F9VOzRNl6Q3++eoFPMDbRg/cuoHmdsQfrBCKqqNmY1JqSrOxSRE4trHtRmJ6XUqX8fKrSfmCCr
	4/yNbqT8Bx24Pos311rUbP/KUxpgPol1vSznlA9OrzzfiG6iER91+scMh5ZBobrM=
X-Gm-Gg: ASbGncsfDqgjZR2tKIKXB97XjZOvj9W3y05duVX+Kll/BRs9UkJMaF5QOF8VYdmU275
	HqturDnviNyBlNIEDIOtwOQgDRGs0MDcFJk7Cpl9n2aq2oMqYH4l7ZkpHrx3cmfSXomfpo8aMLd
	jBjqHuzL6RvxNHzRHrY1K40IojSAFMwm7KVUtX9f6wRrgit1cUXHXh9tv007mCrdB+6e8WID0th
	m2UEVeMIuC5TsU/0I/fCwa4WfrT2dkf5Vg9F4lsfJCe+Va52eFJhqUcKTvcTNW+uGhMh1gu5IvT
	SJAUAr/APTB2/H2NBePv9Iij+2K1+N16pfZEeDfYVtHYGND7dtBzA7NbRo+zYLVnblhzSbaeD08
	DIEk=
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c6908757d6mr951048585a.35.1743360224770;
        Sun, 30 Mar 2025 11:43:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGyc5ZryX3N1yCP6KJlmCTencLbLEvyHdYw20hfuG3SCy1zQRmR5Jn2qLKantkKrvmtGGdPsQ==
X-Received: by 2002:a05:620a:294b:b0:7c5:f6d9:86ec with SMTP id af79cd13be357-7c6908757d6mr951046085a.35.1743360224396;
        Sun, 30 Mar 2025 11:43:44 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094bb230sm939905e87.15.2025.03.30.11.43.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:43:42 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:43:39 +0300
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
Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
Message-ID: <cyanpojalscyqlpvlefd5czuyd2prrstws73pmza3tecq2ha2g@aegoyfuf6na6>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e990e1 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=HDUQXmQPWCFJsoTofFMA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-GUID: D4fsFnNK-3kX_PiDFq0krPErjDrcQ22x
X-Proofpoint-ORIG-GUID: D4fsFnNK-3kX_PiDFq0krPErjDrcQ22x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300131

On Wed, Mar 26, 2025 at 01:34:15PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> IT6505 supports HW link training which will write DPCD and check
> training status automatically.
> 
> In the case that driver set link rate at 2.7G and HW fail to training,
> it will change link configuration and try 1.65G. And this will cause
> INT_VID_FIFO_ERROR triggered when link clock is changed.
> 
> When video error occurs, video logic is reset and link training restart,
> this will cause endless auto link training.
> 
> Modify link auto training with disable INT_VID_FIFO_ERROR to avoid loop
> and check INT_LINK_TRAIN_FAIL event to abort wait training done.
> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 38 +++++++++++++++++++++++++++----------
>  1 file changed, 28 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 0607f99446b37c82b41a376c2f4e10c7565d1b61..e0e13e737763fb801fd1cd803734a0d6ae1dd812 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1800,11 +1800,20 @@ static void it6505_link_training_setup(struct it6505 *it6505)
>  
>  static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  {
> -	int timeout = 500, link_training_state;
> +	int link_training_state;
>  	bool state = false;
>  	int int03;
> +	struct device *dev = it6505->dev;
> +	unsigned long timeout;
> +
> +	guard(mutex)(&it6505->aux_lock);

Please don't mix functional changes and refactoring.

> +	/* Disable FIFO error interrupt trigger  */
> +	/* to prevent training fail loop issue   */
> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> +
> +	it6505_write(it6505, INT_STATUS_03,
> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
>  
> -	mutex_lock(&it6505->aux_lock);
>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
>  	/* reset link state machine and re start training*/
> @@ -1812,32 +1821,41 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  		     FORCE_RETRAIN | MANUAL_TRAIN);
>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
>  
> -	while (timeout > 0) {
> +	timeout = jiffies + msecs_to_jiffies(100) + 1;
> +	for (;;) {
>  		usleep_range(1000, 2000);
>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
>  		int03 = it6505_read(it6505, INT_STATUS_03);
>  		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> -			it6505_write(it6505, INT_STATUS_03,
> -				     BIT(INT_LINK_TRAIN_FAIL));
> -
>  			DRM_DEV_DEBUG_DRIVER(dev,
>  					     "INT_LINK_TRAIN_FAIL(%x)!",
>  					      int03);
>  
> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
> +			it6505_write(it6505, INT_STATUS_03,
> +				     BIT(INT_LINK_TRAIN_FAIL) |
> +				     BIT(INT_VID_FIFO_ERROR));

Why can't it stay where it was?

> +
> +			if (int03 & BIT(INT_VID_FIFO_ERROR))
> +				DRM_DEV_DEBUG_DRIVER(dev,
> +						     "video fifo error when training fail");

Isn't the first message enough?

> +
>  			break;
>  		}
>  
>  		if (link_training_state > 0 &&
>  		    (link_training_state & LINK_STATE_NORP)) {
>  			state = true;
> -			goto unlock;
> +			break;
>  		}
>  
> -		timeout--;
> +		if (time_after(jiffies, timeout))
> +			break;
>  	}
> -unlock:
> -	mutex_unlock(&it6505->aux_lock);
>  
> +	/* recover interrupt trigger*/
> +	it6505_set_bits(it6505, INT_MASK_03,
> +			BIT(INT_VID_FIFO_ERROR), BIT(INT_VID_FIFO_ERROR));
>  	return state;
>  }
>  
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
