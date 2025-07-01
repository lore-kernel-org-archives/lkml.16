Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com [209.85.128.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D7AC274B2D
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 14:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751380279; cv=none; b=LsPqP8u6iAmNViBTFSVwr2UVn1mzOChicDO9rtcHh2j4+qAADDxf7SzrNQRiTWY1Q7xx1R3uwYAfPAXplqhtALxaMXE9IyCrI1S+4VUBs6OnopWmQx1cQddcf0cdMwWG2c1YNCjpZXibcnp/ZwN+kaPWlvEvJHXP6GgaIsMwf7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751380279; c=relaxed/simple;
	bh=Vyaw3SbBUxgSTTI9AeYN82yvnlhmafU1DKbDbWX2Gxg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q9+opt/bV5hUDDgTX3JGkKFnb/LN81eR0T9tupOlFKjYPdjDAeeNlY6/TRFHdLfJt6mUWrxYNgpqahoXsOzeiRZZMmP+2tt4DQCFpsOpECgH3Aj9sH7Hn5p2U+2TQd/wl9IEWOdTBvoNma8vEsWBtP7Tvdr0eZzlcUD5YXvJR/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=efF7AS6P; arc=none smtp.client-ip=209.85.128.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="efF7AS6P"
Received: by mail-yw1-f180.google.com with SMTP id 00721157ae682-70b4e497d96so35328597b3.2
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 07:31:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1751380277; x=1751985077; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=TQpP4/sk5UISbR4PxoNCsU4Q55EXCGohsAJif2KUhLk=;
        b=efF7AS6PoWTQN0bacqPpWZORTkzqbQ0o5sEhaPGgu2BWKgVGSDb2joWMl2mhLzIvmR
         x0UrlBfaicNfLJCdFnGTiVSNtedEPVOgTklmN3afXi9nlyEZ/3laMY2ZgrNyMmgh5aM9
         eelL1DOS/VwiyS7g84uRnfbJ7ncDB2WbqBI6rNYhJOsgQV9foagkOJxmrDVmMuL3Qwrp
         nA4i6DUL8hAS0czzXUcA6O0t1taDngCZ4sqy/p3d6bG9J1QgTkCMrGBSH2zwAI4RVxcN
         QiN/459QpyuicB972tjp3tGTzDh6D4iGk3812KjybHoEuzaaNJf2CUBKBQWxLIDJkd4s
         kVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751380277; x=1751985077;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TQpP4/sk5UISbR4PxoNCsU4Q55EXCGohsAJif2KUhLk=;
        b=aALCsGxIdCbEFa4M+B2QTnIoujASDLkew+1xAFLbaEVrDgE2n9STbN+qQo+WucY/Zp
         M5t8F2UqOgdDl+Cf5kIRb80EWszzbmVpksNZEBzRQPvxm43I1hB2mDHb6cNN/YfG5bkL
         7Qku4viVhvhB0J5Q0Ov1196txaeTn8QjNTQNgdT1XYDkOhEtnD72XMCPEN9AboCyHCTM
         OdtvkqnXcLyByiRrw+xXrUSwInCgkaas/j5ZNmC6aOgcI5JKhSADOWScXbKnOgkBxDnT
         bmRJxJGKMXVNAamFPZAwWHsT9gMaLWNl1ZR9HIde9M38rNEQosJFgH+pyc7+ArMrr9do
         9eTg==
X-Forwarded-Encrypted: i=1; AJvYcCUE9+7mgEqEULju5Lx76ceaXOIiVtIdDIiSnAShAyRU3XIJ3okay83ajYrcIpQidJ3Bd021Tsos0c+hWOA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwMo1TwCzv2w/1kUShv5bXQZt2sRVnedCrFMZqUlp+Ji+cpjn2p
	g4Cl2eKVF8ABtfcwkWK6hFmgUX4ACrtTrQVoTnKAB55LQT0T/AxaUtxmMKuH/gBiH2JABH8w+3O
	MekqNBT2oik2mZ/zJWnVCCrfPWq28nWbeWVrpsal5mw==
X-Gm-Gg: ASbGncswGKUBWT0kcp7tua0Qt4BQ6WQKnBv5xBxGkHNxlYbRIyW/Cv+fHzeKYwmBXnI
	vNnzlKy2M3jTKUU42j/xZ/NBDGuiNf++N8waqh61pGQNyWwyOszCQLJ5n69D+LRKNF1bOJK0S8g
	CBwCsqPux73uI1TG2mekSrJdeJqNrF/YQqUUVfZNnQ6KM=
X-Google-Smtp-Source: AGHT+IHLzuypKr5+dQZzwd42pEKbEhbfN4QvfGGBYNmqENm7MgpYzk7kFsFxKSU9PQLvgxInKK0kKJIRrLIS9ZY0Xrc=
X-Received: by 2002:a05:690c:f8c:b0:70e:2246:1999 with SMTP id
 00721157ae682-7151718b978mr245629467b3.21.1751380276931; Tue, 01 Jul 2025
 07:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250701142313.9880-1-terry.tritton@linaro.org>
In-Reply-To: <20250701142313.9880-1-terry.tritton@linaro.org>
From: Terry Tritton <terry.tritton@linaro.org>
Date: Tue, 1 Jul 2025 15:31:05 +0100
X-Gm-Features: Ac12FXxLXB1RyvUmPau1KOm3_EHbxZPmugbEEKi4qfRF9Vdw1FA3L6wYKz2GY7s
Message-ID: <CABeuJB3QYKqEb2YZjCicGVFkrZTCgdU+dMM90B6OHUuvUSrWaA@mail.gmail.com>
Subject: Re: [PATCH v2] selftests/futex: Convert 32bit timespec struct to
 64bit version for 32bit compatibility mode
To: Thomas Gleixner <tglx@linutronix.de>, Shuah Khan <shuah@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: ttritton@google.com, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Wei Gao <wegao@suse.com>
Content-Type: text/plain; charset="UTF-8"

Sorry forgot to save the change log before sending.
v2: fix Signed-off-by chain

On Tue, 1 Jul 2025 at 15:23, Terry Tritton <terry.tritton@linaro.org> wrote:
>
> Futex_waitv can not accept old_timespec32 struct, so userspace should
> convert it from 32bit to 64bit before syscall in 32bit compatible mode.
>
> This fix is based off [1]
>
> Link: https://lore.kernel.org/all/20231203235117.29677-1-wegao@suse.com/ [1]
>
> Signed-off-by: Wei Gao <wegao@suse.com>
> Signed-off-by: Terry Tritton <terry.tritton@linaro.org>
> ---
>  .../testing/selftests/futex/include/futex2test.h  | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>
> diff --git a/tools/testing/selftests/futex/include/futex2test.h b/tools/testing/selftests/futex/include/futex2test.h
> index ea79662405bc..6780e51eb2d6 100644
> --- a/tools/testing/selftests/futex/include/futex2test.h
> +++ b/tools/testing/selftests/futex/include/futex2test.h
> @@ -55,6 +55,13 @@ struct futex32_numa {
>         futex_t numa;
>  };
>
> +#if !defined(__LP64__)
> +struct timespec64 {
> +       int64_t tv_sec;
> +       int64_t tv_nsec;
> +};
> +#endif
> +
>  /**
>   * futex_waitv - Wait at multiple futexes, wake on any
>   * @waiters:    Array of waiters
> @@ -65,7 +72,15 @@ struct futex32_numa {
>  static inline int futex_waitv(volatile struct futex_waitv *waiters, unsigned long nr_waiters,
>                               unsigned long flags, struct timespec *timo, clockid_t clockid)
>  {
> +#if !defined(__LP64__)
> +       struct timespec64 timo64 = {0};
> +
> +       timo64.tv_sec = timo->tv_sec;
> +       timo64.tv_nsec = timo->tv_nsec;
> +       return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, &timo64, clockid);
> +#else
>         return syscall(__NR_futex_waitv, waiters, nr_waiters, flags, timo, clockid);
> +#endif
>  }
>
>  /*
> --
> 2.39.5
>
