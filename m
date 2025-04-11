Received: from out-188.mta1.migadu.com (out-188.mta1.migadu.com [95.215.58.188])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95DFF1CEACB
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 20:16:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.188
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744402580; cv=none; b=ktdRl2zvPMgqQEcsJp3NmnWnS13mnoHHUdasgwhCAOoOMherQgl6pZUYCnAE3oHyz60I26u1WDS3Zd6zyTQCLrJA2z5BmgHUS1eJ0kr0cfbVNY2xWXal4Edqo+FR9p9fAfaY/q+cWh9CZK53WUlGCUIZnzafh1cs9oBojhrjHJE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744402580; c=relaxed/simple;
	bh=D65aqHNi7rP7W761x+ZUD+QqDdC6J3sUfOhPGklvNu8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O6r1oLurwQoHDg4t7CxSuRqyyLUJ5wTs8VDc3932jVJOBm16xy3ldju5zarGvikqngTllxQxfFEZpmguEYIHbt+l0XzSEv7uymD+Kgt5fjEq7KX4zJj+lbUhswPd7ZDTdRGSTwtwHsqMwuzYqOvOF0+tRD+tJ4LsjnSjUZL2R28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=iDYmBP00; arc=none smtp.client-ip=95.215.58.188
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="iDYmBP00"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1744402574;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=BndPFWavlZ2+rsgVcPwsNcZUmGDYPRAG8YGO0uh87Ck=;
	b=iDYmBP00a4pocU2CfXW6jhKhy5wCYxeuGAJzghc6x0UDUosFX6jVVoZw3p5cFOuYrhpf47
	0UwjjMkD/U1eAGvqzYArtU/oR7MR2Z3WgY1BPRWGWB52vaJg26pmbDj1zjYyuweRisr3Fu
	+EXjfjSv+ML9GufraMLXyQKpYfuG9YEt5CezB3vnYfgaBfeSCtTuLZeXdWoVb95zUckuUt
	pVOFa7oirkpCkZYY1psLSBgA2RoYDDFJilFLDxyteoZWfOoOjADkV3txPrbKLjYN9k+C4m
	vfAT5V1uql+rUTdWdyImuRKCXcAt8+Y0+u27cAKduukiIM66Iuve4LN47PPCMA==
From: Ignacio Encinas <ignacio@iencinas.com>
Date: Fri, 11 Apr 2025 22:15:08 +0200
Subject: [PATCH RFC] riscv: mm: fix boot hang when the kernel is loaded
 into a non-canonical address
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250411-riscv-dont-hang-on-noncanonical-paddr-v1-1-dc665a46246d@iencinas.com>
X-B4-Tracking: v=1; b=H4sIAEx4+WcC/x2NQQoCMQxFrzJkbaBTFKtbwQO4FRehSTUg6ZAOg
 zDM3a1uHjwe/L9CE1dpcB5WcFm0abUu426A/CJ7Cip3hxjiIezDEV1bXpCrzfjrWA2tWqYOzfT
 GiZgdTxxTKmPgkgj61uRS9PP/ucPteoHHtn0BmdRHxHwAAAA=
X-Change-ID: 20250407-riscv-dont-hang-on-noncanonical-paddr-9d288f10df8a
To: Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-kernel-mentees@lists.linux.dev, skhan@linuxfoundation.org, 
 Palmer Dabbelt <palmer@rivosinc.com>, linux-kernel@vger.kernel.org, 
 linux-riscv@lists.infradead.org, Nick Kossifidis <mick@ics.forth.gr>, 
 Ignacio Encinas <ignacio@iencinas.com>
X-Migadu-Flow: FLOW_OUT

Virtual memory systems usually impose restrictions on the virtual
addresses that can be translated. For RISC-V, this is specified in
the Subsection "Addressing and Memory protection" of "The RISC-V
Instruction Set Manual: Volume II: Privileged Architecture" associated
with each SV{39,48,59} mode.

Addresses that can be translated are also known as "canonical
addresses". Using SV39 as an example and quoting the ISA Manual:

	Instruction fetch addresses and load and store effective
	addresses, which are 64 bits, must have bits 63–39 all equal to
	bit 38, or else a page-fault exception will occur.

Given that RISC-V systems don't advertise which SV modes are supported,
this has to be detected at boot time (this is currently done by
set_satp_mode). In order to do so, a temporary 1:1 mapping is set. If
the set_satp_mode function is loaded into a "non-canonical" physical
address, this 1:1 mapping will make the boot hang.

Fix the issue by avoiding SV modes that would trigger the aforementioned
bug.

Fixes: e8a62cc26ddf ("riscv: Implement sv48 support")
Reported-by: Nick Kossifidis <mick@ics.forth.gr>
Closes: https://lore.kernel.org/all/ff85cdc4-b1e3-06a3-19fc-a7e1acf99d40@ics.forth.gr/
Signed-off-by: Ignacio Encinas <ignacio@iencinas.com>
---
This isn't bulletproof because we might skip the *only* level supported
by a CPU (AFAIK implementations are only required to support 1 SV mode).

SV48 might be the only supported mode and the kernel might be loaded
into a "non-canonical" address for SV48. The kernel will assume SV39
is supported and try to boot it. However, this is a strict improvement
over what is already there.

