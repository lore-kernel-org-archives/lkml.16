Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4560929B8EA
	for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 19:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750707683; cv=none; b=RiFsydb2bbOqAxox/N3N2fVMv673irhnTA+s21QMxngoJpFJnm30LI/iuZQf9zGCV/YLxnZ0Mk1IzLVfAjOXeGOD5DIj7yMlNKkm943WpVZahZXQoiRj/O4n7wyXSbqaotcFb179y7+a2kePbx1ryxoXm4LtQXoQ8gDJDtXTcKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750707683; c=relaxed/simple;
	bh=iMGsYFOOHTXgUhc1EmfJa0MhbGIbQ3Gg+V9HhqPsKeU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=twh+jNGiZRLuFd5w2m+E/5sr0dMCAqVpirpd8kJZXMe2ZY2iT7/tyVmnM1gSFaL8TnhkJ0/qNi7wva/PymaHtjEG5hydh5OzmAXchL2uA5KlWFx7TYxGcznTKtPvscVdYnHWfzJn3FkOEsq/nXXZ+yWw5aDKh/FGygD2xcM7xNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p34EjPDP; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p34EjPDP"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3ddc99e0b77so41835ab.0
        for <linux-kernel@vger.kernel.org>; Mon, 23 Jun 2025 12:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750707681; x=1751312481; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3zk9ihzHt4ymgY4hQ9m9EOxwRSHSo8NZIfJoNEn5vFo=;
        b=p34EjPDPLmSThlvGfHq+JVoRzyvbhdR2axKC94Y9Q44R2DTlDQyB+IanMfUqcp4N+L
         +xMCfEZQKqzYR2X8GYfraS4kbKNvWQsrJHDz+6B7vkdgMFa5Hr2nImWi1xwA1yz0G/3P
         4T08WCVJ95dyba53ijCpHls5xLQdz0oPvvHJECoWpSd16ve7f5g+gjEpXzjgdDkWJ9yO
         ycnwP4+icXwSu7EsEO5CPYcaCVAGVDGEKfGrHHVOXJKKRD8epaD1Vf/MMmlYBchJ3czr
         3OjSGendzhMpuCO35NytZ29N6OHiDZquft0xM01A2yiemM2kjZzirxe1Nq5KSvPt0vaM
         PQgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750707681; x=1751312481;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3zk9ihzHt4ymgY4hQ9m9EOxwRSHSo8NZIfJoNEn5vFo=;
        b=rKNs+n0MMeIzFt3GM/28K3NB7rfrNVXDOBaiX8QbVBRm9i356G21Nxp0DImY05kj+E
         tAZPuB4PgU61h7r/5UhmfnkcYPnsos6u4If9qejC2F/B63jhPiPsVjXJpGgZRbsQaP/k
         WF4McaYq3j/1r/618k7fRBVtUbx89QqNpBPuG5lzvgl++JSadcRNBoXGvmFzI053b8U9
         0NxW/XfKFe0+tfK5UnTstFkst7v5cJCyDPvsYuPRbxnAvxBmK9dos73B1GHiH++rt5og
         Hz+FwDy++OGniFZxKSf2WxeYRnDR/V/CoSmCkaD1wHVJnNmICb3UJTelEG5Vev6PMpGX
         QpCw==
X-Forwarded-Encrypted: i=1; AJvYcCUDO+S4JQrIrwyFM+fv6suxEkfyoIpbjZrT2p1IzpMcBixQnSnK1yt4AVQxouyU8409gn/bRR7PcMWyKJo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyhYc7Iiv6CMM9VHEC+J2oJNWYFWiMKpZK+NhyW5E8NSeL7PGmK
	u/pzT+C7RLv/t4JJB4glYGh8q3L4UukwYaFGwQ+tjIq/3mN0AJgL9l3n8A8f9wxf5ymiGcmtgrC
	68OVkqhAIy4JJURvPx6YEWUrV9DSaSYba76MDGf+D
X-Gm-Gg: ASbGnctQq5+tcB0SmB6L3uATUTWeOKSWoyjwSt9SQAns4tjpa1zVJ28v7LksJLSqblc
	t7GNn96MRzJntBaArmUFl2BsEcR+Eg6xqOcRbiQAM3BSABpxcOM/zJAIgk5h6BTl937qfJnvVai
	LufZJfdCAR+UCYMhexA2Rq46YBoiCvjBK8nwsOt7PbcAqA6VjXLy8/H8mZNuI2vluy9Zn9eDmk
X-Google-Smtp-Source: AGHT+IG/D002ZXhBmor4Jkf1l95o1PH0CZ7lfyIJhkwW05dqyb6Hr6w8Sd1w/kgXb9JdUgTcgdFi2igihz2BvD3i5/E=
X-Received: by 2002:a05:6e02:380e:b0:3dd:e7c7:36d7 with SMTP id
 e9e14a558f8ab-3df295dd9b6mr385555ab.10.1750707681160; Mon, 23 Jun 2025
 12:41:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250619002034.97007-1-irogers@google.com> <aFW4VJtk96JD865U@google.com>
 <CAP-5=fUpnW1DE68pMW0q3vMT+n6d5SeNkwXd45XLaf01-eP47A@mail.gmail.com>
 <aFmSuSyZ1ZNT94Tq@x1> <CAP-5=fXms87LVH-Y5V3OpVbwUjY=hWAe0NTX4uKQf1q3Ax-WSA@mail.gmail.com>
 <aFmZl-SUT85Im8BJ@google.com> <aFmooVYz-6p1DTSv@x1>
