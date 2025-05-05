Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA42520469E
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 11:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746443421; cv=none; b=BAnb5FkENSTX8Kqi8NUEBmExqaQmgN7/n0AHxAG0SminDJ9ZosstovQHkrOahK/hMK16UgBERi9oaaB87Rcs5Lh9XRee6AJXNiezPxWAMfs+2k6qRz9nwxiAKXsAPEp6u/sA1JjL5iqsHSG7d/CGnfP5XKsVP/nl4hprFcv0CLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746443421; c=relaxed/simple;
	bh=Kv5zyUKb0GmVJw1Mk+6HiPZoLKaYjwIer2SVe5GSZCo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=e+fouEZ5QF/aFW3yfAaHtim+T3+D1QNdh47XTSZHqmzBSltPjPuZbn4wOnHExhpCNvCsObk3QM1IV3C4uXsg/o4dr2zhZ6F784h+iMojc5FM6D4mwhUkS7XmvFfKhSwxbmyjYyZatHEjDPROFK5hetHI2P/6oxsnyV+GkvpWQCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CMaIVKsj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CMaIVKsj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F0FEAC4CEE9;
	Mon,  5 May 2025 11:10:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746443420;
	bh=Kv5zyUKb0GmVJw1Mk+6HiPZoLKaYjwIer2SVe5GSZCo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=CMaIVKsjskZoxwY/C/hnWfTUQMBSknnzr66cWdR2XUPCk8pN3ENrFaTYT4PaEafeZ
	 BGAjJxLTf6PXaFx17obuvjy0Qt5Qzwf7BDhq1PGJ7HBWbwoCDZvwWkI5qW+CUpAT9j
	 4/HKLGBXHSyr/WFUrrKXv3WxPUfpW6uCjjQcasJy9gp5v9fM/T4AAX496L7GVDgTW0
	 BTzI6OD8sg0lqSZSTx36PltJKwRHuYm6mnh0Bwc9mR6xgVYlkTcdqwcIJnBEbNfVJe
	 4lL9wApF0mGmfAI7doKt/9b2531fHsxMcljpKvtbeDkTSc2H2KL7M187Y9Qg1Qf9lj
	 LBb2FUl9gcGmg==
From: Ingo Molnar <mingo@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: "H . Peter Anvin" <hpa@zytor.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Carlos Bilbao <carlos.bilbao@kernel.org>,
	David Woodhouse <dwmw@amazon.co.uk>,
	Elena Reshetova <elena.reshetova@intel.com>,
	Fei Li <fei1.li@intel.com>,
	Jan Kiszka <jan.kiszka@siemens.com>,
	Juergen Gross <jgross@suse.com>,
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
	Masahiro Yamada <yamada.masahiro@socionext.com>,
	Michal Marek <michal.lkml@markovi.net>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Sean Christopherson <seanjc@google.com>,
	Stefano Stabellini <sstabellini@kernel.org>,
	Vitaly Kuznetsov <vkuznets@redhat.com>
Subject: [PATCH 09/15] x86/kconfig/64: Enable more virtualization guest options in the defconfig: enable Xen, Xen_PVH, Jailhouse, ACRN and Intel TDX
Date: Mon,  5 May 2025 13:09:40 +0200
Message-ID: <20250505110946.1095363-10-mingo@kernel.org>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250505110946.1095363-1-mingo@kernel.org>
References: <20250505110946.1095363-1-mingo@kernel.org>
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

Signed-off-by: Ingo Molnar <mingo@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>
Cc: Carlos Bilbao <carlos.bilbao@kernel.org>
Cc: David Woodhouse <dwmw@amazon.co.uk>
Cc: Elena Reshetova <elena.reshetova@intel.com>
Cc: Fei Li <fei1.li@intel.com>
Cc: H. Peter Anvin <hpa@zytor.com>
Cc: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Juergen Gross <jgross@suse.com>
Cc: Kirill A. Shutemov <kirill.shutemov@linux.intel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Cc: Sean Christopherson <seanjc@google.com>
Cc: Stefano Stabellini <sstabellini@kernel.org>
Cc: Vitaly Kuznetsov <vkuznets@redhat.com>
---
 arch/x86/configs/defconfig.x86_64 | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/x86/configs/defconfig.x86_64 b/arch/x86/configs/defconfig.x86_64
index 156e9490e29b..514f8fdc2102 100644
--- a/arch/x86/configs/defconfig.x86_64
+++ b/arch/x86/configs/defconfig.x86_64
@@ -31,6 +31,12 @@ CONFIG_KEXEC=y
 CONFIG_SMP=y
 CONFIG_HYPERVISOR_GUEST=y
 CONFIG_PARAVIRT=y
+CONFIG_PARAVIRT_SPINLOCKS=y
+CONFIG_XEN=y
+CONFIG_XEN_PVH=y
+CONFIG_JAILHOUSE_GUEST=y
+CONFIG_ACRN_GUEST=y
+CONFIG_INTEL_TDX_GUEST=y
 CONFIG_X86_REROUTE_FOR_BROKEN_BOOT_IRQS=y
 CONFIG_X86_MSR=y
 CONFIG_X86_CPUID=y
-- 
2.45.2

