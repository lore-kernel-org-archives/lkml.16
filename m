Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25B2327E1C6
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 10:31:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744281068; cv=none; b=Ruxt0qnSjZI+BwLPipzRF/8wFZbSqmnRl+arUB7Ji9lysLHMD/C5O2IZppkZZeUaYMuJeQC7zxCxqveZtYxKM/HU47l0jBB8jyzo2z7uk+HymF+TGnbG9MBfch3BvrVIYBSrJxHHCsCzDW1b5v1eoejx2eI/UNQH5OBRbCv5hY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744281068; c=relaxed/simple;
	bh=Vg4ynFcgUBYJLZEDJ/mLI7/9RsyjCdLuIqSl6lvAO1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BBVXLhk9Dd4ohWhzMhCDaSnAo02i2KhKb+bu5vyqh9ufiizuoZGrEJoGT93ioiKfqIWPmIDpa1ayy3IItR0oEryhhl4PyPV3YQPZdzs7sDHvi08EP0j+Y9lHBf6u9r0u54HT/IrJ1DevtEWm/vQeCK8/HCdUq5zJEzIVvRHIAtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=kdBVSzFF; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="kdBVSzFF"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=UMUfnJdf5KFbpQaQzm1uZ77FKQG/pVMB+lixZv+TTQw=; b=kdBVSzFFm1wRzkp2Zz3TT5H497
	vq3mqHjVVHh3un5cG8nTjYuuHOSjlOZYR04B9CxXKNGklIxSi45dA0qmxyRQd4DsoktpcmPPgM99V
	U8DvQOoJik71z1SJl+sj3g7YfbVMWi0QeKBT/2coLAFNOBzHxCkX8xyQHQ3sfBQxr2Po8jTkAaSxj
	rxEqBuaks4Lq4+WeWHPo3ehiANWGo8NUFvjIR4t61By93vOLsV7A3Ud0gc/bUWnBlrCGCFzMV1pfS
	mhO5RdBGiP2KQszeobt26LrBi7R3n+yieIryvnrsyQC+Dr7vDNixFohracMkrfSeHgoD5pWWXVg22
	NxwdopVw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2pBR-00000002l0X-2AsE;
	Thu, 10 Apr 2025 10:30:58 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C5B203003C4; Thu, 10 Apr 2025 12:30:57 +0200 (CEST)
Date: Thu, 10 Apr 2025 12:30:57 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>, Brian Gerst <brgerst@gmail.com>,
	Borislav Petkov <bp@alien8.de>, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Andy Lutomirski <luto@kernel.org>,
	Fenghua Yu <fenghua.yu@intel.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Uros Bizjak <ubizjak@gmail.com>
Subject: Re: [PATCH 4/8] x86/fpu: Remove the thread::fpu pointer
Message-ID: <20250410103057.GE30687@noisy.programming.kicks-ass.net>
References: <20250409211127.3544993-1-mingo@kernel.org>
 <20250409211127.3544993-5-mingo@kernel.org>
 <20250410073948.GT9833@noisy.programming.kicks-ass.net>
 <Z_eZMN4PcOwFnskB@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z_eZMN4PcOwFnskB@gmail.com>

On Thu, Apr 10, 2025 at 12:10:56PM +0200, Ingo Molnar wrote:
> 
> * Peter Zijlstra <peterz@infradead.org> wrote:
> 
> > On Wed, Apr 09, 2025 at 11:11:23PM +0200, Ingo Molnar wrote:
> > 
> > > diff --git a/arch/x86/include/asm/processor.h b/arch/x86/include/asm/processor.h
> > > index 5ea7e5d2c4de..b7f7c9c83409 100644
> > > --- a/arch/x86/include/asm/processor.h
> > > +++ b/arch/x86/include/asm/processor.h
> > > @@ -514,12 +514,9 @@ struct thread_struct {
> > >  
> > >  	struct thread_shstk	shstk;
> > >  #endif
> > > -
> > > -	/* Floating point and extended processor state */
> > > -	struct fpu		*fpu;
> > >  };
> > >  
> > > -#define x86_task_fpu(task) ((task)->thread.fpu)
> > > +#define x86_task_fpu(task)	((struct fpu *)((void *)(task) + sizeof(*(task))))
> > 
> > Doesn't our FPU state need to be cacheline aligned?
> 
> Yeah, and we do have a check for that:
> 
> +       BUILD_BUG_ON(sizeof(*dst) % SMP_CACHE_BYTES != 0);

Ah, missed that. Clearly I need to improve my reading skillz :-)
