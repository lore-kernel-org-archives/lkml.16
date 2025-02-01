Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 141D81C28E;
	Sat,  1 Feb 2025 00:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738371514; cv=none; b=RyVJoLs9h/c4ftAmooXxR7TiGh1NpuKLm8KfZFuTCnjY7Z7FeaoZdnAdIF6zBVjuAinXxF+wcZLrpZYO1I0I4cqQTYY7lQ79trPgfkeR2l07pKopmPLcVqDCXHi2ppkSxrw0SRn8P5vMNE0DCqYBtRQkbJvZ3CESAEjWwBZygl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738371514; c=relaxed/simple;
	bh=atYCegQTTvj5G+xY7UhS3TSKaFiVh3aTBWl9N4DKabc=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=FkZ3FsNBKLPLmoN63C1YwQc+RxyeMIrQ/oXPlrmg3+SH5+GafEajnj1Qiv0oe+VwgXq+aNSP4PbAVqlEcMIc+m5mvNtELVazOvmhmnGNkMIFDd3ptGzX3gZfYJ9jWHB10HbHMtrlDfFIrqu8gdAdjLdmBX9hwTRw53ccyG+yMbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dM0MtA/4; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dM0MtA/4"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43621d27adeso18092045e9.2;
        Fri, 31 Jan 2025 16:58:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738371511; x=1738976311; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=S0DQdadGCnyVsgh8PC3cx3y3mc3bFhrG3Rxn1uJLbjU=;
        b=dM0MtA/46cgNEMtcgMy0gd9Qw4VomVT9BqvD9HrRXvNEAbv8x+jCFcvXVyJPHNDeh7
         X7cgJ78MLM+7X/0RWMk9DNsiukZcWMncKLYqpRe6aaRpkFbboy1bzJQh5jUz6d5kdqj+
         70S8U0c1iuJMG5Vdx6/3dGleSu/tckV/YOoZZZ1y/gO1sRGs7kPbq0eH/XylM6dm+pMo
         HIb+kS6IN0XCgWLgf8Ii/9UQgTl9UleJOm70CLwZwJV2non90c1rQwCkHzxFjV56m7xJ
         vDpcfsTxLMdaRkvIojetLt9wrvg8lhM2UJdLJkcb0Gd/6/wDz/RgpLJp6NuspDY+Jro8
         np/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738371511; x=1738976311;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=S0DQdadGCnyVsgh8PC3cx3y3mc3bFhrG3Rxn1uJLbjU=;
        b=CKBCTAnUJKTNz2rxyrZuePb/DclNC1FP4A5FVxuPac57JPFp2ij1+Z5rKe2i7PQZ9d
         QTC/NeZtNXlce+kj96lX909IS2AEj3deY/bkO8DEFp2qZoqoTx8sSUFn0N4otMiXGM6p
         q2z6Nw4e7g2taZHKfmjAxYzYNO94dbgJVD98xqlqVNQc3EmLZ002yPhH7pi3b9FYl8oc
         UAHzpb7iQnne6ZWgXAQR+4YAEVT8UCDGxW/WlfU/h0lANdwj1gFruPAU/HUO/95OIh5I
         JiPJ86MnVWmjW68ME+CrR4nnaP/GaZuLf4Q4+mHT5zLoCEBTkod38hkq5z+1MjSmZQ5V
         fRtg==
X-Forwarded-Encrypted: i=1; AJvYcCU/nL73t2I2+Po4gxg+JvWrgyWVm9IWKjXQBT3B1AqAAQj/YZuiRMYjHOWuJp+qXt/oxihta+tbZEg=@vger.kernel.org, AJvYcCWnXqunknlsogsFA7wVfryQnkvZmWvkpn6k6r5leJFu5USXjB+ihhHn65eAKw0g4nlPHairwD3Wh7Xzotjb@vger.kernel.org, AJvYcCXWccZyE4YDJbW4NT80fqurczzegfKEHuP4lZMG+jroR0eRrssmps+I33LrSiaz85XV5ZnDFuOhENA7PYzVVoc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtPmDQ04IU7oqELh5aGj9wd1cyrj93qaaD63lsq+thgL77jMRh
	eFC9wveBYwL7Z8uFqgDz27n6DnliqRdDiPC9FXVlzN7Ir6RmKw7p
