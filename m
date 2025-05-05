Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE1671CCB40
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:09:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443392; cv=none; b=PUnFyQdIYXsQSqPSOhTwV1ooIHzmED9XZOGB4vSLa+CYIGIhyrw7aGLI/dynHXq9BB8bdkmCAHK9sDxeUCpkImV6+zEqFCHG3dARxdRiT0GaoKc3rTYnhKtBNTsE97YXM4kW+LqTXK8OUlLIhiFABCt3q++yXZvUMehCVtpk67I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443392; c=relaxed/simple;
	bh=eHfQTKoirAa2nYYHd+nhdgKvX22iBlrmDQ9bYgs0jzM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=kexkIu8uZhixz5wCRue18+jSuVhnbr+/o0QsT5L3cuj8sAkCeJDfXuWyQ4z9q9/NsSOb3/vTOQcOnqDJx9IuWSaFoKsSy6MiTb9Ch+1izlVpDd6VfEA25pPWITiXIQuCfRLdUSWkgM+0rmwKrOjNpLoQZ+IryYzLkIT7xxbN+GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KSwZMrn4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KSwZMrn4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7F67C4CEE4;
	Mon,  5 May 2025 11:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443391;
	bh=eHfQTKoirAa2nYYHd+nhdgKvX22iBlrmDQ9bYgs0jzM=;
	h=From:To:Cc:Subject:Date:From;
	b=KSwZMrn41CVv8vhjniM2WSnLlCfZrWCHr0x669LCFb3tD/EGiYBE0cVJMUwCohQf5
	 /e/1q2654EP+Szmn/h7aM3tFggjxLCpoVcmP/mYakkfwWxU6Tly8nb/ucxYKQOx6sk
	 fD+8xKvCOfnAfdf4Fdk762qDOiD6X4KagjBT1cZMUeRte7dm01Ad0Z8hNrJPBNCjSe
	 PGIaY94SWQzyRefFQgB6xwtg+UfU7h+63skg2STjqrALRNUgWJf064hQMyarmHoh6s
	 CSepuwEC/QmSbPQtnjADApnErVlwNraBu9/p6+ssksmfFLRqmeyCTL0CV1e64PXjga
	 kS42SKMI2g0ew==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH 00/15] x86/kconfig: Enable various kernel features in the defconfig, add the 'x86_32' subarchitecture build target and misc cleanups
Date: Mon,  5 May 2025 13:09:31 +0200
Message-ID: <20250505110946.1095363-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Historically the x86 defconfigs aimed to be distro kernel
work-alikes with fewer drivers and a substantially shorter
build time. We regularly ask our contributors to test their
changes on x86 defconfigs, and we frequently analyze code
generation on such kernels as well.

In practice, over the past couple of years this goal has
diverged from what actual modern Linux distributions do
these days, and this series aims to correct that divergence.

Perform a thorough modernization of the x86 defconfigs, and
apply some cleanups to the x86 build system as well:

 - Enable various kernel features that the most popular
   Linux distributions have enabled in their generic
   kernels these days: KVM host, BPF support, UBSAN, various MM
   options, debugging options, various scheduler and cgroups
   options, support for a number of guest OS platforms,
   and other options.

 - More specifically, these changes enable a rough superset
   of the kernel features enabled by Ubuntu, Fedora/RHEL
   kernels.

 - Clean up the organization of the defconfig files as well.

 - Add the ARCH=x86_32 build target

 - Synchronize the x86_32 defconfig to the x86_64 defconfig:
   this file is really just a random set of options configured
   many years ago with no relevance to anything people are
   using today anymore. Just follow the 64-bit options to the
   extent possible, to have at least one modern frame of
   reference.

 - Clean up a number of kbuild details

This series can also be accessed through my Git tree:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/kconfig

Thanks,

	Ingo

================>
Ingo Molnar (15):
  x86/kconfig/64: Refresh defconfig
  x86/kconfig/32: Refresh defconfig
  x86/kconfig: Rename x86_64_defconfig to defconfig.x86_64 and i386_defconfig to defconfig.i386
  x86/kbuild: Introduce the 'x86_32' subarchitecture
  x86/kbuild: Remove ancient 'arch/i386/' and 'arch/x86_64/' directory removal 'archclean' target
  x86/tools: insn_decoder_test.c: Emit standard build success messages
  x86/tools: insn_sanity.c: Emit standard build success messages
  x86/kconfig/64: Enable the KVM host in the defconfig
  x86/kconfig/64: Enable more virtualization guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN and Intel TDX
  x86/kconfig/64: Enable BPF support in the defconfig
  x86/kconfig/64: Enable popular MM options in the defconfig
  x86/kconfig/64: Enable popular kernel debugging options in the defconfig
  x86/kconfig/64: Enable popular scheduler, cgroups and namespaces options in the defconfig
  x86/kconfig/64: Enable popular generic kernel options in the defconfig
  x86/kconfig/32: Synchronize the x86-32 defconfig to the x86-64 defconfig

 .../verify-bugs-and-bisect-regressions.rst         |   2 +-
 Makefile                                           |   7 +-
 arch/x86/Kconfig                                   |   2 +-
 arch/x86/Makefile                                  |  18 +--
 .../configs/{i386_defconfig => defconfig.x86_32}   | 130 ++++++++++++++++++---
 .../configs/{x86_64_defconfig => defconfig.x86_64} | 120 ++++++++++++++++---
 arch/x86/tools/insn_decoder_test.c                 |   2 +-
 arch/x86/tools/insn_sanity.c                       |   4 +-
 drivers/gpu/drm/ci/build.yml                       |   2 +-
 tools/scripts/Makefile.arch                        |   7 +-
 10 files changed, 244 insertions(+), 50 deletions(-)
 rename arch/x86/configs/{i386_defconfig => defconfig.x86_32} (69%)
 rename arch/x86/configs/{x86_64_defconfig => defconfig.x86_64} (70%)

-- 
2.45.2

