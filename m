Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C3811EBA0D;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320364; cv=none; b=E8eqUEibCNMmT/fIXhaXt8crm2kzz/J7uShlVOl03FfrPpfsyfzc7T0IurpO5fFhMEwXf7lpCbhziSXqz//w9ghY+A3E2ZY1LXw2n3Yn5cciRejIRKcuzq2A5Ld4eWEI17t6V0ubKI7/5GRekxFU6+Y7c2KfvVQys0Fx7QXVKcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320364; c=relaxed/simple;
	bh=ZwhknBqlHdkBeAIFTDnGtCR/SgMMaoQkTrq3Mjl5ySI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZVam6R1OZEYwSGzo4wxkkVLc7yCcqerw55J95HFnVeWBfZNvpdP24pImFgA8uHTfhUML7ApVslzLNv61v1FfHScAStF5K5GdOPnG1A1BR6/D5XwA8MOB0WgUR+joWIBJonDAnP7olj9t/zC12Iqdux31U4d12b2qWFUK/jW6aDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bj5xMQTd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bj5xMQTd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54373C4AF09;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=ZwhknBqlHdkBeAIFTDnGtCR/SgMMaoQkTrq3Mjl5ySI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bj5xMQTd/AlShkhpDFPAAnYzd/ZXaXZ+ZXMCs95/aFVD3fr8bH59+3BHnw7hRXN6i
	 exrLrrkEmyhP0UmTTPSIfVI33CHyDzDCgCLpGoLi101Kovjo8d6fV2vynOA3EROakH
	 yZ35//HOVrlTVnvTasAs0mqw2+64JkSML9OTGHg5XywvvSweuZfFEkSh1r0PQWzO0k
	 yIKOzs4O5DwZHv00jxzKKwWy89nc+ru3qaLjZvZf7ktxy5cHoT6/Bb3od5HKrrl2cw
	 Du0OCvq80ovKUuJ2cy4E1yhA7iPFamp+s3WaRUvnTaCjZZKRVwCbXg/xM0jD5SeGv6
	 bUdc3i2J5QyvA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWh-2G2Q;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 07/15] scripts: sphinx-pre-install: drop support for old virtualenv
Date: Mon, 30 Jun 2025 23:34:55 +0200
Message-ID: <000c49af2cedd9e25b7ceacc3d69be8d73c876c6.1751318230.git.mchehab+huawei@kernel.org>
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

Up to Python 3.2, the virtual environment were created
via virtualenv binary.

As we dropped support for such old version, clean up the code.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 69 +++++++++--------------------------
 1 file changed, 18 insertions(+), 51 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index b639acd455cc..0a73b1b33842 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -80,7 +80,6 @@ class SphinxDependencyChecker:
         self.need_symlink = 0
         self.need_sphinx = 0
         self.need_pip = 0
-        self.need_virtualenv = 0
         self.rec_sphinx_upgrade = 0
         self.verbose_warn_install = 1
 
@@ -919,12 +918,14 @@ class SphinxDependencyChecker:
         else:
             print("\nSphinx needs to be installed either:\n1) via pip/pypi with:\n")
 
-        self.python_cmd = os.path.abspath(sys.argv[0])
-
-        print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
-        print(f"\t. {self.virtenv_dir}/bin/activate")
-        print(f"\tpip install -r {self.requirement_file}")
-        self.deactivate_help()
+        if not virtualenv_cmd:
+            print("   Currently not possible.\n")
+            print("   Please upgrade Python to a newer version and run this script again")
+        else:
+            print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
+            print(f"\t. {self.virtenv_dir}/bin/activate")
+            print(f"\tpip install -r {self.requirement_file}")
+            self.deactivate_help()
 
         print("\n2) As a package with:")
 
@@ -953,6 +954,7 @@ class SphinxDependencyChecker:
 
     def check_needs(self):
         self.get_system_release()
+        self.python_cmd = sys.executable
 
         # Check if Sphinx is already accessible from current environment
         self.check_sphinx()
@@ -965,56 +967,21 @@ class SphinxDependencyChecker:
             ver = ver_str(self.cur_version)
             print(f"Sphinx version: {ver}\n")
 
-        # FIXME: Check python command line, trying first python3
-        self.python_cmd = self.which("python3")
-        if not self.python_cmd:
-            self.python_cmd = self.check_program("python", 0)
-
         # Check the type of virtual env, depending on Python version
-        if self.python_cmd:
-            if self.virtualenv:
-                try:
-                    result = self.run(
-                        [self.python_cmd, "--version"],
-                        capture_output=True,
-                        text=True,
-                        check=True,
-                    )
+        virtualenv_cmd = None
 
-                    output = result.stdout + result.stderr
-
-                    match = re.search(r"(\d+)\.(\d+)\.", output)
-                    if match:
-                        major = int(match.group(1))
-                        minor = int(match.group(2))
-
-                        if major < 3:
-                            sys.exit("Python 3 is required to build the kernel docs")
-                        if major == 3 and minor < 3:
-                            self.need_virtualenv = True
-                    else:
-                        sys.exit(f"Warning: couldn't identify {self.python_cmd} version!")
-
-                except subprocess.CalledProcessError as e:
-                    sys.exit(f"Error checking Python version: {e}")
-            else:
-                self.add_package("python-sphinx", 0)
+        if sys.version_info < MIN_PYTHON_VERSION:
+            min_ver = ver_str(MIN_PYTHON_VERSION)
+            print(f"ERROR: at least python {min_ver} is required to build the kernel docs")
+            self.need_sphinx = 1
 
         self.venv_ver = self.recommend_sphinx_upgrade()
 
-        virtualenv_cmd = ""
-
         if self.need_pip:
-            # Set virtualenv command line, if python < 3.3
-            # FIXME: can be removed as we're now with an upper min requirement
-            #        but then we need to check python version
-            if self.need_virtualenv:
-                virtualenv_cmd = self.which("virtualenv-3")
-                if not virtualenv_cmd:
-                    virtualenv_cmd = self.which("virtualenv-3.5")
-                if not virtualenv_cmd:
-                    self.check_program("virtualenv", 0)
-                    virtualenv_cmd = "virtualenv"
+            if sys.version_info < MIN_PYTHON_VERSION:
+                self.need_pip = False
+                print("Warning: python version is not supported.")
+
             else:
                 virtualenv_cmd = f"{self.python_cmd} -m venv"
                 self.check_python_module("ensurepip", 0)
-- 
2.50.0

