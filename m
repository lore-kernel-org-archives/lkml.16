Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCC39241671;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=iJkF1AfT/SHNSYszhJBA9tyq3XegipSW/dkylKVpN3s5iaVSTmoyxMnJKolijRH/pBUF3DgqwRt8fs/l7gvsEnTCCiiDi91Zo3a6gAGlItkexUKa3E/K2Jt8jYNnqJhblv/RGzLFlQnrUfV3Kfk/LXgKsk1cDLvu3eP/kOAFh+I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=NXRybsGIFDCGU4Lr+9EFPMUtfdXp93JNctJg3aAfuAU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JNIcG0Q+5Z7Pi9XmsRpoQGNvKCbXsfEv9qNLP3u0y6COypxKk8cVo+r0M9IychHgwrdTPvXUimXQ+2h8z6Ga/VnPQBboRlbGkYMn1sjByQzn6dsoAtnaJRcvjXCIPFENez6mLIwbEZ24TmEoa9Zgfyb2YmCO9+oVfYYWyfxFM44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dPWCaZOT; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dPWCaZOT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6477FC4CEF8;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=NXRybsGIFDCGU4Lr+9EFPMUtfdXp93JNctJg3aAfuAU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=dPWCaZOTbkeZIEyX5OiYZSgZzfCubPGKWGFalmkmx0MnlgAzUVxH9wIKJ8n44N44Y
	 S131rQ0wp/sqLKEYBHJSgH6k1uFbjCanMGkl9j3Wa9Hir9YVh/Bj8eHN7NifHTUW9J
	 KE5zYQbbEL6Mc7SEoDxDPc9XNCbsvfdqk/0cMH8Re5qd721e5494ieIBt7Eqeg/1eI
	 TL9qMTLNHgPtDSO415j2daKCwfuDRuKddw13myeiVsdgfdvbjClvmGdolT0YPQlI5R
	 r6gpiPVfu3ZXxycvG3C2IgaRUVSnQHx3zSaz79gqUS8lPYf0+OVTI2zGI1n1OqFF2J
	 oVbGwYVnDZdDA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWx-2hKb;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 11/15] scripts: sphinx-pre-install: Address issues with OpenSUSE Tumbleweed
Date: Mon, 30 Jun 2025 23:34:59 +0200
Message-ID: <4e89bf16dfd2be1e6c6c827a92bec1dc80c24774.1751318230.git.mchehab+huawei@kernel.org>
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

On Tumbleweed, package names are named after python-313*, as it also
has older python versions on it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 9cbf548b0b9c..72ac64f4e60b 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -571,6 +571,14 @@ class SphinxDependencyChecker:
                     "virtualenv":    "python311-virtualenv",
                     "yaml":          "python311-PyYAML",
                 })
+        else:
+            # Tumbleweed defaults to Python 3.11
+
+            progs.update({
+                "python-sphinx": "python313-Sphinx",
+                "virtualenv":    "python313-virtualenv",
+                "yaml":          "python313-PyYAML",
+            })
 
         # FIXME: add support for installing CJK fonts
         #
-- 
2.50.0

