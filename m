Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFABB67A
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747652115; cv=none; b=HIONtv6xWiRkS7HCi/ZNxAWY+YL9RZxo8oqUPcRkaNnipoiO/APBvyB6MRnxWKXWrLOr1SQKoz/QKPlYUhW21ME2Oi2qQRZEW1XGIvwyXys1TIys8+98mIKJBy0gQBIzM3L3sGCSk7z732MswItIbKnPwXPtTWQ3vH4RSEaTxyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747652115; c=relaxed/simple;
	bh=QYtP5LmynK+du7Qm68XYDkrn/AYsAtkImr/n6dXxi7E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r4C9hlsmVbXLQu3tjwlUUw/CUfcIRO3DYwq5r0vdOiWqpGgSHgCDAXvVVouyz3ZmbRXO132rHC0Ge4zthF2TxKFbytBn3sWnQwzTCDEnoqwO3u5wUBJT0y6hAdOcM/0PzsTHDdQQdAmChS/7oPZDyCSbVk6wSR+lF7fV23i1lkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=ZXT6/yKl; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="ZXT6/yKl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747652111;
	bh=QYtP5LmynK+du7Qm68XYDkrn/AYsAtkImr/n6dXxi7E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZXT6/yKlnR68NbxOPBY9ket/ifVrl0sM3+kTkSDydE+TANkeBnlxsXE6jGMjqxPj5
	 w2FzEyjwiTA0qCq0lYCZNtD+IEeTeWxmu9B2SWX9ARJTGOi0AMQqzOlsf+5GPE1TZa
	 P7R5qHzgF/TxqxFKXuzaBUHJQdZhIf0602nFhR84KUMCsgSGY6ER4WMGv7twDej27Y
	 JZ6BPMRj0kaLcVa177EQ26HwmED7sr6J+5ivnF7HTsOybkVB4B7nlKl297DOegPeLC
	 qMTX3NQWcUmZutgo2aFmOKrESw7Em9fxFKwJDQ3OwdlG93pytRfyvu8ReyhhXon/Sl
	 sukKRC4dWs2vQ==
Received: from [192.168.1.90] (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3E7F417E07E5;
	Mon, 19 May 2025 12:55:11 +0200 (CEST)
Message-ID: <a37b4045-0d94-4148-bb1e-fc08104e6173@collabora.com>
Date: Mon, 19 May 2025 13:55:10 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 23/23] drm/tests: hdmi: Add test for unsupported
 RGB/YUV420 mode
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-23-5e55e2aaa3fa@collabora.com>
 <20250519-classy-millipede-of-competence-4bb6ad@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250519-classy-millipede-of-competence-4bb6ad@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 11:42 AM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 25, 2025 at 01:27:14PM +0300, Cristian Ciocaltea wrote:
>> Provide a test to verify that if both driver and screen support RGB and
>> YUV420 formats, drm_atomic_helper_connector_hdmi_check() cannot succeed
>> when trying to set a mode unsupported by the display.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 66 ++++++++++++++++++++++
>>  1 file changed, 66 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index d79084cfb516b69c4244098c0767d604ad02f2c3..6337a1c52b86810c638f446c4995e7ee63dbc084 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -1622,6 +1622,71 @@ static void drm_test_check_driver_unsupported_fallback_yuv420(struct kunit *test
>>  	drm_modeset_acquire_fini(&ctx);
>>  }
>>  
>> +/*
>> + * Test that if a driver and screen supports RGB and YUV420 formats, but the
>> + * chosen mode cannot be supported by the screen, we end up with unsuccessful
>> + * fallback attempts.
>> + */
>> +static void drm_test_check_display_unsupported_fallback_rgb_yuv420(struct kunit *test)
>> +{
>> +	struct drm_atomic_helper_connector_hdmi_priv *priv;
>> +	struct drm_modeset_acquire_ctx ctx;
>> +	struct drm_crtc_state *crtc_state;
>> +	struct drm_atomic_state *state;
>> +	struct drm_display_info *info;
>> +	struct drm_display_mode *preferred, *unsupported_mode;
>> +	struct drm_connector *conn;
>> +	struct drm_device *drm;
>> +	struct drm_crtc *crtc;
>> +	int ret;
>> +
>> +	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
>> +				BIT(HDMI_COLORSPACE_RGB) |
>> +				BIT(HDMI_COLORSPACE_YUV420),
>> +				10,
>> +				&dummy_connector_hdmi_funcs,
>> +				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
>> +	KUNIT_ASSERT_NOT_NULL(test, priv);
>> +
>> +	drm = &priv->drm;
>> +	crtc = priv->crtc;
>> +	conn = &priv->connector;
>> +	info = &conn->display_info;
>> +	KUNIT_ASSERT_TRUE(test, info->is_hdmi);
>> +	KUNIT_ASSERT_TRUE(test, conn->ycbcr_420_allowed);
>> +
>> +	preferred = find_preferred_mode(conn);
>> +	KUNIT_ASSERT_NOT_NULL(test, preferred);
>> +
>> +	unsupported_mode = drm_kunit_display_mode_from_cea_vic(test, drm, 96);
>> +	KUNIT_ASSERT_NOT_NULL(test, unsupported_mode);
> 
> I'm not sure what this one is supposed to test. If the mode is
> unsupported by the screen, it will be for both YUV and RGB, right? So
> what are we testing here?

That would be the case suggested at [1]:

"We still need to do the same with a driver that supports both, but the
monitor doesn't."

Should we drop it?

[1] https://lore.kernel.org/all/20250410-singing-scarlet-carp-d136f9@houat/

