Received: from mail-il1-f176.google.com (mail-il1-f176.google.com [209.85.166.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2381F1505
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 21:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746047074; cv=none; b=A4ajz0b/57ZXt9PEIoEc/cIeU79uh+dN/SMGITE3PyxtH6sE9dmZH9EYLvDtgicvUFc8FH6h4fm40lGwsl/6lSn4YNrVCpADC0VBfS5vD1bBUsQwNcli3+m0ybBaHeiiT3B5V82R1LkWEm5byXagxiaKxYVZhUgyXvDGk2bOyjw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746047074; c=relaxed/simple;
	bh=WLZoUpgMA9amOKm9bdeogO+wYosQhZkQHCpdOYStN/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q5vK9cDbolNHIJu8Yas6FACHe/ArC+gt7s4OZH2yyC0fdfqmuX1f6y3LtdWsJzzRi5Ea2rOSkAmo2uwvcsJ+lN/e5tKyv4F+NALP0foQVYwMyOm6lg2jGz+bJIrJTItwMD4qr1S/nJtWgpipkztHvmUujqN1TZxQqxaf1pauIpY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1sAojUMs; arc=none smtp.client-ip=209.85.166.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1sAojUMs"
Received: by mail-il1-f176.google.com with SMTP id e9e14a558f8ab-3d91a45d148so7755ab.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 14:04:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746047071; x=1746651871; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K8wzhtguuqfUzCEpPmZuHMoSj3l58adkSvMH8uW1PsA=;
        b=1sAojUMsXYoSbElc3/Hm1031gMRO0QscaIo3fJWN6lXzT2O6d0fOFCeO0HGzhjuZNy
         kfAJp/MJfS78PoVlgOXHiuml72zxq+SCCGI00WbbfC6dc5VsfF4G8cpHhEa9dPp3vIPX
         CPBv/mdYFSQIKeOKOkmAejtWh5R1t8bA6omfIcdL0fNM3qMmrsklxBMWakdzTpENMRAb
         9OvV0TxXeMHPFcGMZaGS9K23uUQsoK6xBnCJhVewNWV+61t4rPvVqGdmpKzvPpGC45EJ
         vHpeAZ0zM1NHR1G7I3hutKUL3uEjB2LdRnNf/jmlqK00Td6wDcw3Zlr6sQRYDgWA46iM
         u0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746047071; x=1746651871;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K8wzhtguuqfUzCEpPmZuHMoSj3l58adkSvMH8uW1PsA=;
        b=rQBtMwLgHKHyHVB1caVUE5i78WqufOc5W/YjS1nVBxuf1UMb3cVMe2bBcIJM4wd+Sn
         YXLy6WwHgCh/oJVVxeluoLfsD5F1bNxia7/b0fz+/TLzvcNzkwSpBW05U7fCcg2UdjAP
         aHKgl7Z2yddVK7++Tp1wbpgF/c+cn6FJR3hXclxvJZ1egTcWyIibdkvgeA87bcn+lnVz
         GRUH4n+AJkFB8AYmKz759rG9AEh/v1sFg/3xCoySQ8+KkOJIDucKXFML4LISv1pyMOlo
         605XkHLng9HRiFnjKVsAFkcoNMQ4eQybBbCV0b+v9/qaj00o9l74pbFLN1fIRBZHDmNe
         vcbQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9teG44556t1Wkr7daw/jrpGhREW0/RDRIOt9vnuiGRWoU6SxRQoSRv0RdEERVAcVuHZ/ugfkgiy3Jbeo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTjt/crtPQ+/RNt+uOWmToAb1ETAXnqnb0PR3He21H140T0Sx7
	kLgdP7gBNE5/CzKjsbzY7inOzsK0MieYS2frXKzDGcqmOM3u4rq1e6oDSa0khy7uCSCHzhgtM3S
	qAMYLPUhAO3Zdsc8faT331PghiNG+jFAEN+Ps
X-Gm-Gg: ASbGncu36c9krVTwz+n7XZ8tiVHD7Io7JKDHweBUUW8dCOPZJhRuchGqUI++K64e3CN
	lm9oKIJm4YRXSYfVoNla3nYjtBwVNT01R7EANGNG6XcTPxXNyhl15DVgBIRZtcEzfsI97tvM/rk
	euHCITQv1rAYyBxKk7fKx9H8vTIkj5C4VXUbNGYcMruRDy4aYOxOg=
X-Google-Smtp-Source: AGHT+IF2J5ohuRqDn+/ROM3W+9gr5gvtCNHdZ/IAjLXkugcvfj6Z1pqSKg/ihdz8bgibyBlfQOvUg7ufjQiZfeGCClc=
X-Received: by 2002:a05:6e02:1564:b0:3cf:c075:da88 with SMTP id
 e9e14a558f8ab-3d970184cd2mr203685ab.23.1746047070494; Wed, 30 Apr 2025
 14:04:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250430175036.184610-1-irogers@google.com> <20250430175036.184610-5-irogers@google.com>
 <gho6wdh00l.fsf@gouders.net>
In-Reply-To: <gho6wdh00l.fsf@gouders.net>
From: Ian Rogers <irogers@google.com>
Date: Wed, 30 Apr 2025 14:04:19 -0700
X-Gm-Features: ATxdqUHUd-sOIGZdCTJF1wsWLWGqZy7TvaDQVGtqFYFdKUa_0l0Ar28V-LY2ZI8
Message-ID: <CAP-5=fUdpa40MDNu0aDBO7o8H3YMe-cYsg-YfqUUZUY4M4XLeA@mail.gmail.com>
Subject: Re: [PATCH v2 04/47] perf bench: Silence -Wshorten-64-to-32 warnings
To: Dirk Gouders <dirk@gouders.net>
Cc: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Thomas Gleixner <tglx@linutronix.de>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	James Clark <james.clark@linaro.org>, Mike Leach <mike.leach@linaro.org>, 
	Leo Yan <leo.yan@linux.dev>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jonathan.cameron@huawei.com>, Nathan Chancellor <nathan@kernel.org>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Josh Poimboeuf <jpoimboe@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Kyle Meyer <kyle.meyer@hpe.com>, Ben Gainey <ben.gainey@arm.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Kajol Jain <kjain@linux.ibm.com>, 
	Aditya Gupta <adityag@linux.ibm.com>, Eder Zulian <ezulian@redhat.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Kuan-Wei Chiu <visitorckw@gmail.com>, 
	He Zhe <zhe.he@windriver.com>, Brian Geffon <bgeffon@google.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Howard Chu <howardchu95@gmail.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, Colin Ian King <colin.i.king@gmail.com>, 
	Dominique Martinet <asmadeus@codewreck.org>, Jann Horn <jannh@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Yang Jihong <yangjihong@bytedance.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andi Kleen <ak@linux.intel.com>, Graham Woodward <graham.woodward@arm.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Zhongqiu Han <quic_zhonhan@quicinc.com>, 
	Hao Ge <gehao@kylinos.cn>, Tengda Wu <wutengda@huaweicloud.com>, 
	Gabriele Monaco <gmonaco@redhat.com>, Chun-Tse Shao <ctshao@google.com>, 
	Casey Chen <cachen@purestorage.com>, "Dr. David Alan Gilbert" <linux@treblig.org>, 
	Li Huafei <lihuafei1@huawei.com>, "Steinar H. Gunderson" <sesse@google.com>, Levi Yun <yeoreum.yun@arm.com>, 
	Weilin Wang <weilin.wang@intel.com>, Thomas Falcon <thomas.falcon@intel.com>, 
	Thomas Richter <tmricht@linux.ibm.com>, Andrew Kreimer <algonell@gmail.com>, 
	=?UTF-8?Q?Krzysztof_=C5=81opatowski?= <krzysztof.m.lopatowski@gmail.com>, 
	Christophe Leroy <christophe.leroy@csgroup.eu>, 
	Jean-Philippe Romain <jean-philippe.romain@foss.st.com>, Junhao He <hejunhao3@huawei.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Xu Yang <xu.yang_2@nxp.com>, 
	Steve Clevenger <scclevenger@os.amperecomputing.com>, Zixian Cai <fzczx123@gmail.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, Yujie Liu <yujie.liu@intel.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 1:23=E2=80=AFPM Dirk Gouders <dirk@gouders.net> wro=
te:
>
> Hi Ian,
>
> considering so many eyes looking at this, I am probably wrong.
>
> So, this is only a "gauge reply" to see if it's worth I really read
> through all the commits ;-)
>
> Ian Rogers <irogers@google.com> writes:
>
> [SNIP]
>
> > diff --git a/tools/perf/bench/sched-pipe.c b/tools/perf/bench/sched-pip=
e.c
> > index 70139036d68f..b847213fd616 100644
> > --- a/tools/perf/bench/sched-pipe.c
> > +++ b/tools/perf/bench/sched-pipe.c
> > @@ -102,7 +102,8 @@ static const char * const bench_sched_pipe_usage[] =
=3D {
> >  static int enter_cgroup(int nr)
> >  {
> >       char buf[32];
> > -     int fd, len, ret;
> > +     int fd;
> > +     ssize_t ret, len;
> >       int saved_errno;
> >       struct cgroup *cgrp;
> >       pid_t pid;
> > @@ -118,7 +119,7 @@ static int enter_cgroup(int nr)
> >       cgrp =3D cgrps[nr];
> >
> >       if (threaded)
> > -             pid =3D syscall(__NR_gettid);
> > +             pid =3D (pid_t)syscall(__NR_gettid);
> >       else
> >               pid =3D getpid();
> >
> > @@ -172,23 +173,25 @@ static void exit_cgroup(int nr)
> >
> >  static inline int read_pipe(struct thread_data *td)
> >  {
> > -     int ret, m;
> > +     ssize_t ret;
> > +     int m;
> >  retry:
> >       if (nonblocking) {
> >               ret =3D epoll_wait(td->epoll_fd, &td->epoll_ev, 1, -1);
>
> The epoll_wait(), I know of, returns an int and not ssize_t.
>
> That shouldn't show up, because it doesn't cause real problems...

So the function is read_pipe so it should probably return a ssize_t. I
stopped short of that but made ret a ssize_t to silence the truncation
warning on the read call. Assigning smaller to bigger is of course not
an issue for epoll_wait.

Thanks,
Ian

> Best regards,
>
> Dirk
>
>
