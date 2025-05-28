Received: from mail-il1-f182.google.com (mail-il1-f182.google.com [209.85.166.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29DE31EB5FA
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 18:27:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748456842; cv=none; b=FuNjm+SChasGrJy+ONdSx/T5k6rCSfbXtC2R6NidflxtlH00nklHjKuS+Kd4FZ/zPiitMQ+6nloLZvSMYuI0lkcy8B3HBw5BxVEIpL8xZgziocrVU5Qs7TEQQh5x0HGAhTD/S5Q6vsu4dC3jggVqSzN918zZthb6wbSZxP5MlEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748456842; c=relaxed/simple;
	bh=Dyae6p0XkCLn3cY+5hqYXijVKH5spBJwwTcKDEsPWZs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uw/EOCYthw34re+d4o116+fN+YCht9GIkQn2ZbbInyauT1u+bP3k/XHjl36MGA6DFmrexKYpB/WUERFLjsSlhdCHvROycr5BjI7Fxrc2y9W0idKnRD3Hhe4XwPFRZ0otWON8028DquY8mxzUYtwlxid7Bk5HWUjWaiRrvgc4awM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DXuQizHS; arc=none smtp.client-ip=209.85.166.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DXuQizHS"
Received: by mail-il1-f182.google.com with SMTP id e9e14a558f8ab-3dd89a85414so31045ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 11:27:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748456840; x=1749061640; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HM8Rc18VEtFQ1Tssf3yJOD2mv0SdQCHfqzTOhoG5MKk=;
        b=DXuQizHSxGQpsJ+zUO0aRy0XK3YKLt3G+bSqLxVaSDK8VqtfRxceRgp1gM84QYqh/p
         7um39EWW2pl6zRpcj+YW5mPbWL6Q+9BjGNQWJd0FRDXko30N6J2oP34Wn1svHsShBrXx
         erwEizo5qJE4SA7YNZs7aoDhiqIFJhN2A5D7drQEFoXIF6Uj7RLnjdnwkeQw0NA6w2uJ
         ty+6ySL938/vB2KEWcAaT5jpNYLzl5NzIFJNl4LcdfEizhrl8IAKmR2ggT/4V6SstHAB
         QtSRqB9I+DR5v+Vcsu4niSWIgyGSu+eZNM16spNBNXAKyxBfrEJWe3ayRQ/SpUi/11RS
         5WGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748456840; x=1749061640;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HM8Rc18VEtFQ1Tssf3yJOD2mv0SdQCHfqzTOhoG5MKk=;
        b=nIioL8WFNX9JSGk3kyO8+VaotVctcQCKzoU+oW1iU04Z5d03nDjvm97PWOVhzH+vpE
         CgKekj0wU23Jlwjjm6tIip0q9XcvLod7qibAPoWllev0UQXG+NymjD7YXfXpFNt8j3sl
         C6LOPEBfpmAZiSR2uAbJtXe6LaL3nfaLdPfMR0YeeKTwReEt1fMBfEu2iTomRTUoJ8rg
         SsSPtQVMmJLjF54oQoakMrmpTHfEb7yCeF59XJemFtahQ/Pdmb/5jC26pq97bnj/Mrkh
         yOlnU+GbXTafF7lH3KbJp/GEEte8JIsO1evUfQBEN3W5rghCBWfws+rD+vjKuwult2gS
         qYSQ==
X-Forwarded-Encrypted: i=1; AJvYcCX/O5uWGC7BkGIq0BWEFSOny7AmTveCfCFnJ5MniHi2/80Wk3Q7JzUz/iCvrpBr9bcsrB8L94z1e13HJ6k=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx2hQDihoBvrFMVgNojrTwnYvVUhsEGIaAp83KpmmA+Fyg4OOV4
	FJEEMBaU6hZwT7OSVsILYdd7cP0lH44E61RxvxMoiuJaZ4TadnVma7J4VP9NlmuIfgp8WP7RNk/
	BLu9kdsPYcR5dXAdVe2TIkiIHIzmKNTuy77GPBciZ
X-Gm-Gg: ASbGncsJi5YY3iwGKUkhx/hLseJYajmRd5gjaFtKIu+hcdNQA6m788IB605SDtXC6kq
	yCUWRZCIClMoASeUlTZfG51HChpg7jYkjaxA720b4tNsoY6GqT1rlgKSzI7O6lf87VYmP/Xy2rk
	ZBSG6afxtkO9B3QVqYWRNHsfnmGuhcZr+JIEROgw97K6LlRHsktcvc9q1NM6wj4+DGi7rNmAlS
X-Google-Smtp-Source: AGHT+IFd4Kl8836dzc9vu4lsDYW2giR8SUOs2tR/CZqf56ma4yrC4qckrBhCAKDN/A1HjkQ/GfxZV1Ot/qkm+uGI84Y=
X-Received: by 2002:a05:6e02:790:b0:3dc:7c30:c6d2 with SMTP id
 e9e14a558f8ab-3dd928079c9mr152535ab.27.1748456839970; Wed, 28 May 2025
 11:27:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250521165317.713463-1-irogers@google.com> <20250521165317.713463-2-irogers@google.com>
 <aC43Et06tyrBOrsT@google.com> <CAP-5=fUYUDq6hmd+e3_E7HCRPYuy-0KLE+gLuSCWAHh3A5wJLA@mail.gmail.com>
 <aDdR0pCNSmxCEyEZ@google.com>
In-Reply-To: <aDdR0pCNSmxCEyEZ@google.com>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 11:27:06 -0700
X-Gm-Features: AX0GCFvWI1R9REX5VoYYVsZyhaRf2cKWzDmoyux_Rz-w7siJZVQd-yB4sdzLp9s
Message-ID: <CAP-5=fVv9+0UdYDNQ52T-QgKfUYBL-pgRwd_ac3jp7KW8sxrRw@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] perf sample: Remove arch notion of sample parsing
To: Namhyung Kim <namhyung@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	James Clark <james.clark@linaro.org>, "Masami Hiramatsu (Google)" <mhiramat@kernel.org>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Leo Yan <leo.yan@arm.com>, Yujie Liu <yujie.liu@intel.com>, 
	Graham Woodward <graham.woodward@arm.com>, Howard Chu <howardchu95@gmail.com>, 
	Weilin Wang <weilin.wang@intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Matt Fleming <matt@readmodwrite.com>, Chun-Tse Shao <ctshao@google.com>, 
	Ben Gainey <ben.gainey@arm.com>, Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org, Kajol Jain <kjain@linux.ibm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 11:11=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> On Wed, May 21, 2025 at 02:15:24PM -0700, Ian Rogers wrote:
> > On Wed, May 21, 2025 at 1:27=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > >
> > > On Wed, May 21, 2025 at 09:53:15AM -0700, Ian Rogers wrote:
> > > > By definition arch sample parsing and synthesis will inhibit certai=
n
> > > > kinds of cross-platform record then analysis (report, script,
> > > > etc.). Remove arch_perf_parse_sample_weight and
> > > > arch_perf_synthesize_sample_weight replacing with a common
> > > > implementation. Combine perf_sample p_stage_cyc and retire_lat to
> > > > capture the differing uses regardless of compiled for architecture.
> > >
> > > Can you please do this without renaming?  It can be a separate patch =
but
> > > I think we can just leave it.
> >
> > It is not clear what the use of the union is. Presumably it is a
> > tagged union but there is no tag as the union value to use is implied
> > by either being built on x86_64 or powerpc. The change removes the
> > notion of this code being built for x86_64 or powerpc and so the union
> > value to use isn't clear (e.g. should arm use p_stage_cyc or
> > retire_lat from the union), hence combining to show that it could be
> > one or the other. The code could be:
> > ```
> > #ifdef __x86_64__
> >        u16 p_stage_cyc;
> > #elif defined(powerpc)
> >        u16 retire_lat;
> > #endif
> > ```
> > but this isn't cross-platform.
>
> Right, we probably don't want it.
>
>
> > The change in hist.h of
> > ```
> > @@ -255,7 +255,7 @@ struct hist_entry {
> >         u64                     code_page_size;
> >         u64                     weight;
> >         u64                     ins_lat;
> > -       u64                     p_stage_cyc;
> > +       u64                     p_stage_cyc_or_retire_lat;
> > ```
> > could be a follow up CL, but then we lose something of what the field
> > is holding given the value is just a copy of that same named value in
> > perf_sample. The code only inserts 34 lines and so the churn of doing
> > that seemed worse than having the change in a single patch for
> > clarity.
>
> Assuming other archs can add something later, we won't rename the field
> again.  So I can live with the ugly union fields.  If we really want to
> rename it, I prefer calling it just 'weight3' and let the archs handle
> the display name only.

But that's my point (or in other words maybe you've missed my point) .
Regardless of arch we should display p_stage_cyc if processing a
perf.data file from a PowerPC as determined from the perf_env in the
perf.data file, or retire_lat if processing a perf.data file from x86.
The arch of the perf build is entirely irrelevant and calling the
variable an opaque weight3 will require something that will need to be
disambiguate it elsewhere in the code. The goal in variable names
should be to be intention revealing, which I think
p_stage_cyc_or_retire_lat is doing better than weight3, which is
something of a regression from the existing but inaccurate
p_stage_cyc.

Thanks,
Ian

> Thanks,
> Namhyung
>
