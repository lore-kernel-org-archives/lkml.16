Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E50E13C01;
	Fri, 27 Jun 2025 02:33:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750991610; cv=none; b=ZJlaMzjZjpC7+34c0iFMdR04maOTF+NiShoL0awth/m9FTeXvfdVOo5VfutmRy8n0kxv2yXQVZtKKj0CpnkC2HQtUHZrv4vuaj2htTAfGPxW+qxEaf8lxJf587iAv/rPLTWL0nLRmBUbsLJvjPEQwTpoX1UPpz5pUXF9qEKNFbo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750991610; c=relaxed/simple;
	bh=gHGYNPYhShRWmQvxWAaMeepdnoomSGWX9jaXgQSZmJs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MgPEp80b6ReK4Z8yAURjcWPUea+pQNKx5aTxW5VsIIoc3m8TXfZ4HbE2yoBCj/djiEnA7FaHLmYtPQmQ1gM4J5rH5NMMJhgkl6Z3VhGKB3+2UdoOFFGDAZowfYx/4cVAsb5shHt8pJs/z4QWHxm0N0Zl86pWrCdbBg5xng6nhrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aTQURb/B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aTQURb/B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD0B9C4CEEB;
	Fri, 27 Jun 2025 02:33:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750991609;
	bh=gHGYNPYhShRWmQvxWAaMeepdnoomSGWX9jaXgQSZmJs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aTQURb/BIhrvPTITPp6EYH0nis5OTl6TL7fC58Q4Dq0e+fb4VcVR64w1EE5iA7jG5
	 nHSyhUm8QBSIvVyNbtdm3BoEhoXNqs7Da+E9Gnt9OJzm5YCw4K9zFmYs8nLqzsjats
	 nUJpa01hBVsnG//tBuNvb+Yo3SvLe4SRZKcIx7h8QnBVMDEvqD1sLdVpAFJ8Ub/XEB
	 Fow3756xPDoVqMCOlzLxKIoMl5vqa+05aCYdvYF3aB9Kip//KMgPtEvRd0kQcjIGhV
	 Nz4/e1tQ9tMwO5TTwng+dfDZeGYVab/NgZEXqxlaknAFngA7HYMegFIzpaBIxd1BMh
	 yeCHzf9gpAdlg==
Date: Fri, 27 Jun 2025 02:33:26 +0000
From: Tzung-Bi Shih <tzungbi@kernel.org>
To: Michal Gorlas <michal.gorlas@9elements.com>
Cc: Brian Norris <briannorris@chromium.org>,
	Julius Werner <jwerner@chromium.org>, linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev,
	Marcello Sylvester Bauer <marcello.bauer@9elements.com>
Subject: Re: [PATCH v2 2/3] firmware: coreboot: loader for Linux-owned SMI
 handler
Message-ID: <aF4C9rPD1xWc0MrP@google.com>
References: <20250616-coreboot-payload-mm-v2-0-5d679b682e13@9elements.com>
 <20250616-coreboot-payload-mm-v2-2-5d679b682e13@9elements.com>
 <aFuQHqSd9kT87tsF@google.com>
 <aFvq49ODR3XfcwZJ@cyber-t14sg4>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aFvq49ODR3XfcwZJ@cyber-t14sg4>

On Wed, Jun 25, 2025 at 02:26:11PM +0200, Michal Gorlas wrote:
> On Wed, Jun 25, 2025 at 05:58:54AM +0000, Tzung-Bi Shih wrote:
> > > +obj-$(CONFIG_COREBOOT_PAYLOAD_MM)		+= payload-mm.o
> > > +
> > > +$(obj)/mm_blob.o: $(obj)/mm_handler/handler.bin
> > > +
> > > +$(obj)/mm_handler/handler.bin: FORCE
> > > +	$(Q)$(MAKE) $(build)=$(obj)/mm_handler $@
> > 
> > mm_handler/ isn't visible to this patch. Separate them into the following
> > patch of series?
> > 
> > > diff --git a/drivers/firmware/google/mm_blob.S b/drivers/firmware/google/mm_blob.S
> > > [...]
> > > +SYM_DATA_START(mm_blob)
> > > +	.incbin	"drivers/firmware/google/mm_handler/handler.bin"
> > > +SYM_DATA_END_LABEL(mm_blob, SYM_L_GLOBAL, mm_blob_end)
> > > +
> > > +SYM_DATA_START(mm_relocs)
> > > +	.incbin	"drivers/firmware/google/mm_handler/handler.relocs"
> > > +SYM_DATA_END(mm_relocs)
> > 
> > mm_handler/ isn't visible to this patch. Separate them into the following
> > patch of series?
> > 
> 
> Would it make sense then to merge patch 2/3 and 3/3 into one? mm_loader
> depends on mm_blob, and mm_blob depends on mm_handler/ being visible.
> I wanted to split these initially as the 3rd patch is already terrible
> to read because of all the assembly code in mm_handler/. But if it makes
> sense to have them as one patch, I'll do that.

Yes, please merge them if that makes sense. Otherwise, you could still
separate them via providing a "nop" mm_handler (e.g. just returns success)
in the 2nd patch and implement the handler details in the 3rd patch.

> > > +static int trigger_smi(u64 cmd, u64 arg, u64 retry)
> > > +{
> > > +	u64 status;
> > > [...]
> > > +
> > > +	if (status == cmd || status == PAYLOAD_MM_RET_FAILURE)
> > > +		status = PAYLOAD_MM_RET_FAILURE;
> > > +	else
> > > +		status = PAYLOAD_MM_RET_SUCCESS;
> > 
> > No. Please use -errno in the kernel.
> > 
> 
> In which line here exactly? In the conditional statement I explicitly
> check for RAX (and hence status) being 1. Not sure if status == EPERM
> would make any sense here. I guess you meant specifically 
> status = PAYLOAD_MM_RET_FAILURE? Then what would be appropriate -errno?
> I think it could be -EREMOTEIO or -EIO, since the APMC SMI which
> trigger_smi does is an I/O write. But I am not sure if that's the
> appropriate errno.

Let trigger_smi() return 0 on success; or, -errno. Eliminate the 2 macros
(PAYLOAD_MM_RET_*).

-EIO makes sense.
