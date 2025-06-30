Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05278242D8F;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=aZXyUW+u3P1ROELfJkpjEjM5nmLb7XwUEVtuHVSVyL93yaPdGuGGCyaet2vkfctLkqc9uKc2JFHXz4xQ/aV1wXnhdrqdqCw2i5287sBd2SwafX+cHebmu+xIwwyXAI0wIRkhD72QVz5ebSh9loAptmKBwwY5Z9szj3kCVmI3zW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=Ygtsq+De4GW5sas3J8PyjFBax+Pkg5M1g2qs8BnKYFE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fN73d8Fdjx0Xm6YoPfjTauE4W6/mR5pYiU33/xAp9VaDhmh0WEG+SiSft0IHhQmT+Pq2pPGQkSpQWeiDctIFsTUHqnbO9mlEPaQF8D/VjJqFl1/dUzWTKUPVHoyQxQw6uuTuceoXLIt1AqM6fmp2MfLU3yOHk+1x7s5HJJSZRsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lZ/aDM/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lZ/aDM/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DFF4C4CEFC;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=Ygtsq+De4GW5sas3J8PyjFBax+Pkg5M1g2qs8BnKYFE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lZ/aDM/gEQHlykyeQunFAOnvgm2VsQEJMctRRiRa13N1U7VAIgPpPAGd+ckwPRTKl
	 RiuHHlr3h8mItnI/6tm6xT/S4nGopZ0XaGdq5X4EyZj0qDCnLXF25JPDe5C2Y0Va3g
	 Q8saZ0A3nSfx5ZLq4rpBP3ZO9jOEArGNeNZvhxKTHOBQIBwWC9sulpfdpbJK27dgsZ
	 abH+Zv92y5cfaGZGyWxcuQpEDHvGz3SvTGCLzXwkIu1ieD+IBHI7tZhJD6IOhN2ea3
	 yd4iI1ZzNn4bc+zMzpwak65Rje7e8vqi7Def8X1zsOW+XqUQjDwzkiEMSABqB+rPCc
	 L7tSPGRROHFiw==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QX5-2ulK;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 13/15] scripts: sphinx-pre-install.py: cleanup rhel support
Date: Mon, 30 Jun 2025 23:35:01 +0200
Message-ID: <c5bffc12e48dd902c9e1b4ee9aa272fc55d8f9aa.1751318230.git.mchehab+huawei@kernel.org>
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

Rhel < 8.0 is not supported anymore. Drop support for it.

Rhel 8 is problematic: at least on the tests I did with a
docker repo, it didn't work, but it could be due to the issue
that it is actually different than a real One.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index a941eae17a9e..50413b7d2f2c 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -487,15 +487,31 @@ class SphinxDependencyChecker:
 
             progs["virtualenv"] = "python-virtualenv"
 
-            if rel and rel < 8:
+            if not rel or rel < 8:
                 old = 1
                 self.pdf = False
 
-                # RHEL 7 is in ELS, currently up to Jun, 2026
+                print("ERROR: Distro not supported. Too old?")
+                return
+
+            # TODO: check if RHEL8 still works.
+            # On my tests with  docker "redhat/ubi8" image, there's no
+            # python3-sphinx (or similar) package. It comes with Python 3.6,
+            # but there are other python packages over there, so it may be
+            # possible to work with venv.
+
+            if self.first_hint:
+                print("Note: RHEL-based distros typically require extra repositories.\n" \
+                      "For most, enabling epel and crb are enough:\n" \
+                      "\tsudo dnf install -y epel-release", \
+                      "\tsudo dnf config-manager --set-enabled crb\n" \
+                      "Yet, some may have other required repositories. Those commands could be useful:" \
+                      "\tsudo dnf repolist all" \
+                      "\tsudo repoquery --available --info <pkgs>",
+                      "\tsudo dnf config-manager --set-enabled '*' # enable all - probably not what you want")
+
+                self.first_hint = False
 
-                print("Note: texlive packages on RHEL/CENTOS <= 7 are incomplete. Can't support PDF output")
-                print("If you want to build PDF, please read:")
-                print("\thttps://www.systutorials.com/241660/how-to-install-tex-live-on-centos-7-linux/")
 
         if self.pdf:
             pdf_pkgs = [
-- 
2.50.0

