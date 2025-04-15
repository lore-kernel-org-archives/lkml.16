Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 775192356D8
	for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 20:33:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744749242; cv=none; b=FwITfxyK7a30FrCm5R9vNopAvaZ25Wz+nBsn1UZIUroHZqedpUpQ/zqERHTjgT6Q9qnQNxrHtzDWBW7KtrelE4dBFZ2zQxc+AuLdLZ0nmfR+GblYWtxh9y89loQRwAOzoTm3JWQ4BrnWHwckMOSa9vSuZdSzEWdSa6fhmCh8BC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744749242; c=relaxed/simple;
	bh=bx1iKrdSrzWwm/Z1ftrLLfS3+M1pXWoevSNmsf2zLtw=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=PvQT1aIOSgLFj4idQlV82/LfQt/EFyE1terXbZvaJZMyH8vizbiK96y+WZMNilDvvLWlHKXXpg3ApCTyDlffX8fzYbDflCtuPZBpnsxEpep9zyKJpS3q0dyAH+gtGs5n1xGDTZxKNs3j5GNa5Gll/Trs/aDhboa2F/2K/gQJ8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WAlU6FjB; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WAlU6FjB"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ced8c2eb7so47009955e9.1
        for <linux-kernel@vger.kernel.org>; Tue, 15 Apr 2025 13:33:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744749238; x=1745354038; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=IEKdMkwaC8ZVuzeK27ofbBSfYgZV8m32yzn+EY7u520=;
        b=WAlU6FjBiwGQSiSmCH6WVvmRYp/nrxrQ04rFbtco7QHT+KuRfafjPBjl12+xb4qle0
         vHLB+UhLhcXu+5JhgSlBUo8qSiw21fOgAYRb8NR6T55/TiUekRapPSY0qmOQ6dxM2x0M
         UOU7PMJRaXdvKSgQOi19vxFUlE2s64cvaCStTKX+a7D6tRfaf9UhK6DWn9JTMMDsFKJM
         IY6H2aX8Tq2RetoE8kNKXDqxE1iehrZBrtMeU7LLQLsQv4mrqYvA9b9+Xtv8EGrbbCd+
         eg5Lj47PhkU/uvJcA/eQuvd/W/xiGSYzAhx0frMqpy7bwo7jbVd1+4923G2yv5kG0bxv
         RuPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744749238; x=1745354038;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IEKdMkwaC8ZVuzeK27ofbBSfYgZV8m32yzn+EY7u520=;
        b=syLJ718+/ojMLScm445LKFbn6HJ7/xem3BJ9N1Lhw5+IGXzvTmFWbc+38SUBNnhlVv
         2+8bTXTl3rCq+5xRiB9IGP2OJWP1TLdp0Pf0XWXn3IMir3fn8xfLwreEwMLxrJ536SCt
         GRLQgJ+9rZfsw/DtL9DsI4+3W1ZaRJgNs6WTN3SqP+mCyOfjT6I30Ku+RRIXpTnlRf0v
         AhBVLd/+tCRhfW48no7yMweVPrL01EMd7Z7XyPpxJPG+xRnH6Vx34xUegcUCj8y6BuSS
         s5h5JXYOS52iAmf4J7/JK8bUcoQHZVKazMffmUuJXw/N1odEk5kDwbTTcI+o/9hAODJL
         VBGw==
X-Gm-Message-State: AOJu0YzQEd09wIciMY+JzO18YCNU6zK5/LaRQhWL2FRDBbKTKp7n9N9G
	CKQNPK49EM2tPKxDW72fZWOlNBxF+REsA1eHhP9EU3bcWdLNM30gR7l5A9GB6v2mCRBa50JdW+H
	mgQWx0eqNNtu+shFOE/LElatQCgWN0edka8bkxVCbdb61eNqFYiQMNbaOnvXZUKRKynxzry1DZp
	zXpUQu6K6rFNmd3Ct4+6Mewx5J+fSc6O7rUdPEYALOLe3yZq/HHYE=
