Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7734617A310
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 16:17:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747844229; cv=none; b=qpLCSF+yR4ROLBUKiov6wals/2yvAtwq0RadoJ6clRbSx+bZeluC37CWdj8Au/74BTAuIHLtC7PV2IasV0fHZurkYV400954qaSXijzOc5LYjPFLIOlCybihL3kjruSpm7cxVtQ/oPbIO9lUo+ocsozxOzZXcaalbmHyBqS1Wlc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747844229; c=relaxed/simple;
	bh=IOvjsG0sugglptp4PGCfbQ+YKLHnzj68iHSyQ277vXk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nf24MCrefMI86pH6z5AUmJ0Eb15iKmasNNjTtZyqOY8xt/reSAA+5b9nsh1lVNP+e6F/TxMJ/s34GszS9eHcdkUy7sjILb3ll5UZIAIfUsbpEq2ywNgEhKZfu2vZUrlUMx3cWJHTVn1yc7BnE1eATdOW3zocvEcL6XXslzTBjmw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=zU8fPcB9; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="zU8fPcB9"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-47e9fea29easo1782491cf.1
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 09:17:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747844224; x=1748449024; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2su35M/1woi88PA/W3LYgGvlRpYxMTPNv9iFOVqohJU=;
        b=zU8fPcB9JYAEl5q3lEZQTuSaeAGYEPuhzYVtoxdS+442yeHl+WbK9CihtCU2a5Z3MJ
         oNxuR/v2fSdjJvUGz/vaEYjXOnhUOchS3EFegUUmynshkfQ5huNNzB/NHnR6/thhoRQ4
         5Hn7d6oa6RWqR9jHZzcApD/KBj9JDa7KfsLSVRW4GKRsWbxoVLaRG/zTlu5JZtVzZjB2
         dM22L4eDM9QhLTMmNd6OjKwZaZPd071u5w4w3pes3ihIJN/3Smyt3upfi4my7KF2oouT
         mSM8zMg2esmmZu/dm5LlsWkkKzN8EF3WXc59TEyXqdLhao1cXUI8Lhj2JPiMgCr3eSG4
         EoYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747844224; x=1748449024;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=2su35M/1woi88PA/W3LYgGvlRpYxMTPNv9iFOVqohJU=;
        b=SznurucjvAmWZTnMkVSpuWha0fmvZ7vhk7qoMWoUXs5eqAb107SxNGc9Rahy50iJLg
         ijVKgZMJI3xrW0qGGEB/gC6M6zaMDfSd3mZweUZjhwJ4FCl8ntVqWKqZD5KO8w4oz5Em
         sFCZvmG85m8VVnSrsZnF226LihwigoPLVPIVlGgqfdtOXyulIzTe8mO26c+mrXXcTu/y
         7UTzi44206RhqE2Nd7d3TDLYps1N1USc10lW7AX6Dqxd4Odmtc03juAQsPgCEMm9IVeY
         uZR8eSNo26+9z8pBUx+28bZjAMe1bub4Ipu4Aac9gVsQf2yULBkhlNVd6ISLkh2pNorW
         Jurg==
X-Forwarded-Encrypted: i=1; AJvYcCUvQ2qeDj+U8N2ECf8OUOOVqndw9cGzC/+mkJ+qjHjpTeV78TjYcd7/+q3btAkUiqu7v2dZTRnKWZj5fxM=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywc3zFfAfN2b2bgRBMRd/ibzrmKExe+YiRj+cAFbTnhQFsfen+g
	AOdJ1WWwntqQSI7og69QgjXdpDqYVsN9auABtTYh8/6EJ8X37XkdR5f78RYpUpEIPslY6g7qNGR
	VtSFXU2RwDxHrumuBMDVvRdYwCcGT6i2y8h8rOlPu
X-Gm-Gg: ASbGncsoXJpbFogbTlCOv9PQH1sAj801Y18qR81zTXrNyxHOqaxxwM+Ge39Tzyx6s0E
	ZaIWKDLGSo+MfYBbVDVZ/4mk3HTQBAzuvNIj02/XShlWDaak1LSRJVow4Zkcj+OJBKeoJAcY2Vm
	00c4zRgMwZMg4ahwB2RnEMeEZJjqnJqycPwHUtlAfrE51GDJC7N1kaWtW4PN3hswVaL7LYZtz3C
	A==
X-Google-Smtp-Source: AGHT+IEuQqqcPpxUbfAIyCjihAWxW6OtiHWuZOiPIv9/nbxruNyxnYM8BWux4MlQrcGYdr4v2ORrHqQZzS9xhb9/zhE=
X-Received: by 2002:a05:622a:449:b0:494:4aa0:ad5b with SMTP id
 d75a77b69052e-4958cc22bc1mr16836641cf.2.1747844223803; Wed, 21 May 2025
 09:17:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250520231620.15259-1-cachen@purestorage.com>
 <CAJuCfpEz2mbVmGJnp0JHKsip2HVkp+=yHOj3oRtDrKzXXG5Xag@mail.gmail.com>
 <CALCePG1uoNN4vB3HguOi+ZYjwUcTPHmtp4RCZey0r6qCUJMLCg@mail.gmail.com>
 <CAJuCfpF+YYBEZPmf-+k7N05R+T96MM3nzegcGWOPguX=Xu8ANA@mail.gmail.com> <CAJuCfpEmqtcrvuSxTzkt28Yf+x4mfDKfWCH_25H+4uDHXaie6g@mail.gmail.com>
