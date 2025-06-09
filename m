Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29BD2382;
	Mon,  9 Jun 2025 12:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749470501; cv=none; b=YL4R5CQV8Nn7wqT/KQZISUr15Aa21tIj8FTC5JqpJ5OqTnnkxOcB46UWMoNO3ZlxLC1lUyJ99lOS3YxUEPz4rM1SbB1KcdBFRfLlMq2NV6vQZP/H+mjVX+tzszezcLXDlJ0wDMojn6lrNFeaVanywq32/iI2/uKS+4pe4dyOVE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749470501; c=relaxed/simple;
	bh=RBxOTcJhhrzt0ZnnH+TLqSQVWbFPgWTR/L/+mnlC9SE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=J7c5Aw58ZFBKKWWGYHVWhhgFTpMSFKVwPaw7ordo6CaOTGb1NJhDN3QfcqrPqUQWbyoWifvIQVGXRIznW0IQGhbdMX21Xp1+36VPc5zbNapEumfQQ8odB621dahiRgplLEGrZnWpmTsk1lUvzm/3szAypOTf0o5bFu1DAz+kuKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LJYKg4lq; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LJYKg4lq"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-313862d48e7so180616a91.1;
        Mon, 09 Jun 2025 05:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749470499; x=1750075299; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CJ3pVORQnKMkcdSsnA9ZmKrDQqlQt1ksdLlFD2rYdGU=;
        b=LJYKg4lqkG+kJFLb1qj1+A6lITAus7jzyy42RFrrnmJPkFzFLJv3xvi5JwGHL67Pbj
         CZ31j8mQYXqOfcuP1ke6nyIrohbY1AVeDx/IJEHg4qhEglR+5mLX4CHGgus+VfD5kJ6d
         SLRptSrNDhMWGRGwwY4rQMBbOOgBp6nUGUK8CY69xPc964PWZ1P+t/wSb2gtRYqSMMTC
         VFjXBiQmNoaTyjrd9HMDmSC6BRGFlWjiNnEdiDnxp+5/ZlMSCRrm7GnjzsCgnq0DArKE
         s+TLvHMpt9Orauq8/XB+/vmPWkbj8e119FE0xV7lglLBL5K5MfN7wbG3n5VcrHKLapcN
         9m9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749470499; x=1750075299;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CJ3pVORQnKMkcdSsnA9ZmKrDQqlQt1ksdLlFD2rYdGU=;
        b=n8xnAidFyGRgE2MdB/JdLQW0KGRECMBKorFjoenVOrs+uGj3nVL5e/STH/xXSzebfZ
         dOzOQ2IH1OGNbjiSHegO8a2Dpbt34mIe44Y6rmX9/KzD0mxWzAqDpHMjOz0nKR9XnPz2
         CzMdV5TytdonDHxTR7AUzK8L8csTXYu8Oj+fgBv+sfCFVksE619IFfPw+siCJv9PBbCy
         HSysbfKhGhdIgy31AXrqIZk8o8XtVgQ5wAEGKA9Ki6wuty95ufK5AiDV+Zm+VVS1+q/g
         IQuEiz0mXBk4hCAiYy19CSCUs82o8pdsW9p+Oz0olQcFuJz/Vseuddz3i/r2rllEC6Ky
         2SUA==
X-Forwarded-Encrypted: i=1; AJvYcCUVv3ydvFx+nuKhU9zTB5gpG2QdZWoUaD+oONyuj8R5jNDQQm4VeRbeS6LhIusM4XWjEXVpdCTOLO0Z9Ro=@vger.kernel.org, AJvYcCUZcX3pdF5QO3vEnBLnYGTjdPr3tk2u59XZB3IG79AemIcmmUKjgySFhRBwT8M5vKo/4hW9lHGHez1e08r+1SI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3aM0ucpQ5tp+eoHwx/Du/SKOzZ00FkeVsh0FCUCB5AzyswZie
	Q7AxBojiGL0v1gWaQiK+qfHBBKfriireVfbI+EvqliGEUxGd/TOJVPnvRddpp3i3G/kvKzkvQIq
	hCSG5TYeD0MLlVWco3/xzn5t0TwsRI84=
X-Gm-Gg: ASbGncvTu+Y1nRL1ye0/NB3hRO9iIyq1GeTZe4WXxfl87jB7kc3gQ4mznrYeGIXVxuX
	6gOc3XzjgkGspgij+0dXcUVNqFzGBEtZFEXbTkhxGXQllhRPUlAMS3pyZPErwQGtS3Rf91ZymHC
	I/x5kvNVs++pskmMHzmkQeQ3Fhr9QJvX2pw/y1DDRMBsE=
X-Google-Smtp-Source: AGHT+IFDiooCewoAVyrc9USV6CJWO5M7EqUq5QVYDljr877OMz/OE3d9DxXhO6iXunBKqXCi59uyl7U8gEm4usO3tYo=
X-Received: by 2002:a17:90b:3a87:b0:312:db8:dbd3 with SMTP id
 98e67ed59e1d1-3134e422457mr5734745a91.6.1749470499127; Mon, 09 Jun 2025
 05:01:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749463570.git.viresh.kumar@linaro.org> <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
In-Reply-To: <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 9 Jun 2025 14:01:27 +0200
X-Gm-Features: AX0GCFvEXDEQo6kuyaEeGMJWPKY1Qd-vTj3E9Kxvzj4d0Y6fTnapDlXdd8jIRm0
Message-ID: <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Yury Norov <yury.norov@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 9, 2025 at 12:51=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.o=
rg> wrote:
>
> +/// Represents a CPU identifier as a wrapper around an `u32`.

[`u32`]

> +/// # Invariants
> +///
> +/// The CPU ID must always lie within the range `[0, nr_cpu_ids())`.

I think we can simplify to "ID lies", i.e. "must always" is not needed
(but we use it elsewhere form time to time, though we may end up
cleaning those too).

> +/// ## Examples

Single `#`.

> +    pub unsafe fn from_i32_unchecked(id: i32) -> Self {

Why do we need the `i32` versions?

Is it just for `bios_limit_callback`? If so, I would just convert there.

From a quick look at the C side, it seems that could be an `u32` -- I
am not suggesting to change the C side now since we don't want to
complicate the fix, but perhaps something to consider in the future,
assuming there is no reason to have a signed integer there (e.g. an
unsigned integer is used in the policy struct).

Relatedly, why isn't that callback's type `c_int` on the Rust side?

I also opened a "good first issue" for a docs bit:
https://github.com/Rust-for-Linux/linux/issues/1169. I can open one
for the C FFI types if you think it should be changed.

Finally, can we add a `debug_assert!()` on the `_unchecked()` variant,
since it is something we can easily check?

Thanks!

Cheers,
Miguel
