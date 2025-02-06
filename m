Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D89E022F15F;
	Thu,  6 Feb 2025 13:30:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848610; cv=none; b=h9y77YS1ZStzmSvlo4bCX56DIJBTPQjFSGw+g0c4vOACbet6uhOGxLOWG/y/bBSv6+50WXV8Uz2bMh6VrZhk7QD7BQhEN0WKV5Mbf4LJrppuFAV2/lhAa/YZmJMgX0HnPyp0DN2Ji+sWYBe9pWE55yI6mi9ipNm5rS07Kxbx2O8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848610; c=relaxed/simple;
	bh=DoJEW5UPWLB+Obb+G1lnBQtqt27Wrp5AJwpwp06AFOo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VG1WLtqC5DgobyydKEL46jG4X3Fa3uv8T8pbHbmFRcpRJX+Bp13Rvogq0zLX7vWt46Tlt6CU/GDOwo4wK5I/WbFFxvwh+2U3OS2BpKqgp3o4yMmEPF1PCAlc8OLVGRgpcsHuIOA/3y3viNweD0rMgYjs2OQ283iqL94tXQRYoP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UlLGwm05; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UlLGwm05"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC5DAC4CEE7;
	Thu,  6 Feb 2025 13:30:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738848609;
	bh=DoJEW5UPWLB+Obb+G1lnBQtqt27Wrp5AJwpwp06AFOo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=UlLGwm05L5QcpmJWTDfel287vfdneKikF+X9x1PLxloCZkQFYSTdwfZk67H4CbACf
	 SjpGYMrBglL1eCrzUUZK57n5/M23b+qmEwIJqInUyuIAYnn+TmqNQ3nPdRbyYMKuNl
	 ZByOBYnqMEy5lY8CmeFvD9vgr6at+lROV7TfunAKx2CDVXwvh1AKBfFFfGVYMSC8vi
	 EMegz5keLq3kHnLZZhSOtnzyesXeNk71x3PhY+aFp5TEzIu3szzKS+tzHxI8Radxu8
	 EOITqVt3uvy9poaB8XIXos09+EVWO6TlgoFm05ynd9PhrdVKy6VE0uZZJFIrSgxsnl
	 do126iSCoB9zQ==
From: Mike Rapoport <rppt@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Alexander Graf <graf@amazon.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Anthony Yznaga <anthony.yznaga@oracle.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Ashish Kalra <ashish.kalra@amd.com>,
	Benjamin Herrenschmidt <benh@kernel.crashing.org>,
	Borislav Petkov <bp@alien8.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Eric Biederman <ebiederm@xmission.com>,
	Ingo Molnar <mingo@redhat.com>,
	James Gowans <jgowans@amazon.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Pratyush Yadav <ptyadav@amazon.de>,
	Rob Herring <robh+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	Stanislav Kinsburskii <skinsburskii@linux.microsoft.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Usama Arif <usama.arif@bytedance.com>,
	Will Deacon <will@kernel.org>,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-doc@vger.kernel.org,
	linux-mm@kvack.org,
	x86@kernel.org
Subject: [PATCH v4 13/14] memblock: Add KHO support for reserve_mem
Date: Thu,  6 Feb 2025 15:27:53 +0200
Message-ID: <20250206132754.2596694-14-rppt@kernel.org>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250206132754.2596694-1-rppt@kernel.org>
References: <20250206132754.2596694-1-rppt@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Alexander Graf <graf@amazon.com>

Linux has recently gained support for "reserve_mem": A mechanism to
allocate a region of memory early enough in boot that we can cross our
fingers and hope it stays at the same location during most boots, so we
can store for example ftrace buffers into it.

Thanks to KASLR, we can never be really sure that "reserve_mem"
allocations are static across kexec. Let's teach it KHO awareness so
that it serializes its reservations on kexec exit and deserializes them
again on boot, preserving the exact same mapping across kexec.

This is an example user for KHO in the KHO patch set to ensure we have
at least one (not very controversial) user in the tree before extending
KHO's use to more subsystems.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 mm/memblock.c | 131 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 131 insertions(+)

diff --git a/mm/memblock.c b/mm/memblock.c
index 84df96efca62..fdb08b60efc1 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -16,6 +16,9 @@
 #include <linux/kmemleak.h>
 #include <linux/seq_file.h>
 #include <linux/memblock.h>
+#include <linux/kexec_handover.h>
+#include <linux/kexec.h>
+#include <linux/libfdt.h>
 
 #include <asm/sections.h>
 #include <linux/io.h>
@@ -2423,6 +2426,70 @@ int reserve_mem_find_by_name(const char *name, phys_addr_t *start, phys_addr_t *
 }
 EXPORT_SYMBOL_GPL(reserve_mem_find_by_name);
 
