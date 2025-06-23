Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B1522FDEA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 15:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750691582; cv=none; b=QR6aWUarFV4Ff+8jB147nVMGLydlv9LnfX87uZiD1SViloO6aY5uGbI0T2o30hlakifq6wvd0nN9Abih/3SEmMm+cSah1x1A7kQti/cv0aASwRX/9QHQ/hv7Xl7+yYcgAaBdzqIYzzEbaQlMFawbN4DrXXnwnYtHrbYoiidMHg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750691582; c=relaxed/simple;
	bh=pTTZcRj9DId2ZvPOeWmaUNyph2whs2Bb+Fr/O9WRfwo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mYBcfXoE9no77E6mu9CJWQxFd7l7AQzAYNIKC0xuJBE0Ji9KaQJBqKGfVbFZgHBh4NfIxtC9osUaw3x4EKxbIOP+Zly/zgFv+N4lKR47rW1sLDhOhlvmBTYmWRM4mKQ8C8mufrBgOSSIxS2sxfl6xLWM1wYx4JAxFGrm3g9Tw5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=SF0cCj7L; arc=none smtp.client-ip=209.85.166.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="SF0cCj7L"
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-3ddd1a3e659so361145ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 08:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750691579; x=1751296379; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Mnxjz5dmIOfE5ct74X590DWV56+gnOXa9jI3Dx4SADY=;
        b=SF0cCj7L4s1AWqU5k/qEEQrG3WgqAzxi9IsSYWMO/CqxJA7HBrACzNxtaFmhgxjc63
         TKdmgIRekAQLamaG3hlKuzlUTDeQ8E9F2tAN5u+wrfL2gxOi8oF7YYcxc1VOqlPNrEyD
         RrAIXwubeRa4uVmJqRHczSId3+J/fcKKw1byfxvBhk7QJPtNDd07qnVWaIqD/s9DJp7N
         hbWya0QE7KXzyB4ROsmN+FED6KAYCQUzHSJ4iZ6PLYmOTKhDr/b2w8uNgmjNDRLlRtz7
         OomgfX8RTHvLXX4qpYGrAvB9MTBrujIH04/M2t2PCwUI/q9fwEpS4GlEqupS/jzWa6P9
         phLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750691579; x=1751296379;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Mnxjz5dmIOfE5ct74X590DWV56+gnOXa9jI3Dx4SADY=;
        b=hhqhO1dxq80vZQEEotwFOQ3YVZ01yupdoA35W2/7Kooemm4hvCMpXkVpIYlEbzadnP
         DqnwjsO4SDOOO5kOtf5Ocjs94iqVFYOMBMDuXsXQtxvdRWI0maMvO6Bag5EtBXCspFWT
         NRevwGlwXGYoXB8n6REVDBvm2tKkndqBhFG0Wqah4PfHMhvPMO00Zv4Pzd3+nt96mR2c
         LDVAKxspNsiw0Gh8gUATynu7Rwh7P4TJRuIXfFT2Cylu6yADUi1hLt0Q1ycvJbedGkPO
         tksqIg5EFnmW36B4IW1DrspwsjGUNAE+KulwQPwkRvtY7CSKOYU1IQW3h1S3BBScuxrp
         jwww==
X-Forwarded-Encrypted: i=1; AJvYcCUYUUe07K84UHoHty7moQut5ZqyCFtg7OXpgcGXsN75txjnJAMy3aPohk/VtiAvUZhszWHyx37KAWDimA0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2h6ydSplMWuRx8RvlzkD3Rd7qDE6drEQiFYLgSrd2C/vVjHZ3
	MfKvPb/ZQYAFKfngC7QtiF25kydNZsVc3ZwDWJUd03nuarn42NSOQaYGOc8ON74LLkUTPu9q4r5
	pma4MpOmazGtCt1ypnEgFqoOywSLc4yqIr5WgJMQ8
X-Gm-Gg: ASbGncthJorXkoVuRHZV+GAH1UXDxWOec7gIr7WHnCjYLzwoP6IdGQ9IpRj+oIbMpvC
	yn6IwYpk4SkgfMUrP7dwZ9VNGG/3S/ZT0nO9Yc+F8iw+Ls4JzinyneUlaXmP73BxtqKfYqtpPV+
	8vaaFFZHKdHbfTM8kMzBcdXVodm8nMrqVp9u4MJ0CfxdJmu5xaYGKEIigeeOjVAV7eB+kZ20g4
X-Google-Smtp-Source: AGHT+IE8gIT7WMGF5c34LGPl6UQebM0f8gjV+JTGABGoMmYQ/5qwTt7OO7vZdNuzPwnYzz+ZM+IfaqM7KM/36j/PkHU=
X-Received: by 2002:a05:6e02:184f:b0:3dc:5cb1:8f24 with SMTP id
 e9e14a558f8ab-3df0da148f5mr5687465ab.9.1750691579267; Mon, 23 Jun 2025
 08:12:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619002034.97007-1-irogers@google.com> <aFW4VJtk96JD865U@google.com>
