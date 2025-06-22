Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8238A35977
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 05:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750569558; cv=none; b=dMlJ+8/m/ZHqWY8BSh97AZM8tVm/cWOu2CBo9PwHGTaMJHBjxtIANfDvTvVvcMTOXTZmExYyDcDQetZ1dFV6TKbTP9ocIOzIWCMQN2JN1ehH8KDqiqmDm27jovIp4cKxQHGiamhkuQ/nW4fJguEnGobaOjXc4Xj7lX4RNc3xEV0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750569558; c=relaxed/simple;
	bh=z5fO1xc0VujNNO0FEO5eIbPobYTVvwrqvk6sA4Hr3Fc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version:Content-Type; b=fZjRTCPVbSn6pVXBknhOo89ZToXnRX/z8CNGg/lJS54K0VUiaVStqfePsZJm2mAbIQ1XZ4qZkQQT7HymJRq7RTcA1nSWimx755hpP94nt0U68nq6NtkDF5IjpiFgX1jx7HJp0sZrgo/DcpvX+2hEj4h7JxBCUXvo0swFiPqoXVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elQvZZSM; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elQvZZSM"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-45310223677so23406745e9.0
        for <linux-kernel@vger.kernel.org>; Sat, 21 Jun 2025 22:19:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750569555; x=1751174355; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xvYslitUMqBt0gBMwySKkrly+VfBVue7PGZMHtctv/o=;
        b=elQvZZSMgLK82PJkeJflKZdyqNCbl9mLBxoxv4DcOVGHrx/mH6picFJxr2/SEHdBft
         ObAxfGlZiiVi6g5EPc7rpbORML1kRnSWasvMl7kEwsUl4BqaxN5WY3BeCLNdGd1c5Iuw
         czvfFUQkwYnWNLVyucgpikDV+R8ZIKnrEXdC/OpbkMSyQSLkIb52Ltw3PzyFKqjElHtg
         cfQnbQOOnhWWJgrP5PXp6CCScTf0Zy9tMvGHKh35IhX1GGm6r1tDeC6j/KtqaCNg+T5r
         MHCFjOqCLKegrRQL8hu66nzqR+GvCUBF0MeZt3ZE89f7mEP75uKfrafOtzrkyGVr2qNs
         3yUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750569555; x=1751174355;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=xvYslitUMqBt0gBMwySKkrly+VfBVue7PGZMHtctv/o=;
        b=JfrQg7MJB+3PwNaFjMZjB5Xe1snO7NmSIlGFlxQirjVYONqN8syDDx+/XxSUTOeNNy
         52khiPIA9o72JjskIJX11FCn3nejGTSJo/vmmtd7yEKNsdp94pFHJKEy3qYPAerdpfIp
         J5GPtafzno72XcfMzM/KP/Jt3dH5//RFzAxKkl/16vYBkxYKPHF2zrUhqtpggRijYCSs
         TRZRs/T8qTNatd53uVBqwdaB3jaXq9bhaBr6j430Yn3zb9wW9ZYdMyrP7Iyyh+qfopGQ
         aLJck8VTA99FE0UJ8aortQubB37DA0eZ+MUobbqjOpJWy/MMHJT+RfiHScaRtJi8aNYP
         KjrA==
X-Forwarded-Encrypted: i=1; AJvYcCU7tWghwrG6VKtf6wYln3TRZuOMmbqVhTmTPZEmzZeduAA0Y7B+uPQWa7rF/p8m1Yzl6k45gZbTjityc7g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxakFDbfFs54GWyHopJQWhrh4ggck97jfsAt+CxSh6xcUlirVKF
	op1yuzWjOm7iyOl5BbRz/8vYFGj1n0BVqt9hQzLXCwkjVDprCceim+MA
X-Gm-Gg: ASbGncvigy9d3H7kwFhgtOa7UHcBFoD9+0cfmmhR1F+b3TAWUjaTTiElgoEribbRSnW
	njhBfR99WY98jAk8EEkDX1ZUOpe653pECrs8PKtayJgaamDiQfCg9ROac91r6oW6aiT/Ee6/Ktr
	Tgpmpz64SnDE461DvksREYbfgnWlTLGP298bEy5oE0pyI0N61eIRWq5cCrWp9zHS4wkA+IeEOTX
	t4mkLKcAaHxOsH1tnS6n/feQr8+5hiv9yF5Kjp2ucW/08oN6cytLnbN1R2tpdDyOoh5ELfzQWXN
	NC3goZCBC85qG6HThOXtdGnf/YpOHjTj0YtzG9YEDV0Xb3g0X1KGbnc5Pv+cc7J8ph/Lh4ZRL/4
	9R7oLnyPilytT7afLFRRysoIE8E8dUQbwcGiy72qAbFbuXFcwHno6EA2fWMvmCbI+ibPRL6M=
X-Google-Smtp-Source: AGHT+IG2ItlSP7G+r/LWNbalZIeLjB/48RCjBxhLQj8TTmjNIL6SoIT8uXoqAVp1G28YhdjtzRkkAA==
X-Received: by 2002:a05:600c:3b84:b0:441:b698:3431 with SMTP id 5b1f17b1804b1-453659ec191mr67080645e9.28.1750569554647;
        Sat, 21 Jun 2025 22:19:14 -0700 (PDT)
Received: from localhost.localdomain (ec2-3-122-242-201.eu-central-1.compute.amazonaws.com. [3.122.242.201])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-45359a09ee6sm60885395e9.1.2025.06.21.22.19.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Jun 2025 22:19:14 -0700 (PDT)
From: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
To: ryabinin.a.a@gmail.com,
	hch@infradead.org,
	elver@google.com,
	arnd@arndb.de,
	glider@google.com,
	andreyknvl@gmail.com
Cc: dvyukov@google.com,
	vincenzo.frascino@arm.com,
	akpm@linux-foundation.org,
	david@redhat.com,
	kasan-dev@googlegroups.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	snovitoll@gmail.com
Subject: [PATCH] mm: unexport globally copy_to_kernel_nofault
Date: Sun, 22 Jun 2025 10:19:06 +0500
Message-Id: <20250622051906.67374-1-snovitoll@gmail.com>
X-Mailer: git-send-email 2.34.1
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
Signed-off-by: Sabyrzhan Tasbolatov <snovitoll@gmail.com>
---
 mm/kasan/kasan_test_c.c | 4 ++++
 mm/maccess.c            | 1 -
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/mm/kasan/kasan_test_c.c b/mm/kasan/kasan_test_c.c
index 5f922dd38ffa..094ecd27b707 100644
--- a/mm/kasan/kasan_test_c.c
+++ b/mm/kasan/kasan_test_c.c
@@ -1977,6 +1977,7 @@ static void rust_uaf(struct kunit *test)
 	KUNIT_EXPECT_KASAN_FAIL(test, kasan_test_rust_uaf());
 }
 
+#ifndef MODULE
 static void copy_to_kernel_nofault_oob(struct kunit *test)
 {
 	char *ptr;
@@ -2011,6 +2012,7 @@ static void copy_to_kernel_nofault_oob(struct kunit *test)
 
 	kfree(ptr);
 }
+#endif /* !MODULE */
 
 static void copy_user_test_oob(struct kunit *test)
 {
@@ -2131,7 +2133,9 @@ static struct kunit_case kasan_kunit_test_cases[] = {
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

