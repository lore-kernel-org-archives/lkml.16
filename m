Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51ED6302053;
	Tue,  1 Jul 2025 20:57:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403481; cv=none; b=sm9h49V9Qdsa3D0mt2Q9P7dnREGzwC2DkC9athgE9cHRBuquwh4go0bG7txa0oSUa7573k1m/Wz7SfsB1CxMxzB0x2dloDRt/3YU674Il5fdx1Av4F6NvjVp3cdBClPpx2uSo69+1EOW4sQ9TTEDqrX7RbeZxR6zic/HYOG+P2w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403481; c=relaxed/simple;
	bh=8woP62j53qGvsVZDuQRzXt2antcHS9ViJX/e9L82LsM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sGdsvl+I2ei9LszQwB30zJxj3m00B8AIyhuT9P/AAWX3uJzD4v1uBeLn29ikcwB9wRO1ASzGQ+Un+z2MHb2aXT1X/KyzgQkrRZyxCTpiNf4eCI3c6xv7keakUtOFE/6tHLGNAu+BsV5a8GxbryWaU+QQUja1KRpCrTVrHWY36rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=g7cchjSE; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="g7cchjSE"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E696340AD4
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403473; bh=o/PYVZ1NQ2jZybUGo68fGCgKxKVLUxg0MJqImAONQxM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g7cchjSELg7osNxKgpichOGBwO0niQOo/arzpU6CWUlrzPLEHZxUUcjDjNgVx7Rra
	 UbWdlO2f6luNBbc/pcTRcmTRGwIZ8bsyLbe2LAa6wuFjcAs3YyYn2o6BrLXcEuye/W
	 KkaHS6phJ/RnOCfP5kO+RZT3qtpbdmmOdxA9vM/dqM9R9itHzeGKtoTU73heQKoPaa
	 CI2yONqSyS5vDqFwuYTII7B4Pr5iybh39wLov6/NmPixiaCs5Yo7UvZzZqGoPUfX40
	 EuvJlgsF8rgNWIGBKyPN4jWhISw0LR0aqNWw3SEIcIRf47BHBjLMq/vTBbpe9Zdpgj
	 2j+jw0GgPucvw==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id E696340AD4;
	Tue,  1 Jul 2025 20:57:52 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 4/7] docs: kdoc: rework type prototype parsing
Date: Tue,  1 Jul 2025 14:57:27 -0600
Message-ID: <20250701205730.146687-5-corbet@lwn.net>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250701205730.146687-1-corbet@lwn.net>
References: <20250701205730.146687-1-corbet@lwn.net>
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

