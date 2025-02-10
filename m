Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150EA1D5CE8;
	Mon, 10 Feb 2025 10:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739182705; cv=none; b=VSe50Kj5rBhcjRyhIfKRKopqgjVKV68Ob4IKBzOuDzUuUIhfPGYQ0TVwgvlc4TRxTLxkCh0MZN0BIWDmv1aiTlbsn+FQHsqglgC8+tMnvGhLLEdRv7TIPiivcNgNG+t2vb73Qvf4lHGRkj7f7aJemrnYWf49qb/lJ7sXV0aNHO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739182705; c=relaxed/simple;
	bh=5Ehk+UnXsY+f4nC8KlN3P04pRtl7e+QgRfiunel5DWg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EXkeOOziBPdgN5w/gZq0ckSevCY5ddGq6LAcEP9k3qfwW+eGOwJ/42gDZmSfGk8XnisNpMalNnURGAsbTf8ll+MADaDQO9CbmeXa4rJscf4xJnsm56cZvAdOj2jkVpMIYVZz3OsSCnfOwTWH8XiffVaRHGrwvdRCnqJWQBIgL0I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOB2SwnE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOB2SwnE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E829C116D0;
	Mon, 10 Feb 2025 10:18:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739182704;
	bh=5Ehk+UnXsY+f4nC8KlN3P04pRtl7e+QgRfiunel5DWg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=JOB2SwnEwLEat9BCdCQ8eJtn2FdkoUJfMDpEMoohH34xD34BjnamPjqmgBlDcWt98
	 prp8/UxdPNnmXBLmLb6x8arPl2Hze3U777bjN/nUdU9xd+1xqRxQpGFN7LEYIeFb8F
	 tzZwmjj2eWVehRDGp5ODZL+PJrvRBAyWCE79LbvL8P2TIKHVKRzFxZpKWgE99YIHIw
	 0ns9HKVw/Y1KyPH4co5CDxJ+OpNEWKomsjj7ElFbQzRtVPCccls+r/Oz2m4x/pKYC5
	 vlmkt2UlcclHvSBkPNIDQomkIq98qtPIkqD7blIqbTWxWHHi7pev4xcgVvrZESq9tI
	 iEfsO0+170dUA==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thQru-00000006CjU-1jh5;
	Mon, 10 Feb 2025 11:18:22 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	"Jonathan Corbet" <corbet@lwn.net>,
	"Mauro Carvalho Chehab" <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 21/27] docs: admin-guide/abi: split files from symbols
Date: Mon, 10 Feb 2025 11:18:10 +0100
Message-ID: <30e3cf2a8aeef23ca889de60a90f7de141e0dc0e.1739182025.git.mchehab+huawei@kernel.org>
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

Now that get_abi has gained support for filtering its output,
split ABI symbols from files at the html output.

That makes pages smaller and easier to navigate.

As an additional bonus, as it will paralelize files handling,
it gives an additional performance improvement.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/admin-guide/abi-obsolete-files.rst |  7 +++++++
 Documentation/admin-guide/abi-obsolete.rst       |  1 +
 Documentation/admin-guide/abi-readme-file.rst    |  6 ++++++
 Documentation/admin-guide/abi-removed-files.rst  |  7 +++++++
 Documentation/admin-guide/abi-removed.rst        |  1 +
 Documentation/admin-guide/abi-stable-files.rst   |  7 +++++++
 Documentation/admin-guide/abi-stable.rst         |  1 +
 Documentation/admin-guide/abi-testing-files.rst  |  7 +++++++
 Documentation/admin-guide/abi-testing.rst        |  1 +
 Documentation/admin-guide/abi.rst                | 15 +++++++++++++++
 10 files changed, 53 insertions(+)
 create mode 100644 Documentation/admin-guide/abi-obsolete-files.rst
 create mode 100644 Documentation/admin-guide/abi-readme-file.rst
 create mode 100644 Documentation/admin-guide/abi-removed-files.rst
 create mode 100644 Documentation/admin-guide/abi-stable-files.rst
 create mode 100644 Documentation/admin-guide/abi-testing-files.rst

