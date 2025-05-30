Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDF2763B9
	for <linux-kernel@vger.kernel.org>; Fri, 30 May 2025 05:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748584778; cv=none; b=giVnasICJKt6MJjYOUiGisjanjRaOhF7JKWE8bntzIzzpFtpeSnn7hs789BswchPvlOiQuGmnysOauQD1vrRYISqoeyYEo8Bj+pm1JA4c5P2MCctb2ep0/ixZvilKrGt1ERNigrbOm7gtqqV7M+knWT12dVm6odphYeVByQ+9cQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748584778; c=relaxed/simple;
	bh=/i9nVhcDvr8G5lXk+KUDhiEoZ5s02UA1iiT6B/73tPo=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=qkkoS9w48pP55q4/7XGVHhT0cT3uaX/AtxQr7cULI6U/Jft+9IHgi4O15vK7VpriOA6TIL++XRyyCZwJyRPAznvbZquzSG9dVf106uM6tIsvXk6NOytDnUzilxDKTP4rc5gXL9vMLFUNnJLuHXxa42r+z9p+9RNWCYyaBvmd5yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=kHLER2pc; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="kHLER2pc"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748584771;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=VkAzu+xpmYPbsYYkCIPUfSD6aNMBuepomOHgYTZ9X2w=;
	b=kHLER2pcgmUiuA0z0yzfqH2r/CWETCWEI6QAp/WSqoqQYx1aui7ZgxaaxtFKByinuoKQD5
	orFLQURVuLCZzbKOFxyI90DyjyLI5nJPoIBMa2miNOxxxM6aC2F0nKqMSSGxHSrJTjOsFH
	pBseRaqfrhG35IqSyQiZkIFQIffez8Q=
From: Ye Liu <ye.liu@linux.dev>
To: akpm@linux-foundation.org
Cc: linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-toolchains@vger.kernel.org,
	osandov@osandov.com,
	paulmck@kernel.org,
	sweettea-kernel@dorminy.me,
	liuye@kylinos.cn,
	ye.liu@linux.dev,
	fweimer@redhat.com,
	sj@kernel.org,
	stephen.s.brennan@oracle.com
Subject: [PATCH v5] tools/mm: Add script to display page state for a given PID and VADDR
Date: Fri, 30 May 2025 13:58:55 +0800
Message-Id: <20250530055855.687067-1-ye.liu@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

From: Ye Liu <liuye@kylinos.cn>

Introduces a new drgn script, `show_page_info.py`, which allows users
to analyze the state of a page given a process ID (PID) and a virtual
address (VADDR). This can help kernel developers or debuggers easily
inspect page-related information in a live kernel or vmcore.

The script extracts information such as the page flags, mapping, and
other metadata relevant to diagnosing memory issues.

Output example:
sudo ./show_page_info.py 1 0x7fc988181000
PID: 1 Comm: systemd mm: 0xffff8d22c4089700
RAW: 0017ffffc000416c fffff939062ff708 fffff939062ffe08 ffff8d23062a12a8
RAW: 0000000000000000 ffff8d2323438f60 0000002500000007 ffff8d23203ff500
Page Address:    0xfffff93905664e00
Page Flags:      PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
                 PG_private|PG_reported|PG_has_hwpoisoned
Page Size:       4096
Page PFN:        0x159938
Page Physical:   0x159938000
Page Virtual:    0xffff8d2319938000
Page Refcount:   37
Page Mapcount:   7
Page Index:      0x0
Page Memcg Data: 0xffff8d23203ff500
Memcg Name:      init.scope
Memcg Path:      /sys/fs/cgroup/memory/init.scope
Page Mapping:    0xffff8d23062a12a8
Page Anon/File:  File
Page VMA:        0xffff8d22e06e0e40
VMA Start:       0x7fc988181000
VMA End:         0x7fc988185000
This page is part of a compound page.
This page is the head page of a compound page.
Head Page:       0xfffff93905664e00
Compound Order:  2
Number of Pages: 4

Signed-off-by: Ye Liu <liuye@kylinos.cn>

Changes in v5:
- Use platform-aware word-size reads instead of raw byte access.
- Replace Object() with drgn.cast() for type safety.
- Better handle memcg flags and error cases.
- Exit on fatal errors with sys.exit().
- Remove 'User Virtual Address'.
- Link to v4:https://lore.kernel.org/all/20250528091543.355386-1-ye.liu@linux.dev/

