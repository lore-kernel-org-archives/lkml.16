Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF2E5185935
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743368804; cv=none; b=VbDrZblIm7vhU3xiQoWuuVxCPw3yrAHz/S5CplxvXkhZZJ9+gdGDIGxW6+pNTWl72xMhXSvQEdwUIjWtdylZAusvgNBjUsz9fM2TcdxvIxq1K5a7NZsYMn+beSHwmFHXHEsY+HXGwQtdZbX0AclG6BcGRDDeC/9v442tKac7jAs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743368804; c=relaxed/simple;
	bh=XY5SxDtPvGDza4VPOfyWQRgkRXEawtT4iFD8sTe4sfo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=INb5JJZHQt4d4PfteemWy+BMBSKHOdsKTfqi8HTenSYuG5NwUxEi/6x6jYPflhOtVp7ZkGColMROr36nSbh6YeiyT9Q8w0d27KCWGxzoDE7A157xJvJbe3YwuzkMAuaY96qZKz4M0KCAxS6pxYv5+BNUIneXwPKPWh5HTfQVcrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Wm1QT8ah; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Wm1QT8ah"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52UJQt6k032500
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:06:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=FlRSAkjOOXQOvn7gier4lH/4
	QsovEBQRyrZW6+UiDGo=; b=Wm1QT8ahuEyu57fuH9J/3S9/XmCNf/MJAil4QcO2
	/ElPqVGItMXZfrS4zMt6JhdxR+WH1TKr6fQxGmAW4T0z39cG3ixu8zsYT+/8hJ7B
	im0jHBDqNdirW2n/sLtm6CL+AWuksPlhDQB2n6iy6+VEtAQispLcMitvhHNVqUV4
	La7KPUW//XEM9WfA5IG050yI0zJvulFL+AdWqP6r9usIh+FWucLUhSebbBbgcMfB
	lDbvMM5WpZTqeLY5MluNgC0yF4t1ikeAY00OEhDZyLMDjbLohsSduk6kI7MlO2Qv
	KmqxlkatQyDCLaoa8VuKJIOWQEbPommuldOkPK50gcjTfw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45p7tvautk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 21:06:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7c57f80d258so172287785a.2
        for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 14:06:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743368800; x=1743973600;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FlRSAkjOOXQOvn7gier4lH/4QsovEBQRyrZW6+UiDGo=;
        b=hzPn5XKcJ914b7CH/Ksz+L7+bbhjLZdlz9x/BgS6e8oMk/RKE/i0gOBLHXjnPbyzFZ
         9peEYxN3OdGz8WjyYhQdRVO3ir6EDalsonQZQ5zI1++s9BNd1J5EiycLZvpAynCL8aKK
         fNfVrAI+q03hAtPxRWk7u4nXaS5nKXiFSr2CBnGYzy3HXSUWEFvMVYt5/qydneX21qQO
         g02Z02T0T27jMPEgxfPbYzYvlh4hVod7ZviW9wQHcu8BtK6UNMqfLaDhU5zXTJcfvm44
         xhoq4SMGyRGyGn1i7NMqG4ROgLSCRdUJ0fdxzzy06P3ABvzGvvnyozRS7pxVVjmMEjNC
         qp+A==
X-Forwarded-Encrypted: i=1; AJvYcCV7bcr7+2rreRhwrNB6HqUqFddE8s8Vx/NA4/abgrEuf4yjhSVycz1lSb8xtv06QortJDjD6dIsqZZK+Ss=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaBokNyLSmG8n/wp+a7QaWuvgBq1Tf1vxoIWOfDryevSR7Q0bd
	Qq/BwUf43YTRhHdxDT19gv5Fhqa6MdSfAPraAZCZQjUVFanZskyefeYB2IQN7NJC4zBwjDMwGzG
	f58DoAnp7sUEmSULwcPYiR36QvLwlNHC1XNnvQaUmFHF59Wc6/8QUzLjkP190lBI=
X-Gm-Gg: ASbGnct15p7wz292rrVMG4CfBWhovyjuscfrdp+bKTTiFGM7ZdPSJj0rG5hBuSb67se
	6RJnZTFlkjsjRkf695koPccZG/Rt6+WURjuLeCkAQP5Ehxx4NhEcscvaw0LURmgVObPUjPH6jUd
	u30ZKnIxHuFF6tDM41KebKrpoIU21vPMJJA4YC0ITh9Ot6GqAbC0Z+GrgZYVvNRe4curag0f1Z8
	gyenyYhUgsYIjB9EXFb+4el3b514f/90n38KJJJu16tZLNxtDz29aFejFJyGksceVKhyOZ4IMYA
	b0Lnxdo1dLEgk1lTP7LxTNSTHQfjR9FDU3mJRqDyErOrRNI94MTAFlVbRIETmy4IIvx46cy0G+Z
	JA0U=
