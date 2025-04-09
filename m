Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A78BB26B2C0
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 16:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744215889; cv=none; b=tfb7WUIFu9NkIzvJmjPQez+PKVWpT/WI7mjuZMbC+u6uh+7ka+c7xy3mRXKubz8FTCzE6eB2A7DQwYV6/F27hlP2ujx6RFLnhKM+HNMLHMKNLijtDyh9hDmqGGYnGAF0JlCy2mqdzyZPxW51jIq7r2xmGHN+ACoZ9jvAldQpvoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744215889; c=relaxed/simple;
	bh=lvlXYICDJi35YqS6cjABd93tOh3oXdZkL+FPD3eVhWE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=VNzqnqWRu1tnRBD/czTZuqIBcYOd8be8vOcwGzy+mltT9nb2+DbkvjFLnUulj9P1fX2OoB80sTqnWT7NtF42kEsJ9ShvIjjUKilzd/hxTwV297mqvmjpFk6cC7uFEbwa5lufxDOMPFdkGu4X0V0mPpTtJIqCyfTi6NWpn3aqOf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ECMYXpYS; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ECMYXpYS"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-43cfa7e7f54so7074775e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 09 Apr 2025 09:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744215886; x=1744820686; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OKtecGAATRVTmYAsg19IHdqraZXP+b9x28g1m/3NA6k=;
        b=ECMYXpYSNnD5gqp1RsxWyLObqhfZlD746GxmlC9rpfhPi5oyhXU1BsleE0p03/2daP
         cNOj9IWKjqzo5oSY6l8abMcr/avbUheHJdGwotwdpb/IcZNrZQrZc7E2+kltZt+PdBzs
         GFx93c3Vlz804GSLhTER1wEt+m9Ji8T6dWLghR7mKVTIWaBoxxYDeg/qwRxpEtFoJNMX
         B4USt3UvK+Dt9iLrHhinHvTAGmGYqq4Y01EeOo/8M2BcoHczCHEWwW/pE/MwEYYXZ4j0
         Jw0d8XLcCCRQ1QDMxv53gg432jrs24BUuVjxPYvijJ7fNSaB4ujVYf8Ep/ZJdbD4yZz9
         V9eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744215886; x=1744820686;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OKtecGAATRVTmYAsg19IHdqraZXP+b9x28g1m/3NA6k=;
        b=exCtcfkSbwP7YCAlvGmDDHPh5GfQ57JvBZCghntq3I+sZURQTk26GpaQ4ml1CuNXXe
         6HC9RKQwyOHfLXsErsehOI+nSqqsGo98vKvvCFhsmy+tPmD2syX5KfH+DRGqIW3ufqp9
         RHMlwDmiDcVilFeRBwL/CSrXGbjps6BVifAkNyzA4PR03C4GssonO3pVot4vqbYE3ZxT
         q5rS38RnJxzQqpxwQCWepbKecMIjcyDvYEQfaQw7lY9cXnan5USyBRsj7i6lbI6Qx8wT
         vJIUFBaFWqNX1u+jFdscpxEVguXeXzkBiyBX6bOZBNHw4NI5zqjnDhTe3KCB1k4PRJjC
         yoow==
X-Gm-Message-State: AOJu0YwlPzTNWQPCXR8KHIQVIbsWUrVaWHlPG0UtyQXQItK7rac/P/VY
	YqoFd/mlGUfaxYIU66WbUoUIJ/m2EaEscP2FzA51FyPTicYepQXQo8r7V/016WyINaivZHLg5oG
	MOTI=