Changes in v4:
- Add error and exception handling.
- Adjust the way to obtain PAGE_SIZE.
- Fix the acquisition of memcg.
- Link to v3:https://lore.kernel.org/all/20250423014850.344501-1-ye.liu@linux.dev/

Changes in v3:
- Adjust display style.
- Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/

Changes in v2:
- Move the show_page_info.py file to tools/mm.
- Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
---
 MAINTAINERS                |   5 ++
 tools/mm/show_page_info.py | 169 +++++++++++++++++++++++++++++++++++++
 2 files changed, 174 insertions(+)
 create mode 100644 tools/mm/show_page_info.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 0cb9e55021cb..3cbd46bf1eab 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18726,6 +18726,11 @@ F:	Documentation/mm/page_table_check.rst
 F:	include/linux/page_table_check.h
 F:	mm/page_table_check.c
 
+PAGE STATE DEBUG SCRIPT
+M:	Ye Liu <liuye@kylinos.cn>
+S:	Maintained
+F:	tools/mm/show_page_info.py
+
 PANASONIC LAPTOP ACPI EXTRAS DRIVER
 M:	Kenneth Chan <kenneth.t.chan@gmail.com>
 L:	platform-driver-x86@vger.kernel.org
diff --git a/tools/mm/show_page_info.py b/tools/mm/show_page_info.py
new file mode 100644
index 000000000000..c46d8ea283d7
--- /dev/null
+++ b/tools/mm/show_page_info.py
@@ -0,0 +1,169 @@
+#!/usr/bin/env drgn
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2025 Ye Liu <liuye@kylinos.cn>
+
+import argparse
+import sys
+from drgn import Object, FaultError, PlatformFlags, cast
+from drgn.helpers.linux import find_task, follow_page, page_size
+from drgn.helpers.linux.mm import (
+    decode_page_flags, page_to_pfn, page_to_phys, page_to_virt, vma_find,
+    PageSlab, PageCompound, PageHead, PageTail, compound_head, compound_order, compound_nr
+)
+from drgn.helpers.linux.cgroup import cgroup_name, cgroup_path
+
+DESC = """
+This is a drgn script to show the page state.
+For more info on drgn, visit https://github.com/osandov/drgn.
+"""
+
+def format_page_data(page):
+    """
+    Format raw page data into a readable hex dump with "RAW:" prefix.
+
+    :param page: drgn.Object instance representing the page.
+    :return: Formatted string of memory contents.
+    """
+    try:
+        address = page.value_()
+        size = prog.type("struct page").size
+
+        if prog.platform.flags & PlatformFlags.IS_64_BIT:
+            word_size = 8
+        else:
+            word_size = 4
+        num_words = size // word_size
+
+        values = []
+        for i in range(num_words):
+            word_address = address + i * word_size
+            word = prog.read_word(word_address)
+            values.append(f"{word:0{word_size * 2}x}")
+
+        lines = [f"RAW: {' '.join(values[i:i + 4])}" for i in range(0, len(values), 4)]
+
+        return "\n".join(lines)
+
+    except FaultError as e:
+        return f"Error reading memory: {e}"
+    except Exception as e:
+        return f"Unexpected error: {e}"
+
+def get_memcg_info(page):
+    """Retrieve memory cgroup information for a page."""
+    try:
+        MEMCG_DATA_OBJEXTS = prog.constant("MEMCG_DATA_OBJEXTS").value_()
+        MEMCG_DATA_KMEM = prog.constant("MEMCG_DATA_KMEM").value_()
+        mask = prog.constant('__NR_MEMCG_DATA_FLAGS').value_() - 1
+        memcg_data = page.memcg_data.read_()
+        if memcg_data & MEMCG_DATA_OBJEXTS:
+            slabobj_ext = cast("struct slabobj_ext *", memcg_data & ~mask)
+            memcg = slabobj_ext.objcg.memcg.value_()
+        elif memcg_data & MEMCG_DATA_KMEM:
+            objcg = cast("struct obj_cgroup *", memcg_data & ~mask)
+            memcg = objcg.memcg.value_()
+        else:
+            memcg = cast("struct mem_cgroup *", memcg_data & ~mask)
+
+        if memcg.value_() == 0:
+            return "none", "/sys/fs/cgroup/memory/"
+        cgrp = memcg.css.cgroup
+        return cgroup_name(cgrp).decode(), f"/sys/fs/cgroup/memory{cgroup_path(cgrp).decode()}"
+    except FaultError as e:
+        return "unknown", f"Error retrieving memcg info: {e}"
+    except Exception as e:
+        return "unknown", f"Unexpected error: {e}"
+
+def show_page_state(page, addr, mm, pid, task):
+    """Display detailed information about a page."""
+    try:
+        print(f'PID: {pid} Comm: {task.comm.string_().decode()} mm: {hex(mm)}')
+        try:
+            print(format_page_data(page))
+        except FaultError as e:
+            print(f"Error reading page data: {e}")
+        fields = {
+            "Page Address": hex(page.value_()),
+            "Page Flags": decode_page_flags(page),
+            "Page Size": prog["PAGE_SIZE"].value_(),
+            "Page PFN": hex(page_to_pfn(page).value_()),
+            "Page Physical": hex(page_to_phys(page).value_()),
+            "Page Virtual": hex(page_to_virt(page).value_()),
+            "Page Refcount": page._refcount.counter.value_(),
+            "Page Mapcount": page._mapcount.counter.value_(),
+            "Page Index": hex(page.__folio_index.value_()),
+            "Page Memcg Data": hex(page.memcg_data.value_()),
+        }
+
+        memcg_name, memcg_path = get_memcg_info(page)
+        fields["Memcg Name"] = memcg_name
+        fields["Memcg Path"] = memcg_path
+        fields["Page Mapping"] = hex(page.mapping.value_())
+        fields["Page Anon/File"] = "Anon" if page.mapping.value_() & 0x1 else "File"
+
+        try:
+            vma = vma_find(mm, addr)
+            fields["Page VMA"] = hex(vma.value_())
+            fields["VMA Start"] = hex(vma.vm_start.value_())
+            fields["VMA End"] = hex(vma.vm_end.value_())
+        except FaultError as e:
+            fields["Page VMA"] = "Unavailable"
+            fields["VMA Start"] = "Unavailable"
+            fields["VMA End"] = "Unavailable"
+            print(f"Error retrieving VMA information: {e}")
+
+        # Calculate the maximum field name length for alignment
+        max_field_len = max(len(field) for field in fields)
+
+        # Print aligned fields
+        for field, value in fields.items():
+            print(f"{field}:".ljust(max_field_len + 2) + f"{value}")
+
+        # Additional information about the page
+        if PageSlab(page):
+            print("This page belongs to the slab allocator.")
+
+        if PageCompound(page):
+            print("This page is part of a compound page.")
+            if PageHead(page):
+                print("This page is the head page of a compound page.")
+            if PageTail(page):
+                print("This page is the tail page of a compound page.")
+            print(f"{'Head Page:'.ljust(max_field_len + 2)}{hex(compound_head(page).value_())}")
+            print(f"{'Compound Order:'.ljust(max_field_len + 2)}{compound_order(page).value_()}")
+            print(f"{'Number of Pages:'.ljust(max_field_len + 2)}{compound_nr(page).value_()}")
+        else:
+            print("This page is not part of a compound page.")
+    except FaultError as e:
+        print(f"Error accessing page state: {e}")
+    except Exception as e:
+        print(f"Unexpected error: {e}")
+
+def main():
+    """Main function to parse arguments and display page state."""
+    parser = argparse.ArgumentParser(description=DESC, formatter_class=argparse.RawTextHelpFormatter)
+    parser.add_argument('pid', metavar='PID', type=int, help='Target process ID (PID)')
+    parser.add_argument('vaddr', metavar='VADDR', type=str, help='Target virtual address in hexadecimal format (e.g., 0x7fff1234abcd)')
+    args = parser.parse_args()
+
+    try:
+        vaddr = int(args.vaddr, 16)
+    except ValueError:
+        sys.exit(f"Error: Invalid virtual address format: {args.vaddr}")
+
+    try:
+        task = find_task(args.pid)
+        mm = task.mm
+        page = follow_page(mm, vaddr)
+
+        if page:
+            show_page_state(page, vaddr, mm, args.pid, task)
+        else:
+            sys.exit(f"Address {hex(vaddr)} is not mapped.")
+    except FaultError as e:
+        sys.exit(f"Error accessing task or memory: {e}")
+    except Exception as e:
+        sys.exit(f"Unexpected error: {e}")
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

