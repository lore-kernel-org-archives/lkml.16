Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9889B246326
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 16:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745945798; cv=none; b=VrDx+Jz7wdZKLBHWTffRRATC65FxXDxKsf2bEHoEWA6JtOTDwO0WAQPCIJRhaom4SdwSR3CoK0MRNZ4hC82QLdaEY1Qjkkidf4sARgPeVbC1aA5zhUwGodDLINf1sbyHOXnLGMRKkzIVTVL5spCn2aB79EhTcIzHf9dFYBcH1H4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745945798; c=relaxed/simple;
	bh=Z8jzSEAAEsdF/rnNezAVGGYhRnmDx8SeNUM7WSzLjLA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=X4ouBoKVUxvrFxLrNi+599ff8NEDE6qiLoG7n+6iC72KEWAQF5Tp4Cl8p582Nh6nDKV3M43PjljYOxEbS4IEEsDhtaGjAOSZw9pq//2byjXqEf1S8ggL4wQ1FsNUYxmiSJehKNgFTczkWwL1XpEEIH+nBC/nyYVD+PJCLYl6wLE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org; spf=fail smtp.mailfrom=beagleboard.org; dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b=eqYb6dts; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=beagleboard.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=beagleboard-org.20230601.gappssmtp.com header.i=@beagleboard-org.20230601.gappssmtp.com header.b="eqYb6dts"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-30155bbbed9so5110433a91.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1745945796; x=1746550596; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7Alb5XzkHBLEmo9P8d8nkOyHgjfhkLtR/Mnz4LZQol8=;
        b=eqYb6dtscZWnrV/yMGwuwRW3mQCwI/ouR3cOhxaO8r6BUlKkvv2Y4T+hfELcRhZDaV
         D70RVCmpCNpJu7EyksPIIZdPbgCVoEXh5knX8XJT/UYr/uZ8DAVL1ljBB3/NdnS13dcr
         SfQxDoD9x+TMYhNYu78pSR1B153hanTDYsWjnycTEuJ3iNO7q3jyR2XcwV4BW7Lbz13n
         uiAmNSA/wOQlE3t5J9I0N6xmhCvE4zSm4l+ZSUG2lzptmvwMWu6NeMe9Qezc+Y9+P0ai
         UoK0C384c2+m6gYAjkRWuWI8hMWksaYXofLPEPF9dgwnbvzCLohxpoiXYqnuvLMAJqYG
         XqqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745945796; x=1746550596;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7Alb5XzkHBLEmo9P8d8nkOyHgjfhkLtR/Mnz4LZQol8=;
        b=FfY3Af876qNTPfOcPq0aEwWg3dJtaFdvS0oahHX2Nmjz7B4GVOpnN8mpBua++HXxdx
         Q52ZO5V/3roFJNMvy80apn6tgniumBHdqfThnnS4d3h3kliz9nlaNj9Jkjm/isk5l6Dm
         udrp5ito3NtsmiadSwFpB8xxvFauoazvVo9jU9OlRfDz9EhkyS8g4D0cDGfTQutG56VO
         pwFwLvA+0FdHrofK4lDOvldB4S0afbVNcVpT8ShFr36iV6hpxqi8kbXSu9sJ8NKXj/zc
         lHg67g1+CW1L8AfTABhroReAlMp59Xky5LeHUgGCEpY4ZGlSejjPw0ZR1i4B+whbaKIY
         1WVA==
X-Forwarded-Encrypted: i=1; AJvYcCVFmpLLhP/gyEYH5dLcIWC+BAgEoaHWpyscyOa/v+siaoJ7LYD4LFclPvwvKi3c66TShMKDSGW5lE8pBVU=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5C+2JnIDMCpUVPBjBanE2hmViUZVT547/QZdSv3dQ9QmjoZ/
	q/fCUqhRo1055DcVcGA0xNHB+MOm1Noxrq+DZd05Ot1/plGfhawE3Erkp6+qQQ==
