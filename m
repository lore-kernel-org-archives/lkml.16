Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08774220F29
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 19:46:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748461601; cv=none; b=uPMnqdVicrem+FnWSs2RPq+YSUNy7C7ogkAsRVgq24up+kTHE4okmvfczZYQ5KuxkxL4m1GCnEoekaHCPVMCMmJZEmhI2bPesfH6Er8i77PcEsiNkxrZzBTemTJ14B8n8IIyFhM0CIMuPgoCLJCybyUKpLiLleSpXjp6tZb430o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748461601; c=relaxed/simple;
	bh=+uNg2ZNM9774GNllUWRARlObsSVU4a3QOAeIWqn6Zs4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AHkniYyyGQbC9w/R30x8BkjkvDfKlTE33iiz5yAUikm2LqHnMYKFIE9haunk9fISFiXdO75rRUKxGG8HM5qD6/o4IDLdbpt/mUsCT/fbc68vA8qpHcCiM/x2OKWDFEIXssYKDTeldCanZIdQTBlxf4uZwiv753qjSsaBrIjhBgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=orMDSJ5+; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="orMDSJ5+"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2349068ebc7so44375ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 12:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748461599; x=1749066399; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uNg2ZNM9774GNllUWRARlObsSVU4a3QOAeIWqn6Zs4=;
        b=orMDSJ5+ynn2T7LSl6Kkf7/LT1+JSI8vU1sRQ90H5PNnK3cB83I9Zw+lbiN3m4InKA
         K25QKoZZyKBZ1oA/6KbC1OT+N1LhWNzGEDgGSVzIKHvAVM9IKa6uzY7dWnQ1G3o+4O+w
         DnaBjklgNnO/1pZtAE+/wUj9cMk55pVxxjH4MelnaZ/FyZfqN/UOOGh2Ej245brU0pwv
         yRchogI+Bdk7QTSFiay9qZ9Vh5u/W5rOm0ipjS+P9TEa3Ay6XrenNAteqDSeR8GFbnua
         zn1fQSfxAe4VIJ8bFEajBcOHNAWw4vsIwIehja2poA/2znaImouWqkPriFO22JmzQ/Tt
         j78w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748461599; x=1749066399;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+uNg2ZNM9774GNllUWRARlObsSVU4a3QOAeIWqn6Zs4=;
        b=loSp/+CopMdQo7headskSk4ZTVB7ce5bI7L6brUYq+ao+7qqLyDrJX4g5KKK+iGf4E
         13SwK+8pnGDnxV8aT67zTiy56xrO/EBpp0pS1zNtrZPv7c7YGJ7Iwr6t3oqoKtXUVfvQ
         2ypQtLva99nx5WKYwyu+ER+hdjAFoZ8GnLVVTZ/DTK4XPwPG3mA+94mW9t49K9A4zHRP
         Q+JS0cEclAsGILVl/D+hmCYlm5j4XeMs1ZGJntqZrVx1coZH2MJGDTR56AhOdfEGkmbR
         RjEyBMcCOULQDcrUqUKFVI5rbId3fLpB0HFaOQB3+9VXc31esSo0Hu0/xhXLVGnHxjS1
         ioFA==
X-Forwarded-Encrypted: i=1; AJvYcCVcJM8VXAaGtrkj+O94Ob9E+8suypWqQKobk6sm1RlHDXvoTun32V6iufiKxnk4JYKtiDLffGozmsIwwJQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzG2jfzSWvkkkhxMahE6TrWHyBCXX2lnuEd7nGsQ6oXyUohxf8m
	FSgmO2XU+ze1J39poxdS1rB3dMqNoBKALEtV8GQllYiF5FeJ1gEeUwga1erpf0KsQTymxbpae7Z
	gNUwrK5M6WTF1ro9q0g4w+J0PWDGGxkUso309ix2W
X-Gm-Gg: ASbGncsS0bNYziviEh93D943aWGMEIvhmZAbe+BmlCuBt+V8gi0hyba1QQV7a01BYoF
	rs+OQp13qPXx5uC7fZSoyH0fD2PtrXCt8+EFzAZ8b3ehufo/YlKxHNJOub9I1xrqymz+HkPDZMD
	kf3+ArH7iWfKyT0kb3PS+Z06k4uNg4bkfUoZWmuMm1DcmyeRP8NDtp5uVTVtzic5+It0mf+gNgZ
	w==
