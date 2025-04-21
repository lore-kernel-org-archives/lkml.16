Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D275920C47B
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745231391; cv=none; b=ZPX7p8Oke7L6ZrECkASJkrRJiyWWdYabvp8ClLvHviAFcDsU3WKE8kvoDEtsqJKjLL8j9ADRT6bMSr3nCXTLLGnD2iQejMK59ZkYDMPLl1vNrl4tyMsYL67M4ylH8PJK95iLCnGA5D4g67eSvJ2WowgK5RvxG8OresE3PcExLSY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745231391; c=relaxed/simple;
	bh=lvf87l4r0uSXF504PtgLyw3FBsapfruyMS9uBElfVZo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cEcN4EIZVU8ijs84zITJ1hVBtAO0IiAoDCyE6CsgImU0viJocQH9zlt+eW+EQiKxooHD4k6wpDOpXr45lBV9/NvMvF/0LHf2A9UyBULC+gbx4/h92V6eoPjNvixbxh1kkLcDYabgQgEELGAsP/bKXxk2RYRV8vApK70I/X1R5vs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jV0IdRwj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jV0IdRwj"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53LA5WB2005727
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:29:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=KKT4UeldcPZsh0FUZIH3yOLO
	5e214Tx1muuQ9yFoG2I=; b=jV0IdRwjp9pKa2mh3NT5XpgcVaV48hhJdz+5pQDw
	MCAQ5ZbceeAXv836fiY05lF3ToTH5jzv4useANuBj/cy2SwltFY8TcqjlUcebr/g
	tM2w5jurm72b1J5YbUS6azV8NN+9cXK/UmP5rq+iglRXnu/vS8Tc82X2VA4Mp0Vl
	mWGjX5qbptmmrQdotPxNq7ZF20Qc/GtcGoUsbWw9jX4ksv3ilqHJCjV6lvyFKE+U
	GNnzBxnXrm/ojOTdTyN60EcEwRzoYNEzq8xX3kFZ8yZr70IUGq99fYa8onW/kbuJ
	F7r4X/HjPqlZlhQ5BIgZGoVVeH+B5MqQbNhDxvJsnZju0A==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 464426ku18-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 10:29:48 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-7c7c30d8986so1248309685a.2
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 03:29:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745231387; x=1745836187;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KKT4UeldcPZsh0FUZIH3yOLO5e214Tx1muuQ9yFoG2I=;
        b=kGU5SRn2pdA1sGx+7y/9ncLx69x/plt1j9cjePjVICoKfJO3E5fDJa13ElEe2v5uAE
         ifNTrlSiXJSjXyc2JveKJoetEJTqDiOhYwZh21wrNGRR3EySFvBAib0cojtAn7mfZN2n
         OVtpu923o/1Hu0OToflkDv80WEXXbt1A8au7cqaZMvhJPViVXPoRM+WsAXl60JHe3V9X
         jPYZK3+N/Zjdpx/GCwJEOxEDCWhNOOAKkasK5JyxaCvzB+yA4g+DvsXKLo9Xe399uPte
         fbnChFPsnmTq0G7wLBugy42fBiBoywi4PKIY8QCJkefMfAI1VgcHnvBdkkMNP4KOR8YJ
         76Mg==
X-Forwarded-Encrypted: i=1; AJvYcCWUcu8VGPqvQF8W+PFDUmQ0tpTiYd+mwAScw+kP5SJhhp5X0JIdTXyV9+ns1TA4jTrGTa3lbiOQriIgO+4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpllODOlWw/OmyVzYzhfsSsbYg9Ew9h443E1ybdGL9g6A2x6ph
	2E9LAdPCWY/wzbey0A52MztSnU9DpuqCKvV+RluLt3UQRTMs84VXgGaYdc/H1/fTUgFNb9CCsDa
	nVZA7BirNXepvPCVMP5BXCB/4JKuFZd2dG0+Kn6kqsPAxeQidvv/lrP+Tq1B3z/Ky4xOQz78=
