Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082E424336D;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=pd2ZVQELzPMxpEYDSGPPamr09GwB3Enh8egoFSgTZXGxt32DOZaZM+dYE/e1vCayA+k0EJp3wvHdNTGYD8MoS3DSuCLy7ZAOR1NpXh5vZR5nRU+3eWQSOp6VgyHiqwFNBOkOn17YCn4Uui1S7IGSOrxFk6R8EViczh3QMneQpuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=75OOQGaZbWwBeHpHgcEDyXW9cfvWNPeCvA+D8R/RxPw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=H8BuS7jXTH1WW2KU4lPUjJA59tQhYoXeDzyzgth48r8f8PN1Icx+iLisxTPeI5vR8fr5LA1mEt+L6w/Domm5nYmYVuMhEUmuNJIP9317h7yc05kWBA0PPu366XuT/R70LApB4NzYix6ehmY/nyYwSJXg4KBhTXlBdEzSzPNt44o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s+zkYomk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s+zkYomk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 62480C4CEF6;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=75OOQGaZbWwBeHpHgcEDyXW9cfvWNPeCvA+D8R/RxPw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=s+zkYomkrCFMsF0i7McMY0ubkPdJHfHxPutOXSRMy33fs6Rp7P/vtQd4nc7zBOtse
	 FrrIQ+JaCyanxALZ4h/lnsRXqkfsGsa9iTgAvSRD+K38igbYEMeJhjyz6lrA0kJKyf
	 EHadADjOZ9zpVBpxq46VK0ULQ6rvMQdboW20XwDB4DsADzNnjJjAD7KNRX4t+CX+um
	 FiAGXH+tmgDKPj1vTQCTuRULtSi8yhkjUJyF/buoKJuvjxMG6IySHz2Ry+BP6xPtwv
	 EliJ54roooRcovAWwjl7h0f5h5x67Nh4CSC5IzkzvQyNx9xibWyHiqMgWyP8AerilO
	 trzXbA8kbBuMA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWt-2aZH;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 10/15] scripts: sphinx-pre-install.py: fix support for gentoo
Date: Mon, 30 Jun 2025 23:34:58 +0200
Message-ID: <228d90e53fe73f6e1ae218f26d0bbc0e0808e4c9.1751318230.git.mchehab+huawei@kernel.org>
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

Some gentoo packages have changes. Fix it.

While here, improve emerge portage enable logic.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 35 ++++++++++++++++-------------------
 1 file changed, 16 insertions(+), 19 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 69e2ea228df7..9cbf548b0b9c 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -669,12 +669,13 @@ class SphinxDependencyChecker:
 
     def give_gentoo_hints(self):
         progs = {
-            "convert":      "media-gfx/imagemagick",
-            "dot":          "media-gfx/graphviz",
-            "rsvg-convert": "gnome-base/librsvg",
-            "virtualenv":   "dev-python/virtualenv",
-            "xelatex":      "dev-texlive/texlive-xetex media-fonts/dejavu",
-            "yaml":         "dev-python/pyyaml",
+            "convert":       "media-gfx/imagemagick",
+            "dot":           "media-gfx/graphviz",
+            "rsvg-convert":  "gnome-base/librsvg",
+            "virtualenv":    "dev-python/virtualenv",
+            "xelatex":       "dev-texlive/texlive-xetex media-fonts/dejavu",
+            "yaml":          "dev-python/pyyaml",
+            "python-sphinx": "dev-python/sphinx",
         }
 
         if self.pdf:
@@ -699,21 +700,17 @@ class SphinxDependencyChecker:
             print("You should run:")
         print("\n")
 
-        imagemagick = "media-gfx/imagemagick svg png"
-        cairo = "media-gfx/graphviz cairo pdf"
-        portage_imagemagick = "/etc/portage/package.use/imagemagick"
-        portage_cairo = "/etc/portage/package.use/graphviz"
 
-        result = self.run(["grep", "imagemagick", portage_imagemagick],
-                          stdout=subprocess.PIPE, text=True)
-        if not result.stdout.strip():
-            print(f"\tsudo su -c 'echo \"{imagemagick}\" > {portage_imagemagick}'")
+        portages = [
+            "media-gfx/imagemagick",
+            "media-gfx/graphviz",
+        ]
 
-        result = self.run(["grep", "graphviz", portage_cairo],
-                          stdout=subprocess.PIPE, text=True)
-
-        if not result.stdout.strip():
-            print(f"\tsudo su -c 'echo \"{cairo}\" > {portage_cairo}'")
+        for p in portages:
+            result = self.run(["grep", p, "/etc/portage/package.use/*"],
+                               stdout=subprocess.PIPE, text=True)
+            if not result.stdout.strip():
+                print(f"\tsudo emerge -av1 {p}")
 
         print(f"\tsudo emerge --ask {self.install}")
 
-- 
2.50.0

