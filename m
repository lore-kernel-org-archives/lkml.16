Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1C7A194A44
	for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 10:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.97.179.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750502695; cv=none; b=fXSUcNk8A1QDqduFkk1yi/JO3T/Dm3jbFdEEA+qk0sfZ6dLmSFgnkk61Lp2CHq5eYI5MAN6BUu88Nej1yxD4MEtdaLFxhHRPnJTvitHEEG3JmaWu+kIhHih8hn+GYv1Jme497MtYtKOJlgYwrdFMFwn5ZR7zbdpjwYTDuBQ73bg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750502695; c=relaxed/simple;
	bh=eaBwmh1JJ27TzkqM66ZZ9Oe//ESzk6gKFGy7L2bMZcE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TyfJBtuKsTJMtpXixR9a4nbIkzrhlq99ovyKhwxfOwXAkmOZtJHFU+HZXJVXDcROZfETYVhu6ix0KhL+1adQpoMtjlu1Zep7WTVALxnMBmazfhAXeMgfJ1gvLNT96klT41PSuRksNSEifRT/dsqUEq/wrMRbiD/4BjKdNwis22E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=RTCGln92; arc=none smtp.client-ip=213.97.179.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="RTCGln92"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=jOVRLG4kf65Iwbka4hwciM7MPVNo+93iTeCLw5irnXE=; b=RTCGln92JV995dP1/gYKNZRpgG
	HMtXGI93GdyB861J/5Q57tIS6rMBJRTZgf+mPfFxYmXH9508TubNoL1cXk3es7voaEvUVmLldqjtp
	QUciF/42++5QrbotXIqEf1tYFrTAPpMZ0BvMExsAQn07pMEkClR6vWOCRQKk21c5IHKd+tT4u16jq
	OHYT37+9RrEmTahhOk/pPwxxDyNpqoFxGlrJIAbTv09VNKZuQx+pI4XrogBrohph6YacJ/pL8GgBb
	jANu3hv4DsaoYl+7NibJRGEk+dnxm29k3tIsVSccQQ8W4AWNqjA9Cn25k02ZwPal039g9rkehkm8c
	Wuq6swMA==;
Received: from [189.7.87.79] (helo=[192.168.0.7])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1uSvi3-006LzZ-PM; Sat, 21 Jun 2025 12:44:32 +0200
Message-ID: <5db4168b-5c23-40fa-a38f-f4fc4b8a8668@igalia.com>
Date: Sat, 21 Jun 2025 07:44:26 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm: writeback: Fix drm_writeback_connector_cleanup
 signature
To: Louis Chauvet <louis.chauvet@bootlin.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: thomas.petazzoni@bootlin.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mark Yacoub <markyacoub@google.com>
References: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250429-drm-fix-writeback-cleanup-v2-1-548ff3a4e284@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Louis,

On 29/04/25 05:36, Louis Chauvet wrote:
> The drm_writeback_connector_cleanup have the signature:
> 
>       static void drm_writeback_connector_cleanup(
> 		struct drm_device *dev,
> 		struct drm_writeback_connector *wb_connector)
> 
> But it is stored and used as a drmres_release_t
> 
>      typedef void (*drmres_release_t)(struct drm_device *dev, void *res);
> 
> While the current code is valid and does not produce any warning, the
> CFI runtime check (CONFIG_CFI_CLANG) can fail because the function
> signature is not the same as drmres_release_t.
> 
> In order to fix this, change the function signature to match what is
> expected by drmres_release_t.
> 
> Fixes: 1914ba2b91ea ("drm: writeback: Create drmm variants for drm_writeback_connector initialization")
> 
> Suggested-by: Mark Yacoub <markyacoub@google.com>
> Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
> Changes in v2:
> - Forgot to update the documentation
> - Link to v1: https://lore.kernel.org/r/20250428-drm-fix-writeback-cleanup-v1-1-e4c723868b73@bootlin.com
> ---
>   drivers/gpu/drm/drm_writeback.c | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/drm_writeback.c b/drivers/gpu/drm/drm_writeback.c
> index edbeab88ff2b..d983ee85cf13 100644
> --- a/drivers/gpu/drm/drm_writeback.c
> +++ b/drivers/gpu/drm/drm_writeback.c
> @@ -343,17 +343,18 @@ EXPORT_SYMBOL(drm_writeback_connector_init_with_encoder);
>   /**
>    * drm_writeback_connector_cleanup - Cleanup the writeback connector
>    * @dev: DRM device
> - * @wb_connector: Pointer to the writeback connector to clean up
> + * @data: Pointer to the writeback connector to clean up
>    *
>    * This will decrement the reference counter of blobs and destroy properties. It
>    * will also clean the remaining jobs in this writeback connector. Caution: This helper will not
>    * clean up the attached encoder and the drm_connector.
>    */
>   static void drm_writeback_connector_cleanup(struct drm_device *dev,
> -					    struct drm_writeback_connector *wb_connector)
> +					    void *data)
>   {
>   	unsigned long flags;
>   	struct drm_writeback_job *pos, *n;
> +	struct drm_writeback_connector *wb_connector = data;
>   
>   	delete_writeback_properties(dev);
>   	drm_property_blob_put(wb_connector->pixel_formats_blob_ptr);
> @@ -405,7 +406,7 @@ int drmm_writeback_connector_init(struct drm_device *dev,
>   	if (ret)
>   		return ret;
>   
> -	ret = drmm_add_action_or_reset(dev, (void *)drm_writeback_connector_cleanup,
> +	ret = drmm_add_action_or_reset(dev, drm_writeback_connector_cleanup,
>   				       wb_connector);
>   	if (ret)
>   		return ret;
> 
> ---
> base-commit: a22e0051f9eb2281b181218d97f77cebc299310d
> change-id: 20250428-drm-fix-writeback-cleanup-a1179f3b9691
> 
> Best regards,

