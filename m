Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C58D62030A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 16:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747932426; cv=none; b=bQEc/WHItLmWOT9lEM56vIH9+AH2/2q+NbUkAIVjiJM/1VvZOVl4aMh/l8TzuveWk5VmXWkrNV286VjRuXfol4nlhvC3cAy3zBIYwWXU/XEp5vIq+lQu5kidsAMcGGYepu3z+NUWlKJd8qO5Q7d3wmtBqRxy4lbD+7PQzu1OOWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747932426; c=relaxed/simple;
	bh=XLm0hc7BzXquNGKFLwYgUdUknNpksi7bc2AsvCeutW4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GY8cwCFdqm7RUOqn7YJtGCJ28pRVSMKh3SP//3PqKjKWNXXC4/1mddYDN86idf10MTbJCDbafXqYGfVszWyvUbu6RbdNRWm4CFPxV0T4sNyRKsvgJRPHx/zmg4AEs17471Y+2EBgwmtLYTFLDLq+Sl5vMyB0bA/yKmO2VR8LTrA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V1sQz6jI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V1sQz6jI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747932421;
	bh=XLm0hc7BzXquNGKFLwYgUdUknNpksi7bc2AsvCeutW4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=V1sQz6jIMZ0EnmxS4YdrjtsCtiOZ8YlQH7+d682FOSt9mnKIPPZhBQI4KmYum17xv
	 GQ6zcFsjawnMt0RYjCJ4xZLNFHJBStLKIl+OwUc1Db8PYsffnQqTTWdhlWvc1S45FV
	 vs59bhSgmzexFxf4CoWORq8C0YsswiKRcj1AeCTk1/i+YAy12LMn2DdHP/Z47In1mc
	 n/F3umvgvPDrIKEpq4xhmqFBvU16DlCfDPcur3ivvEJHan3jpZztuX7cZX42ugn9aF
	 rQE92LQddTa2fJz0+Ux/HB44RWZ/E/xufBuUZgUfPQDwwuu2wvLSmsq6XMMc/GNyL+
	 uBX2GuM21Jbkg==
Received: from [192.168.1.90] (unknown [82.76.59.134])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 65FF517E1576;
	Thu, 22 May 2025 18:47:01 +0200 (CEST)
Message-ID: <88e1fed3-47eb-4925-b11a-71557af9add5@collabora.com>
Date: Thu, 22 May 2025 19:47:00 +0300
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
 <7ce1a2d1-f4cb-4975-be24-b47e184ce1a8@collabora.com>
 <20250522-fearless-muskrat-of-ampleness-1ccd49@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20250522-fearless-muskrat-of-ampleness-1ccd49@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/22/25 7:06 PM, Maxime Ripard wrote:
> On Mon, May 19, 2025 at 01:35:46PM +0300, Cristian Ciocaltea wrote:
>> On 5/19/25 10:22 AM, Maxime Ripard wrote:
>>> Hi,
>>>
>>> On Fri, Apr 25, 2025 at 01:27:05PM +0300, Cristian Ciocaltea wrote:
>>>> In preparation to improve error handling throughout all test cases,
>>>> introduce a macro to check for EDEADLK and automate the restart of the
>>>> atomic sequence.
>>>>
>>>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>>>> ---
>>>>  drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 10 ++++++++++
>>>>  1 file changed, 10 insertions(+)
>>>>
>>>> diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>>>> index c8969ee6518954ab4496d3a4398f428bf4104a36..c8bb131d63ea6d0c9e166c8d9ba5e403118cd9f1 100644
>>>> --- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>>>> +++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
>>>> @@ -224,6 +224,16 @@ drm_kunit_helper_connector_hdmi_init(struct kunit *test,
>>>>  				test_edid_hdmi_1080p_rgb_max_200mhz);
>>>>  }
>>>>  
>>>> +#define drm_kunit_atomic_restart_on_deadlock(ret, state, ctx, start) do {	\
>>>> +	if (ret == -EDEADLK) {							\
>>>> +		if (state)							\
>>>> +			drm_atomic_state_clear(state);				\
>>>> +		ret = drm_modeset_backoff(ctx);					\
>>>> +		if (!ret)							\
>>>> +			goto start;						\
>>>> +	}									\
>>>> +} while (0)
>>>> +
>>>
>>> I'm not sure here either, for pretty much the same reason. As far as
>>> locking goes, I really think we should prefer something explicit even if
>>> it means a bit more boilerplate.
>>>
>>> If you still want to push this forward though, this has nothing to do
>>> with kunit so it should be made a common helper. 
>>
>> Ack.
>>
>>> I do think it should be
>>> done in a separate series though. Ever-expanding series are a nightmare,
>>> both to contribute and to review :)
>>
>> Indeed, let me take this separately.
>>
>> If you agree, I'd prefer to drop EDEADLK handling from the new tests as
>> well, to allow sorting this out for all in a consistent manner.
> 
> We can't unfortunately. Most CI runners now run with WW_DEBUG that will
> test for EDEADBLK handling.

Ok, in that case I'll proceed with the explicit error handling for the
new tests only.  And as soon as the series gets merged, I'll come up
with a common helper and apply it for all tests.
