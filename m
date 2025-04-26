Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09DCD6FC3;
	Sat, 26 Apr 2025 06:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745648354; cv=none; b=Rxwu2VmR4Cd61m5MUI3/GjrlfXrVUwfv/Sce04lZ1ADjIOipX0BEG+lHc45bjhDfCQTA1CTg8l+JSY45Q6Y3JsoGuwwGsLjYCDMis6OWX+IphcwQ1nj9DVN/w1VG6eLJEHLxXYj3VB3j8gBpTm2qyyas3Jb/7N/5vHnurzk42tA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745648354; c=relaxed/simple;
	bh=47y55eULUUMXzsCPW/k4dtSXTrQ0Nu5elYVfvbFIG9g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AxE43clceU17H0p7xEH8IY8yLoDSpM2GZpsz1DDH2c0Z9iiUlY4+2ttZYWE/lKzZSSVj8x81vjDA/PIGaMykCGPzKfpL1fv4ZPkWhW95Jq+8FzSTsy67oiEjyC9UtjnRnyVO46KdxJkVQDhoIAIsBLAW29v0HZ+F5QF7BRg1l6k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CR0fMQA1; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CR0fMQA1"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5e8274a74so4696760a12.1;
        Fri, 25 Apr 2025 23:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745648351; x=1746253151; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+Br3YH6cLdLN1sKiBpDMu8RvQJZYLmO1CX2BswDBUQg=;
        b=CR0fMQA1zHflqdCaQp5Dr2KDYlpVH/3T/s9MbkB/sHYYmV7D4/N18u5LxC2TBm9IhZ
         1BHAe6F7tVZ42Fd5aknVRjcgNu522LYyv0tV/+Ju4Dahd/D6wgZCfKf2K1M0yF9XaYQ2
         OQ98MC43s0la/Czg+gV0ZlWPkmZFYkEsIpMRVqrG7nLe7Kbw1dDA5Yjz2ZdxtHa4oKaA
         3tfJrcNFPdr1IyomsZQKpIRIOodvo1foTv3ObF3sdcuVd4v7j5CgXbmNxr6AXVl0wQYa
         TXY4F9Jnr6MpH32ak9bxZZ3UaWciF7qsBXfgQkBqTCBQDLCjRXVJbJf3ciGZIRUTTSYQ
         OZVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745648351; x=1746253151;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+Br3YH6cLdLN1sKiBpDMu8RvQJZYLmO1CX2BswDBUQg=;
        b=qpeYg3deQn5em0pXMNPyeqbmfCazjk5K/RHc3YjDFoPlAvCDXH4b6UPoLDGTU2Wtn4
         GH8U5RtvkUdUmtd7GG0JIfR9tC1b5pFCJhzbnRIsea44yShpYc3ZAME58KHuL4DL6ALg
         W5LnQmrSYnHtYqIZDAIB5eLa1THtSoQgUkhp+f5OKLirfQNryCUy7zOdmmMqlwsuqygK
         evd7klUIXOFMKv2D82TGHppRKYZ53ttllW7BuQdQ1X7i9znQ2i6aaNtLhMH0ifc50Z+T
         qjvH5sy6GTHkLa2FL9yd5A0r+kr52JMddo+SKlTjIgDNJFTZu5u7rYZBw0ebD3wdK8IQ
         A7Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWDM5S3O4RAA1XSvGV83u8KdorsZYKDAfEICa/XCzCOXj40SKnMrQN35NEwcvvxVWD1jFEBPtEw7iU5HNuiWzo=@vger.kernel.org, AJvYcCWSvAbKjSOEnNl0TmUrbP7W31dpBcu/7NFBLTKDDzAGfLxIVUsZXz3IqhTV5E0PtHq1gv0rafYGi0B0o6fq@vger.kernel.org, AJvYcCXnVMp/Kek1l9Z2ARM7aqet9O/4qdJ6GGaDAiU0/+ErUL2iyfifza12+QFd98pAM/BXDZcRxcDhLk+a@vger.kernel.org
X-Gm-Message-State: AOJu0YywvWxSuaBPIOv8zWFo42iVDuWDCpQPWuwbN0YnLoxwNMlU9XBV
	aEqshhOP8SqDwwyO9OcLKd4o8Bjn4CtATAcEhXhQe9aF5GOSXAv6
