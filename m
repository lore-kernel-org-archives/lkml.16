Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4301D23C8A2
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 23:59:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747094375; cv=none; b=UEeiubivbp+kGSfqY6TgzpQ18XL3LmPSrMa7e5R9WogtRFb8nf3CZrqLFaboMA0/snPLv7zcVvIV4E+PImRj3YIJKdOdHm9NDlO7Zo1HjpSRueglSMYK8hvbV7xazUxFoJ7M9767BauargtYtVDJzUAotJP+tV0B7B2QcFNfROg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747094375; c=relaxed/simple;
	bh=EFW4kplBfp5PvCKelCjas54b0BRGDoqSeS+17LKB2Lk=;
	h=Date:From:To:Cc:Subject:Message-Id:In-Reply-To:References:
	 Mime-Version:Content-Type; b=bm+6jtdQIZK8CffSwrDWIcow8/GAnsCNFfQmOdNKyXJ0T0Z7sbj8OYxpbv/+v/fswfzWwuY0QzEZMSXy7597iibMpydHenMhV9XVj5QeMmYRilfCpB7UyRNv3ZIDSgQkJFNWYNzHh4u2YJpRFUJ1SpMMptgZgZy4QVeprVS7Bbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=PSPrKBy3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="PSPrKBy3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83BA1C4CEE7;
	Mon, 12 May 2025 23:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
	s=korg; t=1747094373;
	bh=EFW4kplBfp5PvCKelCjas54b0BRGDoqSeS+17LKB2Lk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PSPrKBy3xmNCETWcIRwwkoB0DJMRCdkgYS6KLO8QCc2oJChgW5ML7IuRokpMXlpDB
	 U11BcEaeO9ee6VZpH2t7py4lgyxxFnQIV8TICmD4X/ol9xyHAeJAGFb7crRmhDMp/q
	 u42NLNgIIIctcauWWPVLVMYC1HHghvnbZ75mSDfk=
Date: Mon, 12 May 2025 16:59:33 -0700
From: Andrew Morton <akpm@linux-foundation.org>
To: Alexander Graf <graf@amazon.com>
Cc: <kexec@lists.infradead.org>, <linux-kernel@vger.kernel.org>, Baoquan He
 <bhe@redhat.com>, Pasha Tatashin <pasha.tatashin@soleen.com>,
 <nh-open-source@amazon.com>
Subject: Re: [PATCH] kexec: Enable CMA based contiguous allocation
Message-Id: <20250512165933.ad1dc7ec5872284b4b59f544@linux-foundation.org>
In-Reply-To: <20250512225752.11687-1-graf@amazon.com>
References: <20250512225752.11687-1-graf@amazon.com>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 12 May 2025 22:57:52 +0000 Alexander Graf <graf@amazon.com> wrote:

> When booting a new kernel with kexec_file, the kernel picks a target
> location that the kernel should live at, then allocates random pages,
> checks whether any of those patches magically happens to coincide with
> a target address range and if so, uses them for that range.
> 
> For every page allocated this way, it then creates a page list that the
> relocation code - code that executes while all CPUs are off and we are
> just about to jump into the new kernel - copies to their final memory
> location. We can not put them there before, because chances are pretty
> good that at least some page in the target range is already in use by
> the currently running Linux environment.
> 
> All of this is inefficient.
> 
> Since kexec got introduced, Linux has gained the CMA framework which
> can perform physically contiguous memory mappings, while keeping that
> memory available for movable memory when it is not needed for contiguous
> allocations. The default CMA allocator is for DMA allocations.
> 
> This patch adds logic to the kexec file loader to attempt to place the
> target payload at a location allocated from CMA. If successful, it uses
> that memory range directly instead of creating copy instructions during
> the hot phase. To ensure that there is a safety net in case anything goes
> wrong with the CMA allocation, it also adds a flag for user space to force
> disable CMA allocations.
> 
> Using CMA allocations has two advantages:
> 
>   1) Faster. There is no more need to copy in the hot phase.

How much faster?  Kinda matters as "fast" is the whole point of the patch!

>   2) More robust. Even if by accident some page is still in use for DMA,
>      the new kernel image will be safe from that access because it resides
>      in a memory region that is considered allocated in the old kernel and
>      has a chance to reinitialize that component.

Is this known to be a problem in current code?

Some minor observations:

