Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36B13194A6C;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572172; cv=none; b=fZiSmGM9JBhZ7gQTSU76FBwUrnkMqtZ7h5AaL/22p6C4Coeugf2IkvTKeK7pQZN4PYnVAjytg1ctNva5+oH/zU1he0cYHZKolq9raPCHtds31i4HknGS6FNLKZkN65gdwGpbb8jjR0ex3UP30hLPOQVLnLeynm0+5rRoVwpZhLM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572172; c=relaxed/simple;
	bh=y8LZ0fXrmuwyAMvRo91pI8wsN2CZiBu2VRksVUBmRVg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=SrY02Jeetmbo17ktE+82eW6ZZZxNEfBHQY4NJv7gUgUwTh5haQ1bts6WZaNgNX2/yrBsJVEjx07l+YIU1ZtDzhya7y4xO6NX3krqOPzYm+bitUowt/tNU4JFUMhXmGl1AyRLepaTUkSzfRoG7QFXuf8cDrhovAO2S3+NTsv91yk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vw3so/bP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vw3so/bP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63FF2C113D0;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=y8LZ0fXrmuwyAMvRo91pI8wsN2CZiBu2VRksVUBmRVg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vw3so/bPwOEhGwLSFZuCspsu2IlRTVqzLtH+76kGm0jeLk64auMFqQzTXAnDeknxW
	 WbZB8oOUKHFyd1Pt9ch2D2PtbhvJuT3hfUdt4UCIHVz/G6zYIWS3fXqQ5H0sbRUzSx
	 fhSNumtA+gFfRMWmwEKx9xaadN96qFiMnY1nn8goZkWvn7DZz7WzLkhb68RY7f+R/s
	 4PWV3l5iNu1qEaMj3FG65jWGF2KWTdZTENhiUV8Rl4hWFx4nQpuCQ6AfzeSlMTfRBC
	 LKmt2l+U6H/drBj0v1oawSSjskWlTIxDp1bpvrnMU3FHdvDIC7b1r7N3nrOvN/XNFD
	 f1czd59OoyWiA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2m-2Va8;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 12/15] scripts: test_doc_build.py: regroup and rename arguments
Date: Sun, 22 Jun 2025 08:02:41 +0200
Message-ID: <acf5e1db38ca6a713c44ceca9db5cdd7d3079c92.1750571906.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The script now have lots or arguments. Better organize and
name them, for it to be a little bit more intuitive.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 95 +++++++++++++++++++++++++--------------
 1 file changed, 61 insertions(+), 34 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 5e905a350bd0..47b4606569f9 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -269,7 +269,7 @@ class SphinxVenv:
 
         ver = ".".join(map(str, cur_ver))
 
-        if not self.first_run and args.wait_input and args.make:
+        if not self.first_run and args.wait_input and args.build:
             ret = input("Press Enter to continue or 'a' to abort: ").strip().lower()
             if ret == "a":
                 print("Aborted.")
@@ -300,11 +300,11 @@ class SphinxVenv:
         result = await cmd.run([pip, "freeze"], verbose=False, check=True)
 
         # Pip install succeeded. Write requirements file
-        if args.write:
+        if args.req_file:
             with open(req_file, "w", encoding="utf-8") as fp:
                 fp.write(result.stdout)
 
-        if args.make:
+        if args.build:
             start_time = time.time()
 
             # Prepare a venv environment
@@ -317,7 +317,16 @@ class SphinxVenv:
 
             # Test doc build
             await cmd.run(["make", "cleandocs"], env=env, check=True)
-            make = ["make"] + args.make_args + ["htmldocs"]
+            make = ["make"]
+
+            if args.output:
+                sphinx_build = os.path.realpath(f"{bin_dir}/sphinx-build")
+                make += [f"O={args.output}", f"SPHINXBUILD={sphinx_build}"]
+
+            if args.make_args:
+                make += args.make_args
+
+            make += args.targets
 
             if args.verbose:
                 cmd.log(f". {bin_dir}/activate", verbose=True)
@@ -380,7 +389,7 @@ class SphinxVenv:
             await self._handle_version(args, fp, cur_ver, cur_requirements,
                                        python_bin)
 
-        if args.make:
+        if args.build:
             cmd = AsyncCommands(fp)
             cmd.log("\nSummary:", verbose=True)
             for ver, elapsed_time in sorted(self.built_time.items()):
