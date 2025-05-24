Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 788FA2DCBF7
	for <linux-kernel@vger.kernel.org>; Sat, 24 May 2025 16:46:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748105180; cv=none; b=TUlqOekdOubwXi1gAulC8BSH9uZ6k2dg9tq6XylPgsrimvPLylr7Mcd1v+ks3HyJw3EfhVU2InrV/gUJSkjM6SekaseMaqZRvoulMVb+5C0ke84zvvYuBY0msoEVgkXIgbRfonmMC74FOT5LZq6Z4O5lTlv32wJTUlNxu9T8dtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748105180; c=relaxed/simple;
	bh=/qY5+SZZFdwJqs+5Oz/KbJISXq2hxFDxQn515IfGLE8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NicBEhzqG+mzamvJhlGXe/f+lGXCULRKcjr2Jj7nGdo8cKDn3u8B4/WMRIVgVYCmIbqxolmSFmgUwldXZzcV/Y/ipYkYf8RDx3Re191a7NxSzY6SHkKqFVa9mkCTAuBecvK29WXvEDy7Snq8Zio2hT0xOKpt/dQmHjrUXcts9MU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=QDs5TGY0; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="QDs5TGY0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1748105174;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=3xk+u68q/fMfbYRBioKGMBnP9jaUFgyFWrUy2HKUZLI=;
	b=QDs5TGY0//cvUbOQ4cCleoMBDnIhrWw8KMWcMEVllvlidaw/pcB9s7WU8svjr3ALpIKgjH
	n6sM16XGM/tnRgb0G4iAjrfSv6OMlJb5ve0vO2iI7weshywTvLO25grWeTugyMgE8GAI2X
	u7Wnyq2PrmZYkrYPXDFQ1Qw0A7ZZHGo=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-634-kKAyHEHNNcqXeSVrGYy8zw-1; Sat,
 24 May 2025 12:46:08 -0400
X-MC-Unique: kKAyHEHNNcqXeSVrGYy8zw-1
X-Mimecast-MFC-AGG-ID: kKAyHEHNNcqXeSVrGYy8zw_1748105166
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 93C5218003FC;
	Sat, 24 May 2025 16:46:05 +0000 (UTC)
Received: from dhcp-27-174.brq.redhat.com (unknown [10.44.32.4])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id D7E061944DFF;
	Sat, 24 May 2025 16:45:59 +0000 (UTC)
Received: by dhcp-27-174.brq.redhat.com (nbSMTP-1.00) for uid 1000
	oleg@redhat.com; Sat, 24 May 2025 18:45:24 +0200 (CEST)
Date: Sat, 24 May 2025 18:45:17 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Pu Lehui <pulehui@huaweicloud.com>,
	David Hildenbrand <david@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: mhiramat@kernel.org, peterz@infradead.org, akpm@linux-foundation.org,
	Liam.Howlett@oracle.com, lorenzo.stoakes@oracle.com, vbabka@suse.cz,
	jannh@google.com, pfalcato@suse.de, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, pulehui@huawei.com,
	Andrii Nakryiko <andrii@kernel.org>, Jiri Olsa <jolsa@kernel.org>
Subject: Re: [RFC PATCH] mm/mmap: Fix uprobe anon page be overwritten when
 expanding vma during mremap
Message-ID: <20250524164516.GA11642@redhat.com>
References: <20250521092503.3116340-1-pulehui@huaweicloud.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250521092503.3116340-1-pulehui@huaweicloud.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12

I am very glad that mm experts are already looking into this problem ;)
I can't help, today I don't understand mm/vma.c even remotely. But let
me ask a couple of stupid questions.

> However, the
> upcomming move_page_tables step, which use set_pte_at to remap the vma2
> uprobe anon page to the merged vma, will over map the old uprobe anon
> page in the merged vma, and lead the old uprobe anon page to be orphan.

