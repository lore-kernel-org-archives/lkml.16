Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D3114F98;
	Fri,  9 May 2025 09:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746781470; cv=none; b=tFV5BV2FcBLzg34s9MFmYjaeU1oA3b1qjcoWQOCeEeX/8NhkMtezJhQt+krFUt+475WMrE8J9TCjQFOMd8wtv3ZQI6qjwI83ckZW8k34etAxNdKnZDyopeTqt1c9iIOUwZXe4+Awhg0AokMHdR0WSrw8N0aBdpIhNnsMPGqTMho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746781470; c=relaxed/simple;
	bh=X0A6ZHuppb4JfJ0oMiCdmzcVz7xpQPiCgEUEjzsOr0E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oX+BtMkVqnQoId04AxfTQP1vhzQDtkED5s6EhgyONAY19NmnP2ujWyVet0tp2QDndBDvCGiBupmVp4WDdoZq4WtohBRT1mXINkyVd3xe80nvj1L8TOb6bDnKwS0Yn3dKuElYR6IbRz5LCQiyrRdyikZA6vQKHxXijLkRsQapST8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BtIh+MHm; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BtIh+MHm"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b1ff8a0a13cso272549a12.0;
        Fri, 09 May 2025 02:04:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746781468; x=1747386268; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X0A6ZHuppb4JfJ0oMiCdmzcVz7xpQPiCgEUEjzsOr0E=;
        b=BtIh+MHm4rw8RHM+0ZhGVeQjeBXXd06fECmeV5DXW+vxGret9pNqXh4khTAiiF8ggN
         gWdrSPxvD4sW0E8Kq4xvxdWBOmhA+ZgiWFj1tKAQoQ2B5gK2f0/X1WmFEZS1VyByDNzE
         +LQPR6WFEJJzc/nkQT0XMU9O28lwQnvziDwRsYMCN1wKEX7cSN4JHymPHOcD2QITFt+N
         DdMneJoKRizE1+CgH6wGkiMYd2esu8Xhr9d2H7+Aa06TQPXsfGxabE64pIEQDinOI+Oc
         b3CUWHfMQaS4HEQyyFKwLhhCi1AOZ24REK14iWuIwBf1OHXvzju07+G1gUVNvShNWe52
         rSew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746781468; x=1747386268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X0A6ZHuppb4JfJ0oMiCdmzcVz7xpQPiCgEUEjzsOr0E=;
        b=okpk3NY2S83qG9DmMc4YWgsSYW0+RRQ0cKrWNDYbGP+cR3zdKsTQ6dMxIkqtDmNzul
         FHz9HBAN3xEtN7pXt8GxKG1Rg03KuM66oi1kfUHhfExA0Qh/tMpsAhEQ/lih1LVoGXEn
         i0/g5CyE7rBd5igRCrRSPmPJBB297rfpv8XPyY+A5X7mU+5wj5ajAkvXlVGBo+RQXLVh
         3LoHfq9sCQn7qKHcUoRUATN1w7U3UUMcO4MH026zAEegpQWhvAyOFuYyI4hPKce6nxK/
         1lp0Brci65TiYtgRwYFSuv3TTMRdGPihTL+V8vTDpMcU0vqrkT3cp46lJ604mDAxRZC1
         MVHQ==
X-Forwarded-Encrypted: i=1; AJvYcCUCmDuEMe4nTOAtaJrrIU2Yw595ZArTnPfpEeb4IYP5x8JcFw2h5EiWBuHulFIi7zfYcT4FRjh2FlUdB2D096E=@vger.kernel.org, AJvYcCUb97bz/7PykPQ5iPie0iQ1z1MNnQNmoQEOBuNnquJNpvHhv2CdCsY1+1NkjgyMhfc1LQFt0dPzSRjm8RI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZ7lFWCeqtPJqlD+rmipxXv6inmrY4NxqEAXTpKVdgIUXaDRTF
	SNkPNnZuGvekeeASEZeRl+E7nZS/tdy9ZgD4GQec2U1hwI2UjpQdiqDyA8eMFIu6YhRyP32y4vz
	fJjy6gWtf5/q4pSU2hC/lSE7GNfo=
