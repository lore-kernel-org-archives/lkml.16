Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32A269AEE
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 09:58:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746784695; cv=none; b=Fzt4vzYhwOrL455MQcGvnx3DxCeRIG+/uAmiurU2uEkKCuznZZx9ewDho0/Ku83VwjVCw5NgMmhsdHGHHNC4rgKTbJjnHFe9tqMXT5r4e5blTR8yAoahwCm9o+zfv2v8Ik71vDHr4wpCjwSvKQmQwgPu4DDGx1jPnUrh7xojsGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746784695; c=relaxed/simple;
	bh=DEQz37IyWK0ryEJohWAXH7yr/VMM4C/jCnNq2Kg5WbM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VvyGW7mOruparRlO94bewogTKxDkLC3tBKc0sbPB1ascWxyv7KaD0F5vTL3ALpNYOv/4q2xQImSFZVfgQVMvRWfg4HPsEeep18h72qrI5/UzSwdTHvPqknb02clZdt66rBvtKyuhoiizeIMeXwFc+Q8iOXTFGfjtVfSJ3Sh8SPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Hxr1mgb3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Hxr1mgb3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746784692;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=smh9m9QncjdwjlOMCsYlZ/3FvdKe/nQ6shnomHg3bkM=;
	b=Hxr1mgb3NkUCu9icbh2q6oeegoBGkDb+h+Qo0/7Fk1SL9f6H5uZgs1T011/bD2G7GfhnT2
	g84mVYF88InJ36GaJJCX+niNUP41mq2MBrJKLRzjd3D+hh0Egl6oPgyLxVM73hBj5DzUXF
	ouplTU6gU3vfrJQFLvQClgWTezmtRjQ=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-522-7IVltxCUNEmJOJckde0Yiw-1; Fri,
 09 May 2025 05:58:09 -0400
X-MC-Unique: 7IVltxCUNEmJOJckde0Yiw-1
X-Mimecast-MFC-AGG-ID: 7IVltxCUNEmJOJckde0Yiw_1746784688
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 58A4A1800875;
	Fri,  9 May 2025 09:58:07 +0000 (UTC)
Received: from localhost (unknown [10.72.112.8])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id AB4B71955BC0;
	Fri,  9 May 2025 09:58:05 +0000 (UTC)
Date: Fri, 9 May 2025 17:58:01 +0800
From: Baoquan He <bhe@redhat.com>
To: Coiby Xu <coxu@redhat.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	fuqiang wang <fuqiang.wang@easystack.cn>,
	Vivek Goyal <vgoyal@redhat.com>, Dave Young <dyoung@redhat.com>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	x86@kernel.org
Subject: Re: [PATCH v4] x86/kexec: fix potential cmem->ranges out of bounds
Message-ID: <aB3RqS85p6DiHKHm@MiWiFi-R3L-srv>
References: <20240108130720.228478-1-fuqiang.wang@easystack.cn>
 <ZZzBhy5bLj0JuZZw@MiWiFi-R3L-srv>
 <4de3c2onosr7negqnfhekm4cpbklzmsimgdfv33c52dktqpza5@z5pb34ghz4at>
 <20250507225959.174dd1eed6b0b1354c95a0fd@linux-foundation.org>
 <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2754f4evjfumjqome63bc3inqb7ozepemejn2lcl57ryio2t6k@35l3tnn73gei>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 05/09/25 at 12:04pm, Coiby Xu wrote:
