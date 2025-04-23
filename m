Received: from out-174.mta0.migadu.com (out-174.mta0.migadu.com [91.218.175.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 071E6263F27;
	Wed, 23 Apr 2025 01:49:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745372979; cv=none; b=AbkEHGuHGfPMBdE7xpZPzii9GtJX/81yLuYrvqX2gwHvHKHuY2yIJqgIMioAMP2SUIobsEm4mYWF6+QCKwg9k5LcAfZZQATaMDlpnPAPV0Q9qncoN02oNIkdWNmqS9edTpstMpAqD+sriL/Zg72v/yrGs6U0de+fQIo42vQCAiM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745372979; c=relaxed/simple;
	bh=jMSJ0gf0b0aPu4uBEGao57zRb4usICWr8tS/e0fHtJw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=VdYk4hEP69Sm3OEdiTjflh5GzFUcyMaj2bRkSkZTpLcZ7Cn1fevaMo1kv2k0VvzVdKJd3tzFJrZWzC8iBB2PzpdFAIWjbmDWWRm4W1t6XVsa8iP4xro6OZjJGPI7XkZ0jNcCv6rKtOcohkNwKYaAyTiakTaOB+oufwPDWnUkT+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=hDIfCpjq; arc=none smtp.client-ip=91.218.175.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="hDIfCpjq"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1745372973;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=D7+Eeawz4Y8be/9ifCJRuEJtqE9u4PyZ//yEy9tp5gM=;
	b=hDIfCpjquE1JLYG/4MpX+xVTGu9k+j4qthA+S/jS9mLcZMNR6fspBEDZeuI/O4zCMlPkyP
	Z5qhwNtkHDuUCJWpPusNB6X5SoGfoJUSXafQalpX/21JzuyG/OqZiVm9yU14C8anogzOJ1
	wJ9xXiQb+ouXbvv5z7MY0YlzBQwDU9Y=
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
	ye.liu@linux.dev
Subject: [PATCH v3] tools/mm: Add script to display page state for a given PID and VADDR
Date: Wed, 23 Apr 2025 09:48:50 +0800
Message-Id: <20250423014850.344501-1-ye.liu@linux.dev>
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
sudo ./show_page_info.py 1 0x7f43df5acf00
PID: 1 Comm: systemd mm: 0xffff8881273bbc40
Raw: 0017ffffc000416c ffffea00043a4508 ffffea0004381e08 ffff88810f086a70
Raw: 0000000000000000 ffff888120c9b0c0 0000002500000007 ffff88812642c000
User Virtual Address: 0x7f43df5acf00
Page Address:         0xffffea00049a0b00
Page Flags:           PG_referenced|PG_uptodate|PG_lru|PG_head|PG_active|
		      PG_private|PG_reported
Page Size:            16384
Page PFN:             0x12682c
Page Physical:        0x12682c000
Page Virtual:         0xffff88812682c000
Page Refcount:        37
Page Mapcount:        7
Page Index:           0x0
Page Memcg Data:      0xffff88812642c000
Memcg Name:           init.scope
Memcg Path:           /sys/fs/cgroup/memory/init.scope
Page Mapping:         0xffff88810f086a70
Page Anon/File:       File
Page VMA:             0xffff88810e4af3b8
VMA Start:            0x7f43df5ac000
VMA End:              0x7f43df5b0000
This page is part of a compound page.
This page is the head page of a compound page.
Head Page:            0xffffea00049a0b00
Compound Order:       2
Number of Pages:      4

Signed-off-by: Ye Liu <liuye@kylinos.cn>

Changes in v3:
- Adjust display style.
- Link to v2:https://lore.kernel.org/all/20250421080748.114750-1-ye.liu@linux.dev/

Changes in v2:
- Move the show_page_info.py file to tools/mm.
- Link to v1: https://lore.kernel.org/all/20250415075024.248232-1-ye.liu@linux.dev/
---
 MAINTAINERS                |   5 ++
 tools/mm/show_page_info.py | 120 +++++++++++++++++++++++++++++++++++++
 2 files changed, 125 insertions(+)
 create mode 100755 tools/mm/show_page_info.py

diff --git a/MAINTAINERS b/MAINTAINERS
index 17ed0b5ffdd2..85686a30dc72 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -18351,6 +18351,11 @@ F:	Documentation/mm/page_table_check.rst
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
index 000000000000..8622c5499dfe
--- /dev/null
+++ b/tools/mm/show_page_info.py
@@ -0,0 +1,120 @@
+#!/usr/bin/env drgn
+# SPDX-License-Identifier: GPL-2.0-only
+# Copyright (C) 2025 Ye Liu <liuye@kylinos.cn>
+
+import argparse
+from drgn import Object
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
+    chunks = [data[i:i+8] for i in range(0, len(data), 8)]
+    hex_chunks = ["".join(f"{b:02x}" for b in chunk[::-1]) for chunk in chunks]
+    lines = [" ".join(hex_chunks[i:i+4]) for i in range(0, len(hex_chunks), 4)]
+    return "\n".join(f"Raw: {line}" for line in lines)
+
+def get_memcg_info(page):
+    """Retrieve memory cgroup information for a page."""
+    memcg_data = page.memcg_data.value_()
+    if memcg_data & MEMCG_DATA_OBJEXTS:
+        memcg_value = 0
+    elif memcg_data & MEMCG_DATA_KMEM:
+        objcg = Object(prog, "struct obj_cgroup *", address=memcg_data & ~__NR_MEMCG_DATA_FLAGS)
+        memcg_value = objcg.memcg.value_()
+    else:
+        memcg_value = memcg_data & ~__NR_MEMCG_DATA_FLAGS
+
+    memcg = Object(prog, "struct mem_cgroup *", address=memcg_value)
+    cgrp = memcg.css.cgroup
+    return cgroup_name(cgrp).decode(), f"/sys/fs/cgroup/memory{cgroup_path(cgrp).decode()}"
+
+def show_page_state(page, addr, mm, pid, task):
+    """Display detailed information about a page."""
+    print(f'PID: {pid} Comm: {task.comm.string_().decode()} mm: {hex(mm)}')
+    print(format_page_data(prog.read(page.value_(), 64)))
+    fields = {
+        "User Virtual Address": hex(addr),
+        "Page Address": hex(page.value_()),
+        "Page Flags": decode_page_flags(page),
+        "Page Size": page_size(page).value_(),
+        "Page PFN": hex(page_to_pfn(page).value_()),
+        "Page Physical": hex(page_to_phys(page).value_()),
+        "Page Virtual": hex(page_to_virt(page).value_()),
+        "Page Refcount": page._refcount.counter.value_(),
+        "Page Mapcount": page._mapcount.counter.value_(),
+        "Page Index": hex(page.index.value_()),
+        "Page Memcg Data": hex(page.memcg_data.value_()),
+    }
+
+    memcg_name, memcg_path = get_memcg_info(page)
+    fields["Memcg Name"] = memcg_name
+    fields["Memcg Path"] = memcg_path
+    fields["Page Mapping"] = hex(page.mapping.value_())
+    fields["Page Anon/File"] = "Anon" if page.mapping.value_() & 0x1 else "File"
+
+    vma = vma_find(mm, addr)
+    fields["Page VMA"] = hex(vma.value_())
+    fields["VMA Start"] = hex(vma.vm_start.value_())
+    fields["VMA End"] = hex(vma.vm_end.value_())
+
+    # Calculate the maximum field name length for alignment
+    max_field_len = max(len(field) for field in fields)
+
+    # Print aligned fields
+    for field, value in fields.items():
+        print(f"{field}:".ljust(max_field_len + 2) + f"{value}")
+
+    # Additional information about the page
+    if PageSlab(page):
+        print("This page belongs to the slab allocator.")
+
+    if PageCompound(page):
+        print("This page is part of a compound page.")
+        if PageHead(page):
+            print("This page is the head page of a compound page.")
+        if PageTail(page):
+            print("This page is the tail page of a compound page.")
+        print(f"{'Head Page:'.ljust(max_field_len + 2)}{hex(compound_head(page).value_())}")
+        print(f"{'Compound Order:'.ljust(max_field_len + 2)}{compound_order(page).value_()}")
+        print(f"{'Number of Pages:'.ljust(max_field_len + 2)}{compound_nr(page).value_()}")
+    else:
+        print("This page is not part of a compound page.")
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
+    task = find_task(args.pid)
+    mm = task.mm
+    page = follow_page(mm, vaddr)
+
+    if page:
+        show_page_state(page, vaddr, mm, args.pid, task)
+    else:
+        print(f"Address {hex(vaddr)} is not mapped.")
+
+if __name__ == "__main__":
+    main()
\ No newline at end of file
-- 
2.25.1

