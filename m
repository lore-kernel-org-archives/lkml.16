Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 087952116F5
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 14:23:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750343013; cv=none; b=HL+K4a4YXynVZUBuvViTriQZaMjuug6w0YF40/Kcjd4QBA/p049lvP59KLfTEHbVwbvfPUL5yAmTne8nX8a+DOxqjXuz4hVVxTOEwEXc9MHIclikfUvJj2oxBBq8NLVA93qF1+mpvBrsyHK216GuciKjieezbJkte2iep0Mq0vs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750343013; c=relaxed/simple;
	bh=XxbgwMLn2Vs7XDuh7eac00p4lMC9rCJol7+MYU09tnI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZJINrdkdFShuXMZyGzfsLYkgKtO3tiD/rKlE5jJkoHi8zeSsBbBqiA7G9lpTU+DdtD9evvYPWZdGSK8P5uzeMfL5Qcd84jABD4wb5IVHcAdA8lX3OwvTi96+0B+iqxmWcZa5TgyZA1uXstpz/S9va+JT/V3QpT/x4CRPcbQydlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b=xE7gVa+k; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen-com.20230601.gappssmtp.com header.i=@soleen-com.20230601.gappssmtp.com header.b="xE7gVa+k"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-4a6f3f88613so7263401cf.1
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 07:23:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen-com.20230601.gappssmtp.com; s=20230601; t=1750343010; x=1750947810; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5h1xIOfluYgc0C0Xb3/EzcpMoWOgLa8QXInkgO2QKQY=;
        b=xE7gVa+kH+owuOR2PEVliv0YKw7/h6tdlClPkWGk/VucQzDErFzixxfikDGm4U0ImK
         UUiFzgR7DUXnaKvv6Z3dA9Ln80STJD+96sAFjxR/KC/PNV7lX1TndzmK7G9CERwM0Nym
         ErFQqbbcKlO/HqyY2PQsUIgm7uiwiPW9BnBp0VlxWmnMIlM5bmeJnCNLusppXijeDfVL
         JlL0lMAq7K/tL/n009IWyDlSy6w38uALz3Q1cpan0n1Pz5+TkvQTcj5ygb7YRhP9DD/4
         RdDY4TrGOfO9W68XIup/cEbHA0CITrqq4e1R8vcvwCYIUbAFTCirJz+6V+5njhGgIlcA
         G0PQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750343010; x=1750947810;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5h1xIOfluYgc0C0Xb3/EzcpMoWOgLa8QXInkgO2QKQY=;
        b=jZnvMVKLnboHtEEr0bDIba7HFMgmoiVXSySnCjeVM+vY7DDf5nCknmLG14ZMmyCZXj
         4j0fzwXq1Q5/pY+nBuK4HwWxgm6vqN2BhDbup2qM7k/0p5W2UxhSxrKHlV+3V7tqQUf3
         HzptDvhCjCuteM4+iy4n7rpJdUMp0Z3iT7EGVXXTXd/aSJglsP6/K1Wsmp0sa9DEsSVC
         1kvggUI6mV0fBJvDX3TcC6+Qwry8Rk2Qqc3vbn7AFg1Vx/JhQHzJwnlaRxQQRI41PhoL
         QpZ0OXuMTNaSBJtUwB9tMNCYJvuDeH05V2S5lKJRRE+W+p44rP+bKAjK0bZGsCXZmAaj
         OvPQ==
X-Forwarded-Encrypted: i=1; AJvYcCUg+vXAhxqoyHBMBP6k/k4oQRVRMbpf116XC4Xjn9wt9AYD+AArnoNJH3b5W84ezhjC/NmZWmQiMMhDJ1g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvPV1rMY3RMfTDkonNNAcMm9niLWxNAWauc0b839WWuopf9YTB
	X2UJSAHpsmsT2nF3IpVvp+TSYC18udtxm0gryFNFnf7g6mJxt7xnQWTs2bN4ZMgA7LGk2jkWhXV
	/iWcnmrO9z4UyLhvKevO5kBYFDz+2RV39nCQZyTudIg==
