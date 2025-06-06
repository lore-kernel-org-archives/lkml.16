Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AF6F28A1C9;
	Fri,  6 Jun 2025 16:35:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749227706; cv=none; b=TQOET5g6TiyOobBslc78DOGTXWmeUiXWTnk59SX9yJxiy/NyoqWB703u2/xvnhcXlFtzMWA8OxUeRuPvRMpZHsDzuMT5dKe7PnzUbpj3QGmnhMvtT4aWEVt9Y2r6kVbvLxMmGF/fQFMKWoomR1fklyeBdtA+p0nYATMpl9k+oCI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749227706; c=relaxed/simple;
	bh=DIPIVjIPVmXpZgI2rlAH7UBlHZake7OmEefjqrurvNk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ozdJ7QN34t0FvIjI2e/vbahWGA5G9J8CLHUbjFxVd7NOaEpgTWvEn0pIryuxVgoF18KHnvwzHwrvzofI+lWIlFkPD0kfb4Pbqcqqab+ZiD6sXp7kRgkAGOsjlxoOjadBu/119dHs5uKL+3Vcv1jct3GoZf1uct3PdAWKuDq4Q14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=S0cozf2K; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="S0cozf2K"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 36FF441F32
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1749227699; bh=iNnVL4BxscFhHXFqnQBQA6YU9gzB5+B9LbFNv/P51Dc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=S0cozf2K5fJE7OJVUPD8V+U9jjWzv4sA6yzrvSiFnWN08bMYHhQdw8TGRdCvtSSXX
	 ZzjtC2ZLb4BjO8Y7tlC3DqOAtas1+0/zLcPeM0DZ3x9YOG6VZsCe9sIZyHTGcz60Id
	 1SDO/ttjcXKLPqhV8RmD1vnbjWGziDxHh7Puy+pVLRTEoRC84W/v1I0hcNJei+MQiV
	 QWlHIS6b79GmoEIFtN8i/bIN/RcNy8u+0lVk6w2/4MHeMIsWKWOpr4HFwmc9QwAOaq
	 Vo646R6A02/5ATri9/fia5F1cfz+zcCRgrqhndailliyj6NDCb9uVXRAvv5nj/NtqL
	 sHfvegRtSlOjg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 36FF441F32;
	Fri,  6 Jun 2025 16:34:59 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 8/9] docs: kdoc: move the declaration regexes out of process_name()
Date: Fri,  6 Jun 2025 10:34:37 -0600
Message-ID: <20250606163438.229916-9-corbet@lwn.net>
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

Move two complex regexes up with the other patterns, decluttering this
function and allowing the compilation to be done once rather than for every
kerneldoc comment.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 30 +++++++++++++++++-------------
 1 file changed, 17 insertions(+), 13 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 4e1ab28ff7cc..55f38240d4e5 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -47,7 +47,6 @@ doc_sect = doc_com + \
                 flags=re.I, cache=False)
 
 doc_content = doc_com_body + KernRe(r'(.*)', cache=False)
-doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
 doc_inline_start = KernRe(r'^\s*/\*\*\s*$', cache=False)
 doc_inline_sect = KernRe(r'\s*\*\s*(@\s*[\w][\w\.]*\s*):(.*)', cache=False)
 doc_inline_end = KernRe(r'^\s*\*/\s*$', cache=False)
@@ -60,6 +59,18 @@ export_symbol_ns = KernRe(r'^\s*EXPORT_SYMBOL_NS(_GPL)?\s*\(\s*(\w+)\s*,\s*"\S+"
 
 type_param = KernRe(r"\@(\w*((\.\w+)|(->\w+))*(\.\.\.)?)", cache=False)
 
+#
+# Tests for the beginning of a kerneldoc block in its various forms.
+#
+doc_block = doc_com + KernRe(r'DOC:\s*(.*)?', cache=False)
+doc_begin_data = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)", cache = False)
+doc_begin_func = KernRe(str(doc_com) +			# initial " * '
+                        r"(?:\w+\s*\*\s*)?" + 		# type (not captured)
+                        r'(?:define\s+)?' + 		# possible "define" (not captured)
+                        r'(\w+)\s*(?:\(\w*\))?\s*' +	# name and optional "(...)"
+                        r'(?:[-:].*)?$',		# description (not captured)
+                        cache = False)
+
 #
 # A little helper to get rid of excess white space
 #
@@ -1224,22 +1235,15 @@ class KernelDoc:
         if doc_decl.search(line):
             self.entry.identifier = doc_decl.group(1)
 
-            decl_start = str(doc_com)       # comment block asterisk
-            fn_type = r"(?:\w+\s*\*\s*)?"  # type (for non-functions)
-            parenthesis = r"(?:\(\w*\))?"   # optional parenthesis on function
-            decl_end = r"(?:[-:].*)"         # end of the name part
-
             # Test for data declaration
-            r = KernRe(r"^\s*\*?\s*(struct|union|enum|typedef)\b\s*(\w*)")
-            r2 = KernRe(fr"^{decl_start}{fn_type}(?:define\s+)?(\w+)\s*{parenthesis}\s*{decl_end}?$")
-            if r.search(line):
-                self.entry.decl_type = r.group(1)
-                self.entry.identifier = r.group(2)
+            if doc_begin_data.search(line):
+                self.entry.decl_type = doc_begin_data.group(1)
+                self.entry.identifier = doc_begin_data.group(2)
             #
             # Look for a function description
             #
-            elif r2.search(line):
-                self.entry.identifier = r2.group(1)
+            elif doc_begin_func.search(line):
+                self.entry.identifier = doc_begin_func.group(1)
                 self.entry.decl_type = "function"
             #
             # We struck out.
-- 
2.49.0