X-Gm-Gg: ASbGncti2bFEscypOmnjQ4cXNn8dvbP6XGuSUz7+T20mGZjxOErJqlXE1L32nr7ZcJU
	3XZEkShMMcmpLu4yvTsQFfsMG7KtlwUJC0bapyJ3f59BWbkESG3e764hMtRapJwaUjmGxWYZGPF
	g1KB6hLYT07+jqGLrrnMapKFjq44Pu77VT
X-Google-Smtp-Source: AGHT+IGLvfsMSuG403juuxmjYD6zkSBGa82yr4Bub0/jZclaT8byFROK43HZNtsTWZonmM7i7ngV4gLcDp3WILbzHbo=
X-Received: by 2002:a17:902:d2c7:b0:223:f903:aa86 with SMTP id
 d9443c01a7336-22fc8b106d0mr14930655ad.1.1746781468519; Fri, 09 May 2025
 02:04:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250410132649.GE9833@noisy.programming.kicks-ass.net>
 <CANiq72=Q_Z8KfV+n4z9wWVJsZwVevag=Vh3URe71XkUuWuqEDg@mail.gmail.com>
 <20250410133446.GF9833@noisy.programming.kicks-ass.net> <CAH5fLghrcqSYwkqbC4SSp6oYCny0riMRGA6W+oqQ69aA=NwYWw@mail.gmail.com>
 <CANiq72k0AM3v9JZe=8mDN6T1ToiAt1-1e1zJ3z0Oh6ZWfchzag@mail.gmail.com>
 <20250416202040.GD38216@noisy.programming.kicks-ass.net> <202504161442.66CE2596@keescook>
 <20250417081818.GJ38216@noisy.programming.kicks-ass.net> <CANiq72kjDM0cKALVy4POEzhfdT4nO7tqz0Pm7xM+3=_0+L1t=A@mail.gmail.com>
 <CANiq72muSS+NNs5fxp4GPKWWhyXT95spvbGsZz6AJnK8RerUqQ@mail.gmail.com> <aB3A0Qe5WqmxXQJt@google.com>
In-Reply-To: <aB3A0Qe5WqmxXQJt@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 9 May 2025 11:04:16 +0200
X-Gm-Features: AX0GCFtO1tbkSmX1p0BKP9eiGvH-PWTbseVatqIE62Mh9CEceli3-tEMjRmaSdU
Message-ID: <CANiq72=NymSwziZw1a0PUNyJ=TCN5tkr3PojJRQ0sjqFWDjz-g@mail.gmail.com>
Subject: Re: [PATCH] x86/Kconfig: make CFI_AUTO_DEFAULT depend on !RUST
To: Alice Ryhl <aliceryhl@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Pawe=C5=82_Anikiel?= <panikiel@google.com>, 
	Sami Tolvanen <samitolvanen@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, 
	Masahiro Yamada <masahiroy@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Nathan Chancellor <nathan@kernel.org>, x86@kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Matthew Maurer <mmaurer@google.com>, Ramon de C Valle <rcvalle@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 9, 2025 at 10:46=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> Actually ... I don't think putting it on CFI_AUTO_DEFAULT the right
> approach.
>
> Shouldn't the depends on clause go on `config FINEIBT` instead? After
> all, the current patch just means that you can't make FineIBT the
> default option. But you can still pass kcfi=3Dfineibt on boot to enble
> FineIBT which would result in the same crash.

I thought the intention was to avoid disabling FineIBT at config time:
https://lore.kernel.org/all/202504161442.66CE2596@keescook/

If another approach is needed, then we can change it on top if that is
OK (I am about to submit the PR).

Cheers,
Miguel
