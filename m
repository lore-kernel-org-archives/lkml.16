Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A28A270ED2;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=KtxxNkopIeafqAhn7LWJciCSo/NB0vh571n0aryucfx19xRBKxuKOvgfeCwiU8PUEWtBbOb755goq6pVMrCZD+ju4/Uh0ThlLgKZzeQmv1miAesMRLOBCSwehxFA5r9g+9uvIB/bg0pnn0Sd2pYOMpzHi4AQfnVtqDTGgSJAwk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=N4TflgJ9aQP1rQhRd2JGn9NUFXUJr9Aceg88ArqyFIs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZLMD9rv6J6ZRpgWvniyi6Czl3JVIyKDco0LtrA36AidwEC9gEEdR1C087aBdIhDJiAgxIAvzeEOWZ6ZfzL5+pFxzhMPGvpp/TzZyWeUtPk6w6ZTlqBWthFyz3TwieyeCGWKIrFr3iGCSiRG3BrP82ZjxuShMEh4Tzxy4aCM6P7Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hf32jNQn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hf32jNQn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AED42C4AF0D;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=N4TflgJ9aQP1rQhRd2JGn9NUFXUJr9Aceg88ArqyFIs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Hf32jNQnnu9Ig+sgCpJZrxK7LFRT7UMYP+i08dGNU5Korgv5vHpOjnGiVmPwBcfMX
	 pHRQw1/UWKx+9GZgLctkadTA355jCjEYDw30+LJcpY1ZNp2YA3q46g66xcHGKPyu9x
	 ii/52eR2v1r3/wKenP74uAk41EnasXcUqv92n0rKBcL59gpVwJCwdpXSxqqimgNSvN
	 rFM8c4BAKSj8f1cLqRmyCsjEGHsP+/SImUWp1CVV2fzV0JGiI0JScJvlH6LmV+xiJ7
	 Dkl8c3aFDnnqpcDfNoKM6O6puT36gnGotVSLXYP6XvqY9mqp40ZXi1Sl6Ioi1PLJ6J
	 5rdxtBJtIsuEg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e48-3GbA;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 09/15] scripts: test_doc_build.py: make the script smarter
Date: Sat, 21 Jun 2025 21:55:48 +0200
Message-ID: <e56a2e5221ada90668350671b69e1a1ad5b6eb05.1750535171.git.mchehab+huawei@kernel.org>
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

Most of the time, testing the full range of supported Sphinx
version is a waste of time and resources. Instead, the best is
to focus at the versions that are actually shipped by major
distros.

For it to work properly, we need to adjust the requirements for
them to start from first patch for each distro after the
minimal supported one. The requirements were re-adjusted to
avoid build breakages related to version incompatibilities.
Such builds were tested with:

	./scripts/test_doc_build.py -m -a "SPHINXOPTS=-j8" "SPHINXDIRS=networking netlink/specs" --full

Change the logic to pick by default only such versions, adding
another parameter to do a comprehensive test.

While here, improve the script documentation to make it easier
to be used.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 156 ++++++++++++++++++++++++++------------
 1 file changed, 106 insertions(+), 50 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 7ea6add48f9a..5e905a350bd0 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -33,7 +33,19 @@ if not min_python_bin:
     min_python_bin = PYTHON
 
 # Starting from 8.0, Python 3.9 is not supported anymore.
