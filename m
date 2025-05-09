Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C9627E7FE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 08:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746780375; cv=none; b=eojNrLUyx8nx8ehm3P41SYZ/5rdccd9thtpagEW642qGmE4yN+ZzsDWUG7y3AXk++xBRWSXtCOLB9/BNhWQIVHoaD6CX3GmMmCaF8UADT1h913zmo4ElyZBhyJPXF7uwkgZKObbv+nQJQ80aJ6jAWXTAvlASM+oShcxSnYPqVLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746780375; c=relaxed/simple;
	bh=qsl/joelKwczJ7bi9V1St9WtcC0k/O+XG8627gyNOKE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FHWRfZEjR323xonwBvXNkL2l/hhMF56e4eMiI8pFCY/8Scoy+5LQwqm5lz1PSobZG6HpyZolYEf3sj/DJEf+mmE5yxDEL+Rl6cY+VZywWtso2xJnwd0Qk0xeEly+YmPZVeShIdsFgWNeKU9EfNyjZ2LkJasuVXFJ3RXo6lQqb4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DS8DsYq7; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DS8DsYq7"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43f251dc364so11641165e9.2
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 01:46:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746780371; x=1747385171; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MGJzbeAPShVS80kaiI20MlTe07Nkf3fvhyjfEiBHmj0=;
        b=DS8DsYq7AgvGJ74cfgR0vVfM06tnemuI4DcKSKNKxvTu8+FfM6s+nVFBS9kRoQnXyS
         v8nBuMYX4QP1WY4pEZo+pH22tOdGXe3y8vM81cs6TT2ENESJEdgyrShPQ/f9k2xY9FWZ
         dimRh1zDWa+le/ldmuUM5MCXknF5TdJGQkfpXp9O5DsQ3R1PGVjSjaQx50Y4kW24wpAe
         RFw73U4/RLfiE0pExrP1qZ6fQz5+VYfhc1t/Xqbbt5PV1op0uFvkffEtEytsqmxwuSra
         qipV1Zhwa2hlLiiBc16tqmxdhl3OWIGBIhMR9Axq4XkxPIJ6gD2XXV0PYjd6MXKKRtc/
         V2Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746780371; x=1747385171;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=MGJzbeAPShVS80kaiI20MlTe07Nkf3fvhyjfEiBHmj0=;
        b=GkRE+5kcnLPfUyYszHB0AjmtSDLmMwZcvsAzxY1X2eg3yDRwuYeqvpI+d805bvjc8D
         XtJvAx5aj0o+i3kswQLY2kUMv7DFWc17yRPp4gYDZ6g1aQ4YzsORQrob+4vf75L3lAJr
         bCSa1o7325tF/8jF6hSe6gkHJiNP/GYnMg4RW7NmFtfwIYuhn8CWV8Bq2/kYl4CtRb06
         LxNH09IExXeAgw8FP87YrQFoPg0KW0J+qQPXV+uow+mHG3/doMQ93Y2doKuW80kpW5Rv
         w9goT1Adqgbu5SRuz9mT1kQnAniMyFg1es5JGuLj86X6O5Din56uNl7ox0MnQkME8HBH
         lWTg==
X-Forwarded-Encrypted: i=1; AJvYcCWT+zqB13k/m/KoNNHVfRdKxqSbJvkKvHgDyLpTn9VY7Z11X3k//XE043fJReY7CO1RRRCc4dUsL3Sb+/E=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgKNQSfKaN/TNvsOl2AQEn5OCC7Fhy3QWXj4V2ejm+Eq2mcqpy
	ZnUcY/EChqJf+ghitK0TsF4rXRVZ/+Evumh80ijshVW9gg2FV1FJVtqsMbnYAZRt6LrhUXYyOum
	v8vSMk4Y4t53mfw==
X-Google-Smtp-Source: AGHT+IE1g5YyKhENi+6gXRQtJXAWEa/UniZ8LOkUkrGgQNc45EoYtxjXpwi6qJONxZWCOgGv1QUMncVWtyjEBmM=
X-Received: from wmrm7.prod.google.com ([2002:a05:600c:37c7:b0:440:5f8a:667c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:608c:b0:43c:e70d:450c with SMTP id 5b1f17b1804b1-442d6dbbd6cmr19045605e9.22.1746780371623;
 Fri, 09 May 2025 01:46:11 -0700 (PDT)
Date: Fri, 9 May 2025 08:46:09 +0000
In-Reply-To: <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com>
Message-ID: <aB3A0Qe5WqmxXQJt@google.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
From: Alice Ryhl <aliceryhl@google.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Peter Zijlstra <peterz@infradead.org>
Cc: Kees Cook <kees@kernel.org>, "=?utf-8?B?UGF3ZcWC?= Anikiel" <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 07, 2025 at 12:19:11AM +0200, Miguel Ojeda wrote:
> On Thu, Apr 17, 2025 at 8:40=E2=80=AFPM Miguel Ojeda
> <miguel.ojeda.sandonis@gmail.com> wrote:
> >
> > Thanks Peter (and Kees for clarifying) -- not sure how you/others
> > prefer to route this patch or if you expect a v2, but I got the
> > following (attached). I converted your Ack.
>=20
> Applied to `rust-fixes` -- thanks everyone!
>=20
> (If someone else prefers to carry it, please shout)
>=20
>     [ Rust 1.88.0 (scheduled for 2025-06-26) should have this fixed [1],
>       and thus we relaxed the condition with Rust >=3D 1.88.
>=20
>       When `objtool` lands checking for this with e.g. [2], the plan is
>       to ideally run that in upstream Rust's CI to prevent regressions
>       early [3], since we do not control `core`'s source code.
>=20
>       Alice tested the Rust PR backported to an older compiler.
>=20
>       Peter would like that Rust provides a stable `core` which can be
>       pulled into the kernel: "Relying on that much out of tree code is
>       'unfortunate'".
>=20
>         - Miguel ]
>=20
>     [ Reduced splat. - Miguel ]

Actually ... I don't think putting it on CFI_AUTO_DEFAULT the right
approach.

Shouldn't the depends on clause go on `config FINEIBT` instead? After
all, the current patch just means that you can't make FineIBT the
default option. But you can still pass kcfi=3Dfineibt on boot to enble
FineIBT which would result in the same crash.

Alice
