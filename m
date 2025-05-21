Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CE4423817A
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 08:57:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747817842; cv=none; b=dnk2z7n+FYwYYHQ3EZVjA+1TGMa65r1F6zfwKcDRAF1s8yGlsE1wBVcdHtpld6xfH7WoeOAR6mXSzj6t7W4lp0O1d9LYHWyzulnJt0ftP46LvPFBWKo59b6CD/BjM83wcJ/qlrgiAA7W7P9r/7sem1zRDB0/D70KZQlBy9Oev9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747817842; c=relaxed/simple;
	bh=zl8iEglq2DGyA9Q11tNiOGheo0CjJ8+eb2acG0z9Q3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Qq5JDbkkO1Cgy3dnuLfsuDwxvmatjdwROos91veyeRbDf/ljIvBvBTMPzKGt+c842gumcBqwM4TC5Nbo9heXq+4GWsc0Y+nPKol/f6ukW6LbThn9BxB2xglNr9bcTQxtGzp07RN87fb2K9aN4bOZlNngcRx188RSvCsYKoD8tYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rbadiHmT; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rbadiHmT"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-32807137b94so52850011fa.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:57:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747817837; x=1748422637; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pfn9GpQfm9a/3SKsvy988zbkMD6eSUEwZHom/yG8Jq0=;
        b=rbadiHmT33s2NC8qwmIhtEuZPriSDGejmPvEZrkff+RWUdr8wVsVkqMzlvUYU/kStR
         4XqdjuN4GkToJFofShAgFhaKCj6+Ao+gWd/iZr7+thVT1rOSGy8dltte1i6ZvoMyoM4l
         omOOyj/SnCZOOJUrsTgDeKAKBoVPraUXAnFMVYVusMWQ3RfMrVGFpZabHJZOR1x0q5LU
         MJBpbfNo4APZuH/vfLQK9p46STn1dU+bc2Gfb8h+iklc+dK3+Qe7wOt+z8XUJjQ4E6Ij
         v4vlJKif0OpkPb6g/CkIA8tjN3eR8PgLAf2GTNcs+F5OF1IGZweR5PNC311SYfGuxLfl
         6EXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747817837; x=1748422637;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pfn9GpQfm9a/3SKsvy988zbkMD6eSUEwZHom/yG8Jq0=;
        b=ei6Y6AS19cQqZcj32vnrulQ1/ecnXOCAoTn5K+rKx0xkfun5UTbLhLnSShlmEBEmP1
         P091rtDWL8ZNxzS8RDC1YVougDO5SSlCqaeQWO3odXu/k7Y2AtgIeFO9xBRmtJzLPGh9
         Tao05WzCU8ozn2EIfOLLRB9e+VHEnBOjpxwl3Om8rc+Pb3oJ8CNK7KSWhBdlnpD0fU2o
         FEB9d/zyvwmC24rLdrZLJaUa4efn0R3DNDjxJKZ2u2NmndXT7K4iuL8OTOxlEFbY8Ejv
         ZGor5aE+EWz5xCxqCKLYVn9qEeq9OI0GE/t92M7AxdSzcqQtYwjxetgoVcDy1G7y/kus
         2I1w==
X-Forwarded-Encrypted: i=1; AJvYcCUCa3OzcgdvQtQld+bhCj4STFNfh1j7dd2BAnPllIK4dRfzltb0iXDMXTH8bwFWCqTtntzT6tciwOVu0RU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqiX2B+7yufDgNxe4Rtl19TOD4OBhiz8VyWGE5WxGIHb3C3tbg
	qVvPxdd2Ysru416xPEDM5tCPKN4maPfwMwhIuVVYEomU9XCfCLEvR/NMGZG6G4ocezaViB/bVb5
	2VPSiTX+4qwflC42ArA3TtNVtupi6e8d/HhdbyK/G
X-Gm-Gg: ASbGncuD5YX4iISu7xel/oPsDFdmtOHTuj/bJuxj2nGBhHQzxTrHlLNXsAdABnS+QAM
	ihI6OCA20NWFp+eJoy8ADe3k5LnvAOeWweKFHCfTEGuShtL3xT3sLGdNoVgst5FQRdVI2tnBfxI
	rvglbXVHD0ZpU35DLEsiptrbk09l8D3f5uyU8lGceqFSvIl3GP5RFer6zRCBBjoHAPILjxq3WPo
	xY=
