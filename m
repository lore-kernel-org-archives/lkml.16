Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CF71E2838
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:37:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744666623; cv=none; b=DYxYJ2EZQr0CpiQGOMa3SF8z3hsFSUVOiUp5sBewJcCMMQA7XzQRgwoBK9YcKFmQ9nfyhXO+m55kuFXt+ki1DV9K/CuVwvPqUJMX6jXywAgQZIELHjLFhw3B6Qa82TuNOgRVp6Osz519uaStTuFPihvqsWn7SaNm/U9Uj7XtXYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744666623; c=relaxed/simple;
	bh=Tk24utghGkFplP4e4dv7/jYc7nM2GAMqLLXblA4mn+I=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=nRk6DpbfISTM5vY8nICpro4llIletD9nxOpdo5mwDOzsuPzt4kaVvuu8Q3KBOYET/LiS6lZY26/IfUj1+PRH0xRP9mH39F2qV36rotTbQHhqAmtFn3aUayYU+a3FsAu61JkTV9YfL5RJ6W/Bwdy+LXpwBGbZABfavm/aJaKm+Hk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i7ercoH+; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i7ercoH+"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d209dc2d3so26892955e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744666619; x=1745271419; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jF2TNhYRLgqPg2GomnHoMsGcCSNdCtX7kL0R4HVOm0M=;
        b=i7ercoH+Op01ort4BqMWo9I+4ZPYByFW6+JKc70Iio3f2FWriRQ9VsJFTG0VrRHYd/
         Dq4ig4VHvZHR1l/TCuSVP48O5HoACH9grDkREHnxGFeDrLq1ssCN3fDsYSp8VVutY+b4
         XC55p27CVIFhM3pIXF6KQGKTP0gia5M+HWPMndIYm9w0KmeJTtJemRThXj2r7UJ1fLFd
         +xp2Ugv6yr9EZg3AUnYGQiS00ybabs79TRoZB8+/t3vckHvqRVd+C3unZddjIL4T8Gnp
         sko90YuQ2kzXGst/0W3ilU7YsPa82b/hAIeCAe02Qph/HvGUraxgTtZHpumEmjv3wb7m
         BwlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744666619; x=1745271419;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jF2TNhYRLgqPg2GomnHoMsGcCSNdCtX7kL0R4HVOm0M=;
        b=v6o90Fad1lrGdInn/bOQzWRA4hkd2qInB5AMfCKK2fTakqL7JCh5UlTjoBPKt5jAkx
         o/AhTfd1OTbe73+GUfkDBf3kU5rM87xdIM+eQKsmDWQ3N74qPX3s34vvzi4EBUWRkNog
         GrXKiaNgaQAcfQXy+uOBFhCKWLxbfd9XJOMHgFcNepT91OSqgcFzL0qiQTUdwf8pNOmY
         eYNv/Klbtb3p2YBCAjbbY5AywA1CFu0mHlSpLHedxKm4LllJ2OMjJZLIZqM79SVLdxR/
         HQQX/SigFaf+WS7+UzQx5IXr7yh84gZsVBb+A3SWEQmQobXgWYSwjNg67ef7LixM3cK3
         m6ZA==
X-Gm-Message-State: AOJu0YxkX7BoPEZFm/4VunSu4m0IGKBxCwdsFkMMcKPZzmycpb5EIOaB
	56FtK461o32zZNGrKX8UIgmn28uIhMm9o0wb/3JbuJUN6E8i0eHC/emR+iD7cCM/fszauliGU/i
	PcLguHru7iXjkxMqNtk36StzKMH/uQpt3cY/5CSDo4PPkFFytZLrwhu8MMxEDKzPTPTizzmxhyY
	mKlvERHcGKZ/5CpwVTZXB7/f00XVV2mBb2JQhG9QQWsaxL4a+6mew=
X-Google-Smtp-Source: AGHT+IGt6SdsBhDCC9mxwhOwKurQqfl47SwTpTcZcPKa30UdcdmeRTNfSJw4Tae6aDy5J+4zBAj0NpZLX6MBTw==
X-Received: from wmsp9.prod.google.com ([2002:a05:600c:1d89:b0:43d:9595:9973])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a04:b0:43d:42b:e186 with SMTP id 5b1f17b1804b1-43f3a93f257mr98041855e9.8.1744666619418;
 Mon, 14 Apr 2025 14:36:59 -0700 (PDT)
Date: Mon, 14 Apr 2025 21:36:48 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250414213648.2660150-1-smostafa@google.com>
Subject: [PATCH] lib/test_ubsan.c: Fix panic from test_ubsan_out_of_bounds
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

So, instead of writing out-of-bound, we can read out-of-bound which
still triggers UBSAN but doesn't corrupt the stack.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 lib/test_ubsan.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/lib/test_ubsan.c b/lib/test_ubsan.c
index 8772e5edaa4f..0e5c18b32b2d 100644
--- a/lib/test_ubsan.c
+++ b/lib/test_ubsan.c
@@ -77,18 +77,15 @@ static void test_ubsan_shift_out_of_bounds(void)
 
 static void test_ubsan_out_of_bounds(void)
 {
-	volatile int i = 4, j = 5, k = -1;
-	volatile char above[4] = { }; /* Protect surrounding memory. */
+	volatile int j = 5, k = -1;
+	volatile int scratch[4] = { };
 	volatile int arr[4];
-	volatile char below[4] = { }; /* Protect surrounding memory. */
-
-	above[0] = below[0];
 
 	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "above");
-	arr[j] = i;
+	scratch[1] = arr[j];
 
 	UBSAN_TEST(CONFIG_UBSAN_BOUNDS, "below");
-	arr[k] = i;
+	scratch[2] = arr[k];
 }
 
 enum ubsan_test_enum {
-- 
2.49.0.604.gff1f9ca942-goog