X-Google-Smtp-Source: AGHT+IENnzOlV1ODYOpeVHVMRaRkJZcFtJId27vjFItTdwFcgI3VPSYpTFyt3sy2P89IAYGXhZHJCkY6z9VHrA==
X-Received: from wmcn2.prod.google.com ([2002:a05:600c:c0c2:b0:43c:f7c3:c16e])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3ba2:b0:43d:1b95:6d0e with SMTP id 5b1f17b1804b1-4405a0a4136mr3880525e9.23.1744749237846;
 Tue, 15 Apr 2025 13:33:57 -0700 (PDT)
Date: Tue, 15 Apr 2025 20:33:54 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250415203354.4109415-1-smostafa@google.com>
Subject: [PATCH v2] lib/test_ubsan.c: Fix panic from test_ubsan_out_of_bounds
From: Mostafa Saleh <smostafa@google.com>
To: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org
Cc: akpm@linux-foundation.org, kees@kernel.org, elver@google.com, 
	andreyknvl@gmail.com, ryabinin.a.a@gmail.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

Running lib_ubsan.ko on arm64 (without CONFIG_UBSAN_TRAP) panics the
kernel

[   31.616546] Kernel panic - not syncing: stack-protector: Kernel stack is corrupted in: test_ubsan_out_of_bounds+0x158/0x158 [test_ubsan]
[   31.646817] CPU: 3 UID: 0 PID: 179 Comm: insmod Not tainted 6.15.0-rc2 #1 PREEMPT
[   31.648153] Hardware name: linux,dummy-virt (DT)
[   31.648970] Call trace:
[   31.649345]  show_stack+0x18/0x24 (C)
[   31.650960]  dump_stack_lvl+0x40/0x84
[   31.651559]  dump_stack+0x18/0x24
[   31.652264]  panic+0x138/0x3b4
[   31.652812]  __ktime_get_real_seconds+0x0/0x10
[   31.653540]  test_ubsan_load_invalid_value+0x0/0xa8 [test_ubsan]
[   31.654388]  init_module+0x24/0xff4 [test_ubsan]
[   31.655077]  do_one_initcall+0xd4/0x280
[   31.655680]  do_init_module+0x58/0x2b4

That happens because the test corrupts other data in the stack:
400:   d5384108        mrs     x8, sp_el0
404:   f9426d08        ldr     x8, [x8, #1240]
408:   f85f83a9        ldur    x9, [x29, #-8]
40c:   eb09011f        cmp     x8, x9
410:   54000301        b.ne    470 <test_ubsan_out_of_bounds+0x154>  // b.any

As there is no guarantee the compiler will order the local variables
as declared in the module:
        volatile char above[4] = { }; /* Protect surrounding memory. */
        volatile int arr[4];
        volatile char below[4] = { }; /* Protect surrounding memory. */

There is another problem where the out-of-bound index is 5 which is larger
than the extra surrounding memory for protection.

So, use a struct to enforce the ordering, and fix the index to be 4.
Also, remove some of the volatiles and rely on OPTIMIZER_HIDE_VAR()

Signed-off-by: Mostafa Saleh <smostafa@google.com>

---
v2:
- Use struct instead of reading.
- remove some of the volatiles.
---
 lib/test_ubsan.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 8772e5edaa4f..a4b6f52b9c57 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -77,18 +77,22 @@ static void test_ubsan_shift_out_of_bounds(void)
 
 static void test_ubsan_out_of_bounds(void)
 {
-	volatile int i = 4, j = 5, k = -1;
-	volatile char above[4] = { }; /* Protect surrounding memory. */
-	volatile int arr[4];
-	volatile char below[4] = { }; /* Protect surrounding memory. */
+	int i = 4, j = 4, k = -1;
+	volatile struct {
+		char above[4]; /* Protect surrounding memory. */
+		int arr[4];
+		char below[4]; /* Protect surrounding memory. */
+	} data;
 
-	above[0] = below[0];
+	OPTIMIZER_HIDE_VAR(i);
+	OPTIMIZER_HIDE_VAR(j);
+	OPTIMIZER_HIDE_VAR(k);
 
 	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "above");
-	arr[j] = i;
+	data.arr[j] = i;
 
 	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "below");
-	arr[k] = i;
+	data.arr[k] = i;
 }
 
 enum ubsan_test_enum {
-- 
2.49.0.604.gff1f9ca942-goog

