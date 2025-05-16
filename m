Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77D841BFE00
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431856; cv=none; b=rlSkAm61UzCBLVodB483Uh4mjHJOcttHOnA0P5xWFosPL9Ii0nhQeRqCQFplzq8dwfGVCBR20fF4T79ja6ipjavJm4ptjAk906CMPgpOJBNQXOfdGUVJO2/DWuGfMXxywK+zVmLE0Xk4IMOjeugS2Pi/pYZkHKrojyYqV4l7ztQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431856; c=relaxed/simple;
	bh=mQXzNspQWcD8yvNLg9KV2zVhy2d8ESaQkBL/GuIQ3Ig=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qI5/yGLsUu5V3unv09QlcPqcY4PEAoeqVFcn4yxuVbnH+JW4GptcK6CCAxhpYxSbQVyN9mH3axJ8dw01NSEzKU+kDrRgTTeOpu+YeN0ml+s8y/wH1xTLHzRV1zJtoO/fHTAwD1ACm0W3n4lanhzpuevmIVG34mNYRbE+NTxhlf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fTXgmfr+; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fTXgmfr+"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-acae7e7587dso392430966b.2
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747431853; x=1748036653; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9ZKk701Kfr5j4Au94hfImlmtBuAfosmXnebga/zxjJk=;
        b=fTXgmfr+oB8yFEvmVreaq1miWPVMdhHBc0p58fTttuz4+uvec3QALABT4rZCNuTIv6
         n0olbgUDNOZcHJJRYWCDIZia9K72NgSsn6iwyRFDEIomMeQ4trxiJpQDxlboarjUgTzy
         AUZr7dTZ6v8zyeDQ47TbrqJQFoApiLayHyI0GNv/WSdTzsRFjaMHypv+n49XdSSB3eVB
         fXa8Q3T6kULxuDYLYpt2M1uJ17JAJAws12jhizbAUNjIsa98rRMTdAHWXjSaCNkB3BtN
         ozzd+q6nrJb5/LtSEKwVGXA50iR6YDGTq+ZO6B+14nD10H8TWYrUDozfD/YzbRpOZdXf
         Dc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431853; x=1748036653;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9ZKk701Kfr5j4Au94hfImlmtBuAfosmXnebga/zxjJk=;
        b=cb9rFtPGVbCycjY9nc5b4f1zWjoqg9QMmBo2PJKXovdZaoLE+Z0gbTFX50YO0E5zf8
         g0e1kb2Gb77LFuPXjOFUT3PZZZHAN1v+0NcNEZXZvgusqH+AdlOGxgE2pmsmUuXTwODe
         SJ1nlgnkxz3SqiHtcqjeLCrbyGF/U/6ACSNE3qOGIonV4WtdRSWZrGum1pHMhtrL9khD
         pibUr2+CcrZDoEQe2Mwo7b70HFuSlKjRKf5+z1EWjqaSrQ6T+eqYziw4Te8516SLc6XZ
         HC1BBvSBfg8jpeTe7okLAT9Fj3JOLbGnMF9kr36TtW/96Gyvc43oeFwx8zt6RcnwFNWv
         bZqw==
X-Forwarded-Encrypted: i=1; AJvYcCWjzaGWqIXD4l3Lih3i7KEIGQPvrDcUFwfkBW7ThX6WUFFmtl8cdsKMYiLvxZ49gzKB+DybAR40++eTj6Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFkNDXJdrsRBBV1bIYNVN58BiLqzA/MyL6XYz7e+hurGxZYoaA
	vWNIhm0dMUuNNvTRznSOIh1yzUqPBJjz9qlkLbgFq6uscLyMyy/vJixeo/qkXelhb6L9T8Fd8kW
	Ttd5PZrQXVSbrEbyUZRQbAABA9ujrk8cDwx0gAP8W
X-Gm-Gg: ASbGncv9asNwCQMfq4Jj8cnp/iZvP+6l89Jjy/utdZGEUQOOgCZYhHQYj/3l1V8x5Vm
	5jegiDxTcXHN9Mmx9L6nuoPbRYQi/XZhdrySnnSRDSJJQIvARJVoSsoBIs71rY0lH2ZOo6G2s1H
	9Q7n0CiW/xOy+Ds9+jso0LDUysMB4t070=
X-Google-Smtp-Source: AGHT+IFMFBKRFkYlajeJpIIDajkdqm2dbNVe52ubNJr651UXqfsEehLTFqDn9n/Gb15ZpCn6cIHkIuNAs0Hf3PSUewM=
X-Received: by 2002:a17:907:2daa:b0:ad2:4683:513b with SMTP id
 a640c23a62f3a-ad52d5d83fdmr431918766b.44.1747431852491; Fri, 16 May 2025
 14:44:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250303183646.327510-1-ctshao@google.com> <Z9TXabugl374M3bA@google.com>
 <Z9hFJtEKfsGGUDMg@x1> <Z9hLKsZOfouM3K7H@x1> <Z9hR8M-SQ5TD2qMX@google.com>
 <Z9iHiTv_ud6GEhJh@x1> <CAJpZYjXwUz7x1XUF7AzgYR6PZo_igrwK9BkxGx_3N0pCs1YRvw@mail.gmail.com>
 <Z9iY7HFebiSaWZJQ@x1> <Z9kBAhEKKphn8JL6@google.com> <CAJpZYjVeMrjN09kaVCBs97q8_hnsgwwo7s0C0ctL5Kt0_FknBQ@mail.gmail.com>
 <aCePEgXqcfQ9BCQy@x1>