X-Gm-Gg: ASbGncvPICdD6zU070A0QGMIxOI9IeRWiUhhyxKOBCwOo0uF4cArp/N0Ev5rO9HaAjO
	0DR6USRSkRL7nWQwXHohxgQ3K8OyYQogP8k7WZR7EZZeN3DDPlVYFju/Bzyymy3VJaf8I7ebnBX
	5Z8KZal5F6ooGfC5tdAEsXNpFjvKj4pNUuQK/8qlZ53pVp/vOITZGu3MI3TR6oevEgnwyTaM8cy
	/g9eCemvWDcTvDvW2z+gfuucEJpLg64bkXf86d6Q8IADFJTzEe6f+Xm94e8Vn/o+QEOK6aCbYr8
	98bxhBnL5FG0vLdMOj0/NuisCs8AUqEQhxkkHLCR0+EHMW0=
X-Google-Smtp-Source: AGHT+IEBA1qLYaYtZQHyo31ojNkFPVQdkO+8Yo5EYwpmV6szkHpz3uYQnCTIH2KHcRzw87iCqQsfeA==
X-Received: by 2002:a17:90b:58f0:b0:2fe:a8b1:7d8 with SMTP id 98e67ed59e1d1-30a22139fdcmr5796812a91.25.1745945795740;
        Tue, 29 Apr 2025 09:56:35 -0700 (PDT)
Received: from [172.16.116.85] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309f782cd54sm9557520a91.35.2025.04.29.09.56.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 29 Apr 2025 09:56:35 -0700 (PDT)
Message-ID: <fa831c54-1998-4cea-95fd-e6ced90974e2@beagleboard.org>
Date: Tue, 29 Apr 2025 22:26:17 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: kernel: device: Add
 devm_of_platform_populate/depopulate
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
 Jason Kridner <jkridner@beagleboard.org>,
 Deepak Khatri <lorforlinux@beagleboard.org>,
 Robert Nelson <robertcnelson@beagleboard.org>, Dhruva Gole <d-gole@ti.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 Herve Codina <herve.codina@bootlin.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>
References: <20250429-rust-of-populate-v2-1-0ad329d121c5@beagleboard.org>
 <aBDi2LE3O1rIsGqn@pollux> <2025042904-trade-leverage-0f98@gregkh>
 <aBDl5oRIRpwbPrC1@pollux> <2025042945-aviator-subzero-0263@gregkh>
 <1fda026e-9ec5-46f6-84e8-4111263350ff@beagleboard.org>
 <2025042956-yelling-magnifier-5778@gregkh>
Content-Language: en-US
From: Ayush Singh <ayush@beagleboard.org>
In-Reply-To: <2025042956-yelling-magnifier-5778@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 4/29/25 22:09, Greg Kroah-Hartman wrote:

