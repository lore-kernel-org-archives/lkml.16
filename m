Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B6474A35
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:30:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743406226; cv=none; b=Ai49EzrONM64zaGAvuz0FQptUO7q/KWZ+ZxYJ0PVMXwcKzdf9UZkeAPqxb9IgrEsRHwnSETfBML2AuAUHnlQXDTQjuDtMFAZmU3JgT3jzukb+eVxKsjO3B66UkPQDt9eERO0cQ781pBEe7FUQ+gs8HcO2F/dDccJvgHhK6WKgFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743406226; c=relaxed/simple;
	bh=n5SoDz3wRhkOgRRMHiiXP8lmoGD3V5Zh4ZefFDojSBU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PM4kc43Zjyuii6NRVSrDsz4R1wlhY7uuoWglgYm5SNe3mZAvqOvEJ1I75KbOARwRp92FAREVxEc1LzAq7Nn5RsYe9ACaidCuxGAgrk7TYszZp4MXKt2ByuHTNbJiOGGzLuDYzDd3glLaMY8dYLBLoL7O9VjcXvvNXUMJkIe2ddw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Oc/OhFTW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Oc/OhFTW"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52V6kdqX003590
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:30:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	USMO1/3Q6LQ9zEtI2Anlh9hW1RnAEcvlyAx6uAaEpAM=; b=Oc/OhFTWwDXsJIlb
	+EiqHqlt1ySvn8l1yj6kmhWxCxPoYSDpOYeNi7f1u6GnDGMlbBD2Evx3fPSRed65
	slJJaiL+uCSWIKEXDpClA2N3mvuV2wWm6mwqSWtweubKLAHRonD0E2ONdbKpyHi6
	VaQEeZVpOMLjXN+gN91zPtpkOkY6YxVSmOCtdDiiZ9hFJZ406VSnWhK/xdmS4FJl
	0hi06n2lCnbv/AAXhHm+TJRZ4jK/aWGG/yPad8xp6nZzMkAb3YuMckHQSidgobWv
	leI27Niq86jIBMoakizg6/1juwo+Gy8TOpqIua15tWDVjEvtrxdM+O6d72wWcH3+
	fbUwjQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p935urrx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 07:30:23 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-6e8feea216aso94814496d6.0
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 00:30:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743406222; x=1744011022;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=USMO1/3Q6LQ9zEtI2Anlh9hW1RnAEcvlyAx6uAaEpAM=;
        b=cb0G/baXqQg/C205p5du+zLPeGN4Oq9Z3D5o73T1tAIPs794k1Mwscf1OZOqznBYes
         7mvVMf+U/h+YDApAdZXz3Anyderl41Gf5wszpLVQTgURBRHbKkJfuPsBtiNqKaLKDSPV
         7Ob3xLe2+DLLauEv1ybpRuBHeie75NpBtgbivbcFJW/+5KFsAprvdOliNSsQ1eOe7i/C
         SEip93UC2RflveyxzjMxL0oF5QN/npLA+3qlqTilgI2y7+SAJxUQafEbg7TWyrPk6kYS
         iQte4d5Z/fG1TKe2H0hgeoS13daO4qJ84oi3DVye7GR8B/kA1aVw6jwr9AWHnF7Cvzba
         4mfg==
X-Forwarded-Encrypted: i=1; AJvYcCXS9PlkcJC84NIAEc/W9v1YhHFoTbn0aTqQlxodV/OQSgF6EvFjS+6mgaecCoWimOFo+610Zoa1XaDszjY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyvMUgmhmJfJ5ynur8ZGpv+QcuvNzkDmSINUN4hcRw0kXtzx67p
	219KUPajuNV604krd0koIzr3VE433MorjERWUdbXiUGqeErXx3+gWsuvh0mU8CTuZ6nATh3yZMo
	C9IaYmE+yLRMbqf5e1nzKVEMObzRdfpoIXJ30uHumYYsx7P5Ue4U7hybrBJAhPDY=
