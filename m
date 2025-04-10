Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D8C326F470
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:06:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744279605; cv=none; b=VsGBlQf6CuwAv8xRl/9U17+fHG36NO2YJdS4CjYQIRtm5CCZ/OBkfjB1D+1Vv4W/cannWKUSCw56Zuuzyg/j+y07eUm0/30a7n6jwtjGRiq8Z1v1S9FsEWx+EsN+fxfefl+sU1LXtIK8pN3LzexO+3JiotDTMSusvQpm8cLusUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744279605; c=relaxed/simple;
	bh=S+wP/glav5bx+FDG4NQZpxZHuk/Mqp/a/ZhxJMHKm4E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gGVJQ8jchP3XF5/imiCIQtmlXInnhVSUb2I0GdOzdIp82j1opU1x6qCkIB5FkOXyLs1cZFnHnBKtloIKWu7gpCmvx/6Ee5SIiDJLxecknay5Q3OJeBZoUl4qrb3U+uXDw/x9FyJ4PC/Rqoyis5wXLbY0UcIAtUZSYwBL0Kp5efk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Yfl2XllW; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Yfl2XllW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744279600;
	bh=S+wP/glav5bx+FDG4NQZpxZHuk/Mqp/a/ZhxJMHKm4E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Yfl2XllWDQ1NgOKKux3x7BqvYS1IRxHPVjUUq/QI4UTseAi9xjxHNtW7WQa9NbMDX
	 2Mokih5sTAg/jHuctMuFxOLfZ8SrZuwKt3C5gxTjMoudY53KqFZEoy1v8Np0cBY1oy
	 a62dANRMWkHnpAsm443y5zHNI1lxa/G9O/rN9cdyETurkqNeneYNXAOZIEHXIeAwtL
	 NOvQqjqNv0s9p7I+PB3xs477Aj+KfLc9hfUyGWgX6DSg6qszYgG9iuajXADTBgAmnE
	 mGAqJhizK0vTOz29M56pGccUWLb4pWUmdP9PV2IrtJSaFxBe1qmBA6IUVwXmuaR8N2
	 x3oSVnhWdltGw==
Received: from [192.168.1.90] (unknown [82.79.138.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8956917E010B;
	Thu, 10 Apr 2025 12:06:40 +0200 (CEST)
Message-ID: <5e9dd905-6d58-49e5-a45f-2e95c8772d26@collabora.com>
Date: Thu, 10 Apr 2025 13:06:39 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/15] drm/connector: hdmi: Factor out bpc and format
 computation logic
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-6-294d3ebbb4b2@collabora.com>
 <20250409-funny-hopping-condor-cbc50c@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250409-funny-hopping-condor-cbc50c@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 4/9/25 6:02 PM, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 26, 2025 at 12:19:55PM +0200, Cristian Ciocaltea wrote:
>> In preparation to support fallback to an alternative output format, e.g.
>> YUV420, when RGB cannot be used for any of the available color depths,
>> move the bpc try loop out of hdmi_compute_config() and, instead, make it
>> part of hdmi_compute_format_bpc().  Additionally, add a new parameter to
>> the latter holding the output format to be checked and eventually set.
>>
>> This improves code reusability and further extensibility.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> 
> I think patch 5 could be squashed into this one.

Ack.

>> ---
>>  drivers/gpu/drm/display/drm_hdmi_state_helper.c | 50 ++++++++++++-------------
>>  1 file changed, 23 insertions(+), 27 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> index 160964190d82ac233fdbe34ac54024a007a19872..6de0abb15ecb36fd4eb98725e2a3835e5e0db134 100644
>> --- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> +++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
>> @@ -608,42 +608,19 @@ static int
>>  hdmi_compute_format_bpc(const struct drm_connector *connector,
>>  			struct drm_connector_state *conn_state,
>>  			const struct drm_display_mode *mode,
>> -			unsigned int bpc)
>> +			unsigned int max_bpc, enum hdmi_colorspace fmt)
>>  {
>>  	struct drm_device *dev = connector->dev;
>> -
>> -	/*
>> -	 * TODO: Add support for YCbCr420 output for HDMI 2.0 capable
>> -	 * devices, for modes that only support YCbCr420.
>> -	 */
> 
> And we should fix that comment for now.

Sorry, I missed to move this hunk to the next patch.

> 
> Once fixed,
> Reviewed-by: Maxime Ripard <mripard@kernel.org>

Thanks,
Cristian
