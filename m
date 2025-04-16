Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE920235BFF
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 08:55:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744793720; cv=none; b=HC+KbbfaD94BBYn5vPnHmWM3CRCIykUlklg4eM9gWtk6eKY16cM3xp1PY3eu6JFvR96s+NwTEJThK0YU4xZdZI9E+Y3XdSqErLDXrb+xfpvN9EZukCPK7fiU+syXNFSHVTYHhKRO1RRH6Oy49y9Bwn2fk083M/A43hjQYOH8uVU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744793720; c=relaxed/simple;
	bh=5LBeZUOimaQ9vgaU+v5OspIev/8kHog8cARhuN1dCts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tY/MDsdDbqy4WUUVDIhfsfjZ56dPIvZOhyL6Ksa3ZLfylDfMZa3aqFVf8HdJe+6dXqMTiG1b6Ne4rI1S8FwY51abTT72fuapVnIR9lnrbB7tLavmN4lkTcHwidGtzzEinHPs0g6jd4MeJ73/qnFi2nwd+QmciO/Ypi04Jv6RoNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P6kwwoTC; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P6kwwoTC"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ac737973d03so438801366b.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 01:55:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744793716; x=1745398516; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc2x1kjeEyidtKH2uktLTwpBYFAA28n/I/Yhs6L1K7g=;
        b=P6kwwoTC6qv476hNCllPrSAUx15WSyPMbRM1DlFqdZWTJgDTSg7dCe5/ZMfKB6d6/Q
         Mf0RFzsps/47cOssnz8cq3pOfjzwnoKFErJ6vEKIGhDHJh1O987S8uMD3AGYZDq2n4dQ
         6d6LauufxHNccZwMeaY0ouaGsSJ62fzw/1Tl6XD74o6yvvkxoimzEd0mQs05CQvipV4D
         hPtc2hlNii73TKck5X88g2xZmA5C7UJIcKck7PaF2rSoWAm8hBoT77AlD11yQhNMAfkO
         jE4G/+BEjhRnsgzGGt/Ar606k4d+zE76b0Ekjc1DACLQqeWO9TVJ7jMjlT5NLKFhhAfC
         o01Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744793716; x=1745398516;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zc2x1kjeEyidtKH2uktLTwpBYFAA28n/I/Yhs6L1K7g=;
        b=D+2cLgVamy4XkbwiAt+LXyMsUL6teMAMwn51lHoJ2RxnfPiKvj9+1XJ13256VUEwln
         cCh4RqV0G6mlGczZC+lPtDav3zeEDMhadJmSf20+ww/aWcTkGTEZ6NgsMdcYAFyjp4PF
         bCoUpEL/a0eW6CTci1N9savZ/JLEtG1jOesDwWGoc8beQ9PZvKcNRA2OtZ4g/nse+i28
         F/zAzeTtCTobXZxYgfZFrZW5uO3taDORjclkejz5DxdIzu+OXuoW2Dx9+9cCeusxBzO5
         UW36qUFn2IiqMSz3+aHLYcb+OD2L33j+/x7tJPjmocDsVLDb1vp0VIzrKPshfMem+p+l
         zNww==
X-Forwarded-Encrypted: i=1; AJvYcCXXt2fk6CSeIxYtzNp2OnpCLGiXVpCZGz8ws4f13DolNdoZ//74LjBGIUmdg7rAEQnRPM/4gF923PCFPuI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg0CaIF2FlxNrSqsL5G7YyIk6XSMlE1iEd0WCchewOe3XNhNZp
	Sa187VRReY4K1Vew6RzjCEMsVrAuLfRE4/bc2TgqHaSvm4TvBrMy+h/H7jmTvNjC51f3Ie3n4QL
	55Q==
X-Google-Smtp-Source: AGHT+IFCGzvTikBw+YoyEU2VTSvmPZU9EeQkTPgq9teicmMWsnUZMgILdju6RjbTnmnyAorVu8B4VqFNbRQ=
X-Received: from edro11.prod.google.com ([2002:aa7:d3cb:0:b0:5f4:b068:4902])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6402:5203:b0:5ed:89f0:27fd
 with SMTP id 4fb4d7f45d1cf-5f4b74b2309mr852670a12.19.1744793716020; Wed, 16
 Apr 2025 01:55:16 -0700 (PDT)
Date: Wed, 16 Apr 2025 10:54:45 +0200
In-Reply-To: <20250416085446.480069-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250416085446.480069-1-glider@google.com>
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250416085446.480069-8-glider@google.com>
Subject: [PATCH 7/7] mm/kasan: define __asan_before_dynamic_init, __asan_after_dynamic_init
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
 mm/kasan/generic.c | 18 ++++++++++++++++++
 mm/kasan/kasan.h   |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/mm/kasan/generic.c b/mm/kasan/generic.c
index d54e89f8c3e76..91067bb63666e 100644
--- a/mm/kasan/generic.c
+++ b/mm/kasan/generic.c
@@ -238,6 +238,24 @@ void __asan_unregister_globals(void *ptr, ssize_t size)
 }
 EXPORT_SYMBOL(__asan_unregister_globals);
 
+#if defined(CONFIG_KCOV_ENABLE_GUARDS)
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
2.49.0.604.gff1f9ca942-goog

