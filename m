Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 058BA63B9
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:27:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748561252; cv=none; b=GJr/Miqr8pwQ9pHxd9Warnm+1J7khKlQeWe3YTpQ6XFoPI6J1N3GGb6rJOMWgqW8oLJZudaIGBZ9ikpAFB0+nOA+T4Rgojpv9CKdkG/mOZxlMJ+kCPzbn4vIxzWVpBIe8ZEb8aDHygFzTxdAMqLjeAjbFiFvCF+LL06E/5HV5ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748561252; c=relaxed/simple;
	bh=nkRgExktWkPoV4ASNKp4o0suzItHNI2KsTFhEZJS5/w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NwZuqgQ1aR5mqSzOwMeYcc7G20RTwZ6DmPQCXGqEuu+qKfGvEBzwp/if9Out5N4ODO+nZ3K1Yos5AQjkGKYSmqjCXv9WNrwH7++PPnrvF1cMzgBcYWXiBGCC7D5VHS/47k+DyJJggji97w7NcjRVQt89QZTXzRL5aZyUzGJp1+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4WqP59rr; arc=none smtp.client-ip=209.85.166.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4WqP59rr"
Received: by mail-il1-f174.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso48365ab.1
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:27:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748561250; x=1749166050; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nkRgExktWkPoV4ASNKp4o0suzItHNI2KsTFhEZJS5/w=;
        b=4WqP59rrvmiFjpBrP68AopwC4dYgVQAPI02wn37SBTrFts8Mogumqeel5QGko2K9Xa
         8E6y25Xc2cHZNNNN79ikZlSynGV/+J10vhxC+03e9LPegILKJq2BMc6QhzNu1hqgonct
         T8NOAhp0NJGSS01d8x3pbC3uHDs0VELwpOzhOzHUDERK+cJhVFVeUZRkV7mz/z/7BfYr
         KniaAaUMPstQfIUYFjZpC1BPpxQRcpq4YPsVTvUz2mwArPVVyvthkoVg2V8yTEbxQkUN
         0pR83CqVjCEoFtbfEz3RX6jLBXb8bc93hQ10UVtdaBTwXbry/n9A3nR6HwcQ8+trMGrT
         RFhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748561250; x=1749166050;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nkRgExktWkPoV4ASNKp4o0suzItHNI2KsTFhEZJS5/w=;
        b=wdz+Rze3+2iCKtPbFznB9KB/NxlYfLBv/1qprhiWkKkXO1FnqUK4gtll6IMVzkSHIZ
         36mkop9y54sWOa7RnWZ4p8Dszga8JbpTSK4h6yBegabIZOXVxomAQ9szmx+QzGzlBc69
         p09XWhslcT65tB6g3oHOQJkiL9ZqxzHX94L7WdVE33j1poXs2mEEeHA60721KPV1B2/d
         qni4U2DHY6rHutRKYAslITeXu7vBgIdh+59aNwbC5ktYbGC8eKJgCsqBPqlsFX8bRa7Q
         OH5+EAZEq2UzD+zdjL5pRqEFheFEeaPagcnBHyWfxm2YNi28fs595UT8FOMFsN+MEHQ7
         yPDg==
X-Forwarded-Encrypted: i=1; AJvYcCXQu7pUJGRjgQn4Ly8vPArqWVAT/7i+5N5FjZdWhS98ko2yxXbgrBLch6hV+dEvF8rHCD6PeLLOhsgV6zc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO+cMp94rX0BpITyctw7XNvC8Zy5a69UYU47jwXJ6vXwc5HySC
	m11GFr1j5aoHStbywkKrgpaBSqzyoIjm+oGuNkoepbfUbIQq7KXiSeD6OF2PwjPH9OMi8VONT7/
	A31U7FbTBKZ7AQCY5KCbqLBqguT5V7PbgmtUpqDLX
X-Gm-Gg: ASbGncuMLUQLoHJj/Xa0zZXBSlVXSlsO0YCa2mMyIw69FrdAmc4h0l50YBp0ZenN1Bt
	pw0j+6mKhqMkid57fHI0AaDBS5VUj88OSTCh2ZJZZKl+kvOS6BbUFBTqK4dNiRm4QziT7iQf3iT
	FQP1f9VykkFAuAfkhhMHrlxm0UtanJFBXG1/XYtAWcCLkJuzftLyKKAGM=
