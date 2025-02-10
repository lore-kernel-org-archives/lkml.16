Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C181CEE8D;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=QIUktodGyE2/X51BFsdvYDRoadyM/3zB5sOVwmNSFhRKxzZ2v9qN1W+T44WRHtammJUhNaiB31rpcuFimmkqyd24tgY7M0RJbmcJM+0hu8GqVwdy7ILb++dmQnxOhEMk+pfXHFLGClQcbtihdiM+ySKzWWfA/4vbQIBntg82kME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=ioH67mGmMrR7TV2QvHCqqT6mvSN3es7X+oI3VVv4IjM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ABGP6tIMw9pBFaZCKDyg/cqcyVo1wVok/PsGr8kETcz7UD6oFFiDqY37WvbugE9eMFYnJYXVIP2DY1TTnJRSCe2Cy4o4HrARVuWH5plSj6W48NcQ7igapst/W/NLkI7H2XdhrTFduK0YnoI0+zR1Wnw5o1oosqWXuzIzPtJoGdQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fwdoaYtC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fwdoaYtC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3577CC4CEFF;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=ioH67mGmMrR7TV2QvHCqqT6mvSN3es7X+oI3VVv4IjM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fwdoaYtCc+OirL8GqRT1NghqS9E2w2ZR5RR3fxw7lsS97vO4TirSEaAEMCKJZwmDb
	 InealSIMP6amc6kBOzISZ0pR/X78zIiVB580WxYWU1UM+fw7VJykB61cY3Yro8pdiT
	 DADYVLrRWeO58wRzjXrkxT0nWWWCvuhGoG6e+Tkq94auRqhjwQ/e1+IlpR7LCh2P3O
	 lT3fcIoIUQBO6liwIqQ6jW35d843UYapg6oi/eH8AuM1beQbUZafiQdJBuua22xc7/
	 ahKFh5bLHnC6QSixfK8YPyGda79H44rhwdkBuPBlHUFDFczQZUloNKCoYxIxKLmV3s
	 UuEzLIqFGtjOw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CjI-1PFj;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 18/27] scripts/get_abi.pl: Add filtering capabilities to rest output
Date: Mon, 10 Feb 2025 11:18:07 +0100
Message-ID: <41e108e816e46434aa596e5c0d25d227cb9f0fe5.1739182025.git.mchehab+huawei@kernel.org>
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

This way, Sphinx ABI extension can parse symbols only once, while
keep displaying results in separate files.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/abi/abi_parser.py | 21 +++++++++++++++------
 1 file changed, 15 insertions(+), 6 deletions(-)

diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 1db6c54fc65a..b20d5c9d920e 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -160,6 +160,7 @@ class AbiParser:
                         self.data[fdata.key] = {
                             "what": [content],
                             "file": [fdata.file_ref],
+                            "path": fdata.ftype,
                             "line_no": fdata.ln,
                         }
 
@@ -182,8 +183,6 @@ class AbiParser:
                 if new_what:
                     fdata.label = ""
 
-                    self.data[fdata.key]["type"] = fdata.ftype
-
                     if "description" in self.data[fdata.key]:
                         self.data[fdata.key]["description"] += "\n\n"
 
@@ -299,6 +298,7 @@ class AbiParser:
         fdata.nametag = {}
         fdata.nametag["what"] = [f"File {path}/{basename}"]
         fdata.nametag["type"] = "File"
+        fdata.nametag["path"] = fdata.ftype
         fdata.nametag["file"] = [fdata.file_ref]
         fdata.nametag["line_no"] = 1
         fdata.nametag["description"] = ""
@@ -427,7 +427,8 @@ class AbiParser:
 
         return new_desc + "\n\n"
 
-    def doc(self, output_in_txt=False, show_file=True):
+    def doc(self, output_in_txt=False, show_symbols=True, show_file=True,
+            filter_path=None):
         """Print ABI at stdout"""
 
         part = None
@@ -435,12 +436,20 @@ class AbiParser:
                              key=lambda x: (x[1].get("type", ""),
                                             x[1].get("what"))):
 
-            wtype = v.get("type", "Var")
+            wtype = v.get("type", "Symbol")
             file_ref = v.get("file")
             names = v.get("what", [""])
 
-            if not show_file and wtype == "File":
-                continue
+            if wtype == "File":
+                if not show_file:
+                    continue
+            else:
+                if not show_symbols:
+                    continue
+
+            if filter_path:
+                if v.get("path") != filter_path:
+                    continue
 
             msg = ""
 
-- 
2.48.1

