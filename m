Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D1028A70A
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:57:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747918670; cv=none; b=kwumECy/nx1umrRF+cm5f/SymvVPqGGp2YMYC3TczWGTF+WFiOciPKTR3gFK7ccw9st6Ni2Y/qWmnGfolLMSchKYlibEYXCzLPEnIsOWuOwIwKU/a9dS0a5za4MUAKIdyZpzrC4lu6XWKvGnGQTxzpiJh72+nFMEOIjKTIsBP3U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747918670; c=relaxed/simple;
	bh=D4dk659ElIXA7Fq5aXgCg81eo2vzP5vztZe+qk+vjPg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=m996vHu2HcUvHhSxNjRFjEqb3Gq9EdmxC/7Zye3PnU14Fxj0ftmjd6QwG5h6muOrpp6hrTtdi+Tm487luBjGQDI4rGo0ndB2B5/jnu84JtQUTFUTBy6oYJQFo/M1A+EIwW4DAl8P/k/pXMAxZ4OLkTwfSkWlq0zXLqREfqjrxd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net; spf=none smtp.mailfrom=ursulin.net; dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b=fY+U8YtJ; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ursulin.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=ursulin.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ursulin-net.20230601.gappssmtp.com header.i=@ursulin-net.20230601.gappssmtp.com header.b="fY+U8YtJ"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-3a35b7e60cbso5443315f8f.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 05:57:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ursulin-net.20230601.gappssmtp.com; s=20230601; t=1747918667; x=1748523467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
        b=fY+U8YtJOgKcxqZtmGGE0JOZeapbjRGVAGp6vzDSey5Dydte3xV/ljH0FY6QcB0ofg
         Vz2CE6Pba2tRhw70QEvXXVCPAy11gWKEX+NiVa3/ytnT23zSRJ6CpID4NT2gl2wT3Lml
         Skt/M3Tht+I+BzKTUZ00cOl0E/b9dsZezP4/mOdA78jWrlCseCKaYABMT5tByNbaivs0
         vYKJLR1xIcB9sDo6S84GJeZQ4w/NrLUTARsjwckMfyiuejAqd2TzTtANgCeViUJQH/js
         ImOnNMNuT4ZLKtHgmFVlujTAhCqVujAtQqKzGwL3wNKqiL8muVErNeniUEQR02tOnJ59
         F2qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747918667; x=1748523467;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3J9AMbyW3GoHyzEzAk0eTuO9WQLNRNBObnNC+tBgquY=;
        b=BbOmn1tkHMLGjSziw9Oe/RTogJwE/rLcgd5RVXGoYD3KClPGwkmLItBPGFi6LhgPGy
         I5zpgTMTrJizi90no3txkBlG0OzviePwKQwbjL4y+y4cIbJ/IGa19mrx3nru9LEMuOTO
         kYnDaPdUJA+fP5jbrGLcQqFtURm32gkw4dCr8HrykzBAK35vDuDVkwNqbLtuRFI8JXpB
         AvSturkbvMSq6s+4bYAsnGVkymWg6l3W/oehJ0XQPjjCJedI/R68vnOg5E3lhUKeVvop
         QeM4nX74XOJ8XDOR0U96/rjRACb3i5K13euug0R1NNN+jlPD3SBWPHJbN+AZFVWDNrAb
         2wLQ==
X-Forwarded-Encrypted: i=1; AJvYcCULF+FKzEkLLHzOOdq50StMGq1f92tIrbAuYp2sFkyxxNkNcxyFeClkDDvVOXAs+rZz8bUM5gM4rujIcdY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNTkkV7uRE0XpILWTAnel4CUrOd2Vk+VaYJ+iMEWFA46o1MgPf
	b7Kq4Q5OnYExNSxhlqJ5T17319HBWEFC+7KoVhn5VPnyc4Pyl6xNFFoV5yNYTVHXXVc=
X-Gm-Gg: ASbGnctCzuWJqyWMjVlj67INczHBNXTSyCU74f2y+wBjHXfowrGak15mCHTVYc7/sj2
	RsqWNn0vuSgq17uN8kBgOyXmeMt0a1lqLFPSWNJflk/dt+H23+0RZx06uII3roQV2nGycbc3cKX
	O4CzJUmCOb/d6o7IKPKuX1kaPVVw2VNaHq0UoehAQZAzNfyVjxCqI7uUxKdxVT8O6CGzIbi0Nu5
	jZVWRRBVbpJgZhps4dxcNITJU/CkUFu0kB2VoyWvcjWpLO8Ne4se8xXRa8v6Cvzs2yDlghfFj9r
	iPDh/NA7GiBz6Mei375ENrOXQBBM070sVl0lN1r1bA9vN/fErlyaIUUlo73w3o8qlg==
