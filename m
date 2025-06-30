Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCBCF241666;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320365; cv=none; b=pM00unBi7oHbasvhE+Q0xgcQCRXVjGAelCsfM4F/6nqBpwpjovSJNF/dZpeAW77NsvzaVuAn5Qzg1svq6u/MlsbZOqquPJZJWZPlTYFMoiAeWnvN00DF/28vYbqVOggKEB8sKyq4MZ38kGS/4evDlj3YVwuexE7uX39zM75dKmM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320365; c=relaxed/simple;
	bh=ziyDRVvP7fisTUmklw0p9ITY4D1AfmB7FOFn6nzbObA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IpKF6vuaJWg8HB6wh88dkD8aNeRFKP1NtGUjc2Le+CuBPN9o6Hm+LH6RfnGBGKpoW7cR0lnkImlVXMgAM0FkSq3t/3GX98Y1FIFEpCpsDzLrz5bUZsYfUyuDOcXy1tqnP4d9PJXlI2ygo8fcH0sdQV/7U+A0XMqwmuXHG46/MSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=enprYEON; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="enprYEON"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5FA28C4CEF7;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=ziyDRVvP7fisTUmklw0p9ITY4D1AfmB7FOFn6nzbObA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=enprYEONABk6EFw4X0Tre9NFX1RQEVtkC6qH6dLcbyAJ5SOTZJR6uuL1hCnpFf/Vf
	 2c73Z66ntsRvjQfxYS62QGSn0cBrx7oy/1rchbBSM9aJZ7BxeT7/r3qIcpebKG+dMi
	 PFIe0oFNFhaLkmFdeRiJVHDCzT8+3gpTy4F0s4WzRxsdwwhrH+jyKRBzGJlSue/Q5S
	 i7FHxnsKnupJawFhAdEEDTrRxL6pJrt/vQhkFZ5qOnnQsK4SzIb2K0c/UxSo6nhMx2
	 /Z6gkBCWesKfrjhCqrAhK9API9c3usrEoZ4msVxyHVHAzLPosSvWYv9k+faXhGwTHH
	 oRo3qRjl66g/Q==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWp-2Tj0;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 09/15] scripts: sphinx-pre-install.py fix opensuse hints
Date: Mon, 30 Jun 2025 23:34:57 +0200
Message-ID: <4c782ff5825d5437041e9a30d91141e59ab092a0.1751318230.git.mchehab+huawei@kernel.org>
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

yaml hints arw wrong.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index eca42d90ed01..69e2ea228df7 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -530,7 +530,7 @@ class SphinxDependencyChecker:
             "python-sphinx": "python3-sphinx",
             "virtualenv":    "python3-virtualenv",
             "xelatex":       "texlive-xetex-bin",
-            "yaml":          "python3-pyyaml",
+            "yaml":          "python3-pyyaml",     # or python3-PyYAML?
         }
 
         # On Tumbleweed, this package is also named rsvg-convert
@@ -569,7 +569,7 @@ class SphinxDependencyChecker:
                 progs.update({
                     "python-sphinx": "python311-Sphinx",
                     "virtualenv":    "python311-virtualenv",
-                    "yaml":          "python311-pyyaml",
+                    "yaml":          "python311-PyYAML",
                 })
 
         # FIXME: add support for installing CJK fonts
-- 
2.50.0

