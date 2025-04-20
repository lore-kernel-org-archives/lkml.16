Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F5A21128D
	for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 19:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745177122; cv=none; b=Cki6QOVKpEdFh1Hamb2vjqS54yZhSrgofZxGxZ+j0RTW9LyxQqA/JIa31Qst+kvOVEqvYxomC1k2/CEHWDy2C6PK8yHDXyURCPKpl+PnS6ue/AP1vFggy5UddwdnHEKN34PhXSqyojNlW11jmjhF7Q/dXUfFo9geNpTEy/9+8r4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745177122; c=relaxed/simple;
	bh=YkJZS/hGgOBJdkNEI99tcKENm4bHyoecAwwQJIv+B1o=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=n91ITLKm6C2bNjPcTOlaexiK0ZNlwdTfpMcKPuzOQthD4I/iHRtNiby/VYuFws8ZdTmP0HnybjQ6C8OzjyW4B9CdUsDF0eHZeEgJCw6aBmvkzC0tsDzzzo9XzxNGW/QyFo9k3hg3MpYol+bSHcyfCU0fKnoKPD7zxTTpDAq73nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGNSkjZ/; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGNSkjZ/"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-736c1cf75e4so3071103b3a.2
        for <linux-kernel@vger.kernel.org>; Sun, 20 Apr 2025 12:25:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745177118; x=1745781918; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=yHI5sNoiia9iPRf9uSr1kkZ6YuraaIMUm7WOg0ElNkY=;
        b=aGNSkjZ/6JG/dbkbXl2DJgY258ZbSnXcw2swGPeuqGcJ0IvOIviUHxLpY0j4zdm4rk
         LEBde25IqztOzUGJRlENPEOsONbaVlwxU3JcpleRc0DdKJKWIu/ToHBJwQ/mte+zYAY6
         u54DWV7jLKkbNpG3+kGU6c6Ej0ApLB5l9Km2KFWeAuwHS0XNqmKEzUse+vaJiBWk9yKF
         WDgZyiWd4FEKdqshKLPghGN5W9U6kPBxCxAHYjWuPZN8mCkWA/uNRh5kcCSZzm1MPY+p
         0PsLN59LxLWjcoAT01Mk0POY3gosxF10O5c1DiGae9GoE0Me9psIedOXOZWlNQZz6YBR
         Eq5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745177118; x=1745781918;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=yHI5sNoiia9iPRf9uSr1kkZ6YuraaIMUm7WOg0ElNkY=;
        b=O8Kj6zTO67dkkGWZng23BuZHWDxgpZhWBKCPyuo5ELtaD0C+M6JTf2urMeE1mQaiY3
         oXM2URy8HMvMsXcYmmjIZHcA+Z/njs0yUGvAfJ/xEpt9OPu4weaNbOVGT/p940w8+wGV
         8bgdCXk8gm0qmP9LVdNixtgksubQSxXAQKuHKQouhpPzY1OuCVjWLch5JpSPJPLN56le
         dOK2gqF3u+dqqujdxzHu4wwmIJfw8vpEneKZr3wV08jZOym3Z1AazIut7ghy8REAwZzm
         TPiy2CnrsrADvtp6ULdHNuZshXZovWteMyKTE/NNKmK25df97iR3PuaRGLpfuFBp16wk
         XysQ==
X-Gm-Message-State: AOJu0YzHFFGBGm5J9xfbD8bbN33F0rKQEMsOH8TFBQWUgTJYbYfonZkJ
	Eo7jGWS7/qc6v32CBP7HBmtHXoC267T+xdh+D5B1W7E3DLz5n/aMv7BZtVfd
X-Gm-Gg: ASbGncvHwknPRv4yj8u4YRc+TjEsFA4ec+HHxYpENWd6YP3enF6u+bQsXvS9Dt7miaq
	+LjLuaVRLvRm6a60+Xc4gXY0wWi/BeqN2SeGJ7h0TEVWnyXLbTlzVVJL3q26XpoaSqeFff5T2h8
	xzbmlMvOiWbMl4v4VAapOorQQ0WjdAKjORVUg6DqhDKSaGMH2IDUullqvvFAq8M3IVoigjWla9D
	oJ4CpyRATb5atraiYB8ZTKp8ii/z89WB4tB3warwwTpbmIQflkBnfF2Usf5wFH1/+Vhpa7UWidE
	FFhQUf53TIohKmq8SbdIiQYmXW3XR4L+O8Bj/mItIA2Qq0hM1fZZ
