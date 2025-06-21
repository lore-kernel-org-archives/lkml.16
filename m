Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4730C270ECD;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=YxY5BfOO+Lo2PSMJUSb6PXhReANt/R+LBuuvAJk5Yn9xAydugzTOc5R56/qDq0EWm9TwJT8xIfdjj5tbGngjMyQljPjhQRI1JkWDq7DY/5I10bfDXrsGTt7KjKim8pYorEOqeZ+ZjJi+sBMHwQztkC3p+EQlvqth1lLOXAr55o0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=t6WKKzUZ3jaz/IWeMR8qJbIf2p6B9ADIoUTLRFgr0u0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HLQLnbxAGdZXgLiZ10Hr790Bx6Q6RXEhYVRUKtZlNggJnlChLmltfYyKOx2cmzKdpCHYr1OM/v8U0ueKrcpwCPF+TsJQaxVhw15rphJBzUd3S4HnTu8Nk+U+fOX+kzE9UD6WIRQMaQFEy+iRe6RnyjUQgMmARBy53rZlixltVcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uspxPMDR; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uspxPMDR"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 948EAC4CEEF;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=t6WKKzUZ3jaz/IWeMR8qJbIf2p6B9ADIoUTLRFgr0u0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=uspxPMDRVQRqzfmTQepswnWdLpN+bdqPPl6RX8VRyni0Sw2UtYkHsnh9/J3j5qn1p
	 NjKqjXu6eJrTLqZn+JvS1XF0ysSYugIS9Qq4nDdS2u9TAps6RBi+Fgp27rnlm4IIUG
	 xCVyHfq+8S7hN1eMZARI9ugMrgL6cLyWcfVFVdEdVABVh7O7+lv4mRRwLsivSHWR1J
	 Wr5okAQBQ7Bznvk1n+07CL32KuwA2ecM9wiz5yb1teLD2jqOlUwfIgKiNARCsBCmby
	 xA+eaoqOdTezVqJCFAuvhDCKox6Qf9AksQ01S9ZzuCu8fNk6NkK+JlTW3+aze3Ppj6
	 nMe61Sy4Ely6g==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e3s-2pYe;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 05/15] scripts: test_doc_build.py: better control its output
Date: Sat, 21 Jun 2025 21:55:44 +0200
Message-ID: <7adea4976165fa2c80e00e02fa2fa3124d27351c.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Now that asyncio is supported, allow userspace to adjust
verbosity level and direct the script output to a file.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 78 +++++++++++++++++++++++++--------------
 1 file changed, 51 insertions(+), 27 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 94f2f2d8c3b7..5b9eb2c0bf01 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 #
