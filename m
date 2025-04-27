Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87E732701C4;
	Sun, 27 Apr 2025 06:12:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745734324; cv=none; b=F+FfAVPolBeG6BakC3sr23gsux12xOIW4HpBRKl9/6WkQVQ+yyR/jPENmie3vOY36bTXJ3IuuInh+cizOaWbg6dGYXPI/evYucXpHvq04b74YF1bAJZRlJrT9IEqwmTlR4XU3xWTWYESS7DW0SMUo0/NPd9CA0b3o7/QgQf+e1c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745734324; c=relaxed/simple;
	bh=VJ4RUcTICTDuJcHkp0gBNaKOqNGjOfhieOfq27t17C8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Y57SUaO/2T2k02bD9PYI/tINeXx1Bcg29bP5Bgubf7NLJ6JBFiuUBO8K4gCEWodo/27zNck3uFgqtTbuv3TgDH4GyzG+KhJNi0V4LxNIvXIMf9vocORgt3QmtPXqYNNw/mIH6ikJmdIcuHn3X6z2A4Z/+7rLWX7KAjeTVXZbaOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXcMuJKp; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXcMuJKp"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-ac25d2b2354so530741466b.1;
        Sat, 26 Apr 2025 23:12:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745734321; x=1746339121; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=LO4JXf5cTqs00UnHvgohh5WutNknkaGRKbNuNR6fpi8=;
        b=iXcMuJKpYBJ06P/QYht7unLWqNX9UjflDbMboMACuPgWu4xn9cwMYqFli3KMHaahjd
         pJs8U807aO81fJFCez5NsP9qcw4F+e8JB6owkJbCHUEPpc/bioYJ9Lbaygh9PgPVjxeF
         w0LVy9ARIEosP+0Cc8j2XnL93O5ZwSgCbuWMASN0IET7DfnvnCm0NoT2Xrw2zZFbcPq+
         UqZeNUMq0cVGE2eLVd9S3uIJLO/QW0kM7XQmgxLau+BOjKHcHZrgDagbMGMIhs4iPSyc
         71bM7XRjstQYgkVMGmXQA/QBxfJg0yxPWqdBW3mrnOlHgVsZB/drUBs/JkNppQinxHse
         Lzpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745734321; x=1746339121;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=LO4JXf5cTqs00UnHvgohh5WutNknkaGRKbNuNR6fpi8=;
        b=reD3YjIWaFXngCk21zgSlcrKfNW5rUjuL6ThfIB4RzPhGDoz1/gd8FRQEo1FxakAcY
         RNYknSN9VaEI0hHC3A60HxWThBNbFPGB8cBQYsHrJaXU75UvpHtf6nIJ0/8Uvo3Tq8IF
         eMDXkUjl3WDemhQo2QmxxWV5Z+K8XpQtY0H95QWFsMqlbkbA6N8qjdXSkrrXzmUvZwO3
         aWb5+7QectkcAys2elVQ7PX5W4Uon2MLe2QJxyw5Cpd05P2+SbucOJzE3liFSD6CaFez
         oGlA8cdb6VAcizTzqFBcvXaMXY7A+E3g+qWZ+oUuLhCFBTiNTaM5VxjKSd3O1lX05V1y
         NVFw==
X-Forwarded-Encrypted: i=1; AJvYcCUBi4mYcHeurG3ky0IoXsg6lGOAt09/eVYTVsG21wSQbE1filnxUuRENciPUV0sW6y06ikDhhMa4AY4@vger.kernel.org, AJvYcCVo0qRTKaNP2AI0r5CL7WP0NtKKsQzF+zUjMvyEta0oSbHKjZsbJlWab0BS7Q7w2xncwoTL3j/ZRGg80LuQ@vger.kernel.org, AJvYcCXbehyquC6ne9eKplezVkf671zaPUnpARikFl7rv+rv0MgKieKpBTIr1nRh+5kxC27VwrM37h9kh2iASdivGuc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy2wCDDVQ5sPdu8NQ68dcJlA/bvBfj/fCGxItxRYQ2oIpWM9Da
	10x/C2HRwMBQsTjkPJ65jCg4pSj1gmPguRVCK8AsrJYMoZqV7ADH
X-Gm-Gg: ASbGncvwfKdyJfgxub2DLlSv+ZsSh+lI74Si8mxEm8i0jNDstJakbN1oR4fy+CDDFfq
	QYofbM72ysE9YIPqFOWxDHKTcW83WYBTEzLpy+yOdw/bPqvUDENCSMNnzXEIeO0Nnh1Y6DZAOQ+
	PFVPjQrsxe2z1n6mQ2GqMy/mfxohqCzp7PUipE9KNY9Gpvhz1090Utyc4jNnHugLn4gpX8E8SN7
	t1xIIkejCXXfPCXbqcp1KzwV1U9hE3FPM8C3fcSJ2rEqeXLVpHYOa9v7oigxPPiAGNn8QGet8Yf
	sdOCLjwlz8qV7R+Xo9Cb3Xv67krydxTgLZ8o2hydRCJw8Led5enMN6Zlxw0nLuFKyQAMJ+qaDPe
	C8+kotlNgZHlNXdmZ+9gyIS8PkpwXm5H693Dc0e1Lpr8wDTcKUQbdPtMgBfviVu0LCqAIew==
