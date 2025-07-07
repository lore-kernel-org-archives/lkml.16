Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FBCD19ABC2;
	Mon,  7 Jul 2025 05:01:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751864500; cv=none; b=WbfDiVolWBnSs8tDegXtekj2FASscdBi7HfrWBhc2LS/9CitLXaTMBUr00ORRB5VNZYmjX48Z/wPbSC7APta8wkmNp9l9BWMUOdDLpAUTsFwuXWp90lyp8UzKe2wD6sKCvfhUTR1oUTAQ+90jyj0Qj1LqzAvryrc3kio+P5g870=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751864500; c=relaxed/simple;
	bh=iDByYHnbq6hJxIjqTvjvaoSpLQMX/BOf4upkEkCnCes=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IkFEROaAGmO5ST3rV/RG5pRQh2ugeV2mx64CaIlNdCLC4sj5n4vthjwqB6PxBXQfSYCCJ8A/DKraqoofWF3JGuyI6VEsWBrkM9Ot3O7e46cSZmHo1VIrD02/GFuYI0r9Duf/Fo0av8onKWUYOW+RQxCHWUknRZs3Jg/yHa3/8SA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=34vjTT8i; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="34vjTT8i"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=NAU/5xwp1VDhh0b7SpgTb+vw1QLyKInxXDmYrDSMhbk=; b=34vjTT8i3FvtB+g0rz8+6IdrQ1
	9OM0Aj1YvVpBRzj+WCupGrj2kjF6qigLCqVgIPtFdGopMT9PEVBg7oSs84s+/NGKGgA7gpfZ0K9WJ
	KxdLyLvIbFNdGdAkzjlkcVEEyMzdoSO64qjR9HlPjV6SRy74GbzYjhN8geI8Rh95CrGOhmZMwcTII
	90CcA87faGPbjPANictFPX1LKylzc3hwfsDfZYtkriQivudbmRnc7TNyHeBb19UbZHmUfOyANuUPW
	70bStmkXSRVfItwNJqhxok/90KBx6WIooCGx4QHAYL8defBCHwmkPXVEMTbh/QYRGMXKVvsO7tNP4
	ksQqm/mw==;
Received: from [50.53.25.54] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYdyz-00000001PL5-332e;
	Mon, 07 Jul 2025 05:01:37 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab@kernel.org>
Subject: [PATCH -next] docs: kdoc: various fixes for grammar, spelling, punctuation
Date: Sun,  6 Jul 2025 22:01:35 -0700
Message-ID: <20250707050135.2660457-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.50.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Correct grammar, spelling, and punctuation in comments, strings,
print messages, logs.

Change two instances of two spaces between words to just one space.

codespell was used to find misspelled words.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>
---
 scripts/lib/kdoc/kdoc_files.py  |    4 ++--
 scripts/lib/kdoc/kdoc_output.py |    8 ++++----
 scripts/lib/kdoc/kdoc_parser.py |   20 ++++++++++----------
 scripts/lib/kdoc/kdoc_re.py     |   24 ++++++++++++------------
 4 files changed, 28 insertions(+), 28 deletions(-)

--- linux-next-20250704.orig/scripts/lib/kdoc/kdoc_files.py
+++ linux-next-20250704/scripts/lib/kdoc/kdoc_files.py
@@ -64,7 +64,7 @@ class GlobSourceFiles:
 
     def parse_files(self, file_list, file_not_found_cb):
         """
-        Define an interator to parse all source files from file_list,
+        Define an iterator to parse all source files from file_list,
         handling directories if any
         """
 
@@ -229,7 +229,7 @@ class KernelFiles():
         Return output messages from a file name using the output style
         filtering.
 
