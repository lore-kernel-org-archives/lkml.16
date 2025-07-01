Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9179725CC64;
	Tue,  1 Jul 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751403479; cv=none; b=nUWx+fVNo0R4VavnXO+8TrlGO2QKXsVYmIrnrzipKqkQt8wkbk529CEkwSR6Z9ppkEZ69nF+XwgibxuN0diy35emb6xz12qXbvuWNoO7PdlIgbZyJ0fFaNE9wL+VB1/y6dhjk9DtkkuGzIbd2Y+aLtljrxWLA73Xhgh9pNIk0EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751403479; c=relaxed/simple;
	bh=KYqOEOekJqwpYaqooxml5Dts4lbf4kZOWlZ+0aoxOvo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bBxVCJc4XEwW7DgkTJM85Zdti+fQrjnftuO05rafa46SdL1Dnf9eV2z0uIE0TPIbA1AgtW+zUjWmvUZk3rOg6thL3GqFqV+MoJFr8Onb3l9lIMw/7B9vqH86DX3+kKkzp2cEKnmSxTyrgpVaL7I4+PWxNiDh43l3/di6TvErzc0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=RW9QxO6h; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="RW9QxO6h"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net 355B940AAB
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1751403471; bh=YS5GYF1vGlayogelwbv0AA+oVCbR+0CW7ssU1JVBYRE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RW9QxO6hYz7qrib+tXEmwTIChgzRH1mAA42PqUCJ7O88iShaMZczyOM6CdtKcsM87
	 UD1Z8gBiagcfyax+soMfgILElpnt4mbFAfN3cLKeWj5dQ/x+tJeEc0DBrP/SOZbG8y
	 Bg/MoAUohIIUnfoviKRkPiSSGRUyLAFCOdR+KQkNV3rrAxFWFkC8nJ4IIhlyDyKsBR
	 FCmJZ9QwW9gdg9AAfExNW56DFY+sLykmm2uSOE4otM74avy0yECpC6gNCMa62DXYnn
	 BOO4pcoHWZW0dMI7GeJ27IQmwKcVM04DORJa7AOS9StvcnBF5Y3BczJ2C1H25rt2eT
	 5Z8DMvlnM/8AQ==
Received: from trenco.lwn.net (unknown [IPv6:2601:280:4600:2da9::1fe])
	by ms.lwn.net (Postfix) with ESMTPA id 355B940AAB;
	Tue,  1 Jul 2025 20:57:51 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: linux-doc@vger.kernel.org
Cc: linux-kernel@vger.kernel.org,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Akira Yokosawa <akiyks@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>
Subject: [PATCH 1/7] docs: kdoc: don't reinvent string.strip()
Date: Tue,  1 Jul 2025 14:57:24 -0600
Message-ID: <20250701205730.146687-2-corbet@lwn.net>
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

