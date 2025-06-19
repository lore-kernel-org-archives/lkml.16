Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0E5F21766A;
	Thu, 19 Jun 2025 12:00:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750334426; cv=none; b=OB3OTIO6QKgR6KkNC223pFqOZfmTDtCr0WhQM4gt7g1+x3ISW+GrIzbMd365Wu5RQtSiF+bOIrwoDhzCEJt+tXaMrTkv/i7ijGsPGWL1oKV6Jrv8MF2Jv8ELpJrrdINdZcnTrLF9QaqdQdb6ze9Wst2kSrxejg5w5WzjEn5kWBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750334426; c=relaxed/simple;
	bh=PFHjT7wNEtWLFt2XnrjSHL8YbQXv79m3A4LyMVacP/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V0MMmtimwS8dKOKmnlcafgap7i7DOR2RySK021qtNuOAfYwsDHyN9JUQmB+VD7XDSITKW8H8/eGRabG+98/wns0VbODoSfY4w4a0E6txLbCCfG7dvM1eemMhSFWc/LzForL78nWIwPRP7XQvVjViIhTlSmq7urrDS7VrJiHSd0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Sp5IMTce; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Sp5IMTce"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E45C4CEEA;
	Thu, 19 Jun 2025 12:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750334425;
	bh=PFHjT7wNEtWLFt2XnrjSHL8YbQXv79m3A4LyMVacP/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Sp5IMTce8h2KFmBQyevsBYG/pppr/7Np2tJ0/NtoIV2RtRI7UqU3rq4mr6cZiWJU9
	 6tyjN4z6RkAylFZ69Br4I6VhGCe91JL6lmuzZWltP0Ine7PmfjbYkSiDDlFA3iPUSE
	 G124NpNazhsGC2WZ7yOix/a68JlIdd9PE1WXnJSBNncuhTmdjyRhvKoVm82wW9m4mV
	 m004cAftIjH0dDd5xqqng5pieE49A7g0B+nd8BS1etNWwtHYZq2ya3tt85dKIaAeP/
	 pfX38OIYKE+RWghmlPD0jVsVkfK44miQ84PASCCv8X5gI80fMkWigkKcM5ZaQisdTI
	 8PsmqVTXU1GOA==
Date: Thu, 19 Jun 2025 15:00:03 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Pasha Tatashin <pasha.tatashin@soleen.com>
Cc: Pratyush Yadav <pratyush@kernel.org>, Jason Gunthorpe <jgg@ziepe.ca>,
	jasonmiu@google.com, graf@amazon.com, changyuanl@google.com,
	dmatlack@google.com, rientjes@google.com, corbet@lwn.net,
	rdunlap@infradead.org, ilpo.jarvinen@linux.intel.com,
	kanie@linux.alibaba.com, ojeda@kernel.org, aliceryhl@google.com,
	masahiroy@kernel.org, akpm@linux-foundation.org, tj@kernel.org,
	yoann.congal@smile.fr, mmaurer@google.com, roman.gushchin@linux.dev,
	chenridong@huawei.com, axboe@kernel.dk, mark.rutland@arm.com,
	jannh@google.com, vincent.guittot@linaro.org, hannes@cmpxchg.org,
	dan.j.williams@intel.com, david@redhat.com,
	joel.granados@kernel.org, rostedt@goodmis.org,
	anna.schumaker@oracle.com, song@kernel.org, zhangguopeng@kylinos.cn,
	linux@weissschuh.net, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	gregkh@linuxfoundation.org, tglx@linutronix.de, mingo@redhat.com,
	bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org,
	hpa@zytor.com, rafael@kernel.org, dakr@kernel.org,
	bartosz.golaszewski@linaro.org, cw00.choi@samsung.com,
	myungjoo.ham@samsung.com, yesanishhere@gmail.com,
	Jonathan.Cameron@huawei.com, quic_zijuhu@quicinc.com,
	aleksander.lobakin@intel.com, ira.weiny@intel.com,
	andriy.shevchenko@linux.intel.com, leon@kernel.org, lukas@wunner.de,
	bhelgaas@google.com, wagi@kernel.org, djeffery@redhat.com,
	stuart.w.hayes@gmail.com
Subject: Re: [RFC v2 05/16] luo: luo_core: integrate with KHO
Message-ID: <aFP7wwCviqxujKDg@kernel.org>
References: <mafs0sekfts2i.fsf@kernel.org>
 <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org>
 <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org>
 <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
 <aFLr7RDKraQk8Gvt@kernel.org>
 <CA+CK2bAnCRu+k=Q78eA4kcAebxA9NgOorhwRqu-WxC913YBsBw@mail.gmail.com>
 <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CA+CK2bB3P1vX658ErkP4_-L6WZSOCcenEwUdX1qS=poDjs=i+A@mail.gmail.com>

