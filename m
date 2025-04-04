Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB5BB1A314F;
	Fri,  4 Apr 2025 09:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743760483; cv=none; b=q7WFbxFnSSWxOvW02CjZb8odMCpOWAeVJp7P7gK0AXu0Q7M441euZm/ifrcEZzOQwQNCh52yDgPN8CZALQGbVaBPzLOWUYFcuil6YhIn0kBMGyJHwduIyb1XTK0jfT6G3rWUq+iV0V3s4LkeLYmhkptu393bZ+jkqJNlvNl6Zsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743760483; c=relaxed/simple;
	bh=cSrVbGxlpctlURfhSmALnKBVmteINKipAHsEvzkIzVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f0Rj1o2jOOV562AyNPOz3+Mx3XSUw7A43r3+krZww7fxPwVMN9yd6ar+PRbe45sCCOYMt4PEF8WM/2tpG74ZU1WAeCUmucmd8YNv6IdLMWySBfj6uvAX7XxnWc5IdoclB4MzjOzoOEp1hWELTSAPpCjpjmuBrP0rduhB5EDWhH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NqdZLC8P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NqdZLC8P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D486BC4CEDD;
	Fri,  4 Apr 2025 09:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743760482;
	bh=cSrVbGxlpctlURfhSmALnKBVmteINKipAHsEvzkIzVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NqdZLC8PCMbwQmaPJjUq1AB8uqnD6azcUrHQUG7wlkgsJ5KZyLC3gWR8+5IQ8gdkH
	 BipTaslXkHHOiwz6doB2JCUH5WpxGhWYjF6ywbQfHN0TpQDALMbrZQRGxKRdi/Mna1
	 DrImE5oznfHcWyCtDYGehTiv4FdNZ3AgwLl+Pi4myqIj3yA8VUB8TtFzuY/hsgbk3V
	 s+JisuKs89/jhocAXjeRatMHAtxEaG7IMWtsefPAlDHT4AGYaPA7lD9NRhHx33dXBn
	 EjjpU4eQwu80NTHkXfft43c+DxySzS8KH3+L80qUYkfY8ownLn/BHE1NsKZaXz/ZwV
	 WxjdoB7VzppCw==
Date: Fri, 4 Apr 2025 12:54:25 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Pratyush Yadav <ptyadav@amazon.de>,
	Changyuan Lyu <changyuanl@google.com>, linux-kernel@vger.kernel.org,
	graf@amazon.com, akpm@linux-foundation.org, luto@kernel.org,
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com,
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com,
	dave.hansen@linux.intel.com, dwmw2@infradead.org,
	ebiederm@xmission.com, mingo@redhat.com, jgowans@amazon.com,
	corbet@lwn.net, krzk@kernel.org, mark.rutland@arm.com,
	pbonzini@redhat.com, pasha.tatashin@soleen.com, hpa@zytor.com,
	peterz@infradead.org, robh+dt@kernel.org, robh@kernel.org,
	saravanak@google.com, skinsburskii@linux.microsoft.com,
	rostedt@goodmis.org, tglx@linutronix.de, thomas.lendacky@amd.com,
	usama.arif@bytedance.com, will@kernel.org,
	devicetree@vger.kernel.org, kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, x86@kernel.org
Subject: Re: [PATCH v5 09/16] kexec: enable KHO support for memory
 preservation
Message-ID: <Z--sUYCvP3Q8nT8e@kernel.org>
References: <20250320015551.2157511-1-changyuanl@google.com>
 <20250320015551.2157511-10-changyuanl@google.com>
 <mafs05xjmqsqc.fsf@amazon.de>
 <20250403114209.GE342109@nvidia.com>
 <Z-6UA3C1TPeH_kGL@kernel.org>
 <20250403142438.GF342109@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250403142438.GF342109@nvidia.com>

Hi Jason,

