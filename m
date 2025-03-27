Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F25841C85
	for <linux-kernel@vger.kernel.org>; Thu, 27 Mar 2025 20:54:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743108841; cv=none; b=fTb+9V1yvi6DWpmU5GJ2Zv3TPgiC4FO8+QCqeBTQB2xeylH0OdrBCLOwlM5ZMbSDeHTDcAai/xHft5PfaXoo0dqhvwYPcAQw4RLrZs4Nj2iysH7KbDPUTJt9udnXCp5RQGBOJB3l/XUCFehIB8Eoark8AQbN5L4ol4EDUyuzR6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743108841; c=relaxed/simple;
	bh=7sNprhdBQwIEpHoBp4i7JEZpyqBZhsZqv6iB1XYiO2M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tHTj50aLb3wjPd5A5IaeMri0gbgtFdZ1mOqpfC1F9w5cokH/nM8rMap8WeIsmANp4ibPzl5y4g807NsyZP+5gA94MIU4UPiK2caKp/0XZCspfhgMZjA9b8Q+QEAOQycr53pUZHVEiva6k7pPAOLU+A72ou0MLdbnLJItpv6qNbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GzI7HU6B; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GzI7HU6B"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D0B3EC4CEDD;
	Thu, 27 Mar 2025 20:53:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743108840;
	bh=7sNprhdBQwIEpHoBp4i7JEZpyqBZhsZqv6iB1XYiO2M=;
	h=From:To:Cc:Subject:Date:From;
	b=GzI7HU6B27p5Rplc1a5WDsYubRuJa0MV4CfwPfEwHq8VLLJVmvxA1S6zReKE6eKS1
	 CsFNmb7Is2SDo9Xzzqmo/LQ0OSV8+MXAEeg5PT6xtgz6MM8OyFG7czacYcwwxjbMCR
	 ZQJScflIiaUBuoKAqqJN6gUhTQ/O8CxD5nR790iKd01iIPnHrCwbcz4L/ZwLN+RkC5
	 kTIZ5dV8Mp4u0O0C+ILXBLXup7RUXHnoMT3+it3os/+bn82Gr3v0POAQZ53z/4385I
	 i5ZL/HFtMCuQgSirXaKdwvVdwTRNX4xQ4d0Z9Nm1TNRpnPPvS1dMkCx2IsIbwndckN
	 UuxKfBAgpgyJg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH 00/41] Simplify, reorganize and clean up the x86 INT3 based batch-patching code (alternative.c)
Date: Thu, 27 Mar 2025 21:53:13 +0100
Message-ID: <20250327205355.378659-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series has 3 main parts:

(1)

The first part of this series performs a thorough text-patching API namespace
cleanup discussed with Peter Zijlstra:

	https://lore.kernel.org/r/20250325123119.GL36322@noisy.programming.kicks-ass.net

Non-SMP APIs retain their existing text_poke*() namespace:

	text_poke()
	text_poke_sync_each_cpu()
	text_poke_kgdb()
	text_poke_copy()
	text_poke_copy
	text_poke_copy_locked()
	text_poke_set()

The SMP text-patching APIs had 3 separate prefixes:

	text_poke_
	text_poke_bp_
	poke_int3_

These get standardized to the single text_poke_int3*() namespace:

	text_poke_addr()	=> text_poke_int3_addr()
	poke_int3_handler()	=> text_poke_int3_handler()
	text_poke_bp_batch()	=> text_poke_int3_batch_process()
	text_poke_loc_init()	=> text_poke_int3_loc_add()
	text_poke_flush()	=> text_poke_int3_finish()
	text_poke_finish()	=> text_poke_int3_flush()
	text_poke_queue()	=> text_poke_int3_queue()
	text_poke_bp()		=> text_poke_int3_now()

(2)

The second part of the series simplifies and standardizes the SMP batch-patching
data & types namespace, around the new tp_array* namespace:

	int3_patching_desc	=> [removed]
	temp_mm_state_t		=> [removed]
	try_get_desc()		=> [removed]
	put_desc()		=> [removed]

	tp_vec,tp_vec_nr	=> tp_array
	int3_refs		=> tp_array_refs

(3)

The third part of the series contains additional patches, that
together with the data-namespace simplification changes remove
about 3 layers of unnecessary indirections and simplify/streamline
various aspects of the code:

	[PATCH] x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
	[PATCH] x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
	[PATCH] x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from text_poke_int3_finish()/text_poke_int3_flush()/tp_addr_ordered()
	[PATCH] x86/alternatives: Simplify text_poke_int3() by using tp_vec and existing APIs
	[PATCH] x86/alternatives: Introduce 'struct text_poke_int3_array' and move tp_vec and tp_vec_nr to it
	[PATCH] x86/alternatives: Remove the tp_vec indirection
	[PATCH] x86/alternatives: Simplify try_get_tp_array()
	[PATCH] x86/alternatives: Simplify text_poke_int3_handler()
	[PATCH] x86/alternatives: Simplify text_poke_int3_batch()
	[PATCH] x86/alternatives: Move the tp_array manipulation into text_poke_int3_loc_init() and rename it to text_poke_int3_loc_add()
	[PATCH] x86/alternatives: Move tp_array completion from text_poke_int3_finish() and text_poke_int3_flush() to text_poke_int3_batch_process()
	[PATCH] x86/alternatives: Simplify tp_addr_ordered()

