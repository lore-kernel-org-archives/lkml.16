Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA33F20B7EA
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 07:51:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743580310; cv=none; b=GFIMLDKzjI/522THauQiuLydCaSDHKpQRlSiojZ+iwDPfYx8kvJ0k0J3etgI55/YT9wvWOu0VigrnSaPHv6zD1i060TFk+0f+x4cE7tvtVlRCM0ts1osjCrWIPIltEdm2K/OuyHvoEAkcq6WlTbWu5Fhl6alhqQz8T3JtHxL7jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743580310; c=relaxed/simple;
	bh=F0KOdYBX44bBWreqooR/YTwb2uTv5LltwgfPROc7mf8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EOdOI5PRrsL42wsx2TgDpaFUYmsh1EsQL0FSLUyOh6bBf8PescSF2XJj9vTlC7S4LjalVggEIvq8UDC4uSxamysw7L3qXSv4hp9gpRffZWaWbVD0tr7hAiQclTYowrrmxyVI9uRMosT/nmFcGDq6v7gT/MqBXeN3UH50pEaG4No=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=CyUKlCXr; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="CyUKlCXr"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Content-Type:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-To:Resent-Cc:
	Resent-Message-ID:In-Reply-To:References;
	bh=B8AiNSptqMEvFsMfI5jyx79B10U1DkDao5ESEb572/M=; t=1743580308; x=1744789908; 
	b=CyUKlCXr6L7kErt/zO5PWFCsot3XDLzYnhhtcvKARJhQv3nQ9oU6IDcPikT80KkN5K63xSKVsGo
	EtDvgDAP5dJYrx36rh8Vqm9h0sxKvzox7lpPDbxK2P+UQDsdZGpdOV4WIrzdYassGyf0tiMP1uVkW
	yHtNBKe0a1oZwu7Vq27VSYORXAFfwoo0bwOH+jDI+lKv/EncLSBdAW9sUn2VdUenVsMqwP36hCtHy
	jsUJ3kWqdjrqfdl6D7F8QG9ooJ2QIfpCnuG4x8Ukd3keVefxFbz1EZLKu0XGNPQI67A4vASlLIxwv
	hjoM5uUO49lCVLb3ELg43H0Gmqst2xo/toFQ==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98)
	(envelope-from <johannes@sipsolutions.net>)
	id 1tzssx-0000000DGNC-180A;
	Wed, 02 Apr 2025 09:51:44 +0200
From: Johannes Berg <johannes@sipsolutions.net>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org,
	linux-um@lists.infradead.org,
	Richard Weinberger <richard@nod.at>,
	Anton Ivanov <anton.ivanov@cambridgegreys.com>
Subject: pull-request: uml 6.15-rc1 [resend]
Date: Wed,  2 Apr 2025 09:49:03 +0200
Message-ID: <20250402075115.12455-3-johannes@sipsolutions.net>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Linus, again,

And of course only I can get it wrong and mess up the most
basic list address. Sorry. This is just resend with the
correct address for linux-kernel this time, for the archive.

So I'm filling in for Richard (CC'ed) since he's been busy
and I've been mostly working on getting things reviewed and
merged this cycle. Nothing super exciting, see the summary
in the tag below.

Please pull and let us know if there's any problem.

Thanks,
johannes