diff --git a/Documentation/admin-guide/abi-obsolete-files.rst b/Documentation/admin-guide/abi-obsolete-files.rst
new file mode 100644
index 000000000000..3061a916b4b5
--- /dev/null
+++ b/Documentation/admin-guide/abi-obsolete-files.rst
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Obsolete ABI Files
+==================
+
+.. kernel-abi:: obsolete
+   :no-symbols:
diff --git a/Documentation/admin-guide/abi-obsolete.rst b/Documentation/admin-guide/abi-obsolete.rst
index bdef91d2cea4..640f3903e847 100644
--- a/Documentation/admin-guide/abi-obsolete.rst
+++ b/Documentation/admin-guide/abi-obsolete.rst
@@ -10,3 +10,4 @@ The description of the interface will document the reason why it is
 obsolete and when it can be expected to be removed.
 
 .. kernel-abi:: obsolete
+   :no-files:
diff --git a/Documentation/admin-guide/abi-readme-file.rst b/Documentation/admin-guide/abi-readme-file.rst
new file mode 100644
index 000000000000..6172e4ccbda2
--- /dev/null
+++ b/Documentation/admin-guide/abi-readme-file.rst
@@ -0,0 +1,6 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+ABI README
+==========
+
+.. kernel-abi:: README
diff --git a/Documentation/admin-guide/abi-removed-files.rst b/Documentation/admin-guide/abi-removed-files.rst
new file mode 100644
index 000000000000..f1bdfadd2ec4
--- /dev/null
+++ b/Documentation/admin-guide/abi-removed-files.rst
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Removed ABI Files
+=================
+
+.. kernel-abi:: removed
+   :no-symbols:
diff --git a/Documentation/admin-guide/abi-removed.rst b/Documentation/admin-guide/abi-removed.rst
index bea0608b8442..88832d3eacd6 100644
--- a/Documentation/admin-guide/abi-removed.rst
+++ b/Documentation/admin-guide/abi-removed.rst
@@ -4,3 +4,4 @@ ABI removed symbols
 ===================
 
 .. kernel-abi:: removed
+   :no-files:
diff --git a/Documentation/admin-guide/abi-stable-files.rst b/Documentation/admin-guide/abi-stable-files.rst
new file mode 100644
index 000000000000..f867738fc178
--- /dev/null
+++ b/Documentation/admin-guide/abi-stable-files.rst
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Stable ABI Files
+================
+
+.. kernel-abi:: stable
+   :no-symbols:
diff --git a/Documentation/admin-guide/abi-stable.rst b/Documentation/admin-guide/abi-stable.rst
index 33637c0d4fd5..528c68401f4b 100644
--- a/Documentation/admin-guide/abi-stable.rst
+++ b/Documentation/admin-guide/abi-stable.rst
@@ -13,3 +13,4 @@ Most interfaces (like syscalls) are expected to never change and always
 be available.
 
 .. kernel-abi:: stable
+   :no-files:
diff --git a/Documentation/admin-guide/abi-testing-files.rst b/Documentation/admin-guide/abi-testing-files.rst
new file mode 100644
index 000000000000..1da868e42fdb
--- /dev/null
+++ b/Documentation/admin-guide/abi-testing-files.rst
@@ -0,0 +1,7 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+Testing ABI Files
+=================
+
+.. kernel-abi:: testing
+   :no-symbols:
diff --git a/Documentation/admin-guide/abi-testing.rst b/Documentation/admin-guide/abi-testing.rst
index 55054985a8ff..6153ebd38e2d 100644
--- a/Documentation/admin-guide/abi-testing.rst
+++ b/Documentation/admin-guide/abi-testing.rst
@@ -19,3 +19,4 @@ name to the description of these interfaces, so that the kernel
 developers can easily notify them if any changes occur.
 
 .. kernel-abi:: testing
+   :no-files:
diff --git a/Documentation/admin-guide/abi.rst b/Documentation/admin-guide/abi.rst
index 64e772bde943..15a2dcb1388c 100644
--- a/Documentation/admin-guide/abi.rst
+++ b/Documentation/admin-guide/abi.rst
@@ -4,6 +4,9 @@
 Linux ABI description
 =====================
 
+ABI symbols
+-----------
+
 .. toctree::
    :maxdepth: 2
 
@@ -11,3 +14,15 @@ Linux ABI description
    abi-testing
    abi-obsolete
    abi-removed
+
+ABI files
+---------
+
+.. toctree::
+   :maxdepth: 2
+
+   abi-readme-file
+   abi-stable-files
+   abi-testing-files
+   abi-obsolete-files
+   abi-removed-files
-- 
2.48.1

