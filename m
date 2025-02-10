Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6D9D264602;
	Mon, 10 Feb 2025 20:44:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739220260; cv=none; b=QfcFDgrJwplWOyZNQAmDz9PoKIz3fN+8hsnm/RSzy/KRqQg0fPeNXf+aOaHBnHBSZSDcRK8Diu5/jdJCGR+enws3v2tl7oAV/pBj0NXuLYkZcUPyXsYVXIyrRXvL6IjAlyf+T0qRXcoGqRq6SS9OiIG6jqkz6F80H2OGv0jKt2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739220260; c=relaxed/simple;
	bh=GYYg29N2M0qozRhEXhp7yi/83WQc6oszYAElFpy7uHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tmvGxfaXlWpJStVxfyn+T1E4zf6M05INiPnj5iq7/jGndqz/uoqjORxiC0Gt+G8GqOwvxtV0f64YfwoE0n/Vj7ck6msndmInt1x4KEuU6nSc7hJvCp4358fdkKYKCicjsSPLpv4MHryZ4AO36WPeqmUKwMjYgLaXN/72jZMV21Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GSRNYJYV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GSRNYJYV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1EA70C4CED1;
	Mon, 10 Feb 2025 20:44:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739220260;
	bh=GYYg29N2M0qozRhEXhp7yi/83WQc6oszYAElFpy7uHY=;
	h=From:To:Cc:Subject:Date:From;
	b=GSRNYJYVMG1DHiJ877VvjKwKlVjz7uBJyrlRAqcmlPrsidAvWglfinZib/USic9uC
	 Exa2ba93Q69fZbwyv3lC7WVYPXtUbeL0GizO5xsA82WyGY61Gf3MTsqXpmJefFSZ7B
	 nrydwfQuL+gFLmRIIvwn8tkXiAAxX9k/hmZTL30jP4kT5kBU1INqW/brkp3Tda7Mtl
	 DajJ5p3K1nKCWkZoSV3SvxkRRU0zlpu3kKzp9TyzgxsQyLZKVgS6gd2ZUTOSwfiC9K
	 zGaYWjWGPtkUVjOu/b1iPHGkaswY+8qXoD6oDZ7XIixM9LXkAeFcimsMQAGONU69gS
	 fcw8TTvVJpjlQ==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
	(envelope-from <mchehab+huawei@kernel.org>)
	id 1thadd-00000006Pwj-3u0c;
	Mon, 10 Feb 2025 21:44:17 +0100
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: Jonathan Corbet <corbet@lwn.net>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Linux Doc Mailing List <linux-doc@vger.kernel.org>,
	Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH] docs: ABI: move README contents to the top
Date: Mon, 10 Feb 2025 21:43:28 +0100
Message-ID: <20250210204416.1529671-1-mchehab+huawei@kernel.org>
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

Suggested-by: Jonathan Corbet <corbet@lwn.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/README                      | 3 ++-
 Documentation/admin-guide/abi-readme-file.rst | 6 ------
 Documentation/admin-guide/abi.rst             | 3 ++-
 3 files changed, 4 insertions(+), 8 deletions(-)
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
-- 
2.48.1

