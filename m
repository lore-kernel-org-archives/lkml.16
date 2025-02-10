Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4D4B1CAA89;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=baJrTDTBnAL+HAD1ZlGYVJE0apy3PQAImf6+tKWw1DceKxPf1qtGIPtip0vhSYpXsMzZJby1gzY5dDQLujO3w7uqQn8Sx5eRJyw4cwNz5bNZdODMeb/uKXTuP24O786V560ON432VhRDhqPluUiATXZnVdP84F0UIruXl4Yo1mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=fVsQktr66AfeetC6nV7WwKf2PIcVVQSSKpg1lW8+WR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Afpe5d/+Vxyrn2BKkfpgxjiu6JaYQy21M8b628NYoqqTITVyXqigT2nNfoJLW/980pF5gHcZi1PfiVL5jl9AqaEzG2xfellYf7/baOcZdlUT5LlzORtJAPsi8tVLBzzTy8/E8CqGTF6q4SRx5SbzmX18M1TUQBTJjgrob9A4lmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSpR8XzD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSpR8XzD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 178C0C4CEF6;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=fVsQktr66AfeetC6nV7WwKf2PIcVVQSSKpg1lW8+WR4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=LSpR8XzDKI/9YW/6Qu9AhPc9P1fgfSg9wB1i7yyKWMY1NSQdOwdq2PLCmanqAx+1Q
	 c/hB3+Y0E/pqF2zGum4RybakxWINpBu7XxkdZBPSju3ch6qzR+wp1ZIDFRhwICRX/8
	 D1Qza7mz5Wut0yP7gXoM+A/GbTD9dMx6E4530YVBzsCRMV60ZLZwfB1UdLU8wcZH3G
	 ZljBFkyh0lPpRqsZTdpCnqQXMq5EqEsl2EBBtBxSRWrAPM1n8cyd3w4eD8HJrOzg6X
	 9ZDmfhWmYQxRa1zrc70fdMgkX744xgskrtkFJCFm9GwzN0vQwHpEKu7klyVL5h8a+z
	 UCfAaCbmgSSxA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Ciu-0kiM;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/27] docs: use get_abi.py for ABI generation
Date: Mon, 10 Feb 2025 11:18:01 +0100
Message-ID: <e7fcb121c0612c94f6f54f0d742cd3a26a46cd7d.1739182025.git.mchehab+huawei@kernel.org>
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

Use the new script instead of the old one when generating ABI docs.

For now, execute it via exec. Future changes will better integrate it
by using the class defined there directly.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst |  1 -
 Documentation/admin-guide/abi-removed.rst  |  1 -
 Documentation/admin-guide/abi-stable.rst   |  1 -
 Documentation/admin-guide/abi-testing.rst  |  1 -
 Documentation/sphinx/kernel_abi.py         | 10 +++-------
 5 files changed, 3 insertions(+), 11 deletions(-)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index b655615917f1..6d4d9ab7b8c3 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -10,4 +10,3 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: ABI/obsolete
-   :rst:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index ba941c1af178..9fc78af6f077 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -4,4 +4,3 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: ABI/removed
-   :rst:
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index 5d738f345333..c47c2a295865 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -13,4 +13,3 @@ Most interfaces (like syscalls) are expected to never change and always
 be available.
 
 .. kernel-abi:: ABI/stable
-   :rst:
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index a867e6578bf7..40b31985e587 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -19,4 +19,3 @@ name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
 .. kernel-abi:: ABI/testing
-   :rst:
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 38653f5706c0..f314b888d3de 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -14,7 +14,7 @@ u"""
     :license:    GPL Version 2, June 1991 see Linux/COPYING for details.
 
     The ``kernel-abi`` (:py:class:`KernelCmd`) directive calls the
-    scripts/get_abi.pl script to parse the Kernel ABI files.
+    scripts/get_abi.py script to parse the Kernel ABI files.
 
     Overview of directive's argument and options.
 
@@ -67,7 +67,6 @@ class KernelCmd(Directive):
 
     option_spec = {
         "debug"     : directives.flag,
-        "rst"       : directives.unchanged
     }
 
     def run(self):
@@ -78,15 +77,12 @@ class KernelCmd(Directive):
         srctree = os.path.abspath(os.environ["srctree"])
 
         args = [
-            os.path.join(srctree, 'scripts/get_abi.pl'),
+            os.path.join(srctree, 'scripts/get_abi.py'),
+            '-D', os.path.join(srctree, 'Documentation', self.arguments[0]),
             'rest',
             '--enable-lineno',
-            '--dir', os.path.join(srctree, 'Documentation', self.arguments[0]),
         ]
 
-        if 'rst' in self.options:
-            args.append('--rst-source')
-
         lines = subprocess.check_output(args, cwd=os.path.dirname(doc.current_source)).decode('utf-8')
         nodeList = self.nestedParse(lines, self.arguments[0])
         return nodeList
-- 
2.48.1