> On Tue, Apr 29, 2025 at 09:37:04PM +0530, Ayush Singh wrote:
>> On 4/29/25 20:27, Greg Kroah-Hartman wrote:
>>
>>> On Tue, Apr 29, 2025 at 04:44:54PM +0200, Danilo Krummrich wrote:
>>>> On Tue, Apr 29, 2025 at 04:37:49PM +0200, Greg Kroah-Hartman wrote:
>>>>> On Tue, Apr 29, 2025 at 04:31:52PM +0200, Danilo Krummrich wrote:
>>>>>> On Tue, Apr 29, 2025 at 05:09:26PM +0530, Ayush Singh wrote:
>>>>>>> +    /// Remove devices populated from device tree
>>>>>>> +    pub fn devm_of_platform_depopulate(&self) {
>>>>>>> +        // SAFETY: self is valid bound Device reference
>>>>>>> +        unsafe { bindings::devm_of_platform_depopulate(self.as_raw()) }
>>>>>>> +    }
>>>>>>> +}
>>>>>> One additional question regarding devm_of_platform_depopulate(). This function
>>>>>> is only used once throughout the whole kernel (in [1]), and at a first glance
>>>>>> the usage there seems unnecessary.
>>>>>>
>>>>>> In your upcoming driver you call devm_of_platform_depopulate() from a fallible
>>>>>> path [2].
>>>>>>
>>>>>> So, I think we should change devm_of_platform_depopulate() to return an error
>>>>>> instead of WARN(ret).
>>>>>>
>>>>>> If [1] needs it for some subtle reason I don't see, then I think we can still
>>>>>> call it from there as
>>>>>>
>>>>>> 	WARN(devm_of_platform_depopulate())
>>>>>>
>>>>>> [1] https://elixir.bootlin.com/linux/v6.15-rc4/source/drivers/soc/ti/pruss.c#L558
>>>>>> [2] https://github.com/Ayush1325/linux/commit/cdb1322b7166532445c54b601ad0a252866e574d#diff-7b9e3179e36732d5f3a681034d70c2fda4ff57745c79ad4a656f328c91e54b77R71
>>>>> Ugh, no, we should just delete this function entirely if only one driver
>>>>> is using it.  That implies it's not really needed at all.
>>>> Ayush's driver calls {de}populate() from a sysfs store path [2]; not sure what
>>>> it's doing semantically or if this is a valid use-case though.
>>> That's going to be rough, and full of tricky corner-cases and probably
>>> shouldn't be doing that at all :)
>>>
>>> So let's hold off on this entirely until we see a real user that can
>>> actually pass review.  Trying to do system configuration like this in
>>> sysfs is a much larger discussion than just adding rust bindings.
>>>
>>> (hint, configfs is for system configuration, not sysfs...)
>>>
>>> Anyway, worst case, you just "open code" the single function call that
>>> this one binding was trying to "wrap".  which is what I think the
>>> in-kernel user should be doing now.
>>>
>>> thanks,
>>>
>>> greg k-h
>>
>> Well, I don't really want to convert this discussion to addon board
>> connector setup discussions. So I will try to keep things as short as
>> possible here while linking to all the other discussions for the same.
>>
>> For starters, what the driver does is as follows:
>>
>> 1. Provide 3 sysfs entries:
>>
>>      - New cape: Can write the name of the cape (I have not settled on the
>> naming convention yet). This name is then used to load appropriate overlay
>> from `/lib/firmware/` and populate all the devices. The overlay is applied
>> to the connector node. Only one cape overlay can be used at a time.
>>
>>      - Current cape: Just a ro entry to get the name of any active cape.
>>
>>      - Delete cape: Remove cape overlay and registered devices.
> That's great, but I don't think that's what sysfs is good for, we can
> discuss that later when you submit your driver for review.
>
> Again, look at configfs please, that's for "configuring" things.  sysfs
> is for basic device properties and some tunables, but is NOT a major api
> interface that requires a lot of logic like loading an overlay would
> require.
>
> Also, circumventing the "normal" device tree overlay interface and
> discussion isn't ok either, this needs to work for all types of devices,
> not just for "capes" like you have here.  To accept something like this
> would be going around all of those other maintainers with their strong
> views of how things should be done.

Umm, can you please explain how exactly I am circumventing "normal" 
devicetree overlay interface and discussion here. If I submit spec or 
devicetree compiler changes, nobody responds. And when I submit the full 
driver, it ends up with it not being the way upstream wants. And I have 
not seen any of Herve and Luca's subsystem specific patches for addon 
board + connector setups accepted yet. So if there is a place where I 
can discuss things regarding the addon board + connector setup more 
before writing full implementations, I would really love that.

I have added Herve and Luca here as well, if they want to add something.

> Anyway, we can discuss that when you submit your code for review, but
> for now, I don't want to take this binding either as I think the whole
> function should just be removed from the kernel anyway :)
>
> thanks,
>
> greg k-h


Best Regards,

Ayush Singh

