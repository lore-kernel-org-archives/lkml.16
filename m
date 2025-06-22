Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC0B18248C;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750572171; cv=none; b=SZwDXxdnE9JWX+cgo2TWSTi7j3vjOPlGnJZkmf6lmtGPdTW/yH7m2bPEdA09RXzC1LBHVSB6BNVmdvBhoiP7UtZUjTOEeQvf5R3Ug6bD9FcaX/gM5qXz/dhXjVdn4F313EAwSnDgdsDd8i019z2uq+3YpdkJ7C+j5AANqZQM+zg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750572171; c=relaxed/simple;
	bh=JuIEICGnpDYmiVcGm/h58xaHAndEpsJueWYoYVCqMQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qNXe/kDjymHnB3BN/AuTAIjGB2vSVZ6W7t924bnRaWnJVFRZmYONs7TxSJQqsHMkZ1P/qZEBkkhn6FWYjc9Ykm2kB8EeT8o7YGQP/uPdd0yXk4MmjPEwJmeiMwkAoH0mBvrsuGXbDkjvPZvbIPLCL+NUcK9MiCsFQ8K7/ReFlDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wz7DYtGH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wz7DYtGH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4F0C4CEF6;
	Sun, 22 Jun 2025 06:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750572171;
	bh=JuIEICGnpDYmiVcGm/h58xaHAndEpsJueWYoYVCqMQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Wz7DYtGHc12KGIUgWMzNxb9mI5AOcskq0yqDO0Igtyp3RqktuNBFXxbL7QrP0BOQX
	 MLL7VPimqHqxDyYXjPCbNjv4z5+5T0K/9OSc6eg6f1PJEWB2m/x8BOPWkXSPi0Xb8A
	 TLtMQuxHPgIMmZ7NEU7PxvdhnS2gcTdILuExlGgpZVtpsXIjS5xuQSll3EtHFT1tl6
	 yri49fpWJEkXukpl5cx3LMXJMoSr9KjTY1dxX8fmXV6I0JPbwJnO0Iv39+qTcMAOXN
	 zlXR2aZvQIT9nHsTbFvVvTqHB33cJYqMhNHKh+fh2siBRDphrU0Enj2t8ukstKvP6K
	 psh2wVFzL6wWA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uTDmz-00000000o2S-1vlL;
	Sun, 22 Jun 2025 08:02:49 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 07/15] scripts: test_doc_build.py: improve dependency list
Date: Sun, 22 Jun 2025 08:02:36 +0200
Message-ID: <433aeefb4ac9edbd62494334ac07bc1307387d40.1750571906.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750571906.git.mchehab+huawei@kernel.org>
References: <cover.1750571906.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Change the dependency list to ensure that:
- all docutils versions are covered;
- provide an explanation about the dependencies;
- set a better minimal requirement for 3.4.3.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/test_doc_build.py | 68 ++++++++++++++++++++++++++++-----------
 1 file changed, 50 insertions(+), 18 deletions(-)

