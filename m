Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 876F12F272E;
	Thu,  3 Jul 2025 18:44:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568258; cv=none; b=d5dOD7s42x3wfz6W0Qo5EKtHHphCbewQrXETwyggKYXOY3O1dEFrKgpARRPFrWxYCGO5kzAoXYEGvwXjsQXZAeDP0zkgQRjexgEmFFSiDYuxO2kJZ1J2kkmJOa4U6uoJNtmdyC3jy/Xsmp9mmH0BXhtSkDddbJLwpBaO5mEy1NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568258; c=relaxed/simple;
	bh=GkG1vcG7XhGcUSdNrA6zdkdLxMcOkR0H4rbcmrTFcc4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYJCE+iK2WqieXHhE6ab+ZM1Dk7B/CLNfEjajb2hiPMpqjXRXsA9ntALegy04zq7NJDp3c05AXebY0DVy92hd/f6HwDByvtgvPg7yl+MYhcW0ij9mnN1eb8Ybr29p40ZOy5RRqqlRBDgIjy1MEgGDmQM/WGRJlwfqRBiikmE+IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=PwnakXp6; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="PwnakXp6"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net AF11440AD6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568257; bh=Ht7j5bPcQZEQ3B0MbNRUh1mM8iQ6b/SWlh5C5aYnfiA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PwnakXp6K1pRO+SrrcXSlIBrMg29sZIlm8QY/++md8VVUcSrf/OTbBJCqMSKNRW3V
	 ukjDPF7+mVe4Lm5kLazHpkJOqKCQ/bPAZMEppBvVmyJG3a+5oOfWouJqAKBXuY/NY9
	 rS5j+fgrYrt+xvHauUmS0SI14TuEtm8NXrQe/oQduY2Q01CS1SuASpf5p7jvlc11S5
	 9Yt8ZrbDbWZTm47AocJ7CVRlADNBLtrf9P3G69YZM+IEV/396+hxcw6k/KjZzOCcny
	 n1fFqzSyyTmSX7HFXaVPm/mGvj+wsSNuyeFogaGQBbW4TTccYMu7pIAk5/24S2Rw5M
	 oIHMCMN1q425w==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id AF11440AD6;
	Thu,  3 Jul 2025 18:44:16 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 4/7] docs: kdoc: rework type prototype parsing
Date: Thu,  3 Jul 2025 12:44:00 -0600
Message-ID: <20250703184403.274408-5-corbet@lwn.net>
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

process_proto_type() is using a complex regex and a "while True" loop to
split a declaration into chunks and, in the end, count brackets.  Switch to
using a simpler regex to just do the split directly, and handle each chunk
as it comes.  The result is, IMO, easier to understand and reason about.

The old algorithm would occasionally elide the space between function
parameters; see struct rng_alg->generate(), foe example.  The only output
difference is to not elide that space, which is more correct.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 43 +++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 18 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 935f2a3c4b47..61da297df623 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1594,30 +1594,37 @@ class KernelDoc:
 
         # Strip C99-style comments and surrounding whitespace
         line = KernRe(r"//.*$", re.S).sub('', line).strip()
+        if not line:
+            return # nothing to see here
 
         # To distinguish preprocessor directive from regular declaration later.
         if line.startswith('#'):
             line += ";"
-
-        r = KernRe(r'([^\{\};]*)([\{\};])(.*)')
-        while True:
-            if r.search(line):
-                if self.entry.prototype:
-                    self.entry.prototype += " "
-                self.entry.prototype += r.group(1) + r.group(2)
-
-                self.entry.brcount += r.group(2).count('{')
-                self.entry.brcount -= r.group(2).count('}')
-
-                if r.group(2) == ';' and self.entry.brcount <= 0:
+        #
+        # Split the declaration on any of { } or ;, and accumulate pieces
+        # until we hit a semicolon while not inside {brackets}
+        #
+        r = KernRe(r'(.*?)([{};])')
+        for chunk in r.split(line):
+            if chunk:  # Ignore empty matches
+                self.entry.prototype += chunk
+                #
+                # This cries out for a match statement ... someday after we can
+                # drop Python 3.9 ...
+                #
+                if chunk == '{':
+                    self.entry.brcount += 1
+                elif chunk == '}':
+                    self.entry.brcount -= 1
+                elif chunk == ';' and self.entry.brcount <= 0:
                     self.dump_declaration(ln, self.entry.prototype)
                     self.reset_state(ln)
-                    break
-
-                line = r.group(3)
-            else:
-                self.entry.prototype += line
-                break
+                    return
+        #
+        # We hit the end of the line while still in the declaration; put
+        # in a space to represent the newline.
+        #
+        self.entry.prototype += ' '
 
     def process_proto(self, ln, line):
         """STATE_PROTO: reading a function/whatever prototype."""
-- 
2.49.0

