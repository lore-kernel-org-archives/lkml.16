Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B59A9145A18
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 01:22:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747790537; cv=none; b=kHhiozkzVjVswUcN2xBazGDv4Z2eMlsbGGKOqHCp0HaQ7LJ/CjPh/mWMJInU2GcoqjXYppSzR3h5PjiBrIipUeQOy1c2oloDFsZe6O9ulF5oXD19TlQr1QfJl8ZRm381jYYfmh6NI3WiI+7QdQiasBMheC7hLCCNxiCVJJNQYhs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747790537; c=relaxed/simple;
	bh=tXaXu8mwXmLabMMDyCeHIceFCAayfLmWjzWE0hVrs28=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oc8E28Viq/zjlBvQ8eo+yCFvOzJb12L4OP64Ls0MYk70bv+6bPvBMqMsCKJPOdSHLVbRYer+kwrrLJ/XwB5u1ASOigyMcsPVMTLasQxTAzN0Mx8jwMKFhVOoCEuugHOjSeWgH5YHQhezhdPxgVanWU/dBzuX6a3GMb6sXRkCGn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gjnuxP3t; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gjnuxP3t"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-47e9fea29easo1484181cf.1
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 18:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747790534; x=1748395334; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SHzCa2XQRYctkgISU9ssviPmqc9h+JaAqrCbnkEZAFo=;
        b=gjnuxP3trNX54Sr7njGDbuS94zDgUyCOfYatne++RAt5EzK5qhzmS9jFGq12V1nv5n
         SLTtn2kgEFx007u0dNLVxxf7xVKUZoYJBJfuYmwBOIOkRjqtW4k8a3Vi7rSh1+2Ju1Mq
         x5uEehY34+8egT1V5XIgPlCfbcWIN5w9dbl8Xm71KzksXZlXqrAk8XE7gzOEpMFKv+lI
         FTxrfVDoI199vMmdrNVEeqOmCWWtefNOW5njYDjzZhBqi0KrMIX57aLNsKdJHYtSUXJZ
         ZMS0kiTo8CQiE++YR94lFOnbJ5l23dFxm5wCvfbixsiyOWzwhGB9kJIlMLEatLZr8hlt
         8eZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747790534; x=1748395334;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SHzCa2XQRYctkgISU9ssviPmqc9h+JaAqrCbnkEZAFo=;
        b=q7DjU6wV5NELTYbjMGi0Cc6L7bBIOveVEDWW7rhNRcOLvRQsbuvQg9hf4bHZOJmNAQ
         +2qNlOEr7r/F1sLbM4TrZOaPDk7DR+T9BKjQ3p3rfUewdL9xb4j5tYi0hVdQD9GNR+YI
         eN8ZhnCaxKbt9dUtrOX7v50lzUz4q4fZftJNxPMb5J7O8UrLzqBZ627aJrItkbT+4yls
         YeG1RzwzmwJyzFSmsx1faC95rPOo2xCQGO75lnaEsdmBRZ+9kl2mnn8Cst6Eu/mZu1T8
         9UKJSksRoFlC8pGhhxHaWpFekhxsiIJ7/ey0fsY852X8hi1T5MC3nMzi+hIlv4BXRol8
         D8uA==
X-Forwarded-Encrypted: i=1; AJvYcCVVCN3KJABodzYwZbTwOSqYpjEMyQL94njbW3h143Njr2wLEIc4TUcQOIMarav/E9hyhJfekglrWcArOjs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzx+VkxQga0qyXY0bs/TCxIMcMSDygpdna/IV0d/6OJw4KlA3ya
	x00zPvcuumDF0EjgNT/4Pp+3zY4fEjmsOS4GTojktQEQCmOCC+biIBukOj15QfOYGd8xvSi+A/+
	Z1TpYdb0ndA2EyPqNQE9mM8NsKVHzNN6fq8AQt5tAECOgL2NmkcSI8P8LE3c=
X-Gm-Gg: ASbGncskfMqG3y6vhzEveUsCcqokX4LcdJbj/ivPM/JUhMIwRV9X5jaifdCOAnXh5w5
	rUzRZXoBaGdSnZai2HTUNXMREV2CjQrpNgfHo6oTcIEVm6dojzcXOrlnmEZQauN6xSE5SSu/DPp
	F7V+BdEg9xzkOSF6gRhCZMI8ota495zLu0I+Wst69HsEmrNBZlNcuArn/k5GYjytGhdJfeAFA=
X-Google-Smtp-Source: AGHT+IETk9JsouTomTSfYWPNhg8HW1BBXFdg36hX2MSkaoPaIDDGxmR2D+QNx+kdjYOJPlI/lvzsR89BaSYoRQgZ2X4=
X-Received: by 2002:ac8:7c52:0:b0:47b:840:7f5b with SMTP id
 d75a77b69052e-49601269821mr14330491cf.29.1747790534110; Tue, 20 May 2025
 18:22:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250517000739.5930-1-surenb@google.com> <20250520231620.15259-1-cachen@purestorage.com>
 <CAJuCfpEz2mbVmGJnp0JHKsip2HVkp+=yHOj3oRtDrKzXXG5Xag@mail.gmail.com>
 <CALCePG1uoNN4vB3HguOi+ZYjwUcTPHmtp4RCZey0r6qCUJMLCg@mail.gmail.com> <CAJuCfpF+YYBEZPmf-+k7N05R+T96MM3nzegcGWOPguX=Xu8ANA@mail.gmail.com>
