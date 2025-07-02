Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A85141EFFB2;
	Wed,  2 Jul 2025 22:36:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751495767; cv=none; b=hAgJp5OUGDqu54OnraqU8X+3fDf4898thzVerPPUIfcekcWkIKiM1VYoGEmXw2MGFDjV9Wn1Zg/nZeBWkreF6fUw85k95ZpfNhHPStm0xnsaKPRVkkRaI2YqyueKXIqJTdgG4MMbtyuE5Aa/iwhmqwTm8MGuM8JEL0nKYVUqhhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751495767; c=relaxed/simple;
	bh=4SkXDuSH5d0MQz0tjUtF3aVxZM9jev/kKFwYIgV3dIA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=eIOLtj6xjVm6uzq5l7ttnfRpuAkeqfkZ6eHW2zGHOUv2sTchdrwc/3AgyTL9ct91aLl4QQ1wNDtasx5wSQgIAUR3kbY5Ywta95/3WmF/gKGPzUWGw2cLje/NpGEtyicqGIU+ucTAZDuDQZqUZxuMZarxLqRmZI3qJGqhICN1wQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=fDE2vn4q; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="fDE2vn4q"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 0DDDE40ADA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751495763; bh=60fwhjdRi8LYqWQgY9qP3XX75O6s+2P4dOVrLSNmfcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fDE2vn4q9qBS1ON2SEhGrc/RnmgVSXGAEHtowqYvm/kZ2axUEQfKxxldFpGACwJim
	 FjyAoVjxSAonjsKH0W/Vh06yi25GyYWMaoB37RdoKEeaxjtA+M76EKqiqoQMYb5r7H
	 Bmz/q/3skxS3JG6JYImYuExpv2sIxwuIdVBAYMnqwCOsU+9JbB3xxM9pZAoAYdGFZt
	 aOLlYH4g4u3mnuXJU7eXSEBgoQlF7QW+BMqfKhtNQ5dRaXuOdtfIuqKB13nWlAcyG6
	 op02S3fYe4QhwKftiBxCvjwCdeOo+9IVjXWFth/B+LD0PIvZ9WYQcji4NJEGZC+Is9
	 pw8gme4R1pOcg==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 0DDDE40ADA;
	Wed,  2 Jul 2025 22:36:03 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 08/12] docs: kdoc: Regularize the use of the declaration name
Date: Wed,  2 Jul 2025 16:35:20 -0600
Message-ID: <20250702223524.231794-9-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250702223524.231794-1-corbet@lwn.net>
References: <20250702223524.231794-1-corbet@lwn.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Each declaration type passes through the name in a unique field of the
"args" blob - even though we have always just passed the name separately.
Get rid of all the weird names and just use the common version.

Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_output.py | 39 +++++++++++++--------------------
 scripts/lib/kdoc/kdoc_parser.py |  6 -----
 2 files changed, 15 insertions(+), 30 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index d6f4d9e7173b..8a31b637ffd2 100644
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -367,11 +367,11 @@ class RestFormat(OutputFormat):
 
         func_macro = args.get('func_macro', False)
         if func_macro:
-            signature = args['function']
+            signature = name
         else:
             if args.get('functiontype'):
                 signature = args['functiontype'] + " "
-            signature += args['function'] + " ("
+            signature += name + " ("
 
         ln = args.get('declaration_start_line', 0)
         count = 0
@@ -391,7 +391,7 @@ class RestFormat(OutputFormat):
 
         self.print_lineno(ln)
         if args.get('typedef') or not args.get('functiontype'):
-            self.data += f".. c:macro:: {args['function']}\n\n"
+            self.data += f".. c:macro:: {name}\n\n"
 
             if args.get('typedef'):
                 self.data += "   **Typedef**: "
@@ -445,7 +445,6 @@ class RestFormat(OutputFormat):
     def out_enum(self, fname, name, args):
 
         oldprefix = self.lineprefix
-        name = args.get('enum', '')
         ln = args.get('declaration_start_line', 0)
 
         self.data += f"\n\n.. c:enum:: {name}\n\n"
@@ -475,7 +474,6 @@ class RestFormat(OutputFormat):
     def out_typedef(self, fname, name, args):
 
         oldprefix = self.lineprefix
-        name = args.get('typedef', '')
         ln = args.get('declaration_start_line', 0)
 
         self.data += f"\n\n.. c:type:: {name}\n\n"
@@ -492,7 +490,6 @@ class RestFormat(OutputFormat):
 
     def out_struct(self, fname, name, args):
 
-        name = args.get('struct', "")
         purpose = args.get('purpose', "")
         declaration = args.get('definition', "")
         dtype = args.get('type', "struct")
@@ -632,16 +629,16 @@ class ManFormat(OutputFormat):
     def out_function(self, fname, name, args):
         """output function in man"""
 
