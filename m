Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851CA171E43
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 04:28:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738643304; cv=none; b=Is6GL5DppvXJmFzpsr5nRbRJQ5dmWibmrabQXZ4SUSIfuSJr/Ksco37fx9qZzePm7dAsg5kAXoo46ash+7WWsKPgrAthNQzn4wzrHd/iRNUfFtDeRxP60sAn6cmBKS7lnZXkcEARBOYZhOBYbCy6b/IKTDHb//d8QfMkGdnDIeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738643304; c=relaxed/simple;
	bh=P78iZ9xQ8UbxmGzLqt/friDtY6KM5QhDtpi5/tVpgbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mc5cYSRmPl3NPkSi5PHn5FvAGl31AFIIRy4nhsV3mZAuodl1CbXdjevEa7K9NmaZwcM6TTaEIn5HeudW9GTBQzsDfN/BHXWKT3DeJEF15+xEzpo03+1GcAFGYbRHsaG7xkrN09NTb5pjRO56r7UHxjRbbUT2VUqzMHmu3LsDmaU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Pk6qAzPi; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Pk6qAzPi"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-3a814c54742so52735ab.1
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 20:28:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738643300; x=1739248100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=isQ8sVd/ZYdXX10+exMeQWn6lcwAN9m7lwK6b1dvzDk=;
        b=Pk6qAzPiTS4wyCiPDv9YeW+nD23selvZh31KZMCUieW3wushE/Zs2/XpSygQh1yvx1
         GZ43lkgDrFRQ0wYtfVH574PkFxjlnj+OqyuuWdqFHMnZ/ln2kd93I9hltlv2aWc6YZvB
         XuvkEL8Pbmp5JzCfuMNAMiOwwPBTRljMiOoYyV6BUNOVxz0ElmsuFJhNkWmY61UWJnOB
         cpraMjdPzGXWAxOh3g0AhBwz95cxk9oWmP0rNYErIxTEoNAYZMt2nnRLdEWS7AhRuYyX
         lzkdFlKdUVDRW0g3fjqn1IuU8XoKPvb6Heuopqg23t9M70921BqGiRK7KaLzSQI5sMSM
         C3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738643300; x=1739248100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=isQ8sVd/ZYdXX10+exMeQWn6lcwAN9m7lwK6b1dvzDk=;
        b=WQ/ULlLC4a5PcywwukPGsiP6vp5OZ507d+3O1u11/w5ipNYjlyPgVK0UYr+crUtpE9
         r3wP4tCp/7ytL46E3C5ctMR1vnKFd0FB1YNLveq6NLpt98Eaan6CrkRDUy/vDb7d9uk1
         kFLPJoqtMA1bfw2Nwid53LfUO/IjfJllZ0HD80ZnfyX2xZMRC98Pgfk0qQDhdxpzLlF1
         5gKwriNEu3bVb57cA5MXsaVDCVoxkhKuMESWnOuznY09K1Kqqzz+uTc0nAiK7z4/isHL
         /AMlEuQKE++W/IsMrxSkplZJirKssfRW9+PwfOX3P4UDyeL66keVf/3DUeR+thHYhQKg
         PxzA==
X-Forwarded-Encrypted: i=1; AJvYcCVvyZAahe5sO4NHmPGnrt8U63GPtttClzB2UXl43IdM9dHWj5UpaCXGrfuWUWQd4YXqGz4faDk3ccCgAUg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx7s8iTyR9fLLlR+07wCw7wx7c78CKcxPPXg3vyOQPmXJck0L6d
	opx0ZruoWOsFRJwxyDmC+2996qNWFy7MF9W5RYpibuWklkWNio5EqXTucNQdimk03NWIrTZk5jS
	p0uaxhxNMQmDhXXAyTsOQq2sANQM7xJaz6SHJ
X-Gm-Gg: ASbGnctRjaJ/IvlVbTxN6gCsrnNaOK53WlB24LxcC8j3i9wIJWdsBwBe8s9yDBbrYe6
	9mWiAHg6UDlzeuk8vBnfCNrWxNKSjk17Vi5NloWB2XLWQi4Gv9EJ24sE3+QiHogSbkg1dyzCGCA
	==
X-Google-Smtp-Source: AGHT+IG5sTzG4j4YPq4xO+O9ef7TyR2xB59ZmGBmUkPqmg96LmPVUmcN8SRQ57RjaaxfneElC7JIk0BXDOEJWkYakS4=
X-Received: by 2002:a05:6e02:1a86:b0:3a7:e616:8d36 with SMTP id
 e9e14a558f8ab-3d040f54d14mr1314175ab.9.1738643300377; Mon, 03 Feb 2025
 20:28:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250130030525.1482498-1-namhyung@kernel.org> <20250130030525.1482498-3-namhyung@kernel.org>
 <CAP-5=fUK_aMf8ZYJxmbOLzbu_zZWKYwx_Vvj64x3_2=0u7jbMw@mail.gmail.com> <Z6GFxj4ksBG78Pbu@google.com>