-        If output type was not handled by the syler, return None.
+        If output type was not handled by the styler, return None.
         """
 
         # NOTE: we can add rules here to filter out unwanted parts,
--- linux-next-20250704.orig/scripts/lib/kdoc/kdoc_output.py
+++ linux-next-20250704/scripts/lib/kdoc/kdoc_output.py
@@ -8,7 +8,7 @@
 Implement output filters to print kernel-doc documentation.
 
 The implementation uses a virtual base class (OutputFormat) which
-contains a dispatches to virtual methods, and some code to filter
+contains dispatches to virtual methods, and some code to filter
 out output messages.
 
 The actual implementation is done on one separate class per each type
@@ -59,7 +59,7 @@ class OutputFormat:
     OUTPUT_EXPORTED     = 2 # output exported symbols
     OUTPUT_INTERNAL     = 3 # output non-exported symbols
 
-    # Virtual member to be overriden at the  inherited classes
+    # Virtual member to be overridden at the inherited classes
     highlights = []
 
     def __init__(self):
@@ -85,7 +85,7 @@ class OutputFormat:
     def set_filter(self, export, internal, symbol, nosymbol, function_table,
                    enable_lineno, no_doc_sections):
         """
-        Initialize filter variables according with the requested mode.
+        Initialize filter variables according to the requested mode.
 
         Only one choice is valid between export, internal and symbol.
 
@@ -210,7 +210,7 @@ class OutputFormat:
             return self.data
 
         # Warn if some type requires an output logic
