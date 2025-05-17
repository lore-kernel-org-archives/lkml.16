Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B7E51F956
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 19:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747508572; cv=none; b=egg0xc97VthtPtlNJSavx3rHXD4Mvxty5ljMqkGNXDwqbRvhUCGOgPBumTWdkaaxXvaBGaUc+4u6wqLmj4bP4QVyDpiio52UWI9hHUs51ohFoygV3Mt7ktBj2b/f8IlafSGuR4q+92tgFYyk1mNzO3r9NBTUoupqhqj242OOL30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747508572; c=relaxed/simple;
	bh=mlALCt8BbFWKFQ30M0BZf3exwtUHxFoIP4EngrJJecs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rQrjHoQAne3LGVB/cciYbqe9yS/GvHIJBdIS2ln8id9IyEechQF/kF+sxd0hohBS4PkjZ4/2SW2C0ifcanMvO2h7w0Cfwgn95RUptPjbyef7AA1OPFtsZktuGQLokoM/q2ZQ+DcVSrrbkPnS53oLqmydEKCCOtc2Hs6UmPqTW/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ptkiQ/te; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ptkiQ/te"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo218501cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 12:02:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747508569; x=1748113369; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yF0K2FdBjnXOHIclO/dFA/TrIig1DjU+JS8Dy78PlzA=;
        b=ptkiQ/tearzWfLVs0O0F85w8+H/9t9ZfV0X2aPssMRzZtuNELv2AM2UrZ6732zByXl
         t77JbldgeRsjtZ44GpXE8yL357bHSGQMQndkNWyZ0ASxooQ5BI4zvZH+aRUF9EfU12Sf
         xSUKP/ZrHx4EaqE3cp1aTSo6jjRpUEi6+dITNg3J6VuX/+4sHkmkGB+9ZZzmcVDg8PcQ
         GfghDzKyWTc1HoNvJmt27t+atuXVJbFAm2k1rZUHekBbhffiRYJoms+xscupYaKixY54
         EVhFsarRCyDrQ7VqYTHEkrLf1HjoWDeNEPPAC3218UKxqpB6dbpVsVIWHYe4l0DQ/geq
         22tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747508569; x=1748113369;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yF0K2FdBjnXOHIclO/dFA/TrIig1DjU+JS8Dy78PlzA=;
        b=NyqS0vVLzwtyV4A27Ev5GGPMlEUF3B8oXbVGFOwMPTMA/fWc5oQikpNSn2N4H53naT
         /Jt2FVeK/QmJOvD/t6ue3HEVn3YUWjU0s4E8+AFFA+Nht5xebA+KEwLB2GguRCDXXzQY
         IUAsKOYeN34ZwWdw1FytEjkDw7P0MPh52znBhjGP0XUMgjb3QAt23VFrPjhkpZ0T8a4Z
         +h0V+/pE3uxZgdjLm2Gj93qj6lfPXWHcAru3rWyqtLD9d86mtEp4Wd6iHVk8/Q8NdTHC
         39RwyMbqRtfzAEEyiWWa+BpdET4gzFllcpQe9zr7Z3ZVEwod5jSVN6NzPggEh+7lIDB+
         lUWw==
X-Forwarded-Encrypted: i=1; AJvYcCWcChjkfX0Ij9Z7CdzOXN7KL0f4M/h4jqx56P+ovw0WsWaxFqsfcTLQtnZLdQigAyzhaNWwirjenLQIxbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxeV7fS7wz2bMna417ye9Xtj651zdyjgKzXjf4ln0ofoF9zEWEx
	n1mUJ1rVmRtJozj7vmo0iIpujDIXzDtOq2Z9GLvuJ8ggTecFiKr49MhFr4hqGzF2ycZqQApogY7
	/UGNzYgufPnY/5RKn6K075wioPVipXnltSwc1CaQH
