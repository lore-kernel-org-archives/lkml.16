Received: from out30-131.freemail.mail.aliyun.com (out30-131.freemail.mail.aliyun.com [115.124.30.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44139E555
	for <linux-kernel@vger.kernel.org>; Wed,  2 Jul 2025 01:09:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751418547; cv=none; b=IYMIY6VE0eA4q9Bf3nLNuBFWeAjo9nB5mWUklbm+l4SOXB1yWew0xhyeTdkZw+Reuort9BpbG6AIw34S2woluXJ/gh0WyrxwzyL66XAKklxBTDdYSHN8F5g4vfsAyXu5iQiAIjbvTIEpQSRwZxgbIWg9vTISBKPv/7GaI/1uR/k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751418547; c=relaxed/simple;
	bh=rFKHV2lSPyzV+CSDIEu4XvsGFF1WOS2joXvRZYZs24o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a1EWGqBeMSzWMgnserZNgd10z66a3etgLND2iSf0JEzsX1ztHyk4Geh6igCx5ZNJWiift5I+Osq6hadk7jWZHpm5dy8kYuivc8RFUhl+FOApaR1/n0uvFoAGSQ99owr+TUBUrKv2dgw31Fzj9FrcM0UFNUf91N4MAdTv9dMeKs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=li2mLjGm; arc=none smtp.client-ip=115.124.30.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="li2mLjGm"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751418536; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=ftBlfmSXkRjfyEF0gwKGfmT/6LZAIbCEpr1ozhDrc1k=;
	b=li2mLjGmOeXDXK3ErucEA72GLY8xnFMs7iSVh4yjLqd7NCbv/U+BFH1VZdFzgbsURvA0kp7U2AKjSgzrtd4KsP8Viy4R3nBva8qM2zRGiTV7aBTWh4Wst73po4QsX5tTJKT3wwDabWiaA7eINFvQbOlbLPXwEvel5Q81DWSXtLQ=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0WgVsmul_1751418535 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 02 Jul 2025 09:08:55 +0800
Date: Wed, 2 Jul 2025 09:08:54 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	zhourundong.zrd@linux.alibaba.com
Subject: Re: [Question] About the elf program header size
Message-ID: <ee24empgxdokqjpifrhpyytverpd576weehnec347j7xpyxecf@uudl7we6t42s>
References: <sxokzxpo74u7yhrhfrmgtdvkpshwl464jicrwwkwtvkwl5d5dj@fqto77h2prj2>
 <202506270854.A729825@keescook>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202506270854.A729825@keescook>

On Fri, Jun 27, 2025 at 09:35:45AM +0800, Kees Cook wrote:
> On Fri, Jun 27, 2025 at 09:04:11AM +0800, YinFengwei wrote:
> > We had a script generated assembly code. built it with gcc and the
> > output elf file had 78 program headers.
> 
> Why so many?
> 
> > On an arm64 platform, if we have 64KB base page size, the elf can
> > be started correctly. But if we have 4KB base page size, the elf
> > can NOT be started with:
> >     cannot execute binary file: Exec format error
> > 
> > Look at the function load_elf_phdrs():
> >         if (size == 0 || size > 65536 || size > ELF_MIN_ALIGN)
> > 	                goto out;
> > 
> > ELF_MIN_ALIGN is defined as PAGE_SIZE on arm64. Which can explain
> > above inconsistent behaviors (from user perspetive).
> > 
> > I didn't find the limitation definition in ELF spec(Maybe I missed
> > some obvious info there). If I remove "size > ELF_MIN_ALIGN", the
> > same elf can be started correctly even with 4KB page size.
> > 
> > So my question is why we limit the who program headers total size
> > to PAGE_SIZE? git history couldn't tell anything because the
> > limitation was introduced when whole linux kernel tree was migrated
> > to git. Is there a possible constrain on other architecture? Thanks.
> 
> Looking through
> https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git
> (which doesn't have linked history, so you have to examine explicit "pre
> git" tags), I see:
> 
> 4779b38bcb96 ("[PATCH] Linux-0.99.13 (September 19, 1993)")
> Which says "ELF binary support it a notable change." Here, the PAGE_SIZE
> check does not exist. When ELF interp support was added in
> 9e11983a5a3e ("Import 0.99.15f"), we see the check appear, and I can
> find no rationale.
> 
> And with 6a8d38945cf4 ("binfmt_elf: Hoist ELF program header loading to
> a function"), the PAGE_SIZE check is _added_ for non-interp loads.
> 
> It seems the 64K count limit is sufficient? (If the goal was to avoid
> large memory allocations happening from userspace, we're way past
> PAGE_SIZE these days between IPC, BPF, etc.) Does this work for you?
> 
> 
> diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
> index a43363d593e5..92de44b8765f 100644
> --- a/fs/binfmt_elf.c
> +++ b/fs/binfmt_elf.c
> @@ -519,7 +519,7 @@ static struct elf_phdr *load_elf_phdrs(const struct elfhdr *elf_ex,
>  	/* Sanity check the number of program headers... */
>  	/* ...and their total size. */
>  	size = sizeof(struct elf_phdr) * elf_ex->e_phnum;
> -	if (size == 0 || size > 65536 || size > ELF_MIN_ALIGN)
> +	if (size == 0 || size > 65536)
>  		goto out;
>  
>  	elf_phdata = kmalloc(size, GFP_KERNEL);
Just want to check: are you going to push this change to be merged?
Thanks.


Regards
Yin, Fengwei

> 
> 
> -- 
> Kees Cook