X-Gm-Gg: ASbGncsH6a1GUlfHkMBhIwS4WYL7LpWnvHBdZ5FoIvCCq/RfjsdOZKFhjolWyAG9LCh
	mzxxDqqNQGI/1A+jCouy3yN9IUBQupXek9Tb6eVLQr4fkOVYX7DffzBzDTQ/8n35pLmI2vkG/m5
	Bp8jS9b8pPSkuDd7tMIiWxkuRNWdrpQ1PzzE/YTXbPMS6r5dKlaoatTdzKMQi2SZkeyt7YeK0Yu
	hVCPy89enh6xy7Tjp0mIEVMo2WzooDiwcT0uCpMLRWEKw3qzB4MzCBq6A/XU+rM2WKyIVENfds6
	0IaUABqifa90scUf3zupmft0/fenCZ5B/5Ax1Wp6vkeP/o4nmoc3DEpbR0gLssBZTZONtPCNRSQ
	=
X-Received: by 2002:a05:620a:4621:b0:7c5:6140:734f with SMTP id af79cd13be357-7c927f804d5mr1880912885a.18.1745231387124;
        Mon, 21 Apr 2025 03:29:47 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEmhZhZ/AanwSlp6sjrsWKxdKlAy3sumUE6Kfu5ZPiFjLR1JWOPV6gulBvmvCqEYB4y0PGD/A==
X-Received: by 2002:a05:620a:4621:b0:7c5:6140:734f with SMTP id af79cd13be357-7c927f804d5mr1880910985a.18.1745231386728;
        Mon, 21 Apr 2025 03:29:46 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-31090822a38sm11305611fa.73.2025.04.21.03.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 03:29:45 -0700 (PDT)
Date: Mon, 21 Apr 2025 13:29:44 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Jagath Jog J <jagathjog1996@gmail.com>
Cc: mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com,
        simona@ffwll.ch, mcanal@igalia.com, maarten.lankhorst@linux.intel.com,
        dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC 1/1] drm/mipi-dbi: Use drm_device for debugfs, drop
 drm_minor and .debugfs_init
Message-ID: <lhjibofycex36n23edeb6m7uc4n55nqg4y3qdzoe2wdpc5twrh@ytyvawvgdhuz>
References: <20250421085907.24972-1-jagathjog1996@gmail.com>
 <20250421085907.24972-2-jagathjog1996@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250421085907.24972-2-jagathjog1996@gmail.com>
X-Proofpoint-ORIG-GUID: SA14fOTHXt1Iz49RJA33p0dwe8svtDLD
X-Proofpoint-GUID: SA14fOTHXt1Iz49RJA33p0dwe8svtDLD
X-Authority-Analysis: v=2.4 cv=IP8CChvG c=1 sm=1 tr=0 ts=68061e1c cx=c_pps a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10 a=XR8D0OoHHMoA:10 a=pGLkceISAAAA:8 a=tCZK0CnPNcU2-8zYRE4A:9 a=CjuIK1q_8ugA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-21_04,2025-04-21_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=999 spamscore=0
 mlxscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504210081

On Mon, Apr 21, 2025 at 02:29:07PM +0530, Jagath Jog J wrote:
> Refactor to use drm_device.debugfs_root instead of drm_minor for
> debugfs file creation. The driver can now initialize debugfs directly
> in probe(), before drm_dev_register(). This also removes the use of
> .debugfs_init callback.

Why? The callback was designed to add debugfs files. Likewise most if
not all DRM drivers add files under the corresponding minor node.