-        self.data += f'.TH "{args["function"]}" 9 "{args["function"]}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
+        self.data += f'.TH "{name}" 9 "{name}" "{self.man_date}" "Kernel Hacker\'s Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"{args['function']} \\- {args['purpose']}\n"
+        self.data += f"{name} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
         if args.get('functiontype', ''):
-            self.data += f'.B "{args["functiontype"]}" {args["function"]}' + "\n"
+            self.data += f'.B "{args["functiontype"]}" {name}' + "\n"
         else:
-            self.data += f'.B "{args["function"]}' + "\n"
+            self.data += f'.B "{name}' + "\n"
 
         count = 0
         parenth = "("
@@ -676,16 +673,13 @@ class ManFormat(OutputFormat):
             self.output_highlight(text)
 
     def out_enum(self, fname, name, args):
-
-        name = args.get('enum', '')
-
-        self.data += f'.TH "{self.modulename}" 9 "enum {args["enum"]}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.data += f'.TH "{self.modulename}" 9 "enum {name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"enum {args['enum']} \\- {args['purpose']}\n"
+        self.data += f"enum {name} \\- {args['purpose']}\n"
 
         self.data += ".SH SYNOPSIS\n"
-        self.data += f"enum {args['enum']}" + " {\n"
+        self.data += f"enum {name}" + " {\n"
 
         count = 0
         for parameter in args.parameterlist:
@@ -710,13 +704,12 @@ class ManFormat(OutputFormat):
 
     def out_typedef(self, fname, name, args):
         module = self.modulename
-        typedef = args.get('typedef')
         purpose = args.get('purpose')
 
-        self.data += f'.TH "{module}" 9 "{typedef}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.data += f'.TH "{module}" 9 "{name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"typedef {typedef} \\- {purpose}\n"
+        self.data += f"typedef {name} \\- {purpose}\n"
 
         for section, text in args.sections.items():
             self.data += f'.SH "{section}"' + "\n"
@@ -724,22 +717,20 @@ class ManFormat(OutputFormat):
 
     def out_struct(self, fname, name, args):
         module = self.modulename
-        struct_type = args.get('type')
-        struct_name = args.get('struct')
         purpose = args.get('purpose')
         definition = args.get('definition')
 
-        self.data += f'.TH "{module}" 9 "{struct_type} {struct_name}" "{self.man_date}" "API Manual" LINUX' + "\n"
+        self.data += f'.TH "{module}" 9 "{args.type} {name}" "{self.man_date}" "API Manual" LINUX' + "\n"
 
         self.data += ".SH NAME\n"
-        self.data += f"{struct_type} {struct_name} \\- {purpose}\n"
+        self.data += f"{args.type} {name} \\- {purpose}\n"
 
         # Replace tabs with two spaces and handle newlines
         declaration = definition.replace("\t", "  ")
         declaration = KernRe(r"\n").sub('"\n.br\n.BI "', declaration)
 
         self.data += ".SH SYNOPSIS\n"
-        self.data += f"{struct_type} {struct_name} " + "{" + "\n.br\n"
+        self.data += f"{args.type} {name} " + "{" + "\n.br\n"
         self.data += f'.BI "{declaration}\n' + "};\n.br\n\n"
 
         self.data += ".SH Members\n"
diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 298abd260264..6e35e508608b 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -790,7 +790,6 @@ class KernelDoc:
                 level += 1
 
         self.output_declaration(decl_type, declaration_name,
-                                struct=declaration_name,
                                 definition=declaration,
                                 purpose=self.entry.declaration_purpose)
 
@@ -870,7 +869,6 @@ class KernelDoc:
                               f"Excess enum value '%{k}' description in '{declaration_name}'")
 
         self.output_declaration('enum', declaration_name,
-                                enum=declaration_name,
                                 purpose=self.entry.declaration_purpose)
 
     def dump_declaration(self, ln, prototype):
@@ -1031,14 +1029,12 @@ class KernelDoc:
 
         if 'typedef' in return_type:
             self.output_declaration(decl_type, declaration_name,
-                                    function=declaration_name,
                                     typedef=True,
                                     functiontype=return_type,
                                     purpose=self.entry.declaration_purpose,
                                     func_macro=func_macro)
         else:
             self.output_declaration(decl_type, declaration_name,
-                                    function=declaration_name,
                                     typedef=False,
                                     functiontype=return_type,
                                     purpose=self.entry.declaration_purpose,
@@ -1077,7 +1073,6 @@ class KernelDoc:
             self.create_parameter_list(ln, decl_type, args, ',', declaration_name)
 
             self.output_declaration(decl_type, declaration_name,
-                                    function=declaration_name,
                                     typedef=True,
                                     functiontype=return_type,
                                     purpose=self.entry.declaration_purpose)
@@ -1099,7 +1094,6 @@ class KernelDoc:
                 return
 
             self.output_declaration('typedef', declaration_name,
-                                    typedef=declaration_name,
                                     purpose=self.entry.declaration_purpose)
             return
 
-- 
2.49.0

