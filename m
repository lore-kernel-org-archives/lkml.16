Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9205E1E835B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 05:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744350071; cv=none; b=UZ9yBw4oF3mPqeXJSfd91uYOrefwoR9B3BmGBMGN3BnYNiQ6KrNOqKeqUQwF4BaL/RziG3rU4xxauKPXPt9og1MsPzZSXWcUzY9nSgewWLMGpnSRqLd3VRm6Jr8TRFFn/aVelbWaCxYx5sRAHiI3n3eDqzL/DqvKkp4QFjQWkOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744350071; c=relaxed/simple;
	bh=oGxswkkC7eZnNSbPQaNqTnx3m9Tm+aXTjNJjB7KZHOw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Z9jF+DGWanBAMuK0gtvQ/r+ICHBeiZ+FiyZr1EQ2pOepqrDY0eQvI8TbpcxGoHIO/J0AL2EzG+4+e83pGAGaw69jZjRkuF0/MsFIHwnSdEAqT6kJXuhLMAVIcfltgzrHCmtS4821GuF/PVtJrYa//n5CpzLDb+HafgkBkgPOiMc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNDH19+h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNDH19+h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20C00C4CEE2;
	Fri, 11 Apr 2025 05:41:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744350071;
	bh=oGxswkkC7eZnNSbPQaNqTnx3m9Tm+aXTjNJjB7KZHOw=;
	h=From:To:Cc:Subject:Date:From;
	b=lNDH19+heiTG9mq0VRMPjecNLEf9ZXfZh4rLhxg7fY8/A7kLQm/otGUV35D8WSmAt
	 WUZezf13MH1CZO+PJrl+ib3GVJvBWsbeIcV/5Ymtdf4Zz3CAW0JZvEiFc/tM+o6k10
	 F2Sw4Ptqyy/Mm5uVPoOng79/+maoL8UQtK1HQofv2dOIRbhjQR+aApaFY0Nrwpfa7t
	 hDVXLSvsJUi4y27CFNbhSk56/LkBVb3j6LjOSVBvNBInhhFKJkyNaeFXh9ydYi3HGx
	 xII07lCL8FDI41QhwyOfO+9cmlqEStH2nJOkwVib5hGOcVHnmX88OuZP/VOb4B+ZJo
	 dB2zJFZ450SqA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Juergen Gross <jgross@suse.com>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH -v3 00/53] Simplify, reorganize and clean up the x86 text-patching code (alternative.c)
Date: Fri, 11 Apr 2025 07:40:12 +0200
Message-ID: <20250411054105.2341982-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series has 3 major parts after pending x86.alternatives commits such as the
scalability improvement by Eric Dumazet:

(1)

The first major part of this series performs a thorough text-patching API namespace
cleanup discussed with Linus for the -v1 series:

	# boot/UP APIs & single-thread helpers:

						text_poke()
						text_poke_kgdb()
	[ unchanged APIs: ]			text_poke_copy()
						text_poke_copy_locked()
						text_poke_set()

						text_poke_addr()

	# SMP API & helpers namespace:

	text_poke_bp()			=>	smp_text_poke_single()
	text_poke_loc_init()		=>	__smp_text_poke_batch_add()
	text_poke_queue()		=>	smp_text_poke_batch_add()
	text_poke_finish()		=>	smp_text_poke_batch_finish()

	text_poke_flush()		=>	[removed]

	text_poke_bp_batch()		=>	smp_text_poke_batch_process()
	poke_int3_handler()		=>	smp_text_poke_int3_handler()
        text_poke_sync()		=>	smp_text_poke_sync_each_cpu()


(2)

The second part of the series simplifies and standardizes the SMP batch-patching
data & types & accessors namespace, around the new text_poke_array* namespace:

	int3_patching_desc		=	[removed]
	temp_mm_state_t			=>	[removed]

	try_get_desc()			=>	try_get_text_poke_array()
	put_desc()			=>	put_text_poke_array()

	tp_vec,tp_vec_nr		=>	text_poke_array
	int3_refs			=>	text_poke_array_refs

	- All constants got moved into the TEXT_POKE_* namespace

	- All local variables and function parameters got standardized around
	  the 'tpl' naming scheme. No more toilet paper references. ;-)

(3)