In-Reply-To: <CAJuCfpEmqtcrvuSxTzkt28Yf+x4mfDKfWCH_25H+4uDHXaie6g@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 21 May 2025 09:16:52 -0700
X-Gm-Features: AX0GCFu09bEI8eb2_SwUKuimcpX9e4GHOBrkheslsnz0f2SFy9hm_tjUlV8oiaA
Message-ID: <CAJuCfpEyX-2Uh=nAW3w8VyOMKKTQejbn1hq4BpH2d=rDZ-beSQ@mail.gmail.com>
Subject: Re: comments on patch "alloc_tag: allocate percpu counters for module
 tags dynamically"
To: Casey Chen <cachen@purestorage.com>
Cc: 00107082@163.com, akpm@linux-foundation.org, cl@gentwo.org, 
	dennis@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, tj@kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 6:22=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Wed, May 21, 2025 at 12:45=E2=80=AFAM Suren Baghdasaryan <surenb@googl=
e.com> wrote:
> >
> > On Tue, May 20, 2025 at 11:48=E2=80=AFPM Casey Chen <cachen@purestorage=
.com> wrote:
> > >
> > > On Tue, May 20, 2025 at 4:26=E2=80=AFPM Suren Baghdasaryan <surenb@go=
ogle.com> wrote:
> > > >
> > > > On Tue, May 20, 2025 at 4:16=E2=80=AFPM Casey Chen <cachen@purestor=
age.com> wrote:
> > > > >
> > > > > Hi Suren,
> > > >
> > > > Hi Casey,
> > > >
> > > > >
> > > > > I have two questions on this patch.
> > > > > 1. If load_module() fails to allocate memory for percpu counters,=
 should we call codetag_free_module_sections() to clean up module tags memo=
ry ?
> > > >
> > > > Does this address your question:
> > > > https://lore.kernel.org/all/20250518101212.19930-1-00107082@163.com=
/
> > > >
> > >
> > > module_deallocate() is called in error handling of load_module(). And
> > > codetag_load_module() is at the very end of load_module(). If counter
> > > allocation fails, it doesn't go to the error path to clean up module
> > > tag memory.
> >
> > Ah, right. I didn't have the code in front of me but now I see what
> > you mean. codetag_load_module() does not return a fault if percpu
> > counters fail to allocate.
> >
> > >
> > > My code base is at a5806cd506af ("Linux 6.15-rc7")
> > > 3250 /*
> > > 3251  * Allocate and load the module: note that size of section 0 is =
always
> > > 3252  * zero, and we rely on this for optional sections.
> > > 3253  */
> > > 3254 static int load_module(struct load_info *info, const char __user=
 *uargs,
> > > 3255                        int flags)
> > > 3256 {
> > > ...
> > > 3403
> > > 3404         codetag_load_module(mod);
> > > 3405
> > > 3406         /* Done! */
> > > 3407         trace_module_load(mod);
> > > 3408
> > > 3409         return do_init_module(mod);
> > > ...
> > > 3445  free_module:
> > > 3446         mod_stat_bump_invalid(info, flags);
> > > 3447         /* Free lock-classes; relies on the preceding sync_rcu()=
 */
> > > 3448         for_class_mod_mem_type(type, core_data) {
> > > 3449                 lockdep_free_key_range(mod->mem[type].base,
> > > 3450                                        mod->mem[type].size);
> > > 3451         }
> > > 3452
> > > 3453         module_memory_restore_rox(mod);
> > > 3454         module_deallocate(mod, info);
> > >
> > >
> > > > > 2. How about moving percpu counters allocation to move_module() w=
here codetag_alloc_module_section() is called ? So they can be cleaned up t=
ogether.
> > > >
> > > > That would not work because tag->counters are initialized with NULL
> > > > after move_module() executes, so if we allocate there our allocatio=
ns
> > > > will be overridden. We have to do that at the end of load_module()
> > > > where codetag_load_module() is.
> > >
> > > codetag_alloc_module_section() is called in move_module() to allocate
> > > module tag memory. I mean we can also allocate memory for percpu
> > > counters inside move_module().
> >
> > I thought you were suggesting to allocate percpu counters inside
> > codetag_alloc_module_section(). I guess we could introduce another
> > callback to allocate these counters at the end of the move_module(). I
> > think simpler option is to let codetag_load_module() to fail and
> > handle that failure, OTOH that means that we do more work before
> > failing... Let me think some more on which way is preferable and I'll
> > post a fixup to my earlier patch.
>
> After inspecting the code some more I'm leaning towards a simpler
> solution of letting codetag_load_module() to return failure and
> handling it with codetag_free_module_sections(). This would avoid
> introducing additional hook inside move_module(). I'll wait until
> tomorrow and if no objections received will post a fixup to my
> previous patch.

Posted the fix at
https://lore.kernel.org/all/20250521160602.1940771-1-surenb@google.com/

>
> >
> > > We have implemented such a thing in our code base and it works fine.
> > > Just do it right after copying ELF sections to memory. If it fails it
> > > goes to the error path and calls codetag_free_module_sections() to
> > > clean up.
> > >
> > > 2650                 if (codetag_needs_module_section(mod, sname,
> > > shdr->sh_size)) {
> > > 2651                         dest =3D codetag_alloc_module_section(mo=
d,
> > > sname, shdr->sh_size,
> > > 2652
> > > arch_mod_section_prepend(mod, i), shdr->sh_addralign);
> > >
> > > > Thanks,
> > > > Suren.
> > > >
> > > > >
> > > > > Thanks,
> > > > > Casey
