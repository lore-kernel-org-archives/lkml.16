Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C018C1DB551;
	Sat,  7 Jun 2025 15:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749311698; cv=none; b=u4LP0xrFpAM+6JWuvu8fQgQzHYs42Q1BrnZOPSkwSw+Bi5nhoKizZ8Slyd99u0FBZKRiHOQrPuJ75ittuXiXa6qL0dgtUTwGzkaKE0lHjGS26RM5EZW3h7wXdHeibSov9Nvy5l8dPhA9ZKBoMyxNBiTXy2j2HMb7XwJEmcTDu70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749311698; c=relaxed/simple;
	bh=GWCvSuD7yC5RJHb8teCCo0Lcmig20/cl/ILQNjEwvGk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=A75epQf4+pZxGeEhcaDFPfw93f08ERDAh0XWSeCg61/5/shrwzduWRLAkhfbg43IGDSTV2TmLyLmPz/r/LW6W9wFVGS0yhivGAHvMVcC5Y0F5EIlwhqmSjH3yK8dqqDVU9D4xrxCpCfGMw3ywXVzniDYljgy50xIDws8k6kKPuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OtZ+OPJE; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OtZ+OPJE"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43ea40a6e98so39353485e9.1;
        Sat, 07 Jun 2025 08:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749311694; x=1749916494; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lElt2p0xNoHrTTdkdIDSkTAEZ2v9dBMJJM22KQF3zN8=;
        b=OtZ+OPJElwoR4kO8CprUBTffN+8ulqb/MblZ4k36Cff1MG1AIep13m26q4Da8P0hyM
         aMK1C896hTskXSW9s7seiy7xL5HjXKhrM4Nh1DUxbc35G4yUm7sGYCZzTD0LF6FPK4Oc
         vdAwbQtSbsINpKuhy7IF4n1FdIEgYF7/A6coeofe8U35yKPmC436EBPcgWVaTbOjDKln
         GSRyEuS6SeiZzDJCuayrnF8IgYM5B6FtRN/wewlM8SfRleBTZjCmazfstwCtLAiwToWm
         ybkBaRYsZp9HzL8LfQNYkCksVxDzNHkjqJWwh3YfoL6LeRvgXVrXFTUQp15O7DPumMF3
         kpRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749311694; x=1749916494;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lElt2p0xNoHrTTdkdIDSkTAEZ2v9dBMJJM22KQF3zN8=;
        b=eSqq9q1455woT+637zuSfH353Ydnpsv+uys5+gCEKVXFodNMF3lShRodT2gVXJY1Ob
         sXaeDMqY22wfMbvodJ4ohV5hoQ/vWmAa/Ghm8UcUD2dfrrxE6mj8KsbmtVMeyLwC+cKy
         qJ2SrVx3WPzXv4mvLbYvxeyR7b5Jw6P+aNrSHa3CpS4p6EzgJP929hmNyGNPXKDe3zNb
         4fEX6feR2aavq4n2oHgcNN76ajMIHDKZ4B4F6UMcCtM3+eWkb3XeCD2I3KwM67i4kU0N
         Tzj/4RoRvKY/l7qF26jWj2TarapGu4s2mMbYfYO1sfEtPZu+KsVTOBADY6qxMsWBDQdk
         uOxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYQ+Wx2WRBch0CD8+UcH5pzmPzTai4XFi72SwIkekzxKFfHVvH9wruT+aesde2ab8SuCoBO3q8DBi52JG3wQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxXQmMcr70knlbLmvX5rKxE5BphVNIhbJw5Waqx0aqplodnnRt9
	Z5VSNCvIhnkyNRwgObpaezQAHnBpgSsxJ77d4ZLqN/qIyNic+nf3ysQy
X-Gm-Gg: ASbGncvvODqmz3fdsmAYRrlWNpqSNDP5Xp5NC2+qqMhoCXVXOA7nuGtrcgRLfOaVH3P
	5Y+bCEnfqSNI4wF25vDXoSLAnGs4z4bqxmyox82P3uaIqRh9F3AYGPn6KDM/2zg2U/eKoLRDLyT
	+osC78u6v00xyd9h8qBQS4oP6ve4BZyx5J5N5lr+EBAL7wKR335Li70PE0x86N2wivWM54ZBK0J
	PmCa5jFTbQyl99NFV2vm5BVU8DiE1GZzG6XlUJgaQp/1C7cAJnuxi9bgX6EYTlmZ2shE1g4y2x3
	+u2Jnyl+PJP+HD02GDu8u2osZjC11xukupbn9D7x2MWUEZfqSYjsZzh2vszNJFzNThiBcWg2zko
	=
