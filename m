Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D2A283691
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 12:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744286865; cv=none; b=r2FR0g3dcEML9nDGmQX+fPuriJeP1kO8DqeGrxz+qQabij3edV/cngpl1HjCItibUB8jetjbq0ekYmazU7T9NkxJEYt9SVj1FlZv67zu9BCMhA3ygOV0vNLGu15u7SFMavVgOQvHoYiALItG0Sbb9aXHalmOen0oY0w7Ye5tvH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744286865; c=relaxed/simple;
	bh=co/cNt+3OWXv7GVkKFQOeIlzBr/aGJAjHXv4uNCAl2s=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o2knCCgq0Ek2+ScHJ/zhkAHdN5aqFb39ZpI9fGPYDlBSwpg60UExbHI8RlXaPUHrsPkZ4ev7IrSI1PEBKm18CO+wrfrGmZI/6eRyN2c/eZGDaVfs1Cq1fNYYy10p5aumJAmEkSS+8iKrJDJOvpLWWNMmqLic/lhs94HjOhTDaio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=Zz/+/6Sd; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="Zz/+/6Sd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1744286861;
	bh=co/cNt+3OWXv7GVkKFQOeIlzBr/aGJAjHXv4uNCAl2s=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Zz/+/6SdnWquqmzCBQt2bWpNrehCKn0MDIFFUJWPGZETzEc63tnon+inL+hYYujX0
	 9lKpQd4hLZLUt+vlvps1/V7XsnjTo0IMth/ND959t6UQGWcSCAh1SEdrllivVC6Lp1
	 MsHbeiJfPorcDGC3IsPnzkRWBsJSQOCjGFivLVfrv8BWItrB48nueMUMXgzsgS+YHp
	 ZLr8Mq30AUIri7YkQa0jUoewA+RFHSsdZMKoSfPJzd+RV9PNsmM4pi3KRNp2B2z4VD
	 6HZgUClal02UwXkx4ZFIigdU8oYflnuvP2CKJxkqb3ooFbGZQqnl8p2EUW58fBA3Iy
	 RskVCSMkb9XDA==
Received: from [192.168.1.90] (unknown [82.79.138.25])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9C72C17E0904;
	Thu, 10 Apr 2025 14:07:40 +0200 (CEST)
Message-ID: <a4a2680a-eaf7-4505-afbd-b3a71dd46d5a@collabora.com>
Date: Thu, 10 Apr 2025 15:07:40 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 15/15] drm/tests: hdmi: Add test for unsuccessful
 forced fallback to YUV420
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250326-hdmi-conn-yuv-v3-0-294d3ebbb4b2@collabora.com>
 <20250326-hdmi-conn-yuv-v3-15-294d3ebbb4b2@collabora.com>
 <20250410-singing-scarlet-carp-d136f9@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250410-singing-scarlet-carp-d136f9@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 4/10/25 12:21 PM, Maxime Ripard wrote:
> Hi,
> 
> On Wed, Mar 26, 2025 at 12:20:04PM +0200, Cristian Ciocaltea wrote:
>> Provide test to verify a forced fallback to YUV420 output cannot succeed
>> when driver doesn't advertise YUV420 support.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 46 ++++++++++++++++++++++
>>  1 file changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index 99bedb2d6f555b3b140256000dfa7491d2a8f515..c2976b42aa2aacd2a68a871bffe97e795ca713d4 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -1493,6 +1493,51 @@ static void drm_test_check_max_tmds_rate_format_fallback_yuv420(struct kunit *te
>>  	drm_modeset_acquire_fini(&ctx);
>>  }
>>  
>> +/*
>> + * Test that if a driver supports only RGB, but the chosen mode can be
>> + * supported by the screen only in YUV420 output format, we end up with
>> + * an unsuccessful forced fallback attempt.
> 
> What do you mean by "forced"?

I wanted to describe the context where there's no alternative other than
doing the fallback.  Should we replace with "mandatory" maybe?

>> + */
>> +static void drm_test_check_driver_unsupported_fallback_yuv420(struct kunit *test)
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_display_info *info;
>> +	struct drm_display_mode *yuv420_only_mode;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid(test,
>> +				BIT(HDMI_COLORSPACE_RGB),
>> +				12,
>> +				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	conn = &priv->connector;
>> +	info = &conn->display_info;
>> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>> +	KUNIT_ASSERT_FALSE(test, conn->ycbcr_420_allowed);
>> +
>> +	yuv420_only_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 95);
>> +	KUNIT_ASSERT_NOT_NULL(test, yuv420_only_mode);
>> +	KUNIT_ASSERT_TRUE(test, drm_mode_is_420_only(info, yuv420_only_mode));
>> +
>> +	drm_modeset_acquire_init(&ctx, 0);
>> +
>> +	ret = drm_kunit_helper_enable_crtc_connector(test, drm,
>> +						     crtc, conn,
>> +						     yuv420_only_mode,
>> +						     &ctx);
>> +	KUNIT_EXPECT_LT(test, ret, 0);
> 
> I think that's where your current approach falls a bit short. You should
> really craft the state yourself and check the returned value of
> drm_atomic_check_only(), not rely on
> drm_kunit_helper_enable_crtc_connector() doing the right thing, when it
> doesn't really tell you :)

Ack.

> 
>> +	drm_modeset_drop_locks(&ctx);
>> +	drm_modeset_acquire_fini(&ctx);
>> +}
>> +
> 
> We still need to do the same with a driver that supports both, but the
> monitor doesn't.

Ack.

Thanks,
Cristian
