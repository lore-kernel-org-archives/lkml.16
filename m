Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB2D23DE
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 07:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749886341; cv=none; b=ItV2LXF/xD4ov8krEGYxOKGmna/v03v/y5XkO3WwgsyvsC8EJxi7WUtEaJ5CFlcvpxumEO9VtaIRTVkYBgdQvsCFqSqtWxN1G14LyizVkOLg021XYJv5OFhu9KMFB+JN2/3fZmbnzAH4ShNb+MCZKM0rkPxNlPdsgXfuVLGJKbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749886341; c=relaxed/simple;
	bh=czQV28/YkuDiLpcPrU879HwkRtZV6i6qIUU/ROMxJXY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y4qtdbjKJoY3Ar8tPV8GKP29ynbIAoAAw6o4rCPtJNS1AZQ+lzF8BnQR6bveSRLy8f/hIGurnj2Nu7P5kwdnTX1T4rRMP+TzBXV18NeCd8GeD+31SNPogDn8hsnSjCwqDdZkcMSLKcB5ksIuoDKJVU5AuVG9l8M4R8+JXAYicLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mInjfLnp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mInjfLnp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FE33C4CEEB;
	Sat, 14 Jun 2025 07:32:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749886341;
	bh=czQV28/YkuDiLpcPrU879HwkRtZV6i6qIUU/ROMxJXY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mInjfLnpriobneFm/E30U2RvhasZwtrEo6cTbxmsNPUNZr7nLU6tweTAaGWsPDj44
	 kGepzSAeHUPqvfDbcsWdCo18m4iGiQ9QJgCw9TZ+rHhEAXgHNuAgKnNhH5P0IsCMlZ
	 haZxofniuuwPxNt9ng2l3cCnR6mC+ZYJsD98srBq4jiruVjLDfAfYU4qmQhdjaKRxf
	 gaN2dM7PtNliNPFP1LcILSh3npRjgX3TPUsRiR33CIZQ1xIyeuBRtzlNAuZOKxW5AE
	 9DkOz9EZFMgX5RT1K7Kt5uFmKxGH3vL27gacnLi0GuRTL42A0Bo8ule67UY6A78WYu
	 wvoNxjSbo0Adg==
Date: Sat, 14 Jun 2025 09:32:14 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Michael Kelley <mhklinux@outlook.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	=?iso-8859-1?Q?J=FCrgen_Gro=DF?= <jgross@suse.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH] x86/kconfig/defconfig: Enable CONFIG_DRM_FBDEV_EMULATION=y
Message-ID: <aE0lfuuzXkVNxtKO@gmail.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
 <87o6vtnf8m.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87o6vtnf8m.fsf@redhat.com>


* Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Michael Kelley <mhklinux@outlook.com> writes:
> 
> > From: Ingo Molnar <mingo@kernel.org> Sent: Thursday, May 15, 2025 6:27 AM
> >> 
> >> Since the x86 defconfig aims to be a distro kernel work-alike with
> >> fewer drivers and a shorter build time, refresh all the virtualization
> >> guest Kconfig features, enabling paravirt spinlocks, and
> >> enabling the guest support code for the following guests:
> >> 
> >>  - Xen
> >>  - Xen_PVH
> >>  - Jailhouse
> >>  - ACRN
> >>  - Intel TDX
> >>  - Hyper-V
> >
> > I built and tested a Hyper-V guest with defconfig. The Hyper-V storage
> > and keyboard drivers are pulled in automatically, so my previous
> > comment about them being "missing" is moot.
> >
> > But the Linux console for each Hyper-V guest is a synthetic graphics
> > console, and that didn't work with the DRM_HYPERV driver. Missing
> > the console pretty much kills any usefulness. DRM doesn't have 
> > Linux console support, so it needs CONFIG_DRM_FBDEV_EMULATION
> > to be set, and defconfig doesn't have it.
> >
> > So either CONFIG_DRM_FBDEV_EMULATION needs to be added, or
> > defconfig should switch to the older HYPERV_FB driver. I think we'd
> > rather do the former. Vitaly -- any thoughts?
> >
> 
> Yea, my vote goes to the same option: let's enable
> CONFIG_DRM_FBDEV_EMULATION.

