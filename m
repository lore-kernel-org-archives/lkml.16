Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55A8F266B79;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=FA91j/QZogALv4TT0JS03P0bwiIn+RpjVAguWwsIRXTNV12jDZeqQmJzQHu06LGpSUBq4Ziol/agYY7ou+MYfQ3WSjekknzkmAwYaE2ofxfUtON0vkqDOqz86sEsIXAHBN7TlrTYc1dQBvu8cG5Wg8ZoxYyFF7o4qPO653SlyqM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=aBedWHeAMyQ8zeUoubzCtMfcMsOOxpIGXbGY+jZZDSw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=C5HP1awks00amMWLlc2KAlqymO55XwAbr7/hxusHXpF7ofP9jdPs4TH3MraaZqPF/94rj2gPQOxHyWNoWB9Ut8urmsclMq7IuVpylVtvgRSo/m/b58NWS8vrwXNc9D4V5cugi+aDVTOPGbpZw8DMO3LTzCdrnEGJdCD652DzkPE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JEYCwj16; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JEYCwj16"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 34236C4CEE5;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=aBedWHeAMyQ8zeUoubzCtMfcMsOOxpIGXbGY+jZZDSw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JEYCwj16pty+1zVFLjGUgd172Bt2qI8nOm+muagoXOU2g9SMYKI+u7zA+Ycm2EYdJ
	 1eElT+BxpHWXLBY/CMsI9Ir/os6R6Jn0eOl5NPBF/ldycTFFC9T7lBuM/IVmG6k/5M
	 7wMnowfKCOPVvAIYCA7kTH41xUX0ATszG9uiCqCTcw8r4K51uVx0nH5eMb8lDcnAss
	 AJ+bzO0fmmHh1WfFPHcOSHwXBglC//mC8Tsdm8A22ik7BfEpGk0bdCgOmXWhwQbkUS
	 T0KGshfgOBSU/V+IB+ghPWkC6ssa/8DeLOboAWiBwGDCyDRqPX4FP1414QSOvl8NS2
	 QG5NcBC7+XTxA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWh-2he4;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 30/33] scripts/lib/kdoc/kdoc_files.py: allow filtering output per fname
Date: Tue,  8 Apr 2025 18:09:33 +0800
Message-ID: <9f5c0ff2568f34532ca99465fb378241d831d39f.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

For kerneldoc Sphinx extension, it is useful to display
parsed results only from a single file. Change the logic at
KernelFiles.msg() to allow such usage.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_files.py | 24 ++++++++++++------------
 1 file changed, 12 insertions(+), 12 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 182d9ed58a72..527ab9117268 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -95,7 +95,7 @@ class KernelFiles():
         doc = KernelDoc(self.config, fname)
         doc.run()
 
-        return doc
+        return doc.entries
 
     def process_export_file(self, fname):
         """
@@ -173,7 +173,7 @@ class KernelFiles():
         # Initialize internal variables
 
         self.config.errors = 0
-        self.results = []
+        self.results = {}
 
         self.files = set()
         self.export_files = set()
@@ -189,13 +189,9 @@ class KernelFiles():
         # avoid reporting errors multiple times
 
         for fname in glob.parse_files(file_list, self.file_not_found_cb):
-            if fname in self.files:
-                continue
-
-            res = self.parse_file(fname)
-
-            self.results.append((res.fname, res.entries))
-            self.files.add(fname)
+            if fname not in self.files:
+                self.results[fname] = self.parse_file(fname)
+                self.files.add(fname)
 
         # If a list of export files was provided, parse EXPORT_SYMBOL*
         # from files that weren't fully parsed
@@ -226,7 +222,8 @@ class KernelFiles():
         return self.out_style.msg(fname, name, arg)
 
     def msg(self, enable_lineno=False, export=False, internal=False,
-            symbol=None, nosymbol=None, no_doc_sections=False):
+            symbol=None, nosymbol=None, no_doc_sections=False,
+            filenames=None):
         """
         Interacts over the kernel-doc results and output messages,
         returning kernel-doc markups on each interaction
@@ -248,9 +245,12 @@ class KernelFiles():
                                   function_table, enable_lineno,
                                   no_doc_sections)
 
-        for fname, arg_tuple in self.results:
+        if not filenames:
+            filenames = sorted(self.results.keys())
+
+        for fname in filenames:
             msg = ""
-            for name, arg in arg_tuple:
+            for name, arg in self.results[fname]:
                 msg += self.out_msg(fname, name, arg)
 
                 if msg is None:
-- 
2.49.0

