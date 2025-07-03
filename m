Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF2C2F2C4F;
	Thu,  3 Jul 2025 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568259; cv=none; b=H/kS751GIM4Gsm+BxiE9K1zXg5kDliRmXGf4HDFgYx9J9Qa0Mx8hDnVDVzF/BPZcqqfhuMtdgh+2r6cRABQqEgOkpiHJL0IUpdDuNq4WMYqHIa0g7VamEu3RBUaNWLW/kqqNp0HqaxJhEe/lq2PHl006lkanU7BvJ4UP1Ea9Uok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568259; c=relaxed/simple;
	bh=Q+6pd7cCvA5EXEoyvrOfENhFszYTXitZcBF7OVOVyWs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DuTu3lqEQXrt9w+RRSkEQf3q4xpSWFrFYGtc++alLbHbbjquYk92c13Eo0e1tcjN4UGt5226kJpV2HqmARAA/NISD7gn8dHn1q8J8SoiaZNo/YRtu2z6+JOjyL/2kTd6oyfK3EBU91dSUEWWt2nNE9o43mJSWzEx0wxzNLHnOZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=VUj8Ym7e; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="VUj8Ym7e"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 3DD27406FA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568257; bh=OyvBF4RPZiy3zpxRyGPvRh4u0hkQVDBgNAz4FtBsEF4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=VUj8Ym7euDfk8aKDopNUkD9JuLWwr6GcvHI8PsNNYRJAqefPxpHMP/rqSOeVBHjxV
	 KOX+sYM8ti2LX1gTva5TRg1icGPuGM76kOFiR9EcMnHY5dugbDAWqgijaoRmY+sd8b
	 kAU+mBIzedjtRAbTRoiJTpHoujeCQ2PZCgldnBlnK2UH0I+Ii7lF23ue3vg3qxKDug
	 8DHzZSLyFEHlWTiZpokA/z5SzaEshhlDJXajR0MSvL5B1N6YcVmGoq21vIQSFt8zA3
	 h6Ukq2TpTmpTBCIbm5X3T3JuUE6qnwbh6HNLKU+roShjRitNgPhlfyLwOSiaNsGSs9
	 WhNtX5vbHqg+w==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 3DD27406FA;
	Thu,  3 Jul 2025 18:44:17 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 5/7] docs: kdoc: some tweaks to process_proto_function()
Date: Thu,  3 Jul 2025 12:44:01 -0600
Message-ID: <20250703184403.274408-6-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250703184403.274408-1-corbet@lwn.net>
References: <20250703184403.274408-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a set of comments to process_proto_function and reorganize the logic
slightly; no functional change.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
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

