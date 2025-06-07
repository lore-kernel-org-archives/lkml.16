Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF75B1E2853;
	Sat,  7 Jun 2025 19:20:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749324050; cv=none; b=m8BGcVWyfVW0H5Rz8v1a3MkmO76PUGVeyrElyDXwCbU8R6+7qw2uwJO2pS4NU/34n6+/L6gmr8zGhsQbWAzo7d1GED1zSbHTxBwRKhHfbryqtj9QZP3SPZWWGA6XrRPr55l9I1R25Y1sU5o2Jy5HeLL69oRVEcx4sQ7/JNJAfWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749324050; c=relaxed/simple;
	bh=O5+gwYnLCWFLqbGYPlc6bH+VFDr9laPWOhkQEwvF9Bc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nU7CtxizsWGIOt3PYCxssypoXFKqRZWk3wWHqYN95g/dLUaYQ/Fha1+ZcvhKkfSUK+GFGJpoJoZ38WcIFUzFLihstrxUP58KFt55CRjeOnMBaWgJAEOLv4yoeTj2dIJ5QIJzMqZWNKL4TAMqIK9ogNgIKpANHQe7O0BNFGBfutI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YWGgQJ2u; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YWGgQJ2u"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-3a4fd1ba177so2196826f8f.0;
        Sat, 07 Jun 2025 12:20:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749324047; x=1749928847; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=DFOortVeZ0TnxwCANWeF+9bEBLuGOdK91fhIJ/AcWp0=;
        b=YWGgQJ2u27hhIxajjgLMCm+CEkksnT6XME2GKl6mjU7u/kn2rFpY5zEIngK2iKsZH3
         XHN98igjZfwyKkrf2noHO6Q0NH51/1q0lD0nZrmaCGL+u7+8q9BwL2zMaRpDLfc4Om3f
         MtR/Ck4dldqiX/5D0cm5x8v9xwKhSIah8jL+ZbMeP2AjE+YCVQ4Guve0h3kUmao0aDoW
         hVE/81kdchsmbmtC8pGllDOUvM08LFytREBLG3u3HMzJbNpNdO/UKxMoErkuBlvR863S
         fnrgwViGGh4Vs50vHDydnycDjYTOHNQ0jPJy4De1YSsadLqIz8BBPE1xvkFYU9BU14Nd
         H/4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749324047; x=1749928847;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DFOortVeZ0TnxwCANWeF+9bEBLuGOdK91fhIJ/AcWp0=;
        b=vJOToc+d8b7wFZNXwGVaJpTbD3bBgz9gCCaMjKrbq0OFN8ESv+jqfg9U3rBe33lZyS
         H85Qy1gCbA7hfrN3gMmy5DlDcFbFy7oSwc8Fv6lQpRrcEbpksDehWCA1xy3DWfsgX7/t
         QIPIsXwCHmVn7FzQjxP7RdknOG7w20X+aHDTf1Iw95W3w7Ouc1RayYAn+tEqntW8i8AO
         O+0PiOrTKKm4cyM4ZSzINo+HGUPMMZ3awA+vmNgt48e5Tb08u7SSjg++hJ8POUdEYmQi
         1ufirgcvUrn6ZAkHz3n/M7w4UVAS71Jx+mnUeJ0CiqEZxZCqWbI2A+xP1giqYmD5nDoZ
         Wvwg==
X-Forwarded-Encrypted: i=1; AJvYcCUe1sZEbYVffM+cppHYOGeezycUODReDNW/RVlrdZs26yQccN1S2aTibIb3Ollkupda71u3IFNH+2dm5zjYew==@vger.kernel.org
X-Gm-Message-State: AOJu0YwaKSXuSGxJrtnTlwDc7hTuM7aLVtkFm+qhqs1okpZLughjUnE9
	yuzs32A7CwGJaGoNLowxB6bBKd/2g6i0PMGqIhLSHqKVWd6Y+vpWsb4w
X-Gm-Gg: ASbGnctupUcb9tNdzqclm1+Xvpbpqipq/lzfutA+rZsCLZ5D1P6jSNJFk5qTE1ZhdxO
	gGT8eJHBD7UlR/FI7Q5AWmgqGL911qz/u+OG4xgDHsXHZmR02cnl64JVS1EZApFsHh8pfrwrApa
	iH/Jh8i/JsOiApx0KybJ3BipQieZwF0G7sHldwrCMl1bGDaF0shFrCN1Z2Og3YDF5qPem8zeqjD
	9MH2/8VhMEJ+UGctDMJlpRZhJJ0ctxOWxwgPKmMddCR/MSjzGRvwq8x3U8gv+iaaRBwMcgVcemR
	9xbC2J/83tVmyNPs08ZPOEsXmU2UmCCSxwwfvOq6Av6wA0bc6IeV/3XrsTMhdxQNQ3zqWGtS1vY
	=
