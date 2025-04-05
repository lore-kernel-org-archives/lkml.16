Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A44DC17B421
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 18:07:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743876440; cv=none; b=afKLyNtkz+/66llBfbG/MccNa/tMSsgozvmBnIBIIE9B0rx52undUAZ5ZuQ8A72UCHsOCBYpcK2ODhcRdXeLkBY/WKpdFgVYpZ6qw5JA7iDkaew+PhY8kLqW3P3zs44LCrSP9lgXNyTMzrnD4CfEU12+HXFcGLHqcueAzG8kxTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743876440; c=relaxed/simple;
	bh=l6e+d6JdKfJaD7MlskTP5DBpYGDzt7bpPPMTd1EEoRs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nJ03hUTrvM1CkJHNsXg0bMi0UB6VOi/CAVbG5yZSdazHErwy6OcfKihqk6sWP8lsEOLhOJAtQJL4UFfyNc2KVt2SVGlldhLiyIntmv2bxgU2FKRjrkdtVFWXOfhLJgWIRzz9ReNTSu3Csp6O71IuiR+auHCnYInpl4HpfPINda8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=bardXfuD; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="bardXfuD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ffoiDfGVv0vgJEbN88wEP/EagWrUG7dXjyM/xbICAUI=; b=bardXfuDuUG/s8XHD4EMEd/vwu
	K88caKbdvGO6+gkvsnFgKlRUHHEDsdZnDe9P22KwptN1+vTGNcTyLrii8351aWv2TSeLkfmq7+Lr2
	UTaWTm/sdA5lo7GBMeTTG374uSnNugq/GOORJK1q4UUYjHVpVzF5cRUVqU1mjEyOv7Hoi7zAZG4Cy
	jjTT1TEOWpY0qwCvJ9QQJ7OkBcxf5sUY+q0mHhDK6HkTDv51jbEz4xdttAfHrts5mPuAmq+VTzdXc
	8SjPxk4Bt/WA55ZK7whaEpYvBKdYOhxsQC2Uf7dHtbYAfBSsz60cEat69/yZptO3LuQFiNJ1UzJLx
	kmrM253A==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u17uv-00C0Qj-GF; Sat, 05 Apr 2025 20:06:53 +0200
Message-ID: <399026f9-9cde-48c5-80ee-f725fbc737fc@igalia.com>
Date: Sat, 5 Apr 2025 15:06:47 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] drm/vc4: tests: Retry pv-muxing tests when EDEADLK
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
 <20250403-drm-vc4-kunit-failures-v2-4-e09195cc8840@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-4-e09195cc8840@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 03/04/25 10:33, Maxime Ripard wrote:
