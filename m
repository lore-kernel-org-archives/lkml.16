Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECA89AD51;
	Thu, 15 May 2025 17:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747329430; cv=none; b=JyLEtEnLFNeBnQEpKQa+nDQUAzpnQLC2KeoDxWq8HyXFVdcE3uEf8xERRK7F5r6rZXmrWAwVnOdZXTeGZljl7M0BtIJWGxiBUnWkWnsSMPOBj/hjjF6xnMEzgZktRmE9ZFqxx5PpaMDuaW7ZgKt5vJ0D4ongLEPhKRz9sNI3RfA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747329430; c=relaxed/simple;
	bh=YIej14svbynVNJ7oV8uJDQT+RCz/8iduQcehqThmXLg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IGkMJjMHJwm8JWThzAWJJpOKoUFYYp2TgESgaT/JolubhoRrE+32bV3koBOFFaSiiuhQB+lqDX4D1+fKl/GmInF71G2ryI7GVDKK3bNLCEpsZ7l3mUjE7r/uMt4uHR+ySzJ6wthb2ufd+6ge0huX6h0aHyFQ9TimzFl6wgqXaGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=THU64+Xk; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="THU64+Xk"
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-ad23c20f977so166465866b.2;
        Thu, 15 May 2025 10:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747329427; x=1747934227; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=N/fwEcu64Y1kuqYfRsZYEnm9+ArZFqH26eYEtd1UgQY=;
        b=THU64+XkHPxaDowNZmDd9rojfJT4GyWvgMIGbCA0UKEc3ln56/yZOMbw7XynCvf/C3
         oE2bW1CUvALpIKAvrT4NzW0WVIzByl26W7qBH5291ZyksR76r2g3IWok9CmA4TBG6nTX
         iGdEUmJOGE0UGBZ+ZhAjBKzskGn7aLN5UZLeGuxWB+7bLq5rmQ2Uj8gv+PY/W1jHOJKE
         +fMFBsXAz2koypdEe67qFBjv/mk5dZ8KmB6TjkJxn/ELYUA077mSL69vg+Nt+rE4RybM
         /A9wuQbUhllCR2nKB41a9EZ5+oPW4MJ6/ao75H2bDebw6NniJVzajdpxeM6ZCmxRTCDF
         I1QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747329427; x=1747934227;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=N/fwEcu64Y1kuqYfRsZYEnm9+ArZFqH26eYEtd1UgQY=;
        b=HR7M/+EVdAAh5vdK4zMJ4FHwuuz1Fcff1M9P5mrPO6KkfZTfn3tymy7jpWaeR3F0Xu
         RTgmaSfYgjdII0U70AOmu2w2+ncc5FBEhjUq/WRS1thDzik7Wamomp7ilQ6MifF465Ml
         hGZXA1ZSNA6l8xJ2DUNR6SoBAYP1TelgCqvHzPLfDR5GyOqoOfdaqolQ6rDcHehZyVHG
         eaqCuMCCB1HWx1pM52OLoavayOSxO6afPRuF/0zEYVYeRoCKfzHZflZD9TXn2ZPWANDa
         cjaX/lWOSRrYVJm3K+gacyAH8CalrqSRZPFTJT8aqJiUdLH2y+1MYZdFOusxtzNcItbB
         KKxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdbRW9at9i9DhLAZoHJx6/OeDsKORtv0Qxufgug1TNHjgncEZQi7hX/eNQrkhRjC/0N9E9V1lqDudEBoSVsGk=@vger.kernel.org, AJvYcCXzJdRQioXCIAGbsZOa/B+4KH78tNSpnd3loh4msubvqJYLj18mOrNjTYf0rnfstv6g/T9fiYuCd+Zg1Gc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxq0xGwwUYMEZ61awRVMA3MFNhCIciNR+0zuMACTcg32tbf8G/H
	V6nTXawaSWpDcBMAtWhMPr/myoT3PlrJWS6woaBXEgjFMRSqDWeUvqSF
X-Gm-Gg: ASbGncvZyWkqOzPgOKBY7B/UtyM4QCIF38COe+XvLJ/X+Owz899pJhPGuYTixoJVXsK
	UhgfYf79/zsTJu7KUUHpbGlDHALyWd6vQER0mQORSDNF8n875TtkinqexfDWecdOb24e3FYVW9Y
	QVqBAVd2i7aZWC5fwSR7/bi8IC14inUYpQC8sGiTSL8MGb7jm4pShpcuptm82X63R++B3dLLySB
	LjPkt0nJQQ4EF3aMJI2RWEjXemWFa/4sWKinE/QhbH/Nu0yNu2ZE9dtID2Bh+PNVKxM2vgi9EYR
	jgfClkPF75hGEdbramNUPmGJPo/P8B+WEHrUi5i7nb4IUSKm1k2pwuqi7BNo