X-Google-Smtp-Source: AGHT+IFlMAi5uuxWHFLjqXqmXICNX0dyq4/PTE3nckSzXR2r3LpSGjXr9QIYJPmJOq98yEXqEZelSA==
X-Received: by 2002:a05:6000:4011:b0:3a4:edf5:8a41 with SMTP id ffacd0b85a97d-3a526dc5605mr9713682f8f.4.1749324046796;
        Sat, 07 Jun 2025 12:20:46 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709637sm63780325e9.26.2025.06.07.12.20.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 12:20:46 -0700 (PDT)
Message-ID: <407f04ff-b313-4629-bbdd-f25df14f44da@gmail.com>
Date: Sat, 7 Jun 2025 21:20:45 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] rust: add `assert_sync` function
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250607-assert_sync-v1-1-b18261da83e2@gmail.com>
 <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org>
 <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
 <DAGI57J7WBD0.2BOT553TRIXH8@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAGI57J7WBD0.2BOT553TRIXH8@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.25 8:11 PM, Benno Lossin wrote:
> On Sat Jun 7, 2025 at 5:54 PM CEST, Christian Schrefl wrote:
>> On 07.06.25 5:42 PM, Benno Lossin wrote:
>>> On Sat Jun 7, 2025 at 3:02 PM CEST, Christian Schrefl wrote:
>>>> - Add `assert_send` as well.
>>>
>>> Sounds like a good idea.
>>
>> Should I already add this in V2 for this series?
> 
> If you want to then sure, but we can also wait until we have a use-case.
> Also, let's finish the discussion about the macro idea below.
> 
>>>> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
>>>> +///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThreadSafe` is not `Sync`.
>>>
>>> Can you split this into two examples and mark the failing one with
>>> `compile_fail`?
>>
>> I've tried it with `compile_fail` and it didn't work, I think
>> that's not supported in (kernel) doc tests yet. 
> 
> Hmm, I thought that this worked... @Miguel any idea?
> 
>>> We also could provide a macro similar to [1].
>>>
>>> [1]: https://docs.rs/static_assertions/latest/static_assertions/
>>
>> You mean the `assert_impl_*!` macros?
> 
> Yes, but the others might also be useful from time to time.
> >> That might make sense, with macros we would not need to write
>> a const block to ensure its not executed at runtime (although
>> it's probably optimized out anyways).
> 
> It 100% will be optimized out.
> 
>> It would also mean that we won't need a assert for every Trait, which
>> seems nice. So a macro sounds pretty good to me.
> 
> It depends, the macro impl needs to define its own function, which might
> be inefficient if one uses it a lot. But there is no way to be generic
> over traits, so there is no other way.
> 
> Let's see what the others think.

The error messages in the macro are slightly worse:
error[E0277]: `*mut ()` cannot be shared between threads safely
   --> rust/kernel/compile_assert.rs:40:18
    |
40  | assert_impl_all!(NotThreadSafe: Sync); // Fails because `NotThreadSafe` is not `Sync`
    |                  ^^^^^^^^^^^^^ `*mut ()` cannot be shared between threads safely
    |
    = help: within `PhantomData<*mut ()>`, the trait `Sync` is not implemented for `*mut ()`, which is required by `PhantomData<*mut ()>: Sync`
note: required because it appears within the type `PhantomData<*mut ()>`
   --> /home/chrisi/.rustup/toolchains/1.78-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/marker.rs:740:12
    |
740 | pub struct PhantomData<T: ?Sized>;
    |            ^^^^^^^^^^^
note: required by a bound in `assert_impl`
   --> rust/kernel/compile_assert.rs:34:48
    |
34  |             const fn assert_impl<T: ?Sized $(+ $trait)+>() {}
    |                                                ^^^^^^ required by this bound in `assert_impl`
...
40  | assert_impl_all!(NotThreadSafe: Sync); // Fails because `NotThreadSafe` is not `Sync`
    | ------------------------------------- in this macro invocation
    = note: this error originates in the macro `assert_impl_all` (in Nightly builds, run with -Z macro-backtrace for more info)

error: aborting due to 1 previous error

compared to the function:

error[E0277]: `*mut ()` cannot be shared between threads safely
   --> rust/kernel/compile_assert.rs:28:31
    |
28  | const _: () = { assert_sync::<NotThreadSafe>() };
    |                               ^^^^^^^^^^^^^ `*mut ()` cannot be shared between threads safely
    |
    = help: within `PhantomData<*mut ()>`, the trait `Sync` is not implemented for `*mut ()`, which is required by `PhantomData<*mut ()>: Sync`
note: required because it appears within the type `PhantomData<*mut ()>`
   --> /home/chrisi/.rustup/toolchains/1.78-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/marker.rs:740:12
    |
740 | pub struct PhantomData<T: ?Sized>;
    |            ^^^^^^^^^^^
note: required by a bound in `assert_sync`
   --> rust/kernel/compile_assert.rs:26:38
    |
26  | pub const fn assert_sync<T: ?Sized + Sync>() {}
    |                                      ^^^^ required by this bound in `assert_sync`

I guess I'll keep it as a function for now.

Cheers
Christian

