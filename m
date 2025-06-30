Received: from out30-98.freemail.mail.aliyun.com (out30-98.freemail.mail.aliyun.com [115.124.30.98])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 811B4382
	for <linux-kernel@vger.kernel.org>; Mon, 30 Jun 2025 00:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.30.98
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751242338; cv=none; b=qPKGnM4blK8ekLmo7mz3/o3m9Acsx3/4X+DDMNGpxDAiOx/9rj8BJ+6QCNDghQwuUD8F9hq28yWH71MCHFsb96/TwbCdbkeetMkEWl7rYf46o1zYVecgvuN9lkb4y5iKCL1rjXkMDchZz2qjQ546riaRQhT9Iz0TimeQDXywufU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751242338; c=relaxed/simple;
	bh=c9A/Im11BQ0KDvEwswakB0/BlL5G9CiKy4OMMq9AvDM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bKROTL0sGNC2rehqzrZ4YqXianp8qrocBZhWA6xisyi+1FSnJDg9CmJhMmhODIgBynyYW7Nzo0g0M3HTNi3ninEuY+1z3XArQY+Wz8yLnb809bjhqf+Erj/GMMFRbtVaps4nWBsgcIHEuUbJtnw+71syqr03lmD/OB42Elb/gRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com; spf=pass smtp.mailfrom=linux.alibaba.com; dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b=haOj2J+k; arc=none smtp.client-ip=115.124.30.98
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.alibaba.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.alibaba.com header.i=@linux.alibaba.com header.b="haOj2J+k"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1751242326; h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type;
	bh=Kp53yHyclnfuXyHbcdfZXdkRcD9GyJnaFra1xJlpF/8=;
	b=haOj2J+kXNkzOdQufojF3pMz9T9AFOhneN4MXT8eRtLEB3hqsy8F1rEDyakOoLGSgKjBrXs4G5j5JUIaI+ZuR8z96C0X/c++i8k1QK+8R4e2C4MLb+OBIq59MpHL/5LphTwcN3VoOtrdmIsGhq5g4pYRUmx6XCkU6cCas8jO3BA=
Received: from U-V2QX163P-2032.local(mailfrom:fengwei_yin@linux.alibaba.com fp:SMTPD_---0Wg1K.Qo_1751242325 cluster:ay36)
          by smtp.aliyun-inc.com;
          Mon, 30 Jun 2025 08:12:05 +0800
Date: Mon, 30 Jun 2025 08:12:05 +0800
From: YinFengwei <fengwei_yin@linux.alibaba.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	zhourundong.zrd@linux.alibaba.com
Subject: Re: [Question] About the elf program header size
Message-ID: <4a3mhbhfvj2ctmovfknmdhskbmmhii3jcsdvba3e7xxytzkpc4@odtyzuhto7lx>
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
I don't know the detail. Just know it's a tool generates assembly
code according to the trace data. From the objdump, it looks like
there are many hole generated (I assume it just generates the code
which is the code path just hit).

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
Thanks a lot for this information. I didn't know the pre-git history can
be found here.

> 
> It seems the 64K count limit is sufficient? (If the goal was to avoid
> large memory allocations happening from userspace, we're way past
> PAGE_SIZE these days between IPC, BPF, etc.) Does this work for you?
Yes. It works good. Thanks.

Regards
Yin, Fengwei

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
> 
> 
> -- 
> Kees Cook
