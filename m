Received: from pegase2.c-s.fr (pegase2.c-s.fr [93.17.235.10])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9852AA935
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 10:20:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=93.17.235.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738405211; cv=none; b=hrLhKJxUmr87fJnihXtzvqVlF36yKmFGiDvKp8Jloj2Vxeb5KfSE59e/EmpCVgNT0rAZukaKwCThv2C3axkzEiivT8nXHwTccXbXoCn6zCKmKO21fzZr2O8xo56DgLc4VRzkb9kVN0FixGLOViRTebhM+0Je0+2ieMW/odd7QuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738405211; c=relaxed/simple;
	bh=IXLjIKMuTavW1pDWvDyywJCypmcD9yKTT9S1qkcCOu8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qVCVD8dtvixtZq3Wr8BmpRf8Jncrq3IwD/m5M8qpA43sgJIxx91UHdGsUcfzGpS1/m5hr66FjYqOV260WdJ5CCYit76Q9MiijtgoMKEtA9vQPfbA9hHTrtW4ZaerQpEuTjKSblO2HxoOwp6mfn9UcgFXiRrQAC5KZ1TAGWL+YZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu; spf=pass smtp.mailfrom=csgroup.eu; arc=none smtp.client-ip=93.17.235.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=csgroup.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csgroup.eu
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4YlT035vgpz9sRr;
	Sat,  1 Feb 2025 11:05:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id 44aJXLhgEmTy; Sat,  1 Feb 2025 11:05:07 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4YlT034Cr1z9sRk;
	Sat,  1 Feb 2025 11:05:07 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 7AF0B8B764;
	Sat,  1 Feb 2025 11:05:07 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id peW_oZzE6k61; Sat,  1 Feb 2025 11:05:07 +0100 (CET)
Received: from PO20335.idsi0.si.c-s.fr (unknown [192.168.235.99])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 012D88B763;
	Sat,  1 Feb 2025 11:05:06 +0100 (CET)
From: Christophe Leroy <christophe.leroy@csgroup.eu>
To: Balbir Singh <bsingharora@gmail.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Naveen N Rao <naveen@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	Erhard Furtner <erhard_f@mailbox.org>
Subject: [PATCH] powerpc/code-patching: Fix KASAN hit by not flagging text patching area as VM_ALLOC
Date: Sat,  1 Feb 2025 11:04:36 +0100
Message-ID: <606946a557db1b5e9771b2a6fed30af3c0bc4863.1738404206.git.christophe.leroy@csgroup.eu>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1738404280; l=4348; i=christophe.leroy@csgroup.eu; s=20211009; h=from:subject:message-id; bh=IXLjIKMuTavW1pDWvDyywJCypmcD9yKTT9S1qkcCOu8=; b=rY99R2gmgrYtl3WBL0z/ZbNXgdPXWwU2n4XknyljHCNZEA62TfMx69RHlKBMyriw+f7SqRn7F ErzOhNC9b1hDt9UspUGPUPpSfspXDYMtUromSwgOiTb1cMfE94f4am0
X-Developer-Key: i=christophe.leroy@csgroup.eu; a=ed25519; pk=HIzTzUj91asvincQGOFx6+ZF5AoUuP9GdOtQChs7Mm0=
Content-Transfer-Encoding: 8bit

Erhard reported the following KASAN hit while booting his PowerMac G4
with a KASAN-enabled kernel 6.13-rc6:

BUG: KASAN: vmalloc-out-of-bounds in copy_to_kernel_nofault+0xd8/0x1c8
Write of size 8 at addr f1000000 by task chronyd/1293

