Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9E9D2206BB;
	Thu,  3 Jul 2025 18:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751568257; cv=none; b=YjVqOxg6akNVCkDb+eplt9MuOb4aHbWLCdyFW+WIJJ89IKD7C+/DmCBtBPOZVAzCe6s9s0Ma6bqaCwhS8ueadmD3tv6UJf0BRiF6QCCS1AXbkbGy6nHROVA52OWTwpNdKT76A3qFFZucMOPXPZOWHrkjHeYCsnZ1dNNGT91nNCA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751568257; c=relaxed/simple;
	bh=VpaXimC5GQUFOAKQq0XZlnZZj56JFjPMmcx706/uE2g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FeGjTf9f+oVHAolf2JL57+KWNbLvtNtofOhopjJpnPdeWLqjNAYrKuAw8TM0nVTe/XFHvpEBeuCp9VAcDU7ruWW783ROzxjed44G/a9czrYH580PZFGIdJWRqd0Ea8iOHW86vtYWG5XM+6QlZy5dTfG0zqkLjt+iGhybRYLxbF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=g0pMZ4K1; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="g0pMZ4K1"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 09FB340AC9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751568255; bh=tduV3AIErAq0XBbPXSaA0O0GHSM31AJpVFRmJW3UCGw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=g0pMZ4K1Z/8OD6yxbdDFK6kOpgi66vNnyWwZnkqojJbNJyufPCXqj/V+qNSOpZ09W
	 7uWQ20zEUdShU+xclkth9x5DOuln2MdMuc6HFkI8I52cR3Fr6gp0d/NVGJJsDnwZAY
	 jvKxDp2F/oot+YznJ3Q4kEQT6TElhbJkU1mGbvsHe3OHONWEkKOE237PtN6OBUByUX
	 vD5hUiLeafFa2V/pAu6asUwqxn95Si02oFkHR3Wtlrq0rMz7rLw42jNeY+eLmQYk0d
	 OW0r4N7fmfwpeY3KDjnLo8+4uaiCPKJJvBVXvOXlMOTYSGJ8hxrnzXKofsUuMn/PHd
	 Hem2pIwjWk3hQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 09FB340AC9;
	Thu,  3 Jul 2025 18:44:14 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH v2 1/7] docs: kdoc: don't reinvent string.strip()
Date: Thu,  3 Jul 2025 12:43:57 -0600
Message-ID: <20250703184403.274408-2-corbet@lwn.net>
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

process_proto_type() and process_proto_function() reinventing the strip()
string method with a whole series of separate regexes; take all that out
and just use strip().

The previous implementation also (in process_proto_type()) removed C++
comments *after* the above dance, leaving trailing whitespace in that case;
now we do the stripping afterward.  This results in exactly one output
change: the removal of a spurious space in the definition of
BACKLIGHT_POWER_REDUCED - see
https://docs.kernel.org/gpu/backlight.html#c.backlight_properties.

I note that we are putting semicolons after #define lines that really
shouldn't be there - a task for another day.

Reviewed-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Signed-off-by: Jonathan Corbet <corbet@lwn.net>
---
 scripts/lib/kdoc/kdoc_parser.py | 27 +++++----------------------
 1 file changed, 5 insertions(+), 22 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_parser.py b/scripts/lib/kdoc/kdoc_parser.py
index 93938155fce2..d9ff2d066160 100644
--- a/scripts/lib/kdoc/kdoc_parser.py
+++ b/scripts/lib/kdoc/kdoc_parser.py
@@ -1567,17 +1567,9 @@ class KernelDoc:
                 self.entry.prototype += r.group(1) + " "
 
         if '{' in line or ';' in line or KernRe(r'\s*#\s*define').match(line):
-            # strip comments
-            r = KernRe(r'/\*.*?\*/')
-            self.entry.prototype = r.sub('', self.entry.prototype)
-
-            # strip newlines/cr's
-            r = KernRe(r'[\r\n]+')
-            self.entry.prototype = r.sub(' ', self.entry.prototype)
-
-            # strip leading spaces
-            r = KernRe(r'^\s+')
-            self.entry.prototype = r.sub('', self.entry.prototype)
+            # strip comments and surrounding spaces
+            r = KernRe(r'/\*.*\*/')
+            self.entry.prototype = r.sub('', self.entry.prototype).strip()
 
             # Handle self.entry.prototypes for function pointers like:
             #       int (*pcs_config)(struct foo)
@@ -1600,17 +1592,8 @@ class KernelDoc:
     def process_proto_type(self, ln, line):
         """Ancillary routine to process a type"""
 
-        # Strip newlines/cr's.
-        line = KernRe(r'[\r\n]+', re.S).sub(' ', line)
-
-        # Strip leading spaces
-        line = KernRe(r'^\s+', re.S).sub('', line)
-
-        # Strip trailing spaces
-        line = KernRe(r'\s+$', re.S).sub('', line)
-
-        # Strip C99-style comments to the end of the line
-        line = KernRe(r"\/\/.*$", re.S).sub('', line)
+        # Strip C99-style comments and surrounding whitespace
+        line = KernRe(r"//.*$", re.S).sub('', line).strip()
 
         # To distinguish preprocessor directive from regular declaration later.
         if line.startswith('#'):
-- 
2.49.0

