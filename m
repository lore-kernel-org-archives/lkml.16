Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9664C2673A8;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744106996; cv=none; b=EDWInrrHuolpXx8nkS6u7FVFZnQfi8gHNMivj+wSf8IDRUsN3/wLpLQxKKzOfnUOvM4ge9HrluMg32PhRYbmaJTkTJ5l8cs9uL7IP3dTd+Ks8M7QxXOq6lJZVgT1QLwFEmyMz4wcpkxKVVdQqEcvlNtRGnQTsjyaGd++Kv4FpaE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744106996; c=relaxed/simple;
	bh=3BDYTh1/WNFZ05pM+UlQyBSQkq+sjQ/vD8b342dkHcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cUxoDF+3Ls8YVtdIwjfnJQGEHvpLkbdQoXMCAksOn/fzvrgYZg1+/4XFR0BtlwR2IUPZmfLtbdCMDFKHDMbZDq8MOfKeD/917F7VElg4J52sKBSBKt9PAGONcy0MurY6SgkSxKeiTcSQ69T/9ri4bbAa0t0c887qg1PauwSPSAU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TNwaozQz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TNwaozQz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3A2C9C4CEED;
	Tue,  8 Apr 2025 10:09:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744106996;
	bh=3BDYTh1/WNFZ05pM+UlQyBSQkq+sjQ/vD8b342dkHcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TNwaozQz1eXfwIoxIgOj+N3Vr+rRFutWbt2QVglR9yv+EwvV3WitJfjr7kjWvq0hK
	 jb15LLcItUowJ7z+bcU/atRXB16+Q07OcvFbNEIg9njPbvbL0ZA1Yma+G3iGujFmeI
	 o4sEjgDiX9Lmqbob+3iFuqvaL20xQAe3jdATP5lTYDIAueHcWG8Te/x9BBeI8rBTU2
	 spWJpf9F4uvZUXHW4mxPIeBa0qcLx1xbPgpXjYIvryKiCTHKpEoiJsjerQElNYDAuk
	 PZ3V6DJy/KR3wm0I9SqONSsBfS9KWbyw/jXtwvQ0fBsGaXS5iVKkfn1b2z1VB2+i1Q
	 sKmNy76XNEn3A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98.2)
	(envelope-from <mchehab@kernel.org>)
	id 1u25tt-00000008RWV-2Jmx;
	Tue, 08 Apr 2025 18:09:49 +0800
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 26/33] scripts/kernel-doc.py: properly handle KBUILD_BUILD_TIMESTAMP
Date: Tue,  8 Apr 2025 18:09:29 +0800
Message-ID: <ffc70a1b741b010365ed82f31611018f24f91ce7.1744106242.git.mchehab+huawei@kernel.org>
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

The logic that handles KBUILD_BUILD_TIMESTAMP is wrong, and adds
a dependency of a third party module (dateutil).

Fix it.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 scripts/lib/kdoc/kdoc_files.py  |  9 ---------
 scripts/lib/kdoc/kdoc_output.py | 28 +++++++++++++++++++++-------
 2 files changed, 21 insertions(+), 16 deletions(-)

diff --git a/scripts/lib/kdoc/kdoc_files.py b/scripts/lib/kdoc/kdoc_files.py
index 5a6e92e34d05..e52a6d05237e 100644
--- a/scripts/lib/kdoc/kdoc_files.py
+++ b/scripts/lib/kdoc/kdoc_files.py
@@ -13,9 +13,6 @@ import logging
 import os
 import re
 import sys
-from datetime import datetime
-
-from dateutil import tz
 
 from kdoc_parser import KernelDoc
 from kdoc_output import OutputFormat
@@ -137,12 +134,6 @@ class KernelFiles():
         if out_style is None:
             out_style = OutputFormat()
 
-        dt = datetime.now()
-        if os.environ.get("KBUILD_BUILD_TIMESTAMP", None):
-            # use UTC TZ
-            to_zone = tz.gettz('UTC')
-            dt = dt.astimezone(to_zone)
-
         if not werror:
             kcflags = os.environ.get("KCFLAGS", None)
             if kcflags:
diff --git a/scripts/lib/kdoc/kdoc_output.py b/scripts/lib/kdoc/kdoc_output.py
index 8be69245c0d0..eb013075da84 100755
--- a/scripts/lib/kdoc/kdoc_output.py
+++ b/scripts/lib/kdoc/kdoc_output.py
@@ -19,8 +19,6 @@ import os
 import re
 from datetime import datetime
 
-from dateutil import tz
-
 from kdoc_parser import KernelDoc, type_param
 from kdoc_re import Re
 
@@ -586,6 +584,15 @@ class ManFormat(OutputFormat):
     )
     blankline = ""
 
+    date_formats = [
+        "%a %b %d %H:%M:%S %Z %Y",
+        "%a %b %d %H:%M:%S %Y",
+        "%Y-%m-%d",
+        "%b %d %Y",
+        "%B %d %Y",
+        "%m %d %Y",
+    ]
+
     def __init__(self, modulename):
         """
         Creates class variables.
@@ -597,11 +604,18 @@ class ManFormat(OutputFormat):
         super().__init__()
         self.modulename = modulename
 
-        dt = datetime.now()
-        if os.environ.get("KBUILD_BUILD_TIMESTAMP", None):
-            # use UTC TZ
-            to_zone = tz.gettz('UTC')
-            dt = dt.astimezone(to_zone)
+        dt = None
+        tstamp = os.environ.get("KBUILD_BUILD_TIMESTAMP")
+        if tstamp:
+            for fmt in self.date_formats:
+                try:
+                    dt = datetime.strptime(tstamp, fmt)
+                    break
+                except ValueError:
+                    pass
+
+        if not dt:
+            dt = datetime.now()
 
         self.man_date = dt.strftime("%B %Y")
 
-- 
2.49.0

