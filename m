Received: from mail-il1-f180.google.com (mail-il1-f180.google.com [209.85.166.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DA3428B4F0
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 17:55:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748454961; cv=none; b=iRMb2zyqD5PxP8QYDkUdCFgAXGGpFVeU7Vlt+J1gtUv8T+nwUnAzb/ADdJ4YxhbmkEDTsVW+PvlJ50wuGmi7pbKOh0JP0jGYmowknMzJv5FBKe/l/n0UOC/Ky9E9TQGHg5nLGh6p6BX0LxRbiFCTC8OpW3POhv9WGO+GX8PoKi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748454961; c=relaxed/simple;
	bh=ndd8CEHICzgGNBaKkbdfnWB2emvXv9H0Ry9SqsgyBPE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iMNhtlKPd+5ZRDxpbQKCJOlej2WFF6E7yAZrnqcnkI9GN+FhZ7btmcUQCSdoILQ31HEKPxyL52EdVNJpkJkpJwa8LOciOF+mRGn2ArM7k5Boun51KL3sZUIzrOmr+jJFyHkqnuTetjGq9BZ887xuBv7LQScF5qpFBmi3kQF/fzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y+qYLXN2; arc=none smtp.client-ip=209.85.166.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y+qYLXN2"
Received: by mail-il1-f180.google.com with SMTP id e9e14a558f8ab-3dd89a85414so20555ab.0
        for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 10:55:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748454958; x=1749059758; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qb1MJmvZqyIrdb/IicxGAXgYqynABNU/RaCtZ3VgB1w=;
        b=Y+qYLXN21hgfKwxG/kOEup2cPECvXpiJnh6jwneh+L458h2f3r9H8qQxYtP9eUdoxI
         8uWmw6+OvIIxNiS0ZKeRA6Rm6W32Wgz8GKZ5ORcJuF3BkogbQ+kNWxnvnHbAxiPrXYBH
         hHWMKjC7fdb+//M/8DuddtaVMQAJX0fwcv5G0/p5HR2Zm/obVXvP5rm258/uBidjxO6y
         DiIoLur4NuMGw832QX99iVhdSGXGmAQjZYtyzDgbCMfp/T1vVsFW/06GKzFYAwkLITdt
         lQhnaZDmvvns8pV8KIbw0tYJTN7rCJPPK3Jw3B/kuOkYrXop9Zgin3bXNViCqDFIgK86
         8duw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748454958; x=1749059758;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Qb1MJmvZqyIrdb/IicxGAXgYqynABNU/RaCtZ3VgB1w=;
        b=OGfPowSJi158SgSXjOaVic/gOUgqinpFP1xRzAhCMoqovNiGfH6lYdDGsCN0JTsYjJ
         vTe0O3s8XJ4baJceTqPZrOtdg27xkJbU+Lh6RdiPa1DLy1340r8OGin9xikTvuYjrTFB
         p5DCF2GOlUMGdH0/8cv0S8kMNCTQL0V2SAqcdXvPoiWvsqahGK/Y6v+fNGhz4ImE/8IF
         3MDSa6E7Y6xVshSRMBPMY1HcCzSZpMNmlB24wSibGpfGWXEewlVnftWCQU+RgBNFrrNP
         HOW+yJZbUS60/ujUrt0F7cFibQBb+N8DQYte6c8iVhMrxOATNNTTxWlwzMakgdiBPAq5
         WwOA==
X-Forwarded-Encrypted: i=1; AJvYcCWbjN5VI2UpsUYqShhx8I4vdjrsFlSkJqyUUQ62Xu1aZYmwa1+6VBAiZ9h8430IhsgJJtXjYqqq4XJjLiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZGwbXUdc9rGVztH3sNDFACkiIYjEmsl9uuBBt1bqArVcr3L6v
	Aba/p9BM/N9dqfOABpw6DGZmYbgX2QyzTckMyjtoJ6Y9AkfinwYgjLULbyvSq5MJJoB72aWeSBU
	0xSmtJHYYm71LHkLO1ZHb/J7W/YVeTBce6Tt2wUis
X-Gm-Gg: ASbGncukoe3Q5y83UebEdTfINohlO6BFRdeWw1usbATUPnG+WCTwpEf2gjAJASWTLsT
	+zAy5VJChNI1qZad3R+gzecB9u6YkyEb6s/hFgXMmrKBdUNGYTb/Y7ylBTzo8uQavKztLXL7Cv0
	Gsusq3JrN8G83OuVdHo02wquVCh4j8RVEh7d9TVaz1sUb71g9UdRPBmM9QV9mvjqjNOgo5M0ae
X-Google-Smtp-Source: AGHT+IH8H9kdP5QgNHZg9x8SBiy3fEuCuWHxdNZGKht1ofEPXj/3aOU+qzO0C3AcAPo9t/kw6XvTikpgovzRYTXUnTU=
X-Received: by 2002:a05:6e02:3cc1:b0:3dc:8100:5436 with SMTP id
 e9e14a558f8ab-3dd919125c1mr210375ab.0.1748454957779; Wed, 28 May 2025
 10:55:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aDcyVLVpZRui1ole@x1> <aDcyvvOKZkRYbjul@x1>
In-Reply-To: <aDcyvvOKZkRYbjul@x1>
From: Ian Rogers <irogers@google.com>
Date: Wed, 28 May 2025 10:55:45 -0700
X-Gm-Features: AX0GCFu7zK8Os33MqQ2qdqVh8G85GK6V6-l0Hpk2vsnuoLB9Ll6jxi_CYYzViB4
Message-ID: <CAP-5=fWo2eM+aATScvQsBZKj7mZKug6HBW5bEw1Xp_Hqk3m3Vg@mail.gmail.com>
Subject: Re: [PATCH 1/1] Revert "perf thread: Ensure comm_lock held for comm_list"
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Namhyung Kim <namhyung@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	Athira Rajeev <atrajeev@linux.vnet.ibm.com>, Bill Wendling <morbo@google.com>, 
	Chaitanya S Prakash <chaitanyas.prakash@arm.com>, Fei Lang <langfei@huawei.com>, 
	Howard Chu <howardchu95@gmail.com>, Ingo Molnar <mingo@redhat.com>, 
	James Clark <james.clark@linaro.org>, Jiri Olsa <jolsa@kernel.org>, 
	Justin Stitt <justinstitt@google.com>, Kan Liang <kan.liang@linux.intel.com>, 
	Mark Rutland <mark.rutland@arm.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Peter Zijlstra <peterz@infradead.org>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 28, 2025 at 8:58=E2=80=AFAM Arnaldo Carvalho de Melo
<acme@kernel.org> wrote:
>
> Hi Ian,
>
>         This one had hit perf-tools-next, so I'm reverting it till we
> figure out, since I'm trying to finish processing patches real soon now
> for this window, to give it some time to soak in linux-next.
>
>         I noticed that sometimes when trying to exit 'perf top' it just
> sat there, so doing a bisect I ended up on this one, had no time to
> properly investigate it.

Hi Arnaldo,

I believe it is fixed by:
https://lore.kernel.org/lkml/20250528032637.198960-8-irogers@google.com/
I was actually trying to repro a DEBUG=3D1 issue I'd seen in `perf top`
with this assert failing:
https://web.git.kernel.org/pub/scm/linux/kernel/git/perf/perf-tools-next.gi=
t/tree/tools/perf/util/maps.c?h=3Dperf-tools-next#n80
```
assert(RC_CHK_EQUAL(map__kmap(map)->kmaps, maps));
```
but no dice on that - I suspect it has something to do with modules or
BPF or something.
Anyway, with the patch above `perf top` for me I wasn't able to make
it crash even when being aggressive and running with both address and
memory sanitizer.

Thanks,
Ian

> - Arnaldo
>
> On Wed, May 28, 2025 at 12:57:11PM -0300, Arnaldo Carvalho de Melo wrote:
> > This reverts commit 8f454c95817d15ee529d58389612ea4b34f5ffb3.
> >
> > 'perf top' is freezing on exit sometimes, bisected to this one, revert.
> >
> > Cc: Adrian Hunter <adrian.hunter@intel.com>
> > Cc: Alexander Shishkin <alexander.shishkin@linux.intel.com>
> > Cc: Athira Rajeev <atrajeev@linux.vnet.ibm.com>
> > Cc: Bill Wendling <morbo@google.com>
> > Cc: Chaitanya S Prakash <chaitanyas.prakash@arm.com>
> > Cc: Fei Lang <langfei@huawei.com>
> > Cc: Howard Chu <howardchu95@gmail.com>
> > Cc: Ian Rogers <irogers@google.com>
> > Cc: Ingo Molnar <mingo@redhat.com>
> > Cc: James Clark <james.clark@linaro.org>
> > Cc: Jiri Olsa <jolsa@kernel.org>
> > Cc: Justin Stitt <justinstitt@google.com>
> > Cc: Kan Liang <kan.liang@linux.intel.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Namhyung Kim <namhyung@kernel.org>
> > Cc: Nathan Chancellor <nathan@kernel.org>
> > Cc: Nick Desaulniers <nick.desaulniers+lkml@gmail.com>
> > Cc: Peter Zijlstra <peterz@infradead.org>
> > Cc: Stephen Brennan <stephen.s.brennan@oracle.com>
> > Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
> > ---
> >  tools/perf/util/comm.c   |  2 --
> >  tools/perf/util/thread.c | 17 ++++-------------
> >  tools/perf/util/thread.h |  9 ++++-----
> >  3 files changed, 8 insertions(+), 20 deletions(-)
> >
> > diff --git a/tools/perf/util/comm.c b/tools/perf/util/comm.c
> > index 9880247a2c3364cb..8aa456d7c2cd2d74 100644
> > --- a/tools/perf/util/comm.c
> > +++ b/tools/perf/util/comm.c
> > @@ -24,7 +24,6 @@ static struct comm_strs {
> >  static void comm_strs__remove_if_last(struct comm_str *cs);
> >
> >  static void comm_strs__init(void)
> > -     NO_THREAD_SAFETY_ANALYSIS /* Inherently single threaded due to pt=
hread_once. */
> >  {
> >       init_rwsem(&_comm_strs.lock);
> >       _comm_strs.capacity =3D 16;
> > @@ -120,7 +119,6 @@ static void comm_strs__remove_if_last(struct comm_s=
tr *cs)
> >  }
> >
> >  static struct comm_str *__comm_strs__find(struct comm_strs *comm_strs,=
 const char *str)
> > -     SHARED_LOCKS_REQUIRED(comm_strs->lock)
> >  {
> >       struct comm_str **result;
> >
> > diff --git a/tools/perf/util/thread.c b/tools/perf/util/thread.c
> > index c202b98b36c29215..415c0e5d1e751a47 100644
> > --- a/tools/perf/util/thread.c
> > +++ b/tools/perf/util/thread.c
> > @@ -41,7 +41,6 @@ int thread__init_maps(struct thread *thread, struct m=
achine *machine)
> >  }
> >
> >  struct thread *thread__new(pid_t pid, pid_t tid)
> > -     NO_THREAD_SAFETY_ANALYSIS /* Allocation/creation is inherently si=
ngle threaded. */
> >  {
> >       RC_STRUCT(thread) *_thread =3D zalloc(sizeof(*_thread));
> >       struct thread *thread;
> > @@ -203,29 +202,22 @@ int thread__set_namespaces(struct thread *thread,=
 u64 timestamp,
> >
> >  struct comm *thread__comm(struct thread *thread)
> >  {
> > -     struct comm *res =3D NULL;
> > +     if (list_empty(thread__comm_list(thread)))
> > +             return NULL;
> >
> > -     down_read(thread__comm_lock(thread));
> > -     if (!list_empty(thread__comm_list(thread)))
> > -             res =3D list_first_entry(thread__comm_list(thread), struc=
t comm, list);
> > -     up_read(thread__comm_lock(thread));
> > -     return res;
> > +     return list_first_entry(thread__comm_list(thread), struct comm, l=
ist);
> >  }
> >
> >  struct comm *thread__exec_comm(struct thread *thread)
> >  {
> >       struct comm *comm, *last =3D NULL, *second_last =3D NULL;
> >
> > -     down_read(thread__comm_lock(thread));
> >       list_for_each_entry(comm, thread__comm_list(thread), list) {
> > -             if (comm->exec) {
> > -                     up_read(thread__comm_lock(thread));
> > +             if (comm->exec)
> >                       return comm;
> > -             }
> >               second_last =3D last;
> >               last =3D comm;
> >       }
> > -     up_read(thread__comm_lock(thread));
> >
> >       /*
> >        * 'last' with no start time might be the parent's comm of a synt=
hesized
> > @@ -241,7 +233,6 @@ struct comm *thread__exec_comm(struct thread *threa=
d)
> >
> >  static int ____thread__set_comm(struct thread *thread, const char *str=
,
> >                               u64 timestamp, bool exec)
> > -     EXCLUSIVE_LOCKS_REQUIRED(thread__comm_lock(thread))
> >  {
> >       struct comm *new, *curr =3D thread__comm(thread);
> >
> > diff --git a/tools/perf/util/thread.h b/tools/perf/util/thread.h
> > index 56e08c8ae005e82b..cd574a896418ac94 100644
> > --- a/tools/perf/util/thread.h
> > +++ b/tools/perf/util/thread.h
> > @@ -236,15 +236,14 @@ static inline struct rw_semaphore *thread__namesp=
aces_lock(struct thread *thread
> >       return &RC_CHK_ACCESS(thread)->namespaces_lock;
> >  }
> >
> > -static inline struct rw_semaphore *thread__comm_lock(struct thread *th=
read)
> > +static inline struct list_head *thread__comm_list(struct thread *threa=
d)
> >  {
> > -     return &RC_CHK_ACCESS(thread)->comm_lock;
> > +     return &RC_CHK_ACCESS(thread)->comm_list;
> >  }
> >
> > -static inline struct list_head *thread__comm_list(struct thread *threa=
d)
> > -     SHARED_LOCKS_REQUIRED(thread__comm_lock(thread))
> > +static inline struct rw_semaphore *thread__comm_lock(struct thread *th=
read)
> >  {
> > -     return &RC_CHK_ACCESS(thread)->comm_list;
> > +     return &RC_CHK_ACCESS(thread)->comm_lock;
> >  }
> >
> >  static inline u64 thread__db_id(const struct thread *thread)
> > --
> > 2.49.0
> >
