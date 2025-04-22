Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 888251F150B;
	Tue, 22 Apr 2025 14:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331459; cv=none; b=qB4PghmNQD+ZzA2xV97/FlRDOTYEmOpTLPHP+qJ8pmUImiZoud04kECXk3AQnbLjotgNMvlSEWYYqsfm2xPGqVXRlGGSeN1Umnga9MVyJEMoVHwID2NzK/7kzFY1D/6T2E8lEB4x7wiRVUczfXA+uQFMj2ocWM1oLCGvKFmOQaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331459; c=relaxed/simple;
	bh=gYlWEQIlw77JGv7XiwEGeNo2Aw8VD0SndyzCjOAIY8o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=q2wMNvKKqMrV64zwr+S12zFe0oArdTLxEcK9IysJ+fv7RjsXbPX/HYVUQyfpxvgOiEM6CQyt4VAy4S7DlEp6RRI7PAKVyVZvg1lgUS/EPz42IxuJ4myKrT3dlJJklaJanDR1ZhpD3b/+6AvU6vRBPCbdHv0m0X3+qxAj4LM9cOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F2a6cWMy; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F2a6cWMy"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso34121905e9.0;
        Tue, 22 Apr 2025 07:17:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331456; x=1745936256; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9I/uqzoZdA9AWIABIKeUfPFhsWMyq0LGojHFzDLdp0M=;
        b=F2a6cWMybtp3ue+Godh14f4hDRq7yCZorbMoQgWBR3UD5sVZ3Act/q86JksCvfREOt
         N5/OV2PAIHiBKTcCNFGQBuSSINvn8Sc7rj1WcKqRQpU6mnv3r1PaeOlir4lWjnRstQlb
         5vFrPMw6aeru2ycMt6a5H+vVc9kzCcR8XQ7pjm8g4xm3ifRDNwN22FbZOFncCja+U+DC
         1JT/HiavmnGDNoDzOymyqYXtA7cDk/IlbAIJ21xqs3wmiB9Y2sMYZKVFzT9A6PXCc1XW
         LSBn/ec2VZC5IF4JSt7gb/Nhx9zzHkxcx0wUQOLHDXqNANctaxALDUr4wARdj2DPXSGt
         Kdxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331456; x=1745936256;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9I/uqzoZdA9AWIABIKeUfPFhsWMyq0LGojHFzDLdp0M=;
        b=XG7SelXSRKhBz9HUXuPSKszZwDQYZnwTsvJAj4UoQUciB0Oe0aI+YDUdTsdxQNIUHY
         es1s1cYzBzi7jY6r5WA3WX23obAZFpDRibgefR9WjbP7CVXkv3u4CtCiopBwIDQkayHY
         Es4q4x0Po/iYdFhcgec3L5D250o/+QVorSaQsYibdD+gTzVHzZCtQOUICin20l9BIQVS
         VlNwB1dL2W/yxhzAwX9UYDLit0pXLKtFpgSKoyELE1dzltypWOcPccodHvqkoNp0p/7T
         +LUYf17whQNp5G+6I80+/kC6KUL+cWDaXFRcKhpROAkTIw3wWqS6V6YqLP9H6dYbJBX+
         Oo8g==
X-Forwarded-Encrypted: i=1; AJvYcCVPznWNb6vnMd0RfBaAiCcXPnhYwa5w8dXGy131IUg8LqByHHRnJdyQp0InFk3p3xAz31454SK8xcxI0Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHwLFQoKUdVVuii1+JQY3xMAR3F27IcLAvx/OmbVQXifE4ZWSg
	0+dfxL+I1Tn3tnZOi0zvdvX0WpoczbmKpU/cSIo5yQQvMcrLIUGA