To be honest, I can't even understand this part due to my ignorance.
What does "the old uprobe anon page to be orphan" actually mean?
How can the unnecessary uprobe_mmap() lead to an "unbalanced"
inc_mm_counter(MM_ANONPAGES) ? Or what else can explain the
"BUG: Bad rss-counter state" from check_mm() ? Or there are more problems?

I will appreciate it if someone provides a more detailed explanation
for dummies ;)

--------------------------------------------------------------------------
But lets forget it for the moment. I fail to understand the usage of
uprobe_mmap() in vma_complete(). In particular, this one:

   334          if (vp->file) {
   335                  i_mmap_unlock_write(vp->mapping);
   336                  uprobe_mmap(vp->vma);

When exactly do we need this "unconditional" uprobe_mmap(vp->vma) ?
Why is it called by mremap() ?

But lets even forget about mremap(). Unless I am totally confused, it
is also called by munmap() if it implies split_vma().

From the reproducer:

	void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);

In this case uprobe_mmap() is called by __mmap_complete(), it will call
uprobe_write_opcode(opcode_vaddr => addr2). This is clear.

Now, what if we do

	munmap(addr2, 4096);

after that? Afaics, in this case __split_vma() -> vma_complete() will call
uprobe_mmap(vp->vma) again, and uprobe_write_opcode() will try to install
the bp at the same addr2 vaddr we are going to unmap. Probably this is
harmless, but certainly this is sub-optimal...

No?

Oleg.


