Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4CC31CAA88;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=I+E3mZDdUOsvTGUKiUcN1aopOeOCebq2dNlF90kU+V3FQUOWYiv1aBXlaxn2imAabO9wpxe40ndvzkWCTY/2pvCL+Q6vbNJ169PuXzFhMeoOkX5iuDpSAiM5Oa+fPpPm65jYINpZN3wpR8kHRtPPzahSD4xK6k77NvbbOsiDw3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=FlLRiN2V72fQvc3QqtN/JA2r//R7FqyHjc0oxGoo5k8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sUgF29wqVOXMaXqnK3NSGaT+D1UQqFhQ7YHqLeU7Ld1NkerKnN0vNEFjXP6fC1y/keo7owAh6e3KyS8nyJGWUSTwEEmbm4Op3U0ev61RXB4mDScAUlJnVX6ddQ6UZv1TrKuwtEmW1n2gc1v+dOyaEKFw1P4A6MCqCMN65H/wglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GtPt9cUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GtPt9cUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12661C4CEF4;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=FlLRiN2V72fQvc3QqtN/JA2r//R7FqyHjc0oxGoo5k8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=GtPt9cUZeeRoYRN9XgG9wxoeSfdUzhPKM6mumAhz0FEpSb5IPDEXo7cguOAwMvEGf
	 k+cT9WPhQjoXQarwQbs/5qOsk1bD3YJwWkd2frsFZ1pLCYSsWJHWmDUhY2gY9h5qef
	 UhHgN3he0WmEajOrsNcEME/GWIbdhbz/OFuk7SZapEZ7+CDmkhlxWQevdB0JoXKBGJ
	 IYmpnqlPSDK1LfvjfI8zSKJQB4CNvTRIJ6JQefVbOAkJ+MtlsIYfpesTYK98gSz+4G
	 VaMV0niyA5Fv9J3edCQX1nVLVRYxOh1FDSNpRbv3vHcfSm9mEDo0RNeoRJM4Yqm9Fp
	 D6cCElc+Ay/wg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Ciq-0dv0;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/27] scripts/get_abi.py: add support for symbol search
Date: Mon, 10 Feb 2025 11:18:00 +0100
Message-ID: <21b2c48657dde112d5417dcd7e0aa7cd383b9a0a.1739182025.git.mchehab+huawei@kernel.org>
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

Add support for searching symbols from Documentation/ABI using
regular expressions to match the symbols' names.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/get_abi.py            | 24 ++++++++++++++++
 scripts/lib/abi/abi_parser.py | 52 +++++++++++++++++++++++++++++++++++
 2 files changed, 76 insertions(+)

diff --git a/scripts/get_abi.py b/scripts/get_abi.py
index bb17c54feeff..30439f21fdd0 100755
--- a/scripts/get_abi.py
+++ b/scripts/get_abi.py
@@ -85,6 +85,29 @@ class AbiValidate:
         parser.check_issues()
 
 
+class AbiSearch:
+    """Initialize an argparse subparser for ABI search"""
+
+    def __init__(self, subparsers):
+        """Initialize argparse subparsers"""
+
+        parser = subparsers.add_parser("search",
+                                       formatter_class=argparse.ArgumentDefaultsHelpFormatter,
+                                       description="Search ABI using a regular expression")
+
+        parser.add_argument("expression",
+                            help="Case-insensitive search pattern for the ABI symbol")
+
+        parser.set_defaults(func=self.run)
+
+    def run(self, args):
+        """Run subparser"""
+
+        parser = AbiParser(args.dir, debug=args.debug)
+        parser.parse_abi()
+        parser.search_symbols(args.expression)
+
+
 def main():
     """Main program"""
 
@@ -97,6 +120,7 @@ def main():
 
     AbiRest(subparsers)
     AbiValidate(subparsers)
+    AbiSearch(subparsers)
 
     args = parser.parse_args()
 
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index b3fa70eee412..bea7f1a76165 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -510,3 +510,55 @@ class AbiParser:
                     f.append(f"{fname} lines {", ".join(str(x) for x in lines)}")
 
             self.log.warning("%s is defined %d times: %s", what, len(f), "; ".join(f))
+
+    def search_symbols(self, expr):
+        """ Searches for ABI symbols """
+
+        regex = re.compile(expr, re.I)
+
+        found_keys = 0
+        for t in sorted(self.data.items(), key=lambda x: [0]):
+            v = t[1]
+
+            wtype = v.get("type", "")
+            if wtype == "File":
+                continue
+
+            for what in v.get("what", [""]):
+                if regex.search(what):
+                    found_keys += 1
+
+                    kernelversion = v.get("kernelversion", "").strip(" \t\n")
+                    date = v.get("date", "").strip(" \t\n")
+                    contact = v.get("contact", "").strip(" \t\n")
+                    users = v.get("users", "").strip(" \t\n")
+                    desc = v.get("description", "").strip(" \t\n")
+
+                    files = []
+                    for f in v.get("file", ()):
+                        files.append(f[0])
+
+                    what = str(found_keys) + ". " + what
+                    title_tag = "-" * len(what)
+
+                    print(f"\n{what}\n{title_tag}\n")
+
+                    if kernelversion:
+                        print(f"Kernel version:\t\t{kernelversion}")
+
+                    if date:
+                        print(f"Date:\t\t\t{date}")
+
+                    if contact:
+                        print(f"Contact:\t\t{contact}")
+
+                    if users:
+                        print(f"Users:\t\t\t{users}")
+
+                    print(f"Defined on file{'s'[:len(files) ^ 1]}:\t{", ".join(files)}")
+
+                    if desc:
+                        print(f"\n{desc.strip("\n")}\n")
+
+        if not found_keys:
+            print(f"Regular expression /{expr}/ not found.")
-- 
2.48.1