In-Reply-To: <aFmooVYz-6p1DTSv@x1>
From: Ian Rogers <irogers@google.com>
Date: Mon, 23 Jun 2025 12:41:09 -0700
X-Gm-Features: AX0GCFtplY2rDb1iYH1sFfYL42uEWA0pe4BQUs2pMBKx9sZ6VV3mFntvdxW5JEU
Message-ID: <CAP-5=fVGPKOVc7WA=VygSE3BKN90tSpLPhkaupX_fUboBcyHPg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] perf test workload noploop: Name the noploop process
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 23, 2025 at 12:19=E2=80=AFPM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> On Mon, Jun 23, 2025 at 11:14:47AM -0700, Namhyung Kim wrote:
> > On Mon, Jun 23, 2025 at 11:05:41AM -0700, Ian Rogers wrote:
> > > On Mon, Jun 23, 2025 at 10:45=E2=80=AFAM Arnaldo Carvalho de Melo <ac=
me@kernel.org> wrote:
> > > > On Mon, Jun 23, 2025 at 08:12:47AM -0700, Ian Rogers wrote:
> > > > > On Fri, Jun 20, 2025 at 12:36=E2=80=AFPM Namhyung Kim <namhyung@k=
ernel.org> wrote:
> > > > > > I'm afraid it'd introduce a build failure on musl.  Please see
>
> > > > > > https://lore.kernel.org/linux-perf-users/20250611092542.F4ooE2F=
L@linutronix.de/
>
> > > > > > I think <sys/prctl.h> would be enough.
>
> > > > > we could do that but in the glibc man page it says:
> > > > > https://man7.org/linux/man-pages/man2/prctl.2.html
> > > > > ```
> > > > > #include <linux/prctl.h>  /* Definition of PR_* constants */
> > > > > #include <sys/prctl.h>
> > > > > ```
>
> > > > > It'd be nice to think musl was slowly getting fixed. I notice we'=
re
>
> > > > Sebastian reported on the musl libc, its maintainer replied:
>
> > > > https://www.openwall.com/lists/musl/2025/06/12/11
>
> > > Ugh. I'm not sure how we're expected to resolve this and have glibc
> > > and musl be happy without basically not trusting libc.
>
> > Maybe pthread_setname_np()?  It seems musl also implemented it.
>
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ git diff
> diff --git a/tools/perf/tests/workloads/noploop.c b/tools/perf/tests/work=
loads/noploop.c
> index 8b954d4660833a2f..656e472e618822a3 100644
> --- a/tools/perf/tests/workloads/noploop.c
> +++ b/tools/perf/tests/workloads/noploop.c
> @@ -1,9 +1,8 @@
>  /* SPDX-License-Identifier: GPL-2.0 */
> +#include <pthread.h>
>  #include <stdlib.h>
>  #include <signal.h>
>  #include <unistd.h>
> -#include <linux/prctl.h>
> -#include <sys/prctl.h>
>  #include <linux/compiler.h>
>  #include "../tests.h"
>
> @@ -18,7 +17,7 @@ static int noploop(int argc, const char **argv)
>  {
>         int sec =3D 1;
>
> -       prctl(PR_SET_NAME, "perf-noploop");
> +       pthread_setname_np(pthread_self(), "perf-noploop");
>         if (argc > 0)
>                 sec =3D atoi(argv[0]);
>
> =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ perf test -w noploop &
> [1] 1179763
> =E2=AC=A2 [acme@toolbx perf-tools-next]$ ps
>     PID TTY          TIME CMD
>    3935 pts/1    00:00:00 bash
>    4053 pts/1    00:00:00 toolbox
>    4222 pts/1    00:00:28 podman
>  971900 pts/1    00:00:00 bash
> 1100453 pts/1    00:00:00 tail
> 1160346 pts/1    00:00:00 bash
> 1179763 pts/1    00:00:00 perf-noploop
> 1179765 pts/1    00:00:00 ps
> =E2=AC=A2 [acme@toolbx perf-tools-next]$
>
> And then on one of the Alpine Linux containers:
>
> make: Leaving directory '/tmp/perf-6.16.0-rc3/tools/perf'
> /tmp/perf-6.16.0-rc3 $ cat /etc/os-release
> NAME=3D"Alpine Linux"
> ID=3Dalpine
> VERSION_ID=3D3.18.12
> PRETTY_NAME=3D"Alpine Linux v3.18"
> HOME_URL=3D"https://alpinelinux.org/"
> BUG_REPORT_URL=3D"https://gitlab.alpinelinux.org/alpine/aports/-/issues"
> /tmp/perf-6.16.0-rc3 $ tools/perf/perf test -w noploop &
> /tmp/perf-6.16.0-rc3 $ ps
> PID   USER     TIME  COMMAND
>     1 toolsbui  0:00 /bin/sh
>  5693 toolsbui  0:00 {perf-noploop} tools/perf/perf test -w noploop
>  5694 toolsbui  0:00 ps
> /tmp/perf-6.16.0-rc3 $
> [1]+  Done                       tools/perf/perf test -w noploop
> /tmp/perf-6.16.0-rc3
>
> There are more direct use of prctl() to set the name in tools/perf/,
> using pthread_setname_np() seems cleaner :-)

Yeah, I wanted to set the program name rather than a thread name for
the sake of seeing the process name in ps - hence reaching for prctl.
PR_SET_NAME is documented as setting the thread name and so no
difference to pthread_setname_np. It's still frustrating to get bogged
down in working around musl when typing the literal code from the
prctl man page. Do you need me to re-send the patch?

Thanks,
Ian

> - Arnaldo
