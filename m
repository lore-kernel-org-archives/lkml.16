Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59009154BFE;
	Sun, 13 Apr 2025 08:55:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744534541; cv=none; b=UdFhRt0TgyrnaLyXL6welpcksbnIWSB0J23V5XehnJckXW4ujHMW/k54TJXS54T7VPsiL2pZi1GKtEW8ovl2KVGXHuOQr+PI9v56F8BH7ezAIdjVPucjbvxXKkwmYX08Teh8MiX7utOT3exhCDBGW/pJCUtqJrcU3vFkvA3naDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744534541; c=relaxed/simple;
	bh=+wo9RaNBVDU/b9XhfnG262u4Tw6za9c1Ep15qE0baOU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QwHO2wwyt3IcRPocF0DiJjmWkhaU9tF8rymg4lkiz3pOLbIdrQ0gWybWMEDdOO5rxGxaKg/T/7gFKPg8+LwGGIHDvh8kR6yMiFlbj1qeE1c9yFEvFQ/2cNyYdBr2Wp28T/0p8Wcda1MrVi0AlV7g7Sn9QTe9T8q+5DRCcsbxO4A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LGm2nunN; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LGm2nunN"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ac2a81e41e3so603462966b.1;
        Sun, 13 Apr 2025 01:55:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744534537; x=1745139337; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t3uJhHWX+KNq1YVGafenNTspGo0zv9SvFXEAHqxC9Yo=;
        b=LGm2nunNMTZI3mLwt50pC6xUdv1nnnvfNwrPuHEaYAupBjyFTC19ZZJT+1ky5RsslC
         y8iGtglpYovNKOUHSfR6jGw/MWcbaiXYUqw+sxzX9cdgxf7BhfCI3RzHphGWpMefq2zb
         KXKNDx/r5LpzBzfZRjKMCjpXh6TBtrzkQgeibNm9/PlQQ08pIJI7a1HkwkMjLTzaghem
         8dih54gTme3Gyc+Sd1yui7XJ1JcDnZhoXSNaiAjZQDJactMt4bb+gAYRgInbsFWXZzWb
         +9NPFFOm6OVnq+w/LgHKruAGhFp95k5fzH2nIT4aYba0Ldr0ixVdikGM3gYmL9qg6P6Z
         hc6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744534537; x=1745139337;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t3uJhHWX+KNq1YVGafenNTspGo0zv9SvFXEAHqxC9Yo=;
        b=YEYg3PM85FDyUfaB196HB+jdHLHcbjLm8jleD8cF4geCZAoRJ/qBSMSD/DGtBK6YKR
         Qqb6EG2ZzNg9q05e4002hRfeCo/XKwGkASLO+ovKl4EHE2N1gZI8u8zBOro8SU6WAhHn
         /Sg2L2TkT+p5+6a0A5j+9ZZF0R2e0n2i4notX01/cdMaKu7RnXvn7Bg0jZAMuv/z9lPg
         O3CHySlxAArYaSPEBLM3oITPp9X4UwaF/MLtXZBbn3cyu1losgOcjAyizizgSfzFuqHV
         I2Skjv9p8Azw+la7JQHtzmJ1uRs9kcVdiM1QkOeqJt/KhQD94dasV2a+0vEtp7hyXvSC
         Qieg==
X-Forwarded-Encrypted: i=1; AJvYcCU68eJeAficLTyNLEgjuBin3sETkX9fxhj+czOvLp16+2BfhPhbWqs0pmBgi3igemmBDMQYV0I1RrJLbYdLZ9Q=@vger.kernel.org, AJvYcCUG94kHwVXaycXGxfcTEBJ8lzYA4nUKeHLLckaHOZTsY2Vu4xaaD3Gk/GlXiAQBwmgmpjcB3d9QkBbtmqs=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBIKxeLbqxKX085kt3M/poZIV0OZTY569q29CoxOu4tP9Z0Fjk
	6bguH5USLxlVbgEhsiDczrujp3tt33wwfvrZZOG/SfsA2SVX0Yvj