On 05/21, Pu Lehui wrote:
>
> From: Pu Lehui <pulehui@huawei.com>
>
> We encountered a BUG alert triggered by Syzkaller as follows:
>    BUG: Bad rss-counter state mm:00000000b4a60fca type:MM_ANONPAGES val:1
>
> And we can reproduce it with the following steps:
> 1. register uprobe on file at zero offset
> 2. mmap the file at zero offset:
>    addr1 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
> 3. mremap part of vma1 to new vma2:
>    addr2 = mremap(addr1, 4096, 2 * 4096, MREMAP_MAYMOVE);
> 4. mremap back to orig addr1:
>    mremap(addr2, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, addr1);
>
> In the step 3, the vma1 range [addr1, addr1 + 4096] will be remap to new
> vma2 with range [addr2, addr2 + 8192], and remap uprobe anon page from
> the vma1 to vma2, then unmap the vma1 range [addr1, addr1 + 4096].
> In tht step 4, the vma2 range [addr2, addr2 + 4096] will be remap back
> to the addr range [addr1, addr1 + 4096]. Since the addr range [addr1 +
> 4096, addr1 + 8192] still maps the file, it will take
> vma_merge_new_range to merge these two addr ranges, and then do
> uprobe_mmap in vma_complete. Since the merged vma pgoff is also zero
> offset, it will install uprobe anon page to the merged vma. However, the
> upcomming move_page_tables step, which use set_pte_at to remap the vma2
> uprobe anon page to the merged vma, will over map the old uprobe anon
> page in the merged vma, and lead the old uprobe anon page to be orphan.
>
> Since the uprobe anon page will be remapped to the merged vma, we can
> remove the unnecessary uprobe_mmap at merged vma, that is, do not
> perform uprobe_mmap when there is no vma in the addr range to be
> expaned.
>
> This problem was first find in linux-6.6.y and also exists in the
> community syzkaller:
> https://lore.kernel.org/all/000000000000ada39605a5e71711@google.com/T/
>
> The complete Syzkaller C reproduction program is as follows:
>
> #define _GNU_SOURCE
> #include <sys/mman.h>
> #include <linux/perf_event.h>
> #include <linux/hw_breakpoint.h>
>
> #include <fcntl.h>
> #include <stdio.h>
> #include <stdint.h>
> #include <string.h>
> #include <syscall.h>
> #include <unistd.h>
>
> int main(int argc, char *argv[])
> {
>     // Find out what type id we need for uprobes
>     int perf_type_pmu_uprobe;
>     {
>         FILE *fp = fopen("/sys/bus/event_source/devices/uprobe/type", "r");
>         fscanf(fp, "%d", &perf_type_pmu_uprobe);
>         fclose(fp);
>     }
>
>     const char *filename = "./bus";
>
>     int fd = open(filename, O_RDWR|O_CREAT, 0600);
>     write(fd, "x", 1);
>
>     void *addr = mmap(NULL, 4096, PROT_READ | PROT_WRITE | PROT_EXEC,
>                       MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
>
>     // Register a perf uprobe on "./bus"
>     struct perf_event_attr attr = {};
>     attr.type = perf_type_pmu_uprobe;
>     attr.uprobe_path = (unsigned long) filename;
>     syscall(__NR_perf_event_open, &attr, 0, 0, -1, 0);
>
>     void *addr2 = mmap(NULL, 2 * 4096, PROT_NONE, MAP_PRIVATE, fd, 0);
>     void *addr3 = mremap((void *) addr2, 4096, 2 * 4096, MREMAP_MAYMOVE);
>     mremap(addr3, 4096, 4096, MREMAP_MAYMOVE | MREMAP_FIXED, (void *) addr2);
>
>     return 0;
> }
>
> Signed-off-by: Pu Lehui <pulehui@huawei.com>
> ---
>  mm/vma.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
>
> diff --git a/mm/vma.c b/mm/vma.c
> index 3ff6cfbe3338..9a8d84b12918 100644
> --- a/mm/vma.c
> +++ b/mm/vma.c
> @@ -325,7 +325,7 @@ static void vma_prepare(struct vma_prepare *vp)
>   * @mm: The mm_struct
>   */
>  static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
> -			 struct mm_struct *mm)
> +			 struct mm_struct *mm, bool handle_vma_uprobe)
>  {
>  	if (vp->file) {
>  		if (vp->adj_next)
> @@ -358,7 +358,8 @@ static void vma_complete(struct vma_prepare *vp, struct vma_iterator *vmi,
>
>  	if (vp->file) {
>  		i_mmap_unlock_write(vp->mapping);
> -		uprobe_mmap(vp->vma);
> +		if (handle_vma_uprobe)
> +			uprobe_mmap(vp->vma);
>
>  		if (vp->adj_next)
>  			uprobe_mmap(vp->adj_next);
> @@ -549,7 +550,7 @@ __split_vma(struct vma_iterator *vmi, struct vm_area_struct *vma,
>  	}
>
>  	/* vma_complete stores the new vma */
> -	vma_complete(&vp, vmi, vma->vm_mm);
> +	vma_complete(&vp, vmi, vma->vm_mm, true);
>  	validate_mm(vma->vm_mm);
>
>  	/* Success. */
> @@ -715,6 +716,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>  {
>  	struct vm_area_struct *vma;
>  	struct vma_prepare vp;
> +	bool handle_vma_uprobe = !!vma_lookup(vmg->mm, vmg->start);
>
>  	if (vmg->__adjust_next_start) {
>  		/* We manipulate middle and adjust next, which is the target. */
> @@ -748,7 +750,7 @@ static int commit_merge(struct vma_merge_struct *vmg)
>  	vmg_adjust_set_range(vmg);
>  	vma_iter_store_overwrite(vmg->vmi, vmg->target);
>
> -	vma_complete(&vp, vmg->vmi, vma->vm_mm);
> +	vma_complete(&vp, vmg->vmi, vma->vm_mm, handle_vma_uprobe);
>
>  	return 0;
>  }
> @@ -1201,7 +1203,7 @@ int vma_shrink(struct vma_iterator *vmi, struct vm_area_struct *vma,
>
>  	vma_iter_clear(vmi);
>  	vma_set_range(vma, start, end, pgoff);
> -	vma_complete(&vp, vmi, vma->vm_mm);
> +	vma_complete(&vp, vmi, vma->vm_mm, true);
>  	validate_mm(vma->vm_mm);
>  	return 0;
>  }
> --
> 2.34.1
>