@@ -407,7 +416,7 @@ This tool allows creating Python virtual environments for different
 Sphinx versions that are supported by the Linux Kernel build system.
 
 Besides creating the virtual environment, it can also test building
-the documentation using "make htmldocs".
+the documentation using "make htmldocs" (and/or other doc targets).
 
 If called without "--versions" argument, it covers the versions shipped
 on major distros, plus the lowest supported version:
@@ -418,8 +427,8 @@ A typical usage is to run:
 
    {SCRIPT} -m -l sphinx_builds.log
 
-This will create one virtual env for the default version set and do a
-full htmldocs build for each version, creating a log file with the
+This will create one virtual env for the default version set and run
+"make htmldocs" for each version, creating a log file with the
 excecuted commands on it.
 
 NOTE: The build time can be very long, specially on old versions. Also, there
@@ -433,6 +442,15 @@ reduce the number of threads from "-jauto" to, for instance, "-j4":
 
 """
 
+MAKE_TARGETS = [
+    "htmldocs",
+    "texinfodocs",
+    "infodocs",
+    "latexdocs",
+    "pdfdocs",
+    "epubdocs",
+    "xmldocs",
+]
 
 async def main():
     """Main program"""
@@ -440,32 +458,41 @@ async def main():
     parser = argparse.ArgumentParser(description=DESCRIPTION,
                                      formatter_class=argparse.RawDescriptionHelpFormatter)
 
-    parser.add_argument('-V', '--versions', help='Sphinx versions to test',
-                        nargs="*", default=DEFAULT_VERSIONS_TO_TEST,
-                        type=parse_version)
-    parser.add_argument('--min-version', "--min", help='Sphinx minimal version',
-                        type=parse_version)
-    parser.add_argument('--max-version', "--max", help='Sphinx maximum version',
-                        type=parse_version)
-    parser.add_argument('-a', '--make_args',
-                        help='extra arguments for make htmldocs, like SPHINXDIRS=netlink/specs',
-                        nargs="*")
-    parser.add_argument('-w', '--write', help='write a requirements.txt file',
-                        action='store_true')
-    parser.add_argument('-m', '--make',
-                        help='Make documentation',
-                        action='store_true')
-    parser.add_argument('-f', '--full',
-                        help='Add all (major,minor,latest_patch) version to the version list',
-                        action='store_true')
-    parser.add_argument('-i', '--wait-input',
-                        help='Wait for an enter before going to the next version',
-                        action='store_true')
-    parser.add_argument('-v', '--verbose',
-                        help='Verbose all commands',
-                        action='store_true')
-    parser.add_argument('-l', '--log',
-                        help='Log command output on a file')
+    ver_group = parser.add_argument_group("Version range options")
+
+    ver_group.add_argument('-V', '--versions', nargs="*",
+                           default=DEFAULT_VERSIONS_TO_TEST,type=parse_version,
+                           help='Sphinx versions to test')
+    ver_group.add_argument('--min-version', "--min", type=parse_version,
+                           help='Sphinx minimal version')
+    ver_group.add_argument('--max-version', "--max", type=parse_version,
+                           help='Sphinx maximum version')
+    ver_group.add_argument('-f', '--full', action='store_true',
+                           help='Add all Sphinx (major,minor) supported versions to the version range')
+
+    build_group = parser.add_argument_group("Build options")
+
+    build_group.add_argument('-b', '--build', action='store_true',
+                             help='Build documentation')
+    build_group.add_argument('-a', '--make-args', nargs="*",
+                             help='extra arguments for make, like SPHINXDIRS=netlink/specs',
+                        )
+    build_group.add_argument('-t', '--targets', nargs="+", choices=MAKE_TARGETS,
+                             default=[MAKE_TARGETS[0]],
+                             help="make build targets. Default: htmldocs.")
+    build_group.add_argument("-o", '--output',
+                             help="output directory for the make O=OUTPUT")
+
+    other_group = parser.add_argument_group("Other options")
+
+    other_group.add_argument('-r', '--req-file', action='store_true',
+                             help='write a requirements.txt file')
+    other_group.add_argument('-l', '--log',
+                             help='Log command output on a file')
+    other_group.add_argument('-v', '--verbose', action='store_true',
+                             help='Verbose all commands')
+    other_group.add_argument('-i', '--wait-input', action='store_true',
+                        help='Wait for an enter before going to the next version')
 
     args = parser.parse_args()
 
-- 
2.49.0