On Thu, Apr 03, 2025 at 11:24:38AM -0300, Jason Gunthorpe wrote:
> On Thu, Apr 03, 2025 at 04:58:27PM +0300, Mike Rapoport wrote:
> > On Thu, Apr 03, 2025 at 08:42:09AM -0300, Jason Gunthorpe wrote:
> > > On Wed, Apr 02, 2025 at 07:16:27PM +0000, Pratyush Yadav wrote:
> > > > > +int kho_preserve_phys(phys_addr_t phys, size_t size)
> > > > > +{
> > > > > +	unsigned long pfn = PHYS_PFN(phys), end_pfn = PHYS_PFN(phys + size);
> > > > > +	unsigned int order = ilog2(end_pfn - pfn);
> > > > 
> > > > This caught my eye when playing around with the code. It does not put
> > > > any limit on the order, so it can exceed NR_PAGE_ORDERS. Also, when
> > > > initializing the page after KHO, we pass the order directly to
> > > > prep_compound_page() without sanity checking it. The next kernel might
> > > > not support all the orders the current one supports. Perhaps something
> > > > to fix?
> > > 
> > > IMHO we should delete the phys functions until we get a user of them
> > 
> > The only user of memory tracker in this series uses kho_preserve_phys()
> 
> But it really shouldn't. The reserved memory is a completely different
> mechanism than buddy allocator preservation. It doesn't even call
> kho_restore_phys() those pages, it just feeds the ranges directly to:
> 
> +       reserved_mem_add(*p_start, size, name);
> 
> The bitmaps should be understood as preserving memory from the buddy
> allocator only.
> 
> IMHO it should not call kho_preserve_phys() at all.

Do you mean that for preserving large physical ranges we need something
entirely different? 

Then we don't need the bitmaps at this point, as we don't have any users
for kho_preserve_folio() and we should not worry ourself with orders and
restoration of high order folios until then ;-)

Now more seriously, I considered the bitmaps and sparse xarrays as good
initial implementation of memory preservation that can do both physical
ranges now and folios later when we'll need them. It might not be the
optimal solution in the long run but we don't have enough data right now to
do any optimizations for real. Preserving huge amounts of order-0 pages
does not seem to me a representative test case at all. 

The xarrays + bitmaps do have the limitation that we cannot store any
information about the folio except its order and if we are anyway need
something else to preserve physical ranges, I suggest starting with
preserving ranges and then adding optimizations for the folio case.

As I've mentioned earlier, maple tree is perfect for tracking ranges, it
simpler than other alternatives, and at allows storing information
about a range and easy and efficient coalescing for adjacent ranges with
matching properties. The maple tree based memory tracker is less memory
efficient than bitmap if we count how many data is required to preserve
gigabytes of distinct order-0 pages, but I don't think this is the right
thing to measure at least until we have some real data about how KHO is
used.

Here's something that implements preservation of ranges (compile tested
only) and adding folios with their orders and maybe other information would
be quite easy.

/*
 * Keep track of memory that is to be preserved across KHO.
 *
 * For simplicity use a maple tree that conveniently stores ranges and
 * allows adding BITS_PER_XA_VALUE of metadata to each range
 */

struct kho_mem_track
{
	struct maple_tree ranges;
};

static struct kho_mem_track kho_mem_track;

typedef unsigned long kho_range_desc_t;

static int __kho_preserve(struct kho_mem_track *tracker, unsigned long addr,
			  size_t size, kho_range_desc_t info)
{
	struct maple_tree *ranges = &tracker->ranges;
	MA_STATE(mas, ranges, addr - 1, addr + size + 1);
	unsigned long lower, upper;

	void *area = NULL;

	lower = addr;
	upper = addr + size - 1;

	might_sleep();

	area = mas_walk(&mas);
	if (area && mas.last == addr - 1)
		lower = mas.index;

	area = mas_next(&mas, ULONG_MAX);
	if (area && mas.index == addr + size)
		upper = mas.last;

	mas_set_range(&mas, lower, upper);

	return mas_store_gfp(&mas, xa_mk_value(info), GFP_KERNEL);
}

/**
 * kho_preserve_phys - preserve a physcally contiguous range accross KHO.
 * @phys: physical address of the range
 * @phys: size of the range
 *
 * Records that the entire range from @phys to @phys + @size is preserved
 * across KHO.
 *
 * Return: 0 on success, error code on failure
 */
int kho_preserve_phys(phys_addr_t phys, size_t size)
{
	return __kho_preserve(&kho_mem_track, phys, size, 0);
}
EXPORT_SYMBOL_GPL(kho_preserve_phys);

#define KHOSER_PTR(type)  union {phys_addr_t phys; type ptr;}
#define KHOSER_STORE_PTR(dest, val)			\
	({						\
		(dest).phys = virt_to_phys(val);	\
		typecheck(typeof((dest).ptr), val);	\
	})
