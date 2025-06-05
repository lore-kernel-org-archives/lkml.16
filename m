Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC0515746F
	for <linux-kernel@vger.kernel.org>; Thu,  5 Jun 2025 14:59:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749135564; cv=none; b=mZUHd7woX4rlNKvCXA4kxu18SleWaMFjYqqBmTDSSxND3O321/7g/8KUKvjGHnFxLLt9wkBQP7AIfHxjfMXCDxOIPNc+0pQdhyulOxRxosHQ3kkLo5V/uy1UMVdrw7Id4SK+epSOzu5Td3529OMapCunT9GYySAV5B0nSoTCnAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749135564; c=relaxed/simple;
	bh=jt/cZ+gHNJcLY5mjxc8kuMNE5E+k0jmmWb9H4hoNLB8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jdopj+YDU827qTIUwxM+5cKKTc650lMSez12mB8bpNq1B3u/b5zVw1KifX0lJkimjgb2o5XKiI21P6IHPyhjvuCYpgQiqCY47V1rL71RWEX/A8efeGZ+Jc8z+yTx0Qm8BXgQxs7z6/DqlgyrzjVhAqXftUBx1Pc7CjjzWNkwIQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=AYogUAzc; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="AYogUAzc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=VvmJ8LhVllsmdM3M4qz7Qt91w1390YDNFAYS9tuDu2A=; b=AYogUAzcrkhNbmUYnVXSESdxUv
	VNAn0KjLHgXU3K0Hv5PpAthEKZU9vMxIqwJtc/JD49hucVkroaSVeyfAXWfA2g16i+Vo+5uNQwicr
	VrOt6k3anlgo1uln6aQn5cVdMz6w4KTYZ+udMiV9hDioW9dw7QJXKNSHheK6qMKch3q/DQSHxap5g
	srAaLUxSWOVshki04+jXC05V5uuFkDE1ChaOUqMU7g7crTMLI0mk9BW70L6BZqxCOTs3C+wPqkFGB
	dHsDaqIXKhxmX5z7+DPKnhpX8Gjpob5bU62SVU1uLE5AUY2EcQUEZC6G19ULWGYn9/27m8COv/Xf4
	Z/IOzP6Q==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uNC3n-00000004LiS-1hQE;
	Thu, 05 Jun 2025 14:59:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id EF4FF3005AF; Thu,  5 Jun 2025 16:59:14 +0200 (CEST)
Date: Thu, 5 Jun 2025 16:59:14 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Dave Hansen <dave.hansen@intel.com>
Cc: Kai Huang <kai.huang@intel.com>, tglx@linutronix.de, bp@alien8.de,
	mingo@redhat.com, hpa@zytor.com, kirill.shutemov@linux.intel.com,
	rick.p.edgecombe@intel.com, x86@kernel.org, samitolvanen@google.com,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] x86/virt/tdx: Add ENDBR for low level SEAMCALL assembly
 functions
Message-ID: <20250605145914.GW39944@noisy.programming.kicks-ass.net>
References: <20250604003848.13154-1-kai.huang@intel.com>
 <20250605140739.GS39944@noisy.programming.kicks-ass.net>
 <20250605142124.GT39944@noisy.programming.kicks-ass.net>
 <ae0adccd-25d2-4dd3-b1b9-f7ba0c13367c@intel.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ae0adccd-25d2-4dd3-b1b9-f7ba0c13367c@intel.com>

On Thu, Jun 05, 2025 at 07:54:48AM -0700, Dave Hansen wrote:
> On 6/5/25 07:21, Peter Zijlstra wrote:
> > -static inline u64 sc_retry(sc_func_t func, u64 fn,
> > -			   struct tdx_module_args *args)
> > +static __always_inline u64 sc_retry(const sc_func_t func, u64 fn,
> > +				    struct tdx_module_args *args)
> >  {
> >  	int retry = RDRAND_RETRY_LOOPS;
> 
> Practically, I can see how this works. If the compiler doesn't inline
> sc_retry(), it stops being able to guarantee that the function pointer
> value is known.
> 
> My only worry is that the compiler decides to be stupid for some other
> reason, it could start generating indirect calls again.
> 
> Are we confident that __always_inline will keep the compiler from
> generating indirect calls?

Fairly sure. I've used this elsewhere too.

Also, if it ever decides to be that stupid, I'm going to log a bug and
call it broken.
