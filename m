Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD368F5B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743358422; cv=none; b=QhFfxSn1HVKwzdzaWai9xp0s4vunwDugq87QIE4iXn/s1NLyr1iSt+KZuuocXlwaez5tiZPLPRbE9+RrTzfuWd2iaOOxsqQEIEO4bx0+88mstQs7cw91Jrd7BU3ec3Cv6ZmuSslImO/RTZxog8k/i9m/RiQ04ffDpt4gxK8KdTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743358422; c=relaxed/simple;
	bh=UxilOz4/nLbeO+MIl5Z0g4dukc9tCqWGnsSN319YM7o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sGH28H6j7a1Gp0bclbBVN7p3HCZB8LShnYGvz3dNTwhWZ8dSheXk6MNSQ85NLNyCZHce2bIYdBcfAOc5JjlzwUOKnshlji3xCRHbnNew9z2oyO2aKNiNjwGr0EH1omkJmfac1HcEfRchdPYqx9HrHQ8LP5MlrXXMtCLf5Vw+lWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wj1JArsI; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wj1JArsI"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UHhTsc014615
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:13:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=WUEN9iRJb1WzYvZmH1HZeasB
	WdQUxWrzY9CiMNkx66c=; b=Wj1JArsI0uRhzRfVsniUlPULPw7x5Ya97GrtwRxN
	+IevovQsqYWb84MFVy+n3j1oXYg0Pou3CXLGNePVDNfuOHRuax3pV8x/gGLzIDcq
	RlNEvS62jIaxMDvuiiexFnsBY5iQUfIXK1JuUqvi3XEYJSryhhE3p1Q8/MpfCKj6
	Vttq6/fH6UU/Jm+tDnyap+tYmjDuAHF+2hbvgnIQQz1FYq6s7ED1iK2vMYg7zfLq
	ofFpxbWIcsAAHvsvCQjMFbQpPihAdh45Om7vToSXrFZi4UvGyoR+fxcsZo9MHR9+
	uHMbg3AwHlMFZYgXQdxa7SLeEMnkyZMqjbLc6jIcV2OPIg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p9892kh7-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:13:39 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-7c54a6b0c70so358247085a.0
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 11:13:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743358419; x=1743963219;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WUEN9iRJb1WzYvZmH1HZeasBWdQUxWrzY9CiMNkx66c=;
        b=dsvdT3HldVk7DH6RS+XsQ2q9+jhi3A6FJa8bsqDOeLu0UnrI/EM/NGG6iMv8YVCRoC
         NJbeOfIM/bRZuCWlsC00d73XP9B+fIayoN4lp9eN3nZyR+GLa0gdsuQnDzCKsKx1mDNf
         piEdlz8o6CaU9MhYytJ1PNbVAzziO2uZh+0QW4cycqjmerOeLVDOLsrGKHf44pXJWVRF
         MRm3L9P+nCW7G1AZ/9XdtyElnc5V0hKRayCu7V6Hw1SdtYNr/7NFCMvKNYcfOBAELkSy
         RjpE3HcJUlxFefx0XHWKmeB6/z6oxVkhJwZoyVNjSIl+ugQnSP64EZsEG1f/Jhhh0P8T
         rStg==
X-Forwarded-Encrypted: i=1; AJvYcCWHJhDeQt0ac6RoB8WFcpbx7wYpdjKB9g4x4zcE3AxTA1jCABDIHOts0bTgdvXWQsS18X9POrHdX/zevKM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyLyL8WwhZcYWMza9JksK3CIPOOU9ZbJbEvSBwT51DfvcoMbCBD
	/DPNe/umlLS5BzyH82OcpXhiBxfs2OE2V1fhzmC1sjYug8ijKg774SVkk8y56VnPBbC039Hma7/
	ED3aukPEsdxeXXL10AKGoOIpEbgsah62F7f+py/DZLHdtn2SgLeJtvmqkTciHx4k=
X-Gm-Gg: ASbGncsJlMOP2zJxfM3bHUlxFaXlwhYbRHWZcW3ctJfUw3jy/gNtd5DghLigKFeo8t9
	epliPxznUncREO4S/CgXDtkYtgmi6rYogDcDE9Ifum7mjlXwAhTWuQ3zYFApOMJSa3bn3llecYV
	jrlx4kcSFOREbZwm5hf3aAnPixNSw3uVqjQa1eVEH0XtvE1YQGXQpzZBX+QB9aMOXN1BaoR7hq+
	CuN7Il8wfH3zVoR4de1RaOMyHSU0Sja+a/lp/BBCkrPxlzIwRaPkytf9G6pPmYFO8t97YJKPCnh
	iPLlVtH+TddE0aiE297wd+xTrbrcQTnjeLbBZlPHLltpkVLQth7ZiKTVTx/LuW49+aK5cfbq7Ri
	UmCw=