X-Gm-Gg: ASbGncsl2xbU15L+VpYBLAkCfAn6VSkyqVNSaXDtZckFkGrWeGzIwn3VssCzRZb0Xe7
	hbcTsHHY8dyPQJODrEvcsJ4WXz32k22FYFSm3EUbbCNImCviVLpEuT7zLWNN3P5gpgcb5ISO17C
	LLkVgsDZmBafsO/zDovWhZX4kCc2npdCSQVbHJ+20c3Lgpox59jP1XsWTHYt0Sr75DgOGX8kxOl
	/IZR6+dZmlNNUvOAIcVSQJaEt1j+1fcpbIcdm3mRdd6GKOWocc0hu1h6LynjkrcgHohqjB7AO3T
	+QJF4E1jDwW0ttqx2ZJccp17jDFOub9d7GRTHQoyyT3wQwOWNrxyIcoEG0eCsC4l
X-Google-Smtp-Source: AGHT+IHRxz+/BC9z7gLCXpfRAFJU3B/y+42hhcIcFDshbectWmopRwzmhnV9iCFHH7BwRl72b4OgWw==
X-Received: by 2002:a17:907:72ca:b0:abf:7453:1f1a with SMTP id a640c23a62f3a-acad34fcb7fmr608258766b.36.1744534537172;
        Sun, 13 Apr 2025 01:55:37 -0700 (PDT)
Received: from ?IPV6:2001:871:22a:99c5::1ad1? ([2001:871:22a:99c5::1ad1])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-acaa1be9597sm723678566b.60.2025.04.13.01.55.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 13 Apr 2025 01:55:36 -0700 (PDT)
Message-ID: <c04d3ec9-46f8-4ccd-b0ed-52a1adea11b7@gmail.com>
Date: Sun, 13 Apr 2025 10:55:35 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] rust: Use `ffi::c_char` type in firmware abstraction
 `FwFunc`
To: Danilo Krummrich <dakr@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight
 <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>,
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
References: <20250412-rust_arm_fix_fw_abstaction-v2-1-8e6fdf093d71@gmail.com>
 <Z_p-UoycGk3BceXm@pollux>
Content-Language: en-US, de-DE
From: Christian Schrefl <chrisi.schrefl@gmail.com>
In-Reply-To: <Z_p-UoycGk3BceXm@pollux>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12.04.25 4:53 PM, Danilo Krummrich wrote:
> On Sat, Apr 12, 2025 at 12:29:48PM +0200, Christian Schrefl wrote:
>> The `FwFunc` struct contains an function with a char pointer argument,
>> for which a `*const u8` pointer was used. This is not really the
>> "propper" type for this, so use a `*const kernel::ffi::c_char` pointer
>> instad.
>>
>> This has no real functionality changes, since `kernel::ffi::c_char` is
>> a type alias to `u8` anyways.
>>
>> This used to cause problems on 6.13 when building for 32 bit arm (with
>> my patches), since rust mapped c_char to i8 instead.
> 
> Now that I read this again:
> 
> Isn't it the other way around? For arm32 c_char was mapped to u8, but FwFunc
> expected i8 (since that's what c_char was mapped to for all other architectures
> that are supported in v6.13).
> 
> Can you please clarify this in the commit message?

Ah sorry I got confused because by the change in 1bae8729e50a ("rust: 
map `long` to `isize` and `char` to `u8`").

How about changing that section to:
....
This has no real functionality changes, since now `kernel::ffi::c_char` 
is now a type alias to `u8` anyways, but before commit 1bae8729e50a ("rust: 
map `long` to `isize` and `char` to `u8`") the concrete type of 
`core::ffi::c_char` depended on the architecture (However all 
supported architectures at the time mapped to `i8`).

This causes problems on v6.13 when building for 32 bit arm (with my 
patches), since back then `*const u8` was used in the function argument 
and the function that bindgen generated used `*const core::ffi::c_char` 
which Rust mapped to `u8` on 32 bit arm.

This caused the following build error:
...

Cheers
Christian
