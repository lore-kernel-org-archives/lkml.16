Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FB6579CD
	for <linux-kernel@vger.kernel.org>; Mon, 26 May 2025 00:18:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748218694; cv=none; b=r7bBzZ8vuZZ9LKeSTGxXSpJaNVJdHk9RtRbphDW+AqAIXLzQFabMIujl2s2JYrkPLA+ySGEPYMzJ5OCM4YG4J3/vDfE+acJsfh98r3KlKfsehNVWTNxvpYSKo1jWnXkyC6466bJAQQlSp5T1zY7r19fTKeM3kQPNEHBuOF9Vfmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748218694; c=relaxed/simple;
	bh=Kuc3r4rA+HWLoyVv+/mY2zwtWx5X9PD0wGmu2sdY5EU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuTYLTozGiyxBP64f1hMbpo49wA0mbpyvQmEby03u0vqRmWJ+/uYUHd0Zl2uitQavIV8QPyvwfZ9INQzKVCcEdeS8Z0rYxG6G4j5bVjzBIBKQsuJiff4OnvtZSKkmRVW98bA96KsflWdoXM2lcAMwOuYb3L4pclZMF0YgnQ09B4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZQL2XJMn; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZQL2XJMn"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-74068f95d9fso1143444b3a.0
        for <linux-kernel@vger.kernel.org>; Sun, 25 May 2025 17:18:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748218692; x=1748823492; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=MES10eRP2jIg4njBVqwcLcQbCZFTDkOjjaxYmSH1gh0=;
        b=ZQL2XJMnr+lk/qUjIIXdqq+zeEhk1tRKX/XUjEQ/bVwQ9j1NyrpbEf223w8LLH6dEU
         zwGuNe2Xk+jclIzHR8NRIzxETxs3CPAe4S3lxZQww2aU7cV9bMeqtIBJip82Yod9lOe9
         tPfb6anmqwyo08chrPSwjOuRLB7N0GEGXT7elUdDBSG7gUrlwb4cFGhoLU0fUAKfgi+k
         8lhk6wmipisXXeVSNor94X6MBFSH89KlWkkU7YNBy2yJJ5uNTYdReOdqo0czbeSra7Qz
         atfbz8VKZTRAtMqlvch53d8wr45i8RWBn9vvRU0RavacMkaTeq9q0f683it5WRCPu42z
         7wOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748218692; x=1748823492;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MES10eRP2jIg4njBVqwcLcQbCZFTDkOjjaxYmSH1gh0=;
        b=EqMbFJV+ZtOdLeF61gSkJW1ubTHB7ekDaroCANw1oUXzEx5BHUHSaseQ+RXA/lzL1f
         vvXnmzlGvVO7dby1Cu3fx5iaq71olw4t0dBF9S00rGIbqBehs55YeaRktCGy2MZJ640X
         zAlkgxUAPnTG9vB1zegcjusXqKjDdPqa0YUVshyQBnK4ShUpTdNnuUXQFn/xHxDgu9Gk
         5iYNE4hMQ3kQeIITZE8C4mjTPIOxZx3mtinhvVZnsPtCwyWIH7Q18A46rLvXc7N1TrPf
         uSUVfdhNd/BjdtaIlhJCI4tmpSzjlo2ezp3XrLewpqjkz1e/nLE3X9GGcsJrM2qHJpgY
         H5Jg==
X-Gm-Message-State: AOJu0Yx5MXj0oMEElPVnIEfMzU+1XD0g//cfIQq8vli65kNfHnv2HHYc
	g5gi1mv7AyRs28CYUQylwdmJDko4DCIzV8bWHHmTxPgrEY2XIDh0SGeEd3IS4w==
X-Gm-Gg: ASbGncu9swAB0Jo0xdFkBtnlf+2VEmYYQQNRWeqzUsKNqt59cAUjCPBdsA7epY/u3xD
	t/jMtee2UqH4eCQ9Oo8DUmbroSIf7VNaDnjn+cxcl+yr8pIkQcHilK0nuH1DxuHKA7pkHAgTE9o
	3b8gcvWLaZQLsVxsSX3J+UEOHJ7OTZ71x28x1+egykW2Oeg63o6byGq+Sdll30nGG3SwX3FBoPt
	zBlnG3qT0g2ouaqmOqIdVPXGD7SJnT8uCLAk9SEU3WNzSZe5yEXs9PN7m2BhmFbZq1GGuvqIEMR
	/3WuDpC3p1r4febJoEcOUaT52k2ZJjWUgQ==
X-Google-Smtp-Source: AGHT+IH9lNq4/uSOKIJy38i5dAlnNWnQIIU0uvi5IfoHJkWfhsYR9zq9c7RU0deSZf/MHm5fkwJAUg==
X-Received: by 2002:a05:6a20:cf8a:b0:1fd:f4df:9a89 with SMTP id adf61e73a8af0-2188c299354mr11398992637.25.1748218692598;
        Sun, 25 May 2025 17:18:12 -0700 (PDT)
Received: from fedora.. ([2601:646:8081:3770::9eb])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2c3613b0ebsm180810a12.44.2025.05.25.17.18.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 May 2025 17:18:12 -0700 (PDT)
From: Collin Funk <collin.funk1@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Collin Funk <collin.funk1@gmail.com>
Subject: [PATCH] groups: Use bsearch instead of hand rolled implementation
Date: Sun, 25 May 2025 17:17:46 -0700
Message-ID: <ab5708c1e35e1b2a54a1d83fafda1b3f8fa01103.1748218528.git.collin.funk1@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This code predates <linux/bsearch.h>. Now that the bsearch function
exists there we can use it to reduce code duplication.

Signed-off-by: Collin Funk <collin.funk1@gmail.com>
---
 kernel/groups.c | 19 +++++--------------
 1 file changed, 5 insertions(+), 14 deletions(-)

diff --git a/kernel/groups.c b/kernel/groups.c
index 9b43da22647d..4294a97e4ea8 100644
--- a/kernel/groups.c
+++ b/kernel/groups.c
@@ -2,6 +2,7 @@
 /*
  * Supplementary group IDs
  */
+#include <linux/bsearch.h>
 #include <linux/cred.h>
 #include <linux/export.h>
 #include <linux/slab.h>
@@ -91,23 +92,13 @@ EXPORT_SYMBOL(groups_sort);
 /* a simple bsearch */
 int groups_search(const struct group_info *group_info, kgid_t grp)
 {
-	unsigned int left, right;
+	void *result;
 
 	if (!group_info)
 		return 0;
-
-	left = 0;
-	right = group_info->ngroups;
-	while (left < right) {
-		unsigned int mid = (left+right)/2;
-		if (gid_gt(grp, group_info->gid[mid]))
-			left = mid + 1;
-		else if (gid_lt(grp, group_info->gid[mid]))
-			right = mid;
-		else
-			return 1;
-	}
-	return 0;
+	result = bsearch(&grp, group_info->gid, group_info->ngroups,
+			 sizeof(*group_info->gid), gid_cmp);
+	return !!result;
 }
 
 /**
-- 
2.49.0

