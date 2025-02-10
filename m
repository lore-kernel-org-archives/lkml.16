Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CEB21DDC3F;
	Mon, 10 Feb 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=DC5XrgXcKoJE1FpTO1oflpDeXh5dVdTtj8Qa68I1WkK1Z6qyE/RZu2l50bY8sYqZBeYpb5ayXKXiEUuuHSXcXmxcLnzlUqyFjuRVKQc7jLO7jdAB8IK9Uzh1z0K9rm3QugrQll7lXMNYdRIsJO8mgOACmPDz7AebOSFn14J8/mc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=W0QttvocLbg9MNZjjCOsNJWUuoYSXbcWqR4OJBpGkhQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OGJoA9uis7TQhEkzO3sRjSaPQqE4KiotP8WWpeIOSCGPVTzepUWlLHt+qluQE2VaVkAgX6MaQkgo03qWQ44V8ktPwFSAPvdLOOk2Iie628/V6lMWDexBb8xRYD9lmaLR2aTWkVDUtDZKYBAnuIzMvDx0dcae9KGQa/yNPnzzABM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mhUZnr96; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mhUZnr96"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47B5DC16AAE;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=W0QttvocLbg9MNZjjCOsNJWUuoYSXbcWqR4OJBpGkhQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=mhUZnr96S+xMDkzTvbHS2MbxPqMZVlejlkMMudpueCt5lRYcTJpEmYh1mGIjtXPTh
	 6SXzVCOFRgSWBQyEWLllz+1/BqvG40WWETuW1hpTzo5nXWjtUACVU/Gf6x149UZjKX
	 hrDWk3tTK19ptCy2pNF5l3NjDLpskjswGbzZfEj+G2ucOp8bMxz/IJrkKMwmqfh7PA
	 eDgUS8bkPyzvKp4imevNBN1ua57b6uB9RfRa67Z1UqhKSYwZo88/V7w6HMmMRInIDg
	 xIiC3yfnZoOSwKCdhNzUVmIu1bQsckGSNHBXjYB31uTCLqZ/BmRREs1zEvTiuX1dZH
	 12W2YtGbXRt8A==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006Cjc-1wlv;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 23/27] docs: sphinx/kernel_abi: avoid warnings during Sphinx module init
Date: Mon, 10 Feb 2025 11:18:12 +0100
Message-ID: <b0e79dc60d556e3b39fa6774d3b7bf734b73f352.1739182025.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1739182025.git.mchehab+huawei@kernel.org>
References: <cover.1739182025.git.mchehab+huawei@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

Sphinx logging system doesn't like warnings during module load,
as it understands that such logs are produced at the wrong time:

	WARNING: while setting up extension automarkup: /sys/devices/system/cpu/cpuX/topology/physical_package_id is defined 2 times: /new_devel/v4l/docs/Documentation/ABI/stable/sysfs-devices-system-cpu:27; /new_devel/v4l/docs/Documentation/ABI/testing/sysfs-devices-system-cpu:70
	WARNING: while setting up extension automarkup: /sys/devices/system/cpu/cpuX/topology/ppin is defined 2 times: /new_devel/v4l/docs/Documentation/ABI/stable/sysfs-devices-system-cpu:89; /new_devel/v4l/docs/Documentation/ABI/testing/sysfs-devices-system-cpu:70

So, use a function to allocate/process ABI files and use it to
be called at kernel_abi.py, as automarkup also needs it to
produce the right cross-references.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/sphinx/automarkup.py |  4 +++-
 Documentation/sphinx/kernel_abi.py | 23 +++++++++++++++++++----
 2 files changed, 22 insertions(+), 5 deletions(-)

diff --git a/Documentation/sphinx/automarkup.py b/Documentation/sphinx/automarkup.py
index 7d91c39b4ca6..22defc18d6d2 100644
--- a/Documentation/sphinx/automarkup.py
+++ b/Documentation/sphinx/automarkup.py
@@ -11,7 +11,7 @@ from sphinx.errors import NoUri
 import re
 from itertools import chain
 
-from kernel_abi import kernel_abi
+from kernel_abi import get_kernel_abi
 
 #
 # Python 2 lacks re.ASCII...
@@ -287,6 +287,8 @@ def markup_abi_ref(docname, app, match):
     #
     # Go through the dance of getting an xref out of the std domain
     #
+    kernel_abi = get_kernel_abi()
+
     fname = match.group(1)
     target = kernel_abi.xref(fname)
 
diff --git a/Documentation/sphinx/kernel_abi.py b/Documentation/sphinx/kernel_abi.py
index 964f586de171..e017b0299953 100644
--- a/Documentation/sphinx/kernel_abi.py
+++ b/Documentation/sphinx/kernel_abi.py
@@ -52,10 +52,23 @@ __version__ = "1.0"
 logger = logging.getLogger('kernel_abi')
 path = os.path.join(srctree, "Documentation/ABI")
 
-# Parse ABI symbols only once
-kernel_abi = AbiParser(path, logger=logger)
-kernel_abi.parse_abi()
-kernel_abi.check_issues()
+_kernel_abi = None
+
+def get_kernel_abi():
+    u"""
+    Initialize kernel_abi global var, if not initialized yet.
+
+    This is needed to avoid warnings during Sphinx module initialization.
+    """
+    global _kernel_abi
+
+    if not _kernel_abi:
+        # Parse ABI symbols only once
+        _kernel_abi = AbiParser(path, logger=logger)
+        _kernel_abi.parse_abi()
+        _kernel_abi.check_issues()
+
+    return _kernel_abi
 
 def setup(app):
 
@@ -83,6 +96,8 @@ class KernelCmd(Directive):
     }
 
     def run(self):
+        kernel_abi = get_kernel_abi()
+
         doc = self.state.document
         if not doc.settings.file_insertion_enabled:
             raise self.warning("docutils: file insertion disabled")
-- 
2.48.1