X-Gm-Gg: ASbGncsn57YNVnTcwt3xg+m4oOxNJJ2/07lqNqC0Xh3imCwAiFd3qjDhvV9lUPBM5d2
	UujQvop7zC8/ltQfxB3qG+oZluEKSj9NmejohvZKWUH0xN/GC1FRQniSBsSJVgg9NzfZM+xPwhh
	oYlYo+jNMb+TYlUH6ZUvWMOQ4w66FyuUoHSTbVerZY
X-Google-Smtp-Source: AGHT+IFgDl+SFbvTz0iLbkBSTl7G9nUIsLfEJdsuadZhl2TiLu62uOrOOfIf/Aq7YpsmL3SKzsl9GriFBOi6dVUWWps=
X-Received: by 2002:a05:622a:1a22:b0:4a4:30e7:782 with SMTP id
 d75a77b69052e-4a73c55c3e4mr340017061cf.18.1750343009703; Thu, 19 Jun 2025
 07:23:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <mafs0sekfts2i.fsf@kernel.org> <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org> <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org> <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org> <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com> <aFP7wwCviqxujKDg@kernel.org>
In-Reply-To: <aFP7wwCviqxujKDg@kernel.org>
From: Pasha Tatashin <pasha.tatashin@soleen.com>
Date: Thu, 19 Jun 2025 10:22:52 -0400
X-Gm-Features: AX0GCFtlezNxlPEWS3rX1awTVjMBIkf1jPaBcWwfqMJaBq_78qG-UYL3Q5zgW3Q
Message-ID: <CA+CK2bDqO4SkUpiFahfUx2MUiE8oae9HmuaghPAnCwaJZpoTwQ@mail.gmail.com>
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
To: Mike Rapoport <rppt@kernel.org>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>, jasonmiu@google.com, 
	graf@amazon.com, changyuanl@google.com, dmatlack@google.com, 
	rientjes@google.com, corbet@lwn.net, rdunlap@infradead.org, 
	ilpo.jarvinen@linux.intel.com, kanie@linux.alibaba.com, ojeda@kernel.org, 
	aliceryhl@google.com, masahiroy@kernel.org, akpm@linux-foundation.org, 
	tj@kernel.org, yoann.congal@smile.fr, mmaurer@google.com, 
	roman.gushchin@linux.dev, chenridong@huawei.com, axboe@kernel.dk, 
	mark.rutland@arm.com, jannh@google.com, vincent.guittot@linaro.org, 
	hannes@cmpxchg.org, dan.j.williams@intel.com, david@redhat.com, 
	joel.granados@kernel.org, rostedt@goodmis.org, anna.schumaker@oracle.com, 
	song@kernel.org, zhangguopeng@kylinos.cn, linux@weissschuh.net, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, linux-mm@kvack.org, 
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com, 
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, hpa@zytor.com, 
	rafael@kernel.org, dakr@kernel.org, bartosz.golaszewski@linaro.org, 
	cw00.choi@samsung.com, myungjoo.ham@samsung.com, yesanishhere@gmail.com, 
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com, 
	aleksander.lobakin@intel.com, ira.weiny@intel.com, 
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de, 
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com, 
	stuart.w.hayes@gmail.com
Content-Type: text/plain; charset="UTF-8"

> > > I disagree, LUO is for liveupdate flows, and is designed specifically
> > > around the live update flows: brownout/blackout/post-liveupdate, it
> > > should not be generalized to anticipate some other random states, and
> > > it should only support participants that are related to live update:
> > > iommufd/vfiofd/kvmfd/memfd/eventfd and controled via "liveupdated" the
> > > userspace agent.
>
> But it's not how the things work. Once there's an API anyone can use it,
> right?
>
> How do you intend to restrict this API usage to subsystems that are related
> to the live update flow? Or userspace driving ioctls outside "liveupdated"
> user agent?

Hi Mike,

LUO provides both kernel and user APIs specifically for live update
scenarios.  Live Update is an ability to reboot kernel while keeping
some devices operations and FDs intact. That is the only uAPI that LUO
provides, It enables users to preserve resources via FDs for memfd,
vfiofd, guestmemfd, kvmfd, eventfd, and any other supported FD. It
also provides a well defined state machine for user to add an retrieve
the resources, and for kernel to do proper serialization of these
resources. Since this is the only uAPI that LUO provides, I do not see
how it can be used for other scenarios.

