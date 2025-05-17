Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78F0E23DE
	for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 16:39:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747499986; cv=none; b=Lppu2bC2+2layp4KdDO8BnfZXh8W1d9BgcjxN8nij3Jg0J9HYOYRkN1aNaZMeW2EmjazLblcuKaF+lf49IAoG0n/sdUphnU13O61rx5fZgUNLqt6gx3lvTnfR6hQZRXpuQ4si9HiZ7XL4cMiCnmjPqRo1ujwWSmQwhcukKpoxVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747499986; c=relaxed/simple;
	bh=QbprUbFdK/AaIRbExr9KaG+C++oHVCKZ+EdiE0OFbLk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VoZBcQAmjxKdRYGWoXBBz5DIyIcofW9LkaN9tdi+YMtOJD4VOGNhb1eGQVpBQ9ftbxen5ZfieW1dlrXZmTX/OGuAIhLpT8OAZu9+AcgGF7z4x4zXCXSACKGZwZ1V9eX7nGmDLbo5BAKFQaY2r+yEeAIQTaATrssMZVRqF/HcaZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=PBPtD7lJ; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="PBPtD7lJ"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-47e9fea29easo198331cf.1
        for <linux-kernel@vger.kernel.org>; Sat, 17 May 2025 09:39:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747499982; x=1748104782; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dasDeDjsaUVjmuZVxXtSTdkDMuy83HpLIPGxYugH2/E=;
        b=PBPtD7lJ5TV7EIO6W3UHxGYJ6gahPqLK5ROHqGWGKSQ8s7J4JCvFEDJrs5sz1S9SxY
         0Vt2g99iswJTwMbwR2ZeXDXM0lzQMgTmFovd/aujP9fRLLw7CjSpVXKDH68heDYQD1FA
         f70vKoBwVI3UsA9Q1wCglm+uybd/FM31PpVo+8Xhp7rwXI9T5k+f9dWBqHttgPOxuOLq
         wuC2rGEoPyPcVSeVX9TIK5meQhY6j928UEN26pLlvey6A6+FkF5eO8U9I0AbdpN8wLGv
         cIbT75xuYG8QGkvLv60UrWRUzVuRnT5iZpHgRUat+M8v1qD3QWxQz0bt9GRADClzx6S0
         BCoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747499982; x=1748104782;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dasDeDjsaUVjmuZVxXtSTdkDMuy83HpLIPGxYugH2/E=;
        b=U8rWomrABQDXI8Lco47nurXF0Ba51LQmw8ePhws2W48toguFxjo6sSh+zrUqzWKU6X
         6ij/nbpCIbQYUYQQxDMRiijVKrcPJDg52jNXQv1WD3qDmsDxHqert7zP5HmtOJcQ0d/E
         ilHJQLQRB8ORoIOBt8B07Fvy7vtzfyIoxlVL/3G6R9LC2drvXLiJJrt0PV/KC+JNT+w5
         7Cko9P0jqHelVKmJ7p/z2JB8Oy37SLqLR/KS98fab84awjvovHrPTxcKUjSEf9fnS2Nc
         bdxwqSNVjD5x+xENa6IBpucjjU6eJfJIf8wCBPrKuUci6/79xGCh64AeTClO5APT5h/2
         ynzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjFtPORWBlrnJeDvYyFAaRhxXMsV6j/7QqPrw+XAdMyZ2oyImBDPfg8HVXXSL5RnwVdo1LMG1DwrsUf0Y=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2QNXSTg23wGFTHUN2Xb2kFZMzEYUc+fEsoD6L7g63PWjcO+y+
	+y+LCeTmqxQZOPiCl9EL3KiGgJAbrI8m62MT/69qiOLdqiigaybEkKERD21BgMkAQIe0xtVgfjZ
	+/6vSRSpwSxW6RQlyGtS69XQEfbc8dxBSQPknA5lN
X-Gm-Gg: ASbGncvyFk5cs6o4vj/J5CMPteRrRxE6SV3areTXOJrhU4MVVRkF+12S+hLnG0kZNV0
	+ZrBvm+Q/z0hEGPsGx3PQB98qfNlELRboNsSOHU++qjng6ucK5L04sr18Je03Hw45BQ9u1fxu4k
	+1xwzwuN7o8NtRPpqAoP+1pLpQIEILWqs=
