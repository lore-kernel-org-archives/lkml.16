Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 204E51E0DD8;
	Wed,  2 Jul 2025 16:10:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751472628; cv=none; b=aWE1FLwA1ZqNbteym4TCfS7F9YepimMrscM98NfZDMreQUsCOocNZWpleQSGDY4O70zqQQEdhfAOH7ULmpyiYl2sDOuK6n5RBfOyynM1sm3WDEngUyzQ5ZhnViLNK0Mto5U9cPiydTyLCPdNea+uJiGXYVl44RQFuOjPmYI1s1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751472628; c=relaxed/simple;
	bh=d/6DDJH1wV/ODNau5RFdyJrWY0eEwWDgeUDuqlxT/u4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ThWL/orUBPsH8WyaHbZyQd9sSgLSn798j6WXwqMI6HMSfYk4bxpGu77Fvfy6kaMKLECPdlvI6VEpJahN2tycRKuTGOYUTm1yaBctXUrgyFSa85d6r2XHCX4Wp1JxnBE3tYA6CM4Q6CNgWz6Dlc1crKQp0rx0slCFpc7ji8vTA4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AvTS2/WF; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AvTS2/WF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0epRK0OpAHsu5Xbqj5f1MXvdML5cfnc/geubT1WmD50=; b=AvTS2/WFEmf7N5VxO3wwFykFOz
	vx9RSS/PiE5Vlf/so4AtLDWqs50t6lmKvFdQCYza844DhDuQsvhnFuBuXfJIKHPhBps9FbkzuHjuW
	4kYmlY5OCDZ5pGaOoVyr5KmKpRdUOng2Ub2w0h6x/KGAwrLSPof2Z7/b84hLBsJjQ2wxFQfV2m4Ys
	9zrujuOmthQP6680TdqH3jCS9wol/JGgbDw0Z7+w47YO2QljslSEek8rAPt8xB6N+8BRg44MGqdyb
	gYXhv7bWY9i8aLetcyBVpqLmBZWkt+eK2UoCEiDK2VzDi1cfL1/bcZiiMV+9yPqb0pX8MhQnfHfjv
	w35KoTQg==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uX02I-00000007Ukt-0P7a;
	Wed, 02 Jul 2025 16:10:14 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E89AF300130; Wed, 02 Jul 2025 18:10:12 +0200 (CEST)
Date: Wed, 2 Jul 2025 18:10:12 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: Mark Rutland <mark.rutland@arm.com>, Borislav Petkov <bp@alien8.de>,
	kernel test robot <lkp@intel.com>,
	Thomas Gleixner <tglx@linutronix.de>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	x86@kernel.org, Linus Walleij <linus.walleij@linaro.org>,
	Jinjie Ruan <ruanjinjie@huawei.com>,
	Nathan Chancellor <nathan@kernel.org>
Subject: Re: [tip:master 19/19] include/linux/irq-entry-common.h:201:2:
 error: unexpected token
Message-ID: <20250702161012.GQ1613200@noisy.programming.kicks-ass.net>
References: <202507020528.N0LtekXt-lkp@intel.com>
 <20250702123240.GDaGUm6Le4KLL7o_91@fat_crate.local>
 <aGUtCveV8Ev17_FS@J2N7QTR9R3.cambridge.arm.com>
 <20250702130915.GEaGUve86iYnv337_Z@fat_crate.local>
 <aGUxH--v32Bv4T81@J2N7QTR9R3.cambridge.arm.com>
 <20250702132415.GFaGUy_6q0dZZI9AX3@fat_crate.local>
 <aGU_IY70Jt4bcbf2@J2N7QTR9R3.cambridge.arm.com>
 <20250702145425.GS1613376@noisy.programming.kicks-ass.net>
 <20250702150739.GT1613376@noisy.programming.kicks-ass.net>
 <20250702154137.71390C24-hca@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250702154137.71390C24-hca@linux.ibm.com>

On Wed, Jul 02, 2025 at 05:41:37PM +0200, Heiko Carstens wrote:
> On Wed, Jul 02, 2025 at 05:07:39PM +0200, Peter Zijlstra wrote:
> > > > > diff --git a/arch/s390/include/asm/bug.h b/arch/s390/include/asm/bug.h
> > > > > index a185855ab158..46d9eb64bd18 100644
> > > > > --- a/arch/s390/include/asm/bug.h
> > > > > +++ b/arch/s390/include/asm/bug.h
> > > > > @@ -9,7 +9,7 @@
> > > > >  #else
> > > > >  #define __BUGVERBOSE_LOCATION(file, line)			\
> > > > >  		.pushsection .rodata.str, "aMS", @progbits, 1;	\
> > > > > -	10002:	.string file;					\
> > > > > +	10002:	.ascii file;					\
> > > > >  		.popsection;					\
> > > > >  								\
> > > > >  		.long 10002b - .;				\
> > > > > 
> > > > 
> > > > IIUC this also needs a trailing "\0" as per the link above, or this
> > > > won't get a NUL-terminator (but will build just fine).
> > > 
> > > Yup, I ran into this before. Let me go fix that commit.
> > 
> >  + e7e26cfad96c...2a20b2730147 core/bugs -> core/bugs (forced update)
> 
> Thank you! But wouldn't you also need to merge Nathan's patch [1] into
> the loongarch commit (or maybe you are just about to do that)?
> 
> [1] https://lore.kernel.org/all/20250616-loongarch-fix-warn-cond-llvm-ias-v1-1-6c6d90bb4466@kernel.org/
> [2] https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?h=core/bugs&id=5d476f66e6add0b709a09d60feecff3a2d156800

Uh, indeed. Let me go do so.