The third part of the series contains additional patches, that
together with the data-namespace simplification changes remove
about 3 layers of unnecessary indirections and simplify/streamline
various aspects of the code:

	x86/alternatives: Remove duplicate 'text_poke_early()' prototype
	x86/alternatives: Update comments in int3_emulate_push()
	x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
	x86/alternatives: Add text_mutex) assert to smp_text_poke_batch_flush()
	x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
	x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from smp_text_poke_batch_finish()/smp_text_poke_batch_flush()/text_poke_addr_ordered()
	x86/alternatives: Simplify smp_text_poke_single() by using tp_vec and existing APIs
	x86/alternatives: Introduce 'struct smp_text_poke_array' and move tp_vec and tp_vec_nr to it
	x86/alternatives: Remove the tp_vec indirection
	x86/alternatives: Simplify try_get_text_poke_array()
	x86/alternatives: Simplify smp_text_poke_int3_trap_handler()
	x86/alternatives: Simplify smp_text_poke_batch_process()
	x86/alternatives: Move the text_poke_array manipulation into text_poke_int3_loc_init() and rename it to __smp_text_poke_batch_add()
	x86/alternatives: Remove the mixed-patching restriction on smp_text_poke_single()
	x86/alternatives: Document 'smp_text_poke_single()'
	x86/alternatives: Add documentation for smp_text_poke_batch_add()
	x86/alternatives: Move text_poke_array completion from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to smp_text_poke_batch_process()
	x86/alternatives: Simplify text_poke_addr_ordered()
	x86/alternatives: Constify text_poke_addr()
	x86/alternatives: Simplify and clean up patch_cmp()
	x86/alternatives: Standardize on 'tpl' local variable names for 'struct smp_text_poke_loc *'
	x86/alternatives: Simplify the #include section
	x86/alternatives: Move declarations of vmlinux.lds.S defined section symbols to <asm/alternative.h>
	x86/alternatives: Remove 'smp_text_poke_batch_flush()'
	x86/alternatives: Update the comments in smp_text_poke_batch_process()
        x86/alternatives: Rename 'apply_relocation()' to 'text_poke_apply_relocation()'
        x86/alternatives: Add comment about noinstr expectations
        x86/alternatives: Make smp_text_poke_batch_process() subsume smp_text_poke_batch_finish()

Various APIs also had their names clarified, as part of the renames.
I also added comments where justified.

There's almost no functional changes in the end, other than
mixed smp_text_poke_single() & smp_text_poke_batch_add() calls
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

This tree can be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip WIP.x86/alternatives

Thanks,

    Ingo

================>

Eric Dumazet (1):
  x86/alternatives: Improve code-patching scalability by removing false sharing in poke_int3_handler()

