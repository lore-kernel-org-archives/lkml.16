Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C48461CAA86;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182704; cv=none; b=uzuF8nJBe+1IHz1ZC3xxOfk8PpiUGibAglYCHuEm7XIye7otQ2bXA076S8V7sUzkptaHuytvK7UtYDbdaUbqUVCCcEM2RgvzxWmkMWc/1rWiWNGWh/CfZ+RFKbKUyif/waoSfdWyF0+z39P2S5E3Lomm19trRdwJXGMdJvGHtqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182704; c=relaxed/simple;
	bh=IFfJ6jqxdTobj9ECUn0r6qKV42rp7aK/OvTRbD8u8YE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=noFJlVXIayFzcmTdOwltPAaTBHdw+eW7104M3Wd9YttStC0nIcE5Y1buMwYfafrjcez9DinEBp8rshbgMsFkeyaNrleds9h0UmR0Fr1J37BoS22Gsh1oxhxULM6hsiecX5Dwyhi3FLu67PFltiWuuMVbuG28Bv2uTjQ2H7F0j8I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rdzypHRA; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rdzypHRA"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3586C4CEED;
	Mon, 10 Feb 2025 10:18:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=IFfJ6jqxdTobj9ECUn0r6qKV42rp7aK/OvTRbD8u8YE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=rdzypHRAXrS/ucSvlHVj2dy1C/7ki2pi+g4AxaC7uSp9LQ5BE1T2X7pvImYl2S2Iz
	 igCSRPGzVTaUz+F+PM+3nBBZN0SOWG6fKDKka3c1PWX+FIZEVHpzK3IO6mQV5vW33z
	 KCnVtJEw4vdy2FvCJLkoVQNHZujmY3li+TmO/Je/DBTQrpql5D2G7V7VQxeVQQ3b4w
	 vjlu8IV9FsZMJJE95VJ9FgTWm3ZoS2N3VBQGxCVevB3xhFW+epQu1QV5L/NicGKJBr
	 PXKiu+YvX5QGJ5RBkTkmDK2ehF1/FIxVxGeD3R0s+GXhfHbsX49lI2sFbCnq7XQja1
	 fvyIO3VSlyVAA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQrt-00000006CiK-3wTB;
	Mon, 10 Feb 2025 11:18:21 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 03/27] docs: admin-guide: abi: add SPDX tags to ABI files
Date: Mon, 10 Feb 2025 11:17:52 +0100
Message-ID: <8c7bfe676e7349ea2d1930bf918d54e27d15ae9e.1739182025.git.mchehab+huawei@kernel.org>
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

Such files are missing SPDX tags containing the licensing information.

Add them.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete.rst | 2 ++
 Documentation/admin-guide/abi-removed.rst  | 2 ++
 Documentation/admin-guide/abi-stable.rst   | 2 ++
 Documentation/admin-guide/abi-testing.rst  | 2 ++
 Documentation/admin-guide/abi.rst          | 2 ++
 5 files changed, 10 insertions(+)

diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index 594e697aa1b2..b655615917f1 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI obsolete symbols
 ====================
 
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index f9e000c81828..ba941c1af178 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI removed symbols
 ===================
 
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index fc3361d847b1..5d738f345333 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI stable symbols
 ==================
 
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index 19767926b344..a867e6578bf7 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 ABI testing symbols
 ===================
 
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
index bcab3ef2597c..64e772bde943 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -1,3 +1,5 @@
+.. SPDX-License-Identifier: GPL-2.0
+
 =====================
 Linux ABI description
 =====================
-- 
2.48.1