In-Reply-To: <aCePEgXqcfQ9BCQy@x1>
From: Chun-Tse Shao <ctshao@google.com>
Date: Fri, 16 May 2025 14:44:01 -0700
X-Gm-Features: AX0GCFuKFRYr97bgBRLXwADGx4rcMieJ0tD8aWBTHbXAmf9Tsq5Qk1MD21wKmok
Message-ID: <CAJpZYjV26mmsrs57OSvyFSrtEmbuDij6Ufm4wbRFHN7UwYUciQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf record: Add 8-byte aligned event type PERF_RECORD_COMPRESSED2
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, linux-kernel@vger.kernel.org, peterz@infradead.org, 
	mingo@redhat.com, mark.rutland@arm.com, alexander.shishkin@linux.intel.com, 
	jolsa@kernel.org, irogers@google.com, adrian.hunter@intel.com, 
	kan.liang@linux.intel.com, terrelln@fb.com, leo.yan@arm.com, 
	james.clark@linaro.org, christophe.leroy@csgroup.eu, ben.gainey@arm.com, 
	linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you for the fix, Arnaldo!

-CT

On Fri, May 16, 2025 at 12:16=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Fri, May 16, 2025 at 10:10:27AM -0700, Chun-Tse Shao wrote:
> > Ping.
> >
> > For suggestions from Namhyung and Arnaldo, it was merged in:
> >
> > https://git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/commit/?h=3Dperf-tools-next&id=3Db1b26ce8bb0eab1d058353ab6fa1a2b652a9a020
>
> Testing it now, fixed up this:
>
> +It is deprecated and new files should use PERF_RECORD_COMPRESSED2 to gur=
antee
>                                                                       gua=
rantee
> +8-byte alignment.
>
> - Arnaldo
>
> > Thanks,
> > CT
> >
> > On Mon, Mar 17, 2025 at 10:13=E2=80=AFPM Namhyung Kim <namhyung@kernel.=
org> wrote:
> > >
> > > Hello,
> > >
> > > On Mon, Mar 17, 2025 at 06:49:32PM -0300, Arnaldo Carvalho de Melo wr=
ote:
> > > > On Mon, Mar 17, 2025 at 02:45:39PM -0700, Chun-Tse Shao wrote:
> > > > > On Mon, Mar 17, 2025 at 1:35=E2=80=AFPM Arnaldo Carvalho de Melo
> > > > > <acme@kernel.org> wrote:
> > > > > >
> > > > > > On Mon, Mar 17, 2025 at 09:46:40AM -0700, Namhyung Kim wrote:
> > > > > > > On Mon, Mar 17, 2025 at 01:17:46PM -0300, Arnaldo Carvalho de=
 Melo wrote:
> > > > > > > > On Mon, Mar 17, 2025 at 12:52:09PM -0300, Arnaldo Carvalho =
de Melo wrote:
> > > > > > > > > Checking the discussion and the patch.
> > > > > > > >
> > > > > > > > My first impression yesterday when I saw this on the smartp=
hone was: how
> > > > > > > > will an old perf binary handle the new PERF_RECORD_COMPRESS=
ED2? Will it
> > > > > > > > ignore it while emitting a warning, since it can be skipped=
 and then
> > > > > > > > what we will get a partial view?
> > > > > > > >
> > > > > > > > Having some session output showing how an older perf binary=
 handles
> > > > > > > > PERF_RECORD_COMPRESS2 would be informative.
> > > > > > >
> > > > > > > I think it'll show the below warning:
> > > > > > >
> > > > > > >   <offset> [<size>]: failed to process type: 83
> > > > > >
> > > > > > Right that is what I got:
> > > > > >
> > > > > > =E2=AC=A2 [acme@toolbox perf-tools-next]$ perf.old script -i /t=
mp/perf.data.ck8
> > > > > > 0xbf0 [0x250]: failed to process type: 83 [Invalid argument]
> > > > > > =E2=AC=A2 [acme@toolbox perf-tools-next]$
> > > > > >
> > > > > > I think we should change that to something more informative, li=
ke:
> > > > > >
> > > > > > 0xbf0 [0x250]: failed to process unknown type 83, please update=
 perf.
> > >
> > > That would be nice, but there are cases it can fail even without new
> > > record formats.  So it should also check if the type number is greate=
r
> > > than or equal to the max.
> > >
> > > > > >
> > > > > > And then does it stop at that record it doesn't grok?
> > > > > >
> > > > > >         if ((skip =3D perf_session__process_event(session, even=
t, head, "pipe")) < 0) {
> > > > > >                 pr_err("%#" PRIx64 " [%#x]: failed to process t=
ype: %d\n",
> > > > > >                        head, event->header.size, event->header.=
type);
> > > > > >                 err =3D -EINVAL;
> > > > > >                 goto out_err;
> > > > > >         }
> > > > > >
> > > > > >         head +=3D size;
> > > > > >
> > > > > > So we're stopping there.
> > > > > >
> > > > > > Maybe we can just warn and skip?
> > > > >
> > > > > Thank you Arnaldo, it is a good suggestion and I will work on thi=
s later.
> > > >
> > > > Thank you for considering that, really appreciated!
> > >
> > > It would be hard to process misaligned data though.  Probably we also
> > > want to add a check to make sure it's properly aligned.
> > >
> > > Thanks,
> > > Namhyung
> > >
> > > >
> > > > perf deals with so much stuff and code flux that all the help that =
we
> > > > can get is what is needed for it to continue to be relevant and use=
ful.
> > > >
> > > > After all what is the point of a tool that produces bad results? :-=
)
> > > >
> > > > - Arnaldo
> > > >
> > > > > -CT
> > > > >
> > > > > >
> > > > > > Anyway, the series as is seems ok.
> > > > > >
> > > > > > I'll test a bit more and send my Tested-by
> > > > > >
> > > > > > - Arnaldo
