Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E2A302052;
	Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403482; cv=none; b=fDUQSEUTDAKJSkH7dL8gaLOa1kW616s1AxRjMJCpB/EnlAIPris5DmL4MSqcNniURoDMQNHSQwOHq6yMIjyPtIAK7Z3ihvG8aIGLdXRXhNEnLP6+ae2gF4vJ7hH42cT9XQ09uLgIAzio/klPFv+zO+tAEmgERy9g7hUTLt7fEwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403482; c=relaxed/simple;
	bh=5DWm/6ZQ3Ik0vvHq5fw7kA4PUS5bPl9ddc1r9P6qLEw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UClOyvU+nhx2FVGVB9E8JIrJHj2zWQdZUPLyh5fltsh27Csf5jEefbHOByUNkbMjRNyf6bV8SjiJqjBK+jJi7HNtSQX6+ZvDE6yQRqY5qRI0s160STe1YiFwyyMZn22UNjCRE30BgjhMwnxOHy+OEqdTQmhWfjU+Ud55VbtBXZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=GsMnbany; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="GsMnbany"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 7578140AD5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403473; bh=IyKIcpsLSukks9lFrch8jdMKSN20+cjwdx2yLr/rmLs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GsMnbanySdfi6I0t+abPlJ3cC4pA891WZzMScXSPXi+GQB44/DtFOQ6OegiHVTE13
	 nXc8Uwp1HUKlW+08Yq9r+wQ+57PnCTFsmtKWc83l7uWbOQdOSD7SNyTrwueCyGg+Ht
	 qn0SU1bmA2uAWq8I6apjDjrWiGfwSIBmveBI+8Hz5AcICSAHtnQ1VdesSwhCSod5Kv
	 xMcbBU5LZbTD8+l6K8CzrVIBDut5iZL75hohzY4y3D4R6UF7Bqj64iLWk2Go67lMGY
	 5plmGPM7N9E7g6+d8O4KnllXjNR5Zzb0MKBWRxwu8fDn99B9CCMRBH1nbbQTf+w4Xb
	 4VqjrZ3DyQJmw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 7578140AD5;
	Tue,  1 Jul 2025 20:57:53 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 5/7] docs: kdoc: some tweaks to process_proto_function()
Date: Tue,  1 Jul 2025 14:57:28 -0600
Message-ID: <20250701205730.146687-6-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a set of comments to process_proto_function and reorganize the logic
slightly; no functional change.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 43 ++++++++++++++++++---------------
 1 file changed, 24 insertions(+), 19 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 61da297df623..d5ef3ce87438 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1553,39 +1553,44 @@ class KernelDoc:
         """Ancillary routine to process a function prototype"""
 
         # strip C99-style comments to end of line
-        r = KernRe(r"\/\/.*$", re.S)
-        line = r.sub('', line)
-
+        line = KernRe(r"\/\/.*$", re.S).sub('', line)
+        #
+        # Soak up the line's worth of prototype text, stopping at { or ; if present.
+        #
         if KernRe(r'\s*#\s*define').match(line):
             self.entry.prototype = line
-        elif line.startswith('#'):
-            # Strip other macros like #ifdef/#ifndef/#endif/...
-            pass
-        else:
+        elif not line.startswith('#'):   # skip other preprocessor stuff
             r = KernRe(r'([^\{]*)')
             if r.match(line):
                 self.entry.prototype += r.group(1) + " "
-
+        #
+        # If we now have the whole prototype, clean it up and declare victory.
+        #
         if '{' in line or ';' in line or KernRe(r'\s*#\s*define').match(line):
             # strip comments and surrounding spaces
-            r = KernRe(r'/\*.*\*/')
-            self.entry.prototype = r.sub('', self.entry.prototype).strip()
-
+            self.entry.prototype = KernRe(r'/\*.*\*/').sub('', self.entry.prototype).strip()
+            #
             # Handle self.entry.prototypes for function pointers like:
             #       int (*pcs_config)(struct foo)
-
+            # by turning it into
+            #	    int pcs_config(struct foo)
+            #
             r = KernRe(r'^(\S+\s+)\(\s*\*(\S+)\)')
             self.entry.prototype = r.sub(r'\1\2', self.entry.prototype)
-
+            #
+            # Handle special declaration syntaxes
+            #
             if 'SYSCALL_DEFINE' in self.entry.prototype:
                 self.entry.prototype = self.syscall_munge(ln,
                                                           self.entry.prototype)
-
-            r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
-            if r.search(self.entry.prototype):
-                self.entry.prototype = self.tracepoint_munge(ln,
-                                                             self.entry.prototype)
-
+            else:
+                r = KernRe(r'TRACE_EVENT|DEFINE_EVENT|DEFINE_SINGLE_EVENT')
+                if r.search(self.entry.prototype):
+                    self.entry.prototype = self.tracepoint_munge(ln,
+                                                                 self.entry.prototype)
+            #
+            # ... and we're done
+            #
             self.dump_function(ln, self.entry.prototype)
             self.reset_state(ln)
 
-- 
2.49.0