-        self.config.log.warning("doesn't now how to output '%s' block",
+        self.config.log.warning("doesn't know how to output '%s' block",
                                 dtype)
 
         return None
--- linux-next-20250704.orig/scripts/lib/kdoc/kdoc_re.py
+++ linux-next-20250704/scripts/lib/kdoc/kdoc_re.py
@@ -16,7 +16,7 @@ re_cache = {}
 
 class KernRe:
     """
-    Helper class to simplify regex declaration and usage,
+    Helper class to simplify regex declaration and usage.
 
     It calls re.compile for a given pattern. It also allows adding
     regular expressions and define sub at class init time.
@@ -27,7 +27,7 @@ class KernRe:
 
     def _add_regex(self, string, flags):
         """
-        Adds a new regex or re-use it from the cache.
+        Adds a new regex or reuses it from the cache.
         """
 
         if string in re_cache:
@@ -117,7 +117,7 @@ class NestedMatch:
 
             '\\bSTRUCT_GROUP(\\(((?:(?>[^)(]+)|(?1))*)\\))[^;]*;'
 
-    which is used to properly match open/close parenthesis of the
+    which is used to properly match open/close parentheses of the
     string search STRUCT_GROUP(),
 
     Add a class that counts pairs of delimiters, using it to match and
@@ -139,13 +139,13 @@ class NestedMatch:
     #       \bSTRUCT_GROUP\(
     #
     # is similar to: STRUCT_GROUP\((.*)\)
-    # except that the content inside the match group is delimiter's aligned.
+    # except that the content inside the match group is delimiter-aligned.
     #
-    # The content inside parenthesis are converted into a single replace
+    # The content inside parentheses is converted into a single replace
     # group (e.g. r`\1').
     #
     # It would be nice to change such definition to support multiple
-    # match groups, allowing a regex equivalent to.
+    # match groups, allowing a regex equivalent to:
     #
     #   FOO\((.*), (.*), (.*)\)
     #
@@ -171,14 +171,14 @@ class NestedMatch:
         but I ended using a different implementation to align all three types
         of delimiters and seek for an initial regular expression.
 
-        The algorithm seeks for open/close paired delimiters and place them
-        into a stack, yielding a start/stop position of each match  when the
+        The algorithm seeks for open/close paired delimiters and places them
+        into a stack, yielding a start/stop position of each match when the
         stack is zeroed.
 
-        The algorithm shoud work fine for properly paired lines, but will
-        silently ignore end delimiters that preceeds an start delimiter.
+        The algorithm should work fine for properly paired lines, but will
+        silently ignore end delimiters that precede a start delimiter.
         This should be OK for kernel-doc parser, as unaligned delimiters
-        would cause compilation errors. So, we don't need to rise exceptions
+        would cause compilation errors. So, we don't need to raise exceptions
         to cover such issues.
         """
 
@@ -206,7 +206,7 @@ class NestedMatch:
                     stack.append(end)
                     continue
 
-                # Does the end delimiter match what it is expected?
+                # Does the end delimiter match what is expected?
                 if stack and d == stack[-1]:
                     stack.pop()
 
--- linux-next-20250704.orig/scripts/lib/kdoc/kdoc_parser.py
+++ linux-next-20250704/scripts/lib/kdoc/kdoc_parser.py
@@ -21,8 +21,8 @@ from kdoc_re import NestedMatch, KernRe
 #
 # Regular expressions used to parse kernel-doc markups at KernelDoc class.
 #
-# Let's declare them in lowercase outside any class to make easier to
-# convert from the python script.
+# Let's declare them in lowercase outside any class to make it easier to
+# convert from the Perl script.
 #
 # As those are evaluated at the beginning, no need to cache them
 #
@@ -283,7 +283,7 @@ class KernelDoc:
         args["type"] = dtype
         args["warnings"] = self.entry.warnings
 
-        # TODO: use colletions.OrderedDict to remove sectionlist
+        # TODO: use collections.OrderedDict to remove sectionlist
 
         sections = args.get('sections', {})
         sectionlist = args.get('sectionlist', [])
@@ -509,7 +509,7 @@ class KernelDoc:
 
     def check_sections(self, ln, decl_name, decl_type, sectcheck, prmscheck):
         """
-        Check for errors inside sections, emitting warnings if not found
+        Check for errors inside sections, emitting warnings if not-found
         parameters are described.
         """
 
@@ -565,7 +565,7 @@ class KernelDoc:
 
     def dump_struct(self, ln, proto):
         """
-        Store an entry for an struct or union
+        Store an entry for a struct or union
         """
 
         type_pattern = r'(struct|union)'
@@ -670,7 +670,7 @@ class KernelDoc:
             # TODO: use NestedMatch for FOO($1, $2, ...) matches
             #
             # it is better to also move those to the NestedMatch logic,
-            # to ensure that parenthesis will be properly matched.
+            # to ensure that parentheses will be properly matched.
 
             (KernRe(r'__ETHTOOL_DECLARE_LINK_MODE_MASK\s*\(([^\)]+)\)', re.S), r'DECLARE_BITMAP(\1, __ETHTOOL_LINK_MODE_MASK_NBITS)'),
             (KernRe(r'DECLARE_PHY_INTERFACE_MASK\s*\(([^\)]+)\)', re.S), r'DECLARE_BITMAP(\1, PHY_INTERFACE_MODE_MAX)'),
@@ -683,7 +683,7 @@ class KernelDoc:
             (KernRe(r'DEFINE_DMA_UNMAP_LEN\s*\(' + args_pattern + r'\)', re.S), r'__u32 \1'),
         ]
 
-        # Regexes here are guaranteed to have the end limiter matching
+        # Regexes here are guaranteed to have the end delimiter matching
         # the start delimiter. Yet, right now, only one replace group
         # is allowed.
 
@@ -711,7 +711,7 @@ class KernelDoc:
         # Python behavior is different: it parses 'members' only once,
         # creating a list of tuples from the first interaction.
         #
-        # On other words, this won't get nested structs.
+        # In other words, this won't get nested structs.
         #
         # So, we need to have an extra loop on Python to override such
         # re limitation.
@@ -941,7 +941,7 @@ class KernelDoc:
 
     def dump_function(self, ln, prototype):
         """
-        Stores a function of function macro inside self.entries array.
+        Stores a function or function macro inside self.entries array.
         """
 
         func_macro = False
@@ -1258,7 +1258,7 @@ class KernelDoc:
             #
             else:
                 self.emit_msg(ln,
-                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer Documentation/doc-guide/kernel-doc.rst\n{line}")
+                              f"This comment starts with '/**', but isn't a kernel-doc comment. Refer to Documentation/doc-guide/kernel-doc.rst\n{line}")
                 self.state = state.NORMAL
                 return
             #
