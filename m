Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39B662222D5
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746551369; cv=none; b=DfVRjXPjWSj/205G4x2THlUPvnkXBpeUVuIO1sOJN7isMJW5Oq+Mm0i6V16s3/r4vJwpkUy0oaWJYCwXTP5wzffwrUibRuplK5nrf9vDqY8EMoPm3qFw/4E0h3G5EJM53oZT7vhXCkf7SwGdkLPt8j50vqdv8KUbqIPB5eq1kF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746551369; c=relaxed/simple;
	bh=UfU4unb1yo+Lw53JaDBEkXqxm/9mxxa1oYtqRuc8r9E=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=A+M0LHEjyS7S662nybfiLxhkNALZVQNw78uftw8DSvc6NDfErvaZq64j2vQvYBfXXtC3uGYBTshm8e4gSA6KMJD66Z6zJFgr3pNqh6f0PZLAkPPXg1MuvtIQb5dwviq/Qbs1pHa+X1TdC/4GYdH6A5gpes1eSMJSkt4DmNn7OmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N2jGOQ38; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N2jGOQ38"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2A71CC4CEE4;
	Tue,  6 May 2025 17:09:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746551369;
	bh=UfU4unb1yo+Lw53JaDBEkXqxm/9mxxa1oYtqRuc8r9E=;
	h=From:To:Cc:Subject:Date:From;
	b=N2jGOQ38VLUb2X2gKPPBCVHj7C78piMkwQOJz5hrBrGhcj/NFvteEZbVCGbGSSIqo
	 vV2EX7PLdF3hP8BXiHFGGdKWLz0/S+C0ZnbZSe537H5c/HTKa1/TXezIPXwkHOwk3n
	 6/PNMMnBVwmT2y0ZE8rjo3eukU48YGEw46BCuJUsTNVvrVAgu6pMvTKZw6txgext7j
	 zK96tiN1rfwVOo+qup7kFMaQalO7bfRU/2EAZ0C9tgARrPqGfxtmypG/vWHyAiMKwe
	 ZIPeomv7Bj9MNF0cGnpS1MgOSAnYTpOBFB8a7WQLZkB6F4N/h3nOTj8qAeGMkMLoHE
	 ax8LQaRGPQlww==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	Ingo Molnar <mingo@kernel.org>
Subject: [PATCH -v2 00/15] x86/kconfig: Enable various kernel features in the defconfig, add the 'x86_32' subarchitecture build target and misc cleanups
Date: Tue,  6 May 2025 19:09:09 +0200
Message-ID: <20250506170924.3513161-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in -v2:

 - Switch from CONFIG_DEBUG_LIST=y to the lower-overhead
   CONFIG_LIST_HARDENING=y option

 - Add Hyper-V

 - Propagate the above changes to x86_32

 - Add review tags

Changes in -v1 (initial announcement):

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
  x86/kconfig/64: Enable more virtualization guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and Hyper-V
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
 .../configs/{x86_64_defconfig => defconfig.x86_64} | 128 +++++++++++++++++---
 arch/x86/tools/insn_decoder_test.c                 |   2 +-
 arch/x86/tools/insn_sanity.c                       |   4 +-
 drivers/gpu/drm/ci/build.yml                       |   2 +-
 tools/scripts/Makefile.arch                        |   7 +-
 10 files changed, 251 insertions(+), 51 deletions(-)
 rename arch/x86/configs/{i386_defconfig => defconfig.x86_32} (69%)
 rename arch/x86/configs/{x86_64_defconfig => defconfig.x86_64} (69%)

-- 
2.45.2

