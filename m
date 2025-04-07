Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2EFE254877;
	Mon,  7 Apr 2025 13:16:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744031761; cv=none; b=O2nNKASuTfG7T8hn1g1O20Ox+xPeqCN4FOGytC3v6kmufq3yTuTAivEEZBxupVOdAz1qsaru4/TIgAyROjuWBrlZ9rXeotFJibGvdePw1VzwPaIsukHgxOnm7Ku3n6Ny7JzMpHZ23Wy/HoEGtNhKKoJMR1ackNEaIIUN1cf13DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744031761; c=relaxed/simple;
	bh=SJvaVxeGjrrd7lgKd48IanGgrp61arG5wckYR92s2uI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JjmlBWBSxGBi0ALg1UG8P4MHcxW+kvLS2Pd1FNC3x83MAgOuA+T0OlialZ5ofcdAUz15Y57ZhsS/bRQikHoZYes6b2LMM6TyUoUupp/pzgX/Gpe3eGb7PHqElUTYqEZfmaHa+8LpSHtwJmsTcLGDw/k/E5tFkFQejRUV4tZDvAw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=haYs3vFf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="haYs3vFf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14E87C4CEE7;
	Mon,  7 Apr 2025 13:15:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744031761;
	bh=SJvaVxeGjrrd7lgKd48IanGgrp61arG5wckYR92s2uI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=haYs3vFftxXXrMnEVOADmuhZyBoS3RDG027UqLwCVnAWZbmGwCkTI5dLipt0U3HYU
	 7hQISuV29FlK/P9psrfnd4eI+sZ/JiGKu/9bmlx+i5AbZJGueEWWGM/gwV4CYw79Ox
	 5L2ozHgPAgfNp9kgNUo3X18mpYAlKgp0qCDXNNMjUiq8u7nz8PLiQkJxu1LqlpVm0z
	 eFGQli6VYhPkT3krOEyHx9s5W/At3aoiHyCHPqgR+NmMroDDBvSdGpIiHpc7CrerN2
	 ecm01CVF16kym/uxcPzdECGFHoAQ+fa+geR/MRt4efNtbGKciOKxVi72zulI0m081I
	 q9MW3byo4tpsQ==
Date: Mon, 7 Apr 2025 18:43:54 +0530
From: Naveen N Rao <naveen@kernel.org>
To: Dan Williams <dan.j.williams@intel.com>
Cc: linux-kernel@vger.kernel.org, x86@kernel.org, 
	linux-coco@lists.linux.dev, Dave Hansen <dave.hansen@linux.intel.com>, 
	Borislav Petkov <bp@alien8.de>, Vishal Annapurve <vannapurve@google.com>, 
	Kirill Shutemov <kirill.shutemov@linux.intel.com>, Nikolay Borisov <nik.borisov@suse.com>, 
	Tom Lendacky <thomas.lendacky@amd.com>, Kevin Loughlin <kevinloughlin@google.com>
Subject: Re: [RFC PATCH] x86/sev: Disallow userspace access to BIOS region
 for SEV-SNP guests
Message-ID: <l34f6nqq3up23cvrgmebbufztqkvfil5eahecukw5bnqekccpj@6nbciquhwxxc>
References: <20250403120228.2344377-1-naveen@kernel.org>
 <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67eedc35be77d_464ec29462@dwillia2-xfh.jf.intel.com.notmuch>

On Thu, Apr 03, 2025 at 12:06:29PM -0700, Dan Williams wrote:
> Naveen N Rao (AMD) wrote:
> > Commit 9704c07bf9f7 ("x86/kernel: Validate ROM memory before accessing
> > when SEV-SNP is active") added code to validate the ROM region from
> > 0xc0000 to 0xfffff in a SEV-SNP guest since that region can be accessed
> > during kernel boot. That address range is not part of the system RAM, so
> > it needed to be validated separately.
> > 
> > Commit 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for
> > SEV-SNP guests") reverted those changes and instead chose to prevent the
> > guest from accessing the ROM region since SEV-SNP guests did not rely on
> > data from that region. However, while the kernel itself no longer
> > accessed the ROM region, there are userspace programs that probe this
> > region through /dev/mem and they started crashing due to this change. In
> > particular, fwupd (up until versions released last year that no longer
> > link against libsmbios) and smbios utilities such as smbios-sys-info
> > crash with a cryptic message in dmesg:
> >   Wrong/unhandled opcode bytes: 0x8b, exit_code: 0x404, rIP: 0x7fe5404d3840
> >   SEV: Unsupported exit-code 0x404 in #VC exception (IP: 0x7fe5404d3840)
> > 
> > Deny access to the BIOS region (rather than just the video ROM range)
> > via /dev/mem to address this. Restrict changes to CONFIG_STRICT_DEVMEM=y
> > which is enabled by default on x86. Add a new x86_platform_ops callback
> > so Intel can customize the address range to block.
> > 
> > Fixes: 0f4a1e80989a ("x86/sev: Skip ROM range scans and validation for SEV-SNP guests")
> > Signed-off-by: Naveen N Rao (AMD) <naveen@kernel.org>
> > ---
> >  arch/x86/coco/sev/core.c        | 13 +++++++++++++
> >  arch/x86/include/asm/sev.h      |  2 ++
> >  arch/x86/include/asm/x86_init.h |  2 ++
> >  arch/x86/kernel/x86_init.c      |  2 ++
> >  arch/x86/mm/init.c              |  3 +++
> >  arch/x86/mm/mem_encrypt_amd.c   |  1 +
> >  6 files changed, 23 insertions(+)
> > 
<snip>
> 
> Is there any driving need to allow devmem at all for TVM access at this
> point?
> 
> I would be in favor of making this clearly tied to devmem, call it
> ".devmem_is_allowed" for symmetry with the mm/init.c helper, and make
> the default implementation be:
> 
> static bool platform_devmem_is_allowed(unsigned long pfn)
> {
> 	return !cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT));
> }
> 
> ...if a TVM technology wants more leniency, it can override.

I'm not fully aware of the history here, but I suppose a TVM should 
appear as any other VM for userspace. For that reason, I didn't want to 
block access to /dev/mem any more than was necessary. Admittedly, I have 
limited insight into which utilities may be using /dev/mem today.

Tom/Boris, do you see a problem blocking access to /dev/mem for SEV 
guests?


- Naveen

