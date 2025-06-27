Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBDFF2E54AD
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 14:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751034318; cv=none; b=qh8BTnx0J/LqaJEQ0TMbV9fKOLyvek9dQ9ab4jCnj/H//yy6/vMTRyh2TfTNEWQDSRs+8J95bhxklHmdFCmYzr5EKeVzpcPBtRfqPQfohBZEivZfAPNvm/xrS5LGjIxLMGjH0Ntj0B97ykicUYfS3aBEv46x/wX5o3fsDfh/4LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751034318; c=relaxed/simple;
	bh=jhExwZF8WZRBqXdyQDZ/i8JAohQYvfSaazVslwt3TJs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aVmB60uNc4NCUy6hNnKsOAaDqGU3qom/P0+iXFK6/Spy+I0oNZHd2DldGLKpW+duOyqLWd+y3/6J7sr3tea5+6k06HFarybolM4hd/EWEhoViqxG6cEbIdTWFTTsqQ2GjW71ejC/ghvaP5dXAniMapnv2+rqz+uN51Tr9HeYw70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vMgUH9bs; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vMgUH9bs"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-b26df8f44e6so2460392a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 07:25:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751034316; x=1751639116; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rWEwwAXq7aUCx39IeLJxT3jNwxQZV+O1CFl/KQTm4BE=;
        b=vMgUH9bsLouSaGJg61KtLZWXXjqdgeQxccaB42/eWCsZt2k9cub8FshUfow5WndQbH
         AOmdLwsl6rl30UDFEYus3PyhxVXr8VpDszkrIJ8vlSGI6PKUPTYn2za+0aQ+I3xS5SCV
         87p7blt20VAMBj27hpQUhE/y1/DcTMSk/Q2t2Si9uVNh8E6AS+D4tL74kQA708aWnUzV
         uTdWgfSiR+BD/hkBY5N5IgYZeRg6pefyCMFtG8ydNtaj2RhMm+eqbMVP3hzGbpdeFnWq
         u9xFeYCYc8ylzwQN6BR9VmVv9I95/Pr4JnupAkOObrkLdcjoOCsU+woCkXD2my21rsji
         6IVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751034316; x=1751639116;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=rWEwwAXq7aUCx39IeLJxT3jNwxQZV+O1CFl/KQTm4BE=;
        b=FRmr56eNKzRIscChcONQYkIi3QUae/+6L9+vb9OXPPrQIpIZNELOxKgFtyhPn5uCVi
         lW76DlUw44mUWtjRl5ERcSqqftGH4B9nGNWQ01vRoi6sOjAKT//+F19r9nIiLhNGYGm5
         ZhDL5Bz0r8UsD4rF78YjiaBt0k50bBwgyKHjmafloM2aDwcp6Yp1x69VIpwygOTbXwfE
         NSYzAsSpVhBZAV2D95/TAcLxWESgRb4dtS/ynfoayHmTx6vg6Iulg+pUix7RbCjMnMvs
         h2M04krMipIrq9hOaeMMOxzv0YO6dlVoP802+zdrkZtD+5FpyPVlX7f1179F/8MhPs8M
         p67A==
X-Forwarded-Encrypted: i=1; AJvYcCVTvBl0Co091NpPAWaL5nsAUfx3m3ReUsOEWsLTUs8aokkKA/mrepXYMZGH7xEX1+HtU9Fql9+ZRIiDYYU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwhO9Zmk956VICGhb1/R+1gXLHrxbPoIYh7YGhtZuyQvYr63Yqo
	djVDA8m6tCgkCmcSgcjC6jaZbV4rauTef2KLuyA3fGSwvFTEc19OtYBDIuWHn0GMxEFlJbG0ybh
	NBcPFUQdNFYAvIwRd74zgrd7Vv2/jnaZ9aw1DTjjv
X-Gm-Gg: ASbGncs4S2Og2nSxYKe25cXjrqdqhtu+xUj3voalC365PivZrdLaFYbnNur/yBNmpHe
	Ljkk3f5aUiw5T+RabpnfnQCESOce9LGBCaDMnW1tNlwVnOFl1cKHCWzKEaqRpT56modC7EmRL+P
	jP5ERZbDDvUfMorQBlrKUPs+Yo4mmtBGkT8Gohj5sXW3i036ZK/qn5Gi0YoVR9X1mx/4Elhmi05
	A==
X-Google-Smtp-Source: AGHT+IHGNRgkygpHfMPQOj0NGGskB03ytD7z1igBmXJiwj5qUKZOxneN4SXR+feUmOnbJZmq/d2uR46t8CjA+D5Oxn8=
X-Received: by 2002:a17:90b:4e8b:b0:312:1b53:5e9f with SMTP id
 98e67ed59e1d1-318c92e111fmr5023442a91.24.1751034315698; Fri, 27 Jun 2025
 07:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-7-glider@google.com>
 <20250627081146.GR1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250627081146.GR1613200@noisy.programming.kicks-ass.net>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 16:24:36 +0200
X-Gm-Features: Ac12FXyQawK2wMIbahdpGNOHGjO4VNy-BCPJo06Xuokf1P8k9xJhRjaaDWA72xY
Message-ID: <CAG_fn=UrOBF=hQ5y6VN9VuA67GeVOyaaWtrnaSLz4TnC7u1fiw@mail.gmail.com>
Subject: Re: [PATCH v2 06/11] kcov: x86: introduce CONFIG_KCOV_UNIQUE
To: Peter Zijlstra <peterz@infradead.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, x86@kernel.org, 
	Aleksandr Nogikh <nogikh@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 10:11=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Jun 26, 2025 at 03:41:53PM +0200, Alexander Potapenko wrote:
> > The new config switches coverage instrumentation to using
> >   __sanitizer_cov_trace_pc_guard(u32 *guard)
> > instead of
> >   __sanitizer_cov_trace_pc(void)
> >
> > This relies on Clang's -fsanitize-coverage=3Dtrace-pc-guard flag [1].
> >
> > Each callback receives a unique 32-bit guard variable residing in the
> > __sancov_guards section. Those guards can be used by kcov to deduplicat=
e
> > the coverage on the fly.
>
> This sounds like a *LOT* of data; how big is this for a typical kernel
> build?

I have a 1.6Gb sized vmlinux, which has a .text section of 176Mb.
There are 1809419 calls to __sanitizer_cov_trace_pc_guard, and the
__sancov_guards section has a size of 6Mb, which are only allocated at
runtime.

If we take a vmlinux image from syzbot (e.g.
https://storage.googleapis.com/syzbot-assets/dadedf20b2e3/vmlinux-67a99386.=
xz),
its .text section is 166Mb, and there are 1893023 calls to
__sanitizer_cov_trace_pc, which will translate to exactly the same
number of __sanitizer_cov_trace_pc_guard, if we apply the unique
coverage instrumentation.
