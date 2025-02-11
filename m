Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 606E41E572A;
	Tue, 11 Feb 2025 05:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739253498; cv=none; b=a1iwteXazUv10tgzo9n/EQotDP0rW6KcMchM+sz1ZX3WfedAnZPkmmbZfIZt1ZvwJTIExAdsZCKAoEp94Gxt5Cucx9JHYyBjimZXw3rIphI3qXn+BQAtHqagjxjmzMwGBMgV5svJmd+IwrjVKROPZ3jU2QMYs0/AFI/+8/RuLMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739253498; c=relaxed/simple;
	bh=zESpSya/KHOvmLeP/TIy+0ZzFfF/8LJJyism1Wvc6m8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=n1NWwaXunfmzRCbyZ9wJXJN/B2swQeuhf9qgxcqb7eoXq+ogy2wSZY5YrT4N3V1qrwTAoREQ0dcEV05LMoeS3tajL3uvTDH9ZFaYcBJpM/rF4tcVOQPJc/koSQubk7V7/0f970qt/GmLB19h3XQmzFahob4IsMykTZtDJgPdbVg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HyARReJi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HyARReJi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF696C4CEDD;
	Tue, 11 Feb 2025 05:58:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739253496;
	bh=zESpSya/KHOvmLeP/TIy+0ZzFfF/8LJJyism1Wvc6m8=;
	h=From:To:Cc:Subject:Date:From;
	b=HyARReJinzbcNTwDTghFfwo/G9ZUGOpAdEuvnYoBZLbqv4v0F2U6T7+TRl7SpWkXE
	 0khCoDcL12bx/JeXAZDDb6S9/lgWBQlD37d4DujHqTGi/GrZ3e23jFlrk7Zk0lC9/c
	 puzNYW7tLKVjEH/6qrIuowFHPA4UnZWRkzShU4deU4D1usP2VU/UY7gw2CayWbi8UU
	 rhMgVWs/ijiG+NVb8pSG/N/2Gn/um8YeKGi12AGSDgK5zjI+pw1eOfsmZIsS7lg726
	 g1MydJNh2NliA25a6DY4qrs51lFfj9+24FSVqrKtszJZRdIJXPXAPjs5fvKhSO3RA1
	 +sisV+DVgb/lA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thjHi-00000007yRN-3Clp;
	Tue, 11 Feb 2025 06:58:14 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] docs: ABI: move README contents to the top
Date: Tue, 11 Feb 2025 06:57:57 +0100
Message-ID: <20250211055809.1898623-1-mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

The ABI documentation looks a little bit better if it starts
with the contents of the README is placed at the beginning.

Move it to the beginning of the ABI chapter. While here, improve
the README text and change the title that will be shown at the
html/pdf output to be coherent with both ABI file contents and
with the generated documentation output.

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/README                      | 3 ++-
 Documentation/admin-guide/abi-readme-file.rst | 6 ------
 Documentation/admin-guide/abi.rst             | 3 ++-
 scripts/lib/abi/abi_parser.py                 | 2 +-
 4 files changed, 5 insertions(+), 9 deletions(-)
 delete mode 100644 Documentation/admin-guide/abi-readme-file.rst

diff --git a/Documentation/ABI/README b/Documentation/ABI/README
index 8bac9cb09a6d..ef0e6d11e919 100644
--- a/Documentation/ABI/README
+++ b/Documentation/ABI/README
@@ -1,4 +1,5 @@
-This directory attempts to document the ABI between the Linux kernel and
+This part of the documentation inside Documentation/ABI directory
+attempts to document the ABI between the Linux kernel and
 userspace, and the relative stability of these interfaces.  Due to the
 everchanging nature of Linux, and the differing maturity levels, these
 interfaces should be used by userspace programs in different ways.
diff --git a/Documentation/admin-guide/abi-readme-file.rst b/Documentation/admin-guide/abi-readme-file.rst
deleted file mode 100644
index 6172e4ccbda2..000000000000
--- a/Documentation/admin-guide/abi-readme-file.rst
+++ /dev/null
@@ -1,6 +0,0 @@
-.. SPDX-License-Identifier: GPL-2.0
-
-ABI README
-==========
-
-.. kernel-abi:: README
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
index 15a2dcb1388c..c6039359e585 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -4,6 +4,8 @@
 Linux ABI description
 =====================
 
+.. kernel-abi:: README
+
 ABI symbols
 -----------
 
@@ -21,7 +23,6 @@ ABI files
 .. toctree::
    :maxdepth: 2
 
-   abi-readme-file
    abi-stable-files
    abi-testing-files
    abi-obsolete-files
diff --git a/scripts/lib/abi/abi_parser.py b/scripts/lib/abi/abi_parser.py
index 76b3d8ff867e..3055a4f34bb7 100644
--- a/scripts/lib/abi/abi_parser.py
+++ b/scripts/lib/abi/abi_parser.py
@@ -265,7 +265,7 @@ class AbiParser:
     def parse_readme(self, nametag, fname):
         """Parse ABI README file"""
 
-        nametag["what"] = ["ABI file contents"]
+        nametag["what"] = ["Introduction"]
         nametag["path"] = "README"
         with open(fname, "r", encoding="utf8", errors="backslashreplace") as fp:
             for line in fp:
-- 
2.48.1

