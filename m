Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBF8B2AE77
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 17:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747502990; cv=none; b=sywyON4NHm2XEZ4CRSyhdceivMz8OaeFfoKr4cxg9YBQ0uKljDGEH6GQrU15LihXxeHNAjEmCUuwRHqJbBB5TmIXOaUaota999q3PYprjLGuPU75b6i9T6DLGAP7GXBznh3FGI3N09VX8Z+BLFeMAfbGZSfEB8ImKhL1XesHUkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747502990; c=relaxed/simple;
	bh=OCvOVSvWPPuxFQIfQO2FLlVd7VbC1YGSfYHhmB1VoB4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gVvnjlygGR94za8pmxm3cHaibDOt3UA0IkZlWcTryaREwfHvr6UeVwmY5TN00JF4139vGKTITbTjWhTckDFd604rpeZp5EGXkK6dABPnAnp9nii4ycAoyVG8ZlGxzQ0N6e3de6eemczr87GM3KebnCKtBfJON8U2LBDByluZ2wI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=J1qdzIQ6; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="J1qdzIQ6"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-48b7747f881so190171cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 10:29:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747502988; x=1748107788; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDIpbhYmZJI1u8nxmq7YJGWDzmMOT17RA4JmcLEon/s=;
        b=J1qdzIQ6eXsyAtRyW4ZP1Tpi+shFAEfrGGQh845k9Cik/QAVTSBgDFplKWaGStjk4I
         JlLm1cwIjlmAqcmig/HSvsoZrZPXnV8gR3FMa8ye3coRSMU7Z7loJU8xZ3oLcTw6OQd6
         Jzq+/0OSMLda+XW5mMj8Bd1i4UK79S40+dQIr32qnBxeladYTdvWlr2Y6f76qWbKxyio
         uGh0h/Gn8gVIwZ/WUqdxTL9UzkMNQhzkWOiF7gRqbfoywu0iUfZVdUXM1NlpdjY6SO2P
         l213BdyJd2h2ENXnpEoprbXqidd60UmkZ7B3ra6W4tS4qmvVyLCnMEpIiTw3ladNugHV
         xICQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747502988; x=1748107788;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dDIpbhYmZJI1u8nxmq7YJGWDzmMOT17RA4JmcLEon/s=;
        b=hrxmdmZzYudACEuS9kLFNt66jwOhTS3fNVfjSJu+/Vhk0zh/iJ2Bap+OEQtc7haCmK
         KDN0pY/UX+dXBj1GE+Tkl8muLpHaZJPgXwGTWrcgZhLFZBYzLAInhxph+JpSVmgNfG9r
         x1UN3xt5KGxzsd4/0XaD1Jr2UeR9DaF+gsy0d+7MvZYW6ArVHCqRINP7IvVmSsZK+okM
         zR2eS5b877SDbJbY1gWJhw6eonD81/z+c8bJcRuZcd6gSEKlmy0pb6Re+chQzqcQVLKb
         kf6IIGquHgvGqqXfdwGjSzOR2Lll5uVbjVeLcuPIYmbM1Ir0ks9SbMwc+rN8q4/LOSAb
         hlEw==
X-Forwarded-Encrypted: i=1; AJvYcCWtQhERhPSJzZ38FIzTKL3hy4PUV7WqdghGKq1Pj5mu0ekBu4pOTzgBlAmi+17/AJVLCVnxpc1y5MeIYlo=@vger.kernel.org
X-Gm-Message-State: AOJu0YzngUeDAXoyWghV9dDZz03XjVSmETO6/nsbwdIJ8NwrnbI+zJws
	yR7ES6RwqvvaJqYW7f74W6kxUIwaI9s67BYj5XD4M8aZTXVF/tWppT7Z+G9uHl3YyDxhZ/Dkcyj
	ZnYt2Dofs78l1Faofb3sO2Xtn93NAYcZDI1wgWq5c
X-Gm-Gg: ASbGncs+IXMMi1eHbzkaDmhVeBo5QAcnSv93/p+h9QGoACdiSC9xW58HCRjcELWW5Va
	dXArZztP7Dm93Fs8xJMv6CHV5Oefk3lOPH2WB0Z4SHdruQC+p2cfciRDxzb+gc6Bv1rtpRd4eCB
	4wqzKZDdTDOGUCPIwP3g+a4x/qEMWb1+U=