In-Reply-To: <aFW4VJtk96JD865U@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jun 2025 08:12:47 -0700
X-Gm-Features: AX0GCFuBMGlka0OTxLTpe-4n1RG-F3_OoLNQ1mo06Bc_W8WiH7hXnMEGIn4fhxc
Message-ID: <CAP-5=fUpnW1DE68pMW0q3vMT+n6d5SeNkwXd45XLaf01-eP47A@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf test workload noploop: Name the noploop process
To: Namhyung Kim <namhyung@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 20, 2025 at 12:36=E2=80=AFPM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hi Ian,
>
> On Wed, Jun 18, 2025 at 05:20:33PM -0700, Ian Rogers wrote:
> > Name the noploop process "perf-noploop" so that tests can easily check
> > for its existence.
> >
> > Signed-off-by: Ian Rogers <irogers@google.com>
> > ---
> >  tools/perf/tests/workloads/noploop.c | 3 +++
> >  1 file changed, 3 insertions(+)
> >
> > diff --git a/tools/perf/tests/workloads/noploop.c b/tools/perf/tests/wo=
rkloads/noploop.c
> > index 940ea5910a84..8b954d466083 100644
> > --- a/tools/perf/tests/workloads/noploop.c
> > +++ b/tools/perf/tests/workloads/noploop.c
> > @@ -2,6 +2,8 @@
> >  #include <stdlib.h>
> >  #include <signal.h>
> >  #include <unistd.h>
> > +#include <linux/prctl.h>
> > +#include <sys/prctl.h>
>
> I'm afraid it'd introduce a build failure on musl.  Please see
>
> https://lore.kernel.org/linux-perf-users/20250611092542.F4ooE2FL@linutron=
ix.de/
>
> I think <sys/prctl.h> would be enough.

Hi Namhyung,

we could do that but in the glibc man page it says:
https://man7.org/linux/man-pages/man2/prctl.2.html
```
#include <linux/prctl.h>  /* Definition of PR_* constants */
#include <sys/prctl.h>
```
So wouldn't the PR_SET_NAME definition potentially be missing then? We
could fill in the missing definition with `#ifndef PR_SET_NAME` it
seems sub-optimal - I see this is what was done in the linked to
changes. Perhaps we need something like a tools/perf/util/prctl.h, and
a feature test, then in that we have something like:
```
/* A header file to work around musl libc breakages caused conflicting
definitions in linux/prctl.h . */
#ifndef HAVE_SENSIBLE_PRCTL
#  include <linux/prctl.h>
#  include <sys/prctl.h>
#else // !HAVE_SENSIBLE_PRCTL
#  include <sys/prctl.h>
#  ifndef PR_SET_NAME
#    define PR_SET_NAME 15
#  endif // PR_SET_NAME
#  ifndef PR_FUTEX_HASH
#    define PR_FUTEX_HASH                   78
#    define PR_FUTEX_HASH_SET_SLOTS        1
#    define FH_FLAG_IMMUTABLE              (1ULL << 0)
#    define PR_FUTEX_HASH_GET_SLOTS        2
#    define PR_FUTEX_HASH_GET_IMMUTABLE    3
#  endif // PR_FUTEX_HASH
#endif // HAVE_SENSIBLE_PRCTL
```
The feature test would just be to include the two headers and see if
the build breaks.

It'd be nice to think musl was slowly getting fixed. I notice we're
carrying two comments in the code about working around musl, but I
suspect we do this kind of thing in a lot of places (just knowing the
issues that come up from yourself and Arnaldo when trying to integrate
patches). It'd be nice if perf's code could keep close to what the man
page, or whatever, is saying the standard should be, rather than doing
some kind of adhoc linux/prctl.h rewrite (or if we are doing that,
make the code more explicit that it's what we're doing).

It'd be nice to think that the perf code could be clean wrt analyses
like "include what you use" [1], but strategically removing #includes
to try to work around musl issues seems like the opposite of this.

Thanks,
Ian

[1] https://github.com/include-what-you-use/include-what-you-use

> Thanks,
> Namhyung
>
>
> >  #include <linux/compiler.h>
> >  #include "../tests.h"
> >
> > @@ -16,6 +18,7 @@ static int noploop(int argc, const char **argv)
> >  {
> >       int sec =3D 1;
> >
> > +     prctl(PR_SET_NAME, "perf-noploop");
> >       if (argc > 0)
> >               sec =3D atoi(argv[0]);
> >
> > --
> > 2.50.0.rc2.701.gf1e915cc24-goog
> >