diff --git a/scripts/test_doc_build.py b/scripts/test_doc_build.py
index 129c2862065c..087b8c476f05 100755
--- a/scripts/test_doc_build.py
+++ b/scripts/test_doc_build.py
@@ -37,70 +37,102 @@ PYTHON_VER_CHANGES = {(8, 0, 2): PYTHON}
 
 # Sphinx versions to be installed and their incremental requirements
 SPHINX_REQUIREMENTS = {
+    # Oldest versions we support for each package required by Sphinx 3.4.3
     (3, 4, 3): {
+        "docutils": "0.16",
+        "alabaster": "0.7.12",
+        "babel": "2.8.0",
+        "certifi": "2020.6.20",
+        "docutils": "0.16",
+        "idna": "2.10",
+        "imagesize": "1.2.0",
+        "Jinja2": "2.11.2",
+        "MarkupSafe": "1.1.1",
+        "packaging": "20.4",
+        "Pygments": "2.6.1",
+        "PyYAML": "5.1",
+        "requests": "2.24.0",
+        "snowballstemmer": "2.0.0",
+        "sphinxcontrib-applehelp": "1.0.2",
+        "sphinxcontrib-devhelp": "1.0.2",
+        "sphinxcontrib-htmlhelp": "1.0.3",
+        "sphinxcontrib-jsmath": "1.0.1",
+        "sphinxcontrib-qthelp": "1.0.3",
+        "sphinxcontrib-serializinghtml": "1.1.4",
+        "urllib3": "1.25.9",
+    },
+
+    # Update package dependencies to a more modern base. The goal here
+    # is to avoid to many incremental changes for the next entries
+    (3, 5, 4): {
         "alabaster": "0.7.13",
         "babel": "2.17.0",
         "certifi": "2025.6.15",
-        "charset-normalizer": "3.4.2",
-        "docutils": "0.15",
         "idna": "3.10",
         "imagesize": "1.4.1",
         "Jinja2": "3.0.3",
         "MarkupSafe": "2.0",
         "packaging": "25.0",
         "Pygments": "2.19.1",
-        "PyYAML": "5.1",
         "requests": "2.32.4",
         "snowballstemmer": "3.0.1",
         "sphinxcontrib-applehelp": "1.0.4",
-        "sphinxcontrib-devhelp": "1.0.2",
         "sphinxcontrib-htmlhelp": "2.0.1",
-        "sphinxcontrib-jsmath": "1.0.1",
-        "sphinxcontrib-qthelp": "1.0.3",
         "sphinxcontrib-serializinghtml": "1.1.5",
-        "urllib3": "2.4.0",
     },
-    (3, 5, 4): {},
+
+    # Starting from here, ensure all docutils versions are covered with
+    # supported Sphinx versions. Other packages are upgraded only when
+    # required by pip
     (4, 0, 3): {
-        "docutils": "0.17.1",
+        "docutils": "0.17",
         "PyYAML": "5.1",
     },
-    (4, 1, 2): {},
-    (4, 3, 2): {},
+    (4, 1, 2): {
+    },
+    (4, 3, 2): {
+    },
     (4, 4, 0): {},
     (4, 5, 0): {},
     (5, 0, 2): {},
     (5, 1, 1): {},
     (5, 2, 3): {
+        "docutils": "0.17.1",
         "Jinja2": "3.1.2",
         "MarkupSafe": "2.0",
         "PyYAML": "5.3.1",
     },
-    (5, 3, 0): {
-        "docutils": "0.18.1",
-        "PyYAML": "5.3.1",
+    (5, 3, 0): {},
+    (6, 0, 1): {
+        "docutils": "0.18",
     },
-    (6, 0, 1): {},
     (6, 1, 3): {},
     (6, 2, 1): {
+        "docutils": "0.18.1",
         "PyYAML": "5.4.1",
     },
-    (7, 0, 1): {},
+    (7, 0, 1): {
+    },
     (7, 1, 2): {},
     (7, 2, 3): {
+        "docutils": "0.19",
         "PyYAML": "6.0.1",
         "sphinxcontrib-serializinghtml": "1.1.9",
     },
     (7, 3, 7): {
+        "docutils": "0.20",
         "alabaster": "0.7.14",
         "PyYAML": "6.0.1",
     },
     (7, 4, 7): {
-        "docutils": "0.20",
+        "docutils": "0.21",
         "PyYAML": "6.0.1",
     },
-    (8, 0, 2): {},
+    (8, 0, 2): {
+        "docutils": "0.21.1",
+    },
     (8, 1, 3): {
+        "docutils": "0.21.2",
         "PyYAML": "6.0.1",
         "sphinxcontrib-applehelp": "1.0.7",
         "sphinxcontrib-devhelp": "1.0.6",
-- 
2.49.0

