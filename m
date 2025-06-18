Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63E7B237708;
	Fri, 20 Jun 2025 14:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750429548; cv=none; b=J2nl4+Ojt0UQ88DnCWPkrOKtGlPe7kDjHT8f77ThK+0TkGrkfzREX5/5OgqxUH/YG4PMG7W6AFK6yuZL3efboYnU4UBzoNykbAMzdFrfJRlaHBBMWSMWMzFfQZnBxiYv7/CS37j32uslfkTwE6BwP4quii4brBzvJyW5QARoxG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750429548; c=relaxed/simple;
	bh=7jyi2aExXsCpMgjGTB3Gp6G2Viuvd7hBtvNjogcC6oo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=nwuEcGzl9tHHo2WpcGyuJsIOITcZEe3n5AzndZpXWBgFC5GtvqW+V4kPi1wfPP5jU3OAPYJLix/TIP1hEiFQPFjOLTb3fH3zhtA8fvfzK1fOwvVdTrRoLdYWUEIhxnhDHeeoy34Q7XMl5H9mASBddxHTnZcoQ4Ski33/b025tYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PkSQ8SJS; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PkSQ8SJS"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-235ef62066eso24798105ad.3;
        Fri, 20 Jun 2025 07:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750429547; x=1751034347; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mt0UxcsIQbrh7erVicbBBO1vqCNvobmzw4o72dRhMOc=;
        b=PkSQ8SJSGdRtPDq3+Pf/sHMWo8B87EL2UT52FD6BL/AgAfi3yh+yFgQdXvsz1D8BZU
         0DEfdwTwxrBfK6rHKduvTJwfC3g50sPvaX2iDDWmusM06gvB2MhEl1tw8Re6pX4R70j/
         X9M01yEnday6UCfJ2v2cZSl1O2hY9sVRnzdFbhfCWQicE3OULOwxrSPWXfZMaHFcL19e
         NyBEs2Uat2cBrUZ8zdJa/JrAKvDFqfKs4tPBD4zEenhVuZb6o9Q9CLyUhZU2/ISjxmPN
         283pqTgQ7moEjSmz4+QbSErSEtQ92W/1vOcvjvBSBc0+bt0m5BDybGLcPgDxVh+MEidA
         76aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750429547; x=1751034347;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mt0UxcsIQbrh7erVicbBBO1vqCNvobmzw4o72dRhMOc=;
        b=inmFBciLL4y2OWD2NqsYpthKVk+WTJ0y+j9/21K6iOgQ9dZK3CObrkNYKu0d1v30SW
         gRjW+N7LXwBJEQhymaTUUMq4ObkZHiyrnlFKr+xHWwXDqquwV/e0DUnP3U7MBjBEDuvu
         C1v/pbgJUScWGGgJiaQzQ+6blVMVXQF/cs4j+6jHeI5JBojMsGL8fMif+X/rzlQhwSE9
         cjpUVCOYFx0aOHxN9iw/BGnCCvdPL0XtkXJzkMCMRMPEJxPVuawJFl5CanvHs4eXxmhZ
         rp3i952tOW5TdbGKSbgHjw1bqH4n8wqdx52aZP34X6dfP5NzK8iETv/Fxo8CX63a42Mv
         AVcw==
X-Forwarded-Encrypted: i=1; AJvYcCVYkgJzNl9rblG3oIrfrUS1KKoTRTDVng+kQZvm846qQQDEHZ3Rb5RHYEnHsP6h7O2vZXtWXUwzJwc=@vger.kernel.org, AJvYcCWZDgegXh+9t3m9fE7wRr7bQ5vvP1hZKxD+k2EshnonFNfETgi3678ENaaPFUIORVx30k0QW5NKcTGm9uve@vger.kernel.org
X-Gm-Message-State: AOJu0Ywyh6mH0amuTKibvxC7J/u4v8FtFxP4RbYxs1JEBPkbCPkcCXU6
	2dyaRrTo7UeTL/p9jikIwjLA/AHHi+y+n7jHwXFamBcVjXzu+Pa8keMzvbRrONB2oCd78ksC
