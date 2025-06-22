Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7CCA757EA
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 14:11:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750601517; cv=none; b=O/HQL1ewySJ+X2aTLyq4f9yMIoRHqu46bpz+cZySZmTPIAqJlwx7dpy7rlbd/FcRNEmIexwBxA6yc2/4i9m7rZWBX76KRbBcZDZO+uyjPFmc4FS9J4m/0avkLuje2qBlAFoNCfViEnySzlNWUGpLXE2Ohy7ZQJ3mzp8zPvDX/BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750601517; c=relaxed/simple;
	bh=yAzFNBbvPy9HACIxO24b6xJmINJWF8cozEP2YO5Nnzg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=P6demGE/fzvCkzMmosm3576AmKe7Uou7jwVD98rSsR9ea072qukDDzjy6gZZwgzvi6eBpx6KqoN2r5Ak9TFy8k5C3GtGWA+uA7yT921GsoufR+qSJZP1HZYi9J5KtmDadN4Cwcol33ywCbu5EnHRmGMyeVQPjWsyZTqJ8OJoHJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QJGpfzZA; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QJGpfzZA"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-441ab63a415so35187665e9.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 07:11:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750601514; x=1751206314; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gQvsm7fpCMuYnjdMO+OlD8VealdHt7K+J4wH5CEjQ4E=;
        b=QJGpfzZAEMmyQZMfmcmvfOdsW4hogkh3GYq6XDA3yZcTEmNWB3aG1ucXhu93l46Wfw
         5u8w23d95nQmxp8nTMFvq0qyTJDzbMDnpRqNpEU/92VObkQhVHWnHq037Yv1FBG0ztTy
         /nYYDyM5tQpNlk98kBu+MABK5kD+f8UcmjWs1av+wEUByci9nOuroIiyJXJGI3cxNwU0
         eNFJbmDoyhvYHaMRDGUCXNvgarC8qaeJxs/npLa/GMtrzGZPTCnFp6Y9JriTVcDIwmPe
         TxOKWcjC5v9OAPbRy3cTQiwToDPmBddiP8GWR6p2gPEgnfoh44TSmypH8C3ooB0D//GL
         +A3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750601514; x=1751206314;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gQvsm7fpCMuYnjdMO+OlD8VealdHt7K+J4wH5CEjQ4E=;
        b=LFv0Gat4/CpD/GcDxR8xyZkvXZatLVB3OGNzNogs1UFfyZ5byKFkXTpZgoeGWnDG9i
         dC787Mx2yweHM656zC5d4zt8wwPeX/YeolJA2i+SNOaGNIxChPksxjd2J1FEWUqIPFac
         5fpPwI+wAXv5L/6i1lF1/xaMrF4ZoK/4RqyQUL3vTsR0VnFni1zqcKXIp+X6ilGNtAgs
         mQ1ryzRp1EfCy5hTBy4LRphNvhEb+QfB6enhRdz5lArja5LhZ2A3PYWG4KxkfRNXe9t/
         IYb+S4yLdHJ1MlTvzXiauCPRoGr7C/AJtF3g5X4n8XWTouZO7B3RrhD4uWyjD/JioOd8
         rGkw==
X-Forwarded-Encrypted: i=1; AJvYcCX5KKvBFbixSK79mVHVJRa1cb53T9LQXwRJem4lWgf5hBZ9privcB57dHekCg93p3YimSNS7i8rgvXPvaM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAlRJMB067IbWl68wNuYfgku3JyDZIYAYdPT312t6l2+lHmHDH
	FplOblIwGlul3rPQlG49PG6k0VB0F85+peI9lnTMoCoc24uuguEgPvKB
X-Gm-Gg: ASbGnctLSiEpWp+lQUJTlYR7bkj8bEvznPfDfpqQuyBPCbSZmkK8772cr1+ZDcyMYZj
	T4PnpSzDx5Kd0/AF8CwRww5mksdu0M6OnqdL8bnRi+EhwYrn5WquvE3kXgXwzI4U8SdxhOfyqMD
	yM1DUfVXQvangDU53upw4jekttoKTMNsoY8/w9cItqCq7YXt6I/u1fJOlUr1XB2T2XRl4MFF/RL
	pLkC7L0IaHdeRQdUGLRAIjmHghbAtuLOu7Ux6DVW4UeOFCC8MG4SxFAfqjeqSgc1mqfKNMOO4RO
	SlfN1EvN4oyH0umifQobBzR5AVI3AAkJCcb7ZtwS2oJHZmZUCqjGfvdRAejH+ORDH7kBDYXy9Zd
	3BPnzpNjRcY5oTePEwt/DY+IzyLnUILX0PFYgI+G6PcDXG9M0am4SgYJ5G+PK
