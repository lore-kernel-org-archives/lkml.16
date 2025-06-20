Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5716B23372E;
	Fri, 20 Jun 2025 08:11:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750407114; cv=none; b=YumXZn6rtG/5Ky9VO9a3WlckWs/HhOre3poaf4Hrh9nEEjlTvFvqi4ukPmG+7km6DvPxuVVXK/FWURtXMMwgEHpoTqpbrlmIDPOKhFp3dGqceyxDz9n0f1hOHYIV+u7yKJC11JIrEuNPqv133J7YxzhEWIxmvbYnAXRswUbtZ+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750407114; c=relaxed/simple;
	bh=XT+7KR3Tg4iAhlUU3c6mKrOGy1MIPvbKyEPBCyZpAmw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kdodHir61/LYfcls6eRavHt7TmTa5v18xiWTq5bjYF1uWtK7AW4ZDQ99JUL0S3ySxPybYUhjSgAT3RfJNC9wmQZybaWmTgRbXQnZf6hnKE3pXRJSW70g2SzVf0/2ni6JTHDwAsWA0Y0glzVXpDQ1oku4MjGC/gkuyfJvAeKviZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RT2Bq3n5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RT2Bq3n5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2F80C4CEF5;
	Fri, 20 Jun 2025 08:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750407114;
	bh=XT+7KR3Tg4iAhlUU3c6mKrOGy1MIPvbKyEPBCyZpAmw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=RT2Bq3n5H2XOU69Jn3UhOPJSdWL88/4TC+yf8M9PnNCRpcTxIh4QQ4lYT6N/jk0rV
	 epkKT0ISnQ0DDs7TLuVezdvvwNrAfWEdAH4Gpn+pzsbP0QQksy6YIqRJq8TRouZg7M
	 s8+dXzwAKuA7x94h3DlcflUt6zFLrMlqp220t6FGnfiZIsyO9sPfEuSkPYCx9T6ru5
	 R1O61P22PlPsXNBk+d5Vwk2KRwiS5jsuPCHF7K6aj1eZC56zSVDx+QMUOl3POBkfiV
	 mVPd8aLkbwJzHweWKLURwhb4KKm0vIKjKm6TJoNaDQMP3Jxs7w8DgBSXPuEG71J9C/
	 xVuKFH5INHXVg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uSWql-00000004TWz-3gE9;
	Fri, 20 Jun 2025 10:11:51 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 4/6] scripts/test_doc_build.py: make capture assynchronous
Date: Fri, 20 Jun 2025 10:11:44 +0200
Message-ID: <55f4ce45bc0b48c5d1a2fcac2e92f6cdc3d727d6.1750406900.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750406900.git.mchehab+huawei@kernel.org>
References: <cover.1750406900.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Prepare the tool to allow writing the output into log files.
For such purpose, receive stdin/stdout messages asynchronously.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 393 +++++++++++++++++++++++++-------------
 1 file changed, 255 insertions(+), 138 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 482716fbe91d..94f2f2d8c3b7 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -2,7 +2,7 @@
 # SPDX-License-Identifier: GPL-2.0
 # Copyright(c) 2025: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
 #
-# pylint: disable=C0103,R1715
+# pylint: disable=R0903,R0913,R0914,R0917
 
 """
 Install minimal supported requirements for different Sphinx versions
@@ -10,20 +10,20 @@ and optionally test the build.
 """
 
 import argparse
+import asyncio
 import os.path
 import sys
 import time
-
-from subprocess import run
+import subprocess
 
 # Minimal python version supported by the building system
-python_bin = "python3.9"
+MINIMAL_PYTHON_VERSION = "python3.9"
 
 # Starting from 8.0.2, Python 3.9 becomes too old
-python_changes = {(8, 0, 2): "python3"}
+PYTHON_VER_CHANGES = {(8, 0, 2): "python3"}
 
 # Sphinx versions to be installed and their incremental requirements