CPU: 0 UID: 123 PID: 1293 Comm: chronyd Tainted: G        W          6.13.0-rc6-PMacG4 #2
Tainted: [W]=WARN
Hardware name: PowerMac3,6 7455 0x80010303 PowerMac
Call Trace:
[c2437590] [c1631a84] dump_stack_lvl+0x70/0x8c (unreliable)
[c24375b0] [c0504998] print_report+0xdc/0x504
[c2437610] [c050475c] kasan_report+0xf8/0x108
[c2437690] [c0505a3c] kasan_check_range+0x24/0x18c
[c24376a0] [c03fb5e4] copy_to_kernel_nofault+0xd8/0x1c8
[c24376c0] [c004c014] patch_instructions+0x15c/0x16c
[c2437710] [c00731a8] bpf_arch_text_copy+0x60/0x7c
[c2437730] [c0281168] bpf_jit_binary_pack_finalize+0x50/0xac
[c2437750] [c0073cf4] bpf_int_jit_compile+0xb30/0xdec
[c2437880] [c0280394] bpf_prog_select_runtime+0x15c/0x478
[c24378d0] [c1263428] bpf_prepare_filter+0xbf8/0xc14
[c2437990] [c12677ec] bpf_prog_create_from_user+0x258/0x2b4
[c24379d0] [c027111c] do_seccomp+0x3dc/0x1890
[c2437ac0] [c001d8e0] system_call_exception+0x2dc/0x420
[c2437f30] [c00281ac] ret_from_syscall+0x0/0x2c
--- interrupt: c00 at 0x5a1274
NIP:  005a1274 LR: 006a3b3c CTR: 005296c8
REGS: c2437f40 TRAP: 0c00   Tainted: G        W           (6.13.0-rc6-PMacG4)
MSR:  0200f932 <VEC,EE,PR,FP,ME,IR,DR,RI>  CR: 24004422  XER: 00000000

GPR00: 00000166 af8f3fa0 a7ee3540 00000001 00000000 013b6500 005a5858 0200f932
GPR08: 00000000 00001fe9 013d5fc8 005296c8 2822244c 00b2fcd8 00000000 af8f4b57
GPR16: 00000000 00000001 00000000 00000000 00000000 00000001 00000000 00000002
GPR24: 00afdbb0 00000000 00000000 00000000 006e0004 013ce060 006e7c1c 00000001
NIP [005a1274] 0x5a1274
LR [006a3b3c] 0x6a3b3c
--- interrupt: c00

The buggy address belongs to the virtual mapping at
 [f1000000, f1002000) created by:
 text_area_cpu_up+0x20/0x190

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:00000000 index:0x0 pfn:0x76e30
flags: 0x80000000(zone=2)
raw: 80000000 00000000 00000122 00000000 00000000 00000000 ffffffff 00000001
raw: 00000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 f0ffff00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 f0ffff80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>f1000000: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
           ^
 f1000080: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
 f1000100: f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8 f8
==================================================================

f8 corresponds to KASAN_VMALLOC_INVALID which means the area is not
initialised hence not supposed to be used yet.

Powerpc text patching infrastructure allocates a virtual memory area
using get_vm_area() and flags it as VM_ALLOC. But that flag is meant
to be used for vmalloc() and vmalloc() allocated memory is not
supposed to be used before a call to __vmalloc_node_range() which is
never called for that area.

That went undetected until commit e4137f08816b ("mm, kasan, kmsan:
instrument copy_from/to_kernel_nofault")

The area allocated by text_area_cpu_up() is not vmalloc memory, it is
mapped directly on demand when needed by map_kernel_page(). There is
no VM flag corresponding to such usage, so just pass no flag. That way
the area will be unpoisonned and usable immediately.

Reported-by: Erhard Furtner <erhard_f@mailbox.org>
Closes: https://lore.kernel.org/all/20250112135832.57c92322@yea/
Fixes: 37bc3e5fd764 ("powerpc/lib/code-patching: Use alternate map for patch_instruction()")
Signed-off-by: Christophe Leroy <christophe.leroy@csgroup.eu>
---
 arch/powerpc/lib/code-patching.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index af97fbb3c257..8a378fc19074 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -108,7 +108,7 @@ static int text_area_cpu_up(unsigned int cpu)
 	unsigned long addr;
 	int err;
 
-	area = get_vm_area(PAGE_SIZE, VM_ALLOC);
+	area = get_vm_area(PAGE_SIZE, 0);
 	if (!area) {
 		WARN_ONCE(1, "Failed to create text area for cpu %d\n",
 			cpu);
-- 
2.47.0