In-Reply-To: <Z6GFxj4ksBG78Pbu@google.com>
From: Ian Rogers <irogers@google.com>
Date: Mon, 3 Feb 2025 20:28:08 -0800
X-Gm-Features: AWEUYZlOB_rJalcOqCZ5ujU9FwPrE54gubqbIz1zz5GcuR0UF1v4I94Az6o-okA
Message-ID: <CAP-5=fU9Bh0_AiNhEKCKKyaWZxPyzQKNeOODL-yZFo-cMSB8Jg@mail.gmail.com>
Subject: Re: [PATCH v2 2/4] perf trace: Convert syscall_stats to hashmap
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org, 
	Howard Chu <howardchu95@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Feb 3, 2025 at 7:13=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> On Sat, Feb 01, 2025 at 11:03:54PM -0800, Ian Rogers wrote:
> > On Wed, Jan 29, 2025 at 7:05=E2=80=AFPM Namhyung Kim <namhyung@kernel.o=
rg> wrote:
> > >
> > > It was using a RBtree-based int-list as a hash and a custome resort
> > > logic for that.  As we have hashmap, let's convert to it and add a
> > > sorting function using an array.
> >
> > How is a hashmap connected to a sorting function of an array?
>
> By not using the int-list (and rb_resort code), it needs a new (re)sort
> function.  So I added one by copying pointers to hashmap entries to an
> array and calling qsort(3).  Anyway, I'll update the description.

Wouldn't pointers to entries be broken by rehashing?

> >
> > >  It's also to prepare supporting
> > > system-wide syscall stats.
> > >
> > > No functional changes intended.
> > >
> > > Signed-off-by: Namhyung Kim <namhyung@kernel.org>
> > > ---
> > >  tools/perf/builtin-trace.c | 122 ++++++++++++++++++++++++++++-------=
--
> > >  1 file changed, 93 insertions(+), 29 deletions(-)
> > >
> > > diff --git a/tools/perf/builtin-trace.c b/tools/perf/builtin-trace.c
> > > index 7e0324a2e9182088..1d32ef2b05ae8c1c 100644
> > > --- a/tools/perf/builtin-trace.c
> > > +++ b/tools/perf/builtin-trace.c
> > > @@ -39,6 +39,7 @@
> > >  #include "util/synthetic-events.h"
> > >  #include "util/evlist.h"
> > >  #include "util/evswitch.h"
> > > +#include "util/hashmap.h"
> > >  #include "util/mmap.h"
> > >  #include <subcmd/pager.h>
> > >  #include <subcmd/exec-cmd.h>
> > > @@ -63,7 +64,6 @@
> > >  #include "print_binary.h"
> > >  #include "string2.h"
> > >  #include "syscalltbl.h"
> > > -#include "rb_resort.h"
> > >  #include "../perf.h"
> > >  #include "trace_augment.h"
> > >
> > > @@ -1519,17 +1519,55 @@ struct thread_trace {
> > >                 struct file   *table;
> > >         } files;
> > >
> > > -       struct intlist *syscall_stats;
> > > +       struct hashmap *syscall_stats;
> > >  };
> > >
> > > +static size_t id_hash(long key, void *ctx __maybe_unused)
> >
> > I find the use of "id" in this code confusing - it is a pre-existing
> > problem, but you add to it here. I think a more intention revealing
> > name would be something like system_call_number_hash.
>
> Yep, probably 'syscall_id_hash'.

What is with "id"? man syscall calls them numbers. Calling the ids
makes me think they have a value other than the system call number.