The following changes since commit 7eb172143d5508b4da468ed59ee857c6e5e01da6:

  Linux 6.14-rc5 (2025-03-02 11:48:20 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/uml/linux.git tags/uml-for-linux-6.15-rc1

for you to fetch changes up to 33c9da5dfb18c2ff5a88d01aca2cf253cd0ac3bc:

  um: Rewrite the sigio workaround based on epoll and tgkill (2025-03-20 09:28:44 +0100)

----------------------------------------------------------------
Updates for UML for this cycle, notably:
 - proper nofault accesses and read-only rodata
 - hostfs fix for host inode number reuse
 - fixes for host errno handling
 - various cleanups/small fixes

----------------------------------------------------------------
Benjamin Berg (4):
      um: remove copy_from_kernel_nofault_allowed
      um: hostfs: avoid issues on inode number reuse by host
      um: work around sched_yield not yielding in time-travel mode
      um: Store full CSGSFS and SS register from mcontext

David Gow (1):
      um: Pass the correct Rust target and options with gcc

Ethan Carter Edwards (1):
      um: use str_yes_no() to remove hardcoded "yes" and "no"

Hajime Tazaki (1):
      um: x86: clean up elf specific definitions

Johannes Berg (1):
      um: mark rodata read-only and implement _nofault accesses

Tiwei Bie (8):
      um: Allocate vdso page pointer statically
      um: Update min_low_pfn to match changes in uml_reserved
      um: virt-pci: Refactor virtio_pcidev into its own module
      um: Add pthread-based helper support
      um: ubd: Switch to the pthread-based helper
      um: Switch to the pthread-based helper in sigio workaround
      um: Prohibit the VM_CLONE flag in run_helper_thread()
      um: Rewrite the sigio workaround based on epoll and tgkill

Uros Bizjak (1):
      um/locking: Remove semicolon from "lock" prefix

 arch/um/Kconfig                          |   1 +
 arch/um/drivers/Kconfig                  |  12 +-
 arch/um/drivers/Makefile                 |   3 +-
 arch/um/drivers/random.c                 |   2 +-
 arch/um/drivers/rtc_user.c               |   2 +-
 arch/um/drivers/ubd.h                    |   6 +-
 arch/um/drivers/ubd_kern.c               |  25 +-
 arch/um/drivers/ubd_user.c               |  14 +-
 arch/um/drivers/virt-pci.c               | 743 ++++++-------------------------
 arch/um/drivers/virt-pci.h               |  41 ++
 arch/um/drivers/virtio_pcidev.c          | 628 ++++++++++++++++++++++++++
 arch/um/include/asm/Kbuild               |   1 +
 arch/um/include/asm/processor-generic.h  |   2 +
 arch/um/include/asm/uaccess.h            |  20 +-
 arch/um/include/linux/time-internal.h    |   2 +
 arch/um/include/shared/arch.h            |   2 +
 arch/um/include/shared/as-layout.h       |   2 +-
 arch/um/include/shared/irq_user.h        |   3 +-
 arch/um/include/shared/kern_util.h       |  12 +-
 arch/um/include/shared/os.h              |   8 +-
 arch/um/include/shared/sigio.h           |   1 -
 arch/um/kernel/Makefile                  |   2 +-
 arch/um/kernel/irq.c                     |   3 +-
 arch/um/kernel/maccess.c                 |  19 -
 arch/um/kernel/mem.c                     |  11 +
 arch/um/kernel/sigio.c                   |  26 --
 arch/um/kernel/skas/syscall.c            |  11 +
 arch/um/kernel/trap.c                    |  28 +-
 arch/um/kernel/um_arch.c                 |   3 +-
 arch/um/os-Linux/helper.c                |  67 +++
 arch/um/os-Linux/process.c               |  51 ---
 arch/um/os-Linux/sigio.c                 | 358 +++------------
 arch/um/os-Linux/signal.c                |   4 +-
 arch/um/os-Linux/skas/process.c          |   8 +-
 arch/x86/Makefile.um                     |   7 +-
 arch/x86/um/asm/barrier.h                |   6 +-
 arch/x86/um/asm/module.h                 |  24 -
 arch/x86/um/os-Linux/mcontext.c          |  15 +-
 arch/x86/um/shared/sysdep/faultinfo_32.h |  12 +
 arch/x86/um/shared/sysdep/faultinfo_64.h |  12 +
 arch/x86/um/vdso/vma.c                   |  17 +-
 fs/hostfs/hostfs.h                       |   2 +-
 fs/hostfs/hostfs_kern.c                  |   7 +-
 fs/hostfs/hostfs_user.c                  |  59 +--
 44 files changed, 1146 insertions(+), 1136 deletions(-)
 create mode 100644 arch/um/drivers/virt-pci.h
 create mode 100644 arch/um/drivers/virtio_pcidev.c
 delete mode 100644 arch/um/kernel/maccess.c
 delete mode 100644 arch/x86/um/asm/module.h
