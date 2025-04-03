Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B71E2161320
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 11:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743679634; cv=none; b=uDWkHQvVEKcaFylQhH5XRdzFs7klfMWVSk+w6oflvDaCCgUna9+Zb+UPTlpnLymam20822dsXaF/KvZa8ow96fGIn4Ckn/Fl3MJv7s5tG9Yc6SD4B7Ps1r+vPyDzWbboj442YgoCAbrwfqlBhBY+AgK4UbpvJvG4NeE6sxggfOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743679634; c=relaxed/simple;
	bh=2gJ9YMvADs+Ckr8MjvuYDoJfEHRTKTBwC7wmPSCp1EI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BqizwJxX5/ZavQR+e2Mfq4/81oxvEzAVdgAg0M7syNduEEqvtVBIe3+bizS/v7jCDvJ/HsaNREWMv0WKoNufVidGsb5G8QXyMh3iKKxG9GB67cmolE+2FpLQnkRvjyxvqpfH0yVzFH1z+iVRVtGUlAkL+1X1OX16ao39d4HsESw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=I73Gcbmw; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="I73Gcbmw"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-af579e46b5dso517165a12.3
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 04:27:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743679632; x=1744284432; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=8CiqmOnUNPKkUQrs/FCsSX+P5TPxGAsS5AllkVPo2fs=;
        b=I73GcbmwiOFmIYmZXd8vf4zvtZ2h0BE0VIU1lFMmhGKosxdf0FJ9ha6S3Kgy0oJpeD
         RfzcLLC0W3aeYYmIXl4Apy8d1dv5X2mAPixQZbiJ9WUJRg6XpFm/XzmFLFactLHO6O0x
         3AexIJCNMWfIv5i4cF+A9GKAvKihgA9UZTP6+GbA0GKeYivjCWX6GnnamQBvqFT5Y6c1
         runYzAjusi7bFvtXCodoYc6Sg8sTaRHOwhGjdpyElwDEPqyzQPWsFtWDnkdJIvawAVUq
         L7/1+s5n488RMhVUNH9cSLRKRYMV7JaDk/Bj/2RUKIharO82zF36gdFSQIyM1hhe4/gk
         FcYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743679632; x=1744284432;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8CiqmOnUNPKkUQrs/FCsSX+P5TPxGAsS5AllkVPo2fs=;
        b=iAX467QjBrmYNceVIBq4q5cIgYISOwmNO1kfExO0FfElIn4kFB1R0zl2Eo+JVq58I7
         dad6IiIgc8OwXM0EOVRDmSSwlT8c8TBDXeC6NRczd5JHf3AH9Akq8aJSMIDvP5IeQgQ+
         FZJAOzpHO69RWG2jbSB0iDIDlvNxpYkeLrplV/BMbuX5CLM7Ep+AKK3aRR56913oKtfY
         iF+Bx8ORzM85hnSFvSRcBb3AYn3Sizn9M3cScY3xiHSA78i7EAhBbhN6B9inkYEddw+T
         dPSbgiy6ykxz35cWFdzoKDpjqNIuzXL6FSDCr2Hyb77bYUmNNHJf9t6yaA1VtM3P1OE4
         Cw4g==
X-Gm-Message-State: AOJu0Yyu4x/oS03ft/PtTEa0d+UWtOVgov5AHqUlM1cSvnQAMfx5PvWj
	5NnRWBrpVz2iQPlYSmDyG1jy/oGHyWpvub9/TOhlIqh9RjC+9VWA
X-Gm-Gg: ASbGncu+xsrRhfeTbyORyrmjSxO0lx0TgpyLwHkJ7/+CC/LSHFG8bDILyIO0UQxWVGD
	LLZrdcXIldvBplkk0aZ+N59fi0XeOYe+TAgNSdv5gLUPe5385RIPircqxyOXXgyv/Rw5865D8Ro
	ad8oBBQ0NlNuGKxrwRPBOq6FP37aU75Bv0fKF6FfHhPh+q9Oyjs0vRvHI8fH92IczKx0+L/30ED
	RqXnVISS+db9fyvVft2N+6gA30whDUcaf1peWaRXfvrZX6io8UY7m5lSJtnGlk3wk+cbGk5nCzX
	90cvMTCD23xbcSJJv6UW14VarvPx/WR8eOqrWZ1mJdCNkl5ya7FPiwwZ6rw83zKoeq8n810L5wA
	mixn63n1n3hLl9xydQ+NV3OUNDR0In0+3JNU5vw==
X-Google-Smtp-Source: AGHT+IFqVMlM1m6lHGf9510XeU/c7RvU/k4qiI4dOuF9xl9mJ/NjNz6rztoXeWoPSDCnYRLuJbvdXQ==
X-Received: by 2002:a17:90b:1b09:b0:2ef:67c2:4030 with SMTP id 98e67ed59e1d1-30532146ef2mr30265539a91.27.1743679631779;
        Thu, 03 Apr 2025 04:27:11 -0700 (PDT)
Received: from rota1001.localdomain (118-171-71-10.dynamic-ip.hinet.net. [118.171.71.10])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-305983b9954sm1206097a91.32.2025.04.03.04.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 04:27:11 -0700 (PDT)
From: Chisheng Chen <johnny1001s000602@gmail.com>
To: akpm@linux-foundation.org
Cc: linux-kernel@vger.kernel.org,
	Chisheng Chen <johnny1001s000602@gmail.com>
Subject: [PATCH] lib/rbtree.c: Fix the example typo
Date: Thu,  3 Apr 2025 19:26:14 +0800
Message-ID: <20250403112614.570140-1-johnny1001s000602@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace `sr` with `Sr`. The condition `!tmp1 || rb_is_black(tmp1)`
ensures that `tmp1` (which is `sibling->rb_right`) is either NULL
or a black node. Therefore, the right child of the sibling must be
black, and the example should use `Sr` instead of `sr`.

Signed-off-by: Chisheng Chen <johnny1001s000602@gmail.com>
---
Commit cedb08caac58 ("lib/rbtree.c: fix the example typo") stated
that the example was incorrect if `sl` and `N` did not have child
nodes, and it changed `Sr` to `sr`. However, after further review,
I do not see this issue.

 lib/rbtree.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/lib/rbtree.c b/lib/rbtree.c
index 989c2d615f92..5114eda6309c 100644
--- a/lib/rbtree.c
+++ b/lib/rbtree.c
@@ -297,9 +297,9 @@ ____rb_erase_color(struct rb_node *parent, struct rb_root *root,
 				 *   / \           / \
 				 *  N   S    -->  N   sl
 				 *     / \             \
-				 *    sl  sr            S
+				 *    sl  Sr            S
 				 *                       \
-				 *                        sr
+				 *                        Sr
 				 *
 				 * Note: p might be red, and then both
 				 * p and sl are red after rotation(which
@@ -312,9 +312,9 @@ ____rb_erase_color(struct rb_node *parent, struct rb_root *root,
 				 *   / \            /  \
 				 *  N   sl   -->   P    S
 				 *       \        /      \
-				 *        S      N        sr
+				 *        S      N        Sr
 				 *         \
-				 *          sr
+				 *          Sr
 				 */
 				tmp1 = tmp2->rb_right;
 				WRITE_ONCE(sibling->rb_left, tmp1);
-- 
2.43.0

