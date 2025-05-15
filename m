Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D77481C4
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315645; cv=none; b=aXaKbULBJQj2L+GK4Ba+W37riqnGo1jIRbfkn5aFchDpvkqnILfQae3UqiHx6u4+O4lS6j4kq9wQB2t9qbesiUpI5s8nnXbR73X019GVeR9cSqXRgqaEdV0/0HGJWKv9VTxNvi4DdiDhRNbk3CtsaJe95AFvL2PLPU4udvBdhTY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315645; c=relaxed/simple;
	bh=wGT0OJ+uU2Wms/xfD/ecjY4SjYeFOjKB+DUjQZ0QeCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R9rKpImolyBy0Njqc5LsChD7FeucySYcQ2KzAQAlPc4dShK3PdZjOAqBBUgGu4Y1w0p1QOk2P48tphQ95SkdxPWKimwf3/NCdYE7o06vbrrYAyGQHHGdwh0JGOVpMorNRhD0vKWkSnYx2oTzC0W3UT9Z81qshDLeyzKAxFIWa9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WVo6bm+P; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WVo6bm+P"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 855DAC4CEE7;
	Thu, 15 May 2025 13:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315644;
	bh=wGT0OJ+uU2Wms/xfD/ecjY4SjYeFOjKB+DUjQZ0QeCY=;
	h=From:To:Cc:Subject:Date:From;
	b=WVo6bm+PWLvpr+9XXIQIh0CXf17I7ql275Sf84Xn5fgPYtbIzcOTBp0dK1ismK+0A
	 C9fXI2Ea5pNmmllukJVzS5YfU56PTSzMv6bBjIKXazfFMAmzZBZUG7HuQ9bdp/dBL0
	 UaxbomFoV1h3B1v34qbxGXKajOjTBCyYZ//Sjt/1lwLIuliQ0AdJcfvkDf4R7zxrN1
	 RmnVj6r6TljrpR97d8FXCHj7kxRdLs7icXe9QdwMQkQGr3lQtocohRUDnoJSvjq8KY
	 Wo7eb1aJsEewP4VkDEjaj5TM5bR8eLLWMYroVYdRKQC5W7NAbjRgfDn4pWoge42aJu
	 iKFIWAOrIZF9A==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>
Subject: [PATCH -v3 00/13] x86/kconfig: Synchronize the x86 defconfigs with distribution configs
Date: Thu, 15 May 2025 15:27:06 +0200
Message-ID: <20250515132719.31868-1-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Changes in -v3:

 - Drop patches that renamed the defconfig files, and the
   introduction of the x86_32 subarchitecture string

 - Rebase to v6.15-rc6

This series can also be accessed through my Git tree:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/kconfig

Thanks,

	Ingo

===============>
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

 - Clean up the organization of the defconfig files as well. [Note: REMOVED in -v3]

 - Add the ARCH=x86_32 build target [Note: REMOVED in -v3]

 - Synchronize the x86_32 defconfig to the x86_64 defconfig:
   this file is really just a random set of options configured
   many years ago with no relevance to anything people are
   using today anymore. Just follow the 64-bit options to the
   extent possible, to have at least one modern frame of
   reference.

 - Clean up a number of kbuild details

Thanks,

	Ingo

================>

Ingo Molnar (13):
  x86/kconfig/64: Refresh defconfig
  x86/kconfig/32: Refresh defconfig
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

 arch/x86/Makefile                  |   4 --
 arch/x86/configs/i386_defconfig    | 130 ++++++++++++++++++++++++++++++++-----
 arch/x86/configs/x86_64_defconfig  | 128 +++++++++++++++++++++++++++++++-----
 arch/x86/tools/insn_decoder_test.c |   2 +-
 arch/x86/tools/insn_sanity.c       |   4 +-
 5 files changed, 229 insertions(+), 39 deletions(-)

-- 
2.45.2

