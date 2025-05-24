Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 727411DF738
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748100113; cv=none; b=TkdUXIU904fVDoqnOddrl2GWoTVGoIGmxIAj327KJFQxLrCVf0OzEYVvwm4CfYHgAOe/KXcksa8+bIRHabfdkTqaVaN7VpJrBI+bLFcoquLvEZfBujC+OkrEzVaiJlVwGxyd9uUiueYW893ei/ze+DDwORt10vc+DyJigOghNaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748100113; c=relaxed/simple;
	bh=YaVkfJwtgFdrn5gzuUVtEz4pIzRtElAQPRTQP561ETI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qW5nOGu8OvFfRgWPgOClxp9oV+ucOkmoPEeWaclNkGzAzSagb6Rva6lAh7NU8hwUQMBKX4NDBh2GfM2SNdy4Zctw7GH775LFr7vwhS/ouUrsvHjJQZDfB6YM4RiAa2HKy/SUXIlIHqSOvM5mV2B9xoopFnq609GpGAL8m0Umb4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=bF9sn1Ne; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="bF9sn1Ne"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54OBWPPB005697
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:21:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=nMycBBOQkD6yGLEg4dkgiJz5
	jZsjA/1T0M1HIP25/Us=; b=bF9sn1Ne8KEfOqmWubGcKSmj9OQgwJKoqu/LQbDB
	dRwW+3nnWo/zijqRaiwh69xBREtO/+TNIv4goKwhSU2jAv8XcSOqonCGnHaVsIVJ
	Q+DrfaM+tM56RFQQu10KYgtrqLpUneVOSu6rmv8fVABIqI3IDLxOKnjIJj3u4ypb
	jvjqVXAob54c/GRhV3vAvxWADr+WAhHVu6hHRetguoBsDD9VMtWKyIZ/wxHk28VR
	dBkOsiX+3OdQvplCm386PXL7m6wrTvchTs1kZqV1RxbDP0TAZEpzX5pnZsNQVEwM
	I0DMM5sNfNUMdJfSkM2hP7MfpMg1KimLP1lRAfakQE2yiw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46u5q1rtha-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 15:21:50 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-6f8d8f77d4fso14075696d6.0
        for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 08:21:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748100109; x=1748704909;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nMycBBOQkD6yGLEg4dkgiJz5jZsjA/1T0M1HIP25/Us=;
        b=CwaXxokoyoE4NsbDpVbfsrCX4H13qewRC28mi8U1b7BzhRQFVgPLLbJcxlzQLdr4fj
         VOzyYb+1Trn3Y7KnfIp3DIVB7BHiSb8xcUXGiPS99Br/HS113NgfLrR2UTE0bGJBkfRR
         qE/cDB75DJwoYJP3j8iTY+BDcX/CoLSo9SBFQ3vSudTcGrTp76FI31ECTHOeD4cgqzth
         MN9gSJexP6Tb9HUjxiDfLLUBnhChTeE22sX1IiykolY2QTEKst9ttVsy30bMcp8HXwhc
         jQbNwXhp1bp2058umWKycK7OXC9Eh3FWsWPhqiYkvfVXW5h8jBLipiuprVMLXAMCvDGY
         1O2w==
X-Forwarded-Encrypted: i=1; AJvYcCXaRbV/EtvgxqvhkC7+Cz2gJIt9KKgw0ARZFQcPW1ssBko1ySVCbb3JEQTg9PHSOQucSMWKBbuK4pQnIwY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy41ynaTEHCtvmm7aK0oo6OmurC21hW8jsWgKlqcHbNawmCMLgq
	Pn9Gj2xcU3+n3hea6f3XRWTC+m9T/KFkdOaUkNNeKrLvHD9oCm3OreCnMTD3vgBIeN/APYHCjmP
	PJnT7MtoULWpvCRFyx7QW6IMxQoXk3ZrS3zn0zOiISq+BeuiOMqBf1a5El9lpGEuCXRw=
