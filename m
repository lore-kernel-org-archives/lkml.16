Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1813179D0;
	Sat, 14 Jun 2025 01:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749866339; cv=none; b=QLYb8PNZ9un3pKErXyBkJHrIE6vzwjXSo5P4S4ixY4piMTecJtUylGQ3eg/WtisPYgnGzCYDcY1Fk+K+9RSmMJJ+OyEKn5cJ5RgUqaP+sGkLqRFrQOqaJNdfCrywfbPUsD5OxFIU8U8fARE6cG7s/gfR2rGcSUZPcZGFwvSUb3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749866339; c=relaxed/simple;
	bh=6CBp9Bt8ciqriMVh1fW/O/ZwDcSTm4fc1epU6lmOQ2s=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=fFRWB69wEmdpdDP58x/G8KT1hagxtvgYckfJtHXimPfTpFoUvgGxbC3fiZN9HaG8Rxm0hpIIg0yiKFAADMLTBQCs677osltUQM+vba3gme8YRSF+bvMQXEXgu1lR/YIZVtDwmE1oZPdMM9tPCozudjWGje1J548cYDFx7M2c41s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jyRHsyQT; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jyRHsyQT"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3138e64b42aso3011510a91.0;
        Fri, 13 Jun 2025 18:58:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749866337; x=1750471137; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Z08wJTlTtpFkwBNRhaimLsvTa8BeRJzKO5CD18XcN4A=;
        b=jyRHsyQTBxMFxP+55EtUh/CAOpFaCShFuX/Xizoa3V59H8SUoiYwyawx619dAdJYRl
         axqycSUqAFgvRjEH/oDdslRRPmgrq14PJMI3sJB8Gkw67rbDZaCDttDKCWQoT4LG5NmO
         RdJlANbn5Ao2uPTuAQMjJzumMFHHUo/1RUPNYd/23VKRSS3IJWDpjjg4SoYuFHfTY3ny
         T7ePzgnsDyOfy9fpQJNynLMDU8LfObSZCR2TlGqG2orm148s7BukL8ztjinyH0hjfq/b
         iiGvZzsrOGGS89an82tAYAzQAMKkJfQ1hTxPpz34LCgBeil2k44D4DrQeBgCVsUWKHYj
         tqjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749866337; x=1750471137;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Z08wJTlTtpFkwBNRhaimLsvTa8BeRJzKO5CD18XcN4A=;
        b=H1sBk2yh6sxVndyy8gn+ECbb2e0wSVxzMqUUpR8mrQG2KiFWG/I58oeLWcl5VDl/4I
         gNGKev6MB2Scj3RNFVDTDBITeD38zUgBqEdEbN/vcL0ChR/WJ66E1IBDAArpW8NdEpUT
         swc4GPQ3t2FFAaN2TrtEK9ojWiga+kL3CazWlLq1sqSf2/XFKRorwOMOok9bZ80qCqYi
         YE2XtPcHvJLG/NOfrSrBSzQnJgVx0Y9bttcoq9lXlp1pz+udHB2rVs6jZM7KYtl00MIO
         p0drHaWiSA7zSpW0jP+hYt8JEMZwrOMMI6CGqUoay7KWCVr6mUofv7HYjM1KXl9SVhmW
         pmIQ==
X-Forwarded-Encrypted: i=1; AJvYcCXsJQ2QfPGK+ILrG+ADMoOuKR3GXMIAWLLN+mPh9YPlf1NYA6jieDmm/Krpan0CPfzzJ70dY3E84obEEuU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzon4yF39TaQcP51x/l4g/W1wjBd2D+dFZvALf2WVInsUkW6fy0
	AM683c7Xe0vm0Yhcp4eNi+ReV2YUFy10YW4rTD4QNiLw7BOXF0Xe+Au5
X-Gm-Gg: ASbGncuIdyRDiGcckVPMLHr4Q1wLZDAshH64ah8qEz/+JBFQAhEN03WOqnWgcHrB+Ht
	NVzEUzSriuB0f14a5BFWQ26Ob9EaLRYCWFrJ2rBatNvj0xwC4qGytm36GvZFVNWKk6g82JCAMDB
	Cnwq1RNMypSirSUhTCLAJhPPYEWAAaZVFiJu0+Fwv901zetbA5UDaeKNOWrE4JOHPDNR/0OCKw0
	hEY5MLpmLy3yCySctsk40RiHHp1bn1AVn9WmTZ8a6qiLrQHhX5l9iRNkPxN8E/5vJwLPakqLkp9
	d5y+N5JChWOnxerXI13R/88wIWZhxmxjOUY8TB5gBlX4lBN5K6VSm/zOsOdUyRiEZO6T44j/X4i
	e7L9sUvtW6Ulm2n0V38rmpvwhwVwZ0WLtD2wWW2P/rOXcM3zY+LE=