X-Gm-Gg: ASbGncv8wi0lHCCPDpL+TIG7KRa+NJywhSikodSxVon865QQ9391x5YMDugm5hDDIqo
	aqIrjzY1S98i/FKWshdghSZfWnQB4avUY0O7aqA8ASywdElkkzhZzvpUBKlPD8V6myxLf7IqCvn
	1vX3vi5hirnCY7ZzAzuCIM4P4U4iBENLj8Ix3psknKWqbQ/0C0Gl3cAxguk+0hYLLKOA+sY4oS6
	SgDjjCEELlYExiLbeFGwdBZVTJB9nQO2ixRnq5WFYyoFrY7hIVrOrBquJ5wi5WiHOtdDVrj5sdT
	ThEbDKQIv4zmlBVFzuE2tspexelGZYBKJbL1qPjp0pNSCX8sjU7dOIn5JPg=
X-Google-Smtp-Source: AGHT+IF4jICUHkAlBCxnMi5UpN9IEfyZzvyaGw6aA22YNi5e8wkLTxDKAPo44B6JeZpl9141X2izVA==
X-Received: by 2002:a05:600c:4a16:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-43f2c5d2eddmr1285985e9.9.1744215885937;
        Wed, 09 Apr 2025 09:24:45 -0700 (PDT)
Received: from [192.168.68.117] ([5.133.47.210])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-43f207aed49sm24257705e9.34.2025.04.09.09.24.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 09 Apr 2025 09:24:45 -0700 (PDT)
Message-ID: <c7acfc41-d0a5-42b6-9a73-1c298089ee8d@linaro.org>
Date: Wed, 9 Apr 2025 17:24:44 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Subject: Re: [RFC PATCH] mux: core: add exclusive mux controls support
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, dmitry.baryshkov@oss.qualcomm.com
References: <20250326154613.3735-1-srinivas.kandagatla@linaro.org>
 <95b7eaf0-2040-a25a-4c41-ab86aba82a8d@axentia.se>
 <02f09c34-09ed-486e-a8a8-23b0df718197@linaro.org>
 <dbe94425-8013-b866-9b6b-39ea499576e9@axentia.se>
Content-Language: en-US
In-Reply-To: <dbe94425-8013-b866-9b6b-39ea499576e9@axentia.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit



On 07/04/2025 14:39, Peter Rosin wrote:
> 
> 
> 2025-04-07 at 12:36, Srinivas Kandagatla wrote:
>>
>> On 03/04/2025 21:58, Peter Rosin wrote:
>>>> @@ -479,6 +487,10 @@ int mux_control_deselect(struct mux_control *mux)
>>>>    {
>>>>        int ret = 0;
>>>>    +    /* exclusive mux control do not deselection */
>>>> +    if (mux->exclusive)
>>>> +        return -EINVAL;
>>> This is unfortunate. I think there is value in being able to deselect
>>> muxes in exclusive mode. Otherwise you might need to keep track of
>>> some idle-state in the code, when it would be more flexible to have
>>> it specified in e.g. the DT node. The best idle-state may very well
>>> be hardware dependent, and is often not some central thing for the
>>> consumer driver.
>>
>> Does it mean exclusive mux can deselect a mux however its not mandatory to deslect between each mux selects?
> 
> Yes, that was what I tried to say.
> 
>>
>>>
>>>> +
>>>>        if (mux->idle_state != MUX_IDLE_AS_IS &&
>>>>            mux->idle_state != mux->cached_state)
>>>>            ret = mux_control_set(mux, mux->idle_state);
>>>> @@ -523,13 +535,15 @@ static struct mux_chip *of_find_mux_chip_by_node(struct device_node *np)
>>>>     * @mux_name: The name identifying the mux-control.
>>>>     * @state: Pointer to where the requested state is returned, or NULL when
>>>>     *         the required multiplexer states are handled by other means.
>>>> + * @get_type: Type of mux get, shared or exclusive
>>>>     *
>>>>     * Return: A pointer to the mux-control, or an ERR_PTR with a negative errno.
>>>>     */
>>>>    static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>>>> -                   unsigned int *state)
>>>> +                   unsigned int *state, enum mux_control_get_type get_type)
>>>>    {
>>>>        struct device_node *np = dev->of_node;
>>>> +    struct mux_control *mux_ctrl;
>>>>        struct of_phandle_args args;
>>>>        struct mux_chip *mux_chip;
>>>>        unsigned int controller;
>>>> @@ -606,7 +620,25 @@ static struct mux_control *mux_get(struct device *dev, const char *mux_name,
>>>>            return ERR_PTR(-EINVAL);
>>>>        }
>>>>    -    return &mux_chip->mux[controller];
>>>> +    mux_ctrl = &mux_chip->mux[controller];
>>>> +
>>>> +    if (mux_ctrl->exclusive) {
>>>> +        mux_ctrl = ERR_PTR(-EPERM);
>>>> +        put_device(&mux_chip->dev);
>>>> +        return mux_ctrl;
>>>> +    }
>>>> +
>>>> +    if (get_type == EXCLUSIVE_GET && mux_ctrl->open_count) {
>>>> +        mux_ctrl = ERR_PTR(-EBUSY);
>>>> +        put_device(&mux_chip->dev);
>>>> +        return mux_ctrl;
>>>> +    }
>>>> +
>>>> +    mux_ctrl->open_count++;
>>>> +    if (get_type == EXCLUSIVE_GET)
>>>> +        mux_ctrl->exclusive = true;
>>>> +
>>>> +    return mux_ctrl;
>>> This is racy with no guarantee that you are the only consumer after you
>>
>> Yes, there is a chance of race here. locking around mux_chip access should help fix this race.
> 
> Yes, some locking is indeed needed.
> 
>>> have gotten an exclusive mux. My sketchy vision was to have an API
>>> function that requests an ordinary shared mux to be exclusive, and then
>>> another to make the mux shared again. Those would take/release the same
>>
>> hm,  dynamically going between shared to exclusive is going bring more challenges and consumer side its going to be more complicated.
> 
> It is not important to be able to toggle between shared and exclusive.
> So, if that's difficult, don't do it. But if it somehow makes the
> implementation neater, it's certainly a possibility.
> 
>>
>> My idea to do this way was to allow more flags like optional to mux, in same likes  regulators or resets.. etc.
> 
> Yes, there are uses for optional muxes.
I will try to add these flags in v2.

> 
>>> lock as when selecting/deselecting, but also mark the mux as exclusive
>>> and trigger_not_  taking/releasing the lock in select/deselect.
>>>
>>> But then we have the little thing that conditional locking is not
>>> exactly ideal. Which is why I haven't done this before. I simply never
>>> got it to a point where I felt it was good enough...
>>>
>>> Another reason for me not having done it is that I also feel that it
>>> might not be ideal to reuse mux_control_select and mux_control_deselect
>>> at all since the rules for using those when the mux is shared are ...
>>> a bit difficult, and will remain that way. Thus, having those functions
>>> *sometimes*  behave like they are easy and sometimes requiring great
>>> detail will make the already bad shared case even more error prone.
>>>
>>> I wish I could see how to do this sanely.
>>
>> How about going with current approach with locking as suggested?
> 
> There needs to be operations to
> - acquire an exclusive mux
> - set the state of an exclusive mux
> - return an exclusive mux to its idle state
> - release an exclusive mux

> 
> Only adding the locking to kill races in acquire/release will still
> have the problem with reusing the same API for setting the state of
> an exclusive mux and selecting a state from a shared mux. And as I
> said, I think it's bad to try to keep those seemingly similar ops
> as the same APIs. I think it would be better to add mux_control_set()
> and mux_control_unset() APIs (naming?) and have those error out if
> tried with a shared mux. In the same vein, mux_control_select() and
> mux_control_deselect() should error out if tried with an exclusive
> mux.

Yes, having dedicated apis can make it bit more explicit to the consumer 
side.
I will try that in v2.

thanks,
Srini
> 
> Cheers,
> Peter