> Some functions used by the HVS->PV muxing tests can return with EDEADLK,
> meaning the entire sequence should be restarted. It's not a fatal error
> and we should treat it as a recoverable error, and recover, instead of
> failing the test like we currently do.
> 
> Fixes: 76ec18dc5afa ("drm/vc4: tests: Add unit test suite for the PV muxing")
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 113 ++++++++++++++++++++++++-
>   1 file changed, 112 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> index 52c04ef33206bf4f9e21e3c8b7cea932824a67fa..d1f694029169adf6a907a72614bc66afd745017e 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
> @@ -685,20 +685,34 @@ static void drm_vc4_test_pv_muxing(struct kunit *test)
>   
>   	drm_modeset_acquire_init(&ctx, 0);
>   
>   	vc4 = priv->vc4;
>   	drm = &vc4->base;
> +
> +retry:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   	for (i = 0; i < params->nencoders; i++) {
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		ret = vc4_mock_atomic_add_output(test, state, enc_type);
> +		if (ret == -EDEADLK) {
> +			drm_atomic_state_clear(state);
> +			ret = drm_modeset_backoff(&ctx);
> +			if (!ret)
> +				goto retry;
> +		}
>   		KUNIT_ASSERT_EQ(test, ret, 0);
>   	}
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
>   	KUNIT_EXPECT_EQ(test, ret, 0);
>   
>   	KUNIT_EXPECT_TRUE(test,
>   			  check_fifo_conflict(test, state));
>   
> @@ -726,21 +740,35 @@ static void drm_vc4_test_pv_muxing_invalid(struct kunit *test)
>   
>   	drm_modeset_acquire_init(&ctx, 0);
>   
>   	vc4 = priv->vc4;
>   	drm = &vc4->base;
> +
> +retry:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	for (i = 0; i < params->nencoders; i++) {
>   		enum vc4_encoder_type enc_type = params->encoders[i];
>   
>   		ret = vc4_mock_atomic_add_output(test, state, enc_type);
> +		if (ret == -EDEADLK) {
> +			drm_atomic_state_clear(state);
> +			ret = drm_modeset_backoff(&ctx);
> +			if (!ret)
> +				goto retry;
> +		}
>   		KUNIT_ASSERT_EQ(test, ret, 0);
>   	}
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry;
> +	}
>   	KUNIT_EXPECT_LT(test, ret, 0);
>   
>   	drm_modeset_drop_locks(&ctx);
>   	drm_modeset_acquire_fini(&ctx);
>   }
> @@ -811,17 +839,30 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   
>   	drm_modeset_acquire_init(&ctx, 0);
>   
>   	drm = &vc4->base;
> +retry_first:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	new_hvs_state = vc4_hvs_get_new_global_state(state);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
>   
> @@ -834,17 +875,30 @@ static void drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable(struct kunit *tes
>   	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[hdmi0_channel].in_use);
>   
>   	ret = drm_atomic_helper_swap_state(state, false);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
> +retry_second:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_second;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_second;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	new_hvs_state = vc4_hvs_get_new_global_state(state);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
>   
> @@ -885,20 +939,39 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   
>   	drm_modeset_acquire_init(&ctx, 0);
>   
>   	drm = &vc4->base;
> +retry_first:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	new_hvs_state = vc4_hvs_get_new_global_state(state);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
>   
> @@ -919,17 +992,30 @@ static void drm_test_vc5_pv_muxing_bugs_stable_fifo(struct kunit *test)
>   	KUNIT_ASSERT_TRUE(test, new_hvs_state->fifo_state[old_hdmi1_channel].in_use);
>   
>   	ret = drm_atomic_helper_swap_state(state, false);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
> +retry_second:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	ret = vc4_mock_atomic_del_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_second;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_second;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	new_hvs_state = vc4_hvs_get_new_global_state(state);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, new_hvs_state);
>   
> @@ -979,29 +1065,54 @@ drm_test_vc5_pv_muxing_bugs_subsequent_crtc_enable_too_many_crtc_state(struct ku
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, vc4);
>   
>   	drm_modeset_acquire_init(&ctx, 0);
>   
>   	drm = &vc4->base;
> +retry_first:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI0);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_first;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
> -
>   	ret = drm_atomic_helper_swap_state(state, false);
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
> +retry_second:
>   	state = drm_kunit_helper_atomic_state_alloc(test, drm, &ctx);
>   	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
>   
>   	ret = vc4_mock_atomic_add_output(test, state, VC4_ENCODER_TYPE_HDMI1);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_second;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	ret = drm_atomic_check_only(state);
> +	if (ret == -EDEADLK) {
> +		drm_atomic_state_clear(state);
> +		ret = drm_modeset_backoff(&ctx);
> +		if (!ret)
> +			goto retry_second;
> +	}
>   	KUNIT_ASSERT_EQ(test, ret, 0);
>   
>   	new_vc4_crtc_state = get_vc4_crtc_state_for_encoder(test, state,
>   							    VC4_ENCODER_TYPE_HDMI0);
>   	KUNIT_EXPECT_NULL(test, new_vc4_crtc_state);
> 

