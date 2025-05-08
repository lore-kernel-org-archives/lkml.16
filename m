Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83C1715B0EF
	for <linux-kernel@vger.kernel.org>; Thu,  8 May 2025 21:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746740511; cv=none; b=mhYoL+IH1COuOh0b2gB5lnsuipFND0Rb6U8gHX4eVUh+5LLmFUDjMn/5a7XqxfonZ+AP7d8yLahyOR4i9lgJN+lpPI3agnct+qXTsN0/FfvWt9QDAvdNr0t2mRxIWJL3xhlObJky17Iy0jkWwTJlrRB1OB7N9JrS9JtrUw7CGL0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746740511; c=relaxed/simple;
	bh=7Ip9/nzNt8NqPA4tzVtTMsMl0DklgqNyVgIWGPkPhfI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kjBeVYdGzPRBI/62BfQhEZFbv54wE9ptnjuepA9aVAMUab4/nuBRlDqDnFM6sQ1S17kDSLnU5JkE52fu2m4014QFv5iS3eMW7FQ1rzn1jFOdOXKSMwOZIgpov2fBZrNK1Laq7PFIWNnvXEOy/IxLbeTdVqgq5SQ7GEn6JCpao7c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hHKsg41M; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hHKsg41M"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4774611d40bso91211cf.0
        for <linux-kernel@vger.kernel.org>; Thu, 08 May 2025 14:41:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746740508; x=1747345308; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmKk3GLSRxx8+Kwgcnr1XAp5wF86LzLkBPKCEHaK3X8=;
        b=hHKsg41MgNGIOCTIlkU0oQyvyarSuc1dExZDrPNUeE2+P6oNP7/ZxsEQDzz9HaR2lf
         RT8IMPZPZvWVfA4unloIGvFBNgdGqJqpL3s6CP/zvVOWvTej//Wvxuln5qS33LOU7qwE
         6SnNuQL6lYfQer3gnHq1eASCFPAxiBWe9uLulI84en8MJUxX+/DMTYP4F4CWQgdDKvGp
         AujGkMSet3eZnC7oLOoh9Sc/PuaKuCnUMueVoQgKZ1UjShGqk00MYDExke6ZAKTx/ET8
         cQlJllReW9axSKAvwROJM85z2Hy3TDCyU0HsjQPa372H0TOKnZFdZtOMNyUBlDCmiUkN
         XSiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746740508; x=1747345308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EmKk3GLSRxx8+Kwgcnr1XAp5wF86LzLkBPKCEHaK3X8=;
        b=VrHhaURQWHcY8zbdPyC0n/cDXICu5/k254RugeQjJ/1YalYNFgRYDkht35MGL49LRk
         D4zakW8+/SC2YepR1dkyF8+xB8Zhi08m5OqC7C2ey4vP2/cP6Tq4gNSnLV1KVhoYXxwP
         wWt9c9Hq8unMvTgEWpE1NH/OBGJHv1JtnMBuQVhTZl7QbhTxA7ebN3dbjbGxeFAOc7qI
         zm/s/1fwoajhWkj4DixA0O7kXW1xa4ahV1AA9idwj0npOQzBnHuplqEjJOVa/JnB0erc
         UnldnWuAT1Pd8ztFThLucnA6gACeCUP0vFc+nqhPqJao7ybd/CUXiz5hxSIKXxIb/ouM
         sjIw==
X-Forwarded-Encrypted: i=1; AJvYcCVGPcA2+g7gC2aXwQ6nDq8UlK4b2xZ2FRetcHSczsudXnALfcIkW+MQGuyLUnrcTicZ9CjnWwRKsVZzZnc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOYFDGlt0Jqe+MwHHUfaR6I9VH+qjnd2jg6c4K9DNwTKuR9Qa+
	sykZ7/fycp0XClOhGaz2VL06nJCtbftZpTcodvOs7LI/63LA3iOK9T13E9MQhx3tr14+DSSe0KX
	ZCf3B2iQCu9zgqJtPvoEfVodWJdEoEZEjceebr+Fl1JfoNbbAfPqK1GE=
X-Gm-Gg: ASbGncufXj9oxACJeP9Ui5hcgqDLydiUjCmisFjZDJqTWfyxlsNRJ/JmX7N3CcQLw/Z
	4X+ovKwRSbUG/mb/xYs5Uaep6i++Oji1gKAY4dR8G3folGId24pa7pNgz7Gl8FBnWiiMG0wET4e
	qvq2GTMjVNW6khoFANbbikSlSHQFvxDPcDWkM/7QJM55NzHYk3IrI=