X-Google-Smtp-Source: AGHT+IFgOYVrkyAZ2u0WfrrawTMEd2jWr9TwcmhkKNUZgt57lfdu4okQTmuCJuwmhGUEMYxpKUsgFg==
X-Received: by 2002:a17:907:948c:b0:ad5:2a11:efa7 with SMTP id a640c23a62f3a-ad52d4ea530mr56862966b.29.1747329426929;
        Thu, 15 May 2025 10:17:06 -0700 (PDT)
Received: from [10.5.1.156] ([193.170.134.247])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6005ac35e33sm107683a12.60.2025.05.15.10.17.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 15 May 2025 10:17:06 -0700 (PDT)
Message-ID: <42820306-3a94-4c47-be9b-c3f89de34866@gmail.com>
Date: Thu, 15 May 2025 19:17:05 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: irq: add support for request_irq()
To: Daniel Almeida <daniel.almeida@collabora.com>,
 Alice Ryhl <aliceryhl@google.com>
Cc: Boqun Feng <boqun.feng@gmail.com>, ojeda@kernel.org,
 alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 benno.lossin@proton.me, a.hindborg@kernel.org, tmgross@umich.edu,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250122163932.46697-1-daniel.almeida@collabora.com>
 <Z5HtHVMipAdNvOcj@boqun-archlinux>
 <CAH5fLggSET--eSW=rA_hw2jAyAO6_fa82gm0X3qeanXEvmZscA@mail.gmail.com>
 <3753EBEB-8538-403A-BEFC-768390EB2D9E@collabora.com>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <3753EBEB-8538-403A-BEFC-768390EB2D9E@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Daniel

On 14.05.25 4:44 PM, Daniel Almeida wrote:
> Hi Alice,
> 
>> On 23 Jan 2025, at 06:07, Alice Ryhl <aliceryhl@google.com> wrote:
>>
>> On Thu, Jan 23, 2025 at 8:18 AM Boqun Feng <boqun.feng@gmail.com> wrote:
>>>
>>> On Wed, Jan 22, 2025 at 01:39:30PM -0300, Daniel Almeida wrote:
>>>> Add support for registering IRQ handlers in Rust.
>>>>
>>>> IRQ handlers are extensively used in drivers when some peripheral wants to
>>>> obtain the CPU attention. Registering a handler will make the system invoke the
>>>> passed-in function whenever the chosen IRQ line is triggered.
>>>>
>>>> Both regular and threaded IRQ handlers are supported through a Handler (or
>>>> ThreadedHandler) trait that is meant to be implemented by a type that:
>>>>
>>>> a) provides a function to be run by the system when the IRQ fires and,
>>>>
>>>> b) holds the shared data (i.e.: `T`) between process and IRQ contexts.
>>>>
>>>> The requirement that T is Sync derives from the fact that handlers might run
>>>> concurrently with other processes executing the same driver, creating the
>>>> potential for data races.
>>>>
>>>> Ideally, some interior mutability must be in place if T is to be mutated. This
>>>> should usually be done through the in-flight SpinLockIrq type.
>>>>
>>>> Co-developed-by: Alice Ryhl <aliceryhl@google.com>
>>>> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
>>>> Signed-off-by: Daniel Almeida <daniel.almeida@collabora.com>
>>>> ---
>>>>
>>>> Changes from v1:
>>>>
>>>> - Added Co-developed-by tag to account for the work that Alice did in order to
>>>> figure out how to do this without Opaque<T> (Thanks!)
>>>> - Removed Opaque<T> in favor of plain T
>>>
>>> Hmmm...
>>>
>>> [...]
>>>
>>>> +#[pin_data(PinnedDrop)]
>>>> +pub struct Registration<T: Handler> {
>>>> +    irq: u32,
>>>> +    #[pin]
>>>> +    handler: T,
>>>
>>> I think you still need to make `handler` as `!Unpin` because compilers
>>> can assume a `&mut T` from a `Pin<&mut Registration>`, am I missing
>>> something here?
>>
>> The current version operates under the assumption that PhantomPinned
>> is enough. But I'm happy to add Aliased here.
>>
>> Alice
> 
> Aliased? What is this? I can’t find that trait or type anywhere.

Aliased was a name previously considered for `UnsafePinned` [0].
I believe that was what Alice referred to here.

Just marking the type as !Unpin should be fine on current
Rust versions, but on some future rust versions `UnsafePinned`
might be the only way to make this sound.

[0]: https://lore.kernel.org/rust-for-linux/D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org/

Cheers
Christian

