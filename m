Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF9F72D97BF
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030540; cv=none; b=u12y9kyn22e64nSYe5Ej9+5rxIuO2EPun9nCqXiHaw4tqVsw6onAagO2qscrDuJcW4pUx8PlYlBu1iaTvCLOd9R4OWfr5JK4KMhkRg7Sn6taCHY4rfHA+VfT58PARH9/SBd9J9cka8rTmBblap6RSXYvnlb4p22ejCsJiJd+fg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030540; c=relaxed/simple;
	bh=fS+FMDePDq8JFwNSUZ2Iww2LBgGh6hXjOxdUgwdZbT4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WHemcpYlat/C9DaUmrCHM4xWWRbs5i5fYvqPM324KxlbuFkByVAJh0RRnTLqdLoxudnGVJwf+37GqOgh2O7I0yJ4c9qEPPSFaFL3QHTZQ3aQusb84s5nt9KDzRFBJsWQ2dymcZUfKUt2Nyvbots1joB+ekTCD4v/6cPwvQnscwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=O+jaEjBn; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="O+jaEjBn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=clRUvEmfDCpimGjB5HPnLClDltVWqhqAeoUTHo5ox1M=; b=O+jaEjBnY+VLhhLEfhfeTEdtBm
	YguFsmTLGFDWw4ZDUYH/EVrgOJzBo/upNcVwXRBB1Ypw8XzZ0UkbrG4xEJ5peKyr1ZKwYMf8gAXxX
	tOBuJwwAL94WezNAJ5K2TQSZAs0Z2KaCq5/R4qbIVTyh8Tja9/humZH9Cssyf3jYqMAfEm4VvEji7
	3+hu999RYtzDyUQg2LnDSIYoG8doa5+2Tc2mf11HrQS0e9X4y/ktBICHkmjcwxfuonRw/KnRWi5Ry
	5LEvdYlgaAnPOWvuncEzfFnOlHrB1Y0HaR3pLjY/hswe4hiiT30pNcbKjPJA3JOeTzyVqgGqpXJn3
	Hs57L5fg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uV91q-009PZk-HD; Fri, 27 Jun 2025 15:22:06 +0200
Message-ID: <761441fd-3659-4c72-bf03-f0634be41724@igalia.com>
Date: Fri, 27 Jun 2025 10:21:59 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 8/8] drm/vkms: Add P01* formats
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rodrigo Siqueira <siqueira@igalia.com>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, arthurgrillo@riseup.net,
 linux-kernel@vger.kernel.org, jeremie.dautheribes@bootlin.com,
 miquel.raynal@bootlin.com, thomas.petazzoni@bootlin.com,
 seanpaul@google.com, nicolejadeyee@google.com
References: <20250627-b4-new-color-formats-v5-0-94452f119c72@bootlin.com>
 <20250627-b4-new-color-formats-v5-8-94452f119c72@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-8-94452f119c72@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Louis,

On 27/06/25 06:12, Louis Chauvet wrote:
> The formats NV 12/16/24/21/61/42 were already supported.
> Add support for:
> - P010
> - P012
> - P016
> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 7 ++++++-
>   drivers/gpu/drm/vkms/vkms_plane.c   | 3 +++
>   2 files changed, 9 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index b18d67436e1d..e540218fdcad 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -522,7 +522,8 @@ static void function_name(const struct vkms_plane_state *plane, int x_start,			\
>   
>   READ_LINE_YUV_SEMIPLANAR(YUV888_semiplanar_read_line, y, uv, u8, u8, argb_u16_from_yuv161616,
>   			 y[0] * 257, uv[0] * 257, uv[1] * 257)
> -
> +READ_LINE_YUV_SEMIPLANAR(YUV161616_semiplanar_read_line, y, uv, u16, u16, argb_u16_from_yuv161616,
> +			 y[0], uv[0], uv[1])
>   /*
>    * This callback can be used for YUV format where each color component is
>    * stored in a different plane (often called planar formats). It will
> @@ -719,6 +720,10 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   	case DRM_FORMAT_NV61:
>   	case DRM_FORMAT_NV42:
>   		return &YUV888_semiplanar_read_line;
> +	case DRM_FORMAT_P010:
> +	case DRM_FORMAT_P012:
> +	case DRM_FORMAT_P016:
> +		return &YUV161616_semiplanar_read_line;
>   	case DRM_FORMAT_YUV420:
>   	case DRM_FORMAT_YUV422:
>   	case DRM_FORMAT_YUV444:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index 9f34f3a18d8c..e592e47a5736 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -39,6 +39,9 @@ static const u32 vkms_formats[] = {
>   	DRM_FORMAT_YVU420,
>   	DRM_FORMAT_YVU422,
>   	DRM_FORMAT_YVU444,
> +	DRM_FORMAT_P010,
> +	DRM_FORMAT_P012,
> +	DRM_FORMAT_P016,
>   	DRM_FORMAT_R1,
>   	DRM_FORMAT_R2,
>   	DRM_FORMAT_R4,
> 