X-Gm-Gg: ASbGncu3LgzX/7nphISsRv8GcMyyTBcysvdH2NbDonNWJonTdnw+X1y5g0bMBEI/9gb
	sjcQUhi5fjKAYUo+h2CsJtdZipJZS4DU6BLJfltNYTgCbPt3yVXPKFrRSW/vzVYE7UG2vlTc38Q
	jWo8r1uhB8Y2w/+OXgPGiaBDOuoKfM5RpyI0Ap/6BfjjNIuw+Z/7yZ0+mSs5/93yjhS/wIKW7Zs
	zLqc3aD3jbStdTyeEONoigrz97X2Yc1Md+Vxtr4OkLbILFC4v9kbsthr10vscx5XymJzeePThPC
	64I38EtivkD6SI6dMVS6IJ2J7Ud3UDV5FMd94u5SW2tGXPGOGBNdfYjyu7PXtmQS0E30Dy5qOS/
	D+tY=
X-Received: by 2002:a05:6214:2248:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6eed517468emr146030846d6.1.1743406222604;
        Mon, 31 Mar 2025 00:30:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEnOgh9D7wsr/rVquCW+QBSn0LaG1Nx9wsrvIFyqwl3Pk5pH/CEA9s+7Qd8gDLnD2T0Oab5xA==
X-Received: by 2002:a05:6214:2248:b0:6e2:485d:fddd with SMTP id 6a1803df08f44-6eed517468emr146030506d6.1.1743406222234;
        Mon, 31 Mar 2025 00:30:22 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2b59780sm13355181fa.108.2025.03.31.00.30.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 31 Mar 2025 00:30:20 -0700 (PDT)
Date: Mon, 31 Mar 2025 10:30:17 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Hermes.Wu@ite.com.tw
Cc: andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
        Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
        jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, Pet.Weng@ite.com.tw, Kenneth.Hung@ite.com.tw,
        treapking@chromium.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
Message-ID: <pbcwdoxu3k4nvfn5vpfap52dczsaykewkzxvf5x5moqoeq4wn3@j3pxtx3cgokd>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-3-756c8306f500@ite.com.tw>
 <cyanpojalscyqlpvlefd5czuyd2prrstws73pmza3tecq2ha2g@aegoyfuf6na6>
 <a6dcfa0c0a1e4f799dacda908888729a@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a6dcfa0c0a1e4f799dacda908888729a@ite.com.tw>
X-Proofpoint-GUID: mncglb-0wYV22GIfPIsQJNCYUKLb3nqx
X-Authority-Analysis: v=2.4 cv=KOFaDEFo c=1 sm=1 tr=0 ts=67ea4490 cx=c_pps a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=EUspDBNiAAAA:8 a=QyXUC8HyAAAA:8 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8
 a=P1BnusSwAAAA:8 a=pGLkceISAAAA:8 a=cm27Pg_UAAAA:8 a=e5mUnYsNAAAA:8 a=NIZf8mjcyvcE1nquY-IA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22 a=LZLx1i01EnjtqRv10NxV:22 a=cvBusfyB2V15izCimMoJ:22 a=D0XLA9XvdZm18NrgonBM:22
 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: mncglb-0wYV22GIfPIsQJNCYUKLb3nqx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-31_03,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0
 impostorscore=0 clxscore=1015 lowpriorityscore=0 mlxscore=0
 priorityscore=1501 malwarescore=0 bulkscore=0 adultscore=0 spamscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503310052

