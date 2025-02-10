Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C7B1CCB4B;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=vCQYpFw6LQyD4e0xWpid2SLytpv77uGU/kTh2YCepRmFstYtyqpJ6w9ixBa5kWurpZeIEcgJ/0TOIK9m85cRNXD7ETUwWJCbfdNbDP5KlLCD4ZQkm1e9i9KKfxxYjJLWpzwqpc8RbCObmaO/cYHhRGkm5Dtx/3Y2xuQg3jBAgrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=KxOyE5BKUrI++h92xXMIAQUn0Quywt6iwaXVifE22IU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qDJ2QeMqznPxk3PuIQLGSy+DPG5Ok6Ga8oL3TauVg7dlR8tJUa1K2aKVmGz5JLlPGyFtHDdKYJOjL7S1kkySV/Oq2iMa8y1BlLEMM0WN5BaTcEuXEclxxvNQ/2MDWMK32BTCdhUmAj4Pvzk1Pnv4iaYS8tXNRRtkSu8ERZIftZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kGnFr2Tm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kGnFr2Tm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FE2DC4CEFC;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=KxOyE5BKUrI++h92xXMIAQUn0Quywt6iwaXVifE22IU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kGnFr2TmOi9BceEGxRqxrSwwheR2Z8q4ipWc6QfQLUp7/6EdIV0EbQTwr/JTOwVQY
	 sPj7+w7EA2U4pirQ1osH8iy7md3MOW3qrJW2eImbYa4tPlhwHGxxHgv6mEd5ODg1NH
	 pTSKVjSoZ0kA6DrNwosyvNK46FAxMI3JKJsU25zwtXHE4V9srWm5ibVyMd24Hf0Kxq
	 TVPZcvSxmg1/q/XaU07dJUyMA1Sl3wddsnA6Ylc02YoN0+Cjnz2CLrpqX+zSvlIplF
	 m/7j3xwv4b2xGkyX7MRirKvl4BTfxOmrsn1hERNeJ5VB5+C4H/VD3dlCJOd8OXSeLC
	 aq/s7PWs0W7yw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cj2-0ySU;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/27] scripts/lib/abi/abi_parser.py: use an interactor for ReST output
Date: Mon, 10 Feb 2025 11:18:03 +0100
Message-ID: <e3c94b8cdfd5e955aa19a703921f364a89089634.1739182025.git.mchehab+huawei@kernel.org>
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

Instead of printing all results line per line, use an interactor
to return each variable as a separate message.

This won't change much when using it via command line, but it
will help Sphinx integration by providing an interactor that
could be used there to handle ABI symbol by symbol.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py            |  3 ++-
 scripts/lib/abi/abi_parser.py | 48 +++++++++++++++++++----------------
 2 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index 30439f21fdd0..93b973bc07ed 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -62,8 +62,9 @@ class AbiRest:
         parser = AbiParser(args.dir, debug=args.debug)
         parser.parse_abi()
         parser.check_issues()
-        parser.print_data(args.enable_lineno, args.raw, not args.no_file)
 
+        for msg in parser.doc(args.enable_lineno, args.raw, not args.no_file):
+            print(msg)
 
 class AbiValidate:
     """Initialize an argparse subparser for ABI validation"""
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 6052a8aec443..960e27161c26 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -336,7 +336,7 @@ class AbiParser:
                 name = os.path.join(root, entry.name)
 
                 if entry.is_dir():
-                    self.parse_abi(name)
+                    self._parse_abi(name)
                     continue
 
                 if not entry.is_file():
@@ -365,14 +365,14 @@ class AbiParser:
         if self.debug & AbiDebug.DUMP_ABI_STRUCTS:
             self.log.debug(pformat(self.data))
 
-    def print_desc_txt(self, desc):
+    def desc_txt(self, desc):
         """Print description as found inside ABI files"""
 
         desc = desc.strip(" \t\n")
 
