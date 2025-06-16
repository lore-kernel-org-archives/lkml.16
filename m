Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61D062BD590
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:14:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750072484; cv=none; b=ocW6CXNpexQtgQUWAG7K0p2N9LKKoPar412NPfuhelAsz4asdfPeu2sTy2LWWBDo0ksV4HYbRsvw6yRXkKjet2/wl8Z1NFqnXpFKKNAIiET+UumPvc3ug+PQO2WtuKnFI0iEWXhliNf77fBPeTUPG+EtBFVkoGfu4XFAk85iTZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750072484; c=relaxed/simple;
	bh=6Q4lTW1IouaxpKB+d14X1ybS3qaRISqHEQ+qUwCTTnQ=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=kBYUVSWVCWTpYO5zp5IbOMyRf2VPG/72lfgUg12TVWyAibWDOT/a+6UOKWZ9JlUUsFL1uEvH+yUDux/hv6nQFRYmYTVZh11yqA/WewP14VnN33+nWV5py+czQRwokxyfPUl7yoE7/xiAmzDrgJFjKN09WlGH+GE1GG5nXzvZ2P4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GH08SmwE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GH08SmwE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-311d5fdf1f0so4118386a91.1
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 04:14:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750072482; x=1750677282; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=hO4WaEugtaUK+DaSYAXwZc4Zo1ulGjOjTT5MVAqXqNk=;
        b=GH08SmwEyU8YrM+IHEhGKIngg/HMGDaNpbtpGDee24MamXjka8gT7JoP5wiPaeoz/Z
         k9n+cve+8WG6ny8tcTrVgkKgfA5jEj0/rMatqtyt0dB2oCPHuBlQv0BhDzy/7CUkKCIz
         2C7xtbNokR376cCJhVFMo4+9oKAlo4Xe0BP122DNlUt1SlB8ZugtEhcsvoPIbgIy6oM1
         AQY470mzCRGrtdCa/1s4Zaqa8XZT0MUwnc428qwGfbQafBmBGA9fBgRMGiXsU5CG8f3l
         zHIjMTmjuI3f73nvc8qfMbHesLwQ5kCZ38WOtajJyALSTH79sTzQaDChpLVblAnDaEwK
         6zUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750072482; x=1750677282;
        h=content-transfer-encoding:mime-version:message-id:date:subject:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hO4WaEugtaUK+DaSYAXwZc4Zo1ulGjOjTT5MVAqXqNk=;
        b=UJxk8rq6548C87QytXmWGvtwnl0py2UjE0dwKTeiWPk2jLA1ChiN/MjfSkTeGB3xGE
         0tCF3L27683vzBv3J5z050HjjChqch1hOz+lQQlauXlqMrGtPRLyjeI6xbBXLFzCmsli
         qdSu22NJcbmxXxu9cjwUIS1vOAt/ipFpk3RZBtlEEObV5uXXykUblwwBoYK8cTO1XuL7
         Ox6Tq6F2rM+M0bfEb7D786z+YWZ+UHeyA2GsXZdHcXRZFDuqTlbij451432Ax9misk5W
         sgZQF3k9QJu4JJiOSPTzes2S9SgaAtMAAn1cjzyv3cfPQMi4eNX2wbr7HHslo8XnYNFi
         u/IQ==
X-Forwarded-Encrypted: i=1; AJvYcCX71xP3w0E5/hjjinSdREg3iB95ilh6XJP2V4bmUZH//8Q7+kCAHaCEtpZZjajy8HS/uZf9hC5vD7omPT8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVczRQkaELHkNZotvBIoMcNRDVjgrLzK62pehJzPrYiOMkgan8
	j7Z6o2W5eqANoC9ZDnIMElXcdnU1xzARxMUMGA2vux/gk4ejriEDbm5XqX9D9PVa
