Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29574227596
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 11:45:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738842342; cv=none; b=ho8m9T7u+bn8NiQ3ZDDZfyE6c7sJUVLzXgEjoDvR2Qx0P20WfbQfTnU3WDNyHCDjkUCmcuXAwLWPe7GWACwqop7OydJgqcntan/eQDzFO0g/a7/zIR13fq/Zz74pASmxoWmprH6DIUW+Nskmbwn0Rk8Q0Q+OKYcLJIFrWMt11G0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738842342; c=relaxed/simple;
	bh=b0yvRIBIpthkqDi7L/clTFreoOB5wkqMdLy9sEul7cs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FLVR7l9W7T/8d6gcOibVl78qDeSFkSq8bb71rozGEIpMNk1RQ9pHhxh6PQXx5E7KkPejqOecxCtc1SSCRFOrQbGU15aZ7diWQgUUNqeQcC8c5Fc91jRY0tBC1b37hcbCGSZAlG1RaFA+PT9tX4ie4hxsk0A8uEcfr7Bbz05PTi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC287C4CEE2;
	Thu,  6 Feb 2025 11:45:40 +0000 (UTC)
From: Catalin Marinas <catalin.marinas@arm.com>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH 1/2] mm: kmemleak: Add support for dumping physical and __percpu object info
Date: Thu,  6 Feb 2025 11:45:36 +0000
Message-Id: <20250206114537.2597764-2-catalin.marinas@arm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250206114537.2597764-1-catalin.marinas@arm.com>
References: <20250206114537.2597764-1-catalin.marinas@arm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, echo dump=... > /sys/kernel/debug/kmemleak only looks up the
main virtual address object tree. However, for debugging, it's useful to
dump information about physical address and __percpu objects.

Search all three object trees for the dump= command and also print the
type of the object if not virtual: "(phys)" or "(percpu)". In addition,
allow search by alias (pointer within the object).

Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 mm/kmemleak.c | 54 ++++++++++++++++++++++++++++++++++++++-------------
 1 file changed, 40 insertions(+), 14 deletions(-)

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index c6ed68604136..c12cef3eeb32 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -352,6 +352,15 @@ static bool unreferenced_object(struct kmemleak_object *object)
 			       jiffies_last_scan);
 }
 
+static const char *__object_type_str(struct kmemleak_object *object)
+{
+	if (object->flags & OBJECT_PHYS)
+		return " (phys)";
+	if (object->flags & OBJECT_PERCPU)
+		return " (percpu)";
+	return "";
+}
+
 /*
  * Printing of the unreferenced objects information to the seq file. The
  * print_unreferenced function must be called with the object->lock held.
@@ -364,8 +373,9 @@ static void print_unreferenced(struct seq_file *seq,
 	unsigned int nr_entries;
 
 	nr_entries = stack_depot_fetch(object->trace_handle, &entries);
-	warn_or_seq_printf(seq, "unreferenced object 0x%08lx (size %zu):\n",
-			  object->pointer, object->size);
+	warn_or_seq_printf(seq, "unreferenced object%s 0x%08lx (size %zu):\n",
+			   __object_type_str(object),
+			   object->pointer, object->size);
 	warn_or_seq_printf(seq, "  comm \"%s\", pid %d, jiffies %lu\n",
 			   object->comm, object->pid, object->jiffies);
 	hex_dump_object(seq, object);
@@ -384,10 +394,10 @@ static void print_unreferenced(struct seq_file *seq,
  */
 static void dump_object_info(struct kmemleak_object *object)
 {
-	pr_notice("Object 0x%08lx (size %zu):\n",
-			object->pointer, object->size);
+	pr_notice("Object%s 0x%08lx (size %zu):\n",
+		  __object_type_str(object), object->pointer, object->size);
 	pr_notice("  comm \"%s\", pid %d, jiffies %lu\n",
-			object->comm, object->pid, object->jiffies);
+		  object->comm, object->pid, object->jiffies);
 	pr_notice("  min_count = %d\n", object->min_count);
 	pr_notice("  count = %d\n", object->count);
 	pr_notice("  flags = 0x%x\n", object->flags);
@@ -1998,25 +2008,41 @@ static int kmemleak_open(struct inode *inode, struct file *file)
 	return seq_open(file, &kmemleak_seq_ops);
 }
 
-static int dump_str_object_info(const char *str)
+static bool __dump_str_object_info(unsigned long addr, unsigned int objflags)
 {
 	unsigned long flags;
 	struct kmemleak_object *object;
-	unsigned long addr;
 
-	if (kstrtoul(str, 0, &addr))
-		return -EINVAL;
-	object = find_and_get_object(addr, 0);
-	if (!object) {
-		pr_info("Unknown object at 0x%08lx\n", addr);
-		return -EINVAL;
-	}
+	object = __find_and_get_object(addr, 1, objflags);
+	if (!object)
+		return false;
 
 	raw_spin_lock_irqsave(&object->lock, flags);
 	dump_object_info(object);
 	raw_spin_unlock_irqrestore(&object->lock, flags);
 
 	put_object(object);
+
+	return true;
+}
+
+static int dump_str_object_info(const char *str)
+{
+	unsigned long addr;
+	bool found = false;
+
+	if (kstrtoul(str, 0, &addr))
+		return -EINVAL;
+
+	found |= __dump_str_object_info(addr, 0);
+	found |= __dump_str_object_info(addr, OBJECT_PHYS);
+	found |= __dump_str_object_info(addr, OBJECT_PERCPU);
+
+	if (!found) {
+		pr_info("Unknown object at 0x%08lx\n", addr);
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
