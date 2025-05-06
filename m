Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C2522D9FB
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 06:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746513995; cv=none; b=DgLGg4uq5dqiOaNK1Zv9HxCKCZ9qvvq9XiDlQtuA8U6pvc7eCF9ld5J77VWKpL0Q/P2wR+AjOGt6Ew0TqEQROcVcr07h+K2fr0Et7k7Vi1McYHx+xu6seuI3pm0Ipx1Xj0RsDtO+gRxKgnlH2KDG8oAYDdkUkYrLOLVoiltE4TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746513995; c=relaxed/simple;
	bh=5Xi6j//R02dpub/R7xxHcBfZMhj1LSXeBKp5n05nTvQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mnEB5E5/9bF9s17AxOV78aGMvoOPgNS3c/3ScDVDv6SwXkuHprwY/sadk4DsuhDwx/8lvUMyxPABQYEFwRwc/1EtmObgKZLOJbF5nnUEgLjeSTjCycxA9Qfna2Os4Ti3k0CcfDtkJwzcCOJnh+wVzUgpGFPWEIc6p2pD0s62EKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wv4ZsJPy; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wv4ZsJPy"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-30de488cf81so54232291fa.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 23:46:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746513992; x=1747118792; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+TkT8CQai/ZWtD1K5cF0ad1w9jdiTtki3uhfACJlgto=;
        b=wv4ZsJPy78qW2Ry7u6LbEeFyNfoBXAks1HWIXRhWF4dcMRKvydWJw6OBlbbK//QSr9
         3Nnz1fwBqKmM9rqdD6uAqlvs6v5pLDy6bytsx4HrWiNQjb0N7F3A6capq2AT/vJ4Tl4l
         ExFnEL7Q/JpN5G3dHxtEEYUgZeDrBR+4izajKEN0UCG2lQxBC85wmhG0g6IB0JgsXiTW
         7CfqgLFOAcIwVmHLmulUkDPcmGdU4GwR7MoOADCIUcXdwny0r4pVeR2tM9zc297Rxc0u
         NiEcq6Gt9r34ZmzAaxu4GHROTQw3JjYuSGtE84hKO9y+jglOfEawcj2JLNEP2TJTUJtR
         KXMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746513992; x=1747118792;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+TkT8CQai/ZWtD1K5cF0ad1w9jdiTtki3uhfACJlgto=;
        b=vjUpe1Y3TMvA9e1ws//trAt4Cy7VK75CJFpPEqyXLDqUsdgJy9fVmG05iPh8kmUdlV
         NV1qTK8V32BS42VVj0u5YDykifz2aXOidgSD2AURhKfEm4LUqF3vQIojrAMcUW1tB0Rp
         0JGKxRAlXl0KEsB53k/CEHWpLCyC4Bmc24c82Xmbp+wvHi9+EPGO6+1m1Qtz2UGUU4pr
         3to7OS8pgb26esj2TG0TcBsegxAqkRtFEMRuCUmrU8MvyUFSKMNMR+rzBNs3j3GQ4zNn
         sA2yQlZbMU7qg8YR900WjiTDD+RSuRqU4ZQTLdWc321E2MFKYP3Gs9cTCJMQAG7kxHOO
         6Y7A==
X-Forwarded-Encrypted: i=1; AJvYcCUiqsvbrEY4YOhEdxHh+0Y76wWrH2uP9CEe1x4pMZTZ7hVMGsbF6GWARq80ykTUEoWWq00ls15qIEJI0x4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0MrGXhh6Z7C0CtneMv8ypa75MryqHnzVR4YzBy8Vy4ALhIwE
	s8GCZcBn3OsmleP4FOZi81MJnzjxyCJGwuAkcfRsjdkjSaTUvYMEYli4f9Xl4MXZqKDTuogW+O3
	91Mli4rdoZqJbXcbM0weiq6Yeu5ez2OkRVNrQ
X-Gm-Gg: ASbGncuexSfErST9s48wV1sHtXHbEFfWHtzVqLFtw0aEGb4YnGYicQIl13NFtIK/M6V
	nVSDS2NkKl4MgbRwsAgnUoTY0mlX/qtRCRaSSfz0TPdau7hsG9SEvKb7GvVxpfVFIS9+n0u7RiZ
	RitgJZj/0pWo8/XfcpdPDrSDvjc8TL/MGs+8v52/yWqzP42FqGpFu9Fxg=
X-Google-Smtp-Source: AGHT+IF/1cJ0gn0VbpuxAups41aSoda4aMlkyRVuVVCTnyySXdE5xjS3ApovhcJGPqcHbWgerPHgZOwlWlSuLsCbw5o=
X-Received: by 2002:a05:651c:b2a:b0:319:d856:c2f3 with SMTP id
 38308e7fff4ca-3266b59789emr4354901fa.10.1746513991522; Mon, 05 May 2025
 23:46:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250503003620.45072-1-namhyung@kernel.org> <CACT4Y+Yr7vffLYG+YmyB=9Vn_oxdQqR_6U4d-_WeQoOtPXZ6iw@mail.gmail.com>
 <aBmei7cMf-MzzX5W@google.com> <CACT4Y+ameQFd3n=u+bjd+vKR6svShp3NNQzjsUo_UUBCZPzrBw@mail.gmail.com>
 <aBmvmmRKpeVd6aT3@google.com>