X-Gm-Gg: ASbGnctUmgFgJTEW6ksaR1kYvWQdlxQUh+IxpKgbSbVeRXELZYp4biGkOwIFNjHYwZX
	ZrDeBzka4qBEOPWKaGBIlAjNsf1N4WL3b5c4MP2dVVeGt5j+yHUvpA4v4HgW3cX3esN5HSTisA6
	QLY0uY01SSYw1M1rEX0+8Njlhp1KgnzMnOiUVz+3PbmZoBnTYqCEE/wXTq4/38QBuTCnJBjd5E4
	ThbAu1jEVqjkyMnxgcg9D8k58hSOIT9eq3Apjg4OjkwEDNQI1+6qo7Iy05Eq3YRBeqI1QmxCfgY
	2kzgetXSSSe+WnSTL2luNZDtxNZW5+k37tugn1vAMzLsk3xcwgMHycprv0GMl0Nuobkh2Dr83Jg
	=
X-Google-Smtp-Source: AGHT+IFBUZ4AYnjT0CbC/b345pJnEx6Wv33Y68oKJi7yPJRqZXJfMIhyuCZh3kuC7UoKFDDUxaGSKA==
X-Received: by 2002:a17:90b:52c6:b0:311:e8cc:424c with SMTP id 98e67ed59e1d1-313f1dee421mr13889091a91.25.1750072481563;
        Mon, 16 Jun 2025 04:14:41 -0700 (PDT)
Received: from localhost ([180.172.46.169])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365de78292sm58444295ad.133.2025.06.16.04.14.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 04:14:41 -0700 (PDT)
From: Jemmy Wong <jemmywong512@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Dan Williams <dan.j.williams@intel.com>,
	Christian Brauner <brauner@kernel.org>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	=?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
	David Lechner <dlechner@baylibre.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Jemmy Wong <jemmywong512@gmail.com>,
	Ingo Molnar <mingo@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v0] [RFC] cleanup: Unify DEFINE_LOCK_GUARD_0 and DEFINE_LOCK_GUARD_1
Date: Mon, 16 Jun 2025 19:14:36 +0800
Message-ID: <20250616111436.665171-1-jemmywong512@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

This patch consolidates the DEFINE_LOCK_GUARD_0 and DEFINE_LOCK_GUARD_1
macros into a single, unified 'DEFINE_LOCK_GUARD' macro to provide
a consistent and simplified API for lock guard definitions.

API changes:
From    DEFINE_LOCK_GUARD_0(name, lock, unlock, ...)
to      DEFINE_LOCK_GUARD(name, *void*, lock, unlock, ...)

From    DEFINE_LOCK_GUARD_1(name, type, lock, unlock, ...)
to      DEFINE_LOCK_GUARD(name, type, lock, unlock, ...)

From    CLASS(name, var)(args...)
to      CLASS(name, var, args...)

From    guard(name)(args)
to      guard(name, args)

No change:
scoped_guard(name, args...)
scoped_cond_guard(name, fail, args...)

---

Deailted changes:

- DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)
The void type for _init_args is not required when the constructor takes no arguments,
as an int argc is implicitly inserted as the first argument. (int argc, void) is an error.

This patch includes only the core changes.
Follow-up patches will be submitted once the approach is accepted.

Best,
Jemmy

---
 include/linux/cleanup.h | 50 +++++++++++++++++++++++++++++++----------
 1 file changed, 38 insertions(+), 12 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index 7093e1d08af0..2a4c3a96d37b 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -2,6 +2,7 @@
 #ifndef _LINUX_CLEANUP_H
 #define _LINUX_CLEANUP_H

+#include <linux/stdarg.h>
 #include <linux/compiler.h>

 /**
@@ -259,24 +260,28 @@ const volatile void * __must_check_fn(const volatile void *val)
  *	// use 'f' without concern
  */

+#define __ARGC(_9, _8, _7, _6, _5, _4, _3, _2, _1, N, ...)		N
+#define ARGC(...) __ARGC(9, ##__VA_ARGS__, 8, 7, 6, 5, 4, 3, 2, 1, 0)
+
 #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
 typedef _type class_##_name##_t;					\
 static inline void class_##_name##_destructor(_type *p)			\
 { _type _T = *p; _exit; }						\
