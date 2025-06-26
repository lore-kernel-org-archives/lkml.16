Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53BE12E92D9
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 15:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750951425; cv=none; b=EZd1l+EKup12mYDTJXYKkphWxyKo7FPNxM5rQtSnvSnkejQjeh6BSfpwl0wZpJ6mA8g7RawFBRDoTNC8UBp446OY9cjuufN1iAS44yHGYQp5CbvCo0b+RNPqoIbmdgdKrrIlHutpj8/yUfM0cv4mvObGB+0JeiHr/vbTCbRCfHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750951425; c=relaxed/simple;
	bh=l5IAecwfwgW9InXIIdWYibVNlhHzPZmG+FWYNkEpVC8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=g1PkMOMCx9jb/hcY6bAmAa7BZAAR1lhr0U4WNAzOi46f5Evq1Lvgoby01qZAAqArznR+yQpyjyAR/4YFKZuRJCiwmkdKKKxU5S1nAipT/lby4axucr9CbXbGyfHxnsg6jw2tZV9uye8LbR7O3XqsiJ//PPT7RHw0xWVgmi0BNM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=omuDCJmO; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="omuDCJmO"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235e389599fso227965ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750951422; x=1751556222; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FX6VxzPbOryYZd958dJkdr3Qb7mUa7/OFuKpGG6h6i4=;
        b=omuDCJmOfDw6mKKx9AEfZyyQMsR4WoEpFqee9Rh05dcKOgENV8vI8qMQPPsxK+Mm7F
         MFGRz13xsQKLSQzjEe1coE5cE+85mjFTpZhc311yByHsN+8EML7TBOukXW851+Wf/HxN
         3/2SaQjQovLUSlF76H0ZAYmEtqzjKf/1iuDYvz5ipHWSbifv/D/IGh7KHM/YB+tJSnjB
         J6Jg7djR3mtRIpYbsnS7+Di/30BbwWLLpmNxShGqW/K9FmSvEaRActMBbRE8XV4pXZFX
         4xvPXhZhwhrshVc3vYozieZ22gOw4cNTeYi1E1pDzq5tO+SqrKflZ+B7DibgErhw+dG9
         WEag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750951422; x=1751556222;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FX6VxzPbOryYZd958dJkdr3Qb7mUa7/OFuKpGG6h6i4=;
        b=Qvcq++8OhpkTbNcQeNUo5GhO878jxILUH+Z+t64qupKb7basecswzCGTAi11/e9SMn
         oLw8TQeDBg1rSJbdFQM0GlGpp6Vvz5Jr9TF7wjVA6m0fM1M4NWTeSNtPAx3xETbyd0ZK
         MNK/FRo/2fPzqGK0m2g9xOPXRNPC600vknWvYL5VvG20j79nxj0I2mxaLL/K0mujk4fs
         o7pw4cmAlTJBR5ZyokQ4N+TqcCI+Z4coedrU4rKrtdk+b9m3VLd8e3ZFCerwJVB3axuL
         Q6E+uaWy5Zv09wJgZpQwQ6YqDkOhrkfNfAAzUX0vnbJe6T7XkUqfjaTsTlLfZVsGx7/D
         fGMA==
X-Forwarded-Encrypted: i=1; AJvYcCWbFj7LSIxsEJO4iivjYvB/af0cr573IbYqS3STLDgx6q7aeZBNH2FE64Qyhzx5IPiU4Sb46CIJLeoBXZk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxoujm8zvhzHBBnza5NqAhZDP3i8N+CMphjQloS9FWhHTDqN6LE
	v2Hs2UGMW5y6uPGw4Iq2+/OKyEGNU2H9XDXeHCdNScGQ/bg67EBOtVlDOUYKjf2/U9SNhYh9ULP
	VmsYuRx41izyxUZeLMA2N2pcXiGpnYYdiAjG0Yj2/
X-Gm-Gg: ASbGncuDOKBxq6mr54IpnlarHFVGMtORYvstr/tapFIidxJmu7cVW07lSO2Vk3cjrRP
	udhdYo59kn2ab8viStIyWq2IMkfsjwrIW3hKUE937Eyk4Pqv4ImT6cAzUMB/f6T9Zrm9uEDXSjg
	cc2KALNDGPg5nY9SEXBr/9gYOKbsfnbA0IJH8LddweUApCvwjjJsdYEkDGHAtKRn2gV+zxWnFKm
	a6VC4KkEWA=
X-Google-Smtp-Source: AGHT+IFWKUOmiQRTWvihAFEnRDGqmwJsvDMV0M/cLZsCh8FqtTX2L15ZEcPsl8sIJZGCfXhpgS4MX8O+8iySvVcVyd0=
X-Received: by 2002:a17:902:ebd1:b0:215:7152:36e4 with SMTP id
 d9443c01a7336-2397b73a3cemr2596935ad.27.1750951422224; Thu, 26 Jun 2025
 08:23:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250625230339.702610-1-namhyung@kernel.org>