X-Gm-Gg: ASbGncsvSp2NEG//fLOxTNpUeXWn/Bu+QlCcSDn6ZP/VtRZ1CaiMS8G6qe3hVa4q6N9
	QOHIS62gTWvuo3oUCynKzscQkzlgThqMfFCSnR+8FaFJ0WSxHAnoyg0RkQA08nJUumFHp6RVmr4
	JHYAzr2SHPiu+80U2Y72ER/oGsNkVGfsc=
X-Google-Smtp-Source: AGHT+IFsSho1e2aTh7vSg0v45aJBk8Uf+jg26yARFi6n1yE9KeiCYnhSQ8K8q8+5FBnvY+y/nPl7xMHfuwxFolWB6v8=
X-Received: by 2002:a05:622a:848d:b0:497:75b6:e542 with SMTP id
 d75a77b69052e-49775b6ef5emr712401cf.10.1747508568892; Sat, 17 May 2025
 12:02:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516131246.6244-1-00107082@163.com> <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
 <CAJuCfpEfSr7a911zNiigVVP6Z20gjks7Yyy27UDwL4s=0P4hKw@mail.gmail.com>
 <6646d582.18f8.196dd0d5071.Coremail.00107082@163.com> <CAJuCfpF=FpMvGGzVr5E+9R629SfXB8oWm2NbowHg=mksUQ113A@mail.gmail.com>
 <233aab47.38f2.196df28812a.Coremail.00107082@163.com> <CAJuCfpEPupOzygXhoYBCzTao4YHzW9ZWG+Y4KDUohhfq=hjwQw@mail.gmail.com>
 <5a1f5612.363e.196df64bd1f.Coremail.00107082@163.com>
