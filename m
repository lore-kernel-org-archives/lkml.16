Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A63E2673B8;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=mNbRKmI2QvKitEswzW4Xupx7NCWrl7LB6TF3kYze0LqyGOP3IeHjHIyCg0XCFOP+EJWuOKcyAD5s1ovMQD7Faci0Mqz49PTTjsFde2+47JiyKPUBco0sGUOWt362I+g30JTv8M3P77vBv4kERRMU9UYwAy+469eQeKzydho/hUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=5NIsmVCuy0Ps73FY9SsRdlOH9IrLgYYVlKEUKddXlno=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZAck7/qdVT7bbjo8gn8UIDfl7sqxVj8JlRJvWm4tFdp8FI41r9ISHQoulazwA3oojcev1OKP3UIiOsfbaIw1375WiGXvUAfGvhdqgC9T+u1WKCfS3EKcV6bUAqTK+k8tRi4VImFe9oZR3f/p26DT87a75nJdBtCrJpegp26l5rY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nRC9cHDV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nRC9cHDV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B064C4CEEA;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=5NIsmVCuy0Ps73FY9SsRdlOH9IrLgYYVlKEUKddXlno=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nRC9cHDV9zHdrcvINwNoFFY0cfM0R31zuO686CM/9sneLkEO7j3EHhvS1LL6GTD24
	 Z/qFyNnDQJgO27iRqE08pZmwZ0Q9F47TRLuX5rA/0CrgE7KauKdGHSn0BYWahNuWI3
	 /dXpg7P76+5KY+yTftnHjBa6rjz7qm31nYVFvKAskDfWsmOL5ZVB8QtSVIO4OXPWF5
	 L1FSs+sEd5IQUQ7E1xMqRQyf3W/fRnjnavYByusFu2l7hJepqrNnmXiV6av6ihOX7a
	 W81p0/u+CxuwuZz34hQWlhu692cSzoUk9pV9v1g+vD7WiJK+RFP4g8Ii7UQeBb364g
	 QyD/kPIvkPVzA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWA-1e8a;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Kees Cook <kees@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 19/33] docs: sphinx: kerneldoc: verbose kernel-doc command if V=1
Date: Tue,  8 Apr 2025 18:09:22 +0800
Message-ID: <a2f01590814b111e138f278e8a721024fdf2d445.1744106242.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1744106241.git.mchehab+huawei@kernel.org>
References: <cover.1744106241.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab@kernel.org>

It is useful to know what kernel-doc command was used during
document build time, as it allows one to check the output the same
way as Sphinx extension does.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/kerneldoc.py | 34 +++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/Documentation/sphinx/kerneldoc.py b/Documentation/sphinx/kerneldoc.py
index 39ddae6ae7dd..d206eb2be10a 100644
--- a/Documentation/sphinx/kerneldoc.py
+++ b/Documentation/sphinx/kerneldoc.py
@@ -43,6 +43,29 @@ from sphinx.util import logging
 
 __version__  = '1.0'
 
+def cmd_str(cmd):
+    """
+    Helper function to output a command line that can be used to produce
+    the same records via command line. Helpful to debug troubles at the
+    script.
+    """
+
+    cmd_line = ""
+
+    for w in cmd:
+        if w == "" or " " in w:
+            esc_cmd = "'" + w + "'"
+        else:
+            esc_cmd = w
+
+        if cmd_line:
+            cmd_line += " " + esc_cmd
+            continue
+        else:
+            cmd_line = esc_cmd
+
+    return cmd_line
+
 class KernelDocDirective(Directive):
     """Extract kernel-doc comments from the specified file"""
     required_argument = 1
@@ -57,6 +80,7 @@ class KernelDocDirective(Directive):
     }
     has_content = False
     logger = logging.getLogger('kerneldoc')
+    verbose = 0
 
     def run(self):
         env = self.state.document.settings.env
@@ -65,6 +89,13 @@ class KernelDocDirective(Directive):
         filename = env.config.kerneldoc_srctree + '/' + self.arguments[0]
         export_file_patterns = []
 
+        verbose = os.environ.get("V")
+        if verbose:
+            try:
+                self.verbose = int(verbose)
+            except ValueError:
+                pass
+
         # Tell sphinx of the dependency
         env.note_dependency(os.path.abspath(filename))
 
@@ -104,6 +135,9 @@ class KernelDocDirective(Directive):
 
         cmd += [filename]
 
+        if self.verbose >= 1:
+            print(cmd_str(cmd))
+
         try:
             self.logger.verbose("calling kernel-doc '%s'" % (" ".join(cmd)))
 
-- 
2.49.0