> There are a lot of examples of kernel subsystems that were designed for a
> particular thing and later were extended to support additional use cases.

If that ever becomes necessary, either the core part would need to be
moved out to be a separate thing, or a separate state machine on top
of KHO targeting that use case would need to be developed.

Currently, I don't see an immediate need for this, especially if KHO
itself is updated so the state machine is removed, and therefore
finalization is not required.

> I'm not saying LUO should "anticipate some other random states", what I'm
> saying is that usecases other than liveupdate may appear and use the APIs
> LUO provides for something else.
>
> > > KHO is for preserving memory, LUO uses KHO as a backbone for Live Update.
>
> If we make LUO the only uABI to drive KHO it becomes misnamed from the
> start.
> As you mentioned yourself, reserve_mem and potentially IMA and kexec

Kernel-internal components like pstore/reserve_mem or IMA do not
require a uAPI to drive their KHO interactions. They can, and should,
directly use KHO's kernel-level APIs kho_preserve_folio() and
kho_restore_folio().

KHO itself must offer these preservation primitives, rather than
embedding a state machine that dictates a single "finalize" point for
all users.

> pstore can use reserve_mem already.

That's good to know; I'll investigate how pstore currently utilizes
reserve_mem. My current approach involves reserving the memmap for
pstore via kernel parameters.

> > So currently, KHO provides the following two types of  internal API:
> >
> > Preserve memory and metadata
> > =========================
> > kho_preserve_folio() / kho_preserve_phys()
> > kho_unpreserve_folio() / kho_unpreserve_phys()
> > kho_restore_folio()
> >
> > kho_add_subtree() kho_retrieve_subtree()
> >
> > State machine
> > ===========
> > register_kho_notifier() / unregister_kho_notifier()
> >
> > kho_finalize() / kho_abort()
> >
> > We should remove the "State machine", and only keep the "Preserve
> > Memory" API functions. At the time these functions are called, KHO
> > should do the magic of making sure that the memory gets preserved
> > across the reboot.
> >
> > This way, reserve_mem_init() would call: kho_preserve_folio() and
> > kho_add_subtree() during boot, and be done with it.
>
> Right, but we still need something to drive kho_mem_serialize().

My view is that an explicit, global kho_mem_serialize() call driven
externally (like by LUO or debugfs) is not necessary for KHO
operations.

When kho_preserve_folio() or kho_add_subtree() is called, KHO itself
should perform the immediate actions required to ensure that specific
folio or subtree metadata is staged for preservation across a kexec.
Similarly, kho_unpreserve_folio() or kho_remove_subtree() (which is
currently missing from the KHO API) should immediately update KHO's
state to reflect that the item is no longer preserved.

> And it has to be done before kexec load, at least until we resolve this.

The before kexec load constrained has been fixed. The only
"finalization" constraint we have is it should be before
reboot(LINUX_REBOOT_CMD_KEXEC) and only because memory allocations
during kernel shutdown are undesirable. Once KHO moves away from a
monolithic state machine this constraint disappears. Kernel components
could preserve their resources at appropriate times, not necessarily
tied to a shutdown-time. For live update scenarios, LUO already
orchestrates this timing.

> Currently this is triggered either by KHO debugfs or by LUO ioctls. If we
> completely drop KHO debugfs and notifiers, we still need something that
> would trigger the magic.

An external "magic trigger" for KHO (like the current finalize
notifier or debugfs command) is necessary for scenarios like live
update, where userspace resources are being preserved in a coordinated
fashion just before kexec.

For kernel-internal resources that are unrelated to such a
userspace-driven live update flow, the respective kernel components
should directly use KHO's primitive preservation APIs
(kho_preserve_folio, etc.) when they need to mark their resources for
handover. No separate, state machine or external trigger should be
required for these individual, self-contained preservation acts.

> I'm not saying we should keep KHO debugfs and notifiers, I'm saying that if
> we make LUO the only thing driving KHO, liveupdate is not an appropriate
> name.

LUO drives KHO specifically for the purpose of live updates. If a
different userspace use-case emerges that needs another distinct
purpose (e.g., not to preserve a FD a or a device across kernel reboot
(i.e. something for which LUO does not provide uAPI)), then that would
probably need a separate from LUO uAPI instead of extending the LUO
uAPI.

Pasha