Okay - I've addressed the enabling of this option separately in:

    7ce421edd9fc ("x86/kconfig/defconfig: Enable CONFIG_DRM_FBDEV_EMULATION=y")

Also attached below.

Thanks,

	Ingo

=======================>
From: Ingo Molnar <mingo@kernel.org>
Date: Sat, 14 Jun 2025 09:10:55 +0200
Subject: [PATCH] x86/kconfig/defconfig: Enable CONFIG_DRM_FBDEV_EMULATION=y

Michael Kelley reported that the x86 defconfig *almost* works
well on Hyper-V guests out of box, with the exception of
console support:

 > I built and tested a Hyper-V guest with defconfig. The Hyper-V storage
 > and keyboard drivers are pulled in automatically. [...]
 >
 > But the Linux console for each Hyper-V guest is a synthetic graphics
 > console, and that didn't work with the DRM_HYPERV driver. Missing
 > the console pretty much kills any usefulness. DRM doesn't have
 > Linux console support, so it needs CONFIG_DRM_FBDEV_EMULATION
 > to be set, and defconfig doesn't have it.

So enable CONFIG_DRM_FBDEV_EMULATION.

Also enable the dependent CONFIG_FRAMEBUFFER_CONSOLE_ROTATION option
(disabled by default), as all major Linux distros have it enabled,
probably as a sysadmin quality-of-life option:

	.config.distro.debian.x86_32:     CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
	.config.distro.fedora.generic:    CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
	.config.distro.opensuse.default:  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
	.config.distro.rhel.generic:      CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
	.config.distro.ubuntu:            CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y

There's no measurable build time impact within ~1% stddev:

  $ perf stat --null --repeat 3 --sync --pre='make clean >/dev/null' make -j128 bzImage >/dev/null

  Performance counter stats for 'make -j128 bzImage' (3 runs):

  # before:         33.759 +- 0.286 seconds time elapsed  ( +-  0.85% )
  # after:          33.593 +- 0.314 seconds time elapsed  ( +-  0.94% )

Suggested-by: Michael Kelley <mhklinux@outlook.com>
Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Jürgen Groß <jgross@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: linux-kernel@vger.kernel.org
Link: https://lore.kernel.org/r/SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com # Discussion
---
 arch/x86/configs/i386_defconfig   | 2 ++
 arch/x86/configs/x86_64_defconfig | 3 +++
 2 files changed, 5 insertions(+)

diff --git a/arch/x86/configs/i386_defconfig b/arch/x86/configs/i386_defconfig
index aeba95893086..39a660d71a0a 100644
--- a/arch/x86/configs/i386_defconfig
+++ b/arch/x86/configs/i386_defconfig
@@ -239,8 +239,10 @@ CONFIG_AGP=y
 CONFIG_AGP_AMD64=y
 CONFIG_AGP_INTEL=y
 CONFIG_DRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_DRM_HYPERV=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HRTIMER=y
diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index c20100d77387..b5dc26fb715a 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -116,6 +116,7 @@ CONFIG_ANON_VMA_NAME=y
 CONFIG_USERFAULTFD=y
 CONFIG_LRU_GEN=y
 CONFIG_LRU_GEN_ENABLED=y
+# CONFIG_DAMON is not set
 CONFIG_NET=y
 CONFIG_PACKET=y
 CONFIG_XFRM_USER=y
@@ -248,8 +249,10 @@ CONFIG_AGP=y
 CONFIG_AGP_AMD64=y
 CONFIG_AGP_INTEL=y
 CONFIG_DRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_DRM_HYPERV=y
+CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HRTIMER=y
