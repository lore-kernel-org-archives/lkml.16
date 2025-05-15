Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE43E26AD0
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 11:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747309473; cv=none; b=R2WTj4zbDyjCuNTlNKOVrJ/5VqeFpZmPeiFZpaRe2AJZbXupB7N+R1335z+bB/T7otCVp1fQNpmH8DbB8SJqjYFCR46LJOXrIMisMUKPXReDFv5t6qCr+hHeIohxNgq5TJBB+beaf21G3sn5Vt5hay1HrMRPeMNmn87owo9AQZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747309473; c=relaxed/simple;
	bh=fYBAMnUAbSmbstaaQWJvyiR/vqIs6Lf+U5vlR9+NGFE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Siulu4u7CR6LMV/dzc95VdTPPWwZFKqzZz6EbjU4RxnwqlwzPwF2+S4gsi4sVJO+Vut7KmOe4lCdFmofd5BRz/zNcpedZArePSH842JTqBJKjkSPL28A/XmX16/gys/lg+aqQ6L02oRAqAlCTtI/pabDYnQCAhROMGXy1PeHqV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BB6y+bRX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BB6y+bRX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79B8CC4CEE7;
	Thu, 15 May 2025 11:44:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309473;
	bh=fYBAMnUAbSmbstaaQWJvyiR/vqIs6Lf+U5vlR9+NGFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BB6y+bRXqYUk3n4XicdBVqUfJ0TTWL1OqXU0AIxja1Utv7xZK4WJu2w5j6vUmc5an
	 hN1opk44ZdVvLGjENQ3RWI33WjcYkVUAfM/alpiKIEBjGJ3lAFfKmNLf4QFefYtAwS
	 pJlon8wdZP0UkCGgvW/yS1f8RJFTvjpyEYwOP/DB6u2XivuvZ5eoEMVUYzGugwwRub
	 f8FEHbVNaAjTdU84rYU3oyA/t9lZLyqVKTy0SgUS4MYwkEnOzyQkzFDIAeZkRnQ7tR
	 ArH8f1s31XalfJuquU2uRCOH5ayFk6OYupBMl6RKQ3HtqpgyZBAHbYHdXc8DVNGTLm
	 tIKdhN7jju3Dw==
Date: Thu, 15 May 2025 13:44:27 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Andy Shevchenko <andy@kernel.org>
Cc: linux-kernel@vger.kernel.org, Arnd Bergmann <arnd@kernel.org>,
	Borislav Petkov <bp@alien8.de>, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Kees Cook <keescook@chromium.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Mike Rapoport <rppt@kernel.org>,
	Paul Menzel <pmenzel@molgen.mpg.de>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	David Woodhouse <dwmw@amazon.co.uk>
Subject: Re: [PATCH 20/29] x86/boot/e820: Clean up
 e820__setup_pci_gap()/e820_search_gap() a bit
Message-ID: <aCXTm-BH2QopFIGV@gmail.com>
References: <20250421185210.3372306-1-mingo@kernel.org>
 <20250421185210.3372306-21-mingo@kernel.org>
 <aAfFvbgRONT0OLmj@smile.fi.intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAfFvbgRONT0OLmj@smile.fi.intel.com>


* Andy Shevchenko <andy@kernel.org> wrote:

> On Mon, Apr 21, 2025 at 08:52:00PM +0200, Ingo Molnar wrote:
> > Use a bit more readable variable names, we haven't run out of
> > underscore characters in the kernel yet.
> 
> Size notes:
> 
> > +	gap_size = 0x400000;
> 
> SZ_4M ?
> 
> ...
> 
> > +		gap_start = (max_pfn << PAGE_SHIFT) + 1024*1024;
> 
> SZ_1M ?

Good point - delta patch below folded back & propagated to the rest of 
the series.

Thanks,

	Ingo

===============================>
 arch/x86/kernel/e820.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 3baf558107e7..d00ca2dd20b7 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -722,12 +722,12 @@ __init void e820__setup_pci_gap(void)
 	unsigned long gap_start, gap_size;
 	int found;
 
-	gap_size = 0x400000;
+	gap_size = SZ_4M;
 	found  = e820_search_gap(&gap_start, &gap_size);
 
 	if (!found) {
 #ifdef CONFIG_X86_64
-		gap_start = (max_pfn << PAGE_SHIFT) + 1024*1024;
+		gap_start = (max_pfn << PAGE_SHIFT) + SZ_1M;
 		pr_err("Cannot find an available gap in the 32-bit address range\n");
 		pr_err("PCI devices with unassigned 32-bit BARs may not work!\n");
 #else
