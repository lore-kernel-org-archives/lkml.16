Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1718E3398B
	for <linux-kernel@vger.kernel.org>; Fri, 27 Jun 2025 16:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751042146; cv=none; b=oPSKcHQkCFQn7aGPnuxR0VKF/3vGYfaXZslsbeey+ZsrYFHtrTQIw6rFBA+TJXNoZWFRyfMwIwluXiTPah8gFMqFUGLHZpX/zCvOqF/iYA4Aiur8OhyqJrpqNqf6+rcWNHcjC7jsNb6OONnYO6rj2zFNRnMrl0k5s1XAi3PQ8TM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751042146; c=relaxed/simple;
	bh=l7tSd5gSPxM/86AZB06VAUDNcgycMyZieHlzXXcZFY0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uWQ9542lPbg3d27Qm1fc4B1t+b0HVvfRyZPMwg2UFbP8elTGDsYjSdIlHvIXkWR3ZMYM3ilTcgJiaXdaADYOcSAYNtEstx8xDK4Uj9bp8MB/YyWBvTBb4MkwsMPLU/K4bQAmBrHcNGpd+D9oMrthgdDGeUxwNI00zalh2OoRUB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oiEZ1zWz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oiEZ1zWz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AA68C4CEE3;
	Fri, 27 Jun 2025 16:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751042145;
	bh=l7tSd5gSPxM/86AZB06VAUDNcgycMyZieHlzXXcZFY0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=oiEZ1zWzEdFto7YPnOEge4Gy34mew+fU1lBX8PxOA3MF8lEUlrt8yi2r25ZJ8WHap
	 pRcgK2ig38p/sIr5eY1aWs9pClVqJq0ySIVIDUAHj80gypA4iuarn/CwRGZVMBENo/
	 f4MzedQrV9fyO5fV3vMNusdxe6b8kXjlMTCt9UmVli4eLqveHgK0TkKb9Op6eY4KMd
	 dFOS6xbJAEjvWI/47+BxKbAxUrAJnUzCvnJLJUdmepeH5KKXIJEa50AiCpuvybdwqU
	 8aVVjqmuya1mfXVKRd1jVILe7+ZyW/hpBOfta65C5nrOHiaIq9DbPCn/vSfyTPlqNq
	 nTcSqFglyqcYw==
Date: Fri, 27 Jun 2025 09:35:45 -0700
From: Kees Cook <kees@kernel.org>
To: YinFengwei <fengwei_yin@linux.alibaba.com>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	zhourundong.zrd@linux.alibaba.com
Subject: Re: [Question] About the elf program header size
Message-ID: <202506270854.A729825@keescook>
References: <sxokzxpo74u7yhrhfrmgtdvkpshwl464jicrwwkwtvkwl5d5dj@fqto77h2prj2>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <sxokzxpo74u7yhrhfrmgtdvkpshwl464jicrwwkwtvkwl5d5dj@fqto77h2prj2>

On Fri, Jun 27, 2025 at 09:04:11AM +0800, YinFengwei wrote:
> We had a script generated assembly code. built it with gcc and the
> output elf file had 78 program headers.

Why so many?

> On an arm64 platform, if we have 64KB base page size, the elf can
> be started correctly. But if we have 4KB base page size, the elf
> can NOT be started with:
>     cannot execute binary file: Exec format error
> 
> Look at the function load_elf_phdrs():
>         if (size == 0 || size > 65536 || size > ELF_MIN_ALIGN)
> 	                goto out;
> 
> ELF_MIN_ALIGN is defined as PAGE_SIZE on arm64. Which can explain
> above inconsistent behaviors (from user perspetive).
> 
> I didn't find the limitation definition in ELF spec(Maybe I missed
> some obvious info there). If I remove "size > ELF_MIN_ALIGN", the
> same elf can be started correctly even with 4KB page size.
> 
> So my question is why we limit the who program headers total size
> to PAGE_SIZE? git history couldn't tell anything because the
> limitation was introduced when whole linux kernel tree was migrated
> to git. Is there a possible constrain on other architecture? Thanks.

Looking through
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git
(which doesn't have linked history, so you have to examine explicit "pre
git" tags), I see:

4779b38bcb96 ("[PATCH] Linux-0.99.13 (September 19, 1993)")
Which says "ELF binary support it a notable change." Here, the PAGE_SIZE
check does not exist. When ELF interp support was added in
9e11983a5a3e ("Import 0.99.15f"), we see the check appear, and I can
find no rationale.

And with 6a8d38945cf4 ("binfmt_elf: Hoist ELF program header loading to
a function"), the PAGE_SIZE check is _added_ for non-interp loads.

It seems the 64K count limit is sufficient? (If the goal was to avoid
large memory allocations happening from userspace, we're way past
PAGE_SIZE these days between IPC, BPF, etc.) Does this work for you?


diff --git a/fs/binfmt_elf.c b/fs/binfmt_elf.c
index a43363d593e5..92de44b8765f 100644
--- a/fs/binfmt_elf.c
+++ b/fs/binfmt_elf.c
@@ -519,7 +519,7 @@ static struct elf_phdr *load_elf_phdrs(const struct elfhdr *elf_ex,
 	/* Sanity check the number of program headers... */
 	/* ...and their total size. */
 	size = sizeof(struct elf_phdr) * elf_ex->e_phnum;
-	if (size == 0 || size > 65536 || size > ELF_MIN_ALIGN)
+	if (size == 0 || size > 65536)
 		goto out;
 
 	elf_phdata = kmalloc(size, GFP_KERNEL);


-- 
Kees Cook
