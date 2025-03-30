Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFB398F5B
	for <linux-kernel@vger.kernel.org>; Sun, 30 Mar 2025 18:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743358232; cv=none; b=h2PMnrp4E804X0fD825Sf6mfCN4Il+I8hQn1fM3YsXTbMnDZs8vWQci92RpCBPi3J5gLfM3U5I3J0N9dCHFZ1krtdg42gBfPaCm5zSRzwvJ8onm3GodlRhn6HzcNpsO0O/aFv/6zQLpMzq35/JsaK5AHoI3nIfgetAi2d9zjL88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743358232; c=relaxed/simple;
	bh=uxlRSDj+6l7hE2ngpMyNG1uZskgjxdbHsuqaEWdvBq0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=MyNKIQHpeaNNsOGCoMYk92RKtlz/4HmSjpYhAcKx33veti8967tAvhwVWhCaWrjqbFJZ54kf6iZ8GD+v0cXnabJdF8dcsXw4hjUljtuQZJSS+NwlC4sNRZpCG4LSY1XwUZD9Rcbt5ZNqHseQE8zMffIQ2WZMphPcb2iVLEZMNlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=MIbo4g88; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="MIbo4g88"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=N75v2HqyJOpmak3w13xGj/S5QvQzHhXruTn6pilQLIY=; b=MIbo4g88lf9x9jrf9xboOAIROs
	tPjCrSZjCosWazHBC/n+/akKzmviBEC4B5zzYdFHgsqg9RuYV9C4vxsbGA93rMAG2CzDAMGM2yN3p
	vbAQIlX6C5b1ik2c1PVvSVgNm7WvnvgblQp5h5jMzjo+scJsjNTtPzAr++g9JXj4uV2wttTEvwbAC
	kmyGNc+xF0j2ClVvXoU1ldjLqc/dyIqVgjQK3gG+M8aGeYZqEs2vY6etKBgAgolQ4gNXifQv32pTb
	C0lOdpdRYx9wRQbE8JyMrTje9YonvpwG9cF8Aglsx7EErGto5/PMN5TJNvmbkaBN9UODvVBqW0a5x
	V4ZaduyA==;
Received: from [189.7.87.178] (helo=[192.168.0.224])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1tyx6m-008mKg-1F; Sun, 30 Mar 2025 20:10:08 +0200
Message-ID: <5e353e6d-6e81-411b-8eef-dd4a241ca1ac@igalia.com>
Date: Sun, 30 Mar 2025 15:10:03 -0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] drm/vc4: tests: Stop allocating the state in test
 init
To: Maxime Ripard <mripard@kernel.org>
Cc: Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250318-drm-vc4-kunit-failures-v1-0-779864d9ab37@kernel.org>
 <20250318-drm-vc4-kunit-failures-v1-3-779864d9ab37@kernel.org>
 <ad77e39d-4862-4e04-87a0-2a6a2682d5c9@igalia.com>
 <20250328-radiant-azure-falcon-aafcf3@houat>
Content-Language: en-US
From: =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>
In-Reply-To: <20250328-radiant-azure-falcon-aafcf3@houat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Maxime,

On 28/03/25 12:32, Maxime Ripard wrote:
> On Sun, Mar 23, 2025 at 03:48:17PM -0300, Maíra Canal wrote:
>> Hi Maxime,
>>
>> On 18/03/25 11:17, Maxime Ripard wrote:
>>> The vc4-pv-muxing-combinations and vc5-pv-muxing-combinations test
>>> suites use a common test init function which, in part, allocates the
>>> drm atomic state the test will use.
>>>
>>> That allocation relies on  drm_kunit_helper_atomic_state_alloc(), and
>>> thus requires a struct drm_modeset_acquire_ctx. This context will then
>>> be stored in the allocated state->acquire_ctx field.
>>>
>>> However, the context is local to the test init function, and is cleared
>>> as soon as drm_kunit_helper_atomic_state_alloc() is done. We thus end up
>>> with an dangling pointer to a cleared context in state->acquire_ctx for
>>> our test to consumes.
>>>
>>> We should really allocate the context and the state in the test
>>> functions, so we can also control when we're done with it.
>>>
>>> Fixes: 30188df0c387 ("drm/tests: Drop drm_kunit_helper_acquire_ctx_alloc()")
>>> Signed-off-by: Maxime Ripard <mripard@kernel.org>
>>> ---
>>>    drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c | 41 +++++++++++++++++---------
>>>    1 file changed, 27 insertions(+), 14 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
>>> index 992e8f5c5c6ea8d92338a8fe739fa1115ff85338..52c04ef33206bf4f9e21e3c8b7cea932824a67fa 100644
>>> --- a/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
>>> +++ b/drivers/gpu/drm/vc4/tests/vc4_test_pv_muxing.c
>>> @@ -18,11 +18,10 @@
>>>    #include "vc4_mock.h"
>>>    struct pv_muxing_priv {
>>>    	struct vc4_dev *vc4;
>>> -	struct drm_atomic_state *state;
>>
>> Can't we add `struct drm_modeset_acquire_ctx` here? Then, we can be sure
>> that the context exists during the entire test case.
>>
>> Also, we can add `drm_modeset_drop_locks()` and
>> `drm_modeset_acquire_fini()` to a exit function in the kunit suite.
> 
> That's what we were doing before, but the kunit functions and exit
> functions are run in a separate thread by design, which then cause
> lockdep to complain.
> 
> It's not great, but we can't really change either :/
> 

Thanks for the explanation, Maxime. In that case,

Reviewed-by: Maíra Canal <mcanal@igalia.com>

Best Regards,
- Maíra

> Maxime