X-Received: by 2002:a05:620a:4045:b0:7c5:55f9:4bcb with SMTP id af79cd13be357-7c6907302cbmr900183985a.31.1743358418906;
        Sun, 30 Mar 2025 11:13:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGq5lxxs4WWVuVHIdOx1mQAVzaioVzGDl41ZQcSwyaKYLad4CANSMH1Tb9wh/8tQqgwQchTBw==
X-Received: by 2002:a05:620a:4045:b0:7c5:55f9:4bcb with SMTP id af79cd13be357-7c6907302cbmr900180585a.31.1743358418566;
        Sun, 30 Mar 2025 11:13:38 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-30dd2aa92a3sm11779521fa.12.2025.03.30.11.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 11:13:36 -0700 (PDT)
Date: Sun, 30 Mar 2025 21:13:33 +0300
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
Subject: Re: [PATCH v2 1/5] drm/bridge: it6505: fix link training state HW
 register reset
Message-ID: <2qtjj5twmzhijjg2l66ulajtkrwpjozmwqv4c7ygvxizgewao7@6ingwjrdene3>
References: <20250326-fix-link-training-v2-0-756c8306f500@ite.com.tw>
 <20250326-fix-link-training-v2-1-756c8306f500@ite.com.tw>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250326-fix-link-training-v2-1-756c8306f500@ite.com.tw>
X-Authority-Analysis: v=2.4 cv=fIk53Yae c=1 sm=1 tr=0 ts=67e989d3 cx=c_pps a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=Ns9eNvu6AAAA:8 a=_uL5M0xGhN6UrWZjKboA:9 a=CjuIK1q_8ugA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=LZLx1i01EnjtqRv10NxV:22
X-Proofpoint-GUID: chYHgTN2My5zK1yUDFVGrFkza2VH5ijw
X-Proofpoint-ORIG-GUID: chYHgTN2My5zK1yUDFVGrFkza2VH5ijw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_08,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 malwarescore=0
 impostorscore=0 mlxscore=0 adultscore=0 phishscore=0 suspectscore=0
 mlxlogscore=999 clxscore=1015 lowpriorityscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502280000 definitions=main-2503300127

On Wed, Mar 26, 2025 at 01:34:13PM +0800, Hermes Wu via B4 Relay wrote:
> From: Hermes Wu <Hermes.wu@ite.com.tw>
> 
> In order to reset HW link auto training state,
> bits FORCE_RETRAIN and MANUAL_TRAIN at REG_TRAIN_CTRL1 must be set
> at the same time.

Nit: please start by describing the problem that the patch attempts to
solve.

> 
> Signed-off-by: Hermes Wu <Hermes.wu@ite.com.tw>
> ---
>  drivers/gpu/drm/bridge/ite-it6505.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/bridge/ite-it6505.c b/drivers/gpu/drm/bridge/ite-it6505.c
> index 88ef76a37fe6accacdd343839ff2569b31b18ceb..b47042dc06bb1e1dfd92bc0dc6d69dc918a140ba 100644
> --- a/drivers/gpu/drm/bridge/ite-it6505.c
> +++ b/drivers/gpu/drm/bridge/ite-it6505.c
> @@ -1806,7 +1806,9 @@ static bool it6505_link_start_auto_train(struct it6505 *it6505)
>  	mutex_lock(&it6505->aux_lock);
>  	it6505_set_bits(it6505, REG_TRAIN_CTRL0,
>  			FORCE_CR_DONE | FORCE_EQ_DONE, 0x00);
> -	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
> +	/* reset link state machine and re start training*/
> +	it6505_write(it6505, REG_TRAIN_CTRL1,
> +		     FORCE_RETRAIN | MANUAL_TRAIN);
>  	it6505_write(it6505, REG_TRAIN_CTRL1, AUTO_TRAIN);
>  
>  	while (timeout > 0) {
> @@ -2377,7 +2379,7 @@ static void it6505_stop_link_train(struct it6505 *it6505)
>  {
>  	it6505->link_state = LINK_IDLE;
>  	cancel_work_sync(&it6505->link_works);
> -	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN);
> +	it6505_write(it6505, REG_TRAIN_CTRL1, FORCE_RETRAIN | MANUAL_TRAIN);
>  }
>  
>  static void it6505_link_train_ok(struct it6505 *it6505)
> 
> -- 
> 2.34.1
> 
> 

-- 
With best wishes
Dmitry