Ingo Molnar (50):
  x86/alternatives: Rename 'struct bp_patching_desc' to 'struct int3_patching_desc'
  x86/alternatives: Rename 'bp_refs' to 'int3_refs'
  x86/alternatives: Rename 'text_poke_bp_batch()' to 'smp_text_poke_batch_process()'
  x86/alternatives: Rename 'text_poke_bp()' to 'smp_text_poke_single()'
  x86/alternatives: Rename 'poke_int3_handler()' to 'smp_text_poke_int3_handler()'
  x86/alternatives: Rename 'poking_mm' to 'text_poke_mm'
  x86/alternatives: Rename 'poking_addr' to 'text_poke_mm_addr'
  x86/alternatives: Rename 'bp_desc' to 'int3_desc'
  x86/alternatives: Remove duplicate 'text_poke_early()' prototype
  x86/alternatives: Update comments in int3_emulate_push()
  x86/alternatives: Remove the confusing, inaccurate & unnecessary 'temp_mm_state_t' abstraction
  x86/alternatives: Rename 'text_poke_flush()' to 'smp_text_poke_batch_flush()'
  x86/alternatives: Rename 'text_poke_finish()' to 'smp_text_poke_batch_finish()'
  x86/alternatives: Rename 'text_poke_queue()' to 'smp_text_poke_batch_add()'
  x86/alternatives: Rename 'text_poke_loc_init()' to 'text_poke_int3_loc_init()'
  x86/alternatives: Rename 'struct text_poke_loc' to 'struct smp_text_poke_loc'
  x86/alternatives: Rename 'struct int3_patching_desc' to 'struct text_poke_int3_vec'
  x86/alternatives: Rename 'int3_desc' to 'int3_vec'
  x86/alternatives: Add text_mutex) assert to smp_text_poke_batch_flush()
  x86/alternatives: Use non-inverted logic instead of 'tp_order_fail()'
  x86/alternatives: Remove the 'addr == NULL means forced-flush' hack from smp_text_poke_batch_finish()/smp_text_poke_batch_flush()/text_poke_addr_ordered()
  x86/alternatives: Simplify smp_text_poke_single() by using tp_vec and existing APIs
  x86/alternatives: Assert that smp_text_poke_int3_handler() can only ever handle 'tp_vec[]' based requests
  x86/alternatives: Assert input parameters in smp_text_poke_batch_process()
  x86/alternatives: Introduce 'struct smp_text_poke_array' and move tp_vec and tp_vec_nr to it
  x86/alternatives: Remove the tp_vec indirection
  x86/alternatives: Rename 'try_get_desc()' to 'try_get_text_poke_array()'
  x86/alternatives: Rename 'put_desc()' to 'put_text_poke_array()'
  x86/alternatives: Simplify try_get_text_poke_array()
  x86/alternatives: Simplify smp_text_poke_int3_handler()
  x86/alternatives: Simplify smp_text_poke_batch_process()
  x86/alternatives: Rename 'int3_refs' to 'text_poke_array_refs'
  x86/alternatives: Move the text_poke_array manipulation into text_poke_int3_loc_init() and rename it to __smp_text_poke_batch_add()
  x86/alternatives: Remove the mixed-patching restriction on smp_text_poke_single()
  x86/alternatives: Document 'smp_text_poke_single()'
  x86/alternatives: Add documentation for smp_text_poke_batch_add()
  x86/alternatives: Move text_poke_array completion from smp_text_poke_batch_finish() and smp_text_poke_batch_flush() to smp_text_poke_batch_process()
  x86/alternatives: Rename 'text_poke_sync()' to 'smp_text_poke_sync_each_cpu()'
  x86/alternatives: Simplify text_poke_addr_ordered()
  x86/alternatives: Constify text_poke_addr()
  x86/alternatives: Simplify and clean up patch_cmp()
  x86/alternatives: Standardize on 'tpl' local variable names for 'struct smp_text_poke_loc *'
  x86/alternatives: Rename 'TP_ARRAY_NR_ENTRIES_MAX' to 'TEXT_POKE_ARRAY_MAX'
  x86/alternatives: Rename 'POKE_MAX_OPCODE_SIZE' to 'TEXT_POKE_MAX_OPCODE_SIZE'
  x86/alternatives: Simplify the #include section
  x86/alternatives: Move declarations of vmlinux.lds.S defined section symbols to <asm/alternative.h>
  x86/alternatives: Remove 'smp_text_poke_batch_flush()'
  x86/alternatives: Update the comments in smp_text_poke_batch_process()
  x86/alternatives: Rename 'apply_relocation()' to 'text_poke_apply_relocation()'
  x86/alternatives: Add comment about noinstr expectations

Nikolay Borisov (1):
  x86/alternatives: Make smp_text_poke_batch_process() subsume smp_text_poke_batch_finish()

Peter Zijlstra (1):
  x86/alternatives: Document the text_poke_bp_batch() synchronization rules a bit more

 arch/x86/include/asm/alternative.h   |   6 +
 arch/x86/include/asm/text-patching.h |  29 +--
 arch/x86/kernel/alternative.c        | 391 +++++++++++++++++------------------
 arch/x86/kernel/callthunks.c         |   6 +-
 arch/x86/kernel/ftrace.c             |  18 +-
 arch/x86/kernel/jump_label.c         |   6 +-
 arch/x86/kernel/kprobes/core.c       |   4 +-
 arch/x86/kernel/kprobes/opt.c        |   6 +-
 arch/x86/kernel/module.c             |   2 +-
 arch/x86/kernel/static_call.c        |   2 +-
 arch/x86/kernel/traps.c              |   6 +-
 arch/x86/mm/init.c                   |  16 +-
 arch/x86/net/bpf_jit_comp.c          |   2 +-
 13 files changed, 241 insertions(+), 253 deletions(-)

-- 
2.45.2