In-Reply-To: <CAJuCfpF+YYBEZPmf-+k7N05R+T96MM3nzegcGWOPguX=Xu8ANA@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 21 May 2025 01:22:03 +0000
X-Gm-Features: AX0GCFvylRrIG4sSJ_j5oVEsG8ZIbb2QwvzTcJFZ13RR_HWNZPB6irPD3XQ7IRs
Message-ID: <CAJuCfpEmqtcrvuSxTzkt28Yf+x4mfDKfWCH_25H+4uDHXaie6g@mail.gmail.com>
Subject: Re: comments on patch "alloc_tag: allocate percpu counters for module
 tags dynamically"
To: Casey Chen <cachen@purestorage.com>
Cc: 00107082@163.com, akpm@linux-foundation.org, cl@gentwo.org, 
	dennis@kernel.org, kent.overstreet@linux.dev, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, pasha.tatashin@soleen.com, tj@kernel.org, 
	yzhong@purestorage.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 21, 2025 at 12:45=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Tue, May 20, 2025 at 11:48=E2=80=AFPM Casey Chen <cachen@purestorage.c=
om> wrote:
> >
> > On Tue, May 20, 2025 at 4:26=E2=80=AFPM Suren Baghdasaryan <surenb@goog=
le.com> wrote:
> > >
> > > On Tue, May 20, 2025 at 4:16=E2=80=AFPM Casey Chen <cachen@purestorag=
e.com> wrote:
> > > >
> > > > Hi Suren,
> > >
> > > Hi Casey,
> > >
> > > >
> > > > I have two questions on this patch.
> > > > 1. If load_module() fails to allocate memory for percpu counters, s=
hould we call codetag_free_module_sections() to clean up module tags memory=
 ?
> > >
> > > Does this address your question:
> > > https://lore.kernel.org/all/20250518101212.19930-1-00107082@163.com/
> > >
> >
> > module_deallocate() is called in error handling of load_module(). And
> > codetag_load_module() is at the very end of load_module(). If counter
> > allocation fails, it doesn't go to the error path to clean up module
> > tag memory.
>
> Ah, right. I didn't have the code in front of me but now I see what
> you mean. codetag_load_module() does not return a fault if percpu
> counters fail to allocate.
>
> >
> > My code base is at a5806cd506af ("Linux 6.15-rc7")
> > 3250 /*
> > 3251  * Allocate and load the module: note that size of section 0 is al=
ways
> > 3252  * zero, and we rely on this for optional sections.
> > 3253  */
> > 3254 static int load_module(struct load_info *info, const char __user *=
uargs,
> > 3255                        int flags)
> > 3256 {
> > ...
> > 3403
> > 3404         codetag_load_module(mod);
> > 3405
> > 3406         /* Done! */
> > 3407         trace_module_load(mod);
> > 3408
> > 3409         return do_init_module(mod);
> > ...
> > 3445  free_module:
> > 3446         mod_stat_bump_invalid(info, flags);
> > 3447         /* Free lock-classes; relies on the preceding sync_rcu() *=
/
> > 3448         for_class_mod_mem_type(type, core_data) {
> > 3449                 lockdep_free_key_range(mod->mem[type].base,
> > 3450                                        mod->mem[type].size);
> > 3451         }
> > 3452
> > 3453         module_memory_restore_rox(mod);
> > 3454         module_deallocate(mod, info);
> >
> >
> > > > 2. How about moving percpu counters allocation to move_module() whe=
re codetag_alloc_module_section() is called ? So they can be cleaned up tog=
ether.
> > >
> > > That would not work because tag->counters are initialized with NULL
> > > after move_module() executes, so if we allocate there our allocations
> > > will be overridden. We have to do that at the end of load_module()
> > > where codetag_load_module() is.
> >
> > codetag_alloc_module_section() is called in move_module() to allocate
> > module tag memory. I mean we can also allocate memory for percpu
> > counters inside move_module().
>
> I thought you were suggesting to allocate percpu counters inside
> codetag_alloc_module_section(). I guess we could introduce another
> callback to allocate these counters at the end of the move_module(). I
> think simpler option is to let codetag_load_module() to fail and
> handle that failure, OTOH that means that we do more work before
> failing... Let me think some more on which way is preferable and I'll
> post a fixup to my earlier patch.

After inspecting the code some more I'm leaning towards a simpler
solution of letting codetag_load_module() to return failure and
handling it with codetag_free_module_sections(). This would avoid
introducing additional hook inside move_module(). I'll wait until
tomorrow and if no objections received will post a fixup to my
previous patch.

>
> > We have implemented such a thing in our code base and it works fine.
> > Just do it right after copying ELF sections to memory. If it fails it
> > goes to the error path and calls codetag_free_module_sections() to
> > clean up.
> >
> > 2650                 if (codetag_needs_module_section(mod, sname,
> > shdr->sh_size)) {
> > 2651                         dest =3D codetag_alloc_module_section(mod,
> > sname, shdr->sh_size,
> > 2652
> > arch_mod_section_prepend(mod, i), shdr->sh_addralign);
> >
> > > Thanks,
> > > Suren.
> > >
> > > >
> > > > Thanks,
> > > > Casey
