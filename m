Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F032DA745
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 13:59:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751032780; cv=none; b=p3egaLpCBymp7oZwRA82+qhtoAzr5Ak5V8CPlWMpJewiEiHfN1ZWcZx+5GDz6OhOoLxjxvoxV7Y2EqLNFIkIKiFPBYYWI5x4bPK83z0CvOX7xZyGUA0bEYyQrx8dbBzM3EPfnbvP/0DmfYQkYfzrAjyalUJJ5UNkpKralQZwMoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751032780; c=relaxed/simple;
	bh=7Iy/S3aZEhunHTqfooRy1l5brhhXQ2/JeIl+IFc7gb0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ThYDkIO2vgCFBPOlnfR8epQJd0fsMhb/8kNDVUg7h5KXs5YQD3/93plS0kxbv4YyKLNOzxs5EfQgqhzEcWvZKx/vKcnTBrWL0JiUAAPBONS11a/IeK35KnoS/dyF1S+td+UUW0VUhYiifpQN61pOPoaTHDitGh9cZqCcVBECjeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Wxk35mWw; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Wxk35mWw"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-6fad3400ea3so20070236d6.0
        for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 06:59:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751032777; x=1751637577; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nQ6o3V9npnsh5kXG6EvAXWC21LHYKK26r/BWHZxcoSc=;
        b=Wxk35mWwcg5r9mx/BxBw3DBvDS57KlLRJAdO8sfsLuIO2YSC5jdEOOcIqcPn+Mlo+5
         +5xwOe8DexW+Ym0phFy/GxGD/Dq39NlEMsML3+46JOv+ubkBADJtvYEgsgEkLHva3KwK
         WRgcKTdtB+9/eJs+8C/+WqK9PanBLaUakITOdjZ96ukwsZ1/oDbubeT9r5Lb3NQ6W9rI
         DyLlNCNvcKP8gc/Pi48yDk4RgRAVFB4e2bIYatXIqKRc7fNMhWoczKyOJToNm1BioAiM
         S1GfitPDarPPv6TWjoJk1GRU+h5MwMDjVisTNFHCC54WBeB3G+4hlQaKgqyWEZH4m7tH
         LBsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751032777; x=1751637577;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nQ6o3V9npnsh5kXG6EvAXWC21LHYKK26r/BWHZxcoSc=;
        b=e9F0+nlDza3mkepAGtz3/2akuYItQB9pGr1UChhMuLs1WP76Oi6WpX3Q+dVwyFiuBr
         JfXwNr42kwFH+IOu26qWz0YCqA9XNugXtAPFjtagvaxPNMQqHX8KWGsB9hkQ54VlstqO
         f9okIliV+DaSUz4pwVo6d/z9GDlD4dxZMX9H5kaXPhg5lIFezdDm5BGqN0bZ/Gzu/lky
         6BIUtRgy+wy2SkOiyDcUZBQqQKPM5H3Yw4Xl3hrcvauLh8yaFzrbNWBywWVdeCJI3GBo
         J2knSovcKeBGTbLdg2x2ZTOlPqsA6aqHPXF7HpYgx1h/gCngbo//zAIllyn/5dRwz2qk
         hCIw==
X-Forwarded-Encrypted: i=1; AJvYcCUp3DUt5sQA/1qAkL8SoMqVj5ybgsvqG816o+0Pp5MOXU83ZbTCk8qxeymWS//+LfxnXt3/2wpiXNddFII=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVAqyY4ar6C8dAerrgSaQoSxX451iTlGuTFwR8RJrcZ80Hr4a4
	cfvSISDerLm4orGEm0e4W4q4OEi9JCOcYJIabW0br1CZ+12QutVGLUv1LqLa7OAa75dTl+ck6GE
	Q9U6THjfakioxHBC5CZlXUSYmdlCh0xeo6C/diqdi
X-Gm-Gg: ASbGncv1ELCLaNRSD6YiZ/3dKHofhfr4wGPtIitudZIodsvd5xkKlbGMAOUp5nom4Go
	yFYeflkbOFtpuzJUULzjMRn2teKAy5PcUctOhkr2l/Co7C8fX1Tm3mAok9tdVYiIH0F/GSkkUCk
	BgDhu+2LxvZOenJ0FQj/ALBBNh2XHW0yjzq1vyQCgmX+1bzhzOms/ZZVwVWKgc7GJqZJbwWJ9Sl
	g==
X-Google-Smtp-Source: AGHT+IHFWYANVpGK9HJ0ObJlII94wAcR4bB0Evwh5tJ7H+kH51JGPm7ZBEdW/ugFcw6HQvAlvWfth+nEW24K91YYn2w=
X-Received: by 2002:a05:6214:2266:b0:6fd:1687:2e1b with SMTP id
 6a1803df08f44-70002ee6947mr70996486d6.27.1751032776825; Fri, 27 Jun 2025
 06:59:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com> <20250626134158.3385080-9-glider@google.com>
 <20250627082730.GS1613200@noisy.programming.kicks-ass.net>
