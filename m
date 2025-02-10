Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9EFB1CC89D;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=TvH2BfRCD9mIg+2wzg18yjj8L9rjjTNzIlWdbJoXLkOv+oUPGMA6wGG35pm8gNlJffqn/KOmx0Rt/mUKL9TsvCwWq0LoyeDUaW/cZWg4B6oINV0RYqkDRdY+HNK73s9bSJ7jSskeJa82VNfSUaTAZAthnhGipaLD4LLB3srLUL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=bfKfMaG0D1WbSBuzEfJe/4GnAC91X+Ok5ClCL/aAjU0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EeoiBykLLA/SveLcbmUKgmM90ISTwAsbnp4wuM6ze1deiTyR9VAvzStfGN0tpPLHCj88tVhe96y47izKQQCxpC2wcUui/VKdwjH+w805VOYY4VN3wvht1FfVfJ5eDvAQZiG/3EdtzN40HApkLXV4P5ptLayg+EuJAbKXOnfa+fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gFb6k2Rq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gFb6k2Rq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 239F6C4CED1;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=bfKfMaG0D1WbSBuzEfJe/4GnAC91X+Ok5ClCL/aAjU0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gFb6k2Rqcz7UnLmVJH59Cly+ky8GaUG/RbvfnUykDVKMowdtyASr67XsRCoA0q0e2
	 bMStNL3LLwyHPjI0HZBAHkLeXdJsX0RAQT/nhf3Bjm3zfq29s/DgqcLI6vI1E1JnnQ
	 3YrEyg18Z6XQ1M1J5ieiYo2hHEAQXM4OiB0tOSddVZeCc0cda6KFuLVuL91d1pDYCf
	 Oc59PuylGd4Y97426E+2WCMfQxlCXGFNGwfDjH41xGo54RWb6rBqPyDvBV8rVjvTLn
	 vQPse6LMjp3jId5jfhzG1CJWL8xs/vHgwuvDpkluxm1RUF5RhTD16KMTENiYq+0maT
	 CxtPy6U3vMBDA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CjA-1CQh;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 16/27] docs: sphinx/kernel_abi: reduce buffer usage for ABI messages
Date: Mon, 10 Feb 2025 11:18:05 +0100
Message-ID: <15be22955e3c6df49d7256c8fd24f62b397ad0ff.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Instead of producing a big message with all ABI contents and then
parse as a whole, simplify the code by handling each ABI symbol
in separate. As an additional benefit, there's no need to place
file/line nubers inlined at the data and use a regex to convert
them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kernel_abi.py | 76 +++++++++++++++---------------
 scripts/get_abi.py                 |  7 ++-
 scripts/lib/abi/abi_parser.py      | 10 ++--
 3 files changed, 48 insertions(+), 45 deletions(-)

diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index f7b22abebcf4..742ebd35454f 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -68,6 +68,7 @@ class KernelCmd(Directive):
     has_content = False
     final_argument_whitespace = True
     logger = logging.getLogger('kernel_abi')