In-Reply-To: <aBmvmmRKpeVd6aT3@google.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 6 May 2025 08:46:20 +0200
X-Gm-Features: ATxdqUEgdDVnyyriKiX9pDQDs3z8t8w0Gd3KuZT0JW1dkH5BkkyNq1pTZnz9pko
Message-ID: <CACT4Y+bm4gCO_sGvEkxLQfw8JyrWvCzqV_H5h+oebt8kk1_Hwg@mail.gmail.com>
Subject: Re: [RFC/PATCH] perf report: Support latency profiling in system-wide mode
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Ian Rogers <irogers@google.com>, 
	Kan Liang <kan.liang@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@kernel.org>, LKML <linux-kernel@vger.kernel.org>, 
	linux-perf-users@vger.kernel.org, Andi Kleen <ak@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

On Tue, 6 May 2025 at 08:43, Namhyung Kim <namhyung@kernel.org> wrote:
>
> On Tue, May 06, 2025 at 07:55:25AM +0200, Dmitry Vyukov wrote:
> > On Tue, 6 May 2025 at 07:30, Namhyung Kim <namhyung@kernel.org> wrote:
> > >
> > > Hello,
> > >
> > > On Mon, May 05, 2025 at 10:08:17AM +0200, Dmitry Vyukov wrote:
> > > > On Sat, 3 May 2025 at 02:36, Namhyung Kim <namhyung@kernel.org> wrote:
> > > > >
> > > > > When it profile a target process (and its children), it's
> > > > > straight-forward to track parallelism using sched-switch info.  The
> > > > > parallelism is kept in machine-level in this case.
> > > > >
> > > > > But when it profile multiple processes like in the system-wide mode,
> > > > > it might not be clear how to apply the (machine-level) parallelism to
> > > > > different tasks.  That's why it disabled the latency profiling for
> > > > > system-wide mode.
> > > > >
> > > > > But it should be able to track parallelism in each process and it'd
> > > > > useful to profile latency issues in multi-threaded programs.  So this
> > > > > patch tries to enable it.
> > > > >
> > > > > However using sched-switch info can be a problem since it may emit a lot
> > > > > more data and more chances for losing data when perf cannot keep up with
> > > > > it.
> > > > >
> > > > > Instead, it can maintain the current process for each CPU when it sees
> > > > > samples.
> > > >
> > > > Interesting.
> > > >
> > > > Few questions:
> > > > 1. Do we always see a CPU sample when a CPU becomes idle? Otherwise we
> > > > will think that the last thread runs on that CPU for arbitrary long,
> > > > when it's actually not.
> > >
> > > No, it's not guaranteed to have a sample for idle tasks.  So right, it
> > > can mis-calculate the parallelism for the last task.  If we can emit
> > > sched-switches only when it goes to the idle task, it'd be accurate.
> >
> > Then I think the profile can be significantly off if the system wasn't
> > ~100% loaded, right?
>
> Yep, it can be.
>
> >
> > > > 2. If yes, can we also lose that "terminating" even when a CPU becomes
> > > > idle? If yes, then it looks equivalent to missing a context switch
> > > > event.
> > >
> > > I'm not sure what you are asking.  When it lose some records because the
> > > buffer is full, it'll see the task of the last sample on each CPU.
> > > Maybe we want to reset the current task after PERF_RECORD_LOST.
> >
> > This probably does not matter much if the answer to question 1 is No.
> >
> > But what I was is the following:
> >
> > let's say we have samples:
> > Sample 1 for Pid 42 on Cpu 10
> > Sample 2 for idle task on Cpu 10
> > ... no samples for some time on Cpu 10 ...
> >
> > When we process sample 2, we decrement the counter for running tasks
> > for Pid 42, right.
> > Now if sample 2 is lost, then we don't do decrement and the accounting
> > becomes off.
> > In a sense this is equivalent to the problem of losing context switch event.
>
> Right.  But I think it's hard to be correct once it loses something.
>
> >
> >
> > > > 3. Does this mode kick in even for non system-wide profiles (collected
> > > > w/o context switch events)? If yes, do we properly understand when a
> > > > thread stops running for such profiles? How do we do that? There won't
> > > > be samples for idle/other tasks.
> > >
> > > For non system-wide profiles, the problem is that it cannot know when
> > > the current task is scheduled out so that it can decrease the count of
> > > parallelism.  So this approach cannot work and sched-switch info is
> > > required.
> >
> > Where does the patch check that this mode is used only for system-wide profiles?
> > Is it that PERF_SAMPLE_CPU present only for system-wide profiles?
>
> Basically yes, but you can use --sample-cpu to add it.

Are you sure? --sample-cpu seems to work for non-system-wide profiles too.

> In util/evsel.c::evsel__config():
>
>         if (target__has_cpu(&opts->target) || opts->sample_cpu)
>                 evsel__set_sample_bit(evsel, CPU);