X-Gm-Gg: ASbGncuW4GvcM8wzDLfbrdwLaEl6httaRaLRgW8Ax6Hqb0cfmwuoEcBK5vFYJ1twzWD
	5rLDsQRx3g+I3RI6PpmpkWIWpfRRi7I9vxB0HK/tQ37m+3jJ2p8BRfnDShk5hxdisvMmEjKi0Cn
	sNsaHicdSKLr/16wWFJERW5Tlo/yz8L25fiTg4JHZ0aFThvKtKG5pOOjE6eDD26aDQQRDwPxzC+
	Ro6USQiBPINKakBlFWaIzXUDRfKkysmhPjy/tv30TxMMYlPRIgQj5JZmgyC4FXDwIow7wX4xYse
	VP6hDmxMi/e+IJNBn6yXlxIV2F8P
X-Google-Smtp-Source: AGHT+IFFQKg7DyGdtCXt0WCRB1j2aK57eJ3GDImbT0dCbP/SUetC7Ta/AC6CvAyAQl/hFXp2OU35/g==
X-Received: by 2002:a5d:6d86:0:b0:38c:5c7a:dfae with SMTP id ffacd0b85a97d-38c5c7ae299mr7747825f8f.43.1738371511038;
        Fri, 31 Jan 2025 16:58:31 -0800 (PST)
Received: from ?IPV6:2001:871:22a:8634::1ad1? ([2001:871:22a:8634::1ad1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38c5c0ebfdasm6047508f8f.17.2025.01.31.16.58.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 16:58:30 -0800 (PST)
Message-ID: <254593b3-613d-4536-b69b-74a41f0feb09@gmail.com>
Date: Sat, 1 Feb 2025 01:58:29 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] arm: rust: Enable Rust support for ARMv7
From: Christian Schrefl <chrisi.schrefl@gmail.com>
To: Arnd Bergmann <arnd@arndb.de>, Andrew Lunn <andrew@lunn.ch>,
 Miguel Ojeda <ojeda@kernel.org>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Jonathan Corbet <corbet@lwn.net>,
 Russell King <linux@armlinux.org.uk>, Rudraksha Gupta <guptarud@gmail.com>,
 Ard Biesheuvel <ardb@kernel.org>, Geert Stappers <stappers@stappers.nl>,
 Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
 Sven Van Asbroeck <thesven73@gmail.com>, rust-for-linux@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
References: <20250123-rfl-arm32-v3-1-8f13623d42c5@gmail.com>
 <a83b0149-7055-411b-ba86-d227919c7c32@app.fastmail.com>
 <f8b59f05-55b5-4208-8bdf-b4be8e93bc22@gmail.com>
 <65da77f7-bbd4-4cbe-a06c-75f10a6ec4ce@lunn.ch>
 <5e8a99a5-f39c-46da-b54d-7b69307b1c66@gmail.com>
 <e14cfb34-308f-4797-afe7-4e7e2d470fe3@app.fastmail.com>
 <defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com>
Content-Language: en-US, de-DE
In-Reply-To: <defddc25-eb8b-420a-b64c-6ce57ebb3f6b@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 01.02.25 12:42 AM, Christian Schrefl wrote:
> On 31.01.25 8:37 PM, Arnd Bergmann wrote:
>> On Fri, Jan 31, 2025, at 19:58, Christian Schrefl wrote:
>>> On 31.01.25 5:05 PM, Andrew Lunn wrote:
>>>>> To fix this Rust would have to provide a way to build the core
>>>>> library without float support. I don't know if there is a plan
>>>>> already to allow this.
>>>>
>>>> Floating point is banned within the kernel, except for in very narrow
>>>> conditions, because the floating point registers are lazy saved on
>>>> context switch. If the kernel uses the floating point registers, you
>>>> can break user space in bad ways.
>>>>
>>>> I expect this has been discussed, since it is well known kernel
>>>> restriction. Maybe go see what happened to that discussion within RfL?
>>>
>>> After checking again, it seems the float intrinsics are actually not
>>> needed anymore at least for my config.
>>
>> Ah, nice! If this is true for all architectures using the current
>> rust compiler, it would be great to remove the FP stubs entirely
>> and have link errors instead of panicking, to make it consistent
>> with C.
> 
> After a quick test it seems that (most?) intrinsics are not needed
> anymore on x86, but not sure if that's valid for all supported rust
> versions and config options.

On Rust 1.84.1 only __udivti3 is requied, with 1.78 most of the
intrinsics seem to still be required.

Cheers
Christian