X-Google-Smtp-Source: AGHT+IHVpXmVaIpm+OtghiYCloqWEAlv3Jkw/GZ3L1xc6lBAnFWLkazhhA0r6F9jOPM3C0dkDyIpSQ==
X-Received: by 2002:a05:600c:1c90:b0:450:cff7:62f9 with SMTP id 5b1f17b1804b1-4520140cefamr60308875e9.22.1749311693928;
        Sat, 07 Jun 2025 08:54:53 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:3372::1ad1? ([2001:871:22a:3372::1ad1])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-452730d161csm56553875e9.37.2025.06.07.08.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 07 Jun 2025 08:54:53 -0700 (PDT)
Message-ID: <2531463d-fa6e-430c-a3a6-b179654cfbbe@gmail.com>
Date: Sat, 7 Jun 2025 17:54:52 +0200
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
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <DAGEZCRR61A0.30H1MJQXW4CV5@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07.06.25 5:42 PM, Benno Lossin wrote:
> On Sat Jun 7, 2025 at 3:02 PM CEST, Christian Schrefl wrote:
>> Adds a new file `compile_assert.rs` for asserts during compile time and
>> add the `assert_sync` function to this file.
>>
>> This will be used in `miscdevice` to avoid regression in case a `: Send`
>> bound falsely gets dropped in the future.
>>
>> Suggested-by: Benno Lossin <lossin@kernel.org>
>> Link: https://lore.kernel.org/rust-for-linux/20250530-b4-rust_miscdevice_registrationdata-v4-0-d313aafd7e59@gmail.com/T/#mdf3328834ce1d136daf836c9e089b5a8627a6d53
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> Thanks!
> 
>> ---
>> For now I've only added the function.
>>
>> Some things that might make sense to do as well:
>> - Move `static_assert` into `compile_assert.rs`.
> 
> Sounds reasonable.
> 
>> - Add `assert_sync` to prelude.
> 
> I don't think we need to do that. At least not yet.

Alright

>> - Add `assert_send` as well.
> 
> Sounds like a good idea.

Should I already add this in V2 for this series?

> 
>> - Use these asserts in various places around the kernel. (I'm not sure
>> where it would make sense)
>> ---
>>  rust/kernel/compile_assert.rs | 24 ++++++++++++++++++++++++
>>  rust/kernel/lib.rs            |  1 +
>>  2 files changed, 25 insertions(+)
>>
>> diff --git a/rust/kernel/compile_assert.rs b/rust/kernel/compile_assert.rs
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..2a99de1ba919dc3952d7a1585869567a44106b44
>> --- /dev/null
>> +++ b/rust/kernel/compile_assert.rs
>> @@ -0,0 +1,24 @@
>> +// SPDX-License-Identifier: GPL-2.0
>> +
>> +//! Compile-time asserts.
>> +
>> +/// Asserts that the given type is [`Sync`]. This check is done at compile time and does nothing
>> +/// at runtime.
>> +///
>> +/// Note that this is only intended to avoid regressions and for sanity checks.
>> +///
>> +/// # Examples
>> +/// ```
>> +/// # use kernel::compile_assert::assert_sync;
>> +/// # use kernel::types::NotThreadSafe;
>> +///
>> +///
>> +/// // Do the assertion in a const block to make sure it won't be executed at runtime.
>> +/// const _:() = {
> 
> s/_:()/_: ()/

Fixed.

> 
>> +///     assert_sync::<i32>(); // Succeeds because `i32` is Sync
>> +///     // assert_sync::<NotThreadSafe>(); // Fails because `NotThreadSafe` is not `Sync`.
> 
> Can you split this into two examples and mark the failing one with
> `compile_fail`?

I've tried it with `compile_fail` and it didn't work, I think
that's not supported in (kernel) doc tests yet. 

> 
> We also could provide a macro similar to [1].
>
> [1]: https://docs.rs/static_assertions/latest/static_assertions/

You mean the `assert_impl_*!` macros?

That might make sense, with macros we would not need to write
a const block to ensure its not executed at runtime (although
it's probably optimized out anyways). It would also mean that
we won't need a assert for every Trait, which seems nice.
So a macro sounds pretty good to me.

Cheers
Christian