X-Google-Smtp-Source: AGHT+IG/0RMF6sYCcNYhqKbRYqIDdDvRi9d1UQvHkFGwsFMLMczDo+w9g3gg2XBtks6eeHJduO99zrU0okM/JVIYtn8=
X-Received: by 2002:ac8:7e96:0:b0:48a:ba32:370 with SMTP id
 d75a77b69052e-4958cd26fc4mr3069691cf.10.1747502987311; Sat, 17 May 2025
 10:29:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516131246.6244-1-00107082@163.com> <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
 <CAJuCfpEfSr7a911zNiigVVP6Z20gjks7Yyy27UDwL4s=0P4hKw@mail.gmail.com>
 <6646d582.18f8.196dd0d5071.Coremail.00107082@163.com> <CAJuCfpF=FpMvGGzVr5E+9R629SfXB8oWm2NbowHg=mksUQ113A@mail.gmail.com>
 <233aab47.38f2.196df28812a.Coremail.00107082@163.com>
In-Reply-To: <233aab47.38f2.196df28812a.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 17 May 2025 10:29:35 -0700
X-Gm-Features: AX0GCFs_zppa4PHMtyVLmbWxhyxVX8jVA1kD9vwokc2_eQ05u0RzT_4X3sHsht0
Message-ID: <CAJuCfpEPupOzygXhoYBCzTao4YHzW9ZWG+Y4KDUohhfq=hjwQw@mail.gmail.com>
Subject: Re: BUG: unable to handle page fault for address
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 9:51=E2=80=AFAM David Wang <00107082@163.com> wrote=
:
>
>
> At 2025-05-18 00:39:30, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Sat, May 17, 2025 at 12:02=E2=80=AFAM David Wang <00107082@163.com> w=
rote:
> >>
> >>
> >> At 2025-05-17 08:11:24, "Suren Baghdasaryan" <surenb@google.com> wrote=
:
> >> >On Fri, May 16, 2025 at 10:03=E2=80=AFAM Suren Baghdasaryan <surenb@g=
oogle.com> wrote:
> >> >>
> >> >> Hi David,
> >> >>
> >> >> On Fri, May 16, 2025 at 6:13=E2=80=AFAM David Wang <00107082@163.co=
m> wrote:
> >> >> >
> >> >> > Hi,
> >> >> >
> >> >> > I caught a page fault when I was changing my nvidia driver:
> >> >> > (This happens randomly, I can reproduce it with about 1/3 probabi=
lity)
> >> >> >
> >> >> > [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for a=
ddress: ffff9d28984c3000
> >> >> > [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel =
mode
> >> >> > [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present =
page
> >> >> > ...
> >> >> > [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x=
1b0
> >> >> > ...
> >> >> > [Fri May 16 12:05:41 2025] Call Trace:
> >> >> > [Fri May 16 12:05:41 2025]  <TASK>
> >> >> > [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> >> >> > [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> >> >> > ...
> >> >> > (full kernel logs are pasted at the end.)
> >> >> >
> >> >> > Using a image with DEBUG_INFO, the calltrack parses as:
> >> >> >
> >> >> > RIP: 0010:release_module_tags (./include/linux/alloc_tag.h:134 li=
b/alloc_tag.c:352 lib/alloc_tag.c:573)
> >> >> > [Fri May 16 12:05:41 2025] codetag_unload_module (lib/codetag.c:3=
55)
> >> >> > [Fri May 16 12:05:41 2025] free_module (kernel/module/main.c:1305=
)
> >> >> > [Fri May 16 12:05:41 2025] __do_sys_delete_module (kernel/module/=
main.c:795)
> >> >> >
> >> >> > The offending lines in my codebase:
> >> >> >         126 static inline struct alloc_tag_counters alloc_tag_rea=
d(struct alloc_tag *tag)
> >> >> >         127 {
> >> >> >         ...
> >> >> >         131
> >> >> >         132         for_each_possible_cpu(cpu) {
> >> >> >         133                 counter =3D per_cpu_ptr(tag->counters=
, cpu);
> >> >> > >>>>    134                 v.bytes +=3D counter->bytes;   <-----=
---------here
> >> >> >         135                 v.calls +=3D counter->calls;
> >> >> >
> >> >> >
> >> >> > Nvidia drivers are out-tree... there could be some strange behavi=
or in it causes this.. but,
> >> >> > when I check the code, I got concerned about lifecycle of tag->co=
unters.
> >> >> > Based on following defination:
> >> >> >         108 #define DEFINE_ALLOC_TAG(_alloc_tag)                 =
                           \
> >> >> >         109         static DEFINE_PER_CPU(struct alloc_tag_counte=
rs, _alloc_tag_cntr);      \
> >> >> >         110         static struct alloc_tag _alloc_tag __used __a=
ligned(8)                  \
> >> >> >         111         __section(ALLOC_TAG_SECTION_NAME) =3D {      =
                             \
> >> >> >         112                 .ct =3D CODE_TAG_INIT,               =
                             \
> >> >> >         113                 .counters =3D &_alloc_tag_cntr };
> >> >> >         114
> >> >> > _alloc_tag_cntr is the data referenced by tag->counters, but they=
 are in different section,
> >> >> > and alloc_tag only prepare storage for section ALLOC_TAG_SECTION_=
NAME.
> >> >> > right?
> >> >> > Then what happens to those ".data..percpu" section when module is=
 unloaded?
> >> >> > Is it safe to keep using those ".data..percpu" section after modu=
le unloaded,
> >> >> > or even during module is unloading?
> >> >>
> >> >> Yes, I think you are right, free_module() calls percpu_modfree() wh=
ich
> >> >> would free the per-cpu memory allocated for the module. Before
> >> >> 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous
> >> >> memory") we would not unload the module if there were tags which we=
re
> >> >> still in use. After that change we load module tags into separate
> >> >> memory, so I expected this to work but due to this external referen=
ce
> >> >> it indeed should lead to UAF.
> >> >> I think the simplest way to fix this would be to bypass
> >> >> percpu_modfree() inside free_module() when there are module tags st=
ill
> >> >> referenced, store mod->percpu inside alloc_tag_module_section and f=
ree
> >> >> it inside clean_unused_module_areas_locked() once we know the count=
ers
> >> >> are not used anymore. I'll take a stab at it and will send a patch =
for
> >> >> testing today.
> >> >
> >> >Ok, I went with another implementation, instead dynamically allocatin=
g
> >> >percpu memory for modules at the module load time. This has another
> >> >advantage of not needing extra PERCPU_MODULE_RESERVE currently
> >> >required for memory allocation tagging to work.
> >> >David, the patch is posted at [1]. Please give it a try and let me
> >> >know if the fix works for you.
> >> >Thanks,
> >> >Suren.
> >> >
> >> >[1] https://lore.kernel.org/all/20250517000739.5930-1-surenb@google.c=
om/
> >> >
> >> >
> >> >> Thanks,
> >> >> Suren.
> >> >>
> >>
> >> Hi, the patch does fix my issue.
> >> I now have another similar concern about modules RO data,
> >> The codetag defined as
> >>  24 struct codetag {
> >>  25         unsigned int flags; /* used in later patches */
> >>  26         unsigned int lineno;
> >>  27         const char *modname;
> >>  28         const char *function;
> >>  29         const char *filename;
> >>  30 } __aligned(8);
> >>
> >> Those modname/function/filename would refer to RO data section, right?
> >> When module unloaded, its RO data section would be released at some po=
int.
> >> My question is is it safe to use RO data during module unload? because=
 these
> >> lines seems to access those data:
> >>
> >> +                       pr_info("%s:%u module %s func:%s has %llu allo=
cated at module unload\n",
> >> +                               tag->ct.filename, tag->ct.lineno, tag-=
>ct.modname,
> >> +                               tag->ct.function, counter.bytes);
> >
> >These lines are called from release_module_tags() using this call chain:
> >
> >delete_module()
> >  free_module()
> >    codetag_unload_module()
> >      release_module_tags()
> >
> >and codetag_unload_module() is called at the very beginning of
> >free_module(), when no other module memory has been freed yet. So,
> >from what I understand, this should be safe.
> >After we unload the module these pointers inside the tags will be
> >dandling but we should not be using them anymore since we do not
> >report unloaded modules. Do you see some usage that I missed?
>
> Why data..percpu. is different. The page fault error caught when I reinst=
all nvidia drivers is also
> raised from release_module_tags().
>
> Is data..percpu. section released earlier?

No but counters are different because the allocations that still
reference these tags from unloaded modules will be decrementing them
when they are freed. That's where UAF is coming from. So, the counters
might be accessed after the module is unloaded, other fields should
not.

>
> Thanks
> David
>
>