X-Google-Smtp-Source: AGHT+IHAlPR/N4kBvNYmCpXmmcKJYQ0IJZsc7viblhNP+ybWRIt4E0uKoKYzRwNSswAi/4GCCRqYEQ==
X-Received: by 2002:a05:600c:4e8b:b0:453:608:a18b with SMTP id 5b1f17b1804b1-453654cb7dfmr103410815e9.9.1750601514096;
        Sun, 22 Jun 2025 07:11:54 -0700 (PDT)
Received: from localhost.localdomain (ec2-3-122-242-201.eu-central-1.compute.amazonaws.com. [3.122.242.201])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6d297ccbcsm6775771f8f.91.2025.06.22.07.11.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Jun 2025 07:11:53 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: andreyknvl@gmail.com
Cc: akpm@linux-foundation.org,
	arnd@arndb.de,
	david@redhat.com,
	dvyukov@google.com,
	elver@google.com,
	glider@google.com,
	hch@infradead.org,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ryabinin.a.a@gmail.com,
	snovitoll@gmail.com,
	vincenzo.frascino@arm.com
Subject: [PATCH v2] mm: unexport globally copy_to_kernel_nofault
Date: Sun, 22 Jun 2025 19:11:42 +0500
Message-Id: <20250622141142.79332-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
References: <CA+fCnZeb4eKAf18U7YQEUvS1GVJdC1+gn3PSAS2b4_hnkf8xaw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

`copy_to_kernel_nofault()` is an internal helper which should not be
visible to loadable modules – exporting it would give exploit code a
cheap oracle to probe kernel addresses.  Instead, keep the helper
un-exported and compile the kunit case that exercises it only when
`mm/kasan/kasan_test.o` is linked into vmlinux.

Fixes: ca79a00bb9a8 ("kasan: migrate copy_user_test to kunit")
Suggested-by: Christoph Hellwig <hch@infradead.org>
Suggested-by: Marco Elver <elver@google.com>
Reviewed-by: Andrey Konovalov <andreyknvl@gmail.com>
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
Changes v2:
- add a brief comment to `#ifndef MODULE`
---
 mm/kasan/kasan_test_c.c | 8 ++++++++
 mm/maccess.c            | 1 -
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 5f922dd38ffa..2aa12dfa427a 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1977,6 +1977,11 @@ static void rust_uaf(struct kunit *test)
 	KUNIT_EXPECT_KASAN_FAIL(test, kasan_test_rust_uaf());
 }
 
+/*
+ * copy_to_kernel_nofault() is an internal helper available when
+ * kasan_test is built-in, so it must not be visible to loadable modules.
+ */
+#ifndef MODULE
 static void copy_to_kernel_nofault_oob(struct kunit *test)
 {
 	char *ptr;
@@ -2011,6 +2016,7 @@ static void copy_to_kernel_nofault_oob(struct kunit *test)
 
 	kfree(ptr);
 }
+#endif /* !MODULE */
 
 static void copy_user_test_oob(struct kunit *test)
 {
@@ -2131,7 +2137,9 @@ static struct kunit_case kasan_kunit_test_cases[] = {
 	KUNIT_CASE(match_all_not_assigned),
 	KUNIT_CASE(match_all_ptr_tag),
 	KUNIT_CASE(match_all_mem_tag),
+#ifndef MODULE
 	KUNIT_CASE(copy_to_kernel_nofault_oob),
+#endif
 	KUNIT_CASE(rust_uaf),
 	KUNIT_CASE(copy_user_test_oob),
 	{}
diff --git a/mm/maccess.c b/mm/maccess.c
index 831b4dd7296c..486559d68858 100644
--- a/mm/maccess.c
+++ b/mm/maccess.c
@@ -82,7 +82,6 @@ long copy_to_kernel_nofault(void *dst, const void *src, size_t size)
 	pagefault_enable();
 	return -EFAULT;
 }
-EXPORT_SYMBOL_GPL(copy_to_kernel_nofault);
 
 long strncpy_from_kernel_nofault(char *dst, const void *unsafe_addr, long count)
 {
-- 
2.34.1