In-Reply-To: <20250625230339.702610-1-namhyung@kernel.org>
From: Ian Rogers <irogers@google.com>
Date: Thu, 26 Jun 2025 08:23:30 -0700
X-Gm-Features: Ac12FXyGR6vjStPjeIMEXre53nU60n15O9EAAMzz1en6TmVOsBNEfWWD9-JhHG0
Message-ID: <CAP-5=fUUOT4-1DU=Lx7OTayLssUq_ZT-bdGuqRzj_2jMqBx_FQ@mail.gmail.com>
Subject: Re: [PATCH v3] perf annotate: Fix source code annotate with objdump
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Kan Liang <kan.liang@linux.intel.com>, 
	Jiri Olsa <jolsa@kernel.org>, Adrian Hunter <adrian.hunter@intel.com>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>, 
	LKML <linux-kernel@vger.kernel.org>, linux-perf-users@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 25, 2025 at 4:03=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> =
wrote:
>
> Recently it uses llvm and capstone to speed up annotation or disassembly
> of instructions.  But they don't support source code view yet.  Until it
> fixed, we can force to use objdump for source code annotation.
>
> To prevent performance loss, it's disabled by default and turned it on
> when user requests it in TUI by pressing 's' key.
>
> Link: https://lore.kernel.org/r/20250608004613.238291-1-namhyung@kernel.o=
rg
> Reported-by: Ingo Molnar <mingo@kernel.org>
> Signed-off-by: Namhyung Kim <namhyung@kernel.org>

Can we move this series forward:
https://lore.kernel.org/lkml/20250417230740.86048-1-irogers@google.com/
There was some build testing by Arnaldo but then things became
stalled. I'm guessing I'll need to send a rebase.

Thanks,
Ian

