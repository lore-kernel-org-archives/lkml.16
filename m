Received: from lelvem-ot02.ext.ti.com (lelvem-ot02.ext.ti.com [198.47.23.235])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0869A1D540
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 12:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.47.23.235
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751371497; cv=none; b=Mni4UrrPvU4e+Ur7kB4S5/MTzA1syA2MX434nbRSILYrj+T0S2bkIZjuArAB2JAy35prvoC6AkyFwDDIpvhXorYbl6wQtzjjeUFUefGqUf+PpEGfYZzMKwjH/82aZUpREpQjyi9dWhH5IRSwyZu/3r/8PMsA5zqD2FVWCaB7kDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751371497; c=relaxed/simple;
	bh=RJYmisO1a6eiEpF6eF4u0rwng3V3PenJu+puVNYsujo=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=OsH8EJf+rMhdYhxgUr808eJeicceuTzAr4OfHFMoioNEGb/R5ILTFCHKmlaFJdl1b7+BmphXGWMwlF/B5Dad2gNPZ0ePDVLHCdP0NHtZ+ZSjyPcy9UBaNYZlsZDlq1MX9+XjogCJ2GK33zIo4Bw9Tv6TY/sLOtv+Bb0OzSE7/iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=cMIUouJJ; arc=none smtp.client-ip=198.47.23.235
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="cMIUouJJ"
Received: from lelvem-sh02.itg.ti.com ([10.180.78.226])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 561C4L2G3613463;
	Tue, 1 Jul 2025 07:04:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1751371461;
	bh=FxmiebPIaeW3vcua2psua1JTYarnf+7Xb/RB+rm6+DE=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=cMIUouJJr4t9zDpfhSI8f7Chghw7kZvQSCVTS394ne7PdaZbkBnTe0rmTDHqc4Bdl
	 WCC5NtY32j3zhTpk2AbNddMP5g72xRjC1ot18O0wbN+7B0aUnsyG1o7zqkZRyC1xIH
	 sdL9RdcB5AYmWwztjU5qLTAIzTWhjYKptcxj/fpE=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by lelvem-sh02.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 561C4K1t4055689
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-SHA256 bits=128 verify=FAIL);
	Tue, 1 Jul 2025 07:04:20 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55; Tue, 1
 Jul 2025 07:04:20 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.55 via
 Frontend Transport; Tue, 1 Jul 2025 07:04:20 -0500
Received: from [172.24.227.193] (devarsh-precision-tower-3620.dhcp.ti.com [172.24.227.193])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 561C4GIw1515693;
	Tue, 1 Jul 2025 07:04:17 -0500
Message-ID: <3541e223-6a06-40f6-ab32-1b9baf718371@ti.com>
Date: Tue, 1 Jul 2025 17:34:16 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] drm/tidss: oldi: Add property to identify OLDI
 supported VP
To: Jayesh Choudhary <j-choudhary@ti.com>, <jyri.sarha@iki.fi>,
        <maarten.lankhorst@linux.intel.com>, <mripard@kernel.org>,
        <tzimmermann@suse.de>, <dri-devel@lists.freedesktop.org>,
        <tomi.valkeinen@ideasonboard.com>, <mwalle@kernel.org>
CC: <airlied@gmail.com>, <simona@ffwll.ch>, <linux-kernel@vger.kernel.org>
References: <20250701095541.190422-1-j-choudhary@ti.com>
 <20250701095541.190422-2-j-choudhary@ti.com>
Content-Language: en-US
From: Devarsh Thakkar <devarsht@ti.com>
In-Reply-To: <20250701095541.190422-2-j-choudhary@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea



On 01/07/25 15:25, Jayesh Choudhary wrote:
> TIDSS should know which VP has OLDI output to avoid calling clock
> functions for that VP as those are controlled by oldi driver. Add a
> property "is_oldi_vp" to "tidss_device" structure for that. Mark it
> 'true' in tidss_oldi_init() and 'false' in tidss_oldi_deinit().
> 
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>

Reviewed-by: Devarsh Thakkar <devarsht@ti.com>

Regards
Devarsh
> ---
>   drivers/gpu/drm/tidss/tidss_drv.h  | 2 ++
>   drivers/gpu/drm/tidss/tidss_oldi.c | 2 ++
>   2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/tidss/tidss_drv.h b/drivers/gpu/drm/tidss/tidss_drv.h
> index 0ae24f645582..82beaaceadb3 100644
> --- a/drivers/gpu/drm/tidss/tidss_drv.h
> +++ b/drivers/gpu/drm/tidss/tidss_drv.h
> @@ -24,6 +24,8 @@ struct tidss_device {
>   
>   	const struct dispc_features *feat;
>   	struct dispc_device *dispc;
> +	bool is_oldi_vp[TIDSS_MAX_PORTS];
> +
>   
>   	unsigned int num_crtcs;
>   	struct drm_crtc *crtcs[TIDSS_MAX_PORTS];
> diff --git a/drivers/gpu/drm/tidss/tidss_oldi.c b/drivers/gpu/drm/tidss/tidss_oldi.c
> index b0f99656e87e..63e07c8edeaa 100644
> --- a/drivers/gpu/drm/tidss/tidss_oldi.c
> +++ b/drivers/gpu/drm/tidss/tidss_oldi.c
> @@ -430,6 +430,7 @@ void tidss_oldi_deinit(struct tidss_device *tidss)
>   	for (int i = 0; i < tidss->num_oldis; i++) {
>   		if (tidss->oldis[i]) {
>   			drm_bridge_remove(&tidss->oldis[i]->bridge);
> +			tidss->is_oldi_vp[tidss->oldis[i]->parent_vp] = false;
>   			tidss->oldis[i] = NULL;
>   		}
>   	}
> @@ -579,6 +580,7 @@ int tidss_oldi_init(struct tidss_device *tidss)
>   		oldi->bridge.timings = &default_tidss_oldi_timings;
>   
>   		tidss->oldis[tidss->num_oldis++] = oldi;
> +		tidss->is_oldi_vp[oldi->parent_vp] = true;
>   		oldi->tidss = tidss;
>   
>   		drm_bridge_add(&oldi->bridge);