> >
> > > +{
> > > +       return key;
> > > +}
> > > +
> > > +static bool id_equal(long key1, long key2, void *ctx __maybe_unused)
> > > +{
> > > +       return key1 =3D=3D key2;
> > > +}
> > > +
> > > +static struct hashmap *alloc_syscall_stats(void)
> > > +{
> > > +       struct hashmap *stats =3D hashmap__new(id_hash, id_equal, NUL=
L);
> > > +
> > > +       /* just for simpler error check */
> >
> > What is "just for simpler error check" ?
>
> Probably it can go away.  hashmap__new() returns a pointer or an error.
> But normally allocation functions tend to return NULL in error cases.
> So I changed it.


It would be easier to read something like ",If error is returned
change to NULL for a simpler error checking by callers. "

Thanks,
Ian

> >
> > > +       if (IS_ERR(stats))
> > > +               stats =3D NULL;
> > > +       return stats;
> > > +}
> > > +
> > > +static void delete_syscall_stats(struct hashmap *syscall_stats)
> > > +{
> > > +       struct hashmap_entry *pos;
> > > +       size_t bkt;
> > > +
> > > +       if (syscall_stats =3D=3D NULL)
> > > +               return;
> > > +
> > > +       hashmap__for_each_entry(syscall_stats, pos, bkt)
> > > +               free(pos->pvalue);
> > > +       hashmap__free(syscall_stats);
> > > +}
> > > +
> > >  static struct thread_trace *thread_trace__new(struct trace *trace)
> > >  {
> > >         struct thread_trace *ttrace =3D  zalloc(sizeof(struct thread_=
trace));
> > >
> > >         if (ttrace) {
> > >                 ttrace->files.max =3D -1;
> > > -               if (trace->summary)
> > > -                       ttrace->syscall_stats =3D intlist__new(NULL);
> > > +               if (trace->summary) {
> > > +                       ttrace->syscall_stats =3D alloc_syscall_stats=
();
> > > +                       if (ttrace->syscall_stats =3D=3D NULL) {
> > > +                               free(ttrace);
> > > +                               ttrace =3D NULL;
> >
> > This looks overly indented.
>
> I'm not sure.  Maybe we can change the code to return early if some more
> logic would be added.  But I didn't feel the strong needs for that.
>
> Thanks,
> Namhyung
>
>
> > > +                       }
> > > +               }
> > >         }
> > >
> > >         return ttrace;
> > > @@ -1544,7 +1582,7 @@ static void thread_trace__delete(void *pttrace)
> > >         if (!ttrace)
> > >                 return;
> > >
> > > -       intlist__delete(ttrace->syscall_stats);
> > > +       delete_syscall_stats(ttrace->syscall_stats);
> > >         ttrace->syscall_stats =3D NULL;
> > >         thread_trace__free_files(ttrace);
> > >         zfree(&ttrace->entry_str);
> > > @@ -2463,22 +2501,19 @@ struct syscall_stats {
> > >  static void thread__update_stats(struct thread *thread, struct threa=
d_trace *ttrace,
> > >                                  int id, struct perf_sample *sample, =
long err, bool errno_summary)
> > >  {
> > > -       struct int_node *inode;
> > > -       struct syscall_stats *stats;
> > > +       struct syscall_stats *stats =3D NULL;
> > >         u64 duration =3D 0;
> > >
> > > -       inode =3D intlist__findnew(ttrace->syscall_stats, id);
> > > -       if (inode =3D=3D NULL)
> > > -               return;
> > > -
> > > -       stats =3D inode->priv;
> > > -       if (stats =3D=3D NULL) {
> > > +       if (!hashmap__find(ttrace->syscall_stats, id, &stats)) {
> > >                 stats =3D zalloc(sizeof(*stats));
> > >                 if (stats =3D=3D NULL)
> > >                         return;
> > >
> > >                 init_stats(&stats->stats);
> > > -               inode->priv =3D stats;
> > > +               if (hashmap__add(ttrace->syscall_stats, id, stats) < =
0) {
> > > +                       free(stats);
> > > +                       return;
> > > +               }
> > >         }
> > >
> > >         if (ttrace->entry_time && sample->time > ttrace->entry_time)
> > > @@ -4617,18 +4652,45 @@ static size_t trace__fprintf_threads_header(F=
ILE *fp)
> > >         return printed;
> > >  }
> > >
> > > -DEFINE_RESORT_RB(syscall_stats, a->msecs > b->msecs,
> > > +struct syscall_entry {
> > >         struct syscall_stats *stats;
> > >         double               msecs;
> > >         int                  syscall;
> > > -)
> > > +};
> > > +
> > > +static int entry_cmp(const void *e1, const void *e2)
> > >  {
> > > -       struct int_node *source =3D rb_entry(nd, struct int_node, rb_=
node);
> > > -       struct syscall_stats *stats =3D source->priv;
> > > +       const struct syscall_entry *entry1 =3D e1;
> > > +       const struct syscall_entry *entry2 =3D e2;
> > >
> > > -       entry->syscall =3D source->i;
> > > -       entry->stats   =3D stats;
> > > -       entry->msecs   =3D stats ? (u64)stats->stats.n * (avg_stats(&=
stats->stats) / NSEC_PER_MSEC) : 0;
> > > +       return entry1->msecs > entry2->msecs ? -1 : 1;
> > > +}
> > > +
> > > +static struct syscall_entry *thread__sort_stats(struct thread_trace =
*ttrace)
> > > +{
> > > +       struct syscall_entry *entry;
> > > +       struct hashmap_entry *pos;
> > > +       unsigned bkt, i, nr;
> > > +
> > > +       nr =3D ttrace->syscall_stats->sz;
> > > +       entry =3D malloc(nr * sizeof(*entry));
> > > +       if (entry =3D=3D NULL)
> > > +               return NULL;
> > > +
> > > +       i =3D 0;
> > > +       hashmap__for_each_entry(ttrace->syscall_stats, pos, bkt) {
> > > +               struct syscall_stats *ss =3D pos->pvalue;
> > > +               struct stats *st =3D &ss->stats;
> > > +
> > > +               entry[i].stats =3D ss;
> > > +               entry[i].msecs =3D (u64)st->n * (avg_stats(st) / NSEC=
_PER_MSEC);
> > > +               entry[i].syscall =3D pos->key;
> > > +               i++;
> > > +       }
> > > +       assert(i =3D=3D nr);
> > > +
> > > +       qsort(entry, nr, sizeof(*entry), entry_cmp);
> > > +       return entry;
> > >  }
> > >
> > >  static size_t thread__dump_stats(struct thread_trace *ttrace,
> > > @@ -4636,10 +4698,10 @@ static size_t thread__dump_stats(struct threa=
d_trace *ttrace,
> > >  {
> > >         size_t printed =3D 0;
> > >         struct syscall *sc;
> > > -       struct rb_node *nd;
> > > -       DECLARE_RESORT_RB_INTLIST(syscall_stats, ttrace->syscall_stat=
s);
> > > +       struct syscall_entry *entries;
> > >
> > > -       if (syscall_stats =3D=3D NULL)
> > > +       entries =3D thread__sort_stats(ttrace);
> > > +       if (entries =3D=3D NULL)
> > >                 return 0;
> > >
> > >         printed +=3D fprintf(fp, "\n");
> > > @@ -4648,8 +4710,10 @@ static size_t thread__dump_stats(struct thread=
_trace *ttrace,
> > >         printed +=3D fprintf(fp, "                                   =
  (msec)    (msec)    (msec)    (msec)        (%%)\n");
> > >         printed +=3D fprintf(fp, "   --------------- --------  ------=
 -------- --------- --------- ---------     ------\n");
> > >
> > > -       resort_rb__for_each_entry(nd, syscall_stats) {
> > > -               struct syscall_stats *stats =3D syscall_stats_entry->=
stats;
> > > +       for (size_t i =3D 0; i < ttrace->syscall_stats->sz; i++) {
> > > +               struct syscall_entry *entry =3D &entries[i];
> > > +               struct syscall_stats *stats =3D entry->stats;
> > > +
> > >                 if (stats) {
> > >                         double min =3D (double)(stats->stats.min) / N=
SEC_PER_MSEC;
> > >                         double max =3D (double)(stats->stats.max) / N=
SEC_PER_MSEC;
> > > @@ -4660,10 +4724,10 @@ static size_t thread__dump_stats(struct threa=
d_trace *ttrace,
> > >                         pct =3D avg ? 100.0 * stddev_stats(&stats->st=
ats) / avg : 0.0;
> > >                         avg /=3D NSEC_PER_MSEC;
> > >
> > > -                       sc =3D &trace->syscalls.table[syscall_stats_e=
ntry->syscall];
> > > +                       sc =3D &trace->syscalls.table[entry->syscall]=
;
> > >                         printed +=3D fprintf(fp, "   %-15s", sc->name=
);
> > >                         printed +=3D fprintf(fp, " %8" PRIu64 " %6" P=
RIu64 " %9.3f %9.3f %9.3f",
> > > -                                          n, stats->nr_failures, sys=
call_stats_entry->msecs, min, avg);
> > > +                                          n, stats->nr_failures, ent=
ry->msecs, min, avg);
> > >                         printed +=3D fprintf(fp, " %9.3f %9.2f%%\n", =
max, pct);
> > >
> > >                         if (trace->errno_summary && stats->nr_failure=
s) {
> > > @@ -4677,7 +4741,7 @@ static size_t thread__dump_stats(struct thread_=
trace *ttrace,
> > >                 }
> > >         }
> > >
> > > -       resort_rb__delete(syscall_stats);
> > > +       free(entries);
> > >         printed +=3D fprintf(fp, "\n\n");
> > >
> > >         return printed;
> > > --
> > > 2.48.1.262.g85cc9f2d1e-goog
> > >
