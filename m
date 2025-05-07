Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5EC728C876
	for <linux-kernel@vger.kernel.org>; Wed,  7 May 2025 16:00:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746633630; cv=none; b=HfW4TOB5u/UyZ8N/+2inXQBvqL5J+EHWlfMkPdf26QTbmVyKMDXk2f5mRgJQgZI6UyDzxxSfe7wZWbf9kDY4/cuNrZQaG5LqONQ68riqHvWKv8ehuQPc1n5Wufdip5cQ2ctr+Q0aXAZeHg1pRGgPE9uQlRfU8yyw3cVy4shrRFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746633630; c=relaxed/simple;
	bh=XD6tq6DLpwHFBhGWr/rk78lh/gZU6XNiduo7++24E/k=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uJqifdhTWxZEUjNZX5v/tYpzjLMLQSIxliS4NjRAJynOzox7NN3P5rY7ZHXQugI07Oo6eP6ZACwngMBqmMFmjCzqKaLiNfuX0y/lJDeZzMTk/SYtdwQCTODFmZpk0IlOIGSol1UkC2flveg0suczAjbqV8vbVzYZm8vZCSBOjh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fwPPIYAx; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fwPPIYAx"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-5fbc2b3180aso2334558a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 07 May 2025 09:00:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746633627; x=1747238427; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KJFmPHpAjo9itenoi9XTrC240347opuYhZoN6Yf/YdQ=;
        b=fwPPIYAxDsLGNGxegifijq+j2vjIb+2o39SYo7PEKrNmjUQeQvSNxKvQz8guUdXhUW
         ThLfisQc4uYwC+58H/Vvgrl9SGsjh3JPaGHsdBrzIzMKFZjWl2PcgxyVdh9ioSfHtjr/
         REv8AxVtbeq8s4/+mkT4MBY3Et4m3w9Bra7xMDatFiPdU7PM3T6j9jecMw79sAa8wD4q
         YQKCFmp4O7EpBINyEF+41Fx08LN9g8O40TYGceRV8SARaGESTOPHb8KPr5xe35cIoCQi
         SGR2EOpwB/LRoTtOEXPosRTe7bifU7Ryh5OuU9QmDpp/NhkIV0f9RMOJ3QGsqC/D6ghv
         TC5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746633627; x=1747238427;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KJFmPHpAjo9itenoi9XTrC240347opuYhZoN6Yf/YdQ=;
        b=HxHX7pPiotKTRJlmlMkj574Lttj3QomZVlEjfhBHHfmSAONlnobxNdj46jGz4cS5m/
         79h7M57hBUw3xuVM++bKPgXxiN0AlPFry4C7k/EhXuZ21+ZZ+2VK0J8bcc+gphQ4EkKD
         KBYhtadY5dcMzZBTi3rYe8uQG8pQkz9hgsBszh7dVdqxWk6hgvY22dQNEi//5b0eszCS
         im/uoCWMBBDvQt0uYEjntaBfY3YUbEdE0MgQyjkdRE7dJQtU/9pDgAzbD9iI8if7LU6x
         WxN6mPX0WhzEOTctkKcdA6MUHQ/Hb/eirkXQBpn6/6SYlwcmn2kYmMIBD0OWNjAEqB2t
         OIxg==
X-Forwarded-Encrypted: i=1; AJvYcCVDvJjiLAs8K00eLOV8+5fnnHiUQ3vq2L9fxFO6sIQDiwuMOX2ysdeqk+wGPtGo8hPbujpJmggdZipCT2o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDL+JCPS+n116JZOspFz7B76Gf6PK458WNUas2zyufuNhMu5mq
	0Yds4HEkqLVFkcTwEhjh3L5G+Z5GR5gn5bp4vigmm4RJh9pQunM0kp2Lh00oD+cOwLIRpt0S9zr
	0fg==
X-Google-Smtp-Source: AGHT+IEY9J+6RSk9J+rQrBpcKgdLus6Hc6WLS3gR6uaIUF9WhG69XJktB+w6hozbhPAqchg3BSYqyZ02YBM=
X-Received: from edxf17.prod.google.com ([2002:a05:6402:14d1:b0:5ec:cf38:1b3f])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:3813:b0:5fb:fb49:9cff
 with SMTP id 4fb4d7f45d1cf-5fbfb499ef2mr1646769a12.7.1746633627031; Wed, 07
 May 2025 09:00:27 -0700 (PDT)
Date: Wed,  7 May 2025 18:00:12 +0200
In-Reply-To: <20250507160012.3311104-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250507160012.3311104-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250507160012.3311104-5-glider@google.com>
Subject: [PATCH 5/5] kmsan: rework kmsan_in_runtime() handling in kmsan_report()
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: elver@google.com, dvyukov@google.com, bvanassche@acm.org, 
	kent.overstreet@linux.dev, iii@linux.ibm.com, akpm@linux-foundation.org, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com