-static inline _type class_##_name##_constructor(_init_args)		\
+static inline _type class_##_name##_constructor(int argc, ##_init_args)	\
 { _type t = _init; return t; }

 #define EXTEND_CLASS(_name, ext, _init, _init_args...)			\
 typedef class_##_name##_t class_##_name##ext##_t;			\
 static inline void class_##_name##ext##_destructor(class_##_name##_t *p)\
 { class_##_name##_destructor(p); }					\
-static inline class_##_name##_t class_##_name##ext##_constructor(_init_args) \
+static inline class_##_name##_t class_##_name##ext##_constructor(int argc, ##_init_args) \
 { class_##_name##_t t = _init; return t; }

-#define CLASS(_name, var)						\
+#define __CLASS(_name, var, argc, args...)						\
 	class_##_name##_t var __cleanup(class_##_name##_destructor) =	\
-		class_##_name##_constructor
+		class_##_name##_constructor(argc, ##args)

+#define CLASS(_name, var, args...) __CLASS(_name, var, ARGC(args), ##args)

 /*
  * DEFINE_GUARD(name, type, lock, unlock):
@@ -334,8 +339,8 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
 	{ return class_##_name##_lock_ptr(_T); }

-#define guard(_name) \
-	CLASS(_name, __UNIQUE_ID(guard))
+#define guard(_name, args...) \
+	__CLASS(_name, __UNIQUE_ID(guard), ARGC(args), ##args)

 #define __guard_ptr(_name) class_##_name##_lock_ptr
 #define __is_cond_ptr(_name) class_##_name##_is_conditional
@@ -349,8 +354,8 @@ static __maybe_unused const bool class_##_name##_is_conditional = _is_cond
  * It is needed because the other part - "__guard_ptr(_name)(&scope)" - is too
  * hard to deduce (even if could be proven true for unconditional locks).
  */
-#define __scoped_guard(_name, _label, args...)				\
-	for (CLASS(_name, scope)(args);					\
+#define __scoped_guard(_name, _label, argc, args...)			\
+	for (__CLASS(_name, scope, argc, ##args);			\
 	     __guard_ptr(_name)(&scope) || !__is_cond_ptr(_name);	\
 	     ({ goto _label; }))					\
 		if (0) {						\
@@ -359,10 +364,10 @@ _label:									\
 		} else

 #define scoped_guard(_name, args...)	\
-	__scoped_guard(_name, __UNIQUE_ID(label), args)
+	__scoped_guard(_name, __UNIQUE_ID(label), ARGC(args), ##args)

-#define __scoped_cond_guard(_name, _fail, _label, args...)		\
-	for (CLASS(_name, scope)(args); true; ({ goto _label; }))	\
+#define __scoped_cond_guard(_name, _fail, _label, argc, args...)	\
+	for (__CLASS(_name, scope, argc, ##args); true; ({ goto _label; }))	\
 		if (!__guard_ptr(_name)(&scope)) {			\
 			BUILD_BUG_ON(!__is_cond_ptr(_name));		\
 			_fail;						\
@@ -371,7 +376,7 @@ _label:									\
 		} else

 #define scoped_cond_guard(_name, _fail, args...)	\
-	__scoped_cond_guard(_name, _fail, __UNIQUE_ID(label), args)
+	__scoped_cond_guard(_name, _fail, __UNIQUE_ID(label), ARGC(args), ##args)

 /*
  * Additional helper macros for generating lock guards with types, either for
@@ -423,6 +428,27 @@ static inline class_##_name##_t class_##_name##_constructor(void)	\
 	return _t;							\
 }

+#define __DEFINE_LOCK_GUARD(_name, _type, _lock)			\
+	static inline class_##_name##_t class_##_name##_constructor_x(void *l) { \
+		class_##_name##_t _t = { .lock = (_type *)l },		\
+		*_T __maybe_unused = &_t;				\
+		_lock;							\
+		return _t;						\
+	}								\
+	static inline class_##_name##_t class_##_name##_constructor(int argc, ...) { \
+		BUILD_BUG_ON(argc > 1);					\
+		va_list args;  						\
+		va_start(args, argc);                              	\
+		void *arg = argc ? va_arg(args, _type *) : (void *)8;	\
+		va_end(args);                                       	\
+		return class_##_name##_constructor_x(arg);		\
+	}
+
+#define DEFINE_LOCK_GUARD(_name, _type, _lock, _unlock, ...)		\
+	__DEFINE_CLASS_IS_CONDITIONAL(_name, false);			\
+	__DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)	\
+	__DEFINE_LOCK_GUARD(_name, _type, _lock)
+
 #define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
 __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)		\
--
2.43.0
