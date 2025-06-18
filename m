Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C98361EDA26;
	Wed, 18 Jun 2025 04:12:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219973; cv=none; b=CqN0JeO/ig8fQ/45TZ0PA8SoL52urCRry/ry5YrURTZUtdiFJKRhtC+rzZlVwyrtVVJy11NMUFW8tcNjrx0AhjjuHNm9oGEt8DeA6HmCtx0aDX9y4GwrzQd0vyBogsFWmqVl63AUwIWn5aq8cM3ZsuiuwjgRva6dNseuwd1gbPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219973; c=relaxed/simple;
	bh=TOoC0U10ODrhjgPZKf7BXsEAXTZceLQX+8xKDYYs+9k=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=aTJy0XAQVwHrm5UfgEcoH21wTEzjsvHb4ouyT6SvKzvzyR7der2lkIO5I2rWh3BE075/05tZjifGXQQhbHPtt7jEIDGN1SV9z+wAQ9j9ZupvcFTmQSrusmJwWPHvG836/wMxeGq0WRQw+CflAcD8o1SkxWegw686hmzPt/Ukw/o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 614E114BF;
	Tue, 17 Jun 2025 21:12:29 -0700 (PDT)
Received: from a076716.blr.arm.com (a076716.blr.arm.com [10.164.21.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 9A4793F66E;
	Tue, 17 Jun 2025 21:12:46 -0700 (PDT)
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-mm@kvack.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Petr Mladek <pmladek@suse.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@redhat.com>,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [RFC 1/2] lib/vsprintf: Add support for pte_t
Date: Wed, 18 Jun 2025 09:42:34 +0530
Message-Id: <20250618041235.1716143-2-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250618041235.1716143-1-anshuman.khandual@arm.com>
References: <20250618041235.1716143-1-anshuman.khandual@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a new format for printing page table entries.

Cc: Petr Mladek <pmladek@suse.com>
Cc: Steven Rostedt <rostedt@goodmis.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@redhat.com>
Cc: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-mm@kvack.org
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
 Documentation/core-api/printk-formats.rst | 14 ++++++++++++++
 lib/vsprintf.c                            | 20 ++++++++++++++++++++
 mm/memory.c                               |  5 ++---
 scripts/checkpatch.pl                     |  2 +-
 4 files changed, 37 insertions(+), 4 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 4b7f3646ec6ce..75a110b059ee1 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -689,6 +689,20 @@ Rust
 Only intended to be used from Rust code to format ``core::fmt::Arguments``.
 Do *not* use it from C.
 
+Page Table Entry
+----------------
+
+::
+        %ppte
+
+Print standard page table entry pte_t.
+
+Passed by reference.
+
+Examples for a 64 bit page table entry, given &(u64)0xc0ffee::
+
+        %ppte   0x00c0ffee
+
 Thanks
 ======
 
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 3d85800757aa5..005490202ffb5 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -2433,6 +2433,9 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  *		Without an option prints the full name of the node
  *		f full name
  *		P node name, including a possible unit address
+ * - 'pte'	For a 64 bit page table entry, this prints its contents in
+ *              a hexa decimal format
+ *
  * - 'x' For printing the address unmodified. Equivalent to "%lx".
  *       Please read the documentation (path below) before using!
  * - '[ku]s' For a BPF/tracing related format specifier, e.g. used out of
@@ -2542,6 +2545,23 @@ char *pointer(const char *fmt, char *buf, char *end, void *ptr,
 		default:
 			return error_string(buf, end, "(einval)", spec);
 		}
+	case 'p':
+		if (fmt[1] == 't' && fmt[2] == 'e') {
+			pte_t *pte = (pte_t *)ptr;
+
+			spec.field_width = 10;
+			spec.precision = 8;
+			spec.base = 16;
+			spec.flags = SPECIAL | SMALL | ZEROPAD;
+			if (sizeof(pte_t) == sizeof(u64)) {
+				u64 val = pte_val(*pte);
+
+				return number(buf, end, val, spec);
+			}
+			WARN_ONCE(1, "Non standard pte_t\n");
+			return error_string(buf, end, "(einval)", spec);
+		}
+		fallthrough;
 	default:
 		return default_pointer(buf, end, ptr, spec);
 	}
diff --git a/mm/memory.c b/mm/memory.c
index 8eba595056fe3..c9a057b371eae 100644
--- a/mm/memory.c
+++ b/mm/memory.c
@@ -522,9 +522,8 @@ static void print_bad_pte(struct vm_area_struct *vma, unsigned long addr,
 	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
 	index = linear_page_index(vma, addr);
 
-	pr_alert("BUG: Bad page map in process %s  pte:%08llx pmd:%08llx\n",
-		 current->comm,
-		 (long long)pte_val(pte), (long long)pmd_val(*pmd));
+	pr_alert("BUG: Bad page map in process %s  pte:%ppte pmd:%ppte\n",
+		 current->comm, &pte, pmd);
 	if (page)
 		dump_page(page, "bad pte");
 	pr_alert("addr:%px vm_flags:%08lx anon_vma:%px mapping:%px index:%lx\n",
diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 664f7b7a622c2..fb8abc5dbfb8e 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -6906,7 +6906,7 @@ sub process {
 				my $fmt = get_quoted_string($lines[$count - 1], raw_line($count, 0));
 				$fmt =~ s/%%//g;
 
-				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*))/g) {
+				while ($fmt =~ /(\%[\*\d\.]*p(\w)(\w*)(\te))/g) {
 					$specifier = $1;
 					$extension = $2;
 					$qualifier = $3;
-- 
2.30.2