-# pylint: disable=R0903,R0913,R0914,R0917
+# pylint: disable=R0903,R0912,R0913,R0914,R0917,C0301
 
 """
 Install minimal supported requirements for different Sphinx versions
@@ -104,9 +104,22 @@ SPHINX_REQUIREMENTS = {
 class AsyncCommands:
     """Excecute command synchronously"""
 
-    stdout = None
-    stderr = None
-    output = None
+    def __init__(self, fp=None):
+
+        self.stdout = None
+        self.stderr = None
+        self.output = None
+        self.fp = fp
+
+    def log(self, out, verbose, is_info=True):
+        if verbose:
+            if is_info:
+                print(out.rstrip("\n"))
+            else:
+                print(out.rstrip("\n"), file=sys.stderr)
+
+        if self.fp:
+            self.fp.write(out.rstrip("\n") + "\n")
 
     async def _read(self, stream, verbose, is_info):
         """Ancillary routine to capture while displaying"""
@@ -115,16 +128,10 @@ class AsyncCommands:
             line = await stream.readline()
             if line:
                 out = line.decode("utf-8", errors="backslashreplace")
-                self.output += out
+                self.log(out, verbose, is_info)
                 if is_info:
-                    if verbose:
-                        print(out.rstrip("\n"))
-
                     self.stdout += out
                 else:
-                    if verbose:
-                        print(out.rstrip("\n"), file=sys.stderr)
-
                     self.stderr += out
             else:
                 break
@@ -140,10 +147,8 @@ class AsyncCommands:
 
         self.stdout = ""
         self.stderr = ""
-        self.output = ""
 
-        if verbose:
-            print("$ ", " ".join(cmd))
+        self.log("$ " + " ".join(cmd), verbose)
 
         proc = await asyncio.create_subprocess_exec(cmd[0],
                                                     *cmd[1:],
@@ -167,7 +172,7 @@ class AsyncCommands:
 
         if capture_output:
             if proc.returncode > 0:
-                print("Error {proc.returncode}", file=sys.stderr)
+                self.log(f"Error {proc.returncode}", verbose=True, is_info=False)
                 return ""
 
             return self.output
@@ -192,10 +197,11 @@ class SphinxVenv:
         self.built_time = {}
         self.first_run = True
 
-    async def _handle_version(self, args, cur_ver, cur_requirements, python_bin):
+    async def _handle_version(self, args, fp,
+                              cur_ver, cur_requirements, python_bin):
         """Handle a single Sphinx version"""
 
-        cmd = AsyncCommands()
+        cmd = AsyncCommands(fp)
 
         ver = ".".join(map(str, cur_ver))
 
@@ -210,10 +216,11 @@ class SphinxVenv:
         venv_dir = f"Sphinx_{ver}"
         req_file = f"requirements_{ver}.txt"
 
-        print(f"\nSphinx {ver} with {python_bin}")
+        cmd.log(f"\nSphinx {ver} with {python_bin}", verbose=True)
 
         # Create venv
-        await cmd.run([python_bin, "-m", "venv", venv_dir], check=True)
+        await cmd.run([python_bin, "-m", "venv", venv_dir],
+                      verbose=args.verbose, check=True)
         pip = os.path.join(venv_dir, "bin/pip")
 
         # Create install list
@@ -223,7 +230,7 @@ class SphinxVenv:
 
         reqs.append(f"Sphinx=={ver}")
 
-        await cmd.run([pip, "install"] + reqs, check=True, verbose=True)
+        await cmd.run([pip, "install"] + reqs, check=True, verbose=args.verbose)
 
         # Freeze environment
         result = await cmd.run([pip, "freeze"], verbose=False, check=True)
@@ -248,10 +255,11 @@ class SphinxVenv:
             await cmd.run(["make", "cleandocs"], env=env, check=True)
             make = ["make"] + args.make_args + ["htmldocs"]
 
-            print(f". {bin_dir}/activate")
-            print(" ".join(make))
-            print("deactivate")
-            await cmd.run(make, env=env, check=True)
+            if args.verbose:
+                print(f". {bin_dir}/activate")
+            await cmd.run(make, env=env, check=True, verbose=True)
+            if args.verbose:
+                print("deactivate")
 
             end_time = time.time()
             elapsed_time = end_time - start_time
@@ -264,7 +272,7 @@ class SphinxVenv:
 
             self.built_time[ver] = f"{hours:02d}:{minutes:02d}:{seconds:02d}"
 
-            print(f"Finished doc build for Sphinx {ver}. Elapsed time: {self.built_time[ver]}")
+            cmd.log(f"Finished doc build for Sphinx {ver}. Elapsed time: {self.built_time[ver]}", verbose=True)
 
     async def run(self, args):
         """
@@ -272,6 +280,15 @@ class SphinxVenv:
         on a loop.
         """
 
+        if args.log:
+            fp = open(args.log, "w", encoding="utf-8")
+            if not args.verbose:
+                args.verbose = False
+        else:
+            fp = None
+            if not args.verbose:
+                args.verbose = True
+
         cur_requirements = {}
         python_bin = MINIMAL_PYTHON_VERSION
 
@@ -290,7 +307,7 @@ class SphinxVenv:
                 if cur_ver > args.max_version:
                     break
 
-            await self._handle_version(args, cur_ver, cur_requirements,
+            await self._handle_version(args, fp, cur_ver, cur_requirements,
                                        python_bin)
 
         if args.make:
@@ -299,6 +316,8 @@ class SphinxVenv:
             for ver, elapsed_time in sorted(self.built_time.items()):
                 print(f"\tSphinx {ver} elapsed time: {elapsed_time}")
 
+        if fp:
+            fp.close()
 
 def parse_version(ver_str):
     """Convert a version string into a tuple."""
@@ -311,7 +330,7 @@ async def main():
 
     parser = argparse.ArgumentParser(description="Build docs for different sphinx_versions.")
 
-    parser.add_argument('-v', '--version', help='Sphinx single version',
+    parser.add_argument('-V', '--version', help='Sphinx single version',
                         type=parse_version)
     parser.add_argument('--min-version', "--min", help='Sphinx minimal version',
                         type=parse_version)
@@ -328,6 +347,11 @@ async def main():
     parser.add_argument('-i', '--wait-input',
                         help='Wait for an enter before going to the next version',
                         action='store_true')
+    parser.add_argument('-v', '--verbose',
+                        help='Verbose all commands',
+                        action='store_true')
+    parser.add_argument('-l', '--log',
+                        help='Log command output on a file')
 
     args = parser.parse_args()
 
-- 
2.49.0

