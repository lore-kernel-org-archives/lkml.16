Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150172D3739;
	Wed,  2 Jul 2025 15:07:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468878; cv=none; b=AkFSJSb3e5W9ZYOke47GDotpMndITEiRbbqep89jxVJwY4c2tmBE5Qrs5umBo0Lk/DeCKutMehGVSv8Cw9MNFJeqhT/kU5wax8YDgMJHGsO5TQ3g2yQXskS/jRJOGxh//Vo51b3bqeIa8EL3epMvZhqWeL+U2oxX9lO9wU4riQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468878; c=relaxed/simple;
	bh=Ee+bd0jw4bqeEr+/W544zg+oeHVNqDzCX2e0zaohiyE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UadVk+bIHJmYGHGmQEMnEXIZr5QPbjGXcRKrKGYL8WiQrCaZaMa7i3qvbAtsDVc2jpBnHdh5wZ5TlcW3ZkNZ+TDZuIZDoWe9hTVqo1Vm6vXA5El8DZIisMGyIKNA0j8K9ioIzgKs8ak04kf/x6qY4gvIG0WwYbIHk77BBcqX278=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=BN8TerN7; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="BN8TerN7"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=mRETQHgJjXJ0ep3jOM3xiPYKuBNHEdiIRN9HCejwg2E=; b=BN8TerN7Mb7LDGMt4ibgafL2M3
	NZ3UJzXRDJC2fnlzUA3KoKd7OSYCZxeJxpP6wBb562TUNe+s8qlemGdIu80hlo6FFw2C6FDqV50FI
	39fVi+6/t9nURxqoJz3Ao+LtvLkXWnTKC7KQ8Yb3cu7znq/CTx/xnTSC8Y0NJ8X1kDEuWKwsrPcCj
	lf+K3dnPUZQ6mKRTd0BE6vctPT+CL+py6JHvQK9zL0IJN+TE+XtPRIvG185EvevMGct+sZmBrz84h
	gKbsne7KnvE53rfT5m8GQbSrwPQDbMy5XPMGpUIQ4qXaRT4FErM7/qIFAImVNkcr3HB4U6YeIef/Z
	oXAK4sSQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWz3k-0000000AAex-1hWG;
	Wed, 02 Jul 2025 15:07:40 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 581D5300158; Wed, 02 Jul 2025 17:07:39 +0200 (CEST)
Date: Wed, 2 Jul 2025 17:07:39 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>, hca@linux.ibm.com
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702145425.GS1613376@noisy.programming.kicks-ass.net>

On Wed, Jul 02, 2025 at 04:54:25PM +0200, Peter Zijlstra wrote:
> On Wed, Jul 02, 2025 at 03:16:01PM +0100, Mark Rutland wrote:
> > On Wed, Jul 02, 2025 at 03:24:15PM +0200, Borislav Petkov wrote:
> > > On Wed, Jul 02, 2025 at 02:16:15PM +0100, Mark Rutland wrote:
> > > > Sounds like a plan.
> > > 
> > > As we figured out on IRC:
> > > 
> > > https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/
> > > 
> > > "clang's integrated assembler only supports concatenating strings with
> > > '.ascii'. There was discussion of allowing '.string' / '.asciz' but it
> > > was decided against [1] because it was undesirable to match the behavior
> > > of released binutils at the time, where"
> > > 
> > > and this seems to fix it here:
> > > 
> > > ---
> > > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > > index a185855ab158..46d9eb64bd18 100644
> > > --- a/arch/s390/include/asm/bug.h
> > > +++ b/arch/s390/include/asm/bug.h
> > > @@ -9,7 +9,7 @@
> > >  #else
> > >  #define __BUGVERBOSE_LOCATION(file, line)			\
> > >  		.pushsection .rodata.str, "aMS", @progbits, 1;	\
> > > -	10002:	.string file;					\
> > > +	10002:	.ascii file;					\
> > >  		.popsection;					\
> > >  								\
> > >  		.long 10002b - .;				\
> > > 
> > 
> > IIUC this also needs a trailing "\0" as per the link above, or this
> > won't get a NUL-terminator (but will build just fine).
> 
> Yup, I ran into this before. Let me go fix that commit.

 + e7e26cfad96c...2a20b2730147 core/bugs -> core/bugs (forced update)

