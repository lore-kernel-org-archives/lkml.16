Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A10A2E7BA1;
	Wed,  2 Jul 2025 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751479302; cv=none; b=HtGBBHebzj1nsE3ryYTEf1+p2S4Mt4x55p6zz+y9f5HGKIypeJGp8q/BHIEf96L+VZxsdvQJM3H99U8QkVZWrkvHwl8tA/+YBKHyfLcUndVJSUNVyK4KOZVOG5qJg+E7hHVjwfAPnBDFnkrStEj6a7IwakWQfxaqC63ruYAEjGk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751479302; c=relaxed/simple;
	bh=3lsMooKWK3LYSzXl02GSB2/NoJwzFYWA5lTVaIhuUWo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dWwIwSeuGcNWXSjX5c563rE9LU9y+lz7S7YNNStZakhjZeaw2aozHNramFh5Jor5oHAQRddMJnMBTRWH3d8FNKcNN/95NrXDtFLiYMuRvO3LFAnHaMzwWIez6/otsj4wPa8AhQyo8okC73l07Jm3Dz+cnQXU9reESi/6vuDfoLU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sjFGkOhy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sjFGkOhy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E11EC4CEE7;
	Wed,  2 Jul 2025 18:01:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751479301;
	bh=3lsMooKWK3LYSzXl02GSB2/NoJwzFYWA5lTVaIhuUWo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sjFGkOhyDGYQbWWnUkvigrY155E4ldvwTDotT+uXlwXTySd3pDne+T06Z14HNiaTa
	 W/ohs4WOQZOiCsbxOSNacL6tbdgzcmxxIOZZ7jlM+dkkwYNt9Jd+iFUTdfcS1O6rIp
	 pxYUiWbIhUtymQv/+v6BD+2PqXpLlUlSYgGj3YnJuK5IAOyhusC0H6+m757RY/TL+c
	 96WgylrcjG16mSiIZaeLgcJbeFGw+//9PpWBqQmMgkbrZQhhn5gdVut9RuBt7MD3Jl
	 tXLwyXKcbk0P6EttiDkc1uVNhGaQJCdwNA3Ffgg9F/8S9hydPTAIf+KVG7Rk0KXbY3
	 2L8Jp1bn9qH+g==
Date: Wed, 2 Jul 2025 11:01:36 -0700
From: Nathan Chancellor <nathan@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Heiko Carstens <hca@linux.ibm.com>, Mark Rutland <mark.rutland@arm.com>,
	Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702180136.GA3452438@ax162>
References: <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
 <20250702154137.71390C24-hca@linux.ibm.com>
 <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>

On Wed, Jul 02, 2025 at 06:10:12PM +0200, Peter Zijlstra wrote:
> On Wed, Jul 02, 2025 at 05:41:37PM +0200, Heiko Carstens wrote:
> > On Wed, Jul 02, 2025 at 05:07:39PM +0200, Peter Zijlstra wrote:
> > > > > > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > > > > > index a185855ab158..46d9eb64bd18 100644
> > > > > > --- a/arch/s390/include/asm/bug.h
> > > > > > +++ b/arch/s390/include/asm/bug.h
> > > > > > @@ -9,7 +9,7 @@
> > > > > >  #else
> > > > > >  #define __BUGVERBOSE_LOCATION(file, line)			\
> > > > > >  		.pushsection .rodata.str, "aMS", @progbits, 1;	\
> > > > > > -	10002:	.string file;					\
> > > > > > +	10002:	.ascii file;					\
> > > > > >  		.popsection;					\
> > > > > >  								\
> > > > > >  		.long 10002b - .;				\
> > > > > > 
> > > > > 
> > > > > IIUC this also needs a trailing "\0" as per the link above, or this
> > > > > won't get a NUL-terminator (but will build just fine).
> > > > 
> > > > Yup, I ran into this before. Let me go fix that commit.
> > > 
> > >  + e7e26cfad96c...2a20b2730147 core/bugs -> core/bugs (forced update)
> > 
> > Thank you! But wouldn't you also need to merge Nathan's patch [1] into
> > the loongarch commit (or maybe you are just about to do that)?
> > 
> > [1] https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/
> > [2] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=core/bugs&id=5d476f66e6add0b709a09d60feecff3a2d156800
> 
> Uh, indeed. Let me go do so.

Thanks Peter. Did something go awry with the latest rebase? It looks
like current core/bugs has the loongarch issue fixed but "bugs/s390: Use
'cond_str' in __EMIT_BUG()" seems to have reverted to the broken
version?

diff --git a/tmp/.psub.eKGNE0S0Yf b/tmp/.psub.w9BLv9qXti
index 0fb363b71ebb..f3ce9e3ce952 100644
--- a/tmp/.psub.eKGNE0S0Yf
+++ b/tmp/.psub.w9BLv9qXti
@@ -1,8 +1,8 @@
-commit d9f685d24d69b6b64cecb3dd70d7e51836bf531f
+commit 6540db6ce800aaeedc8d733d1e6d2f1c83c7b217
 Author:     Heiko Carstens <hca@linux.ibm.com>
 AuthorDate: Tue May 20 15:39:27 2025 +0200
 Commit:     Peter Zijlstra <peterz@infradead.org>
-CommitDate: Wed Jul 2 16:55:06 2025 +0200
+CommitDate: Wed Jul 2 18:16:12 2025 +0200
 
     bugs/s390: Use 'cond_str' in __EMIT_BUG()
     
@@ -32,7 +32,7 @@ CommitDate: Wed Jul 2 16:55:06 2025 +0200
     Link: https://lore.kernel.org/r/20250617135042.1878068-3-hca@linux.ibm.com
 
 diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
-index 30f8785a01f5..c39500eec300 100644
+index 30f8785a01f5..0c808dadbc22 100644
 --- a/arch/s390/include/asm/bug.h
 +++ b/arch/s390/include/asm/bug.h
 @@ -2,52 +2,52 @@
@@ -48,7 +48,7 @@ index 30f8785a01f5..c39500eec300 100644
 +#else
 +#define __BUGVERBOSE_LOCATION(file, line)			\
 +		.pushsection .rodata.str, "aMS", @progbits, 1;	\
-+	10002:	.ascii file "\0";				\
++	10002:	.string file;					\
 +		.popsection;					\
 +								\
 +		.long 10002b - .;				\
