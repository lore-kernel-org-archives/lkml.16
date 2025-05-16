Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4908622A1E4
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 07:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747381776; cv=none; b=YJUtSH2t9ST3RG54PqXOWqcnk24abo/lSC1QvnnRnvISRIornk6uCfbs/NQy6htWEW+Z1W91kqffiG3iH7D+oc0goh0Xv7eexZLn1WsNnJBvD5Glml63TuN3LIBGqxiHxovzTUNxlTcHffc2wghWq1DWL1Ry/2TMWt7sj4SEm6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747381776; c=relaxed/simple;
	bh=nmg7MHmhpONb13IdKsaPRoKAYLbCcI5MfZRz8SI+MyM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l1rwMOZADRQJ0j8qLh+wtr+C04jH8gJJolXwOQizvyLB2qcEFMRx1rDHrf/Xrt7p3sp9QcrmqCbLf68nv414XQQWM7lrxJJKsmg6ujDZbEw+wcOKB6m3D/ksmvl5uUYbGGEvsoaqHDpME9IkIeIxkHzq8xwZJIUSHE6na7I4LuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0VhL5wq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0VhL5wq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2929BC4CEE4;
	Fri, 16 May 2025 07:49:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747381775;
	bh=nmg7MHmhpONb13IdKsaPRoKAYLbCcI5MfZRz8SI+MyM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=g0VhL5wqPwNBCGqeCAifg93DiaCuYLOMclxQgUu/iLaWSYHcUEX49m2UsYgazat4S
	 Hosf40Oe06OsEKgOWo7N83M6ZxyPfisAqJhNJNEhSxvU9stTPUysf967Snek0ew4VS
	 UrVy3WRwQJb7dh7o6NpwsqU9KQj/UzpO2I4SRx72QnIfC4cwtV/L3EBCRIYpQNc3iG
	 +hPJsRQWinTF6TwMgGVkdIO0lyNybIVBTiJ3lNhtTLvJ6EKYhrs2+jZyNKt1bX/ogy
	 n067X67EnPvxeKlGG3aTdfqV4WwtmfZ+cK+FhSIw8X/06jBwyfBLaIqbafQYsyFrck
	 nNst/goYluztQ==
Date: Fri, 16 May 2025 09:49:28 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Michael Kelley <mhklinux@outlook.com>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
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
Subject: Re: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX
 and Hyper-V
Message-ID: <aCbuCMCRqScuEJwH@gmail.com>
References: <20250515132719.31868-1-mingo@kernel.org>
 <20250515132719.31868-8-mingo@kernel.org>
 <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SN6PR02MB4157B1676A6284ECD21E494FD490A@SN6PR02MB4157.namprd02.prod.outlook.com>


* Michael Kelley <mhklinux@outlook.com> wrote:

> From: Ingo Molnar <mingo@kernel.org> Sent: Thursday, May 15, 2025 6:27 AM
> > 
> > Since the x86 defconfig aims to be a distro kernel work-alike with
> > fewer drivers and a shorter build time, refresh all the virtualization
> > guest Kconfig features, enabling paravirt spinlocks, and
> > enabling the guest support code for the following guests:
> > 
> >  - Xen
> >  - Xen_PVH
> >  - Jailhouse
> >  - ACRN
> >  - Intel TDX
> >  - Hyper-V
> 
> I built and tested a Hyper-V guest with defconfig.

Thank you!

> The Hyper-V storage and keyboard drivers are pulled in automatically, 
> so my previous comment about them being "missing" is moot.

Yeah. "defconfig compression" is a bit non-obvious, as the file doesn't 
carry indirect select and default-y-enabled options.

> But the Linux console for each Hyper-V guest is a synthetic graphics
> console, and that didn't work with the DRM_HYPERV driver. Missing
> the console pretty much kills any usefulness. DRM doesn't have 
> Linux console support, so it needs CONFIG_DRM_FBDEV_EMULATION
> to be set, and defconfig doesn't have it.
> 
> So either CONFIG_DRM_FBDEV_EMULATION needs to be added, or
> defconfig should switch to the older HYPERV_FB driver. I think we'd
> rather do the former. Vitaly -- any thoughts?

We can certainly enable that option, and it's likely useful for other 
guests as well - see the delta patch below I applied.

Based on your description I also added your Tested-by tag:

    Tested-by: Michael Kelley <mhklinux@outlook.com> # On Hyper-V

And pushed it all out to:

  git://git.kernel.org/pub/scm/linux/kernel/git/mingo/tip.git WIP.x86/kconfig

Thanks,

	Ingo

=================================>
 arch/x86/configs/x86_64_defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index df786b8b4e85..15c6b5f3b2fc 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
@@ -203,6 +203,7 @@ CONFIG_AGP=y
 CONFIG_AGP_AMD64=y
 CONFIG_AGP_INTEL=y
 CONFIG_DRM=y
+CONFIG_DRM_FBDEV_EMULATION=y
 CONFIG_DRM_I915=y
 CONFIG_DRM_VIRTIO_GPU=y
 CONFIG_DRM_HYPERV=y
