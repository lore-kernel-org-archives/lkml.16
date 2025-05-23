Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08CC8296D26
	for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 16:52:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748019179; cv=none; b=h12RCqN6OdaQZq16ZXQlKTFjbV4KeCb6XIM6h7dkYlT2qiC4utx5XC7eII2eeDafIqRwLKkF8IIZmdaB4ENNsUz5pMMN4ios1dyuNCq3qp2cZYgSq6rj1z3S0lJH73m4qvfF70ZEqGDD+JrqVkURQn2SokLScw4ATfTCrfa/e7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748019179; c=relaxed/simple;
	bh=oXggHHrffprnyUmRS6O/v0GnADhdlBANtQ73ePlBsMY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UU0+6IHqX1IxjGtW/PpHJreSRF2/kGg18l/71ziDR3ZNvp+WciCxRP/pQggxwwGXrFT8lmj6EekKqOIznBQ0x4IFqMJrDQqKvUiiJxgOXkgq7d8MLVO9A65cw8sGJHRVKNfESamd41hld4Wn7Xan4hfH0QafZ9SGXIX/6KCc4bs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=24wXwAf1; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="24wXwAf1"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3da76aea6d5so3595ab.1
        for <linux-kernel@vger.kernel.org>; Fri, 23 May 2025 09:52:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748019177; x=1748623977; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmWGLDUhhscZ2Xmxtxk5eVpPbTYTy7lJM+MM2kz6e8I=;
        b=24wXwAf1NmBJh+Ukh7ECBk8zdAu0uiAQjTDPjeNQm64pQ50hdPZAmL+/hn4sQzIQIy
         x/uJ1/d9pajUv+6ohX87OCpPxYvZp4sfnSpACdyAnQvVtMDm29kP+2FU1qyv6s4XDEYf
         fP0LGkYTJZRufwNU4rNaiBJE88C2seO6SPAI8/ZfRiB1+ngFuC02M/w7UgKteLbB4JIa
         7s9KhSj41Aal0bvP8ZSwB696mOWOyHDWRIj5r6ZYaaQCz+ApNsdxGtncYB/GPF21qf5k
         jxnoPG/gayxdo8a+KG76TGOfHFebPUOkxjpaGVXlyM4VtIW2GSKBmDf06L7awBIq0N1Y
         dO0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748019177; x=1748623977;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kmWGLDUhhscZ2Xmxtxk5eVpPbTYTy7lJM+MM2kz6e8I=;
        b=Y9gjIPwmUMelhjk2RctCkv+XuXpfiBGLFEIgnjn6rf4Zds7kk0t+zqbIcBMcf9UFRf
         eveCfE0f5pLam6bj4Wlisl7/W4Jz7chZDv6x9O4G3gRT2FF8Ow7uBwT4o2SBtQkW/rta
         gIujYpGJqup3zayQsROxDZgKMZ3BwkjCulAVC6HgKNVjC8FNuzzF8JCOPff0NIRpWCP8
         FENuN9ooWzC/yRWoHGFVgJu7NBeC0R37r2CL9g1V4MghYTUhdWPQb0I1Jd7KX6UK760u
         dxa6Cv8FmZwYYga595QW9MZt86h4W2rMzc9CEz2u83S7vSS63YVmFf/mv+S/M7ZX9Qjo
         mCfw==
X-Forwarded-Encrypted: i=1; AJvYcCVe4g5CxfFH9h4oBAOLrQBbSdmRSGq9rs8BZrLFVuaYirJnlcbfYApSOnQt1kM0Q2k7AUjriSXrhrNNcDU=@vger.kernel.org
X-Gm-Message-State: AOJu0YwuI4VroL7V+JCeIxmqO334KQwFZD4nt43jmEqrl07NQcX6WKwA
	/pQFabfXHJWvHkzYQjPMGn1OXr4KlbqS7MqSRXfAWnrRccDuu7kstDHMR9yXo7Vm3OP16UvPeB2
	FlpP5eLzT4H2AaRmXWKsrzoL5dJgFVVd79vGbGUKIN21iIKh2GaEsVs2mz04=
