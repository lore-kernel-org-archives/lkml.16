Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970351DE894;
	Sat, 26 Apr 2025 14:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745678112; cv=none; b=qZIsR2IUGW4Rq+nRKAxpf4RgF3v171EBaXA4ljD+s2RTdt0qKxxnmFqY0OUUPj/sJX/kpKRaXGDB6DNXPYGCIWRdkIAd05leiObAsEtji7RpVcpAWQBvW9ro1NNZ1IeP/dYlvBkvow3RvxY1S8kuR5chQsH18MjW/auRNc5D7n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745678112; c=relaxed/simple;
	bh=oCb2dSqs+9IKSBblP7u70zkOwRDAybvfrg1eFn/yOJo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=LH2YbZbwwS+Bt+hJsKnfy6u2VU8DFSEWlWKl3Yb+YFzF0CjBj6UdnUWnhO2r7XbrgDD8QS2EIY4WMua/dGrGT76OkJ3Z+V6X9EOX/OG8HcXRGQ7/59U9BExTxpIaA/rE+I8G9VbYn4Enb8Br8ML0Za5dwuee5UcDnsZDWKEoPs0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EPaAUPAd; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EPaAUPAd"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-acacb8743a7so536202166b.1;
        Sat, 26 Apr 2025 07:35:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745678109; x=1746282909; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=gPlX2N5OdUdzHj/MqtkszNOL68KaUYEyIKkA0vaRGkU=;
        b=EPaAUPAd4DGoZ2TtwkSIcBdYeONUi/5h40nshPh49a2inmSDpXqcGYsMvTuM6nuC3r
         ReMNFALv1NhG7cgKSDpvGFMeI5/f9mOHbUPnPtU7I50JaRdUi6cOtfCDxdzmQXGC94yb
         XDx9p2Ad3jAAVUPlE+7ills6q7kOnZnhBOYEGz65ymJVtWYSpY1kvCSzb1VhsDzREP5g
         5Ea+UR1JSXZ3I2kgKdgvy3ejCJ48NltRo7ch79hyahaasp8fyA1wKmH3UXzMwWj5oaS/
         UI3F5IFPfvVWqM6Gc7Nsr9D7hM2y+OQr9NDTlaxehQXuMxylvOaQe0m9jFP7Q0UVHi4u
         XdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745678109; x=1746282909;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gPlX2N5OdUdzHj/MqtkszNOL68KaUYEyIKkA0vaRGkU=;
        b=McJ77zcqN+/dHKDiVudP1equa/KnRGZe/YvnRwDAHRfkEgG18LlogJAvbKEeR5V8ba
         PjmT20RxDNqFnC8Bk3RVmrE21RDPMNiGPXWDGHI5JwgP8oaSha0URoCzbuzvkW2dqEfm
         itznWIPGJSiimzTVdxTydnkPhlGbIb6f8IsSe23Jc9nY6JyrW/kFwwBSnMIm6+ReFimP
         gz95CAIvuNCbB4aXR9xwgOG5l6OchFNuF6wNyE2r6h1FtjOQ8/P7Vyu9YP3NYbs2ZTzM
         PGf311cPE/BaMcuAskWsth6mUb8WjqT6CgZS1sODY/LV0zsQzD+e/VA14OOb7HSzRag8
         1RgQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSkjLmkIwVYy34YplSS8WXYo7fLtR/Wk6YvODJW09OelpgTFk1WP4Jv72GlVMq2X4R/T6LgDxH0fGWCGK7@vger.kernel.org, AJvYcCVWrc+bm3/LV1EsSsWssfwB58pCqbzF9/hjiZyHNJjt/wrTEWUeQu6+8FbKYROkApLKaAo0J1spmlUTd9YVrNU=@vger.kernel.org, AJvYcCX4ERALHYvd+zKQzYBAt5+iiJuKUF2kym34LifHXAPsTdkbg1btPjSbJru37eodCsFQl32Q3TbuMnOF@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7Ke9q552gE3MdJ2S1l0zrjqxis1MITj1k7bw9miXGwv9GlIxd
	QfssRHkH9f8EY5EE6M198WHJ/M22GRouRmvK/BT7ANlmZO39lxG3
X-Gm-Gg: ASbGncu44K6qS+aGOku/ZXOpi4UjHFVaGsklu8ynCQtROlW4S/Nc9hj3j/jEFroXrk6
	Hg9BOJ2jMevE+TWedwvV0dt16PxScD3Cs+ERXE+SwvXUfcJlG8xQoff7sgfQL0db0ajwv5ZXGGX
	qpkEVUc+1pnBMdg+BhopN7DHpjUP5JrLTVkO0O8zZROT4YzziG23dL9M+IFM2rfx/t6UV+oJwzb
	j5Zw1B0/6YI4UeJWFFjR7fq91gnyaPpp+aTt6LffXKtYdsa9sK1nvkRVDWJrSsbX85qq+1mIMYM
	DZpx1b/95GY8/jD+srD8Y1ZMbY/TxoF+JUi9qBp83ktu6/oARkbukQ9sEYcPUYeqVtvr4oMIBpd
	TSmOIv6ZaHzeBlD1c7ayrADf/1VG2ljFJAR/mT6HbVwL2Ya5SVwIa9Mep5tiamgyJ+UmCGtep
X-Google-Smtp-Source: AGHT+IGE898MsOaWL/eqzSD2zo266ibsfP2maLjuP99Ooh1OsltZUj+SZHEbS9S6ASJdgQBt2nmxzw==
X-Received: by 2002:a17:907:1ca0:b0:acb:aa0e:514c with SMTP id a640c23a62f3a-ace7339d4b8mr570570966b.2.1745678108526;
        Sat, 26 Apr 2025 07:35:08 -0700 (PDT)
