Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9373A2673A0;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=AcKa0Qt12sPyas9LRgyFMkOiCv/Dur0OdJ4obZQ9MbZcp5YH2hwa8BlX04ZIU9JOBdWQI07IpXqpPIdvZPMANlAXjWeE6HV/SgZJM7izlvGiV3jCIGzhyC0/MdQHc3h75aLExYigb2FmtdHXNpEsYf2iqqTAIlyAPyAw78lvXN4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=qNbb8ty5fRnxFkcUXw+miskt6Tu11OYOQ5Ju3o0WAzI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKdm3S8m8v+faCjE8GGEbemvyW4xm6MRxxKG53ckho6uSUtQSGgKtvEc9w1//4yR+5GfsjphvnGZxz7uUOdqHPdVZsfarrxdgSZXyOsyPseUrHgSQdYshVoiH8Ga3HgRRH3JQUIm8Z4BymZ1JLFiNlU9aiblnXlfBVv3rDn1MFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Igstavse; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Igstavse"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE98C4CEEC;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=qNbb8ty5fRnxFkcUXw+miskt6Tu11OYOQ5Ju3o0WAzI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=IgstavseRL2eOlVa2rHZE9QalA4Z2S7D8SROqhmrZv0E701E2uwwLmXoXKaCs5Vfz
	 uYtoc7DOWTlOhni/I/gAeTwiI5KXuN2mMt0GMUDeIse+V46Ks8k5CuLTM1f5OHnoO1
	 /NwS/fdnwyo3ykZ+lFeNigTuxQe56WC7griisuckf9ltjV+13HZIwrl+dfhU4WoxEx
	 2QC5uvn23yjDENalxqKgXDeYCnLs3HPgrscz1/vrG3Snk/YbnMU8Z1ibKEkwHS+scl
	 t7m8BP44dIjzvdI1YGwb3ydhl/9BrKQa+m4dc0wxAwx9Pe0UHjmp41nBXgXrXg7lFn
	 x7FA93jrD0hhQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RVU-0C02;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 05/33] scripts/kernel-doc.py: better handle empty sections
Date: Tue,  8 Apr 2025 18:09:08 +0800
Message-ID: <1b057092a48ba61d92a411f4f6d505b802913785.1744106241.git.mchehab+huawei@kernel.org>
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

While doing the conversion, we opted to skip empty sections
(description, return), but this makes harder to see the differences
between kernel-doc (Perl) and kernel-doc.py.

Also, the logic doesn't always work properly. So, change the
way this is done by adding an extra step to remove such
sections, doing it only for Return and Description.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/kernel-doc.py | 31 ++++++++++++++++++++++++++++---
 1 file changed, 28 insertions(+), 3 deletions(-)

diff --git a/scripts/kernel-doc.py b/scripts/kernel-doc.py
index 8625209d6293..90808d538de7 100755
--- a/scripts/kernel-doc.py
+++ b/scripts/kernel-doc.py
@@ -317,6 +317,19 @@ class KernelDoc:
         name = self.entry.section
         contents = self.entry.contents
 
+        # TODO: we can prevent dumping empty sections here with:
+        #
+        #    if self.entry.contents.strip("\n"):
+        #       if start_new:
+        #           self.entry.section = self.section_default
+        #           self.entry.contents = ""
+        #
+        #        return
+        #
+        # But, as we want to be producing the same output of the
+        # venerable kernel-doc Perl tool, let's just output everything,
+        # at least for now
+
         if type_param.match(name):
             name = type_param.group(1)
 
@@ -373,6 +386,19 @@ class KernelDoc:
 
         args["type"] = dtype
 
+        # TODO: use colletions.OrderedDict
+
+        sections = args.get('sections', {})
+        sectionlist = args.get('sectionlist', [])
+
+        # Drop empty sections
+        # TODO: improve it to emit warnings
+        for section in [ "Description", "Return" ]:
+            if section in sectionlist:
+                if not sections[section].rstrip():
+                    del sections[section]
+                    sectionlist.remove(section)
+
         self.entries.append((name, args))
 
         self.config.log.debug("Output: %s:%s = %s", dtype, name, pformat(args))
@@ -476,7 +502,7 @@ class KernelDoc:
         # to ignore "[blah" in a parameter string.
 
         self.entry.parameterlist.append(param)
-        org_arg = Re(r'\s\s+').sub(' ', org_arg, count=1)
+        org_arg = Re(r'\s\s+').sub(' ', org_arg)
         self.entry.parametertypes[param] = org_arg
 
     def save_struct_actual(self, actual):
@@ -1384,8 +1410,7 @@ class KernelDoc:
             return
 
         if doc_end.search(line):
-            if self.entry.contents.strip("\n"):
-                self.dump_section()
+            self.dump_section()
 
             # Look for doc_com + <text> + doc_end:
             r = Re(r'\s*\*\s*[a-zA-Z_0-9:\.]+\*/')
-- 
2.49.0