X-Gm-Gg: ASbGncsZ1NhDxmO8/9Tu5g3iM2183ypkOLOXkcRIdBAPedPOg3qix/6mhL2wDj1RXKS
	v3a204Z3CCmZMkJ2h2O8hj+wDbVW5ndoAW4EqmzVCxhGOuxJ6vstwXplCKGAjxsZFOOoh1ZJ1Pw
	u87GjMbjGWQSjopwXfsrybEYuVrq5MS29uwskkZZXj+CNZ/+doupnogt0EBZeZIxvQ1tXqSrS4p
	kRjnpbtigHBUELLi3G0sslzgL6xPcBK74MR9yaLmErmFrCf9a9zwkL3X7KN3+mUmxc1M6+LU9ZU
	lR9o8WQt9pYKSNg3BtUsXa+hcgf7Z3LfZ6nl3HPHSxiy17j14M8XeI+Ybyd5WvTXR1cEoYVLLBc
	+
X-Google-Smtp-Source: AGHT+IFll20vV4ynGEgWpnSAhVmzio10K+2+NYrQyup3kjW7y/aHFbbZ1VqDies/v11+K5p29Xl8nA==
X-Received: by 2002:a17:903:1c6:b0:235:e9fe:83c0 with SMTP id d9443c01a7336-237d9852f68mr45071205ad.27.1750429546517;
        Fri, 20 Jun 2025 07:25:46 -0700 (PDT)
Received: from localhost.localdomain ([45.8.186.102])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d860aeacsm19272025ad.119.2025.06.20.07.25.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 07:25:46 -0700 (PDT)
From: Yuanye Ma <yuanye.ma20@gmail.com>
To: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Cc: corbet@lwn.net,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Yuanye Ma <yuanye.ma20@gmail.com>
Subject: [PATCH] docs: f2fs: fix typos in f2fs.rst
Date: Thu, 19 Jun 2025 06:55:46 +0800
Message-ID: <20250618225546.104949-1-yuanye.ma20@gmail.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

This patch fixes two minor typos in Documentation/filesystems/f2fs.rst:

- "ramdom" → "random"
- "reenable" → "re-enable"

The changes improve spelling and consistency in the documentation.

These issues were identified using the 'codespell' tool with the
following command:

  $ find Documentation/ -path Documentation/translations -prune -o \
    -name '*.rst' -print | xargs codespell

Signed-off-by: Yuanye Ma <yuanye.ma20@gmail.com>
---
 Documentation/filesystems/f2fs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 440e4ae74e44..8eeb7ea14f61 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -218,7 +218,7 @@ mode=%s			 Control block allocation mode which supports "adaptive"
 			 fragmentation/after-GC situation itself. The developers use these
 			 modes to understand filesystem fragmentation/after-GC condition well,
 			 and eventually get some insights to handle them better.
-			 In "fragment:segment", f2fs allocates a new segment in ramdom
+			 In "fragment:segment", f2fs allocates a new segment in random
 			 position. With this, we can simulate the after-GC condition.
 			 In "fragment:block", we can scatter block allocation with
 			 "max_fragment_chunk" and "max_fragment_hole" sysfs nodes.
@@ -261,7 +261,7 @@ test_dummy_encryption=%s
 			 The argument may be either "v1" or "v2", in order to
 			 select the corresponding fscrypt policy version.
 checkpoint=%s[:%u[%]]	 Set to "disable" to turn off checkpointing. Set to "enable"
-			 to reenable checkpointing. Is enabled by default. While
+			 to re-enable checkpointing. Is enabled by default. While
 			 disabled, any unmounting or unexpected shutdowns will cause
 			 the filesystem contents to appear as they did when the
 			 filesystem was mounted with that option.
-- 
2.48.1

