Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B853E289E21;
	Fri,  6 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227705; cv=none; b=UuJ04Z8nYNy7ESd9vlIs7a4OaK2c7PXacSyQgadHMjPFoGbQJ/Bb+oYtZsiupMk4+4XbybhyCXuT8PplezvywmOGHiqNferZ3Equ/PSht8F8P7tkZGTyZPyvEhjqicP8KgWg58bk82aOqimSg+66R+OW6n3dlDo2gcxK31juQw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227705; c=relaxed/simple;
	bh=4wOhT+ccdmsvlqlGTH/6VXz0OIu+as1y2XRYVinSHrc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WzKw186XYDJC6gNAjB7oicMDLQwep/2uIq+6/kBunGRMpqCvMPuOJLJCFYwV7ZMfB35ibiaojYH5rzqXxIIwI6EBZWzGtezAO1OBeqcEDDqh+39Cvf9hAfHvkGpdS/cUo5NofBy4J9FHckoCUEZ8BwivwIteUWT/CBFK5h2arpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=sCv2Rd85; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="sCv2Rd85"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 9D8DD41F2F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227697; bh=UYcmn4qdwBXvAETOWfKZx/qAHGOt2DuUFA6POj8NZjI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=sCv2Rd85XijSp2BAvJdjVnHYttyKZpyHIV0BUUQixj+LJVfUjLc8bN5ZKeGsYQp/b
	 ST+9+qEdOBRKZzIF0YjTfaKv8VSWEjORxuTTEjy744TMaTV23S3WToMuH0L4LTnEOe
	 8GB1Ax7OroSCOfv282dyJsJH85OXjDbYIOozk6RBoIuTsvsPo7x8wCIFRDEZoIBibr
	 MGGOwFUL7xHyh/u7bKeF1i54QwvkGb5/J9tIVuyfqQO3xJn7RFek51/Vmx2pnpZmdb
	 qnjYDTgmXXm3qbOIUf6Q+bZpLHH4RiBTBrynr+9lIe/+GYAbiOeYvYfL+f/3e+qFk1
	 lfHgfMAOJnwEQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 9D8DD41F2F;
	Fri,  6 Jun 2025 16:34:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/9] docs: kdoc: remove the KernelEntry::is_kernel_comment member
Date: Fri,  6 Jun 2025 10:34:34 -0600
Message-ID: <20250606163438.229916-6-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250606163438.229916-1-corbet@lwn.net>
References: <20250606163438.229916-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

entry::is_kernel_comment never had anything to do with the entry itself; it
is a bit of local state in one branch of process_name().  It can, in fact,
be removed entirely; rework the code slightly so that it is no longer
needed.

No change in the rendered output.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 3ea260b423e2..56299695abd1 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1216,7 +1216,6 @@ class KernelDoc:
 
         if doc_decl.search(line):
             self.entry.identifier = doc_decl.group(1)
-            self.entry.is_kernel_comment = False
 
             decl_start = str(doc_com)       # comment block asterisk
             fn_type = r"(?:\w+\s*\*\s*)?"  # type (for non-functions)
@@ -1234,14 +1233,20 @@ class KernelDoc:
             if r.search(line):
                 self.entry.decl_type = r.group(1)
                 self.entry.identifier = r.group(2)
-                self.entry.is_kernel_comment = True
             #
             # Look for a function description
             #
             elif r2.search(line):
                 self.entry.identifier = r2.group(1)
                 self.entry.decl_type = "function"
-                self.entry.is_kernel_comment = True
+            #
+            # We struck out.
+            #
+            else:
+                self.emit_msg(ln,
+                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
+                self.state = state.NORMAL
+                return
 
             self.entry.identifier = self.entry.identifier.strip(" ")
 
@@ -1263,11 +1268,6 @@ class KernelDoc:
             else:
                 self.entry.declaration_purpose = ""
 
-            if not self.entry.is_kernel_comment:
-                self.emit_msg(ln,
-                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
-                self.state = state.NORMAL
-
             if not self.entry.declaration_purpose and self.config.wshort_desc:
                 self.emit_msg(ln,
                               f"missing initial short description on line:\n{line}")
-- 
2.49.0

