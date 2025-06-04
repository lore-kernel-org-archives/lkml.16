Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B48107E0E4
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 07:05:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749020737; cv=none; b=rfTY1cjcQod0shWkjszgEm1o1Yzhx135q7v2bC/voQ9pDGiPwVX81u07bLm2KqyXOOabHzDje5e/h/wsRGWGCJuy59L2sOZvTOyn6ghuFMcv2cwK9NjS7sTSzEx63Fi2WOVwylygADH0wbP6wHmKWuVQaVJWD3Pb2vjjHLhi5Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749020737; c=relaxed/simple;
	bh=mZ2R63O+YBfjvJNpmaoBoBCgcJq/MHPkd1IbMGO1Kcg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+gUKtj6SFwPPAOAKsBHbzgylPkwNuo/amK9kQodkoCmp03XFG9NGwJQz0z1riP8B4mAR7Bq8vkXRIsG7IZc/OHlQKpbO/FuWxB2J+AeAN9/In+5swP6OcaF4X0rrHGTjcLav6TbeVVqdc+v055LF1vC8y/Sg7qItMTeymSCp/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=atHf3yo7; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="atHf3yo7"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-7086dcab64bso58762817b3.1
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 00:05:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749020734; x=1749625534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lDZZ6cTufCKlZIuYyhZh8oz9j9TlCoibqYgMmhxbbo4=;
        b=atHf3yo7hZzRozQncsZt0tl68MUyPpS7NsiSJcoa+k0xNcqng4566k7bASqDl8chM6
         nGk1a68Z94REGe9fN7bU2/w8/um7OwC+GWSEPAzyK4XwbBd7EWa0mnm1leqN0BdfZ4IN
         UYsMA2+DyOHfUCsiTvu2AqT6I16kDgvYRtrS/Bp99XqnkaXcKIp/8C1PIJ/pmjdGS2k+
         jKqa/AdGkPmJl3hIzd8BIhhjCrvr7gsjd+zzYFryxmQhFq5I/F/gn5WXM/oFrCYZwIyA
         8nA5OeEXZwfMCapmvcpCl8o2HSK+AdO92pJAgP12rqECxUDEmuK3FGCf+Y5ce1SjuwNf
         VKbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749020734; x=1749625534;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lDZZ6cTufCKlZIuYyhZh8oz9j9TlCoibqYgMmhxbbo4=;
        b=kpZwnWhSJnWZT0n7rteO+jPqnhjtCXBVTVd9z8M1wjr8EOmL0mWoT1LzDJ3S1h4dRO
         +Ie11+C+6uXi120+06n0PEABvAU1QVS/2CwxZrAIB95vkKYfiDNldOlS/HV2+sQlelR/
         Gm6+Ez3RPe5wIRDXO0vti7nC9i1zMsllSbr3/rKYC4CuC2S+gmICBTSqRtIoooGAgiOh
         5KKfl9FxGbnxPWuVjxlv7MPY/UiM/b4ThKVJFAfvmWrjasY2ZHW3ryFYunk2SlomoTlq
         7oJA7GOlxhR8JCFP8YEgRk5O9yX2q3E/hjTSdhvXH6quWggpk3UIeFnVgdR1A5XASHjW
         WpiA==
X-Forwarded-Encrypted: i=1; AJvYcCVnhhe5HZsPkPf6Y4ytYQLdJ75NyZ5OaB6bWlbgPlre1Ag1CKmZxWSBqQlSE8mIX6i7Jl5u67vp9yQAgcU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+euVlsf6cUt+NAVpLR5VX6mPw+3auvgrkdCexoqPHu0AaMveG
	nN+i9c4IF6A07IvXqJBVqOf6579lSYgYf/fh5fhyCk/bFotGXqDHARlR8xbemSU3sWom+NYzyty
	a0nDn+16/W+stcUGpWv9ltamYpRitBx4jvznJPzfXbQ==
X-Gm-Gg: ASbGnct0dtd+96igjffpcsepKx/h/CyfwjNN/WoQG9L9Cjt0d/dy/rf4nUdUFmGil+N
	icessc+1d5Y+mKuZ5a8OZQoKV3MfwmfPiyW/ot61BLGLeTNMYvxwZCes9yamWXg4cO1ntKBiV7/
	tMYWr6qZTcPOQZUZXvrS8HtSQbLmy/s1tZNotcpZH7V1QO
