Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC85D1E520E
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 20:51:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744231884; cv=none; b=rpt2LKMrSt974kDkZEU2tE/9lmcS5rKJuOBDnwqHbjbHXDuD9bIQNYKlh1tUvuLxYc9CAVXAsa1W+lMDkqpHEUABx9mAdsQKs4aAlSrZQzTHgCkq8OX7QQdHmSaFWqjHFy4SLcB+3iqVHBwoYRDvWy0bxrpQw4u2WjXWzANrJ38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744231884; c=relaxed/simple;
	bh=RSLfd+LxMooRVZha3pvRai4GBMVb5AFMmhlmpw0UML8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mcFOqIz0isWk2pqhrMuHpPhNSHVrGAvN0ToQd4jFnmMQ2H+RDnmUHId0a/SHXDfr/zCsuYRKO3nK5JiDl0RMbawESR+xRaYSddoHZjIzfL6pP3Oso89a0pRKCyDilNk3BbaLEopaWBmJoIZcEXzb5czpOxfP1VNXAJzu8ngT8Co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tbiWRx3f; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tbiWRx3f"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B8EDDC4CEE9;
	Wed,  9 Apr 2025 20:51:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744231883;
	bh=RSLfd+LxMooRVZha3pvRai4GBMVb5AFMmhlmpw0UML8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tbiWRx3frXCYEvCSN9QwUazV1ueSeVFhUVnt89ktxMkZpoA4LrfjzTTtj+9TuoXdC
	 cxV2QuyeEN5ABpU/HHF8mBAy8ix76WaO1V+oIUXoQd0GLZw/xWFeLjMQ41MXigl1bH
	 ZPuj5Q3y+IGAotJ12uHb93pK12+c3aEamvBNc8sakMYqmyNGVIh4V6EpSfZkwpB2UI
	 0lAsRavHYZBsNQuPW12cG+wBmSOQhy2mCOxYYLKe0Qyzw0LJtQZp81uxctdLu99Qw7
	 K1ijWILQUFH1ixFl15ZOv71zNvMZINlSxWamK1cZQy4OtuyvAmYCtCPSg0MejBYnEO
	 sk0oeI3NbtRUQ==
Date: Wed, 9 Apr 2025 22:51:18 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH -v2 00/49] Simplify, reorganize and clean up the x86
 text-patching code (alternative.c)
Message-ID: <Z_bdxrahsyB5wrg8@gmail.com>
References: <20250328132704.1901674-1-mingo@kernel.org>
 <20250401143115.GG5880@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250401143115.GG5880@noisy.programming.kicks-ass.net>


* Peter Zijlstra <peterz@infradead.org> wrote:

> On Fri, Mar 28, 2025 at 02:26:15PM +0100, Ingo Molnar wrote:
> > This series has 3 main parts:
> > 
> > (1)
> > 
> > The first part of this series performs a thorough text-patching API namespace
> > cleanup discussed with Linus for the -v1 series:
> > 
> > 	# boot/UP APIs & single-thread helpers:
> > 
> > 						text_poke()
> > 						text_poke_kgdb()
> > 	[ unchanged APIs: ]			text_poke_copy()
> > 						text_poke_copy_locked()
> > 						text_poke_set()
> > 
> > 						text_poke_addr()
> > 
> > 	# SMP API & helpers namespace:
> > 
> > 	text_poke_bp()			=>	smp_text_poke_single()
> > 	text_poke_loc_init()		=>	__smp_text_poke_batch_add()
> > 	text_poke_queue()		=>	smp_text_poke_batch_add()
> > 	text_poke_finish()		=>	smp_text_poke_batch_finish()
> > 
> > 	text_poke_flush()		=>	[removed]
> > 
> > 	text_poke_bp_batch()		=>	smp_text_poke_batch_process()
> > 	poke_int3_handler()		=>	smp_text_poke_int3_trap_handler()
> >         text_poke_sync()		=>	smp_text_poke_sync_each_cpu()
> > 
> 
> Not sure I like that; smp_text_poke_ is a bit of a mouth full, esp. if
> you're then adding even more text.
> 
> Do we really need function names this long?

So they are still shorter than:

    perf_scope_cpu_topology_cpumask()
    perf_swevent_put_recursion_context() 
    perf_event_max_sample_rate_handler() 
    perf_unregister_guest_info_callbacks()

;-)

I think we could trim the longest one via:

  s/smp_text_poke_int3_trap_handler
   /smp_text_poke_int3_handler

Because 'INT3 handler' is more than specific enough?

But in general, function name length is less critical for 'complex', 
non-library APIs that are called in a pretty flat fashion, especially 
if they have no error returns.

Here's how they are used today, after the rename:

	smp_text_poke_sync_each_cpu();
		smp_text_poke_sync_each_cpu();
		smp_text_poke_sync_each_cpu();
		smp_text_poke_batch_finish();
	__smp_text_poke_batch_add(addr, opcode, len, emulate);
	__smp_text_poke_batch_add(addr, opcode, len, emulate);
	smp_text_poke_batch_finish();
	smp_text_poke_batch_finish();
		smp_text_poke_batch_add((void *)ip, new_code, MCOUNT_INSN_SIZE, NULL);
	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
		smp_text_poke_batch_add((void *)rec->ip, new, MCOUNT_INSN_SIZE, NULL);
	smp_text_poke_batch_finish();
	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
	smp_text_poke_single((void *)ip, new, MCOUNT_INSN_SIZE, NULL);
	smp_text_poke_single((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
	smp_text_poke_batch_add((void *)jump_entry_code(entry), jlp.code, jlp.size, NULL);
	smp_text_poke_batch_finish();
	smp_text_poke_sync_each_cpu();
	smp_text_poke_sync_each_cpu();
		smp_text_poke_single(op->kp.addr, insn_buff, JMP32_INSN_SIZE, NULL);
	smp_text_poke_sync_each_cpu();
	smp_text_poke_sync_each_cpu();
		smp_text_poke_sync_each_cpu();
	smp_text_poke_single(insn, code, size, emulate);
		smp_text_poke_single(ip, new_insn, X86_PATCH_SIZE, NULL);

Note how there's no error return, no conditionals, just flat calls.

And note how easy it was to do a 'git grep smp_text_poke_' to get such 
an overview. ;-)

Anyway, any other suggestions for shorter names, or can I proceed with 
these plus the above shortening of the trap handler name?

Thanks,

	Ingo