In-Reply-To: <20250627082730.GS1613200@noisy.programming.kicks-ass.net>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 27 Jun 2025 15:58:59 +0200
X-Gm-Features: Ac12FXxMNEt1qGUjodKMiPINFABXeRDpEWe9lZCBGKZ_sY2yk46vnyO5SyFSoxY
Message-ID: <CAG_fn=Utve6zTW9kxwVbqpbQTRMtJPbvtyV3QkQ3yuinizF44Q@mail.gmail.com>
Subject: Re: [PATCH v2 08/11] kcov: add ioctl(KCOV_UNIQUE_ENABLE)
To: Peter Zijlstra <peterz@infradead.org>
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 10:27=E2=80=AFAM Peter Zijlstra <peterz@infradead.o=
rg> wrote:
>
> On Thu, Jun 26, 2025 at 03:41:55PM +0200, Alexander Potapenko wrote:
> > ioctl(KCOV_UNIQUE_ENABLE) enables collection of deduplicated coverage
> > in the presence of CONFIG_KCOV_ENABLE_GUARDS.
> >
> > The buffer shared with the userspace is divided in two parts, one holdi=
ng
> > a bitmap, and the other one being the trace. The single parameter of
> > ioctl(KCOV_UNIQUE_ENABLE) determines the number of words used for the
> > bitmap.
> >
> > Each __sanitizer_cov_trace_pc_guard() instrumentation hook receives a
> > pointer to a unique guard variable. Upon the first call of each hook,
> > the guard variable is initialized with a unique integer, which is used =
to
> > map those hooks to bits in the bitmap. In the new coverage collection m=
ode,
> > the kernel first checks whether the bit corresponding to a particular h=
ook
> > is set, and then, if it is not, the PC is written into the trace buffer=
,
> > and the bit is set.
>
> I am somewhat confused; the clang documentation states that every edge
> will have a guard variable.

There are two modes, -fsanitize-coverage=3Dedge and
-fsanitize-coverage=3Dbb, with edge being the default one.

When instrumenting basic blocks, the compiler inserts a call to
__sanitizer_cov_trace_pc at the beginning of every basic block in the
LLVM IR (well, not exactly, because some basic blocks are considered
redundant; this behavior can be disabled by passing
-fsanitize-coverage=3Dno-prune).

Now, instrumenting the edges is actually very similar to basic blocks:
we just find critical edges of the callgraph, add a new basic block in
the middle of those edges, then instrument basic blocks like we did
before.
For what it's worth, the number of coverage hooks does not usually
become quadratic when instrumenting edges, we only add a handful of
new basic blocks.

>
> So if I have code like:
>
> foo:    Jcc     foobar
> ...
> bar:    Jcc     foobar
> ...
> foobar:
>
> Then we get two guard variables for the one foobar target?

Correct.
Note that in this sense coverage guards behave exactly similar to
-fsanitize-coverage=3Dtrace-pc that we used before.

Consider the following example (also available at
https://godbolt.org/z/TcMT8W45o):

void bar();
void foo(int *a) {
  if (a)
    *a =3D 0;
  bar();
}

Compiling it with different coverage options may give an idea of how
{trace-pc,trace-pc-guard}x{bb,edge} relate to each other:

# Coverage we use today, instrumenting edges:
$ clang -fsanitize-coverage=3Dtrace-pc -S -O2
# Guard coverage proposed in the patch, instrumenting edges
$ clang -fsanitize-coverage=3Dtrace-pc-guard -S -O2
# PC coverage with basic block instrumentation
$ clang -fsanitize-coverage=3Dtrace-pc,bb -S -O2
# Guard coverage with basic block instrumentation
$ clang -fsanitize-coverage=3Dtrace-pc-guard,bb -S -O2

The number of coverage calls doesn't change if I change trace-pc to
trace-pc-guard.
-fsanitize-coverage=3Dbb produces one call less than
-fsanitize-coverage=3Dedge (aka the default mode).

>
> But from a coverage PoV you don't particularly care about the edges; you
> only care you hit the instruction.

Fuzzing engines care about various signals of program state, not just
basic block coverage.
There's a tradeoff between precisely distinguishing between two states
(e.g. "last time I called a()-->b()->c() to get to this line, now this
is a()->d()->e()->f()-c(), let's treat it differently") and bloating
the fuzzing corpus with redundant information.
Our experience shows that using such makeshift edge coverage produces
better results than just instrumenting basic blocks, but collecting
longer traces of basic blocks is unnecessary.

> Combined with the naming of the hook:
> 'trace_pc_guard', which reads to me like: program-counter guard, suggesti=
ng
> the guard is in fact per PC or target node, not per edge.
>
> So which is it?

The same hook is used in both the BB and the edge modes, because in
both cases we are actually instrumenting basic blocks.

>
> Also, dynamic edges are very hard to allocate guard variables for, while
> target guards are trivial, even in the face of dynamic edges.

All edges are known statically, because they are within the same
function - calls between functions are not considered edges.

> A further consideration is that the number of edges can vastly outnumber
> the number of nodes, again suggesting that node guards might be better.
>

For the above reason, this isn't a problem.
In the current setup (with edges, without guards), the number of
instrumentation points in vmlinux is on the order of single-digit
millions.
