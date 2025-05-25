Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB8D743ABC
	for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 11:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748171104; cv=none; b=r4Ycka4DaHM1QcZJDGEGS/Ayey0cgYXCiATD23PH9WjHaJG4CtykDLCM7L+Gxq6sE6zHJLowIzDSvZ0GUpvFr5y3jHsHtcZXE8pV4nyas07nFVeLOLWmlj71PLfLSpTWe7p0ak/ZMxMADbVXbCHNGXEzVHVFeS4xnivwRM05oNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748171104; c=relaxed/simple;
	bh=cLoWNYhc1e7MFl/ZD4LpVncx6R7VUCs5j/Fhd6cQYyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TWOCDGmPAd9vgvbCBiUOYPcxOjBcuaEtjrcYoHU1EHF2xPd11chq6YAnQq/VsfR05cJvVXriwvcOxpRGp8YfsDfxQDcoklmZBqW0n0Kd9B6SQmCRHWmmUKvuhDyD3fPOqUGvd7XOzFS9dHtpYISglwyv1r29BwrwW+ozC+/iL2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZsAvpfS7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZsAvpfS7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243DCC4CEEA;
	Sun, 25 May 2025 11:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748171104;
	bh=cLoWNYhc1e7MFl/ZD4LpVncx6R7VUCs5j/Fhd6cQYyQ=;
	h=Date:From:To:Cc:Subject:From;
	b=ZsAvpfS7fRqmlDo6GMEZaV+hUrgxQ58ltC0t4o3UPeQNJsqMLMiqLUOqVQAKJ9wlo
	 RIPXUWJykGGPupGG8D4fsVYtNSMreQAu9DFyS4EI37Nly4lgaydeV5WNs26MmYGSnF
	 bpKPGaSPaTtiESKJ4POKL3BQXRkiyvEenm8Fk5OZ07yXCZ87f3WwCbUMCrDALAKfjn
	 UrGpmg7sk0SHknhKbxiPG1zIV9if1QgJsW8enmFqkbibGSaeTquFVEDr30vmxdbNxm
	 /0yn7rVAkfBj7OHYUmKnlmooae0CQfl3a3OXC0dlpPsbgYIWiGEE1rax6+g84POOMr
	 HzBqZnc9PaiMg==
Date: Sun, 25 May 2025 13:05:00 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, the arch/x86 maintainers <x86@kernel.org>
Subject: [GIT PULL] x86/debug changes for v6.16
Message-ID: <aDL5XBNMbYXn5txr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Linus,

Please pull the latest x86/debug Git tree from:

   git://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git x86-debug-2025-05-25

   # HEAD: 06aa9378df017ea7482b1bfdcd750104c8b3c407 x86/tracing, x86/mm: Move page fault tracepoints to generic

Move the x86 page fault tracepoints to generic code, because
other architectures would like to make use of them as well.

 Thanks,

	Ingo

------------------>
Nam Cao (2):
      x86/tracing, x86/mm: Remove redundant trace_pagefault_key
      x86/tracing, x86/mm: Move page fault tracepoints to generic


 arch/x86/include/asm/trace/common.h                | 12 ----------
 arch/x86/include/asm/trace/irq_vectors.h           |  1 -
 arch/x86/kernel/Makefile                           |  1 -
 arch/x86/kernel/tracepoint.c                       | 21 -----------------
 arch/x86/mm/Makefile                               |  2 --
 arch/x86/mm/fault.c                                |  5 +---
 .../trace => include/trace/events}/exceptions.h    | 27 +++++++---------------
 7 files changed, 9 insertions(+), 60 deletions(-)
 delete mode 100644 arch/x86/include/asm/trace/common.h
 delete mode 100644 arch/x86/kernel/tracepoint.c
 rename {arch/x86/include/asm/trace => include/trace/events}/exceptions.h (55%)