X-Google-Smtp-Source: AGHT+IEmyhHiksNuSDVBTIsr7GxuDSTGx3jmySXIRBK4a16B1zR9gQsZ8DWjYO20sP5EPG8eASn3tmhmAXAh5gOOmfo=
X-Received: by 2002:a2e:a54a:0:b0:328:1102:4ccc with SMTP id
 38308e7fff4ca-32811024f91mr64633581fa.19.1747817837075; Wed, 21 May 2025
 01:57:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1740664852.git.dvyukov@google.com> <9a98ed5d655e9a0d66027779c75c3ba67601e1bf.1740664852.git.dvyukov@google.com>
 <26b779d4-0478-4926-ba5c-e71449e92020@efficios.com> <CACT4Y+aT9z8qjY-66wiOR0Wiep2BoTN7QJYxj-QK_KRXLmgiLA@mail.gmail.com>
 <c3781655-b667-4477-9337-445d8250fb4e@efficios.com> <CACT4Y+YpnCfm6xjdwnUJ-3ND_YPNdAqReffueF1dWGfxmJLWEQ@mail.gmail.com>
 <3c45a374-804f-4a9f-8885-5ef1bfc8676f@efficios.com> <CACT4Y+Y1Hgw9xmqhcCqPmgspOKLqvm6c54yxZus4uXd==PJxuQ@mail.gmail.com>
 <8a984527-5775-479c-8f16-f9feb38064c0@efficios.com>
In-Reply-To: <8a984527-5775-479c-8f16-f9feb38064c0@efficios.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Wed, 21 May 2025 10:57:05 +0200
X-Gm-Features: AX0GCFt_pNvfttuykgx_PQj1I2B94Fab6zfdh806FydQ_JkG8kEMZVQPf72e-cI
Message-ID: <CACT4Y+Y1BGYv+Vn_vNd50BM=5b8NKchqV6OTVhRj1_P7x-abbA@mail.gmail.com>
Subject: Re: [PATCH v6 4/4] selftests/rseq: Add test for rseq+pkeys
To: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Cc: peterz@infradead.org, boqun.feng@gmail.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	aruna.ramakrishna@oracle.com, elver@google.com, 
	"Paul E. McKenney" <paulmck@kernel.org>, x86@kernel.org, linux-kernel@vger.kernel.org, 
	Michael Jeanson <mjeanson@efficios.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Mar 2025 at 18:26, Mathieu Desnoyers
