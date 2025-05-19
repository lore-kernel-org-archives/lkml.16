Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20C24C92
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 10:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747650951; cv=none; b=UKhwi77XLEXEmLql6KPUoCQZjyOfg+RNBjLRSH7Wbk9gvKZrqpHaGlzHW93hugJi4ww4fbgIBxwyjM6CZPstLJ1qulk0pQHabvLeCtuGOheBkYGF0f2syOoXzubkd9h501hAXe9OKgWSFdlIwjMfFlHsIpbyzFnmYw+tCVUWJC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747650951; c=relaxed/simple;
	bh=jtB7PHlQfSBY3IYgiJFF4EXqqJieedjKydBtE/22bS0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=a9ZIBTs8ba8aNZ+dFhnHMAEI6vVqCNWzwkaZ0CRvYTqhHQBu1TCZt2SvbJWv7HzJbtUABGpvwe+WYfUB6+ESV8zRP69MEuyvVn0MYrDciLVdf/8oAmosq7XfIcvExrWrjuhu5fwermh5Tavi+RDswjeB6lU0CpgdLXKgvjlN67k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=i31B5qxi; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="i31B5qxi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747650947;
	bh=jtB7PHlQfSBY3IYgiJFF4EXqqJieedjKydBtE/22bS0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=i31B5qxibamcvqdrVJ599/69s9CrJ0SXjU1hObfJQEuCm8NTZEKYSV7ywgLxRgZ/2
	 3faSMVr6V+aYuhHZlSkjUD8KP8OSCnDAlJqna6cftQ93xAfAUw/p84vRpO7zwH+rhK
	 Hm3I0VHHnQ/e+si5+mdgwYKCspcyL/kl13HJiVhtWYHYYIxo236ipGfvKMn4U7GYiV
	 IM1hW2X1rWgoq5WAeGRt3oSMAc3zDg9HHT3k18KJblucbbwXMp0RP3wip9ech+2u+0
	 LKPc8QQOgCpyZljlTEPmuaqB8DEPT/bRedG91LVNwvtP5wAgU75aEV+9+OMaoqQWzz
	 NOlIUPMdqbDUw==
Received: from [192.168.1.90] (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1773717E0F47;
	Mon, 19 May 2025 12:35:47 +0200 (CEST)
Message-ID: <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
Date: Mon, 19 May 2025 13:35:46 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 14/23] drm/tests: hdmi: Add macro to support EDEADLK
 handling
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250425-hdmi-conn-yuv-v4-0-5e55e2aaa3fa@collabora.com>
 <20250425-hdmi-conn-yuv-v4-14-5e55e2aaa3fa@collabora.com>
 <20250519-sturdy-cyan-mouse-6bd0f1@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250519-sturdy-cyan-mouse-6bd0f1@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/19/25 10:22 AM, Maxime Ripard wrote:
> Hi,
> 
> On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
>> In preparation to improve error handling throughout all test cases,
>> introduce a macro to check for EDEADLK and automate the restart of the
>> atomic sequence.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e166c8d9ba5e403118cd9f1 100644
>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
>>  				test_edid_hdmi_1080p_rgb_max_200mhz);
>>  }
>>  
>> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start) do {	\
>> +	if (ret == -EDEADLK) {							\
>> +		if (state)							\
>> +			drm_atomic_state_clear(state);				\
>> +		ret = drm_modeset_backoff(ctx);					\
>> +		if (!ret)							\
>> +			goto start;						\
>> +	}									\
>> +} while (0)
>> +
> 
> I'm not sure here either, for pretty much the same reason. As far as
> locking goes, I really think we should prefer something explicit even if
> it means a bit more boilerplate.
> 
> If you still want to push this forward though, this has nothing to do
> with kunit so it should be made a common helper. 

Ack.

> I do think it should be
> done in a separate series though. Ever-expanding series are a nightmare,
> both to contribute and to review :)

Indeed, let me take this separately.

If you agree, I'd prefer to drop EDEADLK handling from the new tests as
well, to allow sorting this out for all in a consistent manner.

Thanks,
Cristian
