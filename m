Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BAED2EF9D5;
	Wed, 18 Jun 2025 16:40:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750264836; cv=none; b=PX/XqTtxC1xjk4BkSI3OrZz1xO9Y5Dv+WdKJpGN0DT1S6IKBy+kD2VlZbYcsT5X1KJ+TuwtPB9QVbZQFcgiXcqZnMBs055/fLISBPtMWFWes5vWPpYl6EgTTfdDy/T9De5s8ztEK9eEsVC0nMBUcGEzJevBVr1zd4PkqBOxd3Go=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750264836; c=relaxed/simple;
	bh=ILmsOVDmKMiPJAcPLz+jBgce1BXTVcCPwgeOKpt7xJ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IGKSPQ176FJ9jtOD9NIYSac09BKU9XKUOBjj0EKdGaONyPmoXARbUkGfAdT7t7hYrHm9JhZNJMbeR15eWmsErXxgEaPx8Yv+ACrPrskpxxEu63PxTZ74OObJ9G4pFiHOIRoslFef3O3MxlLxM//IYJfc+IXiJQJWIXvR3ed4v8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rq8Nu3cI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rq8Nu3cI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1150C4CEE7;
	Wed, 18 Jun 2025 16:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750264836;
	bh=ILmsOVDmKMiPJAcPLz+jBgce1BXTVcCPwgeOKpt7xJ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rq8Nu3cINK5WPAZYaJwaoLKMlgFZpWL2kZ39JhCoohmm+bbHIYXDqwkVwQ5pe6uJ+
	 izt2QRNS7/ny2zO2Ls98u4VX65WK5nW4rB6ZMZqk7ITxUBnJfCZzn9CMIukrXzBkGS
	 FQXMMoBKMn3JEyhmXQ5LG+gBmklbPFd/BGHtDQ8PA53hQ1yRV1U73uqlChUK9iGxii
	 shJdi+QeCtQaAoq4rPf4AkKFDKI3Mj4JHyIXyREvh4Ylia7ezNm/3tlpHmhnG8aEXi
	 RkFBtcPngA2z1hPHWyISAXze3gvYnS+6JLeGDYLhogThfCzBu29MUV604Zp57A2h2G
	 3nCdLLkLqumWA==
Date: Wed, 18 Jun 2025 19:40:13 +0300
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
Message-ID: <aFLr7RDKraQk8Gvt@kernel.org>
References: <20250515182322.117840-1-pasha.tatashin@soleen.com>
 <20250515182322.117840-6-pasha.tatashin@soleen.com>
 <mafs0sekfts2i.fsf@kernel.org>
 <CA+CK2bA7eAB4PvF0RXtt2DJ+FQ4DVV3x1OZrVo4q3EvgowhvJg@mail.gmail.com>
 <mafs0sek3n0x8.fsf@kernel.org>
 <20250617152357.GB1376515@ziepe.ca>
 <CA+CK2bAtO7BA5iptRfA_oa=5sUz_t-0F3Lu8oae1STnijXrPPQ@mail.gmail.com>
 <mafs05xgtw5wn.fsf@kernel.org>
 <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+CK2bDWAPSmTdnD7vw4G00nPsM8R_Zefs_G+9zvSqTJqPb9Lg@mail.gmail.com>

On Wed, Jun 18, 2025 at 10:48:09AM -0400, Pasha Tatashin wrote:
> On Wed, Jun 18, 2025 at 9:12 AM Pratyush Yadav <pratyush@kernel.org> wrote:
> >
> > On Tue, Jun 17 2025, Pasha Tatashin wrote:
> >
> > > On Tue, Jun 17, 2025 at 11:24 AM Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > >>
> > >> On Fri, Jun 13, 2025 at 04:58:27PM +0200, Pratyush Yadav wrote:
> > >> > On Sat, Jun 07 2025, Pasha Tatashin wrote:
> > >> > [...]
> > >> > >>
> > >> > >> This weirdness happens because luo_prepare() and luo_cancel() control
> > >> > >> the KHO state machine, but then also get controlled by it via the
> > >> > >> notifier callbacks. So the relationship between then is not clear.
> > >> > >> __luo_prepare() at least needs access to struct kho_serialization, so it
> > >> > >> needs to come from the callback. So I don't have a clear way to clean
> > >> > >> this all up off the top of my head.
> > >> > >
> > >> > > On production machine, without KHO_DEBUGFS, only LUO can control KHO
> > >> > > state, but if debugfs is enabled, KHO can be finalized manually, and
> > >> > > in this case LUO transitions to prepared state. In both cases, the
> > >> > > path is identical. The KHO debugfs path is only for
> > >> > > developers/debugging purposes.
> > >> >
> > >> > What I meant is that even without KHO_DEBUGFS, LUO drives KHO, but then
> > >> > KHO calls into LUO from the notifier, which makes the control flow
> > >> > somewhat convoluted. If LUO is supposed to be the only thing that
> > >> > interacts directly with KHO, maybe we should get rid of the notifier and
> > >> > only let LUO drive things.
> > >>
> > >> Yes, we should. I think we should consider the KHO notifiers and self
> > >> orchestration as obsoleted by LUO. That's why it was in debugfs
> > >> because we were not ready to commit to it.
> > >
> > > We could do that, however, there is one example KHO user
> > > `reserve_mem`, that is also not liveupdate related. So, it should
> > > either be removed or modified to be handled by LUO.
> >
> > It still depends on kho_finalize() being called, so it still needs
> > something to trigger its serialization. It is not automatic. And with
> > your proposed patch to make debugfs interface optional, it can't even be
> > used with the config disabled.
> 
> At least for now, it can still be used via LUO going into prepare
> state, since LUO changes KHO into finalized state and reserve_mem is
> registered to be called back from KHO.
> 
> > So if it must be explicitly triggered to be preserved, why not let the
> > trigger point be LUO instead of KHO? You can make reservemem a LUO
> > subsystem instead.
> 
> Yes, LUO can do that, the only concern I raised is that  `reserve_mem`
> is not really live update related.

I only now realized what bothered me about "liveupdate". It's the name of
the driving usecase rather then the name of the technology it implements.
In the end what LUO does is a (more) sophisticated control for KHO.

But essentially it's not that it actually implements live update, it
provides kexec handover control plane that enables live update.

And since the same machinery can be used regardless of live update, and I'm
sure other usecases will appear as soon as the technology will become more
mature, it makes me think that we probably should just
s/liveupdate_/kho_control/g or something along those lines.
 
> > Although to be honest, things like reservemem (or IMA perhaps?) don't
> > really fit well with the explicit trigger mechanism. They can be carried
> 
> Agreed. Another example I was thinking about is "kexec telemetry":
> precise time information about kexec, including shutdown, purgatory,
> boot. We are planning to propose kexec telemetry, and it could be LUO
> subsystem. On the other hand, it could be useful even without live
> update, just to measure precise kexec reboot time.
> 
> > across kexec without needing userspace explicitly driving it. Maybe we
> > allow LUO subsystems to mark themselves as auto-preservable and LUO will
> > preserve them regardless of state being prepared? Something to think
> > about later down the line I suppose.
> 
> We can start with adding `reserve_mem` as regular subsystem, and make
> this auto-preserve option a future expansion, when if needed.
> Presumably, `luoctl prepare` would work for whoever plans to use just
> `reserve_mem`.

I think it would be nice to support auto-preserve sooner than later. 
reserve_mem can already be useful for ftrace and pstore folks and if it
would survive a kexec without any userspace intervention it would be great.

-- 
Sincerely yours,
Mike.
