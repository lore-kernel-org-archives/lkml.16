Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BABF1E480;
	Wed, 14 May 2025 05:27:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747200474; cv=none; b=nLn2BctyAflmb7pA2MmvPNyEnXiF0TsUw+P4pROXqI+6429yS5XI1oeLLJ1bBEirpG66+6OVW8IIlOYVS86qv8rJ8BlzE/bdf55AaCj6Sw3WgABYQxgcnrg9MzpKsMhF0DbY9pUk2o/V4s6rvTczyynsfr6a4XglVDXJ6nGe3Is=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747200474; c=relaxed/simple;
	bh=CuW7ibJLB9CxiUYG/VNkyYbx7vVID58oJk/i+wtBdkY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HEk/g/3Jx1UHTtiCO2L1ya/wVgNBOVw7WOk6b4QeHN7JmSs90u1TXhVUMSvuyGfLPJyk6Og2FdpGsESHLNhfgtFjXaYq7ezNDdaquSiFgC5bpEvCKaCCaeRo21FzS+mYoJ7SWRMRTprP4l/c0eXTG8EXLql0z4O/NK6qcPGwq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a7H4nRoi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a7H4nRoi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9DE6C4CEEB;
	Wed, 14 May 2025 05:27:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747200474;
	bh=CuW7ibJLB9CxiUYG/VNkyYbx7vVID58oJk/i+wtBdkY=;
	h=From:To:Cc:Subject:Date:From;
	b=a7H4nRoi2pujTi7mMr1VYRpdeg9koIypJlb+B7xrrKkMLOOUQj3GtO92uEgHqiXLc
	 XmSL/UwqV4TE8pgI82ev1DVFf2miJTuxnbln30eNd+Rc7FCYIYlM6Y1+U6e0Q2x3Ll
	 yfKm0c8QVjov7eOD7MduWTOY4PMPeQ89Y/jQTHDZF6Dgmkg+QCda9f2JcA9in+qLkp
	 NZwQmuDHIn3diOe0vULgemBQA+CzY/Ow0fkvsV3KJHYxSYeGRR2MNum9LnEqD2CZbI
	 KxFAfBztKIkcwG2O7+MuCFKeuRcujkh4A+J7+FBsEd72v5GT7eCKv8jmSUhchbc6FH
	 w0Vv6M/Zp8Ehw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ard Biesheuvel <ardb@kernel.org>,
	linux-spdx@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>
Subject: [PATCH] lib/crc32: add SPDX license identifier
Date: Tue, 13 May 2025 22:24:09 -0700
Message-ID: <20250514052409.194822-1-ebiggers@kernel.org>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Eric Biggers <ebiggers@google.com>

lib/crc32.c and include/linux/crc32.h got missed by the bulk SPDX
conversion because of the nonstandard explanation of the license.
However, crc32.c clearly states that it's licensed under the GNU General
Public License, Version 2.  And the comment in crc32.h clearly indicates
that it's meant to have the same license as crc32.c.  Therefore, apply
SPDX-License-Identifier: GPL-2.0-only to both files.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 include/linux/crc32.h | 5 +----
 lib/crc32.c           | 4 +---
 2 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/include/linux/crc32.h b/include/linux/crc32.h
index 69c2e8bb37829..569dc13f139fc 100644
--- a/include/linux/crc32.h
+++ b/include/linux/crc32.h
@@ -1,9 +1,6 @@
-/*
- * crc32.h
- * See linux/lib/crc32.c for license and changes
- */
+/* SPDX-License-Identifier: GPL-2.0-only */
 #ifndef _LINUX_CRC32_H
 #define _LINUX_CRC32_H
 
 #include <linux/types.h>
 #include <linux/bitrev.h>
diff --git a/lib/crc32.c b/lib/crc32.c
index fddd424ff2245..e690026f44f7a 100644
--- a/lib/crc32.c
+++ b/lib/crc32.c
@@ -1,5 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0-only
 /*
  * Aug 8, 2011 Bob Pearson with help from Joakim Tjernlund and George Spelvin
  * cleaned up code to current version of sparse and added the slicing-by-8
  * algorithm to the closely similar existing slicing-by-4 algorithm.
  *
@@ -17,13 +18,10 @@
  * seed as an argument, and doesn't xor at the end.  Then individual
  * users can do whatever they need.
  *   drivers/net/smc9194.c uses seed ~0, doesn't xor with ~0.
  *   fs/jffs2 uses seed 0, doesn't xor with ~0.
  *   fs/partitions/efi.c uses seed ~0, xor's with ~0.
- *
- * This source code is licensed under the GNU General Public License,
- * Version 2.  See the file COPYING for more details.
  */
 
 /* see: Documentation/staging/crc32.rst for a description of algorithms */
 
 #include <linux/crc32.h>

base-commit: 3937f6db6e932c560a0f9ee2cd2a4fdcc314dadf
-- 
2.49.0

