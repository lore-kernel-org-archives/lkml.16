Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4111DB34B
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 21:11:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744233099; cv=none; b=KLO4JEUNz0YNFs6JdBpqP2OLmQpsPSPI5zsq+8M+8XTgmyXTLCJGV0AxdC4R3U6DRfMkajBL9g4ho+ny+OBtIrkmeHr5qFwjjRWkGIsXsfrNpIFze6cZNf/NUBSe5cCwMWmbk2sR35ZDSUw0j1B7MAUUV8n9g32W56evWN/WqXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744233099; c=relaxed/simple;
	bh=3rvUGGUO7jLtTmi3XOagkP6TczVFXokyhlyp6iwQFbA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=oY6Hu2iSNbI3Z7vfahq9qPHX2vSlWuUDdsMs0rFNtnh54dDifoncfuLmWm3TbnbnA9lVyVjErEKRqM77OAtEHkjCf+JXa6wUrbugmkwl/ai5kTX02Uu9/SYaCtqi0b7tR4RlecKfflsQlhj/23AQ3aq9IgRnV2nneXmQHuhE5vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QuedZ1S2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QuedZ1S2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5199C4CEE2;
	Wed,  9 Apr 2025 21:11:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744233098;
	bh=3rvUGGUO7jLtTmi3XOagkP6TczVFXokyhlyp6iwQFbA=;
	h=From:To:Cc:Subject:Date:From;
	b=QuedZ1S2qDQo5A04/rC/Xc/sYtnxJlBUnSqfZovGr+2d1M84FfdmmzYAHo4TgOGpc
	 kdhpxUfRAmBqHzlxA+JJV7QOwrIpqTcqAxrxnfocpsxeSo/6bg+0DiZAOFXYhX7UVv
	 InVe1n3sjtCmy1dr6BTDo11UhbOP1eeJiJwi/QFhwjvLFjLgw+h+X6/NduD2i9Pcbd
	 32pca+qtdb8mSttyUqeojuSNaVEK2fOY5kBj2CsLQbMgxqL73Rik/8Bk/HXERzMTiw
	 wH//psu/JJ3wzrIjFuX343J2jNQhkBrec+43pXHaKbCZYIvFsBTvVrjzRZa2Ce5RYD
	 UjiNb+MinUnLA==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Andy Lutomirski <luto@amacapital.net>,
	Dave Hansen <dave@sr71.net>,
	Brian Gerst <brgerst@gmail.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Oleg Nesterov <oleg@redhat.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	"Chang S . Bae" <chang.seok.bae@intel.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH -v5 0/8] sched: Make task_struct::thread constant size, x86/fpu: Remove thread::fpu
Date: Wed,  9 Apr 2025 23:11:19 +0200
Message-ID: <20250409211127.3544993-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series is one of the dependencies of the fast-headers work,
which aims to reduce header complexity by removing <asm/processor.h>
from the <linux/sched.h> dependency chain, which headers are headers
are fat enough already even if we do not combine them.

To achieve that decoupling, one of the key steps is to not embedd any
C types from <asm/processor.h> into task_struct.

The only architecture that relies on that in a serious fashion is x86,
via the 'struct thread::fpu' variable size structure. The series below
attempts to resolve it by using a calculated fpu context area address
value via the x86_task_fpu() helper. The allocation layout of
task_struct + fpu-save-area doesn't change.

The -v5 version is a refresh of the -v4 series to v6.15-rc1.

The Git tree of these commits can also be found at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/fpu

Thanks,

	Ingo

===============>
Ingo Molnar (8):
  x86/fpu: Introduce the x86_task_fpu() helper method
  x86/fpu: Convert task_struct::thread.fpu accesses to use x86_task_fpu()
  x86/fpu: Make task_struct::thread constant size
  x86/fpu: Remove the thread::fpu pointer
  x86/fpu: Push 'fpu' pointer calculation into the fpu__drop() call
  x86/fpu: Make sure x86_task_fpu() doesn't get called for PF_KTHREAD|PF_USER_WORKER tasks during exit
  x86/fpu: Remove init_task FPU state dependencies, add debugging warning for PF_KTHREAD tasks
  x86/fpu: Use 'fpstate' variable names consistently

 arch/x86/include/asm/fpu/api.h   |  2 +-
 arch/x86/include/asm/fpu/sched.h |  4 +-
 arch/x86/include/asm/processor.h | 23 ++++++------
 arch/x86/kernel/fpu/context.h    |  4 +-
 arch/x86/kernel/fpu/core.c       | 80 +++++++++++++++++++++++-----------------
 arch/x86/kernel/fpu/init.c       | 21 ++++++-----
 arch/x86/kernel/fpu/regset.c     | 22 +++++------
 arch/x86/kernel/fpu/signal.c     | 18 ++++-----
 arch/x86/kernel/fpu/xstate.c     | 27 ++++++--------
 arch/x86/kernel/fpu/xstate.h     |  6 +--
 arch/x86/kernel/process.c        |  9 ++---
 arch/x86/kernel/signal.c         |  6 +--
 arch/x86/kernel/traps.c          |  2 +-
 arch/x86/math-emu/fpu_aux.c      |  2 +-
 arch/x86/math-emu/fpu_entry.c    |  4 +-
 arch/x86/math-emu/fpu_system.h   |  2 +-
 arch/x86/mm/extable.c            |  2 +-
 include/linux/sched.h            | 15 ++------
 18 files changed, 126 insertions(+), 123 deletions(-)

-- 
2.45.2

