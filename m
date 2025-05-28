Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6B28E56A
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:14:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748452465; cv=none; b=IBeEdBuCOUhwRc/mfuDwg9+Elj6kPTi3EgctcoKEhNo/AzE2XIHlgzQmUd4Hiiok3drB5UHEM4zXPvE4TUhyur+QAEPztTps0zbxZyf4NvUPz+rDi4xYQ6U8lQApCIxRM2v3rJxZU2/nfFHP4NFe7S+14umRowPH001KNJ0X+bI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748452465; c=relaxed/simple;
	bh=5V8sHcKdX0ZloH6uba8PkmXe7ZxbXS2g7lOsFOQ4DIs=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=XKfVrUumACPN+hDSDAtfjURaBM+SP3Puw7MnLupZE+HiW0ceWlpZYSQGt138c29eS9FKGDnP2W2SCr8E+bqbGaKon9vm538SpNnsZ59f53WBZiNsuCWyA3xkJxHxhG67uYuKKVMhlpB5MBL/AEhNka77uZiIakacJ4ohyCHV0lE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=B4XLO/G1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="B4XLO/G1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748452462;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Af1cQmnUWBy6xyFGLsztGXRxWkyoQy2XklFMCkPpofg=;
	b=B4XLO/G1VkWlwORmexwIYHTwdOghZ/FFwq2So5xQU4AqVhvDaqgC1fkqiZGA/pn5gRy0EW
	HYZ92z+CuwIH1PdJKxg38AA60MgLzsS0f+9v7E1Yyhp3zRQSIWJRcndpA7ty+0Z8fUbUq0
	13B47Jtt+jaqLq2quUxT96wAfyXHu24=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-466-CZ6MJv7mOkyguqM3YzS0dw-1; Wed, 28 May 2025 13:14:19 -0400
X-MC-Unique: CZ6MJv7mOkyguqM3YzS0dw-1
X-Mimecast-MFC-AGG-ID: CZ6MJv7mOkyguqM3YzS0dw_1748452458
Received: by mail-ej1-f69.google.com with SMTP id a640c23a62f3a-ac3e0c1336dso255589366b.3
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748452458; x=1749057258;
        h=content-transfer-encoding:mime-version:message-id:date:references
         :in-reply-to:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Af1cQmnUWBy6xyFGLsztGXRxWkyoQy2XklFMCkPpofg=;
        b=vHh8hefoYMXTgGsStvfGggfrb6Kj78dD4oVFealEfXZ6VonfgktO0n4ljA7XcPmtP/
         1n28AB3qTor/cA9zR2G9Bc1cRCjWzel8m08S3fsYnVgX3rncn4HHsepS+F5ynNPuPC//
         3Jv9iW6BPS551TKDipFsmwEcRHIJVJvD+4RCREM43aBdp+TUwLH4FqeLvLtIIAfACZ+V
         ByQtiaBQ0SgoA8B4gSiMZj2clC6thglUaxl2WKuMdn+/uYcIZn7j6vF/ZbbARLNKg6gh
         m5HMUz8F+zjY0UR3YOsrWJq/iB743YZ/y7RntyDZ6Yh69bi+1TKV2kDtBfufWVMFqKAK
         U/PQ==
X-Forwarded-Encrypted: i=1; AJvYcCUNllWnp8wCi4V3Whf4lTbyz2u8wOcpPbCOMI0ibisynSnv34AHfjyU7FvTkFDcXVIeMyABbk9YN1mSaHI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyMOPBZAyO8JbclvH6GNybge6Nsn8yo51mOXDF4U9WQP3MeEsW7
	3epyOKQ46WLk7b+L8PTBfGE8v7y4BIjUGQg+7WxYDiLh2xXXnrOQrQH0VtBMhU8t7aX0qT8cIie
	zdCmzs3n2xSBgU3Aas6Wl7m4HrjGEXgk6YAsKyCQjkEu4t+GJKVnOQAehkgxCZgs49Q==
X-Gm-Gg: ASbGnctFSz248/fmuspjDuDVxJYddonJOG4UlmmK7bvs5MhB/R0g1l/j909LUfhYFdL
	s23F+caeZBcejLJ9klLjaRhDX8Bc8QlxsLh1x3Add1F2tiHosI+iJPcuMgKJdAPA1jEwR7kyp4I
	yxH4BLipguIhVO6BjMi0EZxL9TW2Yv0cD6lHtniAeKXTsggFVFuQcgW3bPbQRBSuhVuyDfQ+lv9
	MSNVB0VLUUNUXsh1Ez3aTiE4KJBfYqUxwYbAIJahRf4mKWj1RMNg9HmuPPYiaGREZ/tmE+vik5L
	wMldTDU6RGvEN2zyRviSJi+vMx0CFnkjmzAN