X-Received: by 2002:a05:620a:240a:b0:7c5:4b24:468d with SMTP id af79cd13be357-7c6862ec3b6mr933897985a.2.1743368800685;
        Sun, 30 Mar 2025 14:06:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF69vvF9rbPt3BrhKW5NM4LtKVgz5G9wGmc+hd8iyCdkzLOo5lLF/FOnvkaNg7O8gtBrf72nw==
X-Received: by 2002:a05:620a:240a:b0:7c5:4b24:468d with SMTP id af79cd13be357-7c6862ec3b6mr933894685a.2.1743368800339;
        Sun, 30 Mar 2025 14:06:40 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c1a63sm973337e87.93.2025.03.30.14.06.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 30 Mar 2025 14:06:38 -0700 (PDT)
Date: Mon, 31 Mar 2025 00:06:35 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Tejas Vipin <tejasvipin76@gmail.com>
Cc: neil.armstrong@linaro.org, maarten.lankhorst@linux.intel.com,
        mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, quic_jesszhan@quicinc.com, dianders@chromium.org,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
        asrivats@redhat.com
Subject: Re: [PATCH] drm/panel: boe-bf060y8m-aj0: transition to mipi_dsi
 wrapped functions
Message-ID: <4gdok6gfkc33sinmwjfvo2gc2wvtchom5mliucuuttqjf3diqp@buz5dty7adm2>
References: <20250330151304.128417-1-tejasvipin76@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250330151304.128417-1-tejasvipin76@gmail.com>
X-Authority-Analysis: v=2.4 cv=OIon3TaB c=1 sm=1 tr=0 ts=67e9b261 cx=c_pps a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=Vs1iUdzkB0EA:10 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=GlgPFExOgFwQK10BZRwA:9 a=CjuIK1q_8ugA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: Oza7cxpITn1wrCr4W6NJAshGWcWmB80P
X-Proofpoint-GUID: Oza7cxpITn1wrCr4W6NJAshGWcWmB80P
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-30_09,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 mlxlogscore=999 lowpriorityscore=0 malwarescore=0 mlxscore=0 clxscore=1015
 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0 impostorscore=0
 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503300149

On Sun, Mar 30, 2025 at 08:43:04PM +0530, Tejas Vipin wrote:
> Changes the boe-bf060y8m-aj0 panel to use multi style functions for
> improved error handling.
> 
> Signed-off-by: Tejas Vipin <tejasvipin76@gmail.com>
> ---
>  .../gpu/drm/panel/panel-boe-bf060y8m-aj0.c    | 112 +++++++-----------
>  1 file changed, 43 insertions(+), 69 deletions(-)

> -static int boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
> +static void boe_bf060y8m_aj0_off(struct boe_bf060y8m_aj0 *boe)
>  {
>  	struct mipi_dsi_device *dsi = boe->dsi;
> -	struct device *dev = &dsi->dev;
> -	int ret;
> +	struct mipi_dsi_multi_context dsi_ctx = { .dsi = dsi };
>  
>  	/* OFF commands sent in HS mode */
>  	dsi->mode_flags &= ~MIPI_DSI_MODE_LPM;
> -	ret = mipi_dsi_dcs_set_display_off(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to set display off: %d\n", ret);
> -		return ret;
> -	}
> -	msleep(20);
> -
> -	ret = mipi_dsi_dcs_enter_sleep_mode(dsi);
> -	if (ret < 0) {
> -		dev_err(dev, "Failed to enter sleep mode: %d\n", ret);
> -		return ret;
> -	}
> -	usleep_range(1000, 2000);
> -	dsi->mode_flags |= MIPI_DSI_MODE_LPM;
> +	mipi_dsi_dcs_set_display_off_multi(&dsi_ctx);
> +	mipi_dsi_msleep(&dsi_ctx, 20);
>  
> -	return 0;
> +	mipi_dsi_dcs_enter_sleep_mode_multi(&dsi_ctx);
> +	mipi_dsi_usleep_range(&dsi_ctx, 1000, 2000);
> +	if (!(dsi_ctx.accum_err))
> +		dsi->mode_flags |= MIPI_DSI_MODE_LPM;

I think the flag should always be set at the end of this function
(please document it though).

Other than that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>


>  }
>  
>  static int boe_bf060y8m_aj0_prepare(struct drm_panel *panel)

-- 
With best wishes
Dmitry