X-Google-Smtp-Source: AGHT+IHvgtQQC0r16ZhryOrtlBzgjmQhsHS0R3Z6+yIPce93CHi+ORR3bGFByrXrywpyK9wgMjlkUA==
X-Received: by 2002:a05:6000:40dd:b0:3a3:7816:3e17 with SMTP id ffacd0b85a97d-3a378163e38mr12097933f8f.8.1747918666820;
        Thu, 22 May 2025 05:57:46 -0700 (PDT)
Received: from [192.168.0.101] ([81.79.92.254])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6210asm22857327f8f.41.2025.05.22.05.57.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 22 May 2025 05:57:46 -0700 (PDT)
Message-ID: <096c06b8-2cb6-4231-93aa-7091ea558e22@ursulin.net>
Date: Thu, 22 May 2025 13:57:45 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] drm/nouveau: Don't signal when killing the fence
 context
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 phasta@kernel.org, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-media@vger.kernel.org
References: <20250522112540.161411-2-phasta@kernel.org>
 <20250522112540.161411-3-phasta@kernel.org>
 <af03b541-0b69-4b3d-b498-b68e0beb3dcb@amd.com>
 <06210b9dc5e5ea8365295b77942c3ca030f02729.camel@mailbox.org>
 <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Language: en-GB
From: Tvrtko Ursulin <tursulin@ursulin.net>
In-Reply-To: <eae0ff0f-31a6-433a-b255-9bdb4727a940@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 22/05/2025 13:34, Christian König wrote:
> On 5/22/25 14:20, Philipp Stanner wrote:
>> On Thu, 2025-05-22 at 14:06 +0200, Christian König wrote:
>>> On 5/22/25 13:25, Philipp Stanner wrote:
>>>> dma_fence_is_signaled_locked(), which is used in
>>>> nouveau_fence_context_kill(), can signal fences below the surface
>>>> through a callback.
>>>>
>>>> There is neither need for nor use in doing that when killing a
>>>> fence
>>>> context.
>>>>
>>>> Replace dma_fence_is_signaled_locked() with
>>>> __dma_fence_is_signaled(), a
>>>> function which only checks, never signals.
>>>
>>> That is not a good approach.
>>>
>>> Having the __dma_fence_is_signaled() means that other would be
>>> allowed to call it as well.
>>>
>>> But nouveau can do that here only because it knows that the fence was
>>> issued by nouveau.
>>>
>>> What nouveau can to is to test the signaled flag directly, but that's
>>> what you try to avoid as well.
>>
>> There's many parties who check the bit already.
>>
>> And if Nouveau is allowed to do that, one can just as well provide a
>> wrapper for it.
> 
> No, exactly that's what is usually avoided in cases like this here.
> 
> See all the functions inside include/linux/dma-fence.h can be used by everybody. It's basically the public interface of the dma_fence object.
> 
> So testing if a fence is signaled without calling the callback is only allowed by whoever implemented the fence.
> 
> In other words nouveau can test nouveau fences, i915 can test i915 fences, amdgpu can test amdgpu fences etc... But if you have the wrapper that makes it officially allowed that nouveau starts testing i915 fences and that would be problematic.

But why? Say for example scheduler dependencies - why the scheduler 
couldn't ignore them at add time, but it can before trying to install a 
callback on them, and instead has to opportunistically signal someone 
else's fences?

I don't see it. But even if there is a reason, advantage of the helper 
is that it can document this at a centralised place.

Regards,

Tvrtko

>> That has the advantage of centralizing the responsibility and
>> documenting it.
>>
>> P.
>>
>>>
>>> Regards,
>>> Christian.
>>>
>>>>
>>>> Signed-off-by: Philipp Stanner <phasta@kernel.org>
>>>> ---
>>>>   drivers/gpu/drm/nouveau/nouveau_fence.c | 2 +-
>>>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>>>
>>>> diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> index d5654e26d5bc..993b3dcb5db0 100644
>>>> --- a/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> +++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
>>>> @@ -88,7 +88,7 @@ nouveau_fence_context_kill(struct
>>>> nouveau_fence_chan *fctx, int error)
>>>>   
>>>>   	spin_lock_irqsave(&fctx->lock, flags);
>>>>   	list_for_each_entry_safe(fence, tmp, &fctx->pending, head)
>>>> {
>>>> -		if (error && !dma_fence_is_signaled_locked(&fence-
>>>>> base))
>>>> +		if (error && !__dma_fence_is_signaled(&fence-
>>>>> base))
>>>>   			dma_fence_set_error(&fence->base, error);
>>>>   
>>>>   		if (nouveau_fence_signal(fence))
>>>
>>
> 