-sphinx_requirements = {
+SPHINX_REQUIREMENTS = {
     (3, 4, 3): {
         "alabaster": "0.7.13",
         "babel": "2.17.0",
@@ -101,141 +101,258 @@ sphinx_requirements = {
 }
 
 
+class AsyncCommands:
+    """Excecute command synchronously"""
+
+    stdout = None
+    stderr = None
+    output = None
+
+    async def _read(self, stream, verbose, is_info):
+        """Ancillary routine to capture while displaying"""
+
+        while stream is not None:
+            line = await stream.readline()
+            if line:
+                out = line.decode("utf-8", errors="backslashreplace")
+                self.output += out
+                if is_info:
+                    if verbose:
+                        print(out.rstrip("\n"))
+
+                    self.stdout += out
+                else:
+                    if verbose:
+                        print(out.rstrip("\n"), file=sys.stderr)
+
+                    self.stderr += out
+            else:
+                break
+
+    async def run(self, cmd, capture_output=False, check=False,
+                  env=None, verbose=True):
+
+        """
+        Execute an arbitrary command, handling errors.
+
+        Please notice that this class is not thread safe
+        """
+
+        self.stdout = ""
+        self.stderr = ""
+        self.output = ""
+
+        if verbose:
+            print("$ ", " ".join(cmd))
+
+        proc = await asyncio.create_subprocess_exec(cmd[0],
+                                                    *cmd[1:],
+                                                    env=env,
+                                                    stdout=asyncio.subprocess.PIPE,
+                                                    stderr=asyncio.subprocess.PIPE)
+
+        # Handle input and output in realtime
+        await asyncio.gather(
+            self._read(proc.stdout, verbose, True),
+            self._read(proc.stderr, verbose, False),
+        )
+
+        await proc.wait()
+
+        if check and proc.returncode > 0:
+            raise subprocess.CalledProcessError(returncode=proc.returncode,
+                                                cmd=" ".join(cmd),
+                                                output=self.stdout,
+                                                stderr=self.stderr)
+
+        if capture_output:
+            if proc.returncode > 0:
+                print("Error {proc.returncode}", file=sys.stderr)
+                return ""
+
+            return self.output
+
+        ret = subprocess.CompletedProcess(args=cmd,
+                                          returncode=proc.returncode,
+                                          stdout=self.stdout,
+                                          stderr=self.stderr)
+
+        return ret
+
+
+class SphinxVenv:
+    """
+    Installs Sphinx on one virtual env per Sphinx version with a minimal
+    set of dependencies, adjusting them to each specific version.
+    """
+
+    def __init__(self):
+        """Initialize instance variables"""
+
+        self.built_time = {}
+        self.first_run = True
+
+    async def _handle_version(self, args, cur_ver, cur_requirements, python_bin):
+        """Handle a single Sphinx version"""
+
+        cmd = AsyncCommands()
+
+        ver = ".".join(map(str, cur_ver))
+
+        if not self.first_run and args.wait_input and args.make:
+            ret = input("Press Enter to continue or 'a' to abort: ").strip().lower()
+            if ret == "a":
+                print("Aborted.")
+                sys.exit()
+        else:
+            self.first_run = False
+
+        venv_dir = f"Sphinx_{ver}"
+        req_file = f"requirements_{ver}.txt"
+
+        print(f"\nSphinx {ver} with {python_bin}")
+
+        # Create venv
+        await cmd.run([python_bin, "-m", "venv", venv_dir], check=True)
+        pip = os.path.join(venv_dir, "bin/pip")
+
+        # Create install list
+        reqs = []
+        for pkg, verstr in cur_requirements.items():
+            reqs.append(f"{pkg}=={verstr}")
+
+        reqs.append(f"Sphinx=={ver}")
+
+        await cmd.run([pip, "install"] + reqs, check=True, verbose=True)
+
+        # Freeze environment
+        result = await cmd.run([pip, "freeze"], verbose=False, check=True)
+
+        # Pip install succeeded. Write requirements file
+        if args.write:
+            with open(req_file, "w", encoding="utf-8") as fp:
+                fp.write(result.stdout)
+
+        if args.make:
+            start_time = time.time()
+
+            # Prepare a venv environment
+            env = os.environ.copy()
+            bin_dir = os.path.join(venv_dir, "bin")
+            env["PATH"] = bin_dir + ":" + env["PATH"]
+            env["VIRTUAL_ENV"] = venv_dir
+            if "PYTHONHOME" in env:
+                del env["PYTHONHOME"]
+
+            # Test doc build
+            await cmd.run(["make", "cleandocs"], env=env, check=True)
+            make = ["make"] + args.make_args + ["htmldocs"]
+
+            print(f". {bin_dir}/activate")
+            print(" ".join(make))
+            print("deactivate")
+            await cmd.run(make, env=env, check=True)
+
+            end_time = time.time()
+            elapsed_time = end_time - start_time
+            hours, minutes = divmod(elapsed_time, 3600)
+            minutes, seconds = divmod(minutes, 60)
+
+            hours = int(hours)
+            minutes = int(minutes)
+            seconds = int(seconds)
+
+            self.built_time[ver] = f"{hours:02d}:{minutes:02d}:{seconds:02d}"
+
+            print(f"Finished doc build for Sphinx {ver}. Elapsed time: {self.built_time[ver]}")
+
+    async def run(self, args):
+        """
+        Navigate though multiple Sphinx versions, handling each of them
+        on a loop.
+        """
+
+        cur_requirements = {}
+        python_bin = MINIMAL_PYTHON_VERSION
+
+        for cur_ver, new_reqs in SPHINX_REQUIREMENTS.items():
+            cur_requirements.update(new_reqs)
+
+            if cur_ver in PYTHON_VER_CHANGES:          # pylint: disable=R1715
+
+                python_bin = PYTHON_VER_CHANGES[cur_ver]
+
+            if args.min_version:
+                if cur_ver < args.min_version:
+                    continue
+
+            if args.max_version:
+                if cur_ver > args.max_version:
+                    break
+
+            await self._handle_version(args, cur_ver, cur_requirements,
+                                       python_bin)
+
+        if args.make:
+            print()
+            print("Summary:")
+            for ver, elapsed_time in sorted(self.built_time.items()):
+                print(f"\tSphinx {ver} elapsed time: {elapsed_time}")
+
+
 def parse_version(ver_str):
     """Convert a version string into a tuple."""
 
     return tuple(map(int, ver_str.split(".")))
 
 
-parser = argparse.ArgumentParser(description="Build docs for different sphinx_versions.")
-
-parser.add_argument('-v', '--version', help='Sphinx single version',
-                    type=parse_version)
-parser.add_argument('--min-version', "--min", help='Sphinx minimal version',
-                    type=parse_version)
-parser.add_argument('--max-version', "--max", help='Sphinx maximum version',
-                    type=parse_version)
-parser.add_argument('-a', '--make_args',
-                    help='extra arguments for make htmldocs, like SPHINXDIRS=netlink/specs',
-                    nargs="*")
-parser.add_argument('-w', '--write', help='write a requirements.txt file',
-                    action='store_true')
-parser.add_argument('-m', '--make',
-                    help='Make documentation',
-                    action='store_true')
-parser.add_argument('-i', '--wait-input',
-                    help='Wait for an enter before going to the next version',
-                    action='store_true')
-
-args = parser.parse_args()
-
-if not args.make_args:
-    args.make_args = []
-
-if args.version:
-    if args.min_version or args.max_version:
-        sys.exit("Use either --version or --min-version/--max-version")
-    else:
-        args.min_version = args.version
-        args.max_version = args.version
-
-sphinx_versions = sorted(list(sphinx_requirements.keys()))
-
-if not args.min_version:
-    args.min_version = sphinx_versions[0]
-
-if not args.max_version:
-    args.max_version = sphinx_versions[-1]
-
-first_run = True
-cur_requirements = {}
-built_time = {}
-
-for cur_ver, new_reqs in sphinx_requirements.items():
-    cur_requirements.update(new_reqs)
-
-    if cur_ver in python_changes:
-        python_bin = python_changes[cur_ver]
-
-    ver = ".".join(map(str, cur_ver))
-
-    if args.min_version:
-        if cur_ver < args.min_version:
-            continue
-
-    if args.max_version:
-        if cur_ver > args.max_version:
-            break
-
-    if not first_run and args.wait_input and args.make:
-        ret = input("Press Enter to continue or 'a' to abort: ").strip().lower()
-        if ret == "a":
-            print("Aborted.")
-            sys.exit()
-    else:
-        first_run = False
-
-    venv_dir = f"Sphinx_{ver}"
-    req_file = f"requirements_{ver}.txt"
-
-    print(f"\nSphinx {ver} with {python_bin}")
-
-    # Create venv
-    run([python_bin, "-m", "venv", venv_dir], check=True)
-    pip = os.path.join(venv_dir, "bin/pip")
-
-    # Create install list
-    reqs = []
-    for pkg, verstr in cur_requirements.items():
-        reqs.append(f"{pkg}=={verstr}")
-
-    reqs.append(f"Sphinx=={ver}")
-
-    run([pip, "install"] + reqs, check=True)
-
-    # Freeze environment
-    result = run([pip, "freeze"], capture_output=True, text=True, check=True)
-
-    # Pip install succeeded. Write requirements file
-    if args.write:
-        with open(req_file, "w", encoding="utf-8") as fp:
-            fp.write(result.stdout)
-
-    if args.make:
-        start_time = time.time()
-
-        # Prepare a venv environment
-        env = os.environ.copy()
-        bin_dir = os.path.join(venv_dir, "bin")
-        env["PATH"] = bin_dir + ":" + env["PATH"]
-        env["VIRTUAL_ENV"] = venv_dir
-        if "PYTHONHOME" in env:
-            del env["PYTHONHOME"]
-
-        # Test doc build
-        run(["make", "cleandocs"], env=env, check=True)
-        make = ["make"] + args.make_args + ["htmldocs"]
-
-        print(f". {bin_dir}/activate")
-        print(" ".join(make))
-        print("deactivate")
-        run(make, env=env, check=True)
-
-        end_time = time.time()
-        elapsed_time = end_time - start_time
-        hours, minutes = divmod(elapsed_time, 3600)
-        minutes, seconds = divmod(minutes, 60)
-
-        hours = int(hours)
-        minutes = int(minutes)
-        seconds = int(seconds)
-
-        built_time[ver] = f"{hours:02d}:{minutes:02d}:{seconds:02d}"
-
-        print(f"Finished doc build for Sphinx {ver}. Elapsed time: {built_time[ver]}")
-
-if args.make:
-    print()
-    print("Summary:")
-    for ver, elapsed_time in sorted(built_time.items()):
-        print(f"\tSphinx {ver} elapsed time: {elapsed_time}")
+async def main():
+    """Main program"""
+
+    parser = argparse.ArgumentParser(description="Build docs for different sphinx_versions.")
+
+    parser.add_argument('-v', '--version', help='Sphinx single version',
+                        type=parse_version)
+    parser.add_argument('--min-version', "--min", help='Sphinx minimal version',
+                        type=parse_version)
+    parser.add_argument('--max-version', "--max", help='Sphinx maximum version',
+                        type=parse_version)
+    parser.add_argument('-a', '--make_args',
+                        help='extra arguments for make htmldocs, like SPHINXDIRS=netlink/specs',
+                        nargs="*")
+    parser.add_argument('-w', '--write', help='write a requirements.txt file',
+                        action='store_true')
+    parser.add_argument('-m', '--make',
+                        help='Make documentation',
+                        action='store_true')
+    parser.add_argument('-i', '--wait-input',
+                        help='Wait for an enter before going to the next version',
+                        action='store_true')
+
+    args = parser.parse_args()
+
+    if not args.make_args:
+        args.make_args = []
+
+    if args.version:
+        if args.min_version or args.max_version:
+            sys.exit("Use either --version or --min-version/--max-version")
+        else:
+            args.min_version = args.version
+            args.max_version = args.version
+
+    sphinx_versions = sorted(list(SPHINX_REQUIREMENTS.keys()))
+
+    if not args.min_version:
+        args.min_version = sphinx_versions[0]
+
+    if not args.max_version:
+        args.max_version = sphinx_versions[-1]
+
+    venv = SphinxVenv()
+    await venv.run(args)
+
+
+# Call main method
+if __name__ == "__main__":
+    asyncio.run(main())
-- 
2.49.0

