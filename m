Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B1B220F5E
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 20:44:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748465091; cv=none; b=sZdKl+VPINbHpFUZPM6+aLZFr/qxe9KeRGRE8zB3cXTPi+qGqqmQ3y5onE8NgXLIHTP0cVxcJ+OpgU+uuWeGej/EO3vmM1nyO7tkUS0LdZpMsIrIlOtyvyK5+ltetteoOaBAqCxCheP56pZKP1uwZgtkrBVLYdqaTe52sJSjfRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748465091; c=relaxed/simple;
	bh=38Pq5K+FiT/cVFmaVPulhMDbdUVFkd1edxSKSZH2m6U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IWKqTUk8ZmbjrA3t7qUI1qUOIhITekD1eg6hmh8KT4ddTKg22mdbdECrCEZDV5rXqTLLFwoIqt67Dp9FfUCuW3SKXlMoLlPcFlczu0l625zroHVn/YvxnSsBIQvowzdppJSYh1wOu98euHj11lJYr3VVOSxbug4koUBhFCK9zj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nASSL+Ml; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nASSL+Ml"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3dc8897f64cso12345ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 13:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748465089; x=1749069889; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WVv4PxlW8n2DpUG2EwuNmYOineUB3xrz7e9SANmNK6o=;
        b=nASSL+MlKGczjCq2JG8Unpgr90+Je9A4pdbidQloUIUHK7CVQpIsBc9BZLqJDO+ROr
         gio20atlvCjqI1ikqP3kbhUFm2sIlZ1oISV7bQHijffNHvUni0NDUnLFRRNb/XTI3e7b
         SRNmYGFrbLARMt4s9bdvwk/kQ1M7iuhazloIhRXQ7a7gps7n5AA79Oe5nyecjbGzVcpC
         cP7AerILa14qI83V4WVqxmlN7uVzyCvLMDwM6mbtRgh1buRDlHtnXDUo+bEsU56FMPxX
         xUDLXMjzI/zRCh/JdxvScCK2WFLX+yIp4nP4lG0PLJTZwMCDTyLCr2lMk1qsCOvy85xt
         pjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748465089; x=1749069889;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WVv4PxlW8n2DpUG2EwuNmYOineUB3xrz7e9SANmNK6o=;
        b=AEAr+j8FKkwbqULPwiSEBWBUh1fpYAhW5IE3v801v3/jxp+bMIgRzjEEWSmZNbhsTh
         ATyctuK70oQEzELTVUgkwfS3yNucEdfmQM4UO+9y9I64VraOZ6Ugwuev66s4a0Y8lpRv
         NFND775uz/fqgw6MzKagjzxelaKpW58Cn6ZX8kG0oLm3dcfooZPk/fAA2ab598Ho6izx
         FisC9HWEcXbqYgO8s0mjZjbAYgn9ORTfw3JOoCe1HqOp6PoNGZUpFuSzRsGWM94M2yTO
         dtwLq5pqBazBgnYz7Zpdm6XROJ35ibNZc4VUBaSc6Sk/GGv7rmE1gu3620YLXKbj97AT
         H2nA==
X-Forwarded-Encrypted: i=1; AJvYcCXNnAZTLBVPap6hL+lxHOKCU48Gc1M0GpfQa0GTa5m9merLylgnSa308kAoyLl3PXdNPlevIzgqJGwLPv4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcFldA3OKNYMWCpZEUdqg5hiO9sD1+RAALkothNkPVVsDSHpuG
	1p+e6fv7F1n8dXkwqkRK7aZdhnBh/dQwsfuCXT0UxPJFeir6gcK9638JAtpf3Gqp4WTYenKKjRW
	2tNvcw3+LHSFGXJ9D+7lIhVh6ScHNaGFM6nAwjEXg
X-Gm-Gg: ASbGncuW/GknxC80gWeI1+dP5llp6k2GeUtSx8gauVMQrtNI0uLKTuZTIU4aKPTAObb
	4QG59+VlStPYIVoIy346w+epi77cwv1LQMUodeWNQdgIQunEFuIKlIKPi200dc+SCbgEvg7j+A2
	6yA3A/BmYTZYzKZR41i7/aQQhojs6U3i+ycOv2FjvNwSeilP0V4Rz1tRQbenMqY0G3oqws3XkF