-PYTHON_VER_CHANGES = {(8, 0, 2): PYTHON}
+PYTHON_VER_CHANGES = {(8, 0, 0): PYTHON}
+
+DEFAULT_VERSIONS_TO_TEST = [
+    (3, 4, 3),   # Minimal supported version
+    (5, 3, 0),   # CentOS Stream 9 / AlmaLinux 9
+    (6, 1, 1),   # Debian 12
+    (7, 2, 1),   # openSUSE Leap 15.6
+    (7, 2, 6),   # Ubuntu 24.04 LTS
+    (7, 4, 7),   # Ubuntu 24.10
+    (7, 3, 0),   # openSUSE Tumbleweed
+    (8, 1, 3),   # Fedora 42
+    (8, 2, 3)    # Latest version - covers rolling distros
+]
 
 # Sphinx versions to be installed and their incremental requirements
 SPHINX_REQUIREMENTS = {
@@ -64,82 +76,87 @@ SPHINX_REQUIREMENTS = {
 
     # Update package dependencies to a more modern base. The goal here
     # is to avoid to many incremental changes for the next entries
-    (3, 5, 4): {
+    (3, 5, 0): {
         "alabaster": "0.7.13",
         "babel": "2.17.0",
         "certifi": "2025.6.15",
         "idna": "3.10",
         "imagesize": "1.4.1",
-        "Jinja2": "3.0.3",
-        "MarkupSafe": "2.0",
         "packaging": "25.0",
-        "Pygments": "2.19.1",
+        "Pygments": "2.8.1",
         "requests": "2.32.4",
         "snowballstemmer": "3.0.1",
         "sphinxcontrib-applehelp": "1.0.4",
         "sphinxcontrib-htmlhelp": "2.0.1",
         "sphinxcontrib-serializinghtml": "1.1.5",
+        "urllib3": "2.0.0",
     },
 
     # Starting from here, ensure all docutils versions are covered with
     # supported Sphinx versions. Other packages are upgraded only when
     # required by pip
-    (4, 0, 3): {
+    (4, 0, 0): {
+        "PyYAML": "5.1",
+    },
+    (4, 1, 0): {
         "docutils": "0.17",
-        "PyYAML": "5.1",
-    },
-    (4, 1, 2): {
-    },
-    (4, 3, 2): {
+        "Pygments": "2.19.1",
+        "Jinja2": "3.0.3",
+        "MarkupSafe": "2.0",
     },
+    (4, 3, 0): {},
     (4, 4, 0): {},
-    (4, 5, 0): {},
-    (5, 0, 2): {},
-    (5, 1, 1): {},
-    (5, 2, 3): {
+    (4, 5, 0): {
         "docutils": "0.17.1",
+    },
+    (5, 0, 0): {},
+    (5, 1, 0): {},
+    (5, 2, 0): {
+        "docutils": "0.18",
         "Jinja2": "3.1.2",
         "MarkupSafe": "2.0",
         "PyYAML": "5.3.1",
     },
-    (5, 3, 0): {},
-    (6, 0, 1): {
-        "docutils": "0.18",
-    },
-    (6, 1, 3): {},
-    (6, 2, 1): {
+    (5, 3, 0): {
         "docutils": "0.18.1",
+    },
+    (6, 0, 0): {},
+    (6, 1, 0): {},
+    (6, 2, 0): {
         "PyYAML": "5.4.1",
     },
-    (7, 0, 1): {
-    },
-    (7, 1, 2): {},
-    (7, 2, 3): {
+    (7, 0, 0): {},
+    (7, 1, 0): {},
+    (7, 2, 0): {
         "docutils": "0.19",
         "PyYAML": "6.0.1",
         "sphinxcontrib-serializinghtml": "1.1.9",
     },
-    (7, 3, 7): {
+    (7, 2, 6): {
         "docutils": "0.20",
+    },
+    (7, 3, 0): {
         "alabaster": "0.7.14",
         "PyYAML": "6.0.1",
+        "tomli": "2.0.1",
     },
-    (7, 4, 7): {
+    (7, 4, 0): {
+        "docutils": "0.20.1",
+        "PyYAML": "6.0.1",
+    },
+    (8, 0, 0): {
         "docutils": "0.21",
-        "PyYAML": "6.0.1",
     },
-    (8, 0, 2): {
+    (8, 1, 0): {
         "docutils": "0.21.1",
-    },
-    (8, 1, 3): {
-        "docutils": "0.21.2",
         "PyYAML": "6.0.1",
         "sphinxcontrib-applehelp": "1.0.7",
         "sphinxcontrib-devhelp": "1.0.6",
         "sphinxcontrib-htmlhelp": "2.0.6",
         "sphinxcontrib-qthelp": "1.0.6",
     },
-    (8, 2, 3): {
+    (8, 2, 0): {
+        "docutils": "0.21.2",
         "PyYAML": "6.0.1",
         "sphinxcontrib-serializinghtml": "1.1.9",
     },
@@ -339,13 +356,19 @@ class SphinxVenv:
         cur_requirements = {}
         python_bin = min_python_bin
 
-        for cur_ver, new_reqs in SPHINX_REQUIREMENTS.items():
-            cur_requirements.update(new_reqs)
+        vers = set(SPHINX_REQUIREMENTS.keys()) | set(args.versions)
+
+        for cur_ver in sorted(vers):
+            if cur_ver in SPHINX_REQUIREMENTS:
+                new_reqs = SPHINX_REQUIREMENTS[cur_ver]
+                cur_requirements.update(new_reqs)
 
             if cur_ver in PYTHON_VER_CHANGES:          # pylint: disable=R1715
-
                 python_bin = PYTHON_VER_CHANGES[cur_ver]
 
+            if cur_ver not in args.versions:
+                continue
+
             if args.min_version:
                 if cur_ver < args.min_version:
                     continue
@@ -373,12 +396,52 @@ def parse_version(ver_str):
     return tuple(map(int, ver_str.split(".")))
 
 
+DEFAULT_VERS = "    - "
+DEFAULT_VERS += "\n    - ".join(map(lambda v: f"{v[0]}.{v[1]}.{v[2]}",
+                                    DEFAULT_VERSIONS_TO_TEST))
+
+SCRIPT = os.path.relpath(__file__)
+
+DESCRIPTION = f"""
+This tool allows creating Python virtual environments for different
+Sphinx versions that are supported by the Linux Kernel build system.
+
+Besides creating the virtual environment, it can also test building
+the documentation using "make htmldocs".
+
+If called without "--versions" argument, it covers the versions shipped
+on major distros, plus the lowest supported version:
+
+{DEFAULT_VERS}
+
+A typical usage is to run:
+
+   {SCRIPT} -m -l sphinx_builds.log
+
+This will create one virtual env for the default version set and do a
+full htmldocs build for each version, creating a log file with the
+excecuted commands on it.
+
+NOTE: The build time can be very long, specially on old versions. Also, there
+is a known bug with Sphinx version 6.0.x: each subprocess uses a lot of
+memory. That, together with "-jauto" may cause OOM killer to cause
+failures at the doc generation. To minimize the risk, you may use the
+"-a" command line parameter to constrain the built directories and/or
+reduce the number of threads from "-jauto" to, for instance, "-j4":
+
+    {SCRIPT} -m -V 6.0.1 -a "SPHINXDIRS=process" "SPHINXOPTS='-j4'"
+
+"""
+
+
 async def main():
     """Main program"""
 
-    parser = argparse.ArgumentParser(description="Build docs for different sphinx_versions.")
+    parser = argparse.ArgumentParser(description=DESCRIPTION,
+                                     formatter_class=argparse.RawDescriptionHelpFormatter)
 
-    parser.add_argument('-V', '--version', help='Sphinx single version',
+    parser.add_argument('-V', '--versions', help='Sphinx versions to test',
+                        nargs="*", default=DEFAULT_VERSIONS_TO_TEST,
                         type=parse_version)
     parser.add_argument('--min-version', "--min", help='Sphinx minimal version',
                         type=parse_version)
@@ -392,6 +455,9 @@ async def main():
     parser.add_argument('-m', '--make',
                         help='Make documentation',
                         action='store_true')
+    parser.add_argument('-f', '--full',
+                        help='Add all (major,minor,latest_patch) version to the version list',
+                        action='store_true')
     parser.add_argument('-i', '--wait-input',
                         help='Wait for an enter before going to the next version',
                         action='store_true')
@@ -406,20 +472,10 @@ async def main():
     if not args.make_args:
         args.make_args = []
 
-    if args.version:
-        if args.min_version or args.max_version:
-            sys.exit("Use either --version or --min-version/--max-version")
-        else:
-            args.min_version = args.version
-            args.max_version = args.version
-
     sphinx_versions = sorted(list(SPHINX_REQUIREMENTS.keys()))
 
-    if not args.min_version:
-        args.min_version = sphinx_versions[0]
-
-    if not args.max_version:
-        args.max_version = sphinx_versions[-1]
+    if args.full:
+        args.versions += list(SPHINX_REQUIREMENTS.keys())
 
     venv = SphinxVenv()
     await venv.run(args)
-- 
2.49.0

