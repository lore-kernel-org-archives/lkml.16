Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0ADC20F082
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279720; cv=none; b=PBFOH2e4i3y0ZtBwvOGQ3ENciEks5RgH8WcHkC807sdy3qnj374tcPVOoCQdWXlxULkxKbJFn+ZGyCOceG94zwWgbdIprPrfZlP/L+h5J8YLzi+QdWIBXFxXojKWale1BuxwKOxktJVxO9BZZpytYZNHlojOb0cMwNHuDULUyXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279720; c=relaxed/simple;
	bh=ctmB/0viVsu6A6AJ/kxIi7kF9S1cadzfnL8wlYw22uc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SG7TiZMinmdI6sHLyh0GnbyCvLN7wKIMw97eitJyuWthb1gbtAeNV9NjHkgslt+3J+W74ZgiG7mGbugvOLNVhI4qL2ZKMVzKUFuEW6YIvYEgRUfGwFulJmaZuyhI2gUUJ++Zi8HiHIVW79uhs387r8sPHxCGdhokjaLMZ0xGHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=iiLnmJWf; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="iiLnmJWf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744279716;
	bh=ctmB/0viVsu6A6AJ/kxIi7kF9S1cadzfnL8wlYw22uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=iiLnmJWfU/BtoxaBATmE7+qwCr/CDhii6a6l12busYByECIWG1AwZoh2bzg0zaXl9
	 7HEWFirgBgDPuYBhyKX30zNGUE+hksidynWhu32Jz0dG1vr+Mu5gp/RUCxhNu+hpmL
	 3Y2jV3V4IZKgUQawQxmJWdy4G6ia+DX+YW3Iiu9Ek2LXw9gJlBKFgJ6uQoaLJdaQY4
	 Stm+Y74CDQtjdyKm/aFnzk8nZCNW7u+EsiPhXsd/XK7nAE0uOM17QBjOk045DxlS7A
	 9Py0jfypQiE86PhSWCVHWVgnNhB62XWDjob2/q1Lr6mEZFE1gPPn4jULXaeUE4NNIu
	 vR/QIaD+tvvDA==
Received: from [192.168.1.90] (unknown [82.79.138.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5EC4917E010B;
	Thu, 10 Apr 2025 12:08:36 +0200 (CEST)
Message-ID: <38e67224-d478-42c1-91d4-ba6cdd473227@collabora.com>
Date: Thu, 10 Apr 2025 13:08:35 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/15] drm/connector: hdmi: Use YUV420 output format as
 an RGB fallback
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-7-294d3ebbb4b2@collabora.com>
 <20250409-magnificent-skunk-of-art-689cf4@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250409-magnificent-skunk-of-art-689cf4@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/9/25 6:09 PM, Maxime Ripard wrote:
> On Wed, Mar 26, 2025 at 12:19:56PM +0200, Cristian Ciocaltea wrote:
>> Try to make use of YUV420 when computing the best output format and
>> RGB cannot be supported for any of the available color depths.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index 6de0abb15ecb36fd4eb98725e2a3835e5e0db134..3859600c6af4a79f30858adfc9f9a710dfe561a5 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -650,7 +650,17 @@ hdmi_compute_config(const struct drm_connector *connector,
>>  
>>  	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>>  				      HDMI_COLORSPACE_RGB);
>> +	if (!ret)
>> +		return 0;
>>  
>> +	if (!connector->ycbcr_420_allowed) {
>> +		drm_dbg_kms(connector->dev,
>> +			    "YUV420 output format not allowed for connector.\n");
>> +		return -EINVAL;
>> +	}
>> +
>> +	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
>> +				      HDMI_COLORSPACE_YUV420);
>>  	return ret;
> 
> I think I'd prefer to log a debug message there and return 0 if it
> succeeds, something like

Sure, will do.

> ret = hdmi_compute_format_bpc(..)
> if (ret) {
>    drm_dbg("YUV420 doesn't work").
>    return ret;
> }
> 
> return 0;