#define KHOSER_LOAD_PTR(src) ((src).phys ? (typeof((src).ptr))(phys_to_virt((src).phys)): NULL)

struct khoser_mem_range {
	phys_addr_t start;
	phys_addr_t size;
	unsigned long data;
};

struct khoser_mem_chunk_hdr {
	KHOSER_PTR(struct khoser_mem_chunk *) next;
	unsigned long num_ranges;
};

#define KHOSER_RANGES_SIZE					\
	((PAGE_SIZE - sizeof(struct khoser_mem_chunk_hdr) /	\
	  sizeof(struct khoser_mem_range)))

struct khoser_mem_chunk {
	struct khoser_mem_chunk_hdr hdr;
	struct khoser_mem_range ranges[KHOSER_RANGES_SIZE];
};

static int new_chunk(struct khoser_mem_chunk **cur_chunk)
{
	struct khoser_mem_chunk *chunk;

	chunk = kzalloc(sizeof(*chunk), GFP_KERNEL);
	if (!chunk)
		return -ENOMEM;
	if (*cur_chunk)
		KHOSER_STORE_PTR((*cur_chunk)->hdr.next, chunk);
	*cur_chunk = chunk;
	return 0;
}

/*
 * Record all the ranges in a linked list of pages for the next kernel to
 * process. Each chunk holds array of ragnes. The maple_tree is used to store
 * them in a tree while building up the data structure, but the KHO successor
 * kernel only needs to process them once in order.
 *
 * All of this memory is normal kmalloc() memory and is not marked for
 * preservation. The successor kernel will remain isolated to the scratch space
 * until it completes processing this list. Once processed all the memory
 * storing these ranges will be marked as free.
 */
static int kho_mem_serialize(phys_addr_t *fdt_value)
{
	struct kho_mem_track *tracker = &kho_mem_track;
	struct maple_tree *ranges = &tracker->ranges;
	struct khoser_mem_chunk *first_chunk = NULL;
	struct khoser_mem_chunk *chunk = NULL;
	MA_STATE(mas, ranges, 0, ULONG_MAX);
	void *entry;
	int err;

	mas_for_each(&mas, entry, ULONG_MAX) {
		size_t size = mas.last - mas.index + 1;
		struct khoser_mem_range *range;

		err = new_chunk(&chunk);
		if (err)
			goto err_free;
		if (!first_chunk)
			first_chunk = chunk;

		if (chunk->hdr.num_ranges == ARRAY_SIZE(chunk->ranges)) {
			err = new_chunk(&chunk);
			if (err)
				goto err_free;
		}

		range = &chunk->ranges[chunk->hdr.num_ranges];
		range->start = mas.index;
		range->size = size;
		range->data = xa_to_value(entry);
		chunk->hdr.num_ranges++;
	}

	*fdt_value = virt_to_phys(first_chunk);

	return 0;

err_free:
	chunk = first_chunk;
	while (chunk) {
		struct khoser_mem_chunk *tmp = chunk;
		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
		kfree(tmp);
	}
	return err;
}

static void __init deserialize_range(struct khoser_mem_range *range)
{
	memblock_reserved_mark_noinit(range->start, range->size);
	memblock_reserve(range->start, range->size);
}

static void __init kho_mem_deserialize(void)
{
	const void *fdt = kho_get_fdt();
	struct khoser_mem_chunk *chunk;
	const phys_addr_t *mem;
	int len, node;

	if (!fdt)
		return;

	node = fdt_path_offset(fdt, "/preserved-memory");
	if (node < 0) {
		pr_err("no preserved-memory node: %d\n", node);
		return;
	}

	mem = fdt_getprop(fdt, node, "metadata", &len);
	if (!mem || len != sizeof(*mem)) {
		pr_err("failed to get preserved memory bitmaps\n");
		return;
	}

	chunk = phys_to_virt(*mem);
	while (chunk) {
		unsigned int i;

		memblock_reserve(virt_to_phys(chunk), sizeof(*chunk));

		for (i = 0; i != chunk->hdr.num_ranges; i++)
			deserialize_range(&chunk->ranges[i]);

		chunk = KHOSER_LOAD_PTR(chunk->hdr.next);
	}
}

-- 
Sincerely yours,
Mike.