X-Google-Smtp-Source: AGHT+IF7q2Ij3uVjNzAszC8Nhjpr+Cen/gqEZNPE458JraRVOTyXNcyTUF7bxg1OzNGFhanICUsBRRdT5rUs0eAFHBY=
X-Received: by 2002:a05:622a:64c:b0:476:f181:efeb with SMTP id
 d75a77b69052e-49452cc1a2dmr1310391cf.16.1746740508068; Thu, 08 May 2025
 14:41:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250507175500.204569-1-00107082@163.com> <CAJuCfpGtdzL5myXCUopJrBogzPOWVGt9cBRAiJS5FVAxgp8zag@mail.gmail.com>
 <531adbba.b537.196b0868a8c.Coremail.00107082@163.com>
In-Reply-To: <531adbba.b537.196b0868a8c.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 8 May 2025 14:41:36 -0700
X-Gm-Features: AX0GCFuCR9elxrj-B0jGMzMMGRNkb45rYCG_9syGViivQkpSvf8Wp1XcQfp2J6Y
Message-ID: <CAJuCfpG4P2hKuUqQ=w-t72tT4dmh_7_VJPY6gw=nYk-C7DkEjA@mail.gmail.com>
Subject: Re: [PATCH] alloc_tag: avoid mem alloc and iter reset when reading allocinfo
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, akpm@linux-foundation.org, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 8, 2025 at 8:32=E2=80=AFAM David Wang <00107082@163.com> wrote:
>
>
>
> At 2025-05-08 07:36:14, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Wed, May 7, 2025 at 5:55=E2=80=AFPM David Wang <00107082@163.com> wro=
te:
> >>
> >> ---
> >> The patch is not complete, just want to get feedbacks whether this
> >> worth carrying on.
> >
> >In such cases it's customary to mark the patch as RFC which saves you
> >time on explaining your motivation :)
> >
> >> ---
> >> When reading /proc/allocinfo, for each read syscall, seq_file would
> >> invoke start/stop callbacks. In start callback, a memory is alloced
> >> to store iterator and the iterator would restart from beginning to
> >> walk to its previous position.
> >> Each seq_file read() takes at most 4096 bytes, even read with a larger
> >> user space buffer, meaning read out /proc/allocinfo, tens of read
> >> syscalls are needed. For example, a 306036 bytes allocinfo files need
> >> 76 reads:
> >>
> >> $ sudo cat /proc/allocinfo  | wc
> >>    3964   16678  306036
> >>
> >> For those n=3D3964 lines, each read takes about m=3D3964/76=3D52 lines=
,
> >> the iter would be rewinding:
> >>  m    steps on 1st read,
> >>  2*m  steps on 2nd read
> >>  3*m  steps on 3rd read
> >> ...
> >>  n  steps on the last read
> >> totally, the iterator would be iterated O(n*n/m) times.
> >> (Each read would take more time than previous one.)
> >>
> >> To use a private data alloced when /proc/allocinfo is opened,
> >> the n/m memory alloction could be avoid, and there is no need
> >> to restart the iterator from very beginning everytime.
> >> So only 1 memory allocation and n steps for iterating are needed.
> >> (Only when module changed, the iterator should be invalidated and
> >> restart.)
> >
> >Yeah, your change makes sense and looks like a good optimization. From
> >a quick look at the code, codetag_next_ct() should handle the case
> >when a module gets removed from under us while we are not holding
> >cttype->mod_lock. I'll need to take another closer look at it once you
> >post an official patch.
> >Thanks!
> >
> The module tag container designed more "compact" than I imaged. It seems =
that no
> extra iterator validation needed for most situations, but I get anxious a=
bout the following
> possibility:
>
> In between read() calls, module A removed and then module B inserted, acc=
identally A
> and B have same IDR id (id reused) and same "struct module" address (kmal=
loc happened
> to pick the cmod address kfree by module A).
> If this happened, the `if (cmod !=3D iter->cmod)` check in codetag_next_c=
t may not be
> solid safe....
>
> What about adding a clock/timestamp/expiration to cttype/module/iterator:

