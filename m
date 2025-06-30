Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFBEF2367B2;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751320364; cv=none; b=dle1iNHsnDO4lsljdWO77+PVLsIFFe3THZTgNA/r3EQjzwsmJf3wR4THORFyukS6gHKKchQJsjKhAXM8G0PjggYZAmva7E+A1s6wBrbjYxTYNOyQEM0ZYJAIyZ4n9U0VD7ymRLcua2X8NYnEitcUJD2sTgtgMNMDRm0VDQ7cgpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751320364; c=relaxed/simple;
	bh=DHtfPYJYXR8ddBt77pelHOR6W6f51lVt8KBAeP14qlI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uiceutQNcYRUAeSsz59SulXp7OplwRDF4LAXAWSkIcfrRld1c1z591yRhIEr4yb25WkbWHHhl5KlfPcYlBy/+Z1pRFtI4d6iY5NlIMoE0TJWIkBll3LCTgYX0itZYxyiMhJBfksju0Zj0HURPC1Z7axVcN8wM0sVyEsnFfa9dvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c26XOtEC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c26XOtEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 568A6C4CEF0;
	Mon, 30 Jun 2025 21:52:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751320364;
	bh=DHtfPYJYXR8ddBt77pelHOR6W6f51lVt8KBAeP14qlI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=c26XOtEC+BRg/drzRLy48xwhA4h+bhz6bR/IgPX0q0g0LOlcHCkksq0A0vq5UMn0p
	 tfJ/PwHaZALWHEenzdW6Egbn7NvOQ/sZqh5VrIWMHt3w63NdcpHNnoeBuUDwE4cySf
	 z08/he7zTvtQTbRTFo8FKhOCm394Xz8EX9QH2FiNvGMQXzGp8n8taH+lM2reAJplpk
	 blWxyMISw0mD6lKhHHggOzgnetldOyqSFhSnJTbKVL++HfUjSn4wZGx5I4uXokfE2D
	 C8FLvMwvdNaQB6cbJ0WoPF3ZdI0bBB8wm1WaTWMgcJsIDrDPnyTuVcra/ATwylZ5qp
	 gAt9ajqC7JWvA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uWMQc-00000003QWd-29GE;
	Mon, 30 Jun 2025 23:52:42 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	"Sai Vishnu M" <saivishnu725@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 06/15] scripts: sphinx-pre-install: drop obsolete routines
Date: Mon, 30 Jun 2025 23:34:54 +0200
Message-ID: <1287964385f0df25c2b0cf91c51d1dfcdeaea8fc.1751318230.git.mchehab+huawei@kernel.org>
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

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/sphinx-pre-install.py | 23 +----------------------
 1 file changed, 1 insertion(+), 22 deletions(-)

diff --git a/scripts/sphinx-pre-install.py b/scripts/sphinx-pre-install.py
index 3912359d2bae..b639acd455cc 100755
--- a/scripts/sphinx-pre-install.py
+++ b/scripts/sphinx-pre-install.py
@@ -114,27 +114,6 @@ class SphinxDependencyChecker:
 
         return None
 
-    @staticmethod
-    def find_python_no_venv():
-        # FIXME: does it makes sense now that this script is in Python?
-
-        result = SphinxDependencyChecker.run(["pwd"], capture_output=True,
-                                             text=True)
-        cur_dir = result.stdout.strip()
-
-        python_names = ["python3", "python"]
-
-        for d in os.environ.get("PATH", "").split(":"):
-            if f"{cur_dir}/sphinx" in d:
-                continue
-
-            for p in python_names:
-                if os.access(os.path.join(d, p), os.X_OK):
-                    return os.path.join(d, p)
-
-        # Python not found at the PATH
-        return python_names[-1]
-
     @staticmethod
     def get_python_version(cmd):
 
@@ -940,7 +919,7 @@ class SphinxDependencyChecker:
         else:
             print("\nSphinx needs to be installed either:\n1) via pip/pypi with:\n")
 
-        self.python_cmd = self.find_python_no_venv()
+        self.python_cmd = os.path.abspath(sys.argv[0])
 
         print(f"\t{virtualenv_cmd} {self.virtenv_dir}")
         print(f"\t. {self.virtenv_dir}/bin/activate")
-- 
2.50.0

