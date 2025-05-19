Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97788224895
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:20:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650046; cv=none; b=lZxjpYQCRBM6cV6csu6GJOxLUcK9/njsZZJCpe1OyToUwcQpys7or0Vw7gCBEFxSqgj6HeXT6S5Swvp+Iy+b3ClTKZrgJkJYhrb/DVAlkKoflAN/Gx/CPm5uW62XBbVzvumS/4ranQ9XW4BwiOzZmYjUXy5hSsr9GWTOHKPX/64=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650046; c=relaxed/simple;
	bh=EotJMFb+Ck/FoiIg9Z1U/E97Kq5drwroY2IQOgCFFhA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=DB5dX7m9d9bgjHMVn27ZHL6PEaU1VAaNOo719jfnEirY/gJzDSFNvZ7kfISRHkAu870VO9dorWDD0a/4KzlVs2WmgACUhv9lTD6uzx1mrfjQM94iHaqEgwEXLiGfcc3riCiylMhzbyx3Cfk60qA1Y6HMJhCuYMyxqLEjkmNcYhs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=K9EpMG/9; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="K9EpMG/9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747650037;
	bh=EotJMFb+Ck/FoiIg9Z1U/E97Kq5drwroY2IQOgCFFhA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K9EpMG/9tqy3MXCDVDeCNNzNQ6dvhdk6Y8/NxZZbVFQZ1/FbrBE8fOSqJJUukG8AX
	 gkSi6ZzbMNWIb/89BIUZAbcSHjk1vjW7F5HDYJqjVGh5O7aLKcNwKaV/27y73lg6I5
	 B9iWdScac8CISCAgzKQs39s+qMRkGrb2CZWYYaDc0HSrdOJIJfKYB1OTJ1cAwyU4FF
	 qRsQbW5o9FtsAgHVNcSJTLjV0gGE6Cerv8KU3Eg4r1iYzU1yLFmUUlxKMmRzIGZ1z8
	 tQUKTxI2eUVCbt78vhiJgveEsBcT6bToIXJiNtYBIebfs2a6zGPLMF3lwzg8b6q+KP
	 5fEn+0flxujjg==
Received: from [192.168.1.90] (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id ECDD817E0FD4;
	Mon, 19 May 2025 12:20:36 +0200 (CEST)
Message-ID: <050e7504-67c9-4384-826a-c655cef51b09@collabora.com>
Date: Mon, 19 May 2025 13:20:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 12/23] drm/tests: helpers: Add a (re)try helper variant
 to enable CRTC connector
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-12-5e55e2aaa3fa@collabora.com>
 <n2ojf77winz6b4kchmt6bnppomb6cpg4okrwnh6iibsemou4as@t5lhg3m24bjm>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <n2ojf77winz6b4kchmt6bnppomb6cpg4okrwnh6iibsemou4as@t5lhg3m24bjm>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Maxime,

On 5/16/25 4:15 PM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 25, 2025 at 01:27:03PM +0300, Cristian Ciocaltea wrote:
>> Provide a wrapper over drm_kunit_helper_enable_crtc_connector() to
>> automatically handle EDEADLK.
>>
>> This is going to help improve the error handling in a bunch of test
>> cases without open coding the restart of the atomic sequence.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_kunit_helpers.c | 39 +++++++++++++++++++++++++++++++
>>  include/drm/drm_kunit_helpers.h           |  7 ++++++
>>  2 files changed, 46 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_kunit_helpers.c b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> index 5f7257840d8ef0aeabe5f00802f5037ed652ae66..4e1174c50b1f2b6358eb740cd73c6d86e53d0df9 100644
>> --- a/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> +++ b/drivers/gpu/drm/tests/drm_kunit_helpers.c
>> @@ -332,6 +332,45 @@ int drm_kunit_helper_enable_crtc_connector(struct kunit *test,
>>  }
>>  EXPORT_SYMBOL_GPL(drm_kunit_helper_enable_crtc_connector);
>>  
>> +/**
>> + * drm_kunit_helper_try_enable_crtc_connector - (Re)tries to enable a CRTC -> Connector output
>> + * @test: The test context object
>> + * @drm: The device to alloc the plane for
>> + * @crtc: The CRTC to enable
>> + * @connector: The Connector to enable
>> + * @mode: The display mode to configure the CRTC with
>> + * @ctx: Locking context
>> + *
>> + * This function is a wrapper over @drm_kunit_helper_enable_crtc_connector
>> + * to automatically handle EDEADLK and (re)try to enable the route from
>> + * @crtc to @connector, with the given @mode.
>> + *
>> + * Returns:
>> + *
>> + * A pointer to the new CRTC, or an ERR_PTR() otherwise.
>> + */
>> +int drm_kunit_helper_try_enable_crtc_connector(struct kunit *test,
>> +					       struct drm_device *drm,
>> +					       struct drm_crtc *crtc,
>> +					       struct drm_connector *connector,
>> +					       const struct drm_display_mode *mode,
>> +					       struct drm_modeset_acquire_ctx *ctx)
>> +{
>> +	int ret;
>> +
>> +retry_enable:
>> +	ret = drm_kunit_helper_enable_crtc_connector(test, drm, crtc, connector,
>> +						     mode, ctx);
>> +	if (ret == -EDEADLK) {
>> +		ret = drm_modeset_backoff(ctx);
>> +		if (!ret)
>> +			goto retry_enable;
>> +	}
>> +
>> +	return ret;
>> +}
>> +EXPORT_SYMBOL_GPL(drm_kunit_helper_try_enable_crtc_connector);
> 
> I'm not sure it's a good idea. This function might affect the locking
> context of the caller without even reporting it.
> 
> Generally speaking, I'd really prefer to have explicit locking, even if
> it means slightly more boilerplate.

Ack.

Will drop this patch and the next one for now, and sort this out in a
separate series.

Thanks,
Cristian