X-Google-Smtp-Source: AGHT+IEfzv9CpQxDVb63vmsJ/XP4VJEPtd3lrJMA6/PsG+Frtp5xYHxxKh7hfaMm8xOM14z5aqiI0g==
X-Received: by 2002:a17:907:6ea2:b0:acb:ba0f:4b12 with SMTP id a640c23a62f3a-ace7119b1bbmr755049566b.36.1745734320530;
        Sat, 26 Apr 2025 23:12:00 -0700 (PDT)
Received: from ?IPV6:2003:df:bf1b:2a00:551b:171a:3f0:64b3? (p200300dfbf1b2a00551b171a03f064b3.dip0.t-ipconnect.de. [2003:df:bf1b:2a00:551b:171a:3f0:64b3])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ed65410sm389896466b.126.2025.04.26.23.11.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 26 Apr 2025 23:12:00 -0700 (PDT)
Message-ID: <0756503c-02e7-477a-9e89-e7d4881c8ce6@gmail.com>
Date: Sun, 27 Apr 2025 08:11:58 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/7] rust: property: Introduce PropertyGuard
To: Danilo Krummrich <dakr@kernel.org>
Cc: Remo Senekowitsch <remo@buenzli.dev>, Rob Herring <robh@kernel.org>,
 Saravana Kannan <saravanak@google.com>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Dirk Behme
 <dirk.behme@de.bosch.com>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250425150130.13917-1-remo@buenzli.dev>
 <20250425150130.13917-4-remo@buenzli.dev> <aAuryiI0lY4qYyIt@pollux>
 <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com> <aAyyR5LyhmGVNQpm@pollux>
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <aAyyR5LyhmGVNQpm@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 26.04.25 12:15, Danilo Krummrich wrote:
> On Sat, Apr 26, 2025 at 08:19:09AM +0200, Dirk Behme wrote:
>> On 25.04.25 17:35, Danilo Krummrich wrote:
>>> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
>>>> This abstraction is a way to force users to specify whether a property
>>>> is supposed to be required or not. This allows us to move error
>>>> logging of missing required properties into core, preventing a lot of
>>>> boilerplate in drivers.
>>>>
>>>> It will be used by upcoming methods for reading device properties.
>>>>
>>>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>>>> ---
>>>>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
>>>>  1 file changed, 57 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
>>>> index 28850aa3b..de31a1f56 100644
>>>> --- a/rust/kernel/device/property.rs
>>>> +++ b/rust/kernel/device/property.rs
>>>> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>>>>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>>>>      }
>>>>  }
>>>> +
>>>> +/// A helper for reading device properties.
>>>> +///
>>>> +/// Use [`Self::required`] if a missing property is considered a bug and
>>>> +/// [`Self::optional`] otherwise.
>>>> +///
>>>> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
>>>> +pub struct PropertyGuard<'fwnode, 'name, T> {
>>>> +    /// The result of reading the property.
>>>> +    inner: Result<T>,
>>>> +    /// The fwnode of the property, used for logging in the "required" case.
>>>> +    fwnode: &'fwnode FwNode,
>>>> +    /// The name of the property, used for logging in the "required" case.
>>>> +    name: &'name CStr,
>>>> +}
>>>> +
>>>> +impl<T> PropertyGuard<'_, '_, T> {
>>>> +    /// Access the property, indicating it is required.
>>>> +    ///
>>>> +    /// If the property is not present, the error is automatically logged. If a
>>>> +    /// missing property is not an error, use [`Self::optional`] instead.
>>>> +    pub fn required(self) -> Result<T> {
>>>> +        if self.inner.is_err() {
>>>> +            pr_err!(
>>>> +                "{}: property '{}' is missing\n",
>>>> +                self.fwnode.display_path(),
>>>> +                self.name
>>>> +            );
>>>
>>> Hm, we can't use the device pointer of the fwnode_handle, since it is not
>>> guaranteed to be valid, hence the pr_*() print...
>>>
>>> Anyways, I'm not sure we need to print here at all. If a driver wants to print
>>> that it is unhappy about a missing required property it can do so by itself, I
>>> think.
>>
>> Hmm, the driver said by using 'required' that it *is* required. So a
>> missing property is definitely an error here. Else it would have used
>> 'optional'. Which doesn't print in case the property is missing.
>>
>> If I remember correctly having 'required' and 'optional' is the result
>> of some discussion on Zulip. And one conclusion of that discussion was
>> to move checking & printing the error out of the individual drivers
>> into a central place to avoid this error checking & printing in each
>> and every driver. I think the idea is that the drivers just have to do
>> ...required()?; and that's it, then.
> 
> Yes, I get the idea.
> 
> If it'd be possible to use dev_err!() instead I wouldn't object in this specific
> case. But this code is used by drivers from probe(), hence printing the error
> without saying for which device it did occur is a bit pointless.

Thinking a little about this, yes, we don't know the device here. But:
Does the device matter here? There is nothing wrong with the (unknown)
device, no? What is wrong here is the firmware (node). It misses
something. And this is exactly what the message tells: "There is an
error due to the missing node 'name' in 'path', please fix it". That
should be sufficient to identify the firmware/device tree description
and fix it.

I can still follow Rob's proposal on doing the printing in 'core' :)

Thanks,

Dirk