X-Google-Smtp-Source: AGHT+IFSL8PP82FeEHlW586LUJBqGjMjKciP3N8XZuNILx5sqm+hhzoxoGkGPl9cUJY5qydmYEj2w3SnSSg0cjhSv5E=
X-Received: by 2002:a05:690c:6c03:b0:70f:8884:17af with SMTP id
 00721157ae682-710d99fd497mr22161607b3.6.1749020734515; Wed, 04 Jun 2025
 00:05:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250525034354.258247-1-almasrymina@google.com>
 <87iklna61r.fsf@toke.dk> <CAHS8izOSW8dZpqgKT=ZxqpctVE3Y9AyR8qXyBGvdW0E8KFgonA@mail.gmail.com>
 <87h615m6cp.fsf@toke.dk> <aDcU51dx0N9d-aHz@x1>
In-Reply-To: <aDcU51dx0N9d-aHz@x1>
From: Ilias Apalodimas <ilias.apalodimas@linaro.org>
Date: Wed, 4 Jun 2025 10:04:58 +0300
X-Gm-Features: AX0GCFs4tbMtTKAsGAbJW1LDR5KC1TqVJIP8wUolf66i1Otws1abhpGGOJnIMUs
Message-ID: <CAC_iWjLmO4XZ_+PBaCNxpVCTmGKNBsLGyeeKS2ptRrepn1u0SQ@mail.gmail.com>
Subject: Re: [PATCH RFC net-next v2] page_pool: import Jesper's page_pool benchmark
To: Arnaldo Carvalho de Melo <acme@kernel.org>, =?UTF-8?B?VG9rZSBIw7hpbGFuZC1Kw7hyZ2Vuc2Vu?= <toke@redhat.com>, 
	Mina Almasry <almasrymina@google.com>, Jesper Dangaard Brouer <hawk@kernel.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi all,

This is very useful.

On Wed, 28 May 2025 at 16:51, Arnaldo Carvalho de Melo <acme@kernel.org> wr=
ote:
>
> On Wed, May 28, 2025 at 11:28:54AM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
> > Mina Almasry <almasrymina@google.com> writes:
> > > On Mon, May 26, 2025 at 5:51=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgen=
sen <toke@redhat.com> wrote:
> > >> Back when you posted the first RFC, Jesper and I chatted about ways =
to
> > >> avoid the ugly "load module and read the output from dmesg" interfac=
e to
> > >> the test.
>
> > > I agree the existing interface is ugly.
>
> > >> One idea we came up with was to make the module include only the "in=
ner"
> > >> functions for the benchmark, and expose those to BPF as kfuncs. Then=
 the
> > >> test runner can be a BPF program that runs the tests, collects the d=
ata
> > >> and passes it to userspace via maps or a ringbuffer or something. Th=
at's
> > >> a nicer and more customisable interface than the printk output. And =
if
> > >> they're small enough, maybe we could even include the functions into=
 the
