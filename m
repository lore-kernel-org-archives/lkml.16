Received: from out-187.mta1.migadu.com (out-187.mta1.migadu.com [95.215.58.187])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B3771ACEAC
	for <linux-kernel@vger.kernel.org>; Wed, 28 May 2025 09:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.187
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748423792; cv=none; b=O8TzjgnRNae1h9Bu6CYW3KHGNNcJZDtf73AcJCCe4jl2Nr2uz6Cm4fpjiyuHaEZYdAa/m0hJnYdnhXzUXOn7eptAXNJ65/zm0GhTCYrhWoMzhz6EFAqdaMumcik51QmPywpWv1cnczWZ51NfTJXah670OO8V7ueOa53t8rgOgqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748423792; c=relaxed/simple;
	bh=qahWzOC9XfJSDsBM1Z15UHDUGAcWCWI7sJ8U8vqAHZM=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=TwDik3Pmg2xihHKA+Wq4dkN49R6v206fwcqsp+UsVXxCc1PO5wRlIdQ8bnxEudwJXNmQvpAdDtklr6ReDMVfEvZuVuzO4Sx9wod2P7YBtu3e5rxQGXMbexvxjDYrsjRQ4NywP+uf/tZ8mGCo+4o2Rswwb+xP8sbqdQJ+6L9DhGw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=nvHJMyo4; arc=none smtp.client-ip=95.215.58.187
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="nvHJMyo4"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1748423776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Re+0CfHFPp2+XEq5Eas2GB9V8vWyFYXfz2FQ+a6YE58=;
	b=nvHJMyo43wymkPFRmv4HWt/fOCHgseR+XsxmVgRVGRQg7J/UXcabhdvI31jeyPMQ4QjFrF
	00DfZ4QD4aB2xdJ8OSQ1n1WT7xFbZVUxS8ZUN7ZSSYzGZxHyfypyAxYzkgl//I+cEe2VBF
	dlT4QBmRvemQv6M1NfwKy1sd69Z6JFM=
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
	sj@kernel.org
Subject: [PATCH v4] tools/mm: Add script to display page state for a given PID and VADDR
Date: Wed, 28 May 2025 17:15:43 +0800
Message-Id: <20250528091543.355386-1-ye.liu@linux.dev>
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
sudo ./show_page_info.py 1 0x7fb3eb1b2000
PID: 1 Comm: systemd mm: 0xffff8d27279f9cc0
Raw: 0017ffffc000416c fffff31105a61b08 fffff31105a63608 ffff8d27121326a8
Raw: 0000000000000000 ffff8d271b9dcc40 0000002500000007 ffff8d2711f12700
User Virtual Address: 0x7fb3eb1b2000
Page Address:         0xfffff31106356a00
Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
                      PG_private|PG_reported|PG_has_hwpoisoned
Page Size:            4096
Page PFN:             0x18d5a8
Page Physical:        0x18d5a8000
Page Virtual:         0xffff8d274d5a8000
Page Refcount:        37
Page Mapcount:        7
Page Index:           0x0
Page Memcg Data:      0xffff8d2711f12700
Memcg Name:           init.scope
Memcg Path:           /sys/fs/cgroup/memory/init.scope
Page Mapping:         0xffff8d27121326a8
Page Anon/File:       File
Page VMA:             0xffff8d26cac47600
VMA Start:            0x7fb3eb1b2000
VMA End:              0x7fb3eb1b6000
This page is part of a compound page.
This page is the head page of a compound page.
Head Page:            0xfffff31106356a00
Compound Order:       2
Number of Pages:      4

Signed-off-by: Ye Liu <liuye@kylinos.cn>

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
 tools/mm/show_page_info.py | 152 +++++++++++++++++++++++++++++++++++++
 2 files changed, 157 insertions(+)
 create mode 100755 tools/mm/show_page_info.py

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
new file mode 100755
index 000000000000..5c46501e24f4
--- /dev/null
+++ b/tools/mm/show_page_info.py
@@ -0,0 +1,152 @@
+#!/usr/bin/env drgn
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2025 Ye Liu <liuye@kylinos.cn>
+
+import argparse
+from drgn import Object, FaultError
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
+MEMCG_DATA_OBJEXTS = 1 << 0
+MEMCG_DATA_KMEM = 1 << 1
+__NR_MEMCG_DATA_FLAGS = 1 << 2
+
+def format_page_data(data):
+    """Format raw page data into a readable hex dump."""
+    try:
+        chunks = [data[i:i+8] for i in range(0, len(data), 8)]
+        hex_chunks = ["".join(f"{b:02x}" for b in chunk[::-1]) for chunk in chunks]
+        lines = [" ".join(hex_chunks[i:i+4]) for i in range(0, len(hex_chunks), 4)]
+        return "\n".join(f"Raw: {line}" for line in lines)
+    except Exception as e:
+        return f"Error formatting page data: {e}"
+
+def get_memcg_info(page):
+    """Retrieve memory cgroup information for a page."""
+    try:
+        memcg_data = page.memcg_data.value_()
+        if memcg_data & MEMCG_DATA_OBJEXTS:
+            slabobj_ext = Object(prog, "struct slabobj_ext *", address=memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1))
+            memcg_value = slabobj_ext.objcg.memcg.value_()
+        elif memcg_data & MEMCG_DATA_KMEM:
+            objcg = Object(prog, "struct obj_cgroup *", address=memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1))
+            memcg_value = objcg.memcg.value_()
+        else:
+            memcg_value = memcg_data & ~(__NR_MEMCG_DATA_FLAGS - 1)
+
+        if memcg_value == 0:
+            return "none", "/sys/fs/cgroup/memory/"
+
+        memcg = Object(prog, "struct mem_cgroup *", address=memcg_value)
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
+            print(format_page_data(prog.read(page.value_(), 64)))
+        except FaultError as e:
+            print(f"Error reading page data: {e}")
+
+        fields = {
+            "User Virtual Address": hex(addr),
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
+        print(f"Error: Invalid virtual address format: {args.vaddr}")
+        return
+
+    try:
+        task = find_task(args.pid)
+        mm = task.mm
+        page = follow_page(mm, vaddr)
+
+        if page:
+            show_page_state(page, vaddr, mm, args.pid, task)
+        else:
+            print(f"Address {hex(vaddr)} is not mapped.")
+    except FaultError as e:
+        print(f"Error accessing task or memory: {e}")
+    except Exception as e:
+        print(f"Unexpected error: {e}")
+
+if __name__ == "__main__":
+    main()
-- 
2.25.1

