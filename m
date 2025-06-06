Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930D7289E1D;
	Fri,  6 Jun 2025 16:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227705; cv=none; b=ZyKITnNCiKDaXNKVQc8YbzHTttead/e+ZWB+dz2RCpEgvODDFtmifmu1m3lRqyPDh1JDkyLFh773rx93EjeTh5qYki0ixZx9oNb+LT+zob4dYdpdtbUWbo6v62je/CTc9StenqCL6DVuoGcz5PP2D+Fwnq2tbdZYKwdEqrkknFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227705; c=relaxed/simple;
	bh=onlfVHkvysZTZ7zw4pr9BVLVORPgCRgFRMWMIg6hNn0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VRDN+kZ0kSZX9s8RIbCL5Ekr4sDJRS7vjLpMKrGyW5aOxzKB0OCI5SiQ6bT2VRN86u9a11WfKPMO2xpiOKdT3iGrBvD1+b8gCraLEnXU7d+Ti/FSyyIdtnCCiFb38XA0eFJz8/N7uL0zdMMgmhA3AsxUahkuJXL7tfKo4OkHoyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=nRvIylUf; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="nRvIylUf"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 1CB9C41F2E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227697; bh=LnZJMt1SsSLsFNAHcfhcKaeQyp6VdaCfELe/I0kOO4k=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRvIylUfx1svEW/nFhSR+NlvVdE/fiGZM1dPDX/GJq/qLi49jdtuanlq+N4GNQlFx
	 GG2+0sNCMsdEc3fu+mzxlcFoRasuoHr6wf41/oAKpGfPv76DEHGdXqG3gfOwDfJ9Cw
	 /Dd9HmBHkZ0llFs9wBr8q23V6Hoqg4HkIK+mWw+Gq5G/wwhsIPPQ6Ic3FMxcuBL6OC
	 ugq93oO04a0ZZa18lJJSJC0RGwFYa0wg3BuXo8bdQAIhVnxsXqgEZyo+AwOx+QQs2i
	 J1E9IxKvcSzo12dZMr5jXeAL4v48OkqUkgBsnoDYJhyNVDqBqtD8ARPndm1oTp9y4x
	 fqhM7mG8vyOdA==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 1CB9C41F2E;
	Fri,  6 Jun 2025 16:34:57 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/9] docs: kdoc: simplify the kerneldoc recognition code
Date: Fri,  6 Jun 2025 10:34:33 -0600
Message-ID: <20250606163438.229916-5-corbet@lwn.net>
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

process_name() looks for the first line of a kerneldoc comment.  It
contains two nearly identical regular expressions, the second of which only
catches six cases in the kernel, all of the form:

  define SOME_MACRO_NAME - description

Simply put the "define" into the regex and discard it, eliminating the loop
and the code to remove it specially.

Note that this still treats these defines as if they were functions, but
that's a separate issue.

There is no change in the generated output.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 24 ++++++++----------------
 1 file changed, 8 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 90b53b70cfee..3ea260b423e2 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1230,26 +1230,18 @@ class KernelDoc:
 
             # Test for data declaration
             r = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)")
+            r2 = KernRe(fr"^{decl_start}{fn_type}(?:define\s+)?(\w+)\s*{parenthesis}\s*{decl_end}?$")
             if r.search(line):
                 self.entry.decl_type = r.group(1)
                 self.entry.identifier = r.group(2)
                 self.entry.is_kernel_comment = True
-            else:
-                # Look for foo() or static void foo() - description;
-                # or misspelt identifier
-
-                r1 = KernRe(fr"^{decl_start}{fn_type}(\w+)\s*{parenthesis}\s*{decl_end}?$")
-                r2 = KernRe(fr"^{decl_start}{fn_type}(\w+[^-:]*){parenthesis}\s*{decl_end}$")
-
-                for r in [r1, r2]:
-                    if r.search(line):
-                        self.entry.identifier = r.group(1)
-                        self.entry.decl_type = "function"
-
-                        r = KernRe(r"define\s+")
-                        self.entry.identifier = r.sub("", self.entry.identifier)
-                        self.entry.is_kernel_comment = True
-                        break
+            #
+            # Look for a function description
+            #
+            elif r2.search(line):
+                self.entry.identifier = r2.group(1)
+                self.entry.decl_type = "function"
+                self.entry.is_kernel_comment = True
 
             self.entry.identifier = self.entry.identifier.strip(" ")
 
-- 
2.49.0