X-Gm-Gg: ASbGncvObtNA8O2pMEe3XfABlS5V8kHwSkzICcsfDKZugte2NFZRumaiZsxQOfp71TI
	BWHd/WeuYxxkKs1tDcX11ZBAElU+VIEkw7eR4rMEHY2jIIf3k4lKdWBmprpoxB2LJMZHm47F3t8
	viZYIJeGOI4LWX+3Mq/lhyNoDh84DLClEa6oRNq4tEG2l8
X-Google-Smtp-Source: AGHT+IFK1nzWhCd3ujrlurypXBIY7yr65HZBuHq8XALzTXz9vJnU3sVKz+qQpe3gSMpAg96WysC0BXZvn407OPTMPsI=
X-Received: by 2002:a05:6e02:1948:b0:3d9:6c99:5a83 with SMTP id
 e9e14a558f8ab-3dc93ed53b5mr4085585ab.8.1748019176746; Fri, 23 May 2025
 09:52:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250331172759.115604-1-leo.yan@arm.com> <aC_Vn95vYqcXul03@x1>
 <aC_WFRe_4HjVPUrM@x1> <20250523081036.GB2566836@e132581.arm.com>
In-Reply-To: <20250523081036.GB2566836@e132581.arm.com>
From: Ian Rogers <irogers@google.com>
Date: Fri, 23 May 2025 09:52:44 -0700
X-Gm-Features: AX0GCFsHJywegXJX6O1fGGihLJh0MjGOsPXkaorz5CszEA2KExkOeP2dBZDZfZ8
Message-ID: <CAP-5=fXSaYcYp4YVvD8aRXNDuCN5f1QM6KkbNF4Sr+paTFkevQ@mail.gmail.com>
Subject: Re: [PATCH] perf tests switch-tracking: Fix timestamp comparison
To: Leo Yan <leo.yan@arm.com>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, "Liang, Kan" <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 1:10=E2=80=AFAM Leo Yan <leo.yan@arm.com> wrote:
>
> On Thu, May 22, 2025 at 10:57:41PM -0300, Arnaldo Carvalho de Melo wrote:
> > On Thu, May 22, 2025 at 10:55:46PM -0300, Arnaldo Carvalho de Melo wrot=
e:
> > > On Mon, Mar 31, 2025 at 06:27:59PM +0100, Leo Yan wrote:
> > > > The test might fail on the Arm64 platform with the error:
> > > >
> > > >   perf test -vvv "Track with sched_switch"
> > > >   Missing sched_switch events
> > > >
> > > > The issue is caused by incorrect handling of timestamp comparisons.=
 The
> > > > comparison result, a signed 64-bit value, was being directly cast t=
o an
> > > > int, leading to incorrect sorting for sched events.
> > > >
> > > > Fix this by explicitly returning 0, 1, or -1 based on whether the r=
esult
> > > > is zero, positive, or negative.
> > > >
> > > > Fixes: d44bc5582972 ("perf tests: Add a test for tracking with sche=
d_switch")
> > > > Signed-off-by: Leo Yan <leo.yan@arm.com>
> > >
> > > How can I reproduce this?
> > >
> > > Testing on a rpi5, 64-bit debian, this test passes:
>
> Sorry that I did not give precise info for reproducing the failure.
> The case does not fail everytime, usually I can trigger the failure
> after run 20 ~ 30 times:
>
> # while true; do perf test "Track with sched_switch"; done
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : FA=
ILED!
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : FA=
ILED!
> 106: Track with sched_switch                                         : Ok
> 106: Track with sched_switch                                         : Ok

Just to advertise the "-r" or "--runs-per-test" option:
```
$ perf test -v -r 100 "Track with sched_switch"
```
The test is exclusive so you won't get any parallelism from this, but
you could in other cases.

Thanks,
Ian

> I used cross compiler to build Perf tool on my host machine and tested on
> Debian / Juno board.  Generally, I think this issue is not very specific
> to GCC versions.  As both internal CI and my local env can reproduce the
> issue.
>
> Please let me know if need any more info.  Thanks!
>
>
> ---8<---
>
> My Host Build compiler:
>
> # aarch64-linux-gnu-gcc --version
> aarch64-linux-gnu-gcc (Ubuntu 13.3.0-6ubuntu2~24.04) 13.3.0
>
> Juno Board:
>
> # lsb_release -a
> No LSB modules are available.
> Distributor ID: Debian
> Description:    Debian GNU/Linux 12 (bookworm)
> Release:        12
> Codename:       bookworm