+static bool __init reserve_mem_kho_revive(const char *name, phys_addr_t size,
+					  phys_addr_t align)
+{
+	const void *fdt = kho_get_fdt();
+	const char *path = "/reserve_mem";
+	int node, child, err;
+
+	if (!IS_ENABLED(CONFIG_KEXEC_HANDOVER))
+		return false;
+
+	if (!fdt)
+		return false;
+
+	node = fdt_path_offset(fdt, "/reserve_mem");
+	if (node < 0)
+		return false;
+
+	err = fdt_node_check_compatible(fdt, node, "reserve_mem-v1");
+	if (err) {
+		pr_warn("Node '%s' has unknown compatible", path);
+		return false;
+	}
+
+	fdt_for_each_subnode(child, fdt, node) {
+		const struct kho_mem *mem;
+		const char *child_name;
+		int len;
+
+		/* Search for old kernel's reserved_mem with the same name */
+		child_name = fdt_get_name(fdt, child, NULL);
+		if (strcmp(name, child_name))
+			continue;
+
+		err = fdt_node_check_compatible(fdt, child, "reserve_mem_map-v1");
+		if (err) {
+			pr_warn("Node '%s/%s' has unknown compatible", path, name);
+			continue;
+		}
+
+		mem = fdt_getprop(fdt, child, "mem", &len);
+		if (!mem || len != sizeof(*mem))
+			continue;
+
+		if (mem->addr & (align - 1)) {
+			pr_warn("KHO reserved_mem '%s' has wrong alignment (0x%lx, 0x%lx)",
+				name, (long)align, (long)mem->addr);
+			continue;
+		}
+
+		if (mem->size != size) {
+			pr_warn("KHO reserved_mem '%s' has wrong size (0x%lx != 0x%lx)",
+				name, (long)mem->size, (long)size);
+			continue;
+		}
+
+		reserved_mem_add(mem->addr, mem->size, name);
+		pr_info("Revived memory reservation '%s' from KHO", name);
+
+		return true;
+	}
+
+	return false;
+}
+
 /*
  * Parse reserve_mem=nn:align:name
  */
@@ -2478,6 +2545,11 @@ static int __init reserve_mem(char *p)
 	if (reserve_mem_find_by_name(name, &start, &tmp))
 		return -EBUSY;
 
+	/* Pick previous allocations up from KHO if available */
+	if (reserve_mem_kho_revive(name, size, align))
+		return 1;
+
+	/* TODO: Allocation must be outside of scratch region */
 	start = memblock_phys_alloc(size, align);
 	if (!start)
 		return -ENOMEM;
@@ -2488,6 +2560,65 @@ static int __init reserve_mem(char *p)
 }
 __setup("reserve_mem=", reserve_mem);
 
+static int reserve_mem_kho_write_map(void *fdt, struct reserve_mem_table *map)
+{
+	int err = 0;
+	const char compatible[] = "reserve_mem_map-v1";
+	struct kho_mem mem = {
+		.addr = map->start,
+		.size = map->size,
+	};
+
+	err |= fdt_begin_node(fdt, map->name);
+	err |= fdt_property(fdt, "compatible", compatible, sizeof(compatible));
+	err |= fdt_property(fdt, "mem", &mem, sizeof(mem));
+	err |= fdt_end_node(fdt);
+
+	return err;
+}
+
+static int reserve_mem_kho_notifier(struct notifier_block *self,
+				    unsigned long cmd, void *v)
+{
+	const char compatible[] = "reserve_mem-v1";
+	void *fdt = v;
+	int err = 0;
+	int i;
+
+	switch (cmd) {
+	case KEXEC_KHO_ABORT:
+		return NOTIFY_DONE;
+	case KEXEC_KHO_DUMP:
+		/* Handled below */
+		break;
+	default:
+		return NOTIFY_BAD;
+	}
+
+	if (!reserved_mem_count)
+		return NOTIFY_DONE;
+
+	err |= fdt_begin_node(fdt, "reserve_mem");
+	err |= fdt_property(fdt, "compatible", compatible, sizeof(compatible));
+	for (i = 0; i < reserved_mem_count; i++)
+		err |= reserve_mem_kho_write_map(fdt, &reserved_mem_table[i]);
+	err |= fdt_end_node(fdt);
+
+	return err ? NOTIFY_BAD : NOTIFY_DONE;
+}
+
+static struct notifier_block reserve_mem_kho_nb = {
+	.notifier_call = reserve_mem_kho_notifier,
+};
+
+static int __init reserve_mem_init(void)
+{
+	register_kho_notifier(&reserve_mem_kho_nb);
+
+	return 0;
+}
+core_initcall(reserve_mem_init);
+
 #if defined(CONFIG_DEBUG_FS) && defined(CONFIG_ARCH_KEEP_MEMBLOCK)
 static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_HOTPLUG)] = "HOTPLUG",
-- 
2.47.2