This issue would go away if we could do the SATP probing in Machine
mode, as that wouldn't turn virtual memory on. Perhaps this "SV mode
supported" discovery should be offered by SBI?

This was pointed out in the original patch review [1]. This issue seems
to be of no practical relevance (nobody has complained)

[1] https://lore.kernel.org/all/ff85cdc4-b1e3-06a3-19fc-a7e1acf99d40@ics.forth.gr/

In order to reproduce the issue it suffices to tweak qemu

--- START DIFF ---
 diff --git a/hw/riscv/virt.c b/hw/riscv/virt.c
 index 45a8c4f8190d..16c5a63176c5 100644
 --- a/hw/riscv/virt.c
 +++ b/hw/riscv/virt.c
 @@ -88,7 +88,7 @@ static const MemMapEntry virt_memmap[] = {
      [VIRT_IMSIC_S] =      { 0x28000000, VIRT_IMSIC_MAX_SIZE },
      [VIRT_PCIE_ECAM] =    { 0x30000000,    0x10000000 },
      [VIRT_PCIE_MMIO] =    { 0x40000000,    0x40000000 },
 -    [VIRT_DRAM] =         { 0x80000000,           0x0 },
 +    [VIRT_DRAM] =         { 0x800000000000,           0x0 },
  };

  /* PCIe high mmio is fixed for RV32 */
--- END DIFF ---

qemu-system-riscv64 -nographic -machine virt -kernel Image -initrd initramfs -append "no5lvl"

should work but

patched-qemu-system-riscv64 -nographic -machine virt -kernel Image -initrd initramfs -append "no5lvl"

will not boot.

(*) I use SV48 to trigger the issue (no5lvl) because doing this with
SV57 triggers a warning regarding PMP and I don't know if that might
affect something else. The SV mode doesn't really matter here.

A couple of things I'm not sure about:
	1. canonical_vaddr won't be called outside CONFIG_64BIT. I
	   figured the #ifdef doesn't hurt all that much despite being
	   useless
	2. Is panicking ok? I don't quite like it but I can't think of
	   anything else
---
 arch/riscv/mm/init.c | 43 +++++++++++++++++++++++++++++++++++++++----
 1 file changed, 39 insertions(+), 4 deletions(-)

diff --git a/arch/riscv/mm/init.c b/arch/riscv/mm/init.c
index ab475ec6ca42..6cd5abc0e26a 100644
--- a/arch/riscv/mm/init.c
+++ b/arch/riscv/mm/init.c
@@ -7,6 +7,7 @@
  */
 
 #include <linux/init.h>
+#include <linux/bits.h>
 #include <linux/mm.h>
 #include <linux/memblock.h>
 #include <linux/initrd.h>
@@ -844,6 +845,37 @@ static void __init set_mmap_rnd_bits_max(void)
 	mmap_rnd_bits_max = MMAP_VA_BITS - PAGE_SHIFT - 3;
 }
 
+static int __init canonical_vaddr(unsigned long vaddr)
+{
+#ifdef CONFIG_64BIT
+	unsigned long sv_mode_mask;
+	unsigned long masked_vaddr;
+	unsigned long mask_begin;
+
+	switch (satp_mode) {
+	case SATP_MODE_57:
+		mask_begin = 56;
+		break;
+	case SATP_MODE_48:
+		mask_begin = 47;
+		break;
+	case SATP_MODE_39:
+		mask_begin = 38;
+		break;
+	default:
+		panic("Unknown Virtual Memory mode!");
+	}
+
+	sv_mode_mask = GENMASK(63, mask_begin);
+	masked_vaddr = vaddr & sv_mode_mask;
+
+	// For SV<X> bits [63, X-1] must be all ones or zeros
+	return masked_vaddr == 0 || masked_vaddr == sv_mode_mask;
+#else
+	return true;
+#endif
+}
+
 /*
  * There is a simple way to determine if 4-level is supported by the
  * underlying hardware: establish 1:1 mapping in 4-level page table mode
@@ -887,12 +919,15 @@ static __init void set_satp_mode(uintptr_t dtb_pa)
 				(uintptr_t)early_p4d : (uintptr_t)early_pud,
 			   PGDIR_SIZE, PAGE_TABLE);
 
+	hw_satp = 0ULL;
 	identity_satp = PFN_DOWN((uintptr_t)&early_pg_dir) | satp_mode;
 
-	local_flush_tlb_all();
-	csr_write(CSR_SATP, identity_satp);
-	hw_satp = csr_swap(CSR_SATP, 0ULL);
-	local_flush_tlb_all();
+	if (canonical_vaddr((uint64_t)set_satp_mode_pmd)) {
+		local_flush_tlb_all();
+		csr_write(CSR_SATP, identity_satp);
+		hw_satp = csr_swap(CSR_SATP, 0ULL);
+		local_flush_tlb_all();
+	}
 
 	if (hw_satp != identity_satp) {
 		if (pgtable_l5_enabled) {

---
base-commit: 0af2f6be1b4281385b618cb86ad946eded089ac8
change-id: 20250407-riscv-dont-hang-on-noncanonical-paddr-9d288f10df8a

Best regards,
-- 
Ignacio Encinas <ignacio@iencinas.com>

