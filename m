Received: from mail-il1-f171.google.com (mail-il1-f171.google.com [209.85.166.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2EB01D7985
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 15:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684756; cv=none; b=RQ5khVhrtRkOXDZPLbWvUhFSi4SuJ3r2Dse2pXDt6Za4unxzby5psT1owMEsZcVy8V+cEnSmpU8kG0w5t8MRnkGmLs0sFByMazeVHRQT59T2obcDcOZ+cihL4Mz5TjJGph3sPk/FTl+CQ05VrRViLa1JJBLQPYgHBb47gRDHH44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684756; c=relaxed/simple;
	bh=5i/Y8zvwma5m0qjxbZ1Fo7U5gAawdWdvzgbemBgeKNk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q/8+hL8exZN7K5uHnwN/v3OKKAZ51slbv/KCQTZTKNYH3ti5azolJ0IYP07PPi0TtrrqjFVRPzlfcs3uWiQnVFMr4r2rH6oD85rfdQHY+l2w0lAHoh6e+eqlVNejHps7CrIab00BZQmD1r4lDAkxwnvSr5boJBDukYWWxAWm+PM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YWiqzRJr; arc=none smtp.client-ip=209.85.166.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YWiqzRJr"
Received: by mail-il1-f171.google.com with SMTP id e9e14a558f8ab-3a7dfcd40fcso118645ab.1
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 07:59:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738684753; x=1739289553; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=C8roB2k/aXo76JhJB8t9pm/ESNWX82k0droQLLf7sA0=;
        b=YWiqzRJrPa+le/18cMtxj73t3RhUUBQICmNIcXNjQ6+M1JErvlcjui3e5ZMD6WCIJC
         udZetOHgjjOTW8BUmfXIs/DNZ/9+qMNXNji8g6ZTxW+DKqFaqXH5U0T4Nn64ViG3Kkw5
         wDf5wwzHMAhAjfEKurCuoJ9k54C4uADF72RIwGPWMRmng9V7kd2FwoN3kuV4bmuECIbr
         Y9ZFiPhnKRWubYmJRbDaTHIV8SeeQjp8oTK25vP+UWwwyYKNn+0pcRRj4YWq8vpFrEoK
         myhN6XRQoFsUaoz17kjQD0EAQw1B/+sdF/IFtpmvMF83o4+xpNwKcYvJf0IpyPesbgyv
         eFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738684753; x=1739289553;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=C8roB2k/aXo76JhJB8t9pm/ESNWX82k0droQLLf7sA0=;
        b=kdhnMb0aVu/fO74fcpCfcoLZK6CFPVvdobbRmKTYOr3S0QeVsIIo+3Wl0syA0ReqFh
         OGrOhxE16EkagIrycnMcpr3VrVEBwREsjhIdKs5RfQRIb4KmvFIHClpq+ozxo9+JdLUu
         hvq+624yqKWlIrqfOMU/PQYsfmEJx0/cJN3v4K+cxdbzscg1gy7sqYICJiqp2z5/P2wx
         W84yaOaV7RrwjQDilRD19CPrEvvW9J0+RSuAWAJXRHd8dfGWWbQgH2801/DP/4yJxMsB
         wQl8exOrrEUvSTyCitFNHPFV3oSytwwcwv/PiHiIsOJgxUONeRODI0tfVxLEkvzXzx1t
         uCJw==
X-Forwarded-Encrypted: i=1; AJvYcCVZy4M5oR/O04f4SBNj0jsqc8cvaZzAb8DaRimFL82ud+JEpHUuO0IZmNruGV8PvF051ARz49DQKbgG4og=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdGbDsWzDACcJVvwwiXJRdPbE3D52DVtOeuqLpqyXhM9UrdB3g
	HGaTEu0SREHnqsFStWLzwE+v99zCxspJkR0hsdduQk1mBINDsX3Ni/tHeYTUUMQdz7mhCHmFuB6
	i3gJdH1b99t2DgutBkbKB4AGNRVjtqk/bV51I
X-Gm-Gg: ASbGncu713/DsjJprYv3pyGGHDzFgvyw+6bqu1hj0JPZsBLwCTi19WMp8QUwhwYNcdy
	ytsM3KNrbiNxSU1P9Z+wLNnnGpV/xs6aL379p66aNMUN/MXKHyX2djVbxg7sGJnTwWB0+BOiaGf
	3EZ4eYD1k1an4GpLGa6QsQi7M=
X-Google-Smtp-Source: AGHT+IFn3oe3TOYlUvP1hm251ItKyjv+s3unlb/z1vl69ZziybSzR14r3BFMyL/cDl56jqIbUMQYbzxO5y9V9kTP4z0=
X-Received: by 2002:a05:6e02:1a86:b0:3ce:79c5:56e0 with SMTP id
 e9e14a558f8ab-3d040f53289mr3523025ab.9.1738684753587; Tue, 04 Feb 2025
 07:59:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130030525.1482498-1-namhyung@kernel.org> <20250130030525.1482498-2-namhyung@kernel.org>
 <CAP-5=fVJDi2UuhTYk5g-QaLqZC29tAprKWs_0PKNmd+y=iugjA@mail.gmail.com> <Z6GCde4XqCuEZlgz@google.com>
In-Reply-To: <Z6GCde4XqCuEZlgz@google.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 4 Feb 2025 07:59:01 -0800
X-Gm-Features: AWEUYZmurQeFx436MfzVGQG1Cg-n0O0xRTM7xFqFOWVQYWuKHdbwPWICSKvdmgI
Message-ID: <CAP-5=fVrFzxcLZG8DyYh2rbd3u4133V6hhrQFCHsq_QMVVW=9g@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] perf trace: Allocate syscall stats only if summary
 is on
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Howard Chu <howardchu95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 6:59=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Sat, Feb 01, 2025 at 10:57:00PM -0800, Ian Rogers wrote:
> > On Wed, Jan 29, 2025 at 7:05=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > >
> > > The syscall stats are used only when summary is requested.  Let's avo=
id
> > > unnecessary operations.  Pass 'trace' pointer to check summary and gi=
ve
> > > output file together.
> >
> > I don't think this last sentence makes sense.
>
> Thanks for your review.  I'd say:  Pass 'trace' pointer instead of doing
> 'summary' option and 'output' file pointer separately.

This still doesn't make sense. There is lazier initialization:
```
-               ttrace->syscall_stats =3D intlist__new(NULL);
+               if (trace->summary)
+                       ttrace->syscall_stats =3D intlist__new(NULL);
```
and there are functions that take a FILE* but now we're going to use
the one in trace instead:
```
@@ -1568,7 +1569,7 @@ static struct thread_trace *thread__trace(struct
thread *thread, FILE *fp)

        return ttrace;
 fail:
-       color_fprintf(fp, PERF_COLOR_RED,
+       color_fprintf(trace->output, PERF_COLOR_RED,
                      "WARNING: not enough memory, dropping samples!\n");
        return NULL;
```
So why does the one passed to trace still exist? Unfortunately names
like "fp" and "output" are not intention revealing.

Anyway, from the commit message and the code I don't understand what
this change is trying to do.

Thanks,
Ian