X-Google-Smtp-Source: AGHT+IGQswM6kSRVfy93BGEfkPcAimWYxvEJ/U03aLiZp749cu/tK+b4mNJs5CTxwOMaSGmmjTzOV55FDtb2OcA+kwE=
X-Received: by 2002:a05:6e02:3cca:b0:3dc:8895:4260 with SMTP id
 e9e14a558f8ab-3dd9315c6dfmr47305ab.19.1748465088535; Wed, 28 May 2025
 13:44:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250528032637.198960-1-irogers@google.com> <20250528032637.198960-5-irogers@google.com>
 <aDdNk1IOqtyM44AX@google.com> <CAP-5=fUmrnOUOBWcypD=Q7bCSQ3HTnicRXhr8nmSRqcbZv7Mmw@mail.gmail.com>
 <aDdua_Kp6Dz91xwm@google.com>
In-Reply-To: <aDdua_Kp6Dz91xwm@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 13:44:36 -0700
X-Gm-Features: AX0GCFsgKD_QpC-aTVr_d3Nzc0jPxiuLTmMOSX6chW9NIR7Byhe00f2syeVc96o
Message-ID: <CAP-5=fW17hJkTCEu6pCwN1CoEVHQAmVggi=wLwcNcM_dbeVAAg@mail.gmail.com>
Subject: Re: [PATCH v2 4/7] perf intel-tpebs: Avoid race when evlist is being deleted
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, 
	James Clark <james.clark@linaro.org>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Andi Kleen <ak@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 1:13=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> On Wed, May 28, 2025 at 11:02:44AM -0700, Ian Rogers wrote:
> > On Wed, May 28, 2025 at 10:53=E2=80=AFAM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > >
> > > Hi Ian,
> > >
> > > On Tue, May 27, 2025 at 08:26:34PM -0700, Ian Rogers wrote:
> > > > Reading through the evsel->evlist may seg fault if a sample arrives
> > > > when the evlist is being deleted. Detect this case and ignore sampl=
es
> > > > arriving when the evlist is being deleted.
> > > >
> > > > Fixes: bcfab08db7fb ("perf intel-tpebs: Filter non-workload samples=
")
> > > > Signed-off-by: Ian Rogers <irogers@google.com>
> > > > ---
> > > >  tools/perf/util/intel-tpebs.c | 12 ++++++++++--
> > > >  1 file changed, 10 insertions(+), 2 deletions(-)
> > > >
> > > > diff --git a/tools/perf/util/intel-tpebs.c b/tools/perf/util/intel-=
tpebs.c
> > > > index 4ad4bc118ea5..3b92ebf5c112 100644
> > > > --- a/tools/perf/util/intel-tpebs.c
> > > > +++ b/tools/perf/util/intel-tpebs.c
> > > > @@ -162,9 +162,17 @@ static bool is_child_pid(pid_t parent, pid_t c=
hild)
> > > >
> > > >  static bool should_ignore_sample(const struct perf_sample *sample,=
 const struct tpebs_retire_lat *t)
> > > >  {
> > > > -     pid_t workload_pid =3D t->evsel->evlist->workload.pid;
> > > > -     pid_t sample_pid =3D sample->pid;
> > > > +     pid_t workload_pid, sample_pid =3D sample->pid;
> > > >
> > > > +     /*
> > > > +      * During evlist__purge the evlist will be removed prior to t=
he
> > > > +      * evsel__exit calling evsel__tpebs_close and taking the
> > > > +      * tpebs_mtx. Avoid a segfault by ignoring samples in this ca=
se.
> > > > +      */
> > > > +     if (t->evsel->evlist =3D=3D NULL)
> > > > +             return true;
> > > > +
> > > > +     workload_pid =3D t->evsel->evlist->workload.pid;
> > >
> > > I'm curious if there's a chance of TOCTOU race.  It'd certainly help
> > > the segfault but would this code prevent it completely?
> >
> > Good point. I think the race is already small as it doesn't happen
> > without sanitizers for me.
> > Thinking about the evlist problem. When a destructor (evlist__delete)
> > it is generally assumed the code is being single threaded and in C++
> > clang's -Wthread-safety will ignore destructors for this reason
> > (annoying imo as it hides bugs). I don't see a good way to solve that
> > for the evlist and evsel for the TPEBS case without using reference
> > counting. Adding reference counts to evlist and evsel would be do-able
> > as we could use reference count checking, but it would be a large and
> > invasive change. Wdyt?
>
> Would it be possible to kill the TPEBS thread before deleting evlist?

The TPEBS thread and other data structures are global and not tied to
the evlist, so there can and are multiple evlists at play. When using
TPEBS there is the evlist for perf stat, there is also the evlist for
the samples. There's sense in having the evlist own the TPEBS data
structures, there's also sense in things being global. I think if I'd
done it I'd have gone with TPEBS within the evlist, but I suspect in
the original changes there was a worry about adding cost on non-x86
builds.

Thanks,
Ian

> Thanks,
> Namhyung
>
