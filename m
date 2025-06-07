Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F5E01FE44D;
	Sat,  7 Jun 2025 23:38:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749339490; cv=none; b=LeWc94u7N+GghQCbh5Z5rQkhpwKGNpgdzJJsRqyAVcMPSePdaoliI5H+dF6WwUx5o+PGFrHH39yPzs1s02PBWihCQ6e0dpL0paXQWzgJSwQsqcRukED7pZ6zHL/sVoCUa0u01rJKPsrtC2gy4n1wK4W1EmXFJlVUjh0XHsJw2bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749339490; c=relaxed/simple;
	bh=QX6/eM0m8QK/Eiwzw2dUmcCd19clvivt7I7QMT1ulus=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oppLeAIoJ+lpfZrvtNq9RVGMJwMCXnENbKbbAiVgT7GFfUIDl3ArWlLdRBVuN4BtBuoWFkE4pU4vKhUmv8a1wYh+LvbbwogWaCtSs/XxP9bgwV0hpxChVkqCa3S/tNPHy2WtwXaY9gvIG5DscynZ62k0UE8tfqU4IAB50dtSnJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ITN42Zwx; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ITN42Zwx"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso29377685e9.2;
        Sat, 07 Jun 2025 16:38:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749339487; x=1749944287; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0ccrXaVaO276zJxFyhqYmX1FFGS7cdNA8q15+qEqpCM=;
        b=ITN42ZwxpF0YWzE2+7MmzbqERBfbmyBn56QYRFCBPwB71ECMMNjq4hDsUr5tLVhvNx
         XHnz9OuP/k7zBGSvRxP3xic2cJ+0bLa4fnZ3shJNoTEbBRlWCFXo01PePZH8BP8X2hTW
         lMZlJAWlqJnuVFvMLLAw8h4BMuyGB+6r76aHvgaYzuw+4mLqvbCn3firKToHdKp0HdBB
         35VmeUywPUU1i1sBBFKtrMz+kvTuiKa+dxv67oEuGyQDB7U2byAMI2eGaTp2O5xz9/V8
         jVBkhnFvLDMVGHaGY0bv8POI5l2JR2n6nYvikJwC4Q4YgAF6fyE2DE9HtZO0Yj9/JJhv
         LRYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749339487; x=1749944287;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0ccrXaVaO276zJxFyhqYmX1FFGS7cdNA8q15+qEqpCM=;
        b=NWsfWcuroQpXxFlvu5HgfRMEvcLNcm4v+xMPeBBCBcQrICGbukN6kKe7qE2Fl32jor
         e4pmCylYpt8bThZbh/w4jKm4eTKm1iEY4THcJtYBPuO2cHfZj9WduOXpczzBBZSSAhtO
         iBUOh1P7Y4NXhoPlMJBtc7laJOzrSG9A9CfDCkACTa3X9baKWzO6GDYLK15R2vxUJcHD
         6kiZa265Cqy5QaqUAZQ1pPFp2F7l/5QGn+iHyIY0KjPyk+4ySDF0z269OHDoWd9aTqLg
         ztrZ/NDDspZC2JivBujGN3DwILjcODlKBQFgBmxG/MEJEuRHaAneWcU+crUlsS4bzpqk
         u94Q==
X-Forwarded-Encrypted: i=1; AJvYcCXebLoLqIkdRszPKy3yf3rbY6i7Z3ffbRwonnLAO5XD+9ro5CteC/WSTkZ4MJoXb5UinjhTOmA2qYEEqTx8Eg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbHr4HOMdBNZCrdtUFRkiUnc70g2vfyek8cNHif3U9kLb07IUw
	7SASEoFbQah11xtrdVrkmWAXO+zLv/Px3bmg6Z6G++a+RMNsqrASjzIf
X-Gm-Gg: ASbGnctNRkc+FJdlCr/BXe+ZdjtDNCZpOxCQ39egEXz2utNd3ARUWvzRR5anic47EIU
	Q5vZo1dt3+HzMTVJLfT3qdQWwNgpN+d0OCwl8Lx7zsTZk5id1NR6GRvvcOSA6crSZp3Or4c/qad
	gVEBU6HSM9WN26bMLSKdpJuBgerxgYPqnJa0KBqd9w9Fd3RbqtIj738FmFoiYZUEdraP6MoFleh
	44tnGRNuwDoLQ5NiKuXxnF/aKDEIEQojaB1IMZvH90HxUH/wd8UdClo4I5P6Dr+50jCB3jb6QY0
	+BVIcb7RXEkjZTL2cvYklFQ0tpuKhkCzDqLYL0ratBDuKsmYkxcpwJlCeChHLzkszHDgUf/kY+E
	=
X-Google-Smtp-Source: AGHT+IFW96Rg/60FioH55/nDijievpt/V2Wu+5Ava3mxtL3GpnM3fz4rpckobidrAjAl7GO7grY8rA==
X-Received: by 2002:a05:600c:c096:b0:453:6ca:16b1 with SMTP id 5b1f17b1804b1-45306ca18dbmr15189025e9.26.1749339486582;
        Sat, 07 Jun 2025 16:38:06 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45213709729sm68585945e9.19.2025.06.07.16.38.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 16:38:06 -0700 (PDT)
Message-ID: <eba1cfdd-3756-4f8e-a2b2-e15b8b8b4a18@gmail.com>
Date: Sun, 8 Jun 2025 01:38:04 +0200
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
 <407f04ff-b313-4629-bbdd-f25df14f44da@gmail.com>
 <DAGNOQOY3B3X.MQD616P04I3U@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAGNOQOY3B3X.MQD616P04I3U@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 08.06.25 12:31 AM, Benno Lossin wrote:
> On Sat Jun 7, 2025 at 9:20 PM CEST, Christian Schrefl wrote:
>> On 07.06.25 8:11 PM, Benno Lossin wrote:
>>> On Sat Jun 7, 2025 at 5:54 PM CEST, Christian Schrefl wrote:
>>>> On 07.06.25 5:42 PM, Benno Lossin wrote:
>>>>> On Sat Jun 7, 2025 at 3:02 PM CEST, Christian Schrefl wrote:
>>>>>> - Add `assert_send` as well.
>>>>>
>>>>> Sounds like a good idea.
>>>>
>>>> Should I already add this in V2 for this series?
>>>
>>> If you want to then sure, but we can also wait until we have a use-case.
>>> Also, let's finish the discussion about the macro idea below.
>>>
>>>>>> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
>>>>>> +///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThreadSafe` is not `Sync`.
>>>>>
>>>>> Can you split this into two examples and mark the failing one with
>>>>> `compile_fail`?
>>>>
>>>> I've tried it with `compile_fail` and it didn't work, I think
>>>> that's not supported in (kernel) doc tests yet. 
>>>
>>> Hmm, I thought that this worked... @Miguel any idea?
>>>
>>>>> We also could provide a macro similar to [1].
>>>>>
>>>>> [1]: https://docs.rs/static_assertions/latest/static_assertions/
>>>>
>>>> You mean the `assert_impl_*!` macros?
>>>
>>> Yes, but the others might also be useful from time to time.
>>>>> That might make sense, with macros we would not need to write
>>>> a const block to ensure its not executed at runtime (although
>>>> it's probably optimized out anyways).
>>>
>>> It 100% will be optimized out.
>>>
>>>> It would also mean that we won't need a assert for every Trait, which
>>>> seems nice. So a macro sounds pretty good to me.
>>>
>>> It depends, the macro impl needs to define its own function, which might
>>> be inefficient if one uses it a lot. But there is no way to be generic
>>> over traits, so there is no other way.
>>>
>>> Let's see what the others think.
>>
>> The error messages in the macro are slightly worse:
>> error[E0277]: `*mut ()` cannot be shared between threads safely
>>    --> rust/kernel/compile_assert.rs:40:18
>>     |
>> 40  | assert_impl_all!(NotThreadSafe: Sync); // Fails because `NotThreadSafe` is not `Sync`
>>     |                  ^^^^^^^^^^^^^ `*mut ()` cannot be shared between threads safely
>>     |
>>     = help: within `PhantomData<*mut ()>`, the trait `Sync` is not implemented for `*mut ()`, which is required by `PhantomData<*mut ()>: Sync`
>> note: required because it appears within the type `PhantomData<*mut ()>`
>>    --> /home/chrisi/.rustup/toolchains/1.78-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/marker.rs:740:12
>>     |
>> 740 | pub struct PhantomData<T: ?Sized>;
>>     |            ^^^^^^^^^^^
>> note: required by a bound in `assert_impl`
>>    --> rust/kernel/compile_assert.rs:34:48
>>     |
>> 34  |             const fn assert_impl<T: ?Sized $(+ $trait)+>() {}
>>     |                                                ^^^^^^ required by this bound in `assert_impl`
>> ...
>> 40  | assert_impl_all!(NotThreadSafe: Sync); // Fails because `NotThreadSafe` is not `Sync`
>>     | ------------------------------------- in this macro invocation
>>     = note: this error originates in the macro `assert_impl_all` (in Nightly builds, run with -Z macro-backtrace for more info)
>>
>> error: aborting due to 1 previous error
>>
>> compared to the function:
>>
>> error[E0277]: `*mut ()` cannot be shared between threads safely
>>    --> rust/kernel/compile_assert.rs:28:31
>>     |
>> 28  | const _: () = { assert_sync::<NotThreadSafe>() };
>>     |                               ^^^^^^^^^^^^^ `*mut ()` cannot be shared between threads safely
>>     |
>>     = help: within `PhantomData<*mut ()>`, the trait `Sync` is not implemented for `*mut ()`, which is required by `PhantomData<*mut ()>: Sync`
>> note: required because it appears within the type `PhantomData<*mut ()>`
>>    --> /home/chrisi/.rustup/toolchains/1.78-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/marker.rs:740:12
>>     |
>> 740 | pub struct PhantomData<T: ?Sized>;
>>     |            ^^^^^^^^^^^
>> note: required by a bound in `assert_sync`
>>    --> rust/kernel/compile_assert.rs:26:38
>>     |
>> 26  | pub const fn assert_sync<T: ?Sized + Sync>() {}
>>     |                                      ^^^^ required by this bound in `assert_sync`
>>
>> I guess I'll keep it as a function for now.
> 
> Can we improve this by using a proc-macro instead and manipulating the
> span? I honestly don't think the error is too bad.

I don't see any point in paying the compile time hit for a proc macro.

The Error is not that bad, just a bit worse. I just don't really see the
point since this is only really need for marker traits and realistically
only for `Send` and `Sync`. Also the macro would create a function
definition for every invocation which would be a (very) small compile time
hit. So I think that we should just add the `Send` and `Sync` functions for
now and reconsider changing to a macro once/if more than these two is
actually needed. 

Cheers
Christian.