X-Google-Smtp-Source: AGHT+IH5ZOLn7VZY78yWvONxcIDmkZMXO/sw6bBvdjaYC7+5lGSoSoLbM+Lw4q0sIZbE7LAPheBYSg==
X-Received: by 2002:a05:6a00:3a0a:b0:739:56c2:b661 with SMTP id d2e1a72fcca58-73dc14cdadcmr10809565b3a.12.1745177117793;
        Sun, 20 Apr 2025 12:25:17 -0700 (PDT)
Received: from localhost.localdomain ([111.92.127.124])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8c0200sm5031309b3a.1.2025.04.20.12.25.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 20 Apr 2025 12:25:17 -0700 (PDT)
From: Tinu K Cheriya <tinuk11c@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: tinukcheriya <tinuk11c@gmail.com>
Subject: [PATCH] kvm: Improve help message clarity in dirty_log_test
Date: Mon, 21 Apr 2025 00:55:05 +0530
Message-Id: <20250420192505.157018-1-tinuk11c@gmail.com>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: tinukcheriya <tinuk11c@gmail.com>

Signed-off-by: tinukcheriya <tinuk11c@gmail.com>
---
 tools/testing/selftests/kvm/dirty_log_test.c | 30 +++++++++++---------
 1 file changed, 16 insertions(+), 14 deletions(-)

diff --git a/tools/testing/selftests/kvm/dirty_log_test.c b/tools/testing/selftests/kvm/dirty_log_test.c
index 54da9cc20db4..ac01cf198469 100644
--- a/tools/testing/selftests/kvm/dirty_log_test.c
+++ b/tools/testing/selftests/kvm/dirty_log_test.c
@@ -503,22 +503,24 @@ static void help(char *name)
 	int i;
 
 	puts("");
-	printf("usage: %s [-h] [-i iterations] [-I interval] "
-	       "[-p offset] [-m mode]\n", name);
+	printf("Usage: %s [-h] [-i iterations] [-I interval] [-p offset] [-m mode]\n", name);
 	puts("");
-	printf(" -i: specify iteration counts (default: %"PRIu64")\n",
-	       TEST_HOST_LOOP_N);
-	printf(" -I: specify interval in ms (default: %"PRIu64" ms)\n",
-	       TEST_HOST_LOOP_INTERVAL);
-	printf(" -p: specify guest physical test memory offset\n"
-	       "     Warning: a low offset can conflict with the loaded test code.\n");
-	printf(" -M: specify the host logging mode "
-	       "(default: run all log modes).  Supported modes: \n\t");
+	printf(" -i: Specify the number of test iterations (default: %"PRIu64")\n", 			TEST_HOST_LOOP_N);
+
+	printf(" -p: Specify the guest physical memory offset for the test.\n"
+       "     Warning: Low offsets may conflict with test code loaded in memory.\n");
+	printf(" -p: Specify the guest physical memory offset for the test.\n"
+       "     Warning: Low offsets may conflict with test code loaded in memory.\n");
+
+	printf(" -M: Specify the host logging mode (default: run all log modes).\n"
+       "     Supported modes:\n\t");
+
 	log_modes_dump();
-	printf(" -m: specify the guest mode ID to test "
-	       "(default: test all supported modes)\n"
-	       "     This option may be used multiple times.\n"
-	       "     Guest mode IDs:\n");
+	printf(" -m: Specify the guest mode ID to test "
+       "(default: test all supported modes).\n"
+       "     You may use this option multiple times.\n"
+       "     Guest mode IDs:\n");
+
 	for (i = 0; i < NUM_VM_MODES; ++i) {
 		printf("         %d:    %s%s\n", i, vm_guest_mode_string(i),
 		       guest_modes[i].supported ? " (supported)" : "");
-- 
2.25.1