> --- a/include/linux/kexec.h
> +++ b/include/linux/kexec.h
>
> ...
>
> @@ -331,6 +336,7 @@ struct kimage {
>  	 */
>  	unsigned int hotplug_support:1;
>  #endif
> +	unsigned int no_cma : 1;

"no_cma:1" is more conventional.

>  #ifdef ARCH_HAS_KIMAGE_ARCH
>  	struct kimage_arch arch;
> diff --git a/include/uapi/linux/kexec.h b/include/uapi/linux/kexec.h
> index 5ae1741ea8ea..8958ebfcff94 100644
> --- a/include/uapi/linux/kexec.h
> +++ b/include/uapi/linux/kexec.h
>
> ...
>
> +static int kimage_load_cma_segment(struct kimage *image, struct kexec_segment *segment)
> +{
> +	unsigned long maddr;
> +	size_t ubytes, mbytes;
> +	int result = 0;
> +	unsigned char __user *buf = NULL;
> +	unsigned char *kbuf = NULL;
> +	char *ptr = page_address(segment->cma);
> +
> +	if (image->file_mode)
> +		kbuf = segment->kbuf;
> +	else
> +		buf = segment->buf;
> +	ubytes = segment->bufsz;
> +	mbytes = segment->memsz;
> +	maddr = segment->mem;
> +
> +	/* Initialize the buffer with zeros to allow for smaller input buffers */
> +	memset(ptr, 0, mbytes);

Would it be more efficient to zero the remainder after performing the copy?

> +	/* Then copy from source buffer to the CMA one */
> +	while (mbytes) {
> +		size_t uchunk, mchunk;
> +
> +		ptr += maddr & ~PAGE_MASK;
> +		mchunk = min_t(size_t, mbytes,
> +				PAGE_SIZE - (maddr & ~PAGE_MASK));
> +		uchunk = min(ubytes, mchunk);
> +
> +		if (uchunk) {
> +			/* For file based kexec, source pages are in kernel memory */
> +			if (image->file_mode)
> +				memcpy(ptr, kbuf, uchunk);
> +			else
> +				result = copy_from_user(ptr, buf, uchunk);
> +			ubytes -= uchunk;
> +			if (image->file_mode)
> +				kbuf += uchunk;
> +			else
> +				buf += uchunk;
> +		}
> +
> +		if (result) {
> +			result = -EFAULT;
> +			goto out;
> +		}
> +
> +		ptr    += mchunk;
> +		maddr  += mchunk;
> +		mbytes -= mchunk;
> +
> +		cond_resched();
> +	}
> +out:
> +	return result;
> +}
> +
>
> ...
>
> --- a/kernel/kexec_file.c
> +++ b/kernel/kexec_file.c
>
> ...
>
> @@ -632,6 +635,38 @@ static int kexec_walk_resources(struct kexec_buf *kbuf,
>  		return walk_system_ram_res(0, ULONG_MAX, kbuf, func);
>  }
>  
> +static int kexec_alloc_contig(struct kexec_buf *kbuf)
> +{
> +	u32 pages = (u32)(kbuf->memsz >> PAGE_SHIFT);

I don't think the cast is needed?

> +	unsigned long mem;
> +	struct page *p;
> +
> +	if (kbuf->image->no_cma)
> +		return -EPERM;
> +
> +	p = dma_alloc_from_contiguous(NULL, pages, get_order(kbuf->buf_align), true);

dma_alloc_from_contiguous()'s `count' arg is size_t.  Making `pages'
size_t seems best here.  (And nr_pages would be a better identifier!)


> +	if (!p)
> +		return -EADDRNOTAVAIL;

EADDRNOTAVAIL is a networking thing.  People will be surprised to see
kexec returning networking errors.  Perhaps choose something more
appropriate?

> +	pr_debug("allocated %d DMA pages at 0x%lx", pages, page_to_boot_pfn(p));
> +
> +	mem = page_to_boot_pfn(p) << PAGE_SHIFT;
> +
> +	if (kimage_is_destination_range(kbuf->image, mem, mem + kbuf->memsz)) {
> +		/* Our region is already in use by a statically defined one. Bail out. */
> +		pr_debug("CMA overlaps existing mem: 0x%lx+0x%lx\n", mem, kbuf->memsz);
> +		dma_release_from_contiguous(NULL, p, pages);
> +		return -EADDRNOTAVAIL;
> +	}
> +
> +	kbuf->mem = page_to_boot_pfn(p) << PAGE_SHIFT;
> +	kbuf->cma = p;
> +
> +	arch_kexec_post_alloc_pages(page_address(p), pages, 0);
> +
> +	return 0;
> +}
> +
>
> ...
>