> On Wed, May 07, 2025 at 10:59:59PM -0700, Andrew Morton wrote:
> > On Thu, 8 May 2025 12:25:15 +0800 Coiby Xu <coxu@redhat.com> wrote:
> > 
> > > >
> > > >Acked-by: Baoquan He <bhe@redhat.com>
> > > 
> > > Hi Andrew,
> > > 
> > > It seems this patch was missed.
> > 
> > January 2024.  Yes, it's fair to assume that it was missed ;)
> > 
> > > Will you pick it up?
> > 
> > Sure.
> 
> Thanks for quickly processing this patch! Sorry I didn't reply yesterday
> as I was trying to reproduce the UBSAN warning and truly understand the
> it.
> 
> > 
> > > Without this patch,
> > > kdump kernel will fail to be loaded by the kexec_file_load,
> 
> As already pointed out by Baoquan, a manual test shows kexec_file_load
> actually works despite the UBSAN warning. Sorry I misinterpreted the
> UBSAN warning and the automated test result failure (somehow sysrq
> wasn't be triggered and vmcore wasn't saved either).
> 
> 
> > > 
> > >   [  139.736948] UBSAN: array-index-out-of-bounds in arch/x86/kernel/crash.c:350:25
> > >   [  139.742360] index 0 is out of range for type 'range [*]'
> [...]
> > > 
> > 
> > Do we know why this has appeared at such a late date?  The reporter
> > must be doing something rare.
> 
> The UBSAN warning happens because flexible array members annotated with
> __counted_by are accessed without assigning an array element count i.e.
> crash_mem->ranges[0] is accessed without setting max_nr_ranges after
> vzalloc,
> 
>     // include/linux/crash_core.h
>     struct crash_mem {
>     	unsigned int max_nr_ranges;
>     	unsigned int nr_ranges;
>     	struct range ranges[] __counted_by(max_nr_ranges);
>     };
> 
> The bad commit was introduced in 2021 but only recent gcc-15 supports
> __counted_by. That's why we don't see this UBSAN warning until this
> year. And although this UBSAN warning is scary enough, fortunately it
> doesn't cause a real problem.
> 
> > 
> > Baoquan, please re-review this?
> > 
> > A -stable backport is clearly required.  A Fixes: would be nice, but I
> > assume this goes back a long time so it isn't worth spending a lot of
> > time working out when this was introduced.
> 
> So I believe the correct fix should be as follows,

Thanks for testing and investigation into these. Could you arrange this
into formal patches based on your testing and analysis? 

It would be great if you can include Fuqiang's patch since it has
conflict with your LUKS patch. This can facilitate patch merging for
Andrew. Thanks in advance.

> 
> --- a/arch/x86/kernel/crash.c
> +++ b/arch/x86/kernel/crash.c
> @@ -301,6 +301,7 @@ int crash_setup_memmap_entries(struct kimage *image, struct boot_params *params)
>         cmem = vzalloc(struct_size(cmem, ranges, 1));
>         if (!cmem)
>                 return -ENOMEM;
> +       cmem->max_nr_ranges = 1;
>         memset(&cmd, 0, sizeof(struct crash_memmap_data));
>         cmd.params = params;
> 
> 
> And a Fixes tag should be dedicated to commit
> 5849cdf8c120 ("x86/crash: Fix crash_setup_memmap_entries() out-of-bounds access")
> which forgot to set cmem->max_nr_ranges=1.
> 
> > 
> > The patch needed a bit of work to apply to current code.  I did the
> > below.  It compiles.
> > 
> > --- a/arch/x86/kernel/crash.c~x86-kexec-fix-potential-cmem-ranges-out-of-bounds
> > +++ a/arch/x86/kernel/crash.c
> > @@ -165,8 +165,18 @@ static struct crash_mem *fill_up_crash_e
> > 	/*
> > 	 * Exclusion of crash region and/or crashk_low_res may cause
> > 	 * another range split. So add extra two slots here.
> > +	 *
> > +	 * Exclusion of low 1M may not cause another range split, because the
> > +	 * range of exclude is [0, 1M] and the condition for splitting a new
> > +	 * region is that the start, end parameters are both in a certain
> > +	 * existing region in cmem and cannot be equal to existing region's
> > +	 * start or end. Obviously, the start of [0, 1M] cannot meet this
> > +	 * condition.
> > +	 *
> > +	 * But in order to lest the low 1M could be changed in the future,
> > +	 * (e.g. [stare, 1M]), add a extra slot.
> > 	 */
> > -	nr_ranges += 2;
> > +	nr_ranges += 3;
> > 	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
> > 	if (!cmem)
> > 		return NULL;
> > @@ -317,9 +327,16 @@ int crash_setup_memmap_entries(struct ki
> > 	 * split. So use two slots here.
> > 	 */
> > 	nr_ranges = 2;
> > -	cmem = vzalloc(struct_size(cmem, ranges, nr_ranges));
> > +	/*
> > +	 * In the current x86 architecture code, the elfheader is always
> > +	 * allocated at crashk_res.start. But it depends on the allocation
> > +	 * position of elfheader in crashk_res. To avoid potential out of
> > +	 * bounds in future, add a extra slot.
> > +	 */
> > +	cmem = vzalloc(struct_size(cmem, ranges, 2));
> > 	if (!cmem)
> > 		return -ENOMEM;
> > +	cmem->max_nr_ranges = 2;
> 
> Thanks for coming up with the above patch! I think the goal of this
> patch is addressing a different issue but it also fixes the UBSAN
> warning because cmem->max_nr_ranges is now set.
> 
> > 
> > 	cmem->max_nr_ranges = nr_ranges;
> > 	cmem->nr_ranges = 0;
> > _
> 
> 
> -- 
> Best regards,
> Coiby
> 