X-Google-Smtp-Source: AGHT+IGceoYIxIl92hkMNowp7lb+kcCpYS2EggVlboWxK1VEo+e7txBj0gQ9mtafc+SJi3uCobEBVQ==
X-Received: by 2002:a17:90b:3c8e:b0:308:7270:d6ea with SMTP id 98e67ed59e1d1-313f1d2f830mr2492644a91.30.1749866337251;
        Fri, 13 Jun 2025 18:58:57 -0700 (PDT)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88f46csm21526955ad.39.2025.06.13.18.58.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 18:58:56 -0700 (PDT)
Date: Sat, 14 Jun 2025 10:58:41 +0900 (JST)
Message-Id: <20250614.105841.879936495340347805.fujita.tomonori@gmail.com>
To: lyude@redhat.com
Cc: rust-for-linux@vger.kernel.org, a.hindborg@kernel.org,
 linux-kernel@vger.kernel.org, boqun.feng@gmail.com,
 fujita.tomonori@gmail.com, frederic@kernel.org, tglx@linutronix.de,
 anna-maria@linutronix.de, jstultz@google.com, sboyd@kernel.org,
 ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, aliceryhl@google.com,
 tmgross@umich.edu, dakr@kernel.org
Subject: Re: [PATCH v5 7/7] rust: hrtimer: Add forward_now() to HrTimer and
 HrTimerCallbackContext
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20250613232754.451450-8-lyude@redhat.com>
References: <20250613232754.451450-1-lyude@redhat.com>
	<20250613232754.451450-8-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Fri, 13 Jun 2025 19:22:28 -0400
Lyude Paul <lyude@redhat.com> wrote:

> Using the HrTimer::raw_time_cb() function, we can now add an equivalent to
> hrtimer_forward_now() to both HrTimer and HrTimerCallbackContext.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> 
> ---
> V2:
> * Change from Ktime to Delta
> * Make sure that forward_now() takes a mutable reference to the timer
>   struct
> * Reword this to point out that we're adding forward_now() to both callback
>   context and mutable timer reference
> * Rename interval to duration
> 
> V4:
> * Fix rust documentation for HrTimerCallbackContext (forgot to update both
>   forward_now() declarations)
> * Use Pin<&mut Self> for context-less forward.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> ---
>  rust/kernel/time/hrtimer.rs | 58 ++++++++++++++++++++++++++++++++++++-
>  1 file changed, 57 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/time/hrtimer.rs b/rust/kernel/time/hrtimer.rs
> index 79d86e1099a1e..0908359b0550a 100644
> --- a/rust/kernel/time/hrtimer.rs
> +++ b/rust/kernel/time/hrtimer.rs
> @@ -201,7 +201,6 @@ unsafe fn raw_forward(self_ptr: *mut Self, now: HrTimerInstant<T>, interval: Del
>      /// - The caller must ensure that the `hrtimer_clock_base` cannot possibly change in the context
>      ///   this function is being called in. This means either exclusive access to `self_ptr` is
>      ///   required, or we must be from within the timer callback context of `self_ptr`.
> -    #[expect(unused)]
>      unsafe fn raw_cb_time(self_ptr: *const Self) -> HrTimerInstant<T>
>      where
>          T: HasHrTimer<T>,
> @@ -243,6 +242,44 @@ pub fn forward(self: Pin<&mut Self>, now: HrTimerInstant<T>, interval: Delta) ->
>          //   exclusive access to it - fulfilling the requirements of the C API.
>          unsafe { Self::raw_forward(self.get_unchecked_mut(), now, interval) }
>      }
> +
> +    /// Conditionally forward the timer.
> +    ///
> +    /// This is a variant of [`forward()`](Self::forward) that uses an interval after the current
> +    /// time of the base clock for the [`HrTimer`].
> +    pub fn forward_now(self: Pin<&mut Self>, interval: Delta) -> u64
> +    where
> +        T: HasHrTimer<T>,
> +    {
> +        // SAFETY: `self` is a mutable reference, guaranteeing it is both a valid pointer to Self
> +        // and that we also have exclusive access to `self`.
> +        let now = unsafe { Self::raw_cb_time(&*self.as_ref()) };

To the current time of the clock for the hrtimer, would it be possible
to write it like the following instead?

let now: Instant<<T::TimerMode as HrTimerMode>::Clock> = Instant::now();

Then we can drop #5 and #6 patches and remove some unsafe code.


By the way, where can I find the latest rvkms code that uses this
patchset?