X-Gm-Gg: ASbGncuq50hf1VnfHx6+tvz9lGsTN8yNjcVbz+io2sC9h8jx5IEWw1oZwlWG2MZt1ar
	C862/Cu3M87xskjGvl/jNtSX+0Bom5uZlem7O/b1bnyq1+BPG3P5gRsBhrI3rdrbywUAdUuJYGG
	iAK+o4S/Ig39D6qb3DdMlrsqfGfAKJjGo/6NmcbMj6sOyKc56ET3sXgmJJNIh4Jfhs48Htna9Q5
	2JQGoNM6xe/qRpXKVWOxdhpnMNGdk2xfP39HUgw5df8iTwqi58PdQ5kwpkzldAZNeNxjN7gu8gs
	/ZbOrfO8mpeRRWezfaTTBJXPWNnrwLLzPTyny9YnEvD+wG5qnySupQ/g+L2rtHrcQmr8y2q9C8o
	=
X-Received: by 2002:a0c:f10f:0:b0:6fa:a0ac:8d5b with SMTP id 6a1803df08f44-6faa0ac906dmr20504086d6.3.1748100109262;
        Sat, 24 May 2025 08:21:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE3Pn2GzOxsJUXYoGR0GlXygQmdCVrUA/w4oZdQ/mWB8Ob79GsyWPh6gfazt5HkB8buuEfwjA==
X-Received: by 2002:a0c:f10f:0:b0:6fa:a0ac:8d5b with SMTP id 6a1803df08f44-6faa0ac906dmr20503726d6.3.1748100108878;
        Sat, 24 May 2025 08:21:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702f462sm4369553e87.209.2025.05.24.08.21.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 May 2025 08:21:47 -0700 (PDT)
Date: Sat, 24 May 2025 18:21:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: jens.glathe@oldschoolsolutions.biz
Cc: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Matthias Kaehlcke <mka@chromium.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Douglas Anderson <dianders@chromium.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jessica Zhang <quic_jesszhan@quicinc.com>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>,
        Aleksandrs Vinarskis <alex.vinarskis@gmail.com>,
        linux-usb@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v4 3/5] usb: misc: onboard_usb_dev: Add Bison Electronics
 Inc. Integrated Camera
Message-ID: <mhgbarjaql2h3tknjem2sia6zpkkbswcriw4k7shjcz3sh4ylr@tsgig42plqob>
References: <20250524-tb16-dt-v4-0-2c1e6018d3f0@oldschoolsolutions.biz>
 <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250524-tb16-dt-v4-3-2c1e6018d3f0@oldschoolsolutions.biz>
X-Proofpoint-GUID: J_krpFedCQz49RdB9Ia2djSKywpXBMVz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI0MDEzOSBTYWx0ZWRfX1deKEKEzBJFt
 UK1mQuAgHrTbdmjYzsIAxFVmqvbvtK8OUOutp9tLxCtuK4vX0qtOUszmaRiri6748xPhtBxNbnD
 jhtQzjEHQUuPEGq9sZNyqF1Nsbzj1LYYM6FVTyfdzsUGM/EoIpIf9xblrwFdbrUziuilfFuR1bW
 m7lfY7Xa5qzUZghl+bbWDYMsEahiPyrXC9+DSyWXYoSrEaz10UHJtcplz+DqrS28kF7Tv/F+z2A
 cbQe9nlkoaFMmC7YyeWr5R7mdOgslgMgtDiFhBIbaNrMLwOsS4v6p4LVXYmvWuv1l8qO7Tql9i5
 eQU2R1N33QET+rNwLiwE1xT7WTwQAqtl3Ml70wQuj2NH51M76AUh22maN90Y/o8/guqoYrk6E2B
 dG4lZU1wVrutErJp4nEKaiPjkt4ImFivtYuFkSad06P2EjoLgpPm6WX9KzeLG3P0INb/zkor