> > >> page_pool code itself, instead of in a separate benchmark module?
>
> > >> WDYT of that idea? :)
>
> > > ...but this sounds like an enormous amount of effort, for something
> > > that is a bit ugly but isn't THAT bad. Especially for me, I'm not tha=
t
> > > much of an expert that I know how to implement what you're referring
> > > to off the top of my head. I normally am open to spending time but
> > > this is not that high on my todolist and I have limited bandwidth to
> > > resolve this :(
>
> > > I also feel that this is something that could be improved post merge.
>
> agreed
>
> > > I think it's very beneficial to have this merged in some form that ca=
n
> > > be improved later. Byungchul is making a lot of changes to these mm
> > > things and it would be nice to have an easy way to run the benchmark
> > > in tree and maybe even get automated results from nipa. If we could
> > > agree on mvp that is appropriate to merge without too much scope cree=
p
> > > that would be ideal from my side at least.
>
> > Right, fair. I guess we can merge it as-is, and then investigate whethe=
r
> > we can move it to BPF-based (or maybe 'perf bench' - Cc acme) later :)
>
> tldr; I'd advise to merge it as-is, then kfunc'ify parts of it and use
> it from a 'perf bench' suite.
>
> Yeah, the model would be what I did for uprobes, but even then there is
> a selftests based uprobes benchmark ;-)
>
> The 'perf bench' part, that calls into the skel:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/perf/bench/uprobe.c
>
> The skel:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/perf/util/bpf_skel/bench_uprobe.bpf.c
>
> While this one is just to generate BPF load to measure the impact on
> uprobes, for your case it would involve using a ring buffer to
> communicate from the skel (BPF/kernel side) to the userspace part,
> similar to what is done in various other BPF based perf tooling
> available in:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/perf/util/bpf_skel
>
> Like at this line (BPF skel part):
>
> https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.git/=
tree/tools/perf/util/bpf_skel/off_cpu.bpf.c?h=3Dperf-tools-next#n253
>
> The simplest part is in the canonical, standalone runqslower tool, also
> hosted in the kernel sources:
>
> BPF skel sending stuff to userspace:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/bpf/runqslower/runqslower.bpf.c#n99
>
> The userspace part that reads it:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/bpf/runqslower/runqslower.c#n90
>
> This is a callback that gets called for every event that the BPF skel
> produces, called from this loop:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/bpf/runqslower/runqslower.c#n162
>
> That handle_event callback was associated via:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/t=
ools/bpf/runqslower/runqslower.c#n153
>
> There is a dissection I did about this process a long time ago, but
> still relevant, I think:
>
> http://oldvger.kernel.org/~acme/bpf/devconf.cz-2020-BPF-The-Status-of-BTF=
-producers-consumers/#/33
>
> The part explaining the interaction userspace/kernel starts here:
>
> http://oldvger.kernel.org/~acme/bpf/devconf.cz-2020-BPF-The-Status-of-BTF=
-producers-consumers/#/40
>
> (yeah, its http, but then, its _old_vger ;-)
>
> Doing it in perf is interesting because it gets widely packaged, so
> whatever you add to it gets visibility for people using 'perf bench' and
> also gets available in most places, it would add to this collection:
>
> root@number:~# perf bench
> Usage:
>         perf bench [<common options>] <collection> <benchmark> [<options>=
]
>
>         # List of all available benchmark collections:
>
>          sched: Scheduler and IPC benchmarks
>        syscall: System call benchmarks
>            mem: Memory access benchmarks
>           numa: NUMA scheduling and MM benchmarks
>          futex: Futex stressing benchmarks
>          epoll: Epoll stressing benchmarks
>      internals: Perf-internals benchmarks
>     breakpoint: Breakpoint benchmarks
>         uprobe: uprobe benchmarks
>            all: All benchmarks
>
> root@number:~#
>
> the 'perf bench' that uses BPF skel:
>
> root@number:~# perf bench uprobe baseline
> # Running 'uprobe/baseline' benchmark:
> # Executed 1,000 usleep(1000) calls
>      Total time: 1,050,383 usecs
>
>  1,050.383 usecs/op
> root@number:~# perf trace  --summary perf bench uprobe trace_printk
> # Running 'uprobe/trace_printk' benchmark:
> # Executed 1,000 usleep(1000) calls
>      Total time: 1,053,082 usecs
>
>  1,053.082 usecs/op
>
>  Summary of events:
>
>  uprobe-trace_pr (1247691), 3316 events, 96.9%
>
>    syscall            calls  errors  total       min       avg       max =
      stddev
>                                      (msec)    (msec)    (msec)    (msec)=
        (%)
>    --------------- --------  ------ -------- --------- --------- --------=
-     ------
>    clock_nanosleep     1000      0  1101.236     1.007     1.101    50.93=
9      4.53%
>    close                 98      0    32.979     0.001     0.337    32.82=
1     99.52%
>    perf_event_open        1      0    18.691    18.691    18.691    18.69=
1      0.00%
>    mmap                 209      0     0.567     0.001     0.003     0.00=
7      2.59%
>    bpf                   38      2     0.380     0.000     0.010     0.09=
2     28.38%
>    openat                65      0     0.171     0.001     0.003     0.01=
2      7.14%
>    mprotect              56      0     0.141     0.001     0.003     0.00=
8      6.86%
>    read                  68      0     0.082     0.001     0.001     0.01=
0     11.60%
>    fstat                 65      0     0.056     0.001     0.001     0.00=
3      5.40%
>    brk                   10      0     0.050     0.001     0.005     0.01=
2     24.29%
>    pread64                8      0     0.042     0.001     0.005     0.02=
1     49.29%
> <SNIP other syscalls>
>
> root@number:~#

Thanks for all the pointers here.
Overall I agree we should merge this. Yes it's not ideal, but we've
been pointing people to run it over several years before accepting
patches. Having it out of tree doesn't help much. It's a test, it's a
bit ugly now, but it serves our purpose and the maintenance burden is
minimal.

Acked-by: Ilias Apalodimas <ilias.apalodimas@linaro.org>
>
> - Arnaldo