+    parser = None
 
     option_spec = {
         "debug": directives.flag,
@@ -79,59 +80,60 @@ class KernelCmd(Directive):
             raise self.warning("docutils: file insertion disabled")
 
         path = os.path.join(srctree, "Documentation", self.arguments[0])
-        parser = AbiParser(path, logger=self.logger)
-        parser.parse_abi()
-        parser.check_issues()
+        self.parser = AbiParser(path, logger=self.logger)
+        self.parser.parse_abi()
+        self.parser.check_issues()
 
-        msg = ""
-        for m in parser.doc(enable_lineno=True, show_file=True):
-            msg += m
-
-        node = self.nested_parse(msg, self.arguments[0])
+        node = self.nested_parse(None, self.arguments[0])
         return node
 
-    def nested_parse(self, lines, fname):
+    def nested_parse(self, data, fname):
         env = self.state.document.settings.env
         content = ViewList()
         node = nodes.section()
 
-        if "debug" in self.options:
-            code_block = "\n\n.. code-block:: rst\n    :linenos:\n"
-            for line in lines.split("\n"):
-                code_block += "\n    " + line
-            lines = code_block + "\n\n"
+        if data is not None:
+            # Handles the .rst file
+            for line in data.split("\n"):
+                content.append(line, fname, 0)
 
-        line_regex = re.compile(r"^\.\. LINENO (\S+)\#([0-9]+)$")
-        ln = 0
-        n = 0
-        f = fname
+            self.do_parse(content, node)
 
-        for line in lines.split("\n"):
-            n = n + 1
-            match = line_regex.search(line)
-            if match:
-                new_f = match.group(1)
+        else:
+            # Handles the ABI parser content, symbol by symbol
 
-                # Sphinx parser is lazy: it stops parsing contents in the
-                # middle, if it is too big. So, handle it per input file
-                if new_f != f and content:
-                    self.do_parse(content, node)
-                    content = ViewList()
+            old_f = fname
+            n = 0
+            for msg, f, ln in self.parser.doc():
+                msg_list = msg.split("\n")
+                if "debug" in self.options:
+                    lines = [
+                        "", "",  ".. code-block:: rst",
+                        "    :linenos:", ""
+                    ]
+                    for m in msg_list:
+                        lines.append("    " + m)
+                else:
+                    lines = msg_list
 
+                for line in lines:
+                    # sphinx counts lines from 0
+                    content.append(line, f, ln - 1)
+                    n += 1
+
+                if f != old_f:
                     # Add the file to Sphinx build dependencies
                     env.note_dependency(os.path.abspath(f))
 
-                f = new_f
+                    old_f = f
 
-                # sphinx counts lines from 0
-                ln = int(match.group(2)) - 1
-            else:
-                content.append(line, f, ln)
+                # Sphinx doesn't like to parse big messages. So, let's
+                # add content symbol by symbol
+                if content:
+                    self.do_parse(content, node)
+                    content = ViewList()
 
-        self.logger.info("%s: parsed %i lines" % (fname, n))
-
-        if content:
-            self.do_parse(content, node)
+            self.logger.info("%s: parsed %i lines" % (fname, n))
 
         return node.children
 
diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 93b973bc07ed..19f78d6aa407 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -63,8 +63,11 @@ class AbiRest:
         parser.parse_abi()
         parser.check_issues()
 
-        for msg in parser.doc(args.enable_lineno, args.raw, not args.no_file):
-            print(msg)
+        for t in parser.doc(args.raw, not args.no_file):
+            if args.enable_lineno:
+                print (f".. LINENO {t[1]}#{t[2]}\n\n")
+
+            print(t[0])
 
 class AbiValidate:
     """Initialize an argparse subparser for ABI validation"""
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 57c125fd40a5..1db6c54fc65a 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -427,7 +427,7 @@ class AbiParser:
 
         return new_desc + "\n\n"
 
-    def doc(self, enable_lineno, output_in_txt=False, show_file=False):
+    def doc(self, output_in_txt=False, show_file=True):
         """Print ABI at stdout"""
 
         part = None
@@ -444,10 +444,6 @@ class AbiParser:
 
             msg = ""
 
-            if enable_lineno:
-                ln = v.get("line_no", 1)
-                msg += f".. LINENO {file_ref[0][0]}#{ln}\n\n"
-
             if wtype != "File":
                 cur_part = names[0]
                 if cur_part.find("/") >= 0:
@@ -508,7 +504,9 @@ class AbiParser:
             if users and users.strip(" \t\n"):
                 msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
 
-            yield msg
+            ln = v.get("line_no", 1)
+
+            yield (msg, file_ref[0][0], ln)
 
     def check_issues(self):
         """Warn about duplicated ABI entries"""
-- 
2.48.1