X-Google-Smtp-Source: AGHT+IG+1eNrATaWrtgqK0v3bOzeNsPcasvAyCwX8vsMOp25E2jtwUN9IpVK6k6KBDsWWaY6FDGopY4onsDTmKLd31M=
X-Received: by 2002:ac8:5789:0:b0:476:f181:efeb with SMTP id
 d75a77b69052e-4958d40e3eemr3121931cf.16.1747499981650; Sat, 17 May 2025
 09:39:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250516131246.6244-1-00107082@163.com> <CAJuCfpHZfRhsjmHVMUREOTVafRodMH85hzLdFFunneK=4ir0-w@mail.gmail.com>
 <CAJuCfpEfSr7a911zNiigVVP6Z20gjks7Yyy27UDwL4s=0P4hKw@mail.gmail.com> <6646d582.18f8.196dd0d5071.Coremail.00107082@163.com>
In-Reply-To: <6646d582.18f8.196dd0d5071.Coremail.00107082@163.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Sat, 17 May 2025 09:39:30 -0700
X-Gm-Features: AX0GCFvBQE7AFmzrjX1WxDqe2Iy7VU0naVTCnKqwJLBw0piSGf4NEfPYJu_c8BA
Message-ID: <CAJuCfpF=FpMvGGzVr5E+9R629SfXB8oWm2NbowHg=mksUQ113A@mail.gmail.com>
Subject: Re: BUG: unable to handle page fault for address
To: David Wang <00107082@163.com>
Cc: kent.overstreet@linux.dev, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 17, 2025 at 12:02=E2=80=AFAM David Wang <00107082@163.com> wrot=
e:
>
>
> At 2025-05-17 08:11:24, "Suren Baghdasaryan" <surenb@google.com> wrote:
> >On Fri, May 16, 2025 at 10:03=E2=80=AFAM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> >>
> >> Hi David,
> >>
> >> On Fri, May 16, 2025 at 6:13=E2=80=AFAM David Wang <00107082@163.com> =
wrote:
> >> >
> >> > Hi,
> >> >
> >> > I caught a page fault when I was changing my nvidia driver:
> >> > (This happens randomly, I can reproduce it with about 1/3 probabilit=
y)
> >> >
> >> > [Fri May 16 12:05:41 2025] BUG: unable to handle page fault for addr=
ess: ffff9d28984c3000
> >> > [Fri May 16 12:05:41 2025] #PF: supervisor read access in kernel mod=
e
> >> > [Fri May 16 12:05:41 2025] #PF: error_code(0x0000) - not-present pag=
e
> >> > ...
> >> > [Fri May 16 12:05:41 2025] RIP: 0010:release_module_tags+0x103/0x1b0
> >> > ...
> >> > [Fri May 16 12:05:41 2025] Call Trace:
> >> > [Fri May 16 12:05:41 2025]  <TASK>
> >> > [Fri May 16 12:05:41 2025]  codetag_unload_module+0x135/0x160
> >> > [Fri May 16 12:05:41 2025]  free_module+0x19/0x1a0
> >> > ...
> >> > (full kernel logs are pasted at the end.)
> >> >
> >> > Using a image with DEBUG_INFO, the calltrack parses as:
> >> >
> >> > RIP: 0010:release_module_tags (./include/linux/alloc_tag.h:134 lib/a=
lloc_tag.c:352 lib/alloc_tag.c:573)
> >> > [Fri May 16 12:05:41 2025] codetag_unload_module (lib/codetag.c:355)
> >> > [Fri May 16 12:05:41 2025] free_module (kernel/module/main.c:1305)
> >> > [Fri May 16 12:05:41 2025] __do_sys_delete_module (kernel/module/mai=
n.c:795)
> >> >
> >> > The offending lines in my codebase:
> >> >         126 static inline struct alloc_tag_counters alloc_tag_read(s=
truct alloc_tag *tag)
> >> >         127 {
> >> >         ...
> >> >         131
> >> >         132         for_each_possible_cpu(cpu) {
> >> >         133                 counter =3D per_cpu_ptr(tag->counters, c=
pu);
> >> > >>>>    134                 v.bytes +=3D counter->bytes;   <--------=
------here
> >> >         135                 v.calls +=3D counter->calls;
> >> >
> >> >
> >> > Nvidia drivers are out-tree... there could be some strange behavior =
in it causes this.. but,
> >> > when I check the code, I got concerned about lifecycle of tag->count=
ers.
> >> > Based on following defination:
> >> >         108 #define DEFINE_ALLOC_TAG(_alloc_tag)                    =
                        \
> >> >         109         static DEFINE_PER_CPU(struct alloc_tag_counters,=
 _alloc_tag_cntr);      \
> >> >         110         static struct alloc_tag _alloc_tag __used __alig=
ned(8)                  \
> >> >         111         __section(ALLOC_TAG_SECTION_NAME) =3D {         =
                          \
> >> >         112                 .ct =3D CODE_TAG_INIT,                  =
                          \
> >> >         113                 .counters =3D &_alloc_tag_cntr };
> >> >         114
> >> > _alloc_tag_cntr is the data referenced by tag->counters, but they ar=
e in different section,
> >> > and alloc_tag only prepare storage for section ALLOC_TAG_SECTION_NAM=
E.
> >> > right?
> >> > Then what happens to those ".data..percpu" section when module is un=
loaded?
> >> > Is it safe to keep using those ".data..percpu" section after module =
unloaded,
> >> > or even during module is unloading?
> >>
> >> Yes, I think you are right, free_module() calls percpu_modfree() which
> >> would free the per-cpu memory allocated for the module. Before
> >> 0db6f8d7820a ("alloc_tag: load module tags into separate contiguous
> >> memory") we would not unload the module if there were tags which were
> >> still in use. After that change we load module tags into separate
> >> memory, so I expected this to work but due to this external reference
> >> it indeed should lead to UAF.
> >> I think the simplest way to fix this would be to bypass
> >> percpu_modfree() inside free_module() when there are module tags still
> >> referenced, store mod->percpu inside alloc_tag_module_section and free
> >> it inside clean_unused_module_areas_locked() once we know the counters
> >> are not used anymore. I'll take a stab at it and will send a patch for
> >> testing today.
> >
> >Ok, I went with another implementation, instead dynamically allocating
> >percpu memory for modules at the module load time. This has another
> >advantage of not needing extra PERCPU_MODULE_RESERVE currently
> >required for memory allocation tagging to work.
> >David, the patch is posted at [1]. Please give it a try and let me
> >know if the fix works for you.
> >Thanks,
> >Suren.
> >
> >[1] https://lore.kernel.org/all/20250517000739.5930-1-surenb@google.com/
> >
> >
> >> Thanks,
> >> Suren.
> >>
>
> Hi, the patch does fix my issue.
> I now have another similar concern about modules RO data,
> The codetag defined as
>  24 struct codetag {
>  25         unsigned int flags; /* used in later patches */
>  26         unsigned int lineno;
>  27         const char *modname;
>  28         const char *function;
>  29         const char *filename;
>  30 } __aligned(8);
>
> Those modname/function/filename would refer to RO data section, right?
> When module unloaded, its RO data section would be released at some point=
.
> My question is is it safe to use RO data during module unload? because th=
ese
> lines seems to access those data:
>
> +                       pr_info("%s:%u module %s func:%s has %llu allocat=
ed at module unload\n",
> +                               tag->ct.filename, tag->ct.lineno, tag->ct=
.modname,
> +                               tag->ct.function, counter.bytes);

These lines are called from release_module_tags() using this call chain:

delete_module()
  free_module()
    codetag_unload_module()
      release_module_tags()

and codetag_unload_module() is called at the very beginning of
free_module(), when no other module memory has been freed yet. So,
from what I understand, this should be safe.
After we unload the module these pointers inside the tags will be
dandling but we should not be using them anymore since we do not
report unloaded modules. Do you see some usage that I missed?

>
>
>
> Thanks
> David
>
>
