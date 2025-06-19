Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32EAE2472AE
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 06:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750316238; cv=none; b=S9m9+7cQZcyof4PRC82nqQnVuZ4zr+X/+JJNCbWrZfNeZ93E2LBG5UxMwPNbuL8Vm9HOoeBuQPoHlrFUHNxK1nNjpXlK+xXm4k4ynOhnUUiv8JY9F9e9qIEyQGuqQvQSFatVwgOF8DkdP/2RW3CF8O2UD1Q3/gtuBmOKk3covM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750316238; c=relaxed/simple;
	bh=ZpxBiFvNTV24CakR+gqDkbfEBqa7hfmTQr9mkfpyNqM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFD7ZFksXU8Gpo7QCL6kgav/i0HxDB4yQVXE92D9mdK/fBX3zQzNg5LvOGb50RI0xd+D/z6dKBergYWQkvG0jzntJkR78SXTXUJIJw8G/txTFHWGgbGyZ5cxiDaVeaAUzUoNHYXG1GQcsEAdqlWgmiC9QtYNTrP08W1qtEWeddY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=a+iB4PHa; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a+iB4PHa"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7424ccbef4eso315655b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 23:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1750316235; x=1750921035; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3wXDhrb5gMp7gMf4JCS4TNzFLsoHKLLOownJ0Qkmwik=;
        b=a+iB4PHanVN5l90XLRyePv56zs7x0oatjruNiR0U97qR/EKHqQYihxWfQ5D9kX38AT
         jX/dkTGQGp+0hOZLu/rl2FPD6DUTr3ztK7uSU07PPNeZAwi5FKVrGkJyS41q3bxQut/y
         LFiB6CI5B3EM1YZIC2KiNuIRQZPCDy4jDBxHZBDPR/4NtuxQ7u6KKMVtzknTiuxAR1ts
         8JupLugUd0VRRtt8m0g3CWS99Abc5VWD8o+9Gympq6XKbsn2/F/4ywi9r7OCawo8LBDh
         ZZdTF2gX7nnJw2WzmtaDVdFcdqHqwqyZALgQXHb5EZj69Bm/2LF02BLNL8bobUXJ2KpZ
         NI0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750316235; x=1750921035;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3wXDhrb5gMp7gMf4JCS4TNzFLsoHKLLOownJ0Qkmwik=;
        b=a52Rl6R7An/Ps5FWkbwF37NByBfB29N/kVbjrYpBmRpFIOgDmQiXF3WlKSdu5q4UVP
         cp1HHTEr/yZh7MtGNbCv7RF8BapS/wvX4xACB4eq225pitO0Kt21/vAF8LtP4zTQ+mHk
         Izg/r4G/40NE3pdcBYpCbvbW3s9+bN8M/GJQBeziO2Ziqj1jPWipbVSw7bVn/C2aaiSx
         f2qNtqUn7pfZVplQFg5wbYP/6BZ9JjFWPXWuRuBEIs+VgLtDl9OXWlq7Zv+hXh++1dtZ
         EKR6KCv96I2HHIRfsjeo09NE3T96s3/Mg3HvSDAu+cw+EHkTDpimXGz3dJVsU6rWgzdS
         JuhA==
X-Forwarded-Encrypted: i=1; AJvYcCVqTXh1nGJSycJu6oOiA7CEOpIF7ssvPrvERJTxJ7yncY8p6UJt+N50R0IfWwox4WzaQ+crVpIYkLMV83c=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyg/rNITYh8tBKwXT0X0EVbyDwb9bUTW74TvEFt87dCKEgKZ/5Z
	HkwvoLikaeNAT6Xo9hdCeLRUS3v2l6+A0kBdkTvOxusI4UEEBVyXobrRBGDbcKTp1bQ=
X-Gm-Gg: ASbGnctfBqauY1gAxhpgEflHnaPiXyI1YNjOunia0RSB0Lgrp8jF+gGssWHZOM7vROq
	thRZxQmBShpv7nip851bNdwxSPB1OxFJr8/SNPxvAiuHlOZUd9ZPy3KzYDzA+QtqZKa0c8Vvylp
	VBkq3DLR9j7ipgy6WRshhLVQNF/esZ8kCG0mLwXet0+AY7Dh7cvJvWES5sdPyU+HLX6558AyI+V
	/9kfsbmHitWnLYAGGwFOdKv1vvCU84eo7aMHraavsh47RrDDTWvNfbmYJ3sCqVf+suCWystBGCX
	DIy8WBxSHBQEWTzy6GINgSnCRbHWA/WJe364pmrcuVykR+G2BGSGicXW4z9Ya60=
X-Google-Smtp-Source: AGHT+IGlUdbrNrLWErrn0rW+WYn9rsrB56pXxkDz0+uZxdgPmgRSJkVrVTE8T9ZZyrn/M1TvSJEAvw==
X-Received: by 2002:a05:6a00:3c89:b0:736:450c:fa54 with SMTP id d2e1a72fcca58-7489cf8b19amr26442033b3a.6.1750316235484;
        Wed, 18 Jun 2025 23:57:15 -0700 (PDT)
Received: from localhost ([122.172.81.72])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2fe163a199sm10414785a12.5.2025.06.18.23.57.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 23:57:14 -0700 (PDT)
Date: Thu, 19 Jun 2025 12:27:13 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Abhinav Ananthu <abhinav.ogl@gmail.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-pm@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] rust: cpufreq: Ensure C ABI compatibility in all
 unsafe
Message-ID: <20250619065713.hm5ye2uhikaei2xo@vireshk-i7>
References: <20250613101815.18092-1-abhinav.ogl@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250613101815.18092-1-abhinav.ogl@gmail.com>

On 13-06-25, 15:48, Abhinav Ananthu wrote:
> Update all `unsafe extern "C"` callback functions in the cpufreq module to
> use `kernel::ffi` types (`c_int`, `c_uint`, etc.) instead of Rust-native
> types like `i32`, `u32`, or `usize`.
> 
> This change ensures that all Rust callbacks have signatures that are
> ABI-compatible with their corresponding C counterparts, which is critical
> for FFI correctness and safety.
> 
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1170
> Signed-off-by: Abhinav Ananthu <abhinav.ogl@gmail.com>
> ---
>  rust/kernel/cpufreq.rs | 26 +++++++++++++-------------
>  1 file changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/rust/kernel/cpufreq.rs b/rust/kernel/cpufreq.rs
> index 11b03e9d7e89..481a6d2dc362 100644
> --- a/rust/kernel/cpufreq.rs
> +++ b/rust/kernel/cpufreq.rs
> @@ -1207,8 +1207,8 @@ impl<T: Driver> Registration<T> {
>      /// - The pointer arguments must be valid pointers.
>      unsafe extern "C" fn target_callback(
>          ptr: *mut bindings::cpufreq_policy,
> -        target_freq: u32,
> -        relation: u32,
> +        target_freq: c_uint,
> +        relation: c_uint,

I think the one in prelude points to core::ffi::* instead, while we
want to use kernel::ffi::* ?

Miguel ?

Also why does prelude use ::ffi::* instead of kernel::ffi::* ? I was always a
bit confused about it.

-- 
viresh