X-Gm-Gg: ASbGncvj+pAnkR4vXhnDnzwB9qBVXS3u1AgnVs7nlHU3Un1en+Xuzlr4MNUbNcyPezD
	OXdbeZI+3BNXR/O8KwQvGIh8/UH2uo0Sb7xqm6VCzQNxz/o27epLKqZr3AjxnolCnI2ybaZLgPP
	Xptu2FlFLhHcPoG4eW6C9y63xULHjRRlw00ClexujvHc5CiGxO8p7KCCrDxbLx2YZ1i8/QFxgT1
	RoX/cOnwtJDMDjtXYvCiBtyjXpzDuRatc9gCzl85INjmjMwvIW7ggiAsHQy7VH7YNvG8wjbKIA6
	kJODxCeQGR8O1iF+TDBUjNuP00WD65s1g2wji0W01eZ1HqAnis7Xn1zyqrr2Z9UPyA7DBtwtqv/
	1uII4WPv6ZLsbUi2jBG1iNg==
X-Google-Smtp-Source: AGHT+IHQ4BsuRjz6JVL8wwc24WrJX2pvwSm2cSBp+O4iJGzv95SQ1ijWxZ5mEA7FK7II9H1JdzLaPA==
X-Received: by 2002:a05:600c:43d4:b0:440:67d4:ec70 with SMTP id 5b1f17b1804b1-44069732095mr115981345e9.8.1745331455479;
        Tue, 22 Apr 2025 07:17:35 -0700 (PDT)
Received: from ?IPV6:2001:4bc9:1f91:3f49:880a:9a87:b7c1:e3a3? ([2001:4bc9:1f91:3f49:880a:9a87:b7c1:e3a3])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4406d5a9ed9sm180011125e9.3.2025.04.22.07.17.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Apr 2025 07:17:35 -0700 (PDT)
Message-ID: <a27d97ff-7d40-4595-9c0d-51415d958ebe@gmail.com>
Date: Tue, 22 Apr 2025 16:17:33 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/8] rust: pin-init: Implement `Wrapper` for
 `UnsafePinned` behind feature flag.
To: Benno Lossin <benno.lossin@proton.me>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250421221728.528089-1-benno.lossin@proton.me>
 <20250421221728.528089-4-benno.lossin@proton.me>
 <4df4e3a0-9caa-4253-bf65-66c238bf0291@gmail.com>
 <D9D4M8XF14X9.1YUVFH9EW0IMX@proton.me>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D9D4M8XF14X9.1YUVFH9EW0IMX@proton.me>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 22.04.25 1:21 PM, Benno Lossin wrote:
> On Tue Apr 22, 2025 at 11:42 AM CEST, Christian Schrefl wrote:
>> On 22.04.25 12:18 AM, Benno Lossin wrote:
>>> @@ -1557,3 +1561,11 @@ fn pin_init<E>(value_init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>>>          unsafe { cast_pin_init(value_init) }
>>>      }
>>>  }
>>> +
>>> +#[cfg(all(feature = "unsafe-pinned", CONFIG_RUSTC_HAS_UNSAFE_PINNED))]
>>> +impl<T> Wrapper<T> for core::pin::UnsafePinned<T> {
>>> +    fn pin_init<E>(init: impl PinInit<T, E>) -> impl PinInit<Self, E> {
>>> +        // SAFETY: `UnsafePinned<T>` has a compatible layout to `T`.
>>> +        unsafe { cast_pin_init(init) }
>>> +    }
>>> +}
>>
>> I've realized that for us to use `UnsafePinned` in `Opaque` internally 
>> we need to have a `T: ?Sized` for this implementation. `cast_pin_init`
>> won't work for that since we can't cast pointers between different DSTs.
>> We could add something similar that uses a closure to convert a
>> `*mut T` to `*mut U`.
> 
> I don't follow, which types do you need to wrap in `Opaque` that are not
> sized?
> 
> Since `Opaque` uses `MaybeUninit` under the hood, it cannot support
> `!Sized` types anyways, so I'm a bit confused.

Sorry I got an `?Sized` error and convinced myself that `Opaque` had
a `T: ?Sized` bound. After looking at it again there is no problem.

I'll work on V2 of my `UnsafePinned` patch with a second commit
for using it in `Opaque`.

Cheers
Chrisitan