On Mon, Mar 31, 2025 at 02:31:30AM +0000, Hermes.Wu@ite.com.tw wrote:
> >-----Original Message-----
> >From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 
> >Sent: Monday, March 31, 2025 2:44 AM
> >To: Hermes Wu (吳佳宏) <Hermes.Wu@ite.com.tw>
> >Cc: Andrzej Hajda <andrzej.hajda@intel.com>; Neil Armstrong <neil.armstrong@linaro.org>; Robert Foss <rfoss@kernel.org>; Laurent Pinchart <Laurent.pinchart@ideasonboard.com>; Jonas Karlman <jonas@kwiboo.se>; Jernej Skrabec <jernej.skrabec@gmail.com>; Maarten Lankhorst <maarten.lankhorst@linux.intel.com>; Maxime Ripard <mripard@kernel.org>; Thomas Zimmermann <tzimmermann@suse.de>; David Airlie <airlied@gmail.com>; Simona Vetter <simona@ffwll.ch>; Pet Weng (翁玉芬) <Pet.Weng@ite.com.tw>; Kenneth Hung (洪家倫) <Kenneth.Hung@ite.com.tw>; treapking@chromium.org; dri-devel@lists.freedesktop.org; linux-kernel@vger.kernel.org
> >Subject: Re: [PATCH v2 3/5] drm/bridge: it6505: modify DP link auto training
> >
> >On Wed, Mar 26, 2025 at 01:34:15PM +0800, Hermes Wu via B4 Relay wrote:
> >> From: Hermes Wu <Hermes.wu@ite.com.tw>
> >> 
> >> IT6505 supports HW link training which will write DPCD and check 
> >> training status automatically.
> >> 
> >> In the case that driver set link rate at 2.7G and HW fail to training, 
> >> it will change link configuration and try 1.65G. And this will cause 
> >> INT_VID_FIFO_ERROR triggered when link clock is changed.
> >> 
> >> When video error occurs, video logic is reset and link training 
> >> restart, this will cause endless auto link training.
> >> 
> >> Modify link auto training with disable INT_VID_FIFO_ERROR to avoid 
> >> loop and check INT_LINK_TRAIN_FAIL event to abort wait training done.
> >> 
> >> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> >> ---
> >>  drivers/gpu/drm/bridge/ite-it6505.c | 38 
> >> +++++++++++++++++++++++++++----------
> >>  1 file changed, 28 insertions(+), 10 deletions(-)
> >> 
> >> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c 
> >> b/drivers/gpu/drm/bridge/ite-it6505.c
> >> index 
> >> 0607f99446b37c82b41a376c2f4e10c7565d1b61..e0e13e737763fb801fd1cd803734
> >> a0d6ae1dd812 100644
> >> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> >> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> >> @@ -1800,11 +1800,20 @@ static void it6505_link_training_setup(struct 
> >> it6505 *it6505)
> >>  
> >>  static bool it6505_link_start_auto_train(struct it6505 *it6505)  {
> >> -	int timeout = 500, link_training_state;
> >> +	int link_training_state;
> >>  	bool state = false;
> >>  	int int03;
> >> +	struct device *dev = it6505->dev;
> >> +	unsigned long timeout;
> >> +
> >> +	guard(mutex)(&it6505->aux_lock);
> >
> >Please don't mix functional changes and refactoring.
> >
> >> +	/* Disable FIFO error interrupt trigger  */
> >> +	/* to prevent training fail loop issue   */
> >> +	it6505_set_bits(it6505, INT_MASK_03, BIT(INT_VID_FIFO_ERROR), 0);
> >> +
> >> +	it6505_write(it6505, INT_STATUS_03,
> >> +		     BIT(INT_LINK_TRAIN_FAIL) | BIT(INT_VID_FIFO_ERROR));
> >>  
> >> -	mutex_lock(&it6505->aux_lock);
> >>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
> >>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
> >>  	/* reset link state machine and re start training*/ @@ -1812,32 
> >> +1821,41 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
> >>  		     FORCE_RETRAIN | MANUAL_TRAIN);
> >>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
> >>  
> >> -	while (timeout > 0) {
> >> +	timeout = jiffies + msecs_to_jiffies(100) + 1;
> >> +	for (;;) {
> >>  		usleep_range(1000, 2000);
> >>  		link_training_state = it6505_read(it6505, REG_LINK_TRAIN_STS);
> >>  		int03 = it6505_read(it6505, INT_STATUS_03);
> >>  		if (int03 & BIT(INT_LINK_TRAIN_FAIL)) {
> >> -			it6505_write(it6505, INT_STATUS_03,
> >> -				     BIT(INT_LINK_TRAIN_FAIL));
> >> -
> >>  			DRM_DEV_DEBUG_DRIVER(dev,
> >>  					     "INT_LINK_TRAIN_FAIL(%x)!",
> >>  					      int03);
> >>  
> >> +			/* Ignore INT_VID_FIFO_ERROR when auto training fail*/
> >> +			it6505_write(it6505, INT_STATUS_03,
> >> +				     BIT(INT_LINK_TRAIN_FAIL) |
> >> +				     BIT(INT_VID_FIFO_ERROR));
> >
> >Why can't it stay where it was?
> 
> Do you mean stay at original INT_LINK_TRAIN_FAIL clear and just add INT_VID_FIFO_ERROR?

Yes.

> 
> 

-- 
With best wishes
Dmitry