<mathieu.desnoyers@efficios.com> wrote:
>
> On 2025-03-10 12:31, Dmitry Vyukov wrote:
> > On Mon, 10 Mar 2025 at 16:41, Mathieu Desnoyers
> > <mathieu.desnoyers@efficios.com> wrote:
> >>
> >> On 2025-03-10 10:43, Dmitry Vyukov wrote:
> >>> On Mon, 10 Mar 2025 at 15:38, Mathieu Desnoyers
> >>> <mathieu.desnoyers@efficios.com> wrote:
> >>>>
> >>>> On 2025-03-10 10:36, Dmitry Vyukov wrote:
> >>>>> On Mon, 10 Mar 2025 at 15:30, Mathieu Desnoyers
> >>>>> <mathieu.desnoyers@efficios.com> wrote:
> >>>>>>
> >>>>>> On 2025-02-27 09:03, Dmitry Vyukov wrote:
> >>>>>>> Add a test that ensures that PKEY-protected struct rseq_cs
> >>>>>>> works and does not lead to process kills.
> >>>>>>>
> >>>>>>> Signed-off-by: Dmitry Vyukov <dvyukov@google.com>
> >>>>>>> Cc: Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
> >>>>>>> Cc: Peter Zijlstra <peterz@infradead.org>
> >>>>>>> Cc: "Paul E. McKenney" <paulmck@kernel.org>
> >>>>>>> Cc: Boqun Feng <boqun.feng@gmail.com>
> >>>>>>> Cc: Thomas Gleixner <tglx@linutronix.de>
> >>>>>>> Cc: Ingo Molnar <mingo@redhat.com>
> >>>>>>> Cc: Borislav Petkov <bp@alien8.de>
> >>>>>>> Cc: Dave Hansen <dave.hansen@linux.intel.com>
> >>>>>>> Cc: "H. Peter Anvin" <hpa@zytor.com>
> >>>>>>> Cc: Aruna Ramakrishna <aruna.ramakrishna@oracle.com>
> >>>>>>> Cc: x86@kernel.org
> >>>>>>> Cc: linux-kernel@vger.kernel.org
> >>>>>>> Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> >>>>>>> Fixes: d7822b1e24f2 ("rseq: Introduce restartable sequences system call")
> >>>>>>>
> >>>>>>> ---
> >>>>>>> Changes in v5:
> >>>>>>>      - Use static for variables/functions
> >>>>>>>      - Use RSEQ_READ/WRITE_ONCE instead of volatile
> >>>>>>>
> >>>>>>> Changes in v4:
> >>>>>>>      - Added Fixes tag
> >>>>>>>
> >>>>>>> Changes in v3:
> >>>>>>>      - added Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
> >>>>>>>      - rework the test to work when only pkey 0 is supported for rseq
> >>>>>>>
> >>>>>>> Changes in v2:
> >>>>>>>      - change test to install protected rseq_cs instead of rseq
> >>>>>>> ---
> >>>>>>>      tools/testing/selftests/rseq/Makefile    |  2 +-
> >>>>>>>      tools/testing/selftests/rseq/pkey_test.c | 98 ++++++++++++++++++++++++
> >>>>>>>      tools/testing/selftests/rseq/rseq.h      |  1 +
> >>>>>>>      3 files changed, 100 insertions(+), 1 deletion(-)
> >>>>>>>
> >>>>>>> diff --git a/tools/testing/selftests/rseq/Makefile b/tools/testing/selftests/rseq/Makefile
> >>>>>>> index 5a3432fceb586..9111d25fea3af 100644
> >>>>>>> --- a/tools/testing/selftests/rseq/Makefile
> >>>>>>> +++ b/tools/testing/selftests/rseq/Makefile
> >>>>>>> @@ -16,7 +16,7 @@ OVERRIDE_TARGETS = 1
> >>>>>>>
> >>>>>>>      TEST_GEN_PROGS = basic_test basic_percpu_ops_test basic_percpu_ops_mm_cid_test param_test \
> >>>>>>>                  param_test_benchmark param_test_compare_twice param_test_mm_cid \
> >>>>>>> -             param_test_mm_cid_benchmark param_test_mm_cid_compare_twice
> >>>>>>> +             param_test_mm_cid_benchmark param_test_mm_cid_compare_twice pkey_test
> >>>>>>>
> >>>>>>>      TEST_GEN_PROGS_EXTENDED = librseq.so
> >>>>>>>
> >>>>>>> diff --git a/tools/testing/selftests/rseq/pkey_test.c b/tools/testing/selftests/rseq/pkey_test.c
> >>>>>>> new file mode 100644
> >>>>>>> index 0000000000000..cc4dd98190942
> >>>>>>> --- /dev/null
> >>>>>>> +++ b/tools/testing/selftests/rseq/pkey_test.c
> >>>>>>> @@ -0,0 +1,98 @@
> >>>>>>> +// SPDX-License-Identifier: LGPL-2.1
> >>>>>>> +/*
> >>>>>>> + * Ensure that rseq works when rseq data is inaccessible due to PKEYs.
> >>>>>>> + */
> >>>>>>> +
> >>>>>>> +#define _GNU_SOURCE
> >>>>>>> +#include <err.h>
> >>>>>>> +#include <errno.h>
> >>>>>>> +#include <stdio.h>
> >>>>>>> +#include <stdlib.h>
> >>>>>>> +#include <string.h>
> >>>>>>> +#include <sys/mman.h>
> >>>>>>> +#include <sys/syscall.h>
> >>>>>>> +#include <ucontext.h>
> >>>>>>> +#include <unistd.h>
> >>>>>>> +
> >>>>>>> +#include "rseq.h"
> >>>>>>> +#include "rseq-abi.h"
> >>>>>>> +
> >>>>>>> +static int pkey;
> >>>>>>> +static ucontext_t ucp0, ucp1;
> >>>>>>> +
> >>>>>>> +static void coroutine(void)
> >>>>>>> +{
> >>>>>>> +     int i, orig_pk0, old_pk0, old_pk1, pk0, pk1;
> >>>>>>> +     /*
> >>>>>>> +      * When we disable access to pkey 0, globals and TLS become
> >>>>>>> +      * inaccessible too, so we need to tread carefully.
> >>>>>>> +      * Pkey is global so we need to copy it onto the stack.
> >>>>>>> +      */
> >>>>>>> +     int pk = RSEQ_READ_ONCE(pkey);
> >>>>>>> +     struct timespec ts;
> >>>>>>> +
> >>>>>>> +     orig_pk0 = pkey_get(0);
> >>>>>>> +     if (pkey_set(0, PKEY_DISABLE_ACCESS))
> >>>>>>> +             err(1, "pkey_set failed");
> >>>>>>> +     old_pk0 = pkey_get(0);
> >>>>>>> +     old_pk1 = pkey_get(pk);
> >>>>>>> +
> >>>>>>> +     /*
> >>>>>>> +      * Prevent compiler from initializing it by loading a 16-global.
> >>>>>>> +      */
> >>>>>>> +     RSEQ_WRITE_ONCE(ts.tv_sec, 0);
> >>>>>>> +     RSEQ_WRITE_ONCE(ts.tv_nsec, 10 * 1000);
> >>>>>>> +     /*
> >>>>>>> +      * If the kernel misbehaves, context switches in the following loop
> >>>>>>> +      * will terminate the process with SIGSEGV.
> >>>>>>> +      * Trigger preemption w/o accessing TLS.
> >>>>>>> +      * Note that glibc's usleep touches errno always.
> >>>>>>> +      */
> >>>>>>> +     for (i = 0; i < 10; i++)
> >>>>>>> +             syscall(SYS_clock_nanosleep, CLOCK_MONOTONIC, 0, &ts, NULL);
> >>>>>>> +
> >>>>>>> +     pk0 = pkey_get(0);
> >>>>>>> +     pk1 = pkey_get(pk);
> >>>>>>> +     if (pkey_set(0, orig_pk0))
> >>>>>>> +             err(1, "pkey_set failed");
> >>>>>>> +
> >>>>>>> +     /*
> >>>>>>> +      * Ensure that the kernel has restored the previous value of pkeys
> >>>>>>> +      * register after changing them.
> >>>>>>> +      */
> >>>>>>> +     if (old_pk0 != pk0)
> >>>>>>> +             errx(1, "pkey 0 changed %d->%d", old_pk0, pk0);
> >>>>>>> +     if (old_pk1 != pk1)
> >>>>>>> +             errx(1, "pkey 1 changed %d->%d", old_pk1, pk1);
> >>>>>>> +
> >>>>>>> +     swapcontext(&ucp1, &ucp0);
> >>>>>>> +     abort();
> >>>>>>> +}
> >>>>>>> +
> >>>>>>> +int main(int argc, char **argv)
> >>>>>>> +{
> >>>>>>> +     pkey = pkey_alloc(0, 0);
> >>>>>>> +     if (pkey == -1) {
> >>>>>>> +             printf("[SKIP]\tKernel does not support PKEYs: %s\n",
> >>>>>>> +                     strerror(errno));
> >>>>>>> +             return 0;
> >>>>>>> +     }
> >>>>>>> +
> >>>>>>> +     if (rseq_register_current_thread())
> >>>>>>> +             err(1, "rseq_register_current_thread failed");
> >>>>>>> +
> >>>>>>> +     if (getcontext(&ucp1))
> >>>>>>> +             err(1, "getcontext failed");
> >>>>>>> +     ucp1.uc_stack.ss_size = getpagesize() * 4;
> >>>>>>> +     ucp1.uc_stack.ss_sp = mmap(NULL, ucp1.uc_stack.ss_size,
> >>>>>>> +             PROT_READ | PROT_WRITE, MAP_ANON | MAP_PRIVATE, -1, 0);
> >>>>>>> +     if (ucp1.uc_stack.ss_sp == MAP_FAILED)
> >>>>>>> +             err(1, "mmap failed");
> >>>>>>> +     if (pkey_mprotect(ucp1.uc_stack.ss_sp, ucp1.uc_stack.ss_size,
> >>>>>>> +                     PROT_READ | PROT_WRITE, pkey))
> >>>>>>> +             err(1, "pkey_mprotect failed");
> >>>>>>> +     makecontext(&ucp1, coroutine, 0);
> >>>>>>> +     if (swapcontext(&ucp0, &ucp1))
> >>>>>>> +             err(1, "swapcontext failed");
> >>>>>>
> >>>>>> Should the rseq register be paired with a rseq unregister here ?
> >>>>>
> >>>>> I dunno. It's necessary for this test and in general. Tcmalloc won't
> >>>>> unregister on thread exit. Even for a libc it may be a bad idea due to
> >>>>> signals.
> >>>>
> >>>> The rseq register/unregister is only for the case where libc does not
> >>>> support rseq. But if you want to use rseq_register_current_thread(),
> >>>> then you'll want to pair it with unregister.
> >>>
> >>> Why? Isn't it better to have tests more realitic?
> >>
> >> If you use rseq.c rseq_register_current_thread without
> >> rseq_unregister_current_thread, then you rely on implicit
> >> unregistration done by the kernel at thread exit.
> >>
> >> Then you need to ensure your userspace runtime keep the TLS
> >> that holds the rseq area allocated for the entire execution
> >> of the thread until it exits in the kernel. Note that
> >> disabling signals is not sufficient to prevent the kernel
> >> from accessing the rseq area.
> >>
> >> GNU libc gets away with automatic unregistration at
> >> thread exit because it completely controls the lifetime
> >> of the registered rseq area, keeping it allocated for as
> >> long as the thread is executing.
> >>
> >> So in order to minimize the dependency on specific libc
> >> behavior in the kernel sefltests, the selftests rseq.h
> >> requires explicit registration *and* unregistration.
> >
> > If libc registers rseq (!rseq_ownership), then
> > rseq_unregister_current_thread is a no-op. And if libc has not
> > registered rseq, then we are not relying on any libc behavior. I don't
> > see how calling rseq_unregister_current_thread helps to rely less on
> > libc. Am I missing something?
>
> When libc does not support rseq (either because of the
> glibc tunable, or having an old glibc, or running another
> libc), rseq.c in the selftests registers an initial-exec
> TLS rseq area. This TLS rseq area's lifetime is handled
> by the libc. I don't want to depend on implementation-specific
> libc behavior, unless they are documented and part of the
> ABI.
>
> In your case the area won't be re-used because the program
> exits, but I'd rather use the same approach everywhere,
> which is to unregister explicitly.
>
> Note that in the librseq project, we are currently planning
> to remove the explicit thread registration/unregistration
> from the API, and will exclusively depend on having rseq support
> provided by the libc. It simplifies the implementation, the API,
> and will make it OK to link a dlopen'd .so against librseq.
> There has been no official release of librseq yet, so now is
> a good time to simplify the API and aim at what is becoming
> the primary use-case.

Hi,

I was distracted by other things for a while.
But now resent rebased series v7 with this fix.




> >
> >> Thanks,
> >>
> >> Mathieu
> >>
> >>
> >>>
> >>>
> >>>> Thanks,
> >>>>
> >>>> Mathieu
> >>>>
> >>>>>
> >>>>>> Thanks,
> >>>>>>
> >>>>>> Mathieu
> >>>>>>
> >>>>>>> +     return 0;
> >>>>>>> +}
> >>>>>>> diff --git a/tools/testing/selftests/rseq/rseq.h b/tools/testing/selftests/rseq/rseq.h
> >>>>>>> index ba424ce80a719..65da4a727c550 100644
> >>>>>>> --- a/tools/testing/selftests/rseq/rseq.h
> >>>>>>> +++ b/tools/testing/selftests/rseq/rseq.h
> >>>>>>> @@ -8,6 +8,7 @@
> >>>>>>>      #ifndef RSEQ_H
> >>>>>>>      #define RSEQ_H
> >>>>>>>
> >>>>>>> +#include <assert.h>
> >>>>>>>      #include <stdint.h>
> >>>>>>>      #include <stdbool.h>
> >>>>>>>      #include <pthread.h>
> >>>>>>
> >>>>>>
> >>>>>> --
> >>>>>> Mathieu Desnoyers
> >>>>>> EfficiOS Inc.
> >>>>>> https://www.efficios.com
> >>>>
> >>>>
> >>>> --
> >>>> Mathieu Desnoyers
> >>>> EfficiOS Inc.
> >>>> https://www.efficios.com
> >>
> >>
> >> --
> >> Mathieu Desnoyers
> >> EfficiOS Inc.
> >> https://www.efficios.com
>
>
> --
> Mathieu Desnoyers
> EfficiOS Inc.
> https://www.efficios.com