> ---
> v3)
>  * show warning when there's no source code
>
>  tools/perf/ui/browsers/annotate.c | 86 +++++++++++++++++++++++++++++--
>  tools/perf/util/annotate.c        |  2 +
>  tools/perf/util/annotate.h        |  1 +
>  tools/perf/util/disasm.c          |  7 +++
>  4 files changed, 93 insertions(+), 3 deletions(-)
>
> diff --git a/tools/perf/ui/browsers/annotate.c b/tools/perf/ui/browsers/a=
nnotate.c
> index ab776b1ed2d5b4ba..183902dac042ecb0 100644
> --- a/tools/perf/ui/browsers/annotate.c
> +++ b/tools/perf/ui/browsers/annotate.c
> @@ -345,6 +345,23 @@ static void annotate_browser__calc_percent(struct an=
notate_browser *browser,
>         browser->curr_hot =3D rb_last(&browser->entries);
>  }
>
> +static struct annotation_line *annotate_browser__find_new_asm_line(
> +                                       struct annotate_browser *browser,
> +                                       int idx_asm)
> +{
> +       struct annotation_line *al;
> +       struct list_head *head =3D browser->b.entries;
> +
> +       /* find an annotation line in the new list with the same idx_asm =
*/
> +       list_for_each_entry(al, head, node) {
> +               if (al->idx_asm =3D=3D idx_asm)
> +                       return al;
> +       }
> +
> +       /* There are no asm lines */
> +       return NULL;
> +}
> +
>  static struct annotation_line *annotate_browser__find_next_asm_line(
>                                         struct annotate_browser *browser,
>                                         struct annotation_line *al)
> @@ -368,7 +385,31 @@ static struct annotation_line *annotate_browser__fin=
d_next_asm_line(
>         return NULL;
>  }
>
> -static bool annotate_browser__toggle_source(struct annotate_browser *bro=
wser)
> +static bool annotation__has_source(struct annotation *notes)
> +{
> +       struct annotation_line *al;
> +       bool found_asm =3D false;
> +
> +       /* Let's skip the first non-asm lines which present regardless of=
 source. */
> +       list_for_each_entry(al, &notes->src->source, node) {
> +               if (al->offset >=3D 0) {
> +                       found_asm =3D true;
> +                       break;
> +               }
> +       }
> +
> +       if (found_asm) {
> +               /* After assembly lines, any line without offset means so=
urce. */
> +               list_for_each_entry_continue(al, &notes->src->source, nod=
e) {
> +                       if (al->offset =3D=3D -1)
> +                               return true;
> +               }
> +       }
> +       return false;
> +}
> +
> +static bool annotate_browser__toggle_source(struct annotate_browser *bro=
wser,
> +                                           struct evsel *evsel)
>  {
>         struct annotation *notes =3D browser__annotation(&browser->b);
>         struct annotation_line *al;
> @@ -377,6 +418,39 @@ static bool annotate_browser__toggle_source(struct a=
nnotate_browser *browser)
>         browser->b.seek(&browser->b, offset, SEEK_CUR);
>         al =3D list_entry(browser->b.top, struct annotation_line, node);
>
> +       if (!annotate_opts.annotate_src)
> +               annotate_opts.annotate_src =3D true;
> +
> +       /*
> +        * It's about to get source code annotation for the first time.
> +        * Drop the existing annotation_lines and get the new one with so=
urce.
> +        * And then move to the original line at the same asm index.
> +        */
> +       if (annotate_opts.hide_src_code && !notes->src->tried_source) {
> +               struct map_symbol *ms =3D browser->b.priv;
> +               int orig_idx_asm =3D al->idx_asm;
> +
> +               /* annotate again with source code info */
> +               annotate_opts.hide_src_code =3D false;
> +               annotated_source__purge(notes->src);
> +               symbol__annotate2(ms, evsel, &browser->arch);
> +               annotate_opts.hide_src_code =3D true;
> +
> +               /* should be after annotated_source__purge() */
> +               notes->src->tried_source =3D true;
> +
> +               if (!annotation__has_source(notes))
> +                       ui__warning("Annotation has no source code.");
> +
> +               browser->b.entries =3D &notes->src->source;
> +               al =3D annotate_browser__find_new_asm_line(browser, orig_=
idx_asm);
> +               if (unlikely(al =3D=3D NULL)) {
> +                       al =3D list_first_entry(&notes->src->source,
> +                                             struct annotation_line, nod=
e);
> +               }
> +               browser->b.seek(&browser->b, al->idx_asm, SEEK_SET);
> +       }
> +
>         if (annotate_opts.hide_src_code) {
>                 if (al->idx_asm < offset)
>                         offset =3D al->idx;
> @@ -833,7 +907,7 @@ static int annotate_browser__run(struct annotate_brow=
ser *browser,
>                         nd =3D browser->curr_hot;
>                         break;
>                 case 's':
> -                       if (annotate_browser__toggle_source(browser))
> +                       if (annotate_browser__toggle_source(browser, evse=
l))
>                                 ui_helpline__puts(help);
>                         annotate__scnprintf_title(hists, title, sizeof(ti=
tle));
>                         annotate_browser__show(&browser->b, title, help);
> @@ -1011,6 +1085,12 @@ int symbol__tui_annotate(struct map_symbol *ms, st=
ruct evsel *evsel,
>                         ui__error("Couldn't annotate %s:\n%s", sym->name,=
 msg);
>                         return -1;
>                 }
> +
> +               if (!annotate_opts.hide_src_code) {
> +                       notes->src->tried_source =3D true;
> +                       if (!annotation__has_source(notes))
> +                               ui__warning("Annotation has no source cod=
e.");
> +               }
>         }
>
>         ui_helpline__push("Press ESC to exit");
> @@ -1025,7 +1105,7 @@ int symbol__tui_annotate(struct map_symbol *ms, str=
uct evsel *evsel,
>
>         ret =3D annotate_browser__run(&browser, evsel, hbt);
>
> -       if(not_annotated)
> +       if (not_annotated && !notes->src->tried_source)
>                 annotated_source__purge(notes->src);
>
>         return ret;
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index 264a212b47df850c..0dd475a744b6dfac 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -1451,6 +1451,7 @@ void annotated_source__purge(struct annotated_sourc=
e *as)
>                 list_del_init(&al->node);
>                 disasm_line__free(disasm_line(al));
>         }
> +       as->tried_source =3D false;
>  }
>
>  static size_t disasm_line__fprintf(struct disasm_line *dl, FILE *fp)
> @@ -2280,6 +2281,7 @@ void annotation_options__init(void)
>         opt->annotate_src =3D true;
>         opt->offset_level =3D ANNOTATION__OFFSET_JUMP_TARGETS;
>         opt->percent_type =3D PERCENT_PERIOD_LOCAL;
> +       opt->hide_src_code =3D true;
>         opt->hide_src_code_on_title =3D true;
>  }
>
> diff --git a/tools/perf/util/annotate.h b/tools/perf/util/annotate.h
> index bbb89b32f398b3c9..8b5131d257b01e3e 100644
> --- a/tools/perf/util/annotate.h
> +++ b/tools/perf/util/annotate.h
> @@ -294,6 +294,7 @@ struct annotated_source {
>         int                     nr_entries;
>         int                     nr_asm_entries;
>         int                     max_jump_sources;
> +       bool                    tried_source;
>         u64                     start;
>         struct {
>                 u8              addr;
> diff --git a/tools/perf/util/disasm.c b/tools/perf/util/disasm.c
> index 8f0eb56c6fc66a96..ff475a239f4b0db4 100644
> --- a/tools/perf/util/disasm.c
> +++ b/tools/perf/util/disasm.c
> @@ -2284,6 +2284,13 @@ int symbol__disassemble(struct symbol *sym, struct=
 annotate_args *args)
>                 }
>         }
>
> +       /* FIXME: LLVM and CAPSTONE should support source code */
> +       if (options->annotate_src && !options->hide_src_code) {
> +               err =3D symbol__disassemble_objdump(symfs_filename, sym, =
args);
> +               if (err =3D=3D 0)
> +                       goto out_remove_tmp;
> +       }
> +
>         err =3D -1;
>         for (u8 i =3D 0; i < ARRAY_SIZE(options->disassemblers) && err !=
=3D 0; i++) {
>                 enum perf_disassembler dis =3D options->disassemblers[i];
> --
> 2.50.0.727.gbf7dc18ff4-goog
>