I see there was a followup discussion but I don't think your question
was answered. Instead of expiration I would suggest adding a timestamp
in the struct codetag_module that would store the time module was
loaded (basically the time when struct codetag_module gets created)
and also add a timestamp in the struct codetag_iterator. Whenever
iter->cmod gets assigned a new module during the walk (see
https://elixir.bootlin.com/linux/v6.14.5/source/lib/codetag.c#L95) we
update iterator's timestamp (iter->timestamp =3D cmod->timestamp) and
then we can validate that the module was not replaced from under us by
comparing ter->timestamp and cmod->timestamp. If the module was
replaced from under us, the timestamps will not be equal, so we can
reset the iterator.

>
> diff --git a/include/linux/codetag.h b/include/linux/codetag.h
> index d14dbd26b370..fc9f430090ae 100644
> --- a/include/linux/codetag.h
> +++ b/include/linux/codetag.h
> @@ -54,6 +54,7 @@ struct codetag_iterator {
>         struct codetag_module *cmod;
>         unsigned long mod_id;
>         struct codetag *ct;
> +       unsigned long expiration;
>  };
>
>  #ifdef MODULE
> diff --git a/lib/codetag.c b/lib/codetag.c
> index 42aadd6c1454..a795b152ce92 100644
> --- a/lib/codetag.c
> +++ b/lib/codetag.c
> @@ -13,6 +13,8 @@ struct codetag_type {
>         struct idr mod_idr;
>         struct rw_semaphore mod_lock; /* protects mod_idr */
>         struct codetag_type_desc desc;
> +       /* timestamping iterator expiration */
> +       unsigned long clock;
>  };
>
>  struct codetag_range {
> @@ -23,6 +25,8 @@ struct codetag_range {
>  struct codetag_module {
>         struct module *mod;
>         struct codetag_range range;
> +       /* creation timestamp */
> +       unsigned long timestamp;
>  };
>
>  static DEFINE_MUTEX(codetag_lock);
> @@ -48,6 +52,7 @@ struct codetag_iterator codetag_get_ct_iter(struct code=
tag_type *cttype)
>                 .cmod =3D NULL,
>                 .mod_id =3D 0,
>                 .ct =3D NULL,
> +               .expiration =3D 0,
>         };
>
>         return iter;
> @@ -93,6 +98,11 @@ struct codetag *codetag_next_ct(struct codetag_iterato=
r *iter)
>
>                 if (cmod !=3D iter->cmod) {
>                         iter->cmod =3D cmod;
> +                       iter->expiration =3D cmod->timestamp;
> +                       ct =3D get_first_module_ct(cmod);
> +               } else if (cmod->timestamp !=3D iter->expiration) {
> +                       pr_warn("Same IDR id and module address, but diff=
erent module!");
> +                       iter->expiration =3D cmod->timestamp;
>                         ct =3D get_first_module_ct(cmod);
>                 } else
>                         ct =3D get_next_module_ct(iter);
> @@ -101,6 +111,7 @@ struct codetag *codetag_next_ct(struct codetag_iterat=
or *iter)
>                         break;
>
>                 iter->mod_id++;
> +               iter->cmod =3D NULL;
>         }
>
>         iter->ct =3D ct;
> @@ -169,6 +180,7 @@ static int codetag_module_init(struct codetag_type *c=
ttype, struct module *mod)
>         struct codetag_module *cmod;
>         int err;
>
> +       cttype->clock++;
>         range =3D get_section_range(mod, cttype->desc.section);
>         if (!range.start || !range.stop) {
>                 pr_warn("Failed to load code tags of type %s from the mod=
ule %s\n",
> @@ -188,6 +200,7 @@ static int codetag_module_init(struct codetag_type *c=
ttype, struct module *mod)
>
>         cmod->mod =3D mod;
>         cmod->range =3D range;
> +       cmod->timestamp =3D cttype->clock;
>
>         down_write(&cttype->mod_lock);
>         err =3D idr_alloc(&cttype->mod_idr, cmod, 0, 0, GFP_KERNEL);
>
>
>
>
>
> And  I notice another issue: there are duplicating keys(file:line+module+=
func) in allocinfo even without this patch:
> On my workstation :
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>      1400832      114 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 840764
>            0        0 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 1
>            0        0 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 2
>            0        0 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 758
>            0        0 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 62951
>            0        0 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 1
>            0        0 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 325450
>        12288        1 ././common/inc/nv-linux.h:1117 [nvidia] func:nv_kme=
m_cache_alloc_stack 1
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>        81920       20 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node 20
>      1441792      352 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node 352
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>          112        7 kernel/sched/sched.h:2587 func:alloc_user_cpus_ptr =
1591
>           48        3 kernel/sched/sched.h:2587 func:alloc_user_cpus_ptr =
12
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>           48        1 mm/mm_slot.h:28 func:mm_slot_alloc 4
>         2160       54 mm/mm_slot.h:28 func:mm_slot_alloc 10705
>
> Most duplicating keys are from "*.h" files
> On a KVM, duplication also happens to some "*.c" files:
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc
>            0        0 ./include/crypto/kpp.h:185 func:kpp_request_alloc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options
>            0        0 ./include/net/tcp.h:2548 func:tcp_v4_save_options
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node
>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node
>            0        0 drivers/iommu/amd/../iommu-pages.h:94 func:iommu_al=
loc_pages_node
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
>            0        0 drivers/iommu/intel/../iommu-pages.h:94 func:iommu_=
alloc_pages_node
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:1395 func:load_elf_library
>            0        0 fs/binfmt_elf.c:1395 func:load_elf_library
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:1653 func:fill_files_note
>            0        0 fs/binfmt_elf.c:1653 func:fill_files_note
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:1851 func:fill_note_info
>            0        0 fs/binfmt_elf.c:1851 func:fill_note_info
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:1891 func:fill_note_info
>            0        0 fs/binfmt_elf.c:1891 func:fill_note_info
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:1899 func:fill_note_info
>            0        0 fs/binfmt_elf.c:1899 func:fill_note_info
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:2057 func:elf_core_dump
>            0        0 fs/binfmt_elf.c:2057 func:elf_core_dump
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:2072 func:elf_core_dump
>            0        0 fs/binfmt_elf.c:2072 func:elf_core_dump
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:532 func:load_elf_phdrs
>            0        0 fs/binfmt_elf.c:532 func:load_elf_phdrs
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:885 func:load_elf_binary
>            0        0 fs/binfmt_elf.c:885 func:load_elf_binary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/binfmt_elf.c:910 func:load_elf_binary
>            0        0 fs/binfmt_elf.c:910 func:load_elf_binary
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 fs/fuse/fuse_i.h:1082 [fuse] func:fuse_folios_alloc
>            0        0 fs/fuse/fuse_i.h:1082 [fuse] func:fuse_folios_alloc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 io_uring/io_uring.h:253 func:io_uring_alloc_async_d=
ata
>            0        0 io_uring/io_uring.h:253 func:io_uring_alloc_async_d=
ata
>            0        0 io_uring/io_uring.h:253 func:io_uring_alloc_async_d=
ata
>            0        0 io_uring/io_uring.h:253 func:io_uring_alloc_async_d=
ata
>            0        0 io_uring/io_uring.h:253 func:io_uring_alloc_async_d=
ata
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 kernel/sched/sched.h:2587 func:alloc_user_cpus_ptr
>            0        0 kernel/sched/sched.h:2587 func:alloc_user_cpus_ptr
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 mm/mm_slot.h:28 func:mm_slot_alloc
>          160        4 mm/mm_slot.h:28 func:mm_slot_alloc
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 security/apparmor/domain.c:1136 func:change_hat
>            0        0 security/apparmor/domain.c:1136 func:change_hat
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 security/apparmor/domain.c:1455 func:aa_change_prof=
ile
>            0        0 security/apparmor/domain.c:1455 func:aa_change_prof=
ile
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 security/apparmor/domain.c:835 func:handle_onexec
>            0        0 security/apparmor/domain.c:835 func:handle_onexec
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 security/apparmor/domain.c:909 func:apparmor_bprm_c=
reds_for_exec
>            0        0 security/apparmor/domain.c:909 func:apparmor_bprm_c=
reds_for_exec
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>            0        0 security/apparmor/mount.c:738 func:aa_pivotroot
>            0        0 security/apparmor/mount.c:738 func:aa_pivotroot
>
>
>
> My workstation have my own changes based on 6.15-rc5, but I didn't touch =
any code about tags...
> The KVM runs 6.15-rc5.
>
> The script for checking:
>
> #!/bin/env python
> def fetch():
>     r =3D {}
>     with open("/proc/allocinfo") as f:
>         for l in f:
>             f =3D l.strip().split()[2]
>             if f not in r: r[f]=3D[]
>             r[f].append(l)
>     keys =3D []
>     for f, ls in r.items():
>         if len(ls) > 1: keys.append(f)
>     keys.sort()
>     for f in keys:
>         print "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D"
>         for l in r[f]: print l,
>
> fetch()
>
>
>
>
>
> David
>
>
> >>