In-Reply-To: <5a1f5612.363e.196df64bd1f.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 17 May 2025 12:02:37 -0700
X-Gm-Features: AX0GCFvxHzGd4WuCqJiwHzAQGCJzPQbN4swlD7m4Nhp4XSuypmqv0NcDVELeiMk
Message-ID: <CAJuCfpEWsN3pxN2EveACvucx7Aip6u_YjJ5u3NxdmU3A3WYOYw@mail.gmail.com>
Subject: Re: BUG: unable to handle page fault for address
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 10:57=E2=80=AFAM David Wang <00107082@163.com> wrot=
e:
>
>
>
> At 2025-05-18 01:29:35, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Sat, May 17, 2025 at 9:51=E2=80=AFAM David Wang <00107082@163.com> wr=
ote:
> >>
> >>
> >> At 2025-05-18 00:39:30, "Suren Baghdasaryan" <surenb@google.com> wrote=
:
> >> >On Sat, May 17, 2025 at 12:02=E2=80=AFAM David Wang <00107082@163.com=
> wrote:
> >> >>
> >> >>
> >> >> At 2025-05-17 08:11:24, "Suren Baghdasaryan" <surenb@google.com> wr=
ote:
> >> >> >On Fri, May 16, 2025 at 10:03=E2=80=AFAM Suren Baghdasaryan <suren=
b@google.com> wrote:
> >> >> >>
> >> >> >> Hi David,
> >> >> >>
> >> >> >> On Fri, May 16, 2025 at 6:13=E2=80=AFAM David Wang <00107082@163=
.com> wrote:
> >> >> >> >
> >> >> >> > Hi,
> >> >> >> >
> >> >> >> > I caught a page fault when I was changing my nvidia driver:
> >> >> >> > (This happens randomly, I can reproduce it with about 1/3 prob=
ability)
> >> >> >> >
> >> >> >> > [Fri May 16 12:05:41 2025] BUG: unable to handle page fault fo=
r address: ffff9d28984c3000
> >> >> >> > [Fri May 16 12:05:41 2025] #PF: supervisor read access in kern=
el mode
> >> >> >> > [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-prese=
nt page
> >> >> >> > ...
> >> >> >> > [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103=
/0x1b0
> >> >> >> > ...
> >> >> >> > [Fri May 16 12:05:41 2025] Call Trace:
> >> >> >> > [Fri May 16 12:05:41 2025]  <TASK>
> >> >> >> > [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> >> >> >> > [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> >> >> >> > ...
> >> >> >> > (full kernel logs are pasted at the end.)
> >> >> >> >
> >> >> >> > Using a image with DEBUG_INFO, the calltrack parses as:
> >> >> >> >
> >> >> >> > RIP: 0010:release_module_tags (./include/linux/alloc_tag.h:134=
 lib/alloc_tag.c:352 lib/alloc_tag.c:573)
> >> >> >> > [Fri May 16 12:05:41 2025] codetag_unload_module (lib/codetag.=
c:355)
> >> >> >> > [Fri May 16 12:05:41 2025] free_module (kernel/module/main.c:1=
305)
> >> >> >> > [Fri May 16 12:05:41 2025] __do_sys_delete_module (kernel/modu=
le/main.c:795)
> >> >> >> >
> >> >> >> > The offending lines in my codebase:
> >> >> >> >         126 static inline struct alloc_tag_counters alloc_tag_=
read(struct alloc_tag *tag)
> >> >> >> >         127 {
> >> >> >> >         ...
> >> >> >> >         131
> >> >> >> >         132         for_each_possible_cpu(cpu) {
> >> >> >> >         133                 counter =3D per_cpu_ptr(tag->count=
ers, cpu);
> >> >> >> > >>>>    134                 v.bytes +=3D counter->bytes;   <--=
------------here
> >> >> >> >         135                 v.calls +=3D counter->calls;
> >> >> >> >
> >> >> >> >
> >> >> >> > Nvidia drivers are out-tree... there could be some strange beh=
avior in it causes this.. but,
> >> >> >> > when I check the code, I got concerned about lifecycle of tag-=
>counters.
> >> >> >> > Based on following defination:
> >> >> >> >         108 #define DEFINE_ALLOC_TAG(_alloc_tag)              =
                              \
> >> >> >> >         109         static DEFINE_PER_CPU(struct alloc_tag_cou=
nters, _alloc_tag_cntr);      \
> >> >> >> >         110         static struct alloc_tag _alloc_tag __used =
__aligned(8)                  \
> >> >> >> >         111         __section(ALLOC_TAG_SECTION_NAME) =3D {   =
                                \
> >> >> >> >         112                 .ct =3D CODE_TAG_INIT,            =
                                \
> >> >> >> >         113                 .counters =3D &_alloc_tag_cntr };
> >> >> >> >         114
> >> >> >> > _alloc_tag_cntr is the data referenced by tag->counters, but t=
hey are in different section,
> >> >> >> > and alloc_tag only prepare storage for section ALLOC_TAG_SECTI=
ON_NAME.
> >> >> >> > right?
> >> >> >> > Then what happens to those ".data..percpu" section when module=
 is unloaded?
> >> >> >> > Is it safe to keep using those ".data..percpu" section after m=
odule unloaded,
> >> >> >> > or even during module is unloading?
> >> >> >>
> >> >> >> Yes, I think you are right, free_module() calls percpu_modfree()=
 which
> >> >> >> would free the per-cpu memory allocated for the module. Before
> >> >> >> 0db6f8d7820a ("alloc_tag: load module tags into separate contigu=
ous
> >> >> >> memory") we would not unload the module if there were tags which=
 were
> >> >> >> still in use. After that change we load module tags into separat=
e
> >> >> >> memory, so I expected this to work but due to this external refe=
rence
> >> >> >> it indeed should lead to UAF.
> >> >> >> I think the simplest way to fix this would be to bypass
> >> >> >> percpu_modfree() inside free_module() when there are module tags=
 still
> >> >> >> referenced, store mod->percpu inside alloc_tag_module_section an=
d free
> >> >> >> it inside clean_unused_module_areas_locked() once we know the co=
unters
> >> >> >> are not used anymore. I'll take a stab at it and will send a pat=
ch for
> >> >> >> testing today.
> >> >> >
> >> >> >Ok, I went with another implementation, instead dynamically alloca=
ting
> >> >> >percpu memory for modules at the module load time. This has anothe=
r
> >> >> >advantage of not needing extra PERCPU_MODULE_RESERVE currently
> >> >> >required for memory allocation tagging to work.
> >> >> >David, the patch is posted at [1]. Please give it a try and let me
> >> >> >know if the fix works for you.
> >> >> >Thanks,
> >> >> >Suren.
> >> >> >
> >> >> >[1] https://lore.kernel.org/all/20250517000739.5930-1-surenb@googl=
e.com/
> >> >> >
> >> >> >
> >> >> >> Thanks,
> >> >> >> Suren.
> >> >> >>
> >> >>
> >> >> Hi, the patch does fix my issue.
> >> >> I now have another similar concern about modules RO data,
> >> >> The codetag defined as
> >> >>  24 struct codetag {
> >> >>  25         unsigned int flags; /* used in later patches */
> >> >>  26         unsigned int lineno;
> >> >>  27         const char *modname;
> >> >>  28         const char *function;
> >> >>  29         const char *filename;
> >> >>  30 } __aligned(8);
> >> >>
> >> >> Those modname/function/filename would refer to RO data section, rig=
ht?
> >> >> When module unloaded, its RO data section would be released at some=
 point.
> >> >> My question is is it safe to use RO data during module unload? beca=
use these
> >> >> lines seems to access those data:
> >> >>
> >> >> +                       pr_info("%s:%u module %s func:%s has %llu a=
llocated at module unload\n",
> >> >> +                               tag->ct.filename, tag->ct.lineno, t=
ag->ct.modname,
> >> >> +                               tag->ct.function, counter.bytes);
> >> >
> >> >These lines are called from release_module_tags() using this call cha=
in:
> >> >
> >> >delete_module()
> >> >  free_module()
> >> >    codetag_unload_module()
> >> >      release_module_tags()
> >> >
> >> >and codetag_unload_module() is called at the very beginning of
> >> >free_module(), when no other module memory has been freed yet. So,
> >> >from what I understand, this should be safe.
> >> >After we unload the module these pointers inside the tags will be
> >> >dandling but we should not be using them anymore since we do not
> >> >report unloaded modules. Do you see some usage that I missed?
> >>
> >> Why data..percpu. is different. The page fault error caught when I rei=
nstall nvidia drivers is also
> >> raised from release_module_tags().
> >>
> >> Is data..percpu. section released earlier?
> >
> >No but counters are different because the allocations that still
> >reference these tags from unloaded modules will be decrementing them
> >when they are freed. That's where UAF is coming from. So, the counters
> >might be accessed after the module is unloaded, other fields should
> >not.
> >
>
> I do notice there are places where counters are referenced "after" free_m=
odule, but the logs I attached
> happened "during" free_module():
>
>  [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for address:=
 ffff9d28984c3000
>  [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mode
> [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present page
> ...
>  [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> ...
>  [Fri May 16 12:05:41 2025] Call Trace:
>  [Fri May 16 12:05:41 2025]  <TASK>
>  [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
>
> The call chain is the same as you mentioned above.

Is this failure happening before or after my fix? With my fix, percpu
data should not be freed at all if tags are still used. Please
clarify.

> This part confusing me a lot. The log indicates during free_module,  ..da=
ta..percpu access failed,
> I doubted those section would be released that quick.
>
> The only guess left  I feel reasonable is the ..data_percpu was not paged=
 in at all,  probably  because no access to it,
> and when the section is accessed during free_module, somehow the access i=
s refused. Just guessing.....
>
> Or,  do I missing something here?
>
>
> >>
> >> Thanks
> >> David
> >>
> >>
