Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28F5F252282
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 17:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550964; cv=none; b=Px17fWt0L3CtkyvTwUEm6rFT4UNtJSlFU5KJQVBqdLlf88LPfKejPlIBA2dZYOstpFjoTt5k/gznmAGkTSx0rffq89TxElsZw6hTXd2PdJMYOukrfRjlxWV01gf4wKaG7LYoOi0Q1L+52lnJMNnsUG3KCCVBme/b10/qM6XV8TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550964; c=relaxed/simple;
	bh=D+DMk4J3J4PZmLIDq0Alk66bZIdPLcFhzbmDSkbr73c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PdBrJZvTi8rcRIT27HwFz/5KAnIp43xNnftEf80xJswMhFzwBMo19DVeGsus/nFaRDXuKYV2+hCSRuHk3Z5jUcFlnpD9pOGH870iRLtrjjXkrQzSBH6pNbNUwng+xLlOyY/Qv3ZpDdg+Yo9QCqZoXNq+fgDP9zdkeC8WWMn6AQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dYfa3I+8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dYfa3I+8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46EAFC4CEEB;
	Tue,  6 May 2025 17:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746550963;
	bh=D+DMk4J3J4PZmLIDq0Alk66bZIdPLcFhzbmDSkbr73c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dYfa3I+8xjihRLms+wYG+uwS6tVxSLcgjeKx7DuXia15Fk/DAwpb2u78+13K/JJKf
	 lbPwkv1nFospZzhoHzFOULeWosMQqFjJqofBzvk2gfFgZyrQEFRX01zm/hUAOBkqIh
	 jwT0QEVL+AB4YmW1OqeXVHmIBYabspiawB6rNu1yLV9FrqN+ZcFF4jr7EXRmrPJnKn
	 Dedsk7p0O7prsR1E3pytUXy8WKq0Rmv2VRiG55KGShC6KajiKTQz77CGWu5KnK4Wf5
	 ZROcLezti8xzWvDXiMdZvbbWRyUJhyd+1yxFxYLICTZNL08jBomXJVFPoRQiP9TZ9T
	 bxFKi6TEfbzdA==
Date: Tue, 6 May 2025 19:02:36 +0200
From: Ingo Molnar <mingo@kernel.org>
To: Vitaly Kuznetsov <vkuznets@redhat.com>
Cc: linux-kernel@vger.kernel.org, "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ard Biesheuvel <ardb@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>, Jan Kiszka <jan.kiszka@siemens.com>,
	Juergen Gross <jgross@suse.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH -v2 09/15] x86/kconfig/64: Enable more virtualization guest
 options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX
 and Hyper-V
Message-ID: <aBpArFOCEhP5ZESO@gmail.com>
References: <20250505110946.1095363-1-mingo@kernel.org>
 <20250505110946.1095363-10-mingo@kernel.org>
 <87msbp278e.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <87msbp278e.fsf@redhat.com>


* Vitaly Kuznetsov <vkuznets@redhat.com> wrote:

> Ingo Molnar <mingo@kernel.org> writes:
> 
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
> 
> Out of curiosity and to get the idea what's good for defconfig and
> what's not: do we want to enable Hyper-V and its drivers as well? I
> think all popular distros enable it nowdays because of Azure. E.g.
> 
> CONFIG_PCI_HYPERV=m
> CONFIG_HYPERV_STORAGE=m
> CONFIG_HYPERV_NET=m
> CONFIG_HYPERV_KEYBOARD=m
> CONFIG_DRM_HYPERV=m
> CONFIG_HID_HYPERV_MOUSE=m
> CONFIG_HYPERV=m
> CONFIG_HYPERV_UTILS=m
> CONFIG_HYPERV_BALLOON=m

We can certainly do that. The only reason I missed it is because 
CONFIG_HYPERV et al have hidden away in the 'drivers' section of the 
.config, which I didn't examine. The other guest support options are in 
the generic config section.

Updated patch attached.

Thanks,

	Ingo

=================================>
From: Ingo Molnar <mingo@kernel.org>
Date: Mon, 5 May 2025 10:49:11 +0200
Subject: [PATCH] x86/kconfig/64: Enable more virtualization guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and Hyper-V

Since the x86 defconfig aims to be a distro kernel work-alike with
fewer drivers and a shorter build time, refresh all the virtualization
guest Kconfig features, enabling paravirt spinlocks, and
enabling the guest support code for the following guests:

 - Xen
 - Xen_PVH
 - Jailhouse
 - ACRN
 - Intel TDX
 - Hyper-V

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Acked-by: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Fei Li <fei1.li@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 arch/x86/configs/defconfig.x86_64 | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 156e9490e29b..df786b8b4e85 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -30,7 +30,12 @@ CONFIG_PROFILING=y
 CONFIG_KEXEC=y
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
-CONFIG_PARAVIRT=y
+CONFIG_PARAVIRT_SPINLOCKS=y
+CONFIG_XEN=y
+CONFIG_XEN_PVH=y
+CONFIG_JAILHOUSE_GUEST=y
+CONFIG_ACRN_GUEST=y
+CONFIG_INTEL_TDX_GUEST=y
 CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
 CONFIG_X86_MSR=y
 CONFIG_X86_CPUID=y
@@ -128,6 +133,7 @@ CONFIG_NET_9P=y
 CONFIG_NET_9P_VIRTIO=y
 CONFIG_PCI=y
 CONFIG_PCIEPORTBUS=y
+CONFIG_PCI_HYPERV=y
 CONFIG_HOTPLUG_PCI=y
 CONFIG_PCCARD=y
 CONFIG_YENTA=y
@@ -168,6 +174,7 @@ CONFIG_SKY2=y
 CONFIG_FORCEDETH=y
 CONFIG_8139TOO=y
 CONFIG_R8169=y
+CONFIG_HYPERV_NET=y
 CONFIG_INPUT_EVDEV=y
 CONFIG_INPUT_JOYSTICK=y
 CONFIG_INPUT_TABLET=y
@@ -198,6 +205,7 @@ CONFIG_AGP_INTEL=y
 CONFIG_DRM=y
 CONFIG_DRM_I915=y
 CONFIG_DRM_VIRTIO_GPU=y
+CONFIG_DRM_HYPERV=y
 CONFIG_SOUND=y
 CONFIG_SND=y
 CONFIG_SND_HRTIMER=y
@@ -214,6 +222,7 @@ CONFIG_HID_PETALYNX=y
 CONFIG_HID_SAMSUNG=y
 CONFIG_HID_SONY=y
 CONFIG_HID_SUNPLUS=y
+CONFIG_HID_HYPERV_MOUSE=y
 CONFIG_HID_TOPSEED=y
 CONFIG_HID_PID=y
 CONFIG_USB_HIDDEV=y
@@ -231,6 +240,9 @@ CONFIG_RTC_CLASS=y
 CONFIG_DMADEVICES=y
 CONFIG_VIRTIO_PCI=y
 CONFIG_VIRTIO_INPUT=y
+CONFIG_HYPERV=y
+CONFIG_HYPERV_UTILS=y
+CONFIG_HYPERV_BALLOON=y
 CONFIG_EEEPC_LAPTOP=y
 CONFIG_AMD_IOMMU=y
 CONFIG_INTEL_IOMMU=y
