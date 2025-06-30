Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CBB23FC41;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320364; cv=none; b=EAvc9/1vb0yzabJ4JThs2tq5c1AYf0SlyI056CbdMIFI6R1IR5HQgyrnFclgkw6cYquXJWEac6aWiAYSzNM1AAk2GNkTvLxLMO/tzRQUHHhq3Ag84TJGzH927b81kULsWR/UP77tFCe8dbfq1KKBsdOl+gdQMZzl5fs3MykBHKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320364; c=relaxed/simple;
	bh=QjBAfeS5DM8omDHphHQWuNNvVBS8lHexNOTGjOEFji8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DToYzX3brD+zAk0BRZqnBLBO05PCmxsN0ijwfuVAi6NRANTR8E66Mwv8y4DsU0r/LE6D/GhU6puBmcV3iybHujGyUxHmYf+idUm4ApS8y3u4FlItMUXYbXhiSl7lixESPML2ffgN6mIZHgOoWQBkElVtr0esSVyPOrEGftu32Lc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pq6PCBZb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pq6PCBZb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58B2CC4CEF5;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=QjBAfeS5DM8omDHphHQWuNNvVBS8lHexNOTGjOEFji8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Pq6PCBZbsdYW240cehsEjxo41vfA2bdxPjwxIV2KQxOn7ctwElPjO3twlSSmYyhPy
	 4vsG7HFfAaTXRHHnJUhaJaGGQKIgtw+2jJVivpEPToCYf+mA8B2FN+8YrvlY87hR20
	 RqOnYtgLGxPPL064S9Yt2mnKAEfY0hMiklaT2rDZbsWs3XdGH8E6yM1MUXQzIOMGCU
	 425FkfaH4MntHNW1OTnZ0nSlmICMcy03BUw06hsnN9TTm9YeBUgNEVvF+Tsnn9OdBt
	 JWC8QozYZAfHQIJytPbTH91EoZMNR2oLQiff1ccWysW+xmZ80UPA1BxVYfB0jRKJck
	 6jXFdTHGHJ7sg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWZ-22Q1;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 05/15] scripts: sphinx-pre-install: run on a supported version
Date: Mon, 30 Jun 2025 23:34:53 +0200
Message-ID: <ed7d02ed3331894b02fbaea43243edc8e777d57e.1751318230.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.50.0
In-Reply-To: <cover.1751318230.git.mchehab+huawei@kernel.org>
References: <cover.1751318230.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The scripts/sphinx-pre-install is used to detect problems at
the system environment and adjust it to build the Kernel
documentation. If the version is too old, it won't run, though.

Check if the version which started the script is valid. If not,
seek for a new one that is compatible with documentation
build.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 65 ++++++++++++++++++++++++++++++++++-
 1 file changed, 64 insertions(+), 1 deletion(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 71d86b230b22..3912359d2bae 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -5,6 +5,9 @@
 # pylint: disable=C0103,C0114,C0115,C0116,C0301
 # pylint: disable=R0902,R0904,R0912,R0915,R1705,R1710,E1121
 
+# Note: this script requires at least Python 3.6 to run.
+# Don't add changes not compatible with it, it is meant to report
+# incompatible python versions.
 
 import argparse
 import os
@@ -16,7 +19,6 @@ from glob import glob
 
 def parse_version(version):
     """Convert a major.minor.patch version into a tuple"""
-#
     return tuple(int(x) for x in version.split("."))
 
 
@@ -27,6 +29,7 @@ def ver_str(version):
 
 
 RECOMMENDED_VERSION = parse_version("3.4.3")
+MIN_PYTHON_VERSION = parse_version("3.7")
 
 
 class SphinxDependencyChecker:
@@ -132,6 +135,65 @@ class SphinxDependencyChecker:
         # Python not found at the PATH
         return python_names[-1]
 
+    @staticmethod
+    def get_python_version(cmd):
+
+        result = SphinxDependencyChecker.run([cmd, "--version"],
+                                            capture_output=True, text=True)
+        version = result.stdout.strip()
+
+        match = re.search(r"(\d+\.\d+\.\d+)", version)
+        if match:
+            return parse_version(match.group(1))
+
+        print(f"Can't parse version {version}")
+        return (0, 0, 0)
+
+    @staticmethod
+    def find_python():
+
+        patterns = [
+            "python3.[0-9]",
+            "python3.[0-9][0-9]",
+        ]
+
+        new_python_cmd = None
+
+        # Seek for a python binary newer than MIN_PYTHON_VERSION
+        for path in os.getenv("PATH", "").split(":"):
+            for pattern in patterns:
+                for cmd in glob(os.path.join(path, pattern)):
+                    if os.path.isfile(cmd) and os.access(cmd, os.X_OK):
+                        version = SphinxDependencyChecker.get_python_version(cmd)
+                        if version >= MIN_PYTHON_VERSION:
+                            return(cmd)
+
+    @staticmethod
+    def check_python():
+
+        cur_ver = sys.version_info[:3]
+        if cur_ver >= MIN_PYTHON_VERSION:
+            return
+
+        python_ver = ver_str(cur_ver)
+
+        new_python_cmd = SphinxDependencyChecker.find_python()
+        if not new_python_cmd:
+            print(f"ERROR: Python version {python_ver} is not spported anymore")
+            print(f"       Can't find a new version. This script may fail")
+            return
+
+        # Restart script using the newer version
+        script_path = os.path.abspath(sys.argv[0])
+        args = [new_python_cmd, script_path] + sys.argv[1:]
+
+        print(f"Python {python_ver} not supported. Changing to {new_python_cmd}")
+
+        try:
+            os.execv(new_python_cmd, args)
+        except OSError as e:
+            sys.exit(f"Failed to restart with {new_python_cmd}: {e}")
+
     @staticmethod
     def run(*args, **kwargs):
         """Excecute a command, hiding its output by default"""
@@ -1107,6 +1169,7 @@ def main():
 
     checker = SphinxDependencyChecker(args)
 
+    checker.check_python()
     checker.check_needs()
 
 
-- 
2.50.0

