Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3D6C275844
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751030268; cv=none; b=fTOKa7DxAyBugx8sAbWMm6uJibfQ0LKT7qSQjnPZmUzinjY8EfI8DF5PD5pgDreKLeDieDO36LnxgeX2zuUt+rT9Fkz26JC3ZuZTFP275S4NkX4Hqr/Ji8QQXZ+WWIXPt2hMsWag7oCTEt6/iESIB/bHyRbnF6L0YNqABpaDCSM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751030268; c=relaxed/simple;
	bh=6FeSjFqOYtMG/JOS5zkDfG54IG2nMIa0Z87QbiZzm3A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aGZrFxxNdKByieGgePq5wub7tBf3KTfpCRdi1te0CvP6b2jmCuwhWiAaSRPnHdc7nr+bvaBMVVSLtXidxDexFJ4qqTwY7YzYxTlWkHCAL+2ZIIpgRvW73wN4K+5rV/mlqgycSQSpI/aMyMKpf9TrMuZkTJOcs3InmkeLkGYY514=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=T51NL9X3; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="T51NL9X3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=DVo6iRITrHOG5MmQsBw+GAXuoHIgqVw49q4vBY/hs64=; b=T51NL9X39G9S3/iBl6ImV1LlFK
	gnYam49uTpCt9cMySIVvMVrKYF4N2Mad7XfBHhqe+un5QBeiyd8vlb1vFx1g0LFr/hdq9MyzisZnl
	+sdxEl29Vx5ysTP5id4TRb/+SEms0Cd7UmPADmzsIqvel1rXjS1rTs9vkBwvkWvqoYx35mCpVoWUW
	cQE64WXwoiMu9Kr6AUT5J0DXtCGRhNYNZfYrBPBpT9CJc+2TIib3THazxgvP0BSIFOwwJe2vTleG5
	GBV2q73cPK20H28+dRMbsJDDilaOH2dA1TwEy3vIlTJgm4LwGgKL85I4y5//u+JxSyhLiGzRGdLzv
	5k1EjzHg==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uV8xG-009PQ5-Dn; Fri, 27 Jun 2025 15:17:22 +0200
Message-ID: <0fc35309-f487-4aa2-b0df-c9b0e2b51fb7@igalia.com>
Date: Fri, 27 Jun 2025 10:17:14 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 2/8] drm/vkms: Add support for ARGB8888 formats
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
 <20250627-b4-new-color-formats-v5-2-94452f119c72@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250627-b4-new-color-formats-v5-2-94452f119c72@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Louis,

On 27/06/25 06:12, Louis Chauvet wrote:
> The formats XRGB8888 and ARGB8888 were already supported. Add the
> support for: - XBGR8888 - RGBX8888 - BGRX8888 - ABGR8888 - RGBA8888 -
> BGRA8888

Please, remove RGBX8888 and BGRX8888 from this list. Also, for
readability, it would be great if you add each format in one separate
line.

Apart from that,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> 
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
> ---
>   drivers/gpu/drm/vkms/vkms_formats.c | 13 +++++++++++--
>   drivers/gpu/drm/vkms/vkms_plane.c   |  5 ++++-
>   2 files changed, 15 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/vkms/vkms_formats.c b/drivers/gpu/drm/vkms/vkms_formats.c
> index a9c624081dac..231b327e86b3 100644
> --- a/drivers/gpu/drm/vkms/vkms_formats.c
> +++ b/drivers/gpu/drm/vkms/vkms_formats.c
> @@ -432,9 +432,12 @@ static void R4_read_line(const struct vkms_plane_state *plane, int x_start,
>   
>   
>   READ_LINE_ARGB8888(XRGB8888_read_line, px, 0xFF, px[2], px[1], px[0])
> +READ_LINE_ARGB8888(XBGR8888_read_line, px, 0xFF, px[0], px[1], px[2])
>   
>   READ_LINE_ARGB8888(ARGB8888_read_line, px, px[3], px[2], px[1], px[0])
>   READ_LINE_ARGB8888(ABGR8888_read_line, px, px[3], px[0], px[1], px[2])
> +READ_LINE_ARGB8888(RGBA8888_read_line, px, px[0], px[3], px[2], px[1])
> +READ_LINE_ARGB8888(BGRA8888_read_line, px, px[0], px[1], px[2], px[3])
>   
>   READ_LINE_le16161616(ARGB16161616_read_line, px, px[3], px[2], px[1], px[0])
>   READ_LINE_le16161616(XRGB16161616_read_line, px, cpu_to_le16(0xFFFF), px[2], px[1], px[0])
> @@ -644,10 +647,16 @@ pixel_read_line_t get_pixel_read_line_function(u32 format)
>   	switch (format) {RGBA8888
>   	case DRM_FORMAT_ARGB8888:
>   		return &ARGB8888_read_line;
> -	case DRM_FORMAT_XRGB8888:
> -		return &XRGB8888_read_line;
>   	case DRM_FORMAT_ABGR8888:
>   		return &ABGR8888_read_line;
> +	case DRM_FORMAT_BGRA8888:
> +		return &BGRA8888_read_line;
> +	case DRM_FORMAT_RGBA8888:
> +		return &RGBA8888_read_line;
> +	case DRM_FORMAT_XRGB8888:
> +		return &XRGB8888_read_line;
> +	case DRM_FORMAT_XBGR8888:
> +		return &XBGR8888_read_line;
>   	case DRM_FORMAT_ARGB16161616:
>   		return &ARGB16161616_read_line;
>   	case DRM_FORMAT_XRGB16161616:
> diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
> index e3fdd161d0f0..01fed722808b 100644
> --- a/drivers/gpu/drm/vkms/vkms_plane.c
> +++ b/drivers/gpu/drm/vkms/vkms_plane.c
> @@ -14,8 +14,11 @@
>   
>   static const u32 vkms_formats[] = {
>   	DRM_FORMAT_ARGB8888,
> -	DRM_FORMAT_XRGB8888,
>   	DRM_FORMAT_ABGR8888,
> +	DRM_FORMAT_BGRA8888,
> +	DRM_FORMAT_RGBA8888,
> +	DRM_FORMAT_XRGB8888,
> +	DRM_FORMAT_XBGR8888,
>   	DRM_FORMAT_XRGB16161616,
>   	DRM_FORMAT_ARGB16161616,
>   	DRM_FORMAT_RGB565,
> 