-        print(desc + "\n")
+        return desc + "\n\n"
 
-    def print_desc_rst(self, desc):
+    def desc_rst(self, desc):
         """Enrich ReST output by creating cross-references"""
 
         # Remove title markups from the description
@@ -425,9 +425,9 @@ class AbiParser:
 
             new_desc += d + "\n"
 
-        print(new_desc + "\n")
+        return new_desc + "\n\n"
 
-    def print_data(self, enable_lineno, output_in_txt, show_file=False):
+    def doc(self, enable_lineno, output_in_txt, show_file=False):
         """Print ABI at stdout"""
 
         part = None
@@ -442,9 +442,11 @@ class AbiParser:
             if not show_file and wtype == "File":
                 continue
 
+            msg = ""
+
             if enable_lineno:
                 ln = v.get("line_no", 1)
-                print(f".. LINENO {file_ref[0][0]}#{ln}\n")
+                msg += f".. LINENO {file_ref[0][0]}#{ln}\n\n"
 
             if wtype != "File":
                 cur_part = names[0]
@@ -456,9 +458,9 @@ class AbiParser:
 
                 if cur_part and cur_part != part:
                     part = cur_part
-                    print(f"{part}\n{"-" * len(part)}\n")
+                    msg += f"{part}\n{"-" * len(part)}\n\n"
 
-                print(f".. _{key}:\n")
+                msg += f".. _{key}:\n\n"
 
                 max_len = 0
                 for i in range(0, len(names)):           # pylint: disable=C0200
@@ -466,45 +468,47 @@ class AbiParser:
 
                     max_len = max(max_len, len(names[i]))
 
-                print("+-" + "-" * max_len + "-+")
+                msg += "+-" + "-" * max_len + "-+\n"
                 for name in names:
-                    print(f"| {name}" + " " * (max_len - len(name)) + " |")
-                    print("+-" + "-" * max_len + "-+")
-                print()
+                    msg += f"| {name}" + " " * (max_len - len(name)) + " |\n"
+                    msg += "+-" + "-" * max_len + "-+\n"
+                msg += "\n"
 
             for ref in file_ref:
                 if wtype == "File":
-                    print(f".. _{ref[1]}:\n")
+                    msg += f".. _{ref[1]}:\n\n"
                 else:
                     base = os.path.basename(ref[0])
-                    print(f"Defined on file :ref:`{base} <{ref[1]}>`\n")
+                    msg += f"Defined on file :ref:`{base} <{ref[1]}>`\n\n"
 
             if wtype == "File":
-                print(f"{names[0]}\n{"-" * len(names[0])}\n")
+                msg += f"{names[0]}\n{"-" * len(names[0])}\n\n"
 
             desc = v.get("description")
             if not desc and wtype != "File":
-                print(f"DESCRIPTION MISSING for {names[0]}\n")
+                msg += f"DESCRIPTION MISSING for {names[0]}\n\n"
 
             if desc:
                 if output_in_txt:
-                    self.print_desc_txt(desc)
+                    msg += self.desc_txt(desc)
                 else:
-                    self.print_desc_rst(desc)
+                    msg += self.desc_rst(desc)
 
             symbols = v.get("symbols")
             if symbols:
-                print("Has the following ABI:\n")
+                msg += "Has the following ABI:\n\n"
 
                 for w, label in symbols:
                     # Escape special chars from content
                     content = self.re_escape.sub(r"\\\1", w)
 
-                    print(f"- :ref:`{content} <{label}>`\n")
+                    msg += f"- :ref:`{content} <{label}>`\n\n"
 
             users = v.get("users")
             if users and users.strip(" \t\n"):
-                print(f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n")
+                msg += f"Users:\n\t{users.strip("\n").replace('\n', '\n\t')}\n\n"
+
+            yield msg
 
     def check_issues(self):
         """Warn about duplicated ABI entries"""
-- 
2.48.1

