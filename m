Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB2E23FC52;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=uUvzqDGF5dURJvlzT8WKW7KNq+pSfoI60NOZUtsXAQCwBnAQf5K4hckZfObXwHRtqbhMzoO92JFuOPz5Hjb+pEtbHz8CcoJSaXVM0TLGgNJZ7SOfn0yQZN5JZmhKsDsJIElVy28RoTw1IVTp+EDWysMj06eWPXksqsTOa701tsQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=opVgBgT8dUB2rKMoJmr5ql39zyKCEDajhIcychKj90Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TaDyeFhhJQ0hRijCYS6FPDqNlPg+fadB4XISeXR604AVy3DGqh3SzVX8CfzvmQErv9lxpv8aWeMlAaXLxnB0B9E6drgoSjvcN5r1vr1CcsDnbtuwb1IUJIMb6/Cp+vKnf0FG8SbdR5CwYoh0VXZ051A3izU+209Z49iPKYW+qPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M54MRKdg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M54MRKdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 678ACC4CEFA;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=opVgBgT8dUB2rKMoJmr5ql39zyKCEDajhIcychKj90Y=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=M54MRKdgzBE7o7NDp+HtM5uY1cdWGJoUCggY/rYnFHkY8I4KkWrvWM0faVgsQZDlK
	 ZryQ78AP70HsHx7w0opBxen5ogU0fouVqJip4bgew36oaDNI4t2EYO09dn22p13U8M
	 PBAwAPP2I/pvTz90FyUoBCIH5q0Xn6kl8u2kx7E0tyikNkM9hfgzsyEvTZ9OdttPVv
	 kOUdtsdfTkdHxMTvOiN6A+sb+UFlp/MEY1lNWrZvXlgEPJLxy7QljV035ZcPrAlucE
	 z0/bc8watVcgZcZWUf6PKir3WQ8PNMC1G7WHvjSmPy1JMFA+zvgtnKM8ko1ssk0n6n
	 UEEnk1e7Dwstg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QX1-2o3Z;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 12/15] scripts: sphinx-pre-install.py: only show portage hints once
Date: Mon, 30 Jun 2025 23:35:00 +0200
Message-ID: <299b4dedbfc9b43d734832e8366288b79edae358.1751318230.git.mchehab+huawei@kernel.org>
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

On gentoo, doesn't repeat instructions about how to enable
portage.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 72ac64f4e60b..a941eae17a9e 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -89,6 +89,9 @@ class SphinxDependencyChecker:
         self.python_cmd = ""
         self.activate_cmd = ""
 
+        # Certain hints are meant to be shown only once
+        self.first_hint = True
+
         self.min_version = (0, 0, 0)
         self.cur_version = (0, 0, 0)
         self.latest_avail_ver = (0, 0, 0)
@@ -714,11 +717,14 @@ class SphinxDependencyChecker:
             "media-gfx/graphviz",
         ]
 
-        for p in portages:
-            result = self.run(["grep", p, "/etc/portage/package.use/*"],
-                               stdout=subprocess.PIPE, text=True)
-            if not result.stdout.strip():
-                print(f"\tsudo emerge -av1 {p}")
+        if self.first_hint:
+            for p in portages:
+                result = self.run(["grep", p, "/etc/portage/package.use/*"],
+                                stdout=subprocess.PIPE, text=True)
+                if not result.stdout.strip():
+                    print(f"\tsudo emerge -av1 {p}")
+
+            self.first_hint = False
 
         print(f"\tsudo emerge --ask {self.install}")
 
-- 
2.50.0