On Wed, Jun 18, 2025 at 01:43:18PM -0400, Pasha Tatashin wrote:
> > > > > >> >
> > > > > >> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but then
> > > > > >> > KHO calls into LUO from the notifier, which makes the control flow
> > > > > >> > somewhat convoluted. If LUO is supposed to be the only thing that
> > > > > >> > interacts directly with KHO, maybe we should get rid of the notifier and
> > > > > >> > only let LUO drive things.
> > > > > >>
> > > > > >> Yes, we should. I think we should consider the KHO notifiers and self
> > > > > >> orchestration as obsoleted by LUO. That's why it was in debugfs
> > > > > >> because we were not ready to commit to it.
> > > > > >
> > > > > > We could do that, however, there is one example KHO user
> > > > > > `reserve_mem`, that is also not liveupdate related. So, it should
> > > > > > either be removed or modified to be handled by LUO.
> > > > >
> > > > > It still depends on kho_finalize() being called, so it still needs
> > > > > something to trigger its serialization. It is not automatic. And with
> > > > > your proposed patch to make debugfs interface optional, it can't even be
> > > > > used with the config disabled.
> > > >
> > > > At least for now, it can still be used via LUO going into prepare
> > > > state, since LUO changes KHO into finalized state and reserve_mem is
> > > > registered to be called back from KHO.
> > > >
> > > > > So if it must be explicitly triggered to be preserved, why not let the
> > > > > trigger point be LUO instead of KHO? You can make reservemem a LUO
> > > > > subsystem instead.
> > > >
> > > > Yes, LUO can do that, the only concern I raised is that  `reserve_mem`
> > > > is not really live update related.
> > >
> > > I only now realized what bothered me about "liveupdate". It's the name of
> > > the driving usecase rather then the name of the technology it implements.
> > > In the end what LUO does is a (more) sophisticated control for KHO.
> > >
> > > But essentially it's not that it actually implements live update, it
> > > provides kexec handover control plane that enables live update.
> > >
> > > And since the same machinery can be used regardless of live update, and I'm
> > > sure other usecases will appear as soon as the technology will become more
> > > mature, it makes me think that we probably should just
> > > s/liveupdate_/kho_control/g or something along those lines.
> >
> > I disagree, LUO is for liveupdate flows, and is designed specifically
> > around the live update flows: brownout/blackout/post-liveupdate, it
> > should not be generalized to anticipate some other random states, and
> > it should only support participants that are related to live update:
> > iommufd/vfiofd/kvmfd/memfd/eventfd and controled via "liveupdated" the
> > userspace agent.

But it's not how the things work. Once there's an API anyone can use it,
right?

How do you intend to restrict this API usage to subsystems that are related
to the live update flow? Or userspace driving ioctls outside "liveupdated"
user agent?

There are a lot of examples of kernel subsystems that were designed for a
particular thing and later were extended to support additional use cases.

I'm not saying LUO should "anticipate some other random states", what I'm
saying is that usecases other than liveupdate may appear and use the APIs
LUO provides for something else.

> > KHO is for preserving memory, LUO uses KHO as a backbone for Live Update.

If we make LUO the only uABI to drive KHO it becomes misnamed from the
start.
As you mentioned yourself, reserve_mem and potentially IMA and kexec
telemetry are not necessarily related to LUO, but it still would be useful
to support them without LUO.

While it's easy to make memblock a LUO subsystem to me it seems
semantically wrong naming.

> > > > > Although to be honest, things like reservemem (or IMA perhaps?) don't
> > > > > really fit well with the explicit trigger mechanism. They can be carried
> > > >
> > > > Agreed. Another example I was thinking about is "kexec telemetry":
> > > > precise time information about kexec, including shutdown, purgatory,
> > > > boot. We are planning to propose kexec telemetry, and it could be LUO
> > > > subsystem. On the other hand, it could be useful even without live
> > > > update, just to measure precise kexec reboot time.
> > > >
> > > > > across kexec without needing userspace explicitly driving it. Maybe we
> > > > > allow LUO subsystems to mark themselves as auto-preservable and LUO will
> > > > > preserve them regardless of state being prepared? Something to think
> > > > > about later down the line I suppose.
> > > >
> > > > We can start with adding `reserve_mem` as regular subsystem, and make
> > > > this auto-preserve option a future expansion, when if needed.
> > > > Presumably, `luoctl prepare` would work for whoever plans to use just
> > > > `reserve_mem`.
> > >
> > > I think it would be nice to support auto-preserve sooner than later.
> >
> > Makes sense.
> >
> > > reserve_mem can already be useful for ftrace and pstore folks and if it
> > > would survive a kexec without any userspace intervention it would be great.
> >
> > The pstore use case is only potential, correct? Or can it already use
> > reserve_mem?

pstore can use reserve_mem already.
 
> So currently, KHO provides the following two types of  internal API:
> 
> Preserve memory and metadata
> =========================
> kho_preserve_folio() / kho_preserve_phys()
> kho_unpreserve_folio() / kho_unpreserve_phys()
> kho_restore_folio()
> 
> kho_add_subtree() kho_retrieve_subtree()
> 
> State machine
> ===========
> register_kho_notifier() / unregister_kho_notifier()
> 
> kho_finalize() / kho_abort()
> 
> We should remove the "State machine", and only keep the "Preserve
> Memory" API functions. At the time these functions are called, KHO
> should do the magic of making sure that the memory gets preserved
> across the reboot.
> 
> This way, reserve_mem_init() would call: kho_preserve_folio() and
> kho_add_subtree() during boot, and be done with it.

Right, but we still need something to drive kho_mem_serialize().
And it has to be done before kexec load, at least until we resolve this.

Currently this is triggered either by KHO debugfs or by LUO ioctls. If we
completely drop KHO debugfs and notifiers, we still need something that
would trigger the magic.

I'm not saying we should keep KHO debugfs and notifiers, I'm saying that if
we make LUO the only thing driving KHO, liveupdate is not an appropriate
name.

> Pasha
> 

-- 
Sincerely yours,
Mike.
