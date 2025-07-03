Received: from verein.lst.de (verein.lst.de [213.95.11.211])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA7F2AD25
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 08:55:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=213.95.11.211
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751532904; cv=none; b=f2PLkoXEQOEAd8juYGkve6Zck0//UimjWNnymHL16DPCX4PnmI2n3KYEjr5mfAsef8yxVF5hFXc4KWPGeiSQtUM6/iL2XlhMiKZib/KLMEdh0Y+YEgYu2THH/04YLXkvjrL9BlUvtK/I34kY/JBhBBn/VDLebGJVwuvdk61ApoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751532904; c=relaxed/simple;
	bh=kNiEY4as2lXZfhmlXhEMzU8+mHGKGglZTlgAOB/N6go=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sdhuKyqqPOJVMlwkdTmPtzZRdzWugrXXHiQr4fs7BcvDSKTUTgjLdRwtk2azXVJG6JIJfFaEQ8v0YG0/LFGwnzyl8kLBlxknaKck0AdwJr2AiyhR6/BB6KGsExconMdzxrLQ9RucWwdzotBS3QAaDczPikVEpl3prA3KBd5pLrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de; spf=pass smtp.mailfrom=lst.de; arc=none smtp.client-ip=213.95.11.211
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lst.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lst.de
Received: by verein.lst.de (Postfix, from userid 2407)
	id D8EDB68C7B; Thu,  3 Jul 2025 10:54:51 +0200 (CEST)
Date: Thu, 3 Jul 2025 10:54:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Damien Le Moal <dlemoal@kernel.org>
Cc: Richard Weinberger <richard@nod.at>, linux-nvme@lists.infradead.org,
	linux-kernel@vger.kernel.org, kch@nvidia.com, sagi@grimberg.me,
	hch@lst.de, upstream+nvme@sigma-star.at
Subject: Re: [PATCH v2] nvmet: Make blksize_shift configurable
Message-ID: <20250703085451.GA4459@lst.de>
References: <20250630191341.1263000-1-richard@nod.at> <132c1bdf-e100-4e3a-883f-27f9e9b78020@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <132c1bdf-e100-4e3a-883f-27f9e9b78020@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)

On Tue, Jul 01, 2025 at 09:34:00AM +0900, Damien Le Moal wrote:
> Even if internally you use the block size bit shift, I think it would be better
> if the user facing interface is the block size as that is much easier to
> manipulate without having to remember the exponent for powers of 2 values :)

Yeah, block sizes are probably a nice user interface indeed.

> 		pr_err("Configured blksize needs to be at least %u for device %s\n",
> 			bdev_logical_block_size(ns->bdev),
> 			ns->device_path);
> 		return -EINVAL;
> 	}
> 
> Also, if the backend is an HDD, do we want to allow the user to configure a
> block size that is less than the *physical* block size ? Performance will
> suffer on regular HDDs and writes may fail with SMR HDDs.

I don't think we should babysit the user like that, just like we allow
creating file systems with block size smaller than the physical block
size.

> > +			if (!vfs_getattr(&ns->file->f_path, &st, STATX_DIOALIGN, 0) &&
> > +			    (st.result_mask & STATX_DIOALIGN) &&
> > +			    (1 << ns->blksize_shift) < st.dio_offset_align)
> > +				return -EINVAL;
> > +
> > +			if (sb_bdev && (1 << ns->blksize_shift < bdev_logical_block_size(sb_bdev)))
> > +				return -EINVAL;
> 
> I am confused... This is going to check both... But if you got STATX_DIOALIGN
> and it is OK, you do not need (and probably should not) do the second if, no ?
> 
> Also, the second condition of the second if is essentially the same check as
> for the block dev case. So maybe reuse that by creating a small helper function ?

This code is copy and pasted from loop, so it's originally my fault.
It just missed the comment that explains why it is there:

	/*
         * In a perfect world this wouldn't be needed, but as of Linux 6.13 only
         * a handful of file systems support the STATX_DIOALIGN flag.
         */

The situation has unfortunately not improved since 6.13.  Maybe we
just need to do a sweep and fix this up?

