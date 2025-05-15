Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E0A200132
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 20:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747340509; cv=none; b=W+lD/AiH+/Kf5T1rXbCdcZzvmg95RweJJo+LC2MJPcEC7aJXfq+iay0CQP2AcsJrjuIchK1AU1m3dVTzpleKwTvCrgxSCqYG/9NkQVizwd/AWi8jk2BBQ1fXAu+I+k3HSvEcuT9gcs3CIeT6atCntDoNezTHZH/U4Iw5S16ahyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747340509; c=relaxed/simple;
	bh=ZEeQBt09WHXl3jMnCW4+CCT7P76paaxKCveVuu9dfkE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YQfIsRhh4bE8wbIrhwUqTLSv1w97xRapzkChZrWv9ZREPR/O7Rybl1gqgRh/MJfw5gHMC979CUmTNns2LftVZqGnhHGsDlXh6nRwMm/ZvMIz9/e9TuvmtxMehBM9DMEOXehWa7G4PtDZiASPmFU8MxhUa3jzkkCkL+8jJ8lokMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=E+9NaXXr; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=UtDHtbVg; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="E+9NaXXr";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="UtDHtbVg"
From: "Ahmed S. Darwish" <darwi@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1747340505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VT1ftHtUgUo7MFl2MRYiuDMk6mUegc65S7UOS3sBz4o=;
	b=E+9NaXXrof1imBD8HXrilgaxr7RVh5AywBIvF+IJAhaMG6D+y3djjEsFT0MmEnB/MQCFj+
	JePgPPzv/CsU0akoYherkaq9RxWrNM2DkzzXfrudBPwgfjz9MEPy0YYb40a/S48C0KLFZv
	iXKsCSQ7997BFUBAwMWseXFk4o4NMcN3ZXa4X90ND9gPC9ThELSyLOwa9UyeghXLtwRL/I
	OwnFac37z5N6hAS1mJ9Pe3HRU/r5uFDP75heKwbK33DO+HHSgRsexrg6Cn1mtZSRu62xVd
	B0mf3VgPkCrspRrDmAC0LVwUpMFamCXVcFucRyY3o+DN41RhAagTZNxnjcDSug==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1747340505;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VT1ftHtUgUo7MFl2MRYiuDMk6mUegc65S7UOS3sBz4o=;
	b=UtDHtbVgOI9bjVeey2/6KPBxpml06UdxvF8N8MKTocIW41Xc/xJfQrqH6EINdbB3JkkX4b
	SzwMhSOkFcHNfNCw==
To: Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Andrew Cooper <andrew.cooper3@citrix.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	John Ogness <john.ogness@linutronix.de>,
	x86@kernel.org,
	x86-cpuid@lists.linux.dev,
	LKML <linux-kernel@vger.kernel.org>,
	"Ahmed S. Darwish" <darwi@linutronix.de>
Subject: [PATCH v2 0/2] x86/cpuid: Headers cleanup
Date: Thu, 15 May 2025 22:21:40 +0200
Message-ID: <20250515202143.34448-1-darwi@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi,

Most of the patch queue's v1 is now merged at tip:x86/core.

On top of that, introduce a kernel-doc fixup (Sorry, missed that).

Then, do the renames:

    hypervisor_cpuid_base()         ➤    cpuid_base_hypervisor()
    for_…_hypervisor_cpuid_base()   ➤    for_…_cpuid_base_hypervisor()

instead of:

    hypervisor_cpuid_base()         ➤    cpuid_hypervisor_base()
    for_…_hypervisor_cpuid_base()   ➤    for_…_cpuid_hypervisor_base()

to keep "cpuid_base" in one peace:

  https://lore.kernel.org/x86-cpuid/aCYY7CE57Al9ydWa@gmail.com

Thanks!

Cover v1
--------

( [PATCH v1 0/9] x86/cpuid: Headers cleanup
  https://lore.kernel.org/lkml/20250508150240.172915-1-darwi@linutronix.de )

This is a CPUID headers cleanup series, on top of tip:x86/cpu.  It is a
precursor for the upcoming v2 of the CPUID parser:

    [PATCH v1 00/26] x86: Introduce centralized CPUID model
    https://lore.kernel.org/lkml/20250506050437.10264-1-darwi@linutronix.de

as suggested by Ingo here:

    https://lore.kernel.org/lkml/aBnSgu_JyEi8fvog@gmail.com

* Summary:

The current CPUID header structure is:

    include/asm/
    ├── cpuid
    │   ├── api.h
    │   ├── leaf_0x2_api.h
    │   └── types.h
    └── cpuid.h

Simplify it into:

    include/asm/cpuid/
    ├── api.h
    └── types.h

Standardize the CPUID header namespace by enforcing a "cpuid_" prefix for
all exported symbols.  That is:

    have_cpuid_p()		➤	cpuid_feature()
    hypervisor_cpuid_base()	➤	cpuid_hypervisor_base()
    native_cpuid()		➤	cpuid_native()
    native_cpuid_REG()		➤	cpuid_REG_native()

Also rename:

    cpuid_get_leaf_0x2_regs()	➤	cpuid_leaf_0x2()

for consistency with the other <asm/cpuid/api.h> accessors that return
full CPUID register output; i.e., cpuid_leaf() and cpuid_subleaf().

Finally, rename:

    for_each_leaf_0x2_entry()   ➤	for_each_cpuid_0x2_desc()

to include "cpuid" in the iterator name, and since what is being iterated
upon is CPUID(0x2) cache and TLB "descriptos", not "entries".

* Testing:

- Basic one-by-one allyesconfig compilation

- Comparison of a before/after of below files:

  - /proc/cpuinfo
  - /sys/devices/system/cpu/
  - /sys/kernel/debug/x86/topo/
  - dmesg --notime | grep 'Last level [id]TLB entries'

Thanks,

8<-----

Ahmed S. Darwish (2):
  x86/cpuid: Fix CPUID(0x2) iterator kernel-doc
  x86/cpuid: Rename hypervisor_cpuid_base() to cpuid_hypervisor_base()

 arch/x86/include/asm/acrn.h           |  2 +-
 arch/x86/include/asm/cpuid/api.h      | 18 +++++++++---------
 arch/x86/include/asm/xen/hypervisor.h |  2 +-
 arch/x86/kernel/jailhouse.c           |  2 +-
 arch/x86/kernel/kvm.c                 |  2 +-
 arch/x86/kvm/cpuid.c                  |  2 +-
 6 files changed, 14 insertions(+), 14 deletions(-)

base-commit: 234792ea4421499f123e73b2e6411469a561a123
-- 
2.49.0