Received: from ?IPV6:2003:df:bf1b:2a00:97c2:84bd:aab8:d0be? (p200300dfbf1b2a0097c284bdaab8d0be.dip0.t-ipconnect.de. [2003:df:bf1b:2a00:97c2:84bd:aab8:d0be])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6e587f1csm298578166b.79.2025.04.26.07.35.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 07:35:08 -0700 (PDT)
Message-ID: <39798ebd-35a8-4a67-9df4-f12a6f20ef11@gmail.com>
Date: Sat, 26 Apr 2025 16:35:07 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
To: Danilo Krummrich <dakr@kernel.org>, Remo Senekowitsch <remo@buenzli.dev>
Cc: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dirk Behme
 <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
 <D9GIUOH0CKE4.3R01AYKCCG54O@buenzli.dev> <aAzrg31NB2g0X4qL@cassiopeiae>
Content-Language: de-AT-frami
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <aAzrg31NB2g0X4qL@cassiopeiae>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.25 16:19, Danilo Krummrich wrote:
> On Sat, Apr 26, 2025 at 01:08:39PM +0200, Remo Senekowitsch wrote:
>> On Sat Apr 26, 2025 at 12:15 PM CEST, Danilo Krummrich wrote:
>>> On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
>>>> On 25.04.25 17:35, Danilo Krummrich wrote:
>>>>> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
>>>>>> This abstraction is a way to force users to specify whether a property
>>>>>> is supposed to be required or not. This allows us to move error
>>>>>> logging of missing required properties into core, preventing a lot of
>>>>>> boilerplate in drivers.
>>>>>>
>>>>>> It will be used by upcoming methods for reading device properties.
>>>>>>
>>>>>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>>>>>> ---
>>>>>>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
>>>>>>  1 file changed, 57 insertions(+)
>>>>>>
>>>>>> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
>>>>>> index 28850aa3b..de31a1f56 100644
>>>>>> --- a/rust/kernel/device/property.rs
>>>>>> +++ b/rust/kernel/device/property.rs
>>>>>> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>>>>>>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>>>>>>      }
>>>>>>  }
>>>>>> +
>>>>>> +/// A helper for reading device properties.
>>>>>> +///
>>>>>> +/// Use [`Self::required`] if a missing property is considered a bug and
>>>>>> +/// [`Self::optional`] otherwise.
>>>>>> +///
>>>>>> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
>>>>>> +pub struct PropertyGuard<'fwnode, 'name, T> {
>>>>>> +    /// The result of reading the property.
>>>>>> +    inner: Result<T>,
>>>>>> +    /// The fwnode of the property, used for logging in the "required" case.
>>>>>> +    fwnode: &'fwnode FwNode,
>>>>>> +    /// The name of the property, used for logging in the "required" case.
>>>>>> +    name: &'name CStr,
>>>>>> +}
>>>>>> +
>>>>>> +impl<T> PropertyGuard<'_, '_, T> {
>>>>>> +    /// Access the property, indicating it is required.
>>>>>> +    ///
>>>>>> +    /// If the property is not present, the error is automatically logged. If a
>>>>>> +    /// missing property is not an error, use [`Self::optional`] instead.
>>>>>> +    pub fn required(self) -> Result<T> {
>>>>>> +        if self.inner.is_err() {
>>>>>> +            pr_err!(
>>>>>> +                "{}: property '{}' is missing\n",
>>>>>> +                self.fwnode.display_path(),
>>>>>> +                self.name
>>>>>> +            );
>>>>>
>>>>> Hm, we can't use the device pointer of the fwnode_handle, since it is not
>>>>> guaranteed to be valid, hence the pr_*() print...
>>>>>
>>>>> Anyways, I'm not sure we need to print here at all. If a driver wants to print
>>>>> that it is unhappy about a missing required property it can do so by itself, I
>>>>> think.
>>>>
>>>> Hmm, the driver said by using 'required' that it *is* required. So a
>>>> missing property is definitely an error here. Else it would have used
>>>> 'optional'. Which doesn't print in case the property is missing.
>>>>
>>>> If I remember correctly having 'required' and 'optional' is the result
>>>> of some discussion on Zulip. And one conclusion of that discussion was
>>>> to move checking & printing the error out of the individual drivers
>>>> into a central place to avoid this error checking & printing in each
>>>> and every driver. I think the idea is that the drivers just have to do
>>>> ...required()?; and that's it, then.
>>>
>>> Yes, I get the idea.
>>>
>>> If it'd be possible to use dev_err!() instead I wouldn't object in this specific
>>> case. But this code is used by drivers from probe(), hence printing the error
>>> without saying for which device it did occur is a bit pointless.
>>>
>>> Drivers can still decide to properly print the error if the returned Result
>>> indicates one.
>>
>> One alternative would be to store a reference count to the device in
>> `FwNode`. At that point we'd be guaranteed to have a valid reference
>> whenever we want to log something.
> 
> Yes, that would work. However, I'm not convinced that it's worth to store an
> ARef<Device> (i.e. take a device reference) in each FwNode structure *only* to
> be able to force an error print if a required device property isn't available.
> 
> Why do you think it is important to force this error print by having it in
> PropertyGuard::required() and even take an additional device reference for this
> purpose, rather than leaving it to the driver when to print a message for an
> error condition that makes it fail to probe()?


To my understanding doing the error print in "core" was proposed by
Rob [1]:

"If the property is missing and required, then we may want to print an
error msg (in the core, not every caller)"

Dirk

[1]
https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic/DS90UB954.20driver.20done.2C.20ready.20to.20upstream.3F/near/496884813


