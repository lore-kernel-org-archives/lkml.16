Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F86A1C5F23
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 18:21:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744222896; cv=none; b=sriAh4QpTNNUvfdi8l37Oj+iEJ4nNGk6MotFfbCSPCeuYNikXpjLYWcgJVmH7ssmvRW+IihIwkUJWX0YK7YxEhwmUgxT258qy9S6Q7wNhGpDhNqjhQYZmV6o+76FLYFDrotfgpCxjnjWUB/ZSJ+cVZe1Z/TajXYYE4VzCV8lcY0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744222896; c=relaxed/simple;
	bh=rF/4ACsIG/tFNbGRO5wYRJcR4xBaQIyDKKhb987ERh4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=YRausohSDhULEqubxWEVNX8DXQ811s85v5+3291733MLcELge6iXPlsZ/aav00ZA3DEZZVUnbDPsSJ6JA7ylVRNh0LwabqGpSSrjOkV5aHcXVSuohLTWvuvoSpEcid954oWdPfWL93VXKAINGQhAc0t/ui0t4z2jIy5f8SS9xVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=E3oGybFg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="E3oGybFg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E29FC4CEE2;
	Wed,  9 Apr 2025 18:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744222896;
	bh=rF/4ACsIG/tFNbGRO5wYRJcR4xBaQIyDKKhb987ERh4=;
	h=From:To:Cc:Subject:Date:From;
	b=E3oGybFgZtJlcpFYB1nP9daP5Y7GT1NLQn5PqAFqpB3CfHPMzeogJn5RVK/rEkVmY
	 QiKQGIIH0a2MrLhZknbavuqM/KVPneU4io5Mqq3iYgbBDZxape/5JmM67z/k2SZ+ik
	 5DiBEPymTtxujlszDrYdWNNffNbT/sECvg+nuEepFb8uWFaDZrhhJEe62HN2ZnpI75
	 fXlz/9VApoFedhxBm2OIqFMVa41/6wDZz90/VxCXzr/8grn7y0Y4i4I/9E2Y5NImGL
	 8RzV51jPUa0fdTm0saXYA6KRygSE6G/YzvMrUYQtCsqikt2rVLSheXXM9DORj+UFbU
	 tnZ35Bj1P1TSQ==
From: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@kernel.org>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Nick Kossifidis <mick@ics.forth.gr>,
	linux-riscv@lists.infradead.org
Cc: =?UTF-8?q?Bj=C3=B6rn=20T=C3=B6pel?= <bjorn@rivosinc.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH fixes] riscv: Properly export reserved regions in /proc/iomem
Date: Wed,  9 Apr 2025 20:21:27 +0200
Message-ID: <20250409182129.634415-1-bjorn@kernel.org>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Björn Töpel <bjorn@rivosinc.com>

The /proc/iomem represents the kernel's memory map. Regions marked
with "Reserved" tells the user that the range should not be tampered
with. Kexec-tools, when using the older kexec_load syscall relies on
the "Reserved" regions to build the memory segments, that will be the
target of the new kexec'd kernel.

The RISC-V port tries to expose all reserved regions to userland, but
some regions were not properly exposed: Regions that resided in both
the "regular" and reserved memory block, e.g. the EFI Memory Map. A
missing entry could result in reserved memory being overwritten.

It turns out, that arm64, and loongarch had a similar issue a while
back:

  commit d91680e687f4 ("arm64: Fix /proc/iomem for reserved but not memory regions")
  commit 50d7ba36b916 ("arm64: export memblock_reserve()d regions via /proc/iomem")

Similar to the other ports, resolve the issue by splitting the regions
in an arch initcall, since we need a working allocator.

Fixes: ffe0e5261268 ("RISC-V: Improve init_resources()")
Signed-off-by: Björn Töpel <bjorn@rivosinc.com>
---
 arch/riscv/kernel/setup.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/setup.c b/arch/riscv/kernel/setup.c
index c174544eefc8..f7c9a1caa83e 100644
--- a/arch/riscv/kernel/setup.c
+++ b/arch/riscv/kernel/setup.c
@@ -66,6 +66,9 @@ static struct resource bss_res = { .name = "Kernel bss", };
 static struct resource elfcorehdr_res = { .name = "ELF Core hdr", };
 #endif
 
+static int num_standard_resources;
+static struct resource *standard_resources;
+
 static int __init add_resource(struct resource *parent,
 				struct resource *res)
 {
@@ -139,7 +142,7 @@ static void __init init_resources(void)
 	struct resource *res = NULL;
 	struct resource *mem_res = NULL;
 	size_t mem_res_sz = 0;
-	int num_resources = 0, res_idx = 0;
+	int num_resources = 0, res_idx = 0, non_resv_res = 0;
 	int ret = 0;
 
 	/* + 1 as memblock_alloc() might increase memblock.reserved.cnt */
@@ -193,6 +196,7 @@ static void __init init_resources(void)
 	/* Add /memory regions to the resource tree */
 	for_each_mem_region(region) {
 		res = &mem_res[res_idx--];
+		non_resv_res++;
 
 		if (unlikely(memblock_is_nomap(region))) {
 			res->name = "Reserved";
@@ -210,6 +214,9 @@ static void __init init_resources(void)
 			goto error;
 	}
 
+	num_standard_resources = non_resv_res;
+	standard_resources = &mem_res[res_idx + 1];
+
 	/* Clean-up any unused pre-allocated resources */
 	if (res_idx >= 0)
 		memblock_free(mem_res, (res_idx + 1) * sizeof(*mem_res));
@@ -221,6 +228,33 @@ static void __init init_resources(void)
 	memblock_free(mem_res, mem_res_sz);
 }
 
+static int __init reserve_memblock_reserved_regions(void)
+{
+	u64 i, j;
+
+	for (i = 0; i < num_standard_resources; i++) {
+		struct resource *mem = &standard_resources[i];
+		phys_addr_t r_start, r_end, mem_size = resource_size(mem);
+
+		if (!memblock_is_region_reserved(mem->start, mem_size))
+			continue;
+
+		for_each_reserved_mem_range(j, &r_start, &r_end) {
+			resource_size_t start, end;
+
+			start = max(PFN_PHYS(PFN_DOWN(r_start)), mem->start);
+			end = min(PFN_PHYS(PFN_UP(r_end)) - 1, mem->end);
+
+			if (start > mem->end || end < mem->start)
+				continue;
+
+			reserve_region_with_split(mem, start, end, "Reserved");
+		}
+	}
+
+	return 0;
+}
+arch_initcall(reserve_memblock_reserved_regions);
 
 static void __init parse_dtb(void)
 {

base-commit: a24588245776dafc227243a01bfbeb8a59bafba9
-- 
2.45.2

