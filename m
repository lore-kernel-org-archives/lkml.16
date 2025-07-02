Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D70530AADD;
	Wed,  2 Jul 2025 14:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751468077; cv=none; b=jKNHbEGdauGnsge/Ps0iC3fprrcE6fvmBqxBvhBeH4W1ejEOck6Td1sHpVTRApKJyeISUIkYEzia7nZ5vipQV0awkqekOF49xOT+hfq3G2hULcOyM8h/WGcM865klkvH+jR0V44DSb3/rDefmAIi53LR6CzDIadfIVkh7SjHreE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751468077; c=relaxed/simple;
	bh=eQ2/A1buAaeHKe+GvIsaoH6T/9HiQLjm/8yCRn8ffmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RWgbOEcULdhldw56kAbJzA4weE0pAoUlZHrQa70eizcookFhOrcRSka1nc38kbY2nVlFi5l66NWm3fzg2zWgeNKY751oHEuv2Mgp9GZNnSOMiurzj+FEL9l+hYk+Mvi1X3iA/ndiq3AKnND/rOOYMlZdXaez1fWhXYebw0nB7u8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=ZQG5cWt8; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="ZQG5cWt8"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=EYpEhJ438Ygm0susoUO/i2kjn9mzut5gdv/JGZDLwN8=; b=ZQG5cWt8xy8DDyDdLe6QAkTwL1
	rOvUDh87KFgD+HZ6RWsxkvdbsrG66fNHaewECBZ6zAwu+6gNMDyCtZESjZPhi5OWh7sZ7dknM0kwH
	3YSF0+I3Wde63EojpdTPLRwKCrCjOzq4rZI8Tdo1oeDDTGUMD5ZCujYmLuItuAQKB59d5OBqZSqG2
	+7Koq1573KaU+FsTNn66XU1K1e9jmlrD/h/UYBv0UcWHkZRofbgJeiISBg6vKsLaVIdCotdRy1QqQ
	8WlastzM9o8Sact0jvkmqf6tnZkeq0edEIT3sbyXQXChPU0KnhxRSXIHWYMFW42Wcx0O9Xs/a073q
	JjfsxVMg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWyqw-00000007SOj-0Etr;
	Wed, 02 Jul 2025 14:54:26 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 3857030017D; Wed, 02 Jul 2025 16:54:25 +0200 (CEST)
Date: Wed, 2 Jul 2025 16:54:25 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Borislav Petkov <bp@alien8.de>, kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>

On Wed, Jul 02, 2025 at 03:16:01PM +0100, Mark Rutland wrote:
> On Wed, Jul 02, 2025 at 03:24:15PM +0200, Borislav Petkov wrote:
> > On Wed, Jul 02, 2025 at 02:16:15PM +0100, Mark Rutland wrote:
> > > Sounds like a plan.
> > 
> > As we figured out on IRC:
> > 
> > https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/
> > 
> > "clang's integrated assembler only supports concatenating strings with
> > '.ascii'. There was discussion of allowing '.string' / '.asciz' but it
> > was decided against [1] because it was undesirable to match the behavior
> > of released binutils at the time, where"
> > 
> > and this seems to fix it here:
> > 
> > ---
> > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > index a185855ab158..46d9eb64bd18 100644
> > --- a/arch/s390/include/asm/bug.h
> > +++ b/arch/s390/include/asm/bug.h
> > @@ -9,7 +9,7 @@
> >  #else
> >  #define __BUGVERBOSE_LOCATION(file, line)			\
> >  		.pushsection .rodata.str, "aMS", @progbits, 1;	\
> > -	10002:	.string file;					\
> > +	10002:	.ascii file;					\
> >  		.popsection;					\
> >  								\
> >  		.long 10002b - .;				\
> > 
> 
> IIUC this also needs a trailing "\0" as per the link above, or this
> won't get a NUL-terminator (but will build just fine).

Yup, I ran into this before. Let me go fix that commit.
