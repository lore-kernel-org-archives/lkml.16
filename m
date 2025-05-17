Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694E11F4C8A;
	Sat, 17 May 2025 11:36:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747481816; cv=none; b=moxJO3qUJrr75X+dO7GkoRI3ayHCZA7Al/ApobaKprBb2a5qZCApWfohYSxhRtjMqI2n3jkQJSPKKgdSWsRzQ8QkBpPMrjjzZ7AXYIjmGdangGm36hlzGrcsNHjQUNhSHV3kkgCTR03w/LVdBCsN7dJGsfWCWL9+w9CDwnXkuVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747481816; c=relaxed/simple;
	bh=pSoqKGnGc2p0krSYaAJD10+6QUEoAx6Simgs84ngQjE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s75gN0Q2GFTWim2nEXK4EDVCGV2YU9MwimF96H42LKXk4bKSFbuZw/sood5lrSUwqa9VL0uWmyI0+fsb7FDHGO5Kc3iMxaVWPdHSU7tSLCA9EgJ5kKLb+uD2RrEUZD7tRDdugbzfntpIqjKVvISDd3aBnVkOlvd8cqCrbG6oElU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8+Ir/a6; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8+Ir/a6"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-3a0adcc3e54so1855522f8f.1;
        Sat, 17 May 2025 04:36:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747481812; x=1748086612; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=z/SBkgLGN/MrxOQ9/67Ws3va/xYrNBLPShBPDYKH95A=;
        b=j8+Ir/a6YvQq+sidHpI7CDNmisvesYPJcRt6BzDxQgsboyGJhz/tboWmvr+WAyQTsk
         570bNKn2ppKmtgVVqNf6dNTBlOs3xfWTvy9ur7gVp/U+iJppngqn5Ox6lKnTiKiNDq1G
         sQaDDZgzYooV2hIrT5KfUU8/JyCeRTxkvDXKBAGdCniL5Ax5ssA6sTaLGjK+BO0YiMPK
         7x0zq6Tz0u+L5vDOd/lsTOSQL6+vGpTDU085cY+wE0/eKaYBa/+DUYqy3FXCRcs2W7VW
         POosHRBp/DQz2u2dFCOypl2n3iDVjEt1xVYD72pzEZjI9oTTI1ox29HY9QIcXlLOCyFn
         f3AQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747481812; x=1748086612;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=z/SBkgLGN/MrxOQ9/67Ws3va/xYrNBLPShBPDYKH95A=;
        b=A1H8YNyfeCbJMIf2eGE1LS4F5yDCwnfvIYHy59WMnf+3Go2peRmUtY8mk5mJtPSt7q
         yqkFhIEvmk7MVgZP1g5o7BfHiBZTCrpg2qBHZVS/Wy6bopSYcsiSzRfwQexDP3XETJLP
         i/LbuyaCfkjphcc8m/G7pdSmYiU3DCDQP3phT1vrqS0oswENxjCi6xFTFgUm4JftQv0c
         V9sYJ5ZVzgERGjE240kCbhjrr5h2w53sjo5dAQ9jRPwKXyO79IzeyD08ImnJYKDndmkn
         Iy8xA51geoqyQjs7ulIdxAe+7n/AmNlSBzGSVdS3mkl273EAjc3SaI86vux68blPDuKU
         bzWQ==
X-Forwarded-Encrypted: i=1; AJvYcCV04RzvbhsV2lhNpQTqLy1pKXhXzcBHH/3B3Cv7GYRvQGg83zO+ZwZ+E9/l1JkugT7MBt7j8LQQKOs4az9wUQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzQmQDUGyC+7LmwzPzB/RifSl6zD9VFBSu+gcSBGcPwGGrvRPNr
	KgBNoG8qbapt58OSq3WfRC6qml1QeVc5UWPIzhZYh03OoPFpBysYR4/m
X-Gm-Gg: ASbGnctoimkNHhTILNQoBM22JCD12IfRuUOphFQWbXPwLZ2nXE4ef/6wIHb2YlSyQiI
	5oUaL+VgHSd5rMPX5YzI9AB1qzTMceakEBCih2kh1nFVMBSskxZvLihEonoaNIfdaKOXQ7ncTKn
	Wpau1YTWMC/n+jSrXNUlynfy1b2vA7UAMLkUx2YTcWKHABsT0pbMR6J/105K0J3Aers1ecCz2wq
	pr2uhVo5y7hvMa9UumNpLmJJuGw5q7Ya6ywaS0hW0QnS+wUMgbyx/qXWHbjMG7b/ZIl7huZ4w5P
	dQ7I/iohTAXjonMchkozN2iX+6ZCTuJzzz8Kl5vbdiEnNgYOynkaR2l54i08d3YN