Various APIs also had their names clarified, as part of the renames.
I also added comments where justified.

There's almost no functional changes in the end, other than
mixed text_poke_int3_now() & text_poke_int3_queue() calls
are now probably working better than before - although I'm not
aware of such in-tree usage at the moment.

After these changes there's a reduction of about ~20 lines of
code if we exclude comments, and some reduction in text size:

   text       data        bss        dec        hex    filename
  13637       1009       4112      18758       4946    arch/x86/kernel/alternative.o.before
  13549       1009       4156      18714       491a    arch/x86/kernel/alternative.o.after

But the main goal was to perform a thorough round of source code TLC,
to make the code easier to read & maintain, and to remove a chunk
of technical debt accumulated incrementally over 20 years, which
improvements are only partly reflected in line count and code size decreases.

Lightly tested only.

This tree can also be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip WIP.x86/alternatives

Thanks,

    Ingo

================>

Ingo Molnar (41):
  x86/alternatives: Rename 'struct bp_patching_desc' to 'struct int3_patching_desc'
  x86/alternatives: Rename 'bp_refs' to 'int3_refs'
  x86/alternatives: Rename 'text_poke_bp_batch()' to 'text_poke_int3_batch()'
  x86/alternatives: Rename 'text_poke_bp()' to 'text_poke_int3()'
  x86/alternatives: Rename 'poke_int3_handler()' to 'text_poke_int3_handler()'
  x86/alternatives: Rename 'poking_mm' to 'text_poke_mm'
  x86/alternatives: Rename 'text_poke_addr' to 'text_poke_int3_addr'
  x86/alternatives: Rename 'poking_addr' to 'text_poke_addr'
  x86/alternatives: Rename 'bp_desc' to 'int3_desc'
  x86/alternatives: Remove duplicate 'text_poke_early()' prototype
  x86/alternatives: Update comments in int3_emulate_push()
  x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
  x86/alternatives: Rename 'text_poke_flush()' to 'text_poke_int3_flush()'
  x86/alternatives: Rename 'text_poke_finish()' to 'text_poke_int3_finish()'
  x86/alternatives: Rename 'text_poke_queue()' to 'text_poke_int3_queue()'
  x86/alternatives: Rename 'text_poke_loc_init()' to 'text_poke_int3_loc_init()'
  x86/alternatives: Rename 'struct text_poke_loc' to 'struct text_poke_int3_loc'
  x86/alternatives: Rename 'struct int3_patching_desc' to 'struct text_poke_int3_vec'
  x86/alternatives: Rename 'int3_desc' to 'int3_vec'
  x86/alternatives: Add text_mutex) assert to text_poke_int3_flush()
  x86/alternatives: Assert that text_poke_int3_handler() can only ever handle 'tp_vec[]' based requests
  x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
  x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from text_poke_int3_finish()/text_poke_int3_flush()/tp_addr_ordered()
  x86/alternatives: Simplify text_poke_int3() by using tp_vec and existing APIs
  x86/alternatives: Assert input parameters in text_poke_int3_batch()
  x86/alternatives: Introduce 'struct text_poke_int3_array' and move tp_vec and tp_vec_nr to it
  x86/alternatives: Remove the tp_vec indirection
  x86/alternatives: Rename 'try_get_desc()' to 'try_get_tp_array()'
  x86/alternatives: Rename 'put_desc()' to 'put_tp_array()'
  x86/alternatives: Simplify try_get_tp_array()
  x86/alternatives: Simplify text_poke_int3_handler()
  x86/alternatives: Simplify text_poke_int3_batch()
  x86/alternatives: Rename 'text_poke_int3_batch()' to 'text_poke_int3_batch_process()'
  x86/alternatives: Rename 'int3_refs' to 'tp_array_refs'
  x86/alternatives: Move the tp_array manipulation into text_poke_int3_loc_init() and rename it to text_poke_int3_loc_add()
  x86/alternatives: Remove the mixed-patching restriction on text_poke_int3()
  x86/alternatives: Rename 'text_poke_int3()' to 'text_poke_int3_now()'
  x86/alternatives: Add documentation for text_poke_int3_queue()
  x86/alternatives: Move tp_array completion from text_poke_int3_finish() and text_poke_int3_flush() to text_poke_int3_batch_process()
  x86/alternatives: Rename 'text_poke_sync()' to 'text_poke_sync_each_cpu()'
  x86/alternatives: Simplify tp_addr_ordered()

 arch/x86/include/asm/text-patching.h |  23 ++---
 arch/x86/kernel/alternative.c        | 255 ++++++++++++++++++++++++++++---------------------------
 arch/x86/kernel/ftrace.c             |  18 ++--
 arch/x86/kernel/jump_label.c         |   6 +-
 arch/x86/kernel/kprobes/core.c       |   4 +-
 arch/x86/kernel/kprobes/opt.c        |   6 +-
 arch/x86/kernel/module.c             |   2 +-
 arch/x86/kernel/static_call.c        |   2 +-
 arch/x86/kernel/traps.c              |   6 +-
 arch/x86/mm/init.c                   |  16 ++--
 arch/x86/net/bpf_jit_comp.c          |   2 +-
 11 files changed, 172 insertions(+), 168 deletions(-)

-- 
2.45.2