X-Google-Smtp-Source: AGHT+IHLmy0nRSI3pD4dWzHG/KLXzBhm5OI0nmwhq4T9rKXhINbdxKGX8zoaRsASfBrRMpq6BoDM9QIWbwJsPqa32/0=
X-Received: by 2002:a05:6e02:154b:b0:3dc:8116:44a8 with SMTP id
 e9e14a558f8ab-3dd9a7e4ba1mr1533675ab.26.1748561249792; Thu, 29 May 2025
 16:27:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521222725.3895192-1-blakejones@google.com>
 <20250521222725.3895192-4-blakejones@google.com> <CAP-5=fWZG-N8ZzRh6h1qRuEgFbxTCyEwGu1sZZy+YmnSeGgSSw@mail.gmail.com>
 <CAP_z_Ch2SKwVcSV7ffV1Lbp=6TuKLyofSs1gpfBPMf6mV9-wHA@mail.gmail.com>
In-Reply-To: <CAP_z_Ch2SKwVcSV7ffV1Lbp=6TuKLyofSs1gpfBPMf6mV9-wHA@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Thu, 29 May 2025 16:27:17 -0700
X-Gm-Features: AX0GCFuFUHoZigmrpc5J862lbtKYyW7pCTUFeDXVHf0lCXfWDnfxr2BAbxc_ILg
Message-ID: <CAP-5=fXkfVb4gwuSXr_yZMj8ctPr8LHs-Js7g9hP46dhkU_kQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] perf: collect BPF metadata from new programs, and
 display the new event
To: Blake Jones <blakejones@google.com>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Chun-Tse Shao <ctshao@google.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	James Clark <james.clark@linaro.org>, Charlie Jenkins <charlie@rivosinc.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, Leo Yan <leo.yan@arm.com>, 
	Yujie Liu <yujie.liu@intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Ben Gainey <ben.gainey@arm.com>, 
	linux-kernel@vger.kernel.org, bpf@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 29, 2025 at 4:09=E2=80=AFPM Blake Jones <blakejones@google.com>=
 wrote:
>
> Hi Ian,
>
> Thanks for your comments!
>
> On Thu, May 29, 2025 at 11:12=E2=80=AFAM Ian Rogers <irogers@google.com> =
wrote:
> > On Wed, May 21, 2025 at 3:27=E2=80=AFPM Blake Jones <blakejones@google.=
com> wrote:
> > > diff --git a/tools/perf/util/bpf_skel/sample_filter.bpf.c b/tools/per=
f/util/bpf_skel/sample_filter.bpf.c
> > > [...]
> > > +// This is used by tests/shell/record_bpf_metadata.sh
> > > +// to verify that BPF metadata generation works.
> > > +const int bpf_metadata_test_value SEC(".rodata") =3D 42;
> >
> > This is a bit random.
>
> Yeah, that's fair. I added it because it was a straightforward way to rel=
iably
> get a known value that I could observe from tests/shell/test_bpf_metadata=
.sh.
>
> > For the non-BPF C code we have a build generated
> > PERF-VERSION-FILE that contains something like `#define PERF_VERSION
> > "6.15.rc7.ge450e74276d2"`. I wonder having something like
> ]> [...]
> > would be more useful/meaningful. Perhaps the build could inject the
> > variable to avoid duplicating it all the BPF skeletons.
>
> I could do this if you'd like. It would make it harder for my test to che=
ck
> that it was reporting the right value, because the PERF-VERSION-FILE defi=
nes
> PERF_VERSION in a way that's useful for C programs but not shell scripts.
> I'd just have the test check that it was reporting some string (maybe one
> with at least one dot in it, if I can stably make that assumption). WDYT?

It should be okay as you can compare the string against that reported
by `perf version`. On my build in `/tmp/perf`:
```
$ /tmp/perf/perf version
perf version 6.15.rc7.gb9ac06abfde9
$ cat /tmp/perf/PERF-VERSION-FILE
#define PERF_VERSION "6.15.rc7.gb9ac06abfde9"
```

> > nit: I wonder for testing it would be interesting to have 0 and >1
> > metadata values tested too. We may want to have test programs
> > explicitly for that, in tools/perf/tests.
>
> My testing right now depends pretty heavily on the fact that perf will lo=
ad
> sample_filter.bpf.o for me; this seems much better than trying to load a
> BPF program manually from a test.
>
> If I could find other perf invocations that would load other BPF programs
> automatically, I could potentially test the "0 metadata" and ">1 metadata=
"
> cases. That would involve more BPF-program-specific modifications, though=
,
> which would be closer to the thing you objected to above. So to me this
> doesn't seem worth the effort.

Ok, and the main 1 metadata case is well covered by the test you added.

Thanks,
Ian
