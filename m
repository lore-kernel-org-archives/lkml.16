Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD7701537DA
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 13:27:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747315671; cv=none; b=KVbDKz+JvT4tHFOMvC+CbN1/VVLyDvdamvLX5N4UFI0IIye0Yhl6v30hZFHl4L2662bfiNM/cofHeZewrsB59x7bvNvCjZEmNBCWC0t4y4AJyqGQEvtGJnLbtAvb+gD+oWVCGWgHLv25YU3X33GCTBkoqSKJsRavgTOlV/CnjGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747315671; c=relaxed/simple;
	bh=nmRd7d1YsTKtwGLwY5JUONaVS8iKpRDe0zfcE01ZJFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=S5UFunPaImpVx4GKs8YvIpnv0BICSDLPbwbwyCvb2VHnFx8oqOwsjvmOhSzm1uDK133ZWm5dMDOfHsxO09fmTM7UWGuaeuePCQu5iJtWjNM8GVwwPoYD0sn3pXHW9SGD8hiJMTqX/u5MBw4nUJ+umziejG6rQfQoRQetr/25ozg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VX3Ab1Br; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VX3Ab1Br"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A67AC4CEE7;
	Thu, 15 May 2025 13:27:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747315671;
	bh=nmRd7d1YsTKtwGLwY5JUONaVS8iKpRDe0zfcE01ZJFo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VX3Ab1BrqHvLVz6geVeVL5TKxuvo9sTzgihDJWIGy7Ivj0gQCF0V7ptWcSqdy6Qr0
	 sqdVLVFiFh5dUzvG3NA2ZIIkw3/TqzLxTF/hWIy6snh/0xKsRDM13DJz2S4NlOWDDS
	 JSDdMJyJ7gbkrWnaYHJpjaeB3lYnFZpdb89YxSjGGFdMXUYbugfEpemDP4UpV5veuV
	 oBKeyNHL0Y/necUZ9t0loPJ9ghFMVjvrIx2U+kjCSB31IxWyPS3OEvYLjJ7RA8fpFV
	 HpFRHuFHH2Ibj8/qVoIA23SLvfUHSGw+AOCyvJTC3BAYdBWKU7sZtTqY7fDnY1/Qth
	 usDTRwvWjXVXg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@kernel.org>,
	"H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Vitaly Kuznetsov <vkuznets@redhat.com>,
	=?UTF-8?q?J=C3=BCrgen=20Gro=C3=9F?= <jgross@suse.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>
Subject: [PATCH 07/13] x86/kconfig/64: Enable more virtualization guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN, Intel TDX and Hyper-V
Date: Thu, 15 May 2025 15:27:13 +0200
Message-ID: <20250515132719.31868-8-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250515132719.31868-1-mingo@kernel.org>
References: <20250515132719.31868-1-mingo@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
 arch/x86/configs/x86_64_defconfig | 14 +++++++++++++-
 1 file changed, 13 insertions(+), 1 deletion(-)

diff --git a/arch/x86/configs/x86_64_defconfig b/arch/x86/configs/x86_64_defconfig
index 156e9490e29b..df786b8b4e85 100644
--- a/arch/x86/configs/x86_64_defconfig
+++ b/arch/x86/configs/x86_64_defconfig
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
-- 
2.45.2

