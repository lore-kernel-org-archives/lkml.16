Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4324E28C2BE;
	Tue, 10 Jun 2025 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749550995; cv=none; b=fIlEbrs8b0h+4dyNcVujAak+VEDX6yRWbymcqhvAHQwGFzSuSxfzPRMg8X7NMPDGxKAshhYXHOKea4FQRp9LFT2Flgxr/D+pxkD29Y/hVh6oK0Sd8XqYU/rKUYMSi+hwFNp2l03GCG5/7bbdRTotqwVOV75zMTrNJPn6mi1Jj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749550995; c=relaxed/simple;
	bh=VNtBnJhPXmI/qog9mM4TuSFWEYyWcVDED/9b8AqhcX8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q7doUIqEP8KKqGOTnfBacZLZDkfhDIulz2lxJdjqpv2QA+gdZjY6oJowL876QTRZZZC2r7gLK9xvaWHZxl5LZn80Tf2m+p2x9lEPBgMWI0GuJeQm08slNxwx68K5NPfSI8tBtBBolQQdPHMUDe5tTIh7GX5yHwJ8/CaFDqOSuow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YuQdFdUI; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YuQdFdUI"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-311f6be42f1so1059448a91.0;
        Tue, 10 Jun 2025 03:23:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749550993; x=1750155793; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VNtBnJhPXmI/qog9mM4TuSFWEYyWcVDED/9b8AqhcX8=;
        b=YuQdFdUIts5XsYxMdxq0TzUBd5dh5rsoJXOPe9Esgs/UFyn/+QKwAjy2Wux9XGV4VV
         4qiCOQj8NqkthSJbEUdHLmSRB4HJT9mBormlFwA+LY5bC6+4BsSJXpEhOqVMb5paZz/n
         pqpJrtanQ8ssuvipFhW/o7CvHqfNBwA4EjafDI7L49B2dpTzrfsM5nnsdXdLxZK/E2il
         xzcjxMqLu0eoR8I3ZJfJc/bez+D28Y+Orz3OY2SPyJGG926AK4aLEyrTJUC8ibXZrpxt
         if4GERPkDLF8a6F73hxynhgApWc7fiSAYMFCBJ2fwJ0f7mspryUoyWLyu3g4RA1sTwwC
         tFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749550993; x=1750155793;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VNtBnJhPXmI/qog9mM4TuSFWEYyWcVDED/9b8AqhcX8=;
        b=ISnIXSMhCp0DhqWbqPDqF6+jmmXOWZPYnsbxmT9DRjPiz2njgQgRMPvfkHrQPZYykq
         YGh8l6vA9Sx8UWHET25rQIU8ArqehUnRXwwZ2pkykiC7/UpHgCMNpjlQmS8dsZttFXdG
         a2GYNeGd34cYCVbSqPwZve/UeCBllf7Zdye+3ZeF7iypzD1cndy1jtQFzOIENkO/LKcs
         VdlhCFGV+SL+kJet0oTRLb/zxGKaWmG6x041tSeUXzyHt+8TIZZUAMXgJRBEIqSuApIa
         AAAVD/rdWsVUmQQpHc6IjpffNu2syBkioneW1wELrvikEPtjF1+o3hXQFcB7IFaL2fbl
         9I1A==
X-Forwarded-Encrypted: i=1; AJvYcCV18Mqvcys9x7Q5EtPc0cpSMYkrP9CwXxZJDvRD7jbBIgcmrJNe+v5hPGl3IhCHb5hM5ZYo5SWfVscNkgXJ+eI=@vger.kernel.org, AJvYcCXMF0y8rTvxkC5XMYneh/OsvAWnQQuuUBAqjWZVYwVR2HPTctdKdc9l34nexf9XZ9HRTTbqLtJH624Yw9U=@vger.kernel.org
X-Gm-Message-State: AOJu0YwSBtJyJPxvKcl8b0znPh+KFB/O4wYxMga9ePAE9Cxy5ZpL65QC
	7OZsqsgZkUNsfpHr9g3GAALneYnzLNlpE122crENGBxQInJvFIxXJLREouxk46nk/MnrKUWw/Ej
	G3+VouElcktjbSDAujgsNY8rHNSowvxw=
X-Gm-Gg: ASbGncvwms/agmiMEycu8IKFZ67jYX5NeyN9tW0pfwJ2n4CUgX4xfeic10BU9rlunCh
	8Z0f3kWNZzOy7xCfRiKy0qrlMvhk3kqca2Ges1hBQ6BLViw8jsC33mApnLtsyRnVH7KGyFcrQ4E
	raTFubBka2+U9tcYgh28kIFQWyJNMyDStPi2Mhtvj550Q=
X-Google-Smtp-Source: AGHT+IHyUkNAc0JIV9q0LiaAdIeTF/k2n5W13Vsuy1g9zC8wrFEwVzaPl6HlNMf4m2h8nQJ6Ng+MolkHJQP6SBthxXM=
X-Received: by 2002:a17:90b:3890:b0:2ff:7970:d2b6 with SMTP id
 98e67ed59e1d1-3134753c519mr8544569a91.5.1749550993495; Tue, 10 Jun 2025
 03:23:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1749463570.git.viresh.kumar@linaro.org> <f10910c7585f5556869ea6f34b64d4136b8d5581.1749463570.git.viresh.kumar@linaro.org>
 <CANiq72=WpuGELzLbH-fxdOeJy9fiDFwatz6ynERDh=HP2z2MBw@mail.gmail.com>
 <20250610060711.zp6lua4kcwi2z777@vireshk-i7> <CANiq72kD9iQh6TPo3Rwk7AmPXEarogUrM2fmhkDn5XNfKrr_jw@mail.gmail.com>
 <20250610101849.ymuw4bmjsucsoblp@vireshk-i7>
In-Reply-To: <20250610101849.ymuw4bmjsucsoblp@vireshk-i7>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 12:23:00 +0200
X-Gm-Features: AX0GCFuUlSq_Xn70A18RdA7B2S12Fu_LrRq3arVotD4opnMPnqxymDjzAQdofq4
Message-ID: <CANiq72n1FxBW6EydLyyMYkJZ062S=xRtPmmBdPrYKh6dDsY9Xw@mail.gmail.com>
Subject: Re: [PATCH V2 1/2] rust: cpu: Introduce CpuId abstraction
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Danilo Krummrich <dakr@kernel.org>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Peter Zijlstra <peterz@infradead.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Yury Norov <yury.norov@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 12:18=E2=80=AFPM Viresh Kumar <viresh.kumar@linaro.=
org> wrote:
>
> Something like this ?

Yeah, something like that was what I was thinking (maybe with a
comment if it is not obvious why we have that one). Thanks!

Cheers,
Miguel
