Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE42E8899
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945340; cv=none; b=ci9p1Fzu+DEP9O49VY7QeaK4k5uWK3r5ei8KTN7dm3uUtYyjONX5XPxCX3jPITbLQzqWVp89SuWiauu6aC9pVxseuQ7D6pq/fdNQY6L54kcMGwYqfb0nVsivoZH4domDVilNeSahA03JDyfaxyDOIoqjxE0DE3p1+mWFDExs90g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945340; c=relaxed/simple;
	bh=mt8bJyeWFEW+LLAMGTsAP+PR8cBkskNLXeDWMRtOIgU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IXeAvL2nyyfw9ZYA4Pxw/f9uB3GeJDaX2FKJ7j3Qt8s2pePdbsHTGMWh4qpitQVK2wyz1hqgCbRs5II3Pzi3lDO/9eZ5Hx2ADtle0C4WR9godW6tUQ1k0/wThtkcNqy6B9FjQBj7s9wl5RLx2B2DXhego2yafI0kYujXMbL4IHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T0OC/eW8; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T0OC/eW8"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-450db029f2aso4321435e9.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945337; x=1751550137; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=48paaS1qVo9hnWK9htYJQbyGTvWCJegAFjsjDLyyhLA=;
        b=T0OC/eW8QPU++kWssJQknfkiosSszpaAdtdec7ApHinbun7QulpnjlPl2tGuPgvy4a
         bbotXxGjYTN+03gFPvnXbEXWZ61qbl4V/Kn6efKFrwzdc8aR1T/MJffcI4bItGQ1RcbT
         5Gr8vvyLGhMeKGRZehczIqHAHh+5fhnysc0q/AL7xDGsHhfrpNDXZcxIMU9BuS0jrcwX
         UvWUCje6cQPFV6S41XNlbCTPjXMeAItoBKGJtCP0buKgc36BHhRPYauAiwOgPjAox29b
         /hAOCpKIsmAkQhsQrTX4+hQx4JvPbB3Tya6O1kiC9baTcHdRVRT0BLTyjNnqWS4T5aeA
         Pvog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945337; x=1751550137;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=48paaS1qVo9hnWK9htYJQbyGTvWCJegAFjsjDLyyhLA=;
        b=oVMOUivnso0dLGPQcplmkqaYxLvk+p8jagTSIhDnI0PkabIC5pqEtaspnZjvXIULCb
         Kpi8opAtqU6YqoKdFus0GVxDsOn8KJ9QjuM408ryeHEExYFvJfuS8AlNNdEEyaF6GsQF
         N9SiT8nGS7oTuyyhsLHCuyjgRdk58nC32UV6Wv/2MCyC9up9RDG98BL+9qmIayIVWkxz
         F7Ig0nna4kQmtH2buiEmYrSCt2VohweeBSv6epal2oV7CiXwtJvosqMrxJvACBJHlK3I
         fQ2VsclpehYNjnSpfh+tm6UR5tRVD4nbGaeu1YJuCy1U29rvzwjFO83RQBeiANVZ5uVE
         v0lA==
X-Forwarded-Encrypted: i=1; AJvYcCXYl1+bUKlXQ/LD+qPI58MpC7tufIiNxKWq0HwTcZqJp4ikn+N9fcTJwF24Ai+zCIUbkCvBfDBtEzS5O7E=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3nFQKqNNnrTcHTz4wvgkVTpDJjozBiSGgf9jZZ24sA7SwEt4T
	ZQymjEKPaiDDvmnH+fhKkJPCjzHOFzA75kRV5ki58VPQRtkDpBbDUqImquT0Gg5vKYo6z/AWWC9
	AJum8JQ==
X-Google-Smtp-Source: AGHT+IFiBXvch86YA5n4RWV9gvwQ3hSGsIWg2KfTTWT9pZpskEXh0rDiGYyZlblN2g5zh3880+zMquRCEMg=
X-Received: from wmco17.prod.google.com ([2002:a05:600c:a311:b0:43d:5828:13ee])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600d:15a:10b0:43d:b3:fb1
 with SMTP id 5b1f17b1804b1-45382a3dda3mr40122955e9.27.1750945337108; Thu, 26
 Jun 2025 06:42:17 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:52 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-6-glider@google.com>
Subject: [PATCH v2 05/11] mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Calls to __asan_before_dynamic_init() and __asan_after_dynamic_init()
are inserted by Clang when building with coverage guards.
These functions can be used to detect initialization order fiasco bugs
in the userspace, but it is fine for them to be no-ops in the kernel.

Signed-off-by: Alexander Potapenko <glider@google.com>

---
Change-Id: I7f8eb690a3d96f7d122205e8f1cba8039f6a68eb

v2:
 - Address comments by Dmitry Vyukov:
   - rename CONFIG_KCOV_ENABLE_GUARDS to CONFIG_KCOV_UNIQUE
 - Move this patch before the one introducing CONFIG_KCOV_UNIQUE,
   per Marco Elver's request.
---
 mm/kasan/generic.c | 18 ++++++++++++++++++
 mm/kasan/kasan.h   |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e76..b0b7781524348 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -238,6 +238,24 @@ void __asan_unregister_globals(void *ptr, ssize_t size)
 }
 EXPORT_SYMBOL(__asan_unregister_globals);
 
+#if defined(CONFIG_KCOV_UNIQUE)
+/*
+ * __asan_before_dynamic_init() and __asan_after_dynamic_init() are inserted
+ * when the user requests building with coverage guards. In the userspace, these
+ * two functions can be used to detect initialization order fiasco bugs, but in
+ * the kernel they can be no-ops.
+ */
+void __asan_before_dynamic_init(const char *module_name)
+{
+}
+EXPORT_SYMBOL(__asan_before_dynamic_init);
+
+void __asan_after_dynamic_init(void)
+{
+}
+EXPORT_SYMBOL(__asan_after_dynamic_init);
+#endif
+
 #define DEFINE_ASAN_LOAD_STORE(size)					\
 	void __asan_load##size(void *addr)				\
 	{								\
diff --git a/mm/kasan/kasan.h b/mm/kasan/kasan.h
index 129178be5e649..c817c46b4fcd2 100644
--- a/mm/kasan/kasan.h
+++ b/mm/kasan/kasan.h
@@ -582,6 +582,8 @@ void kasan_restore_multi_shot(bool enabled);
 
 void __asan_register_globals(void *globals, ssize_t size);
 void __asan_unregister_globals(void *globals, ssize_t size);
+void __asan_before_dynamic_init(const char *module_name);
+void __asan_after_dynamic_init(void);
 void __asan_handle_no_return(void);
 void __asan_alloca_poison(void *, ssize_t size);
 void __asan_allocas_unpoison(void *stack_top, ssize_t stack_bottom);
-- 
2.50.0.727.gbf7dc18ff4-goog