X-Google-Smtp-Source: AGHT+IHboaz6cQmQDpSINZLHFCnqDghYEBpSBtLox8/4UmeCSrlpNWFx/umCN9OyzxZOPBm2l3mORQ==
X-Received: by 2002:a05:6000:1866:b0:3a3:4a1a:de6f with SMTP id ffacd0b85a97d-3a35feab1bdmr4932224f8f.26.1747481811545;
        Sat, 17 May 2025 04:36:51 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::171c? ([2001:871:22a:99c5::171c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca8d005sm6063226f8f.90.2025.05.17.04.36.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 17 May 2025 04:36:51 -0700 (PDT)
Message-ID: <19fc74f7-b292-404d-a48f-4dc3bcb5af3b@gmail.com>
Date: Sat, 17 May 2025 13:36:49 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] rust: add UnsafePinned type
To: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Sky <sky@sky9.dev>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 =?UTF-8?Q?Gerald_Wisb=C3=B6ck?= <gerald.wisboeck@feather.ink>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 llvm@lists.linux.dev
References: <20250511-rust_unsafe_pinned-v4-0-a86c32e47e3d@gmail.com>
 <20250511-rust_unsafe_pinned-v4-1-a86c32e47e3d@gmail.com>
 <D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <D9VBVURZLSNT.4BTQQ8UCTGPJ@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Benno,

On 13.05.25 10:51 PM, Benno Lossin wrote:
> On Sun May 11, 2025 at 8:21 PM CEST, Christian Schrefl wrote:
>> `UnsafePinned<T>` is useful for cases where a value might be shared with
>> C code but not directly used by it. In particular this is added for
>> storing additional data in the `MiscDeviceRegistration` which will be
>> shared between `fops->open` and the containing struct.
>>
>> Similar to `Opaque` but guarantees that the value is always initialized
>> and that the inner value is dropped when `UnsafePinned` is dropped.
>>
>> This was originally proposed for the IRQ abstractions [0] and is also
>> useful for other where the inner data may be aliased, but is always
>> valid and automatic `Drop` is desired.
>>
>> Since then the `UnsafePinned` type was added to upstream Rust [1] by Sky
>> as a unstable feature, therefore this patch implements the subset of the
>> upstream API for the `UnsafePinned` type required for additional data in
>> `MiscDeviceRegistration` and in the implementation of the `Opaque` type.
>>
>> Some differences to the upstream type definition are required in the
>> kernel implementation, because upstream type uses some compiler changes
>> to opt out of certain optimizations, this is documented in the
>> documentation and a comment on the `UnsafePinned` type.
>>
>> The documentation on is based on the upstream rust documentation with
>> minor modifications for the kernel implementation.
>>
>> Link: https://lore.kernel.org/rust-for-linux/CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com [0]
>> Link: https://github.com/rust-lang/rust/pull/137043 [1]
>> Suggested-by: Alice Ryhl <aliceryhl@google.com>
>> Reviewed-by: Gerald Wisböck <gerald.wisboeck@feather.ink>
>> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>> Co-developed-by: Sky <sky@sky9.dev>
>> Signed-off-by: Sky <sky@sky9.dev>
>> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> 
> One nit below, with that fixed:
> 
> Reviewed-by: Benno Lossin <lossin@kernel.org>
> 
>> ---
>>  rust/kernel/types.rs               |   6 ++
>>  rust/kernel/types/unsafe_pinned.rs | 111 +++++++++++++++++++++++++++++++++++++
>>  2 files changed, 117 insertions(+)
>>
>> diff --git a/rust/kernel/types.rs b/rust/kernel/types.rs
>> index 9d0471afc9648f2973235488b441eb109069adb1..705f420fdfbc4a576de1c4546578f2f04cdf615e 100644
>> --- a/rust/kernel/types.rs
>> +++ b/rust/kernel/types.rs
>> @@ -578,3 +581,6 @@ pub enum Either<L, R> {
>>  /// [`NotThreadSafe`]: type@NotThreadSafe
>>  #[allow(non_upper_case_globals)]
>>  pub const NotThreadSafe: NotThreadSafe = PhantomData;
>> +
>> +mod unsafe_pinned;
>> +pub use unsafe_pinned::UnsafePinned;
> 
> I would put `mod` to the top of the 

Your sentence was cut off, I assume you mean:

> I would put `mod` to the top of the file.

I can do that, let me know if I should send a
new version or if this will be fixed when applying.

Cheers
Christian
