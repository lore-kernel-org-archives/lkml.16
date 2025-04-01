Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948091EF080
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517879; cv=none; b=VG9oRTUbhcSWUEQci/N261rC/R/CXRBKbflaD3MvByorCmmStbCaCnTZiGBc8ssXMNkYx9O3tQa6fpwgwDxJAqHZmq29RHeQA4T1d4NAXuxV+jP2Eqk9/XOlsA05FdbfG6e2Q1eqKbWLrOnwQb5LG4tVBbez2hvouKO+MW1yjpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517879; c=relaxed/simple;
	bh=18IeR1ekHGJZ8yk9600mS83HpSem7+tDvDDU05xFpOw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Vps3/yVvpP7EwBbUBPbjftY6CGr1rAD3N0jriwXjLhbNk7IkF/cKs9AlL54Xu+WERnnPvzJ9zf/8TUFXIM3AWF0W0mmdts0FdxC8PdzOQQxdIOUfi8ihnnvSCwSFxeT5EekiAAKgQI2dXWwCu4UTLS0F1pk/4KIRwzOi9e9w5d8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=N3XPXC12; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="N3XPXC12"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=bKyAJhmkZ6FPooiWcqmZl7AUsJfz/8gnfhB+fTUxcpU=; b=N3XPXC12FcYqAIMbgi2TXCI9JY
	O6QXp3+k/JCIAXdmT8qYxAp2Yu1x3qXVUYPPXr2Jj/JjZwzj+9BWAYC1k8ZWAzvYqj6/SMQ4ZGQjP
	f39AdvibwohGMRvwp1xjVBlZUmZmJ3NDtZWU85rhEfRuWjkyeb4tqVzmwmPFR3rPApZVz8nxScGl+
	WvZCGk4q5NlYzT+FQn2fJjYIrmuuearq0KzLYcbBIaaZPwDrY0ZYcO/0Lu2uF2LqO579bZZDOu+lf
	cRTLs+IJiiHecFECqt4QzvCeK2Lv56GvZElRlTQTXaxjWtoFYXu04L7pAex0Cg+/nKIC73l5KlIi6
	j+0YvVtQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by desiato.infradead.org with esmtpsa (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzce3-00000006pao-2ojw;
	Tue, 01 Apr 2025 14:31:15 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id 4089430049D; Tue,  1 Apr 2025 16:31:15 +0200 (CEST)
Date: Tue, 1 Apr 2025 16:31:15 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2 00/49] Simplify, reorganize and clean up the x86
 text-patching code (alternative.c)
Message-ID: <20250401143115.GG5880@noisy.programming.kicks-ass.net>
References: <20250328132704.1901674-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250328132704.1901674-1-mingo@kernel.org>

On Fri, Mar 28, 2025 at 02:26:15PM +0100, Ingo Molnar wrote:
> This series has 3 main parts:
> 
> (1)
> 
> The first part of this series performs a thorough text-patching API namespace
> cleanup discussed with Linus for the -v1 series:
> 
> 	# boot/UP APIs & single-thread helpers:
> 
> 						text_poke()
> 						text_poke_kgdb()
> 	[ unchanged APIs: ]			text_poke_copy()
> 						text_poke_copy_locked()
> 						text_poke_set()
> 
> 						text_poke_addr()
> 
> 	# SMP API & helpers namespace:
> 
> 	text_poke_bp()			=>	smp_text_poke_single()
> 	text_poke_loc_init()		=>	__smp_text_poke_batch_add()
> 	text_poke_queue()		=>	smp_text_poke_batch_add()
> 	text_poke_finish()		=>	smp_text_poke_batch_finish()
> 
> 	text_poke_flush()		=>	[removed]
> 
> 	text_poke_bp_batch()		=>	smp_text_poke_batch_process()
> 	poke_int3_handler()		=>	smp_text_poke_int3_trap_handler()
>         text_poke_sync()		=>	smp_text_poke_sync_each_cpu()
> 

Not sure I like that; smp_text_poke_ is a bit of a mouth full, esp. if
you're then adding even more text.

Do we really need function names this long?