Content-Type: text/plain; charset="UTF-8"

kmsan_report() calls used to require entering/leaving the runtime around
them. To simplify the things, drop this requirement and move calls to
kmsan_enter_runtime()/kmsan_leave_runtime() into kmsan_report().

Cc: Marco Elver <elver@google.com>
Cc: Bart Van Assche <bvanassche@acm.org>
Cc: Kent Overstreet <kent.overstreet@linux.dev>
Signed-off-by: Alexander Potapenko <glider@google.com>
---
 mm/kmsan/core.c            | 8 --------
 mm/kmsan/instrumentation.c | 4 ----
 mm/kmsan/report.c          | 6 +++---
 3 files changed, 3 insertions(+), 15 deletions(-)

diff --git a/mm/kmsan/core.c b/mm/kmsan/core.c
index a97dc90fa6a93..1ea711786c522 100644
--- a/mm/kmsan/core.c
+++ b/mm/kmsan/core.c
@@ -274,11 +274,9 @@ void kmsan_internal_check_memory(void *addr, size_t size,
 			 * bytes before, report them.
 			 */
 			if (cur_origin) {
-				kmsan_enter_runtime();
 				kmsan_report(cur_origin, addr, size,
 					     cur_off_start, pos - 1, user_addr,
 					     reason);
-				kmsan_leave_runtime();
 			}
 			cur_origin = 0;
 			cur_off_start = -1;
@@ -292,11 +290,9 @@ void kmsan_internal_check_memory(void *addr, size_t size,
 				 * poisoned bytes before, report them.
 				 */
 				if (cur_origin) {
-					kmsan_enter_runtime();
 					kmsan_report(cur_origin, addr, size,
 						     cur_off_start, pos + i - 1,
 						     user_addr, reason);
-					kmsan_leave_runtime();
 				}
 				cur_origin = 0;
 				cur_off_start = -1;
@@ -312,11 +308,9 @@ void kmsan_internal_check_memory(void *addr, size_t size,
 			 */
 			if (cur_origin != new_origin) {
 				if (cur_origin) {
-					kmsan_enter_runtime();
 					kmsan_report(cur_origin, addr, size,
 						     cur_off_start, pos + i - 1,
 						     user_addr, reason);
-					kmsan_leave_runtime();
 				}
 				cur_origin = new_origin;
 				cur_off_start = pos + i;
@@ -326,10 +320,8 @@ void kmsan_internal_check_memory(void *addr, size_t size,
 	}
 	KMSAN_WARN_ON(pos != size);
 	if (cur_origin) {
-		kmsan_enter_runtime();
 		kmsan_report(cur_origin, addr, size, cur_off_start, pos - 1,
 			     user_addr, reason);
-		kmsan_leave_runtime();
 	}
 }
 
diff --git a/mm/kmsan/instrumentation.c b/mm/kmsan/instrumentation.c
index 02a405e55d6ca..69f0a57a401c4 100644
--- a/mm/kmsan/instrumentation.c
+++ b/mm/kmsan/instrumentation.c
@@ -312,13 +312,9 @@ EXPORT_SYMBOL(__msan_unpoison_alloca);
 void __msan_warning(u32 origin);
 void __msan_warning(u32 origin)
 {
-	if (!kmsan_enabled || kmsan_in_runtime())
-		return;
-	kmsan_enter_runtime();
 	kmsan_report(origin, /*address*/ NULL, /*size*/ 0,
 		     /*off_first*/ 0, /*off_last*/ 0, /*user_addr*/ NULL,
 		     REASON_ANY);
-	kmsan_leave_runtime();
 }
 EXPORT_SYMBOL(__msan_warning);
 
diff --git a/mm/kmsan/report.c b/mm/kmsan/report.c
index 94a3303fb65e0..d6853ce089541 100644
--- a/mm/kmsan/report.c
+++ b/mm/kmsan/report.c
@@ -157,14 +157,14 @@ void kmsan_report(depot_stack_handle_t origin, void *address, int size,
 	unsigned long ua_flags;
 	bool is_uaf;
 
-	if (!kmsan_enabled)
+	if (!kmsan_enabled || kmsan_in_runtime())
 		return;
 	if (current->kmsan_ctx.depth)
 		return;
 	if (!origin)
 		return;
 
-	kmsan_disable_current();
+	kmsan_enter_runtime();
 	ua_flags = user_access_save();
 	raw_spin_lock(&kmsan_report_lock);
 	pr_err("=====================================================\n");
@@ -217,5 +217,5 @@ void kmsan_report(depot_stack_handle_t origin, void *address, int size,
 	if (panic_on_kmsan)
 		panic("kmsan.panic set ...\n");
 	user_access_restore(ua_flags);
-	kmsan_enable_current();
+	kmsan_leave_runtime();
 }
-- 
2.49.0.967.g6a0df3ecc3-goog