X-Gm-Gg: ASbGncvD9fotRp0ED6wXpChRrVYJJV+WKwB3aWk222VpyNAolcGCfkmYXuJOOjWN8Jw
	6JD03CkII4YP0PqJ+Ojy1PgwCPaKoFtvwUew8wTfHt/eLX2xdBGf8PCtlYsagmVCMYkdPht8Rfr
	OFqqqPSrW0v/XV5Wvz4sSpD3LQJajdm6gsMYiLlnWlfWLuJt+r0aSmpBoeKBdzZpHC3w6uyr+62
	Tngbqgv3p/j8T8XqkBVN8bvjLvodGoBpCpo1/qHEgBzKaroVHQij4KlK47hvgd6yAem1FX7m2Nh
	yW3rCcBPqC9riszvns7RggxRBanq2OT9n0tAmxHt/6rrLUuyGkaTIi2Tmi0vOMj0OJphr40b8jT
	WFPzeERpRd9RYnN/Y47gmiu17avm9GR0XgjgP/bi4HAOvDBOVnDLwUVqw9MF6eW8qO8ceKiDL
X-Google-Smtp-Source: AGHT+IEMJnBe+oBa8ODaJOrgUUbGTyHLCFX+TTHI3yr4AHxu1Fua49wfN4YGTvCEMBnwFnabJ06vOw==
X-Received: by 2002:a17:907:1b13:b0:aca:e1ea:c5fc with SMTP id a640c23a62f3a-ace84938b9emr128372166b.26.1745648350924;
        Fri, 25 Apr 2025 23:19:10 -0700 (PDT)
Received: from ?IPV6:2003:df:bf1b:2a00:97c2:84bd:aab8:d0be? (p200300dfbf1b2a0097c284bdaab8d0be.dip0.t-ipconnect.de. [2003:df:bf1b:2a00:97c2:84bd:aab8:d0be])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5f701400570sm2274951a12.29.2025.04.25.23.19.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 23:19:10 -0700 (PDT)
Message-ID: <81a65d89-b3e1-4a52-b385-6c8544c76dd2@gmail.com>
Date: Sat, 26 Apr 2025 08:19:09 +0200
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
Content-Language: de-AT-frami, en-US
From: Dirk Behme <dirk.behme@gmail.com>
In-Reply-To: <aAuryiI0lY4qYyIt@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 25.04.25 17:35, Danilo Krummrich wrote:
> On Fri, Apr 25, 2025 at 05:01:26PM +0200, Remo Senekowitsch wrote:
>> This abstraction is a way to force users to specify whether a property
>> is supposed to be required or not. This allows us to move error
>> logging of missing required properties into core, preventing a lot of
>> boilerplate in drivers.
>>
>> It will be used by upcoming methods for reading device properties.
>>
>> Signed-off-by: Remo Senekowitsch <remo@buenzli.dev>
>> ---
>>  rust/kernel/device/property.rs | 57 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 57 insertions(+)
>>
>> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
>> index 28850aa3b..de31a1f56 100644
>> --- a/rust/kernel/device/property.rs
>> +++ b/rust/kernel/device/property.rs
>> @@ -146,3 +146,60 @@ unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
>>          unsafe { bindings::fwnode_handle_put(obj.cast().as_ptr()) }
>>      }
>>  }
>> +
>> +/// A helper for reading device properties.
>> +///
>> +/// Use [`Self::required`] if a missing property is considered a bug and
>> +/// [`Self::optional`] otherwise.
>> +///
>> +/// For convenience, [`Self::or`] and [`Self::or_default`] are provided.
>> +pub struct PropertyGuard<'fwnode, 'name, T> {
>> +    /// The result of reading the property.
>> +    inner: Result<T>,
>> +    /// The fwnode of the property, used for logging in the "required" case.
>> +    fwnode: &'fwnode FwNode,
>> +    /// The name of the property, used for logging in the "required" case.
>> +    name: &'name CStr,
>> +}
>> +
>> +impl<T> PropertyGuard<'_, '_, T> {
>> +    /// Access the property, indicating it is required.
>> +    ///
>> +    /// If the property is not present, the error is automatically logged. If a
>> +    /// missing property is not an error, use [`Self::optional`] instead.
>> +    pub fn required(self) -> Result<T> {
>> +        if self.inner.is_err() {
>> +            pr_err!(
>> +                "{}: property '{}' is missing\n",
>> +                self.fwnode.display_path(),
>> +                self.name
>> +            );
> 
> Hm, we can't use the device pointer of the fwnode_handle, since it is not
> guaranteed to be valid, hence the pr_*() print...
> 
> Anyways, I'm not sure we need to print here at all. If a driver wants to print
> that it is unhappy about a missing required property it can do so by itself, I
> think.

Hmm, the driver said by using 'required' that it *is* required. So a
missing property is definitely an error here. Else it would have used
'optional'. Which doesn't print in case the property is missing.

If I remember correctly having 'required' and 'optional' is the result
of some discussion on Zulip. And one conclusion of that discussion was
to move checking & printing the error out of the individual drivers
into a central place to avoid this error checking & printing in each
and every driver. I think the idea is that the drivers just have to do
...required()?; and that's it, then.

Best regards

Dirk

