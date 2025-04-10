Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AA662A8C1
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 07:31:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744270274; cv=none; b=eQTBMJJo6Z92YcSvSN0ShfIxcnda9U1je98QDfE4G5mkOujluxXdrfLrCGB0UvP+C7y3oXEdmwYSeY2eqMTmnOzISNbxF2QB9mZtTZetUtsl7tsqeY+yPmLtNcg8aZmK6h7uLocPTHynwIoR75XGBX7Qbj5vnmV09kNhKP6ib5M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744270274; c=relaxed/simple;
	bh=O9SKMc3mxvMEK+Nr0d+TGWyr+wDX8pqQ3+eJOrzSuiQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F+UTgWnVp+AnHz7hseA8lrmf/X+1/n1foB5mCcUmTr1fnyn9woCWlizytnjWpSXT8tG6n2ySj7rGPO3mx6bv9CHqBq0LGov+5uoZJnltrvEGZXbc7GSQq6AA/UJTGKsXIw9JIpz6z/6blguMJ56CSt3G0mxz2bdI4FgV0WvlnGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=a2555q3m; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="a2555q3m"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ou7lB6hxNQI+3XpnxH4z+mXX/Bc+b+6P3IC4LgxM5zU=; b=a2555q3mGBrH0tczJfEiCmNIyy
	doL0XXKFl4zE+j6DevGS3R2h15nU2AJ20kJE4oQtydwv8c6LJCTeFW4lyaT8BndSnkTcXucyPpZNR
	6q4kEPMhhpDelu9kBbO1qGvwgFw8sJ9AfrxBsUNkizM8h49xehGCOAN7cyh5D10MfWfto9VCKr+dL
	PQxg+9pEHph0KKVkSLrZS5koa+kQnniq0yOoM+DviGYpwyg5sGN+BBaG98tNDJNOi5ElfSMkbWte/
	kfKE/epa+MplTNLwB1UY3TaCYjEJL6kjGdbaea693du6Pnw4F/4prxUtHpG356Grh798cegE5fOQ0
	UARrfiIQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2mNP-00000002YmB-0xu7;
	Thu, 10 Apr 2025 07:31:07 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 419F83003C4; Thu, 10 Apr 2025 09:31:07 +0200 (CEST)
Date: Thu, 10 Apr 2025 09:31:07 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Dave Hansen <dave.hansen@intel.com>, Xin Li <xin@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH 00/20] x86 MSR in-kernel API type cleanup and rename
Message-ID: <20250410073107.GS9833@noisy.programming.kicks-ass.net>
References: <20250409202907.3419480-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409202907.3419480-1-mingo@kernel.org>

On Wed, Apr 09, 2025 at 10:28:47PM +0200, Ingo Molnar wrote:

> Ingo Molnar (20):
>   x86/msr: Standardize on u64 in <asm/msr.h>
>   x86/msr: Standardize on u64 in <asm/msr-index.h>
>   x86/msr: Use u64 in rdmsrl_amd_safe() and wrmsrl_amd_safe()
>   x86/msr: Use u64 in rdmsrl_safe() and paravirt_read_pmc()
>   x86/msr: Harmonize the prototype and definition of do_trace_rdpmc()
>   x86/msr: Standardize on 'u32' MSR indices in <asm/msr.h>

Yay, thanks!

>   x86/msr: Rename 'rdmsrl()' to 'rdmsrq()'
>   x86/msr: Rename 'wrmsrl()' to 'wrmsrq()'
>   x86/msr: Rename 'rdmsrl_safe()' to 'rdmsrq_safe()'
>   x86/msr: Rename 'wrmsrl_safe()' to 'wrmsrq_safe()'
>   x86/msr: Rename 'rdmsrl_safe_on_cpu()' to 'rdmsrq_safe_on_cpu()'
>   x86/msr: Rename 'wrmsrl_safe_on_cpu()' to 'wrmsrq_safe_on_cpu()'
>   x86/msr: Rename 'rdmsrl_on_cpu()' to 'rdmsrq_on_cpu()'
>   x86/msr: Rename 'wrmsrl_on_cpu()' to 'wrmsrq_on_cpu()'
>   x86/msr: Rename 'mce_rdmsrl()' to 'mce_rdmsrq()'
>   x86/msr: Rename 'mce_wrmsrl()' to 'mce_wrmsrq()'
>   x86/msr: Rename 'rdmsrl_amd_safe()' to 'rdmsrq_amd_safe()'
>   x86/msr: Rename 'wrmsrl_amd_safe()' to 'wrmsrq_amd_safe()'
>   x86/msr: Rename 'native_wrmsrl()' to 'native_wrmsrq()'
>   x86/msr: Rename 'wrmsrl_cstar()' to 'wrmsrq_cstar()'

I'm so going to be typo-ing this for a while, but yeah, I suppose these
are better names.

Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>	
