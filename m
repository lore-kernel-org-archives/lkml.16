Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D39D71ADFFB
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 04:42:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743050550; cv=none; b=g5E3yxyfsS8zqLOjXVwHIhudkJUvo9ZNPIAClGPV+F6cBmpFZmfxD4nNJrz5JIL0VZNEclpjuvXu/4AxDkw208obyPGmpTXtSbdQirWW1lplp6/BkOtC5GUBhUo+Ou33Uhz9jP/CW+cN/w6ToDqEE+3gRmlrBz50cuV5x7kUkrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743050550; c=relaxed/simple;
	bh=lD7t702drppK+oyfF4t2Ie7zix9agwefHISplF9mkAE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=n4oU7kJ7AA+8AdaQvf0n/2ThvGDpylsxs32skpWwtVB5LHMYdvO8v2m7kf5d0AnzgwJwoLgwMdBEnc27AL1osfZpJI57l/yG5ryRulynCcTGqco673lc+NJXaj7YVxHxNpeZ742WQPIH/JA+gHS5gRN5EvUQCYLuTqs/OybBwpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gVV/UJsg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gVV/UJsg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 909EEC4CEDD;
	Thu, 27 Mar 2025 04:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743050550;
	bh=lD7t702drppK+oyfF4t2Ie7zix9agwefHISplF9mkAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gVV/UJsgWO8nqEN/4R5BMGHVsSXDvQPWk+PFatioI0K6OuFA1tuk3UwsW4cr8EHDd
	 0va28pW2TcIINigRPtkMw3euDSu5UGJCIREDPhp5ZZKIletQtsg/E+hCz4CwuRYAJM
	 URsI7JtvJZF0HjV02C3LOXATTOt2x7JamfPI/3Mt9ozDGgswdbURBU3etpy+mSs7Am
	 A6B4x7/sW4ZmEGkKhFGCNs94FgF20R1VHB5Wm3M1hy8Uys1j9TMCn/Yy0avr36DR7V
	 kIZegjDDKREtiDVDKmM66KW+zcEGTwuaSSBCn1P27dCuvwHT4+umNzejzo/dRtxSwV
	 I0Abfs6cRmqFA==
Date: Thu, 27 Mar 2025 10:12:24 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Jens Wiklander <jens.wiklander@linaro.org>,
	Matthew Wilcox <willy@infradead.org>
Cc: Marco Felsch <m.felsch@pengutronix.de>, vbabka@suse.cz,
	akpm@linux-foundation.org, kernel@pengutronix.de,
	op-tee@lists.trustedfirmware.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] tee: shm: fix slab page refcounting
Message-ID: <Z-TXMIXzaro0w60M@sumit-X1>
References: <20250325200740.3645331-1-m.felsch@pengutronix.de>
 <Z-Pc6C1YUqLyej3Z@casper.infradead.org>
 <20250326110718.qzbwpmaf6xlcb4xf@pengutronix.de>
 <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAHUa44FUK_73oKSaqGdiPqB3geZbTNDFsC1Mh=KN3YPWr9=7gQ@mail.gmail.com>

On Wed, Mar 26, 2025 at 02:47:46PM +0100, Jens Wiklander wrote:
> On Wed, Mar 26, 2025 at 12:07 PM Marco Felsch <m.felsch@pengutronix.de> wrote:
> >
> > On 25-03-26, Matthew Wilcox wrote:
> > > On Tue, Mar 25, 2025 at 09:07:39PM +0100, Marco Felsch wrote:
> > > > Skip manipulating the refcount in case of slab pages according commit
> > > > b9c0e49abfca ("mm: decline to manipulate the refcount on a slab page").
> > >
> > > This almost certainly isn't right.  I know nothing about TEE, but that
> > > you are doing this indicates a problem.  The hack that we put into
> > > networking should not be blindly replicated.
> > >
> > > Why are you taking a reference on the pages to begin with?  Is it copy
> > > and pasted from somewhere else, or was there actual thought put into it?
> >
> > Not sure, this belongs to the TEE maintainers.
> 
> I don't know. We were getting the user pages first, so I assume we
> just did the same thing when we added support for kernel pages.
> 
> >
> > > If it's "prevent the caller from freeing the allocation", well, it never
> > > accomplished that with slab allocations.  So for callers that do kmalloc
> > > (eg setup_mm_hdr()  in drivers/firmware/efi/stmm/tee_stmm_efi.c), you
> > > have to rely on them not freeing the allocation while the TEE driver
> > > has it.

It's not just about the TEE driver but rather if the TEE implementation
(a trusted OS) to whom the page is registered with. We don't want the
trusted OS to work on registered kernel pages if they gets free somehow
in the TEE client driver. Having a reference in the TEE subsystem
assured us that won't happen. But if you say slab allocations are still
prone the kernel pages getting freed even after refcount then can you
suggest how should we handle this better?

As otherwise it can cause very hard to debug problems if trusted OS can
manipulate kernel pages that are no longer available.

> > >
> > > And if that's your API contract, then there's no point in taking
> > > refcounts on other kinds of pages either; it's just unnecessary atomic
> > > instructions.  So the right patch might be something like this:
> > >
> > > +++ b/drivers/tee/tee_shm.c
> > > @@ -15,29 +15,11 @@
> > >  #include <linux/highmem.h>
> > >  #include "tee_private.h"
> >
> > I had the same diff but didn't went this way since we can't be sure that
> > iov's are always slab backed. As far as I understood IOVs. In
> > 'worst-case' scenario an iov can be backed by different page types too.
> 
> We're only using kvec's. Briefly, before commit 7bdee4157591 ("tee:
> Use iov_iter to better support shared buffer registration") we checked
> with is_vmalloc_addr() || is_kmap_addr(). I like Matthew's suggestion,
> it's nice to fix problems by deleting code. :-)
> 
> Sumit, you know the callers better. What do you think?

If we don't have a sane way to refcont registered kernel pages in TEE
subsystem then yeah we have to solely rely on the client drivers to
behave properly. Nevertheless, it's still within the kernel boundaries
which we can rely upon.

-Sumit
