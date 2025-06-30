Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06B8C242D93;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=GqdoWMt2TJS4MrkGS3W6hB+gfnd6OkIsTiG9dZNEtWGwEY8BUJ9t69yZn+mT4LhQdvTmCK72M010Ev0YaUyTYXPXQo0rDpGvAKBT/60Aql8RXCMDGyb75q/65400liAA7c8yx5FxI/fceT/Pr55wKIABJeRWxTc62TLSxzTdy1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=klFInMyMuyuTpAHmohUw1L/ykD0tdIFslFtkTRkiwWc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YpBT6USzDWqwWeyoh65/6zUqWlfjE9Uz3fsWuA5Abn3Rhhh3AaUmUj2mpBsTuZyvPicPSnImFgev8TFRNtHcsltSCi9Z84a1Jeu+tZ8sk7NTCzvGmm69tOdbjLTTKQFziyCm6hfMOTrohY1tiqUkhW55YfRIFoLTPjPCtuyjpbw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nogtk7Au; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nogtk7Au"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71B25C4CEFE;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=klFInMyMuyuTpAHmohUw1L/ykD0tdIFslFtkTRkiwWc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nogtk7AumGtIlLzpISDJom9kpWJ1jKR2T0xxAG9CyHydMJ715WhehUmAHPrOrH8i3
	 j5fHuWn2DA0FlQZHCSca2oikq7I48SQ8R+qKinagBF5hfYPth7/XtcDHTmKsun8Mn0
	 SNld8GOqUin+kAG9x4EY1zR0UlaJ00el/xViZ7kmcpzm+XyvXicOr9LS2u9J9MU4Ok
	 3JdHNtcLRNUJ+pfDbcS3d8p3Y18d/cKlj6bFnUYXLDQ/wfOL5yXOKGMOW6undZQ1va
	 o7GD5LnPqrIOxVkiaPPfs/905OEsnVzWOaZBO+TYJ6jdpcygGF1wBLMDF8RL8E+XDY
	 R1G0tu6Ars4Ow==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QX9-31Yn;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 14/15] docs: Makefile: switch to the new scripts/sphinx-pre-install.py
Date: Mon, 30 Jun 2025 23:35:02 +0200
Message-ID: <2528a42b09a5bc955ff506dc91500d268bcf7eca.1751318230.git.mchehab+huawei@kernel.org>
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

Now that we have a better, improved Python script, use it when
checking for documentation build dependencies.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/Makefile                             | 14 +++++++-------
 .../{sphinx-pre-install.py => sphinx-pre-install}  |  0
 2 files changed, 7 insertions(+), 7 deletions(-)
 rename scripts/{sphinx-pre-install.py => sphinx-pre-install} (100%)

diff --git a/Documentation/Makefile b/Documentation/Makefile
index c486fe3cc5e1..b98477df5ddf 100644
--- a/Documentation/Makefile
+++ b/Documentation/Makefile
@@ -46,7 +46,7 @@ ifeq ($(HAVE_SPHINX),0)
 .DEFAULT:
 	$(warning The '$(SPHINXBUILD)' command was not found. Make sure you have Sphinx installed and in PATH, or set the SPHINXBUILD make variable to point to the full path of the '$(SPHINXBUILD)' executable.)
 	@echo
-	@$(srctree)/scripts/sphinx-pre-install.pl
+	@$(srctree)/scripts/sphinx-pre-install
 	@echo "  SKIP    Sphinx $@ target."
 
 else # HAVE_SPHINX
@@ -121,7 +121,7 @@ $(YNL_RST_DIR)/%.rst: $(YNL_YAML_DIR)/%.yaml $(YNL_TOOL)
 htmldocs texinfodocs latexdocs epubdocs xmldocs: $(YNL_INDEX)
 
 htmldocs:
-	@$(srctree)/scripts/sphinx-pre-install.pl --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,html,$(var),,$(var)))
 
 # If Rust support is available and .config exists, add rustdoc generated contents.
@@ -135,7 +135,7 @@ endif
 endif
 
 texinfodocs:
-	@$(srctree)/scripts/sphinx-pre-install.pl --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,texinfo,$(var),texinfo,$(var)))
 
 # Note: the 'info' Make target is generated by sphinx itself when
@@ -147,7 +147,7 @@ linkcheckdocs:
 	@$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,linkcheck,$(var),,$(var)))
 
 latexdocs:
-	@$(srctree)/scripts/sphinx-pre-install.pl --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,latex,$(var),latex,$(var)))
 
 ifeq ($(HAVE_PDFLATEX),0)
@@ -160,7 +160,7 @@ else # HAVE_PDFLATEX
 
 pdfdocs: DENY_VF = XDG_CONFIG_HOME=$(FONTS_CONF_DENY_VF)
 pdfdocs: latexdocs
-	@$(srctree)/scripts/sphinx-pre-install.pl --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	$(foreach var,$(SPHINXDIRS), \
 	   $(MAKE) PDFLATEX="$(PDFLATEX)" LATEXOPTS="$(LATEXOPTS)" $(DENY_VF) -C $(BUILDDIR)/$(var)/latex || sh $(srctree)/scripts/check-variable-fonts.sh || exit; \
 	   mkdir -p $(BUILDDIR)/$(var)/pdf; \
@@ -170,11 +170,11 @@ pdfdocs: latexdocs
 endif # HAVE_PDFLATEX
 
 epubdocs:
-	@$(srctree)/scripts/sphinx-pre-install.pl --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,epub,$(var),epub,$(var)))
 
 xmldocs:
-	@$(srctree)/scripts/sphinx-pre-install.pl --version-check
+	@$(srctree)/scripts/sphinx-pre-install --version-check
 	@+$(foreach var,$(SPHINXDIRS),$(call loop_cmd,sphinx,xml,$(var),xml,$(var)))
 
 endif # HAVE_SPHINX
diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install
similarity index 100%
rename from scripts/sphinx-pre-install.py
rename to scripts/sphinx-pre-install
-- 
2.50.0