> 
> Signed-off-by: Jagath Jog J <jagathjog1996@gmail.com>
> ---
>  drivers/gpu/drm/drm_mipi_dbi.c        | 8 ++++----
>  drivers/gpu/drm/tiny/ili9163.c        | 3 ++-
>  drivers/gpu/drm/tiny/panel-mipi-dbi.c | 3 ++-
>  include/drm/drm_mipi_dbi.h            | 4 ++--
>  4 files changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_mipi_dbi.c b/drivers/gpu/drm/drm_mipi_dbi.c
> index 89e05a5bed1d..66f292c48a78 100644
> --- a/drivers/gpu/drm/drm_mipi_dbi.c
> +++ b/drivers/gpu/drm/drm_mipi_dbi.c
> @@ -1488,17 +1488,17 @@ static const struct file_operations mipi_dbi_debugfs_command_fops = {
>   *
>   * This function creates a 'command' debugfs file for sending commands to the
>   * controller or getting the read command values.
> - * Drivers can use this as their &drm_driver->debugfs_init callback.
> + * Drivers can call this function before registering their device to drm.
>   *
>   */
> -void mipi_dbi_debugfs_init(struct drm_minor *minor)
> +void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev)
>  {
> -	struct mipi_dbi_dev *dbidev = drm_to_mipi_dbi_dev(minor->dev);
>  	umode_t mode = S_IFREG | S_IWUSR;
>  
>  	if (dbidev->dbi.read_commands)
>  		mode |= S_IRUGO;
> -	debugfs_create_file("command", mode, minor->debugfs_root, dbidev,
> +
> +	debugfs_create_file("command", mode, dbidev->drm.debugfs_root, dbidev,
>  			    &mipi_dbi_debugfs_command_fops);
>  }
>  EXPORT_SYMBOL(mipi_dbi_debugfs_init);
> diff --git a/drivers/gpu/drm/tiny/ili9163.c b/drivers/gpu/drm/tiny/ili9163.c
> index 62cadf5e033d..351d2a5b9f27 100644
> --- a/drivers/gpu/drm/tiny/ili9163.c
> +++ b/drivers/gpu/drm/tiny/ili9163.c
> @@ -115,7 +115,6 @@ static struct drm_driver ili9163_driver = {
>  	.fops			= &ili9163_fops,
>  	DRM_GEM_DMA_DRIVER_OPS_VMAP,
>  	DRM_FBDEV_DMA_DRIVER_OPS,
> -	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "ili9163",
>  	.desc			= "Ilitek ILI9163",
>  	.major			= 1,
> @@ -182,6 +181,8 @@ static int ili9163_probe(struct spi_device *spi)
>  
>  	drm_mode_config_reset(drm);
>  
> +	mipi_dbi_debugfs_init(dbidev);
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		return ret;
> diff --git a/drivers/gpu/drm/tiny/panel-mipi-dbi.c b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> index 0460ecaef4bd..94466dd8db9f 100644
> --- a/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> +++ b/drivers/gpu/drm/tiny/panel-mipi-dbi.c
> @@ -267,7 +267,6 @@ static const struct drm_driver panel_mipi_dbi_driver = {
>  	.fops			= &panel_mipi_dbi_fops,
>  	DRM_GEM_DMA_DRIVER_OPS_VMAP,
>  	DRM_FBDEV_DMA_DRIVER_OPS,
> -	.debugfs_init		= mipi_dbi_debugfs_init,
>  	.name			= "panel-mipi-dbi",
>  	.desc			= "MIPI DBI compatible display panel",
>  	.major			= 1,
> @@ -384,6 +383,8 @@ static int panel_mipi_dbi_spi_probe(struct spi_device *spi)
>  
>  	drm_mode_config_reset(drm);
>  
> +	mipi_dbi_debugfs_init(dbidev);
> +
>  	ret = drm_dev_register(drm, 0);
>  	if (ret)
>  		return ret;
> diff --git a/include/drm/drm_mipi_dbi.h b/include/drm/drm_mipi_dbi.h
> index f45f9612c0bc..88a9c87a1e99 100644
> --- a/include/drm/drm_mipi_dbi.h
> +++ b/include/drm/drm_mipi_dbi.h
> @@ -230,9 +230,9 @@ int mipi_dbi_buf_copy(void *dst, struct iosys_map *src, struct drm_framebuffer *
>  })
>  
>  #ifdef CONFIG_DEBUG_FS
> -void mipi_dbi_debugfs_init(struct drm_minor *minor);
> +void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev);
>  #else
> -static inline void mipi_dbi_debugfs_init(struct drm_minor *minor) {}
> +static inline void mipi_dbi_debugfs_init(struct mipi_dbi_dev *dbidev) {}
>  #endif
>  
>  /**
> -- 
> 2.20.1
> 

-- 
With best wishes
Dmitry