X-Google-Smtp-Source: AGHT+IG5pJp+Ll9vBD2Ex9mtsA5ekYQjmYsVW8dgVZjb+a6ny2LQFZUjoGZtmZJcRrNBSbewuLItVb656yqYYibxVxo=
X-Received: by 2002:a17:903:46c3:b0:234:b441:4d4c with SMTP id
 d9443c01a7336-2350545f23fmr467515ad.5.1748461598995; Wed, 28 May 2025
 12:46:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525034354.258247-1-almasrymina@google.com>
 <87iklna61r.fsf@toke.dk> <CAHS8izOSW8dZpqgKT=ZxqpctVE3Y9AyR8qXyBGvdW0E8KFgonA@mail.gmail.com>
 <87h615m6cp.fsf@toke.dk>
In-Reply-To: <87h615m6cp.fsf@toke.dk>
From: Mina Almasry <almasrymina@google.com>
Date: Wed, 28 May 2025 12:46:25 -0700
X-Gm-Features: AX0GCFu3OTeh8uk-NocaEzNOkLCNo2rSHU7frkp5goouJg3UdVULK6dSsjJSF88
Message-ID: <CAHS8izNDSTkmC32aRA9R=phqRfZUyz06Psc=swOpfVW5SW4R_w@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v2] page_pool: import Jesper's page_pool benchmark
To: =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, Jesper Dangaard Brouer <hawk@kernel.org>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Shuah Khan <shuah@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 2:28=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgensen <t=
oke@redhat.com> wrote:
>
> Mina Almasry <almasrymina@google.com> writes:
>
> > On Mon, May 26, 2025 at 5:51=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgense=
n <toke@redhat.com> wrote:
> >> > Fast path results:
> >> > no-softirq-page_pool01 Per elem: 11 cycles(tsc) 4.368 ns
> >> >
> >> > ptr_ring results:
> >> > no-softirq-page_pool02 Per elem: 527 cycles(tsc) 195.187 ns
> >> >
> >> > slow path results:
> >> > no-softirq-page_pool03 Per elem: 549 cycles(tsc) 203.466 ns
> >> > ```
> >> >
> >> > Cc: Jesper Dangaard Brouer <hawk@kernel.org>
> >> > Cc: Ilias Apalodimas <ilias.apalodimas@linaro.org>
> >> > Cc: Jakub Kicinski <kuba@kernel.org>
> >> > Cc: Toke H=C3=B8iland-J=C3=B8rgensen <toke@toke.dk>
> >> >
> >> > Signed-off-by: Mina Almasry <almasrymina@google.com>
> >>
> >> Back when you posted the first RFC, Jesper and I chatted about ways to
> >> avoid the ugly "load module and read the output from dmesg" interface =
to
> >> the test.
> >>
> >
> > I agree the existing interface is ugly.
> >
> >> One idea we came up with was to make the module include only the "inne=
r"
> >> functions for the benchmark, and expose those to BPF as kfuncs. Then t=
he
> >> test runner can be a BPF program that runs the tests, collects the dat=
a
> >> and passes it to userspace via maps or a ringbuffer or something. That=
's
> >> a nicer and more customisable interface than the printk output. And if
> >> they're small enough, maybe we could even include the functions into t=
he
> >> page_pool code itself, instead of in a separate benchmark module?
> >>
> >> WDYT of that idea? :)
> >
> > ...but this sounds like an enormous amount of effort, for something
> > that is a bit ugly but isn't THAT bad. Especially for me, I'm not that
> > much of an expert that I know how to implement what you're referring
> > to off the top of my head. I normally am open to spending time but
> > this is not that high on my todolist and I have limited bandwidth to
> > resolve this :(
> >
> > I also feel that this is something that could be improved post merge.
> > I think it's very beneficial to have this merged in some form that can
> > be improved later. Byungchul is making a lot of changes to these mm
> > things and it would be nice to have an easy way to run the benchmark
> > in tree and maybe even get automated results from nipa. If we could
> > agree on mvp that is appropriate to merge without too much scope creep
> > that would be ideal from my side at least.
>
> Right, fair. I guess we can merge it as-is, and then investigate whether
> we can move it to BPF-based (or maybe 'perf bench' - Cc acme) later :)

Thanks for the pliability. Reviewed-bys and comments welcome.

Additionally Signed-off-by from Jesper is needed I think. Since most
of this code is his, I retained his authorship. Jesper, whenever this
looks good to me, a signed-off-by would be good and I would carry it
to future versions. Changing authorship to me is also fine by me but I
would think you want to retain the credit.

--=20
Thanks,
Mina
