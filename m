Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B45910957
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 03:29:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749698987; cv=none; b=d2IIkrOcgfYwQ9RjYaoC7S7u4FxbvN8HblBPz75ZYmV+hk+yR56bjPD1qFbhIgp5//6NeU8J87e8rdGZPMU9wPSyjJAr3i6jngDR4MSO/RLgJS1nwYNwrTjKZuho2Va1d3KVFqqpQBTTb+BKA90+FbJovngUtIfkymOvZXxLBOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749698987; c=relaxed/simple;
	bh=KQgaKueJ8SmL0GquEvj6xboQpRgNJFsrZHkCTWpTp9k=;
	h=Message-ID:Date:MIME-Version:From:To:Cc:Subject:Content-Type; b=paa5EeV/hSyK26ccDNE01aCPMAZ3uqRJ7cv0craAGZX2iOK71NUR/rNxY745ncaJczM2RwFsrfBHOYo4qbZA7AYk3+zDPi74XD50e+msYbSkrNsvnJGBBud4BGAKxHJTEGH4kvS76ppxzRpwV39piEuUaaeFJz4JQI/Lh/RX/HQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ixxiEf70; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ixxiEf70"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 726B4C4CEEB;
	Thu, 12 Jun 2025 03:29:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749698986;
	bh=KQgaKueJ8SmL0GquEvj6xboQpRgNJFsrZHkCTWpTp9k=;
	h=Date:From:To:Cc:Subject:From;
	b=ixxiEf70uRv01WItso+c7o/nLY9PQPuISDzE3o9AtzXysgAUOa99S4bzIDdMGLvx1
	 l9M5apUZ0gKN3U7+wmMg1MTDemHHa9qOAUSaQdnJTzfXMOh7OwvusgGIJD4kjcaaYn
	 Ck2hStZnba7MQ4f5EFUK22WVE45yYmmFDIL6Bf5aTWna5s3dPRj73o8vDYbfOfWXOV
	 UshP9osJA/npc1jJGrSXN6dd4J1ytF2QKHINViI/DRM77elJlkSD3k1SfPmvsCUh1n
	 t2yrota3Hio3BFL3bmotcxWnw48J/YtNdRaV+h801ZRxgOURdmjIE9ntCabtDIcjua
	 oWAjg0fePTwVg==
Message-ID: <4cb508de-3af3-4796-ac74-2c082a578588@kernel.org>
Date: Wed, 11 Jun 2025 20:29:45 -0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Vineet Gupta <vgupta@kernel.org>
Content-Language: en-US
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: arcml <linux-snps-arc@lists.infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Jason Gunthorpe <jgg@nvidia.com>,
 Yu-Chun Lin <eleanor15x@gmail.com>, Thomas Huth <thuth@redhat.com>,
 Jason Gunthorpe <jgg@ziepe.ca>
Subject: [GIT PULL] ARC updates for 6.16
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Linus,

Some fixes for ARC.
Please Pull.

Thx,
-Vineet
------------------>
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/vgupta/arc.git/ tags/arc-6.16-rc1

for you to fetch changes up to 179e949719fe81219a3e23f1e716ac2d02eea845:

  ARC: Replace __ASSEMBLY__ with __ASSEMBLER__ in the non-uapi headers
(2025-06-09 09:18:12 -0700)

----------------------------------------------------------------
ARC fixes for 6.16

 - arch_atomic64_cmpxchg relaxed variant [Jason]

 - use of inbuilt swap in stack unwinder  [Yu-Chun Lin]

 - use of __ASSEMBLER__ in kernel headers [Thomas Huth]

----------------------------------------------------------------
Jason Gunthorpe (1):
      ARC: atomics: Implement arch_atomic64_cmpxchg using _relaxed

Thomas Huth (2):
      ARC: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      ARC: Replace __ASSEMBLY__ with __ASSEMBLER__ in the non-uapi headers

Yu-Chun Lin (1):
      ARC: unwind: Use built-in sort swap to reduce code size and improve
performance

 arch/arc/include/asm/arcregs.h            |  2 +-
 arch/arc/include/asm/atomic.h             |  4 ++--
 arch/arc/include/asm/atomic64-arcv2.h     | 15 +++++----------
 arch/arc/include/asm/bitops.h             |  4 ++--
 arch/arc/include/asm/bug.h                |  4 ++--
 arch/arc/include/asm/cache.h              |  4 ++--
 arch/arc/include/asm/current.h            |  4 ++--
 arch/arc/include/asm/dsp-impl.h           |  2 +-
 arch/arc/include/asm/dsp.h                |  4 ++--
 arch/arc/include/asm/dwarf.h              |  4 ++--
 arch/arc/include/asm/entry.h              |  4 ++--
 arch/arc/include/asm/irqflags-arcv2.h     |  4 ++--
 arch/arc/include/asm/irqflags-compact.h   |  4 ++--
 arch/arc/include/asm/jump_label.h         |  4 ++--
 arch/arc/include/asm/linkage.h            |  6 +++---
 arch/arc/include/asm/mmu-arcv2.h          |  4 ++--
 arch/arc/include/asm/mmu.h                |  2 +-
 arch/arc/include/asm/page.h               |  4 ++--
 arch/arc/include/asm/pgtable-bits-arcv2.h |  4 ++--
 arch/arc/include/asm/pgtable-levels.h     |  4 ++--
 arch/arc/include/asm/pgtable.h            |  4 ++--
 arch/arc/include/asm/processor.h          |  4 ++--
 arch/arc/include/asm/ptrace.h             |  4 ++--
 arch/arc/include/asm/switch_to.h          |  2 +-
 arch/arc/include/asm/thread_info.h        |  4 ++--
 arch/arc/include/uapi/asm/ptrace.h        |  4 ++--
 arch/arc/kernel/unwind.c                  | 11 +----------
 27 files changed, 53 insertions(+), 67 deletions(-)
