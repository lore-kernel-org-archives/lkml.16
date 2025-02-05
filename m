Received: from mail-il1-f170.google.com (mail-il1-f170.google.com [209.85.166.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B494207DEA
	for <linux-kernel@vger.kernel.org>; Wed,  5 Feb 2025 05:00:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738731627; cv=none; b=A1SzCZKEZ4RPiIYPx5YXyJSceFzRiA3GStWuEazKivSPELoi6X+NvB0UIKOR2qGDBuNSBuwOX6+xb8RXDJMEccE9OOZk+DFOVDxnsRgHKOFOewlBphivyv9TFZQ6B+sEZ49s2F40Y/gu9w2BW1HccsS0ppHtwCa+Iy8euAjlDk4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738731627; c=relaxed/simple;
	bh=XoHgY57qdbAKv8uWUYNfx7XWO/S0+Vz8NkbzUcrg87Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=he+BvTKIdN46yB6vZcJF93H+r43DjxZKMPs2l5b6fOwDl8+T7k42AyXVQtgUardRBtOibuAJBXeT3n5uZMBcm9sAQX90etJDbHB8b2Fv28HLi5w4siUqjoH5tcddr2KEzsIzRRFaE24KYa9el4XCW6O0KPvE6Kl5z7FPjb1A814=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eoixNFmE; arc=none smtp.client-ip=209.85.166.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eoixNFmE"
Received: by mail-il1-f170.google.com with SMTP id e9e14a558f8ab-3a814c54742so271525ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 21:00:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738731625; x=1739336425; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=;
        b=eoixNFmEX68JlxnaYLurIKdqSWOhSiGJFSzu2jmHgNx4kp9zODr2UWmTF5WgWROV+Q
         uwFpL7fpkiQRKWB+fexlIztGvecToTC4VckpUkN6yphGA7BiCZboWGN9fr5Zg1DrsPqD
         VBS1ip6QSbd4dSi+Yf8+2Dah9KFyGqKJHbqj8V0BZLtIbLQCIdcvxmzeq55QhU+4LqRV
         Nfrc6yrxVZq/l6AJ/bVD6SJoX4pOcoKmt8FBHGjZ3ZYtC+G6bS1iLmWu4jIDVhwK89vN
         5RDcVvsD1CdsPHB7XxfG1lJ32bZxpRkufBKTd2+eVT94S8VeZgXDv93+ow6Wu6yI1QmE
         Lz7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738731625; x=1739336425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DBrAJ33Lv27IH622MIOkF0t5tIX46ic8QrDeWtn4wec=;
        b=vdO9ugjYjdkntM5v7miozGS4nAV57nMAC/bgNPxb2jNuowtgDDTJhLB688PBemYUf8
         GskgerAIk2quiyqg7P66B17Wh8OBytj7e6LoJi6/8TLLZaV0AlJMubtiL8LUdGrpHD70
         uQO0eScm4OsRg4AoMNhjFh+26TrZGtQEPIGRQPYLTJlZVLFoHQ3rXVqBb8CjZbW6idX/
         MLEyUoGOxiKz5Zrh7BzZPGcuDz2o99KcK9L5DsrNmeSnSnTZpcC6ecTu1u8bK3DDDtSc
         IcPRQ+E9efiQMSmXmrvZ5JOhk7te5JW7pzTqpIomxv3cHbz3W863pPGH0uyButarJo7M
         tENA==
X-Forwarded-Encrypted: i=1; AJvYcCVtCMj0GjLdAcA2SHPNlfSQGFo55FLdS7j4VBSU54uQMh9vTs15T93e+w7EM11V/em3t5/GOeGUPPrIS1s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywkc5dEwN0+O/d9W+bXO/GSqzubnG6nGSh9crtmDTAR9g1UvqfO
	SDIBzmVSU6nklQJfbNFQnAHebuCPnM+gyadVNvsEOiVdIAWHxKpFIgc679OElIirVdtfVHc2tLF
	1JMOeuCxN+3qreO5HZNRCNwcGl5+95P2Ov0m2
X-Gm-Gg: ASbGncv3Aaei8S8D9qg1UgeQnnwOCDR8CJS1Hh8jR1XjHCWX2DLs/rxRbAtB5j2Ydhq
	xMlgcWCXnq261XtxZ940+LCK1Q1zJhX7tw3KY8HXaFatpH2FKIfJhf3/4Ii/aiFkVXRZG0LBISQ
	==
X-Google-Smtp-Source: AGHT+IE5v6UIxUtbhZWXvQ6xeQiRfsd1Lh1y3K7nKT+DdV2MV+Ch6CX6fJX9kXWxtmkarMn0roBxr/1rIM2Ik8IIu/M=
X-Received: by 2002:a05:6e02:1f0f:b0:3cf:c98a:ceba with SMTP id
 e9e14a558f8ab-3d03fc6611dmr7494995ab.22.1738731625326; Tue, 04 Feb 2025
 21:00:25 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250201071455.718247-1-irogers@google.com> <20250201071455.718247-3-irogers@google.com>
 <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
In-Reply-To: <CAH0uvogeG9rUw+1huquE=8fEq8AdJaSygS94G8a05=cHckjndg@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 21:00:14 -0800
X-Gm-Features: AWEUYZlxJYAftveNvjFByQ6RA0wq7gWZe-nwQuI2bmCaSivCz6TrVnDN2aRhlBs
Message-ID: <CAP-5=fX1bePwr5QGZQAMxWv1zvBY3dxOhbMd0H5UYQDXMrSKMQ@mail.gmail.com>
Subject: Re: [PATCH v1 2/7] perf trace: Reorganize syscalls
To: Howard Chu <howardchu95@gmail.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Charlie Jenkins <charlie@rivosinc.com>, 
	Bibo Mao <maobibo@loongson.cn>, Arnd Bergmann <arnd@arndb.de>, Huacai Chen <chenhuacai@kernel.org>, 
	Catalin Marinas <catalin.marinas@arm.com>, Jiri Slaby <jirislaby@kernel.org>, 
	=?UTF-8?B?QmrDtnJuIFTDtnBlbA==?= <bjorn@rivosinc.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 4, 2025 at 4:12=E2=80=AFPM Howard Chu <howardchu95@gmail.com> w=
rote:
>
> Hello Ian,
>
> Thanks for doing this.
>
> On Fri, Jan 31, 2025 at 11:15=E2=80=AFPM Ian Rogers <irogers@google.com> =
wrote:
[snip]
> > @@ -2104,11 +2123,12 @@ static int trace__read_syscall_info(struct trac=
e *trace, int id)
> >          */
> >         if (IS_ERR(sc->tp_format)) {
> >                 sc->nonexistent =3D true;
> > -               return PTR_ERR(sc->tp_format);
> > +               err =3D PTR_ERR(sc->tp_format);
> > +               sc->tp_format =3D NULL;
> > +               return err;
> >         }
> >
> > -       if (syscall__alloc_arg_fmts(sc, IS_ERR(sc->tp_format) ?
> > -                                       RAW_SYSCALL_ARGS_NUM : sc->tp_f=
ormat->format.nr_fields))
> > +       if (syscall__alloc_arg_fmts(sc, sc->tp_format->format.nr_fields=
))
>
> Makes sense because IS_ERR(sc->tp_format) is checked a few lines
> above. However, nr_fields can be 7 with the __syscall_nr prefix. I
> sent a patch to fix this, but it's not included here... Never mind,
> it's off-topic. This patch looks good.

:-) So is this a reviewed-by? What about the other patches?

Thanks,
Ian