X-Proofpoint-ORIG-GUID: J_krpFedCQz49RdB9Ia2djSKywpXBMVz
X-Authority-Analysis: v=2.4 cv=FLcbx/os c=1 sm=1 tr=0 ts=6831e40e cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=dt9VzEwgFbYA:10 a=gxl3bz0cAAAA:8 a=z0tmLejc3Eo1JMKNyZQA:9 a=CjuIK1q_8ugA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=kiRiLd-pWN9FGgpmzFdl:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-24_06,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 phishscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 mlxlogscore=999 mlxscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505240139

On Sat, May 24, 2025 at 01:48:38PM +0200, Jens Glathe via B4 Relay wrote:
> From: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> 
> The Camera is built into the Thinkbook 16 G7 QOY and directly attached on the
> usb_2 controller (dwc3 USB2 only). It has a separate power supply that needs
> to be controlled for PM.
> 
> Add the support for this device for the power supply.
> 
> Signed-off-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
> ---
>  drivers/usb/misc/onboard_usb_dev.c | 2 ++
>  drivers/usb/misc/onboard_usb_dev.h | 8 ++++++++
>  2 files changed, 10 insertions(+)
> 
> diff --git a/drivers/usb/misc/onboard_usb_dev.c b/drivers/usb/misc/onboard_usb_dev.c
> index 1048e3912068ced166c76838cf7306d86e192fe4..17b1f345b6b65bf25e68e77b0a345936825e1d04 100644
> --- a/drivers/usb/misc/onboard_usb_dev.c
> +++ b/drivers/usb/misc/onboard_usb_dev.c
> @@ -569,6 +569,7 @@ static struct platform_driver onboard_dev_driver = {
>  #define VENDOR_ID_TI		0x0451
>  #define VENDOR_ID_VIA		0x2109
>  #define VENDOR_ID_XMOS		0x20B1
> +#define VENDOR_ID_BISON		0x5986

The list seems sorted alphabetically. Please follow the lead.

>  
>  /*
>   * Returns the onboard_dev platform device that is associated with the USB
> @@ -677,6 +678,7 @@ static const struct usb_device_id onboard_dev_id_table[] = {
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x0817) }, /* VIA VL817 3.1 HUB */
>  	{ USB_DEVICE(VENDOR_ID_VIA, 0x2817) }, /* VIA VL817 2.0 HUB */
>  	{ USB_DEVICE(VENDOR_ID_XMOS, 0x0013) }, /* XMOS XVF3500 Voice Processor */
> +	{ USB_DEVICE(VENDOR_ID_BISON, 0x1198) }, /* Bison Electronics Inc. Integrated Camera */

This one too.

>  	{}
>  };
>  MODULE_DEVICE_TABLE(usb, onboard_dev_id_table);
> diff --git a/drivers/usb/misc/onboard_usb_dev.h b/drivers/usb/misc/onboard_usb_dev.h
> index e017b8e22f936be66da73789abb4f620e6af4d6a..816d9ce71eaddc7ab0cb4517558dd44a591d6c28 100644
> --- a/drivers/usb/misc/onboard_usb_dev.h
> +++ b/drivers/usb/misc/onboard_usb_dev.h
> @@ -115,6 +115,13 @@ static const struct onboard_dev_pdata xmos_xvf3500_data = {
>  	.is_hub = false,
>  };
>  
> +static const struct onboard_dev_pdata bison_intcamera_data = {
> +	.reset_us = 1000,
> +	.num_supplies = 1,
> +	.supply_names = { "vdd" },
> +	.is_hub = false,
> +};
> +
>  static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb424,2412", .data = &microchip_usb424_data, },
>  	{ .compatible = "usb424,2514", .data = &microchip_usb2514_data, },
> @@ -144,6 +151,7 @@ static const struct of_device_id onboard_dev_match[] = {
>  	{ .compatible = "usb2109,817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb2109,2817", .data = &vialab_vl817_data, },
>  	{ .compatible = "usb20b1,0013", .data = &xmos_xvf3500_data, },
> +	{ .compatible = "usb5986,1198", .data = &bison_intcamera_data, },

And these two.

>  	{}
>  };
>  
> 
> -- 
> 2.48.1
> 
> 

-- 
With best wishes
Dmitry
