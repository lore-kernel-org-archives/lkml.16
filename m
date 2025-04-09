Received: from vmicros1.altlinux.org (vmicros1.altlinux.org [194.107.17.57])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A0D4629D0B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 23:18:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=194.107.17.57
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744240693; cv=none; b=YYrfeVI2B122EJKaYwEVjEiLBxrT/7VFPi/2cNAHB6fRlhRSSaYC54tROnx8ItyqZcE+dtbkTfpOUXxjlxdxIXwbXvbNTx51jhbsj3Ykie6+wM1X0K97kfs7enT8haw/ScR6uKRuzIwSOMrkJo+0kGQaRnit3ddiSVdAxLjfnbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744240693; c=relaxed/simple;
	bh=QPr4BARLejvba64jXR56CqlMpRD5F9NAcmhpWER9Xyc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hAEQN7OAAZL5NBszY68QzpRoG37X1iK4qv0Vtwc87j9Bvy3ZUOCa5GvJeWxGRevmmWoICtoaJRFfxtKd5i0dfu0wsniaS5/v3zjq3xbs5twfGxY+43JUDoXJdK2bKbVNEZgHSWNxz68IQ+Xrz9u8telhFhxGK0jpdFpCrfgmjvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io; spf=pass smtp.mailfrom=altlinux.org; arc=none smtp.client-ip=194.107.17.57
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=strace.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=altlinux.org
Received: from mua.local.altlinux.org (mua.local.altlinux.org [192.168.1.14])
	by vmicros1.altlinux.org (Postfix) with ESMTP id 2701772C8CC;
	Thu, 10 Apr 2025 02:18:03 +0300 (MSK)
Received: by mua.local.altlinux.org (Postfix, from userid 508)
	id 152D97CCB3A; Thu, 10 Apr 2025 02:18:02 +0300 (IDT)
Date: Thu, 10 Apr 2025 02:18:02 +0300
From: "Dmitry V. Levin" <ldv@strace.io>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Charlie Jenkins <charlie@rivosinc.com>,
	Arnd Bergmann <arnd@arndb.de>, strace-devel@lists.strace.io,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v7 2/6] syscall.h: add syscall_set_arguments()
Message-ID: <20250409231802.GA31728@strace.io>
References: <20250303111910.GA24170@strace.io>
 <20250303112009.GC24170@strace.io>
 <20250408213131.GA2872426@ax162>
 <20250408223611.GA26876@strace.io>
 <20250409003803.GA2876360@ax162>
 <20250409064017.GA30836@strace.io>
 <20250409155207.GA1506425@ax162>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409155207.GA1506425@ax162>

On Wed, Apr 09, 2025 at 08:52:07AM -0700, Nathan Chancellor wrote:
> On Wed, Apr 09, 2025 at 09:40:18AM +0300, Dmitry V. Levin wrote:
> > On Tue, Apr 08, 2025 at 05:38:03PM -0700, Nathan Chancellor wrote:
> > > diff --git a/arch/riscv/include/asm/syscall.h b/arch/riscv/include/asm/syscall.h
> > > index a5281cdf2b10..34313387f977 100644
> > > --- a/arch/riscv/include/asm/syscall.h
> > > +++ b/arch/riscv/include/asm/syscall.h
> > > @@ -69,8 +69,11 @@ static inline void syscall_get_arguments(struct task_struct *task,
> > >  					 unsigned long *args)
> > >  {
> > >  	args[0] = regs->orig_a0;
> > > -	args++;
> > > -	memcpy(args, &regs->a1, 5 * sizeof(args[0]));
> > > +	args[1] = regs->a1;
> > > +	args[2] = regs->a2;
> > > +	args[3] = regs->a3;
> > > +	args[4] = regs->a4;
> > > +	args[5] = regs->a5;
> > >  }
> > >  
> > >  static inline void syscall_set_arguments(struct task_struct *task,
> > > @@ -78,8 +81,11 @@ static inline void syscall_set_arguments(struct task_struct *task,
> > >  					 const unsigned long *args)
> > >  {
> > >  	regs->orig_a0 = args[0];
> > > -	args++;
> > > -	memcpy(&regs->a1, args, 5 * sizeof(regs->a1));
> > > +	regs->a1 = args[1];
> > > +	regs->a2 = args[2];
> > > +	regs->a3 = args[3];
> > > +	regs->a4 = args[4];
> > > +	regs->a5 = args[5];
> > >  }
> > >  
> > >  static inline int syscall_get_arch(struct task_struct *task)
> > 
> > Looks good, thanks.  How do we proceed from this point?
> 
> I can send a standalone patch for syscall_get_arguments() since that is
> an issue present before your series then Andrew could fold in the same
> change for syscall_set_arguments() into your change that introduces it
> so there is no bisect problem?

Fine with me.  Thanks for taking care of this issue.


-- 
ldv
