Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F35171DE889
	for <linux-kernel@vger.kernel.org>; Fri,  6 Jun 2025 06:08:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749190104; cv=none; b=IHVsaHxCFxr8yghJEoTPvmPGRZ8igRGzxeFejhjG0VLeL+SHrIqmbxNzc/Vh4zZcXDaCBdmnc3VUj7dNcI4O/aLUtiH/e2V8ZVduFsaWd6Ax1vi0742YBdJpV49rNUKruhOtU7Rzlg2nCnaTRMX/Ip7WMtCjJNiqYeLvLNn16hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749190104; c=relaxed/simple;
	bh=0bQVlQAkZiktNGRrwzVnwFpZbIiq3nNzG/ksOecik/A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I65k9MhWbfc1LUuuoy+2YbS0AeSKVamL1HTf9GKt+pcjY3q0yEBmj5JkDL0o1ABk/Idr9G3gWM5iFvFUi3SGJFUBtynbL797jC+yAtDEn+GxghOw/9UoWlA3eyB/z2Fanfnsk4anvbLMjMxclL5sbQfFnJbP6wiSQOlIpPZGNTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jaP5yzMw; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jaP5yzMw"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-4a589b7dd5fso29245191cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 05 Jun 2025 23:08:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749190101; x=1749794901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kKvStmYDfkAOPdQAkmQVzm7vE8Ux/xTu/Lq8EZxk5pg=;
        b=jaP5yzMwsdqxvLfHrGOMnelVMDp/VcUaAyRpHNipSFt3sowjhpFQV5MnlIVze+lyx5
         v3g7tI6ZorPkEUgl7ioy9l/Cucy55UmiHF8QlbIw0zegtaody6MTlidhYLWLlFKTNS0o
         pevIVG76bKpj/b0UBFy7ZKP8SkRo/E+kKulyupxV13ZV/rzN1CO6WT6dwiCWq3sVAwrB
         qBdqvkvjuPQGKjqCJldVA9j/XHgVgPPPxwB66E2kd2YWmA1p2HZ+3DQ/AbDUoRLfN6tR
         NlU0h6uIishE7QXqz3FX42ZTfm/BkHXm6yWTPj0Mq3pJHemEgU8UGpFJiaiZBZJeblee
         qvRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749190101; x=1749794901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kKvStmYDfkAOPdQAkmQVzm7vE8Ux/xTu/Lq8EZxk5pg=;
        b=K722e5haXkanOAs/HFYT67Z4Is4adH7zZT2yXMjJdhF//2GopGmhmbyIboTtOcVT1t
         Rq5DDKCyT7DKZfqBJdblw4v6bT3351Eyhd805QKNtL4ZEj3/TecXJEqsEJMdSN34eLXz
         ANxYj/2yY5yosN+YkuG7Tb/5u29OVP0IvVnS+o2o1HnUxR3Z7tVwgRmNMx0PqxtAI2o1
         dSGeKlt7uIZyPHCLnTYBIiQFmupRzB8JoUwgW1Yokx3e2XT88y4Wg2HRaM3NauyziRSB
         uHYWevs78dOAwXLTgthj+o8stIfRbW+9qWZ+ezr9z9uoHhd6He1dnwNkfUgScGrEAy4F
         cccg==
X-Forwarded-Encrypted: i=1; AJvYcCXyHLXM6fikmNreAl/PuAVfLpRc082jLtWRne2c/h+OhAPOJ44jes9KlrW23ZirCQSqID00L7/twSZHukU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj7AKw/1nV8ZfyuHScyi4X+mHAvjkQS9agMWglYRqcPQnfyOsr
	/UdBpegnLdJev7THCLzO1h/r+ciT3fxwwbckvon8rc8fIqYBco27ZO8Ht2LINS4oBZ4NNYc6HQ+
	AGu3xl2uTJYiHjExAAXp8g+ea/ocrwdJmIjpSpz8U
X-Gm-Gg: ASbGncus7mb2qn5SQyMapWQWLAnywm+Dh84/Cp1nqgODiFo5HwIm2+nEONTJ9t4rYYP
	n18po33TJmVnV1ojGP3BhVqoODjRmyzZbvIJ/g8jVbrEPgI8XG8VYH34t0ZrZw5b/pk/d0Fp1ep
	i14Sey9WIAlmzDnccyzv2Tw0lK7qiU+h8/3yrA3tqcwvRYrQGvQbLBHuowry2RfwhFHMkvM+Tr
X-Google-Smtp-Source: AGHT+IFNLf8kiaoxiVhlcZHxWQipk57Pwx1NjDf59/NaBKuvZ9xKQtErzz+1d8bwORt3x1wf4IaR5TD3NK/vee4duoU=
X-Received: by 2002:ac8:6f08:0:b0:4a1:511a:b99f with SMTP id
 d75a77b69052e-4a5b9a00f7fmr43119931cf.3.1749190100655; Thu, 05 Jun 2025
 23:08:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250606052301.810338-1-suleiman@google.com> <20250606053650.863215-1-suleiman@google.com>
 <2025060650-detached-boozy-8716@gregkh>
In-Reply-To: <2025060650-detached-boozy-8716@gregkh>
From: Suleiman Souhlal <suleiman@google.com>
Date: Fri, 6 Jun 2025 15:08:09 +0900
X-Gm-Features: AX0GCFsRvL-wnGhd79Wc0undNc8c43NKvrHNdqcadxOFKESr_qPXBVorv1nNUwA
Message-ID: <CABCjUKA-ghX8MHPai5mfC4dZgS8pxi3LAvh3Wnm0VCt4QmU2Hw@mail.gmail.com>
Subject: Re: [RESEND][PATCH] tools/resolve_btfids: Fix build when cross
 compiling kernel with clang.
To: Greg KH <gregkh@linuxfoundation.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Masahiro Yamada <masahiroy@kernel.org>, Ian Rogers <irogers@google.com>, 
	ssouhlal@freebsd.org, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 3:05=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Jun 06, 2025 at 02:36:50PM +0900, Suleiman Souhlal wrote:
> > When cross compiling the kernel with clang, we need to override
> > CLANG_CROSS_FLAGS when preparing the step libraries for
> > resolve_btfids.
> >
> > Prior to commit d1d096312176 ("tools: fix annoying "mkdir -p ..." logs
> > when building tools in parallel"), MAKEFLAGS would have been set to a
> > value that wouldn't set a value for CLANG_CROSS_FLAGS, hiding the
> > fact that we weren't properly overriding it.
> >
> > Cc: stable@vger.kernel.org
> > Fixes: 56a2df7615fa ("tools/resolve_btfids: Compile resolve_btfids as h=
ost program")
> > Signed-off-by: Suleiman Souhlal <suleiman@google.com>
> > ---
> >  tools/bpf/resolve_btfids/Makefile | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
>
> You forgot to say why this is a resend :(

I wasn't sure how to say it. It didn't occur to me that I could have
replied to it with the reason.

It was because I had "Signed-of-by:" instead of "Signed-off-by:".

-- Suleiman
