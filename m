Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E4612E403
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743876490; cv=none; b=ou2l3zXAYIbDgdiPrx5eJCyqdUfmu2gB3PmziSIYg5Q/Y9vOARfZy09JHcVXI1BWTMI33aeXFsoR6JawX12dzxkbrPQkraW6I/qnnqkC7RWXrHlp4IG2lAgqK3NdzvxYQlZyRFzE3BwfVXqWupg8O1NOAOy8nnmDFmk0E09LecE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743876490; c=relaxed/simple;
	bh=ns8CKt/6Dn5hVnd7KAix3Yh2osgF7gWmfyvOamxCndo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=pdD+EtjVSXrPHNU+hmLZE0TwLjJPk6nQCbtyKyB5LRdjksWvNEwLph4a2XtJltCrQJjTu1bO9HwknwF67RNyS3Dw/auSryvV8ZdBVZoX6LCpGScymjlhheFIBJ6KZPKGu0YdmT0ss37UbfXuN3s+tTniFBjMl2LlmoZ9/u1SU3k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=jLrHuQhG; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="jLrHuQhG"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=6qIyleONiLSSPKKgUjjASa5DayAR0eM92TEDLOf7Z7A=; b=jLrHuQhG9Rj0wGejx3thobwiMs
	jZWXL9Y2pJo7r1dO3s+22uk2vwk67hSpN/VeEfCDLXVfT3G3TfIiPSqseYnK8JqGRLJQAMBv6GFGH
	FaDfzL01xUxjamIak0Nm3g17KTcUxQe/Ic9C9Us+l++6NcM4peIBRzn1dbgecyr8oWLY1yZvKrw5n
	ZXr4X8a6O9X4x4/siKKMBphsSQkHopHyw4cy7RYyfjhYNwR8QDRyc7cQBel13B+TgfYYRs/aPUtvI
	UB1FA++kycOdD3RvblyxPrzMf9eXUqtcDIPAFT0N5QlGjRQYD+ZsFfF3TDWBH/0hKaXyFMVDsxeT9
	HLpD4PEg==;
Received: from [189.7.87.174] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1u17w0-00C0Re-Ko; Sat, 05 Apr 2025 20:08:00 +0200
Message-ID: <161cd38b-2119-43f2-bc2c-494e9e60de41@igalia.com>
Date: Sat, 5 Apr 2025 15:07:56 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] drm/vc4: tests: Document output handling functions
To: Maxime Ripard <mripard@kernel.org>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250403-drm-vc4-kunit-failures-v2-0-e09195cc8840@kernel.org>
 <20250403-drm-vc4-kunit-failures-v2-2-e09195cc8840@kernel.org>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250403-drm-vc4-kunit-failures-v2-2-e09195cc8840@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 03/04/25 10:33, Maxime Ripard wrote:
> vc4_mock_atomic_add_output() and vc4_mock_atomic_del_output() are public
> but aren't documented. Let's provide the documentation.
> 
> In particular, special care should be taken to deal with EDEADLK.
> 
> Signed-off-by: Maxime Ripard <mripard@kernel.org>

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> ---
>   drivers/gpu/drm/vc4/tests/vc4_mock_output.c | 26 ++++++++++++++++++++++++++
>   1 file changed, 26 insertions(+)
> 
> diff --git a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> index f0ddc223c1f839e8a14f37fdcbb72e7b2c836aa1..577d9a9563696791632aec614c381a214886bf27 100644
> --- a/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> +++ b/drivers/gpu/drm/vc4/tests/vc4_mock_output.c
> @@ -59,10 +59,23 @@ struct vc4_dummy_output *vc4_dummy_output(struct kunit *test,
>   
>   static const struct drm_display_mode default_mode = {
>   	DRM_SIMPLE_MODE(640, 480, 64, 48)
>   };
>   
> +/**
> + * vc4_mock_atomic_add_output() - Enables an output in a state
> + * @test: The test context object
> + * @state: Atomic state to enable the output in.
> + * @type: Type of the output encoder
> + *
> + * Adds an output CRTC and connector to a state, and enables them.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure. If the error is
> + * EDEADLK, the entire atomic sequence must be restarted. All other
> + * errors are fatal.
> + */
>   int vc4_mock_atomic_add_output(struct kunit *test,
>   			       struct drm_atomic_state *state,
>   			       enum vc4_encoder_type type)
>   {
>   	struct drm_device *drm = state->dev;
> @@ -103,10 +116,23 @@ int vc4_mock_atomic_add_output(struct kunit *test,
>   	crtc_state->active = true;
>   
>   	return 0;
>   }
>   
> +/**
> + * vc4_mock_atomic_del_output() - Disables an output in a state
> + * @test: The test context object
> + * @state: Atomic state to disable the output in.
> + * @type: Type of the output encoder
> + *
> + * Adds an output CRTC and connector to a state, and disables them.
> + *
> + * Returns:
> + * 0 on success, a negative error code on failure. If the error is
> + * EDEADLK, the entire atomic sequence must be restarted. All other
> + * errors are fatal.
> + */
>   int vc4_mock_atomic_del_output(struct kunit *test,
>   			       struct drm_atomic_state *state,
>   			       enum vc4_encoder_type type)
>   {
>   	struct drm_device *drm = state->dev;
> 