X-Received: by 2002:a17:906:dc8a:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-ad85b329c4bmr1741951466b.51.1748452458096;
        Wed, 28 May 2025 10:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdcbEeJUfJ8I7m21/YTxGQ8eHMpRz88wZmwa7gj2fZublgDvyXBqKeXaE7YhDftP+Dy8Xh+A==
X-Received: by 2002:a17:906:dc8a:b0:ad2:28be:9a16 with SMTP id a640c23a62f3a-ad85b329c4bmr1741947766b.51.1748452457601;
        Wed, 28 May 2025 10:14:17 -0700 (PDT)
Received: from alrua-x1.borgediget.toke.dk ([45.145.92.2])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ad8a19acb5esm139084866b.5.2025.05.28.10.14.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 May 2025 10:14:16 -0700 (PDT)
Received: by alrua-x1.borgediget.toke.dk (Postfix, from userid 1000)
	id D69BF1AA8976; Wed, 28 May 2025 19:14:15 +0200 (CEST)
From: Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?= <toke@redhat.com>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Mina Almasry <almasrymina@google.com>, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, Jesper
 Dangaard Brouer <hawk@kernel.org>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, Jakub Kicinski
 <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman
 <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, Ilias Apalodimas
 <ilias.apalodimas@linaro.org>
Subject: Re: [PATCH RFC net-next v2] page_pool: import Jesper's page_pool
 benchmark
In-Reply-To: <aDcU51dx0N9d-aHz@x1>
References: <20250525034354.258247-1-almasrymina@google.com>
 <87iklna61r.fsf@toke.dk>
 <CAHS8izOSW8dZpqgKT=ZxqpctVE3Y9AyR8qXyBGvdW0E8KFgonA@mail.gmail.com>
 <87h615m6cp.fsf@toke.dk> <aDcU51dx0N9d-aHz@x1>
X-Clacks-Overhead: GNU Terry Pratchett
Date: Wed, 28 May 2025 19:14:15 +0200
Message-ID: <87cybsr72w.fsf@toke.dk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Arnaldo Carvalho de Melo <acme@kernel.org> writes:

> On Wed, May 28, 2025 at 11:28:54AM +0200, Toke H=C3=B8iland-J=C3=B8rgense=
n wrote:
>> Mina Almasry <almasrymina@google.com> writes:
>> > On Mon, May 26, 2025 at 5:51=E2=80=AFAM Toke H=C3=B8iland-J=C3=B8rgens=
en <toke@redhat.com> wrote:
>> >> Back when you posted the first RFC, Jesper and I chatted about ways to
>> >> avoid the ugly "load module and read the output from dmesg" interface=
 to
>> >> the test.
>
>> > I agree the existing interface is ugly.
>
>> >> One idea we came up with was to make the module include only the "inn=
er"
>> >> functions for the benchmark, and expose those to BPF as kfuncs. Then =
the
>> >> test runner can be a BPF program that runs the tests, collects the da=
ta
>> >> and passes it to userspace via maps or a ringbuffer or something. Tha=
t's
>> >> a nicer and more customisable interface than the printk output. And if
>> >> they're small enough, maybe we could even include the functions into =
the
>> >> page_pool code itself, instead of in a separate benchmark module?
>
>> >> WDYT of that idea? :)
>
>> > ...but this sounds like an enormous amount of effort, for something
>> > that is a bit ugly but isn't THAT bad. Especially for me, I'm not that
>> > much of an expert that I know how to implement what you're referring
>> > to off the top of my head. I normally am open to spending time but
>> > this is not that high on my todolist and I have limited bandwidth to
>> > resolve this :(
>
>> > I also feel that this is something that could be improved post merge.
>
> agreed
>
>> > I think it's very beneficial to have this merged in some form that can
>> > be improved later. Byungchul is making a lot of changes to these mm
>> > things and it would be nice to have an easy way to run the benchmark
>> > in tree and maybe even get automated results from nipa. If we could
>> > agree on mvp that is appropriate to merge without too much scope creep
>> > that would be ideal from my side at least.
>=20=20
>> Right, fair. I guess we can merge it as-is, and then investigate whether
>> we can move it to BPF-based (or maybe 'perf bench' - Cc acme) later :)
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
> Usage:=20
> 	perf bench [<common options>] <collection> <benchmark> [<options>]
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

Cool, thanks for the pointers! Guess we'd need to restructure the
functions to be benchmarked a bit, but that should be doable I guess.

-Toke

