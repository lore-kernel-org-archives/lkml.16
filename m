Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D052270571;
	Sat, 21 Jun 2025 19:56:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750535761; cv=none; b=lii9Z4UudqPFFG3BKcIebfZO/yoJ0uafAuRihomytlBTK7wK38Vdav0p/Ss9D9VSJIxEcoyW5jfXid3ITpiR8weelZvPuTCtMrXqMpadtCsWCxvqjqWLtTQDxdnZtxqz4+lt8nMzd4r0rQ86Vfneze7euEOKyGmOACsgGnxCzHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750535761; c=relaxed/simple;
	bh=JuIEICGnpDYmiVcGm/h58xaHAndEpsJueWYoYVCqMQs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MxOTcjmcaBGvGvwOis1ee0/vDsBpMcWQoWLs79wrd8UPJ/svsZT52yGsu0+rBr+kzDKd76H3/WX3+JByWhAcrglHKRwV51QwLhs6YiZz7vRf4e1gvVONEg+P7QVb3Ov9CfMOWVIfhRQRlMu0uUT+dN5ml1FxyTiEZEpLBUTMolQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DGX/t1w3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DGX/t1w3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0EDAC4AF0C;
	Sat, 21 Jun 2025 19:56:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750535760;
	bh=JuIEICGnpDYmiVcGm/h58xaHAndEpsJueWYoYVCqMQs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=DGX/t1w3KvdxSzPASQUFu9xAAcgqC/5+rZsstgB6LLAHjcuog8BQoZGHc5cMVPlCV
	 6mphv1zgtfw+7avQykv4kSdLS2hYN4/dSNSV+It5bfECXjw79vi0W2lFAOLlIFcvB1
	 /tMM9JoEHM7jxkzuVz8cfrCpAAah9i3PVvaxwy2vdszm96oiTm9WSSms7qin6286Yb
	 sFjjNTtD42j0XlHmWxYNS8XifszOOOIpnZN6weJUGjniywKZRJUkGSwvq32gm5mX73
	 i3sE67HLuanQZEW6j8XEMBP56gqCMxsdXq9mWz11cH9Iq7eLpuAeJRZ01ZRUs6zhg6
	 5vpyIRH9n2wmA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1uT4Ji-00000000e40-33EF;
	Sat, 21 Jun 2025 21:55:58 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Akira Yokosawa" <akiyks@gmail.com>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 07/15] scripts: test_doc_build.py: improve dependency list
Date: Sat, 21 Jun 2025 21:55:46 +0200
Message-ID: <9eac3b7dab2f59349044c53201d6a71cf06d8df1.1750535171.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <cover.1750535171.git.mchehab+huawei@kernel.org>
References: <cover.1750535171.git.mchehab+huawei@kernel.org>
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

