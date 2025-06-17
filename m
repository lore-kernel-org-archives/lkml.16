Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 956D52E719C
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193694; cv=none; b=MO/usR5EZ6Rc68d72YF6J7v1R8bPZuaA9Ri+4kmxQFv0F3hToggtOhAAZGvBueEze3l/kOc5ADrnhoEsOI2wxCxJy/H+MboVLsxIRz+4HadzpihcGdyqYYwsTgZE96iMAltIN1LZiZRCkkuEgvy2piW95bwId0lhn7KLirDHt+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193694; c=relaxed/simple;
	bh=9SzXJ15j3U8LLY/VYfOxt4So2V01/XoyuGBXz/ltQbU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FCAsyfnxTCfNB5hAgmOTvONaCsaWUS9e9WHKROuvCykF6SV9+oeiJ1j5PjHVAUaeIuaEtQerQk+IjEvnMJYaZJREp+3hjIba4vzhTB+xvxPI9gek9YEV/SVbcj86UmKybY115cOh0zxmtLoQjgCo1QMEiutMBD7CeZmLzsOcjcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mg8q6N+f; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mg8q6N+f"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31366819969so5454796a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750193692; x=1750798492; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z930P5mm/rRASOyUPDd8zyUujiTaQQWWaxXoM7MXu0=;
        b=mg8q6N+ffA75S5IVM0EC2MopHQuObSNb3Ix/ejaNQ+7XRoT12UqrZnULNe1K8a/78Y
         qpvOuHN0J/T4gY5ZrOS2O0er3j/xkpg+bJb9jqU4vQddQNCnGF8wygN8KFwPR7BTwCFO
         Bl3gkl5m9eOxoFlr8pjtWZvxAfC1sPd2xHSWe6FkD7S3A1fsLESlRkackXqp7CjqeYT7
         yxJ0eaMafQPGwVDMR82gZEpOiWBIKam/P4SYfL7BBe47RR5JmGBIVO7UG0+vJq8DUh/9
         mOOpnus5XdzfLey2vtHZBtSu5cZVSMwtu4IMOIMbwgmGUtt647o1r462b8EZVkOUJ/Oa
         B1RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193692; x=1750798492;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0Z930P5mm/rRASOyUPDd8zyUujiTaQQWWaxXoM7MXu0=;
        b=pxXx8ED+QAKd4r8Sf8vhjThubQDYL1IaUxwVirioAYhEjzOxKDV3OUGyUs+NL9UkYY
         seJEHplPciNbB6JKxCj9wbD4t1sJPX+w8Y6y2sqBJP/VEpToRCtXHxaHugKUaau3zs3j
         fjDLQM9M1mojJ9tbbh6Qg3m1XlSescRSk2kHosv1ckKfyJIX1J3Ipv7qIfLSVemlJiOi
         nCztTK7jVt9Wit7xLdLN9LtIrXktL4F//U+E0auhk5eVL3mSi8Ed0wlDShDvY4Y0Y5qj
         2+UsEuYgzbY9Pxb8RBZGC3BUtmQREERj6GvlM0+rYJrq8svC37K0WoHKGDr6JxUoq9Pl
         oYxw==
X-Forwarded-Encrypted: i=1; AJvYcCUeCK+8Ra5oi+EZ+bTGRgvFTMJGHNz69Pa6CUEuEvU05UQAYn3RZG+MrJSpl4QfDDvxhcQKQ7BejJnkTBo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6o0q8bufWHZMJhOmWqRE5rRWVEfBYtEPeTr6qOCFev/PJ+KPl
	7wtrcc4FfiykwEkEfsEygvLb7EdUMa4ZPxnp7KdJIHW0G8I8cE98gUy4dZpE9owy3lmFDoVn95N
	42nL3lZyejw==
X-Google-Smtp-Source: AGHT+IE0mdxRTfSCI/6oC+ccX8uVa0JxO7+mrJX+nZv1nNqdPCaIvUnYOQzT/HdQKuql5X7plbjVqBsZMCKh
X-Received: from pjbdy14.prod.google.com ([2002:a17:90b:6ce:b0:313:274d:3007])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:4d8c:b0:313:1c7b:fc62
 with SMTP id 98e67ed59e1d1-313f1d589b3mr17608382a91.22.1750193691931; Tue, 17
 Jun 2025 13:54:51 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:53:19 -0700
In-Reply-To: <20250617205320.1580946-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617205320.1580946-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250617205320.1580946-3-irogers@google.com>
Subject: [PATCH v2 2/3] tools headers: Update the linux/unaligned.h copy with
 the kernel sources
From: Ian Rogers <irogers@google.com>
To: Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

To pick up the changes in:

  fe9b2b7b3583 vdso: Switch get/put unaligned from packed struct to memcpy

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/vdso/unaligned.h | 48 +++++++++++++++++++++++++++++-----
 1 file changed, 42 insertions(+), 6 deletions(-)

diff --git a/tools/include/vdso/unaligned.h b/tools/include/vdso/unaligned.h
index ff0c06b6513e..f33c1eefbf68 100644
--- a/tools/include/vdso/unaligned.h
+++ b/tools/include/vdso/unaligned.h
@@ -2,14 +2,50 @@
 #ifndef __VDSO_UNALIGNED_H
 #define __VDSO_UNALIGNED_H
 
-#define __get_unaligned_t(type, ptr) ({							\
-	const struct { type x; } __packed * __get_pptr = (typeof(__get_pptr))(ptr);	\
-	__get_pptr->x;									\
+#define ____get_unaligned_type(type) type: (type)0
+/**
+ * __get_unaligned_t - read an unaligned value from memory.
+ * @ptr:	the pointer to load from.
+ * @type:	the type to load from the pointer.
+ *
+ * Use memcpy to affect an unaligned type sized load avoiding undefined behavior
+ * from approaches like type punning that require -fno-strict-aliasing in order
+ * to be correct. As type may be const, use _Generic to map to a non-const type
+ * - you can't memcpy into a const type. The void* cast silences ubsan warnings.
+ */
+#define __get_unaligned_t(type, ptr) ({					\
+	type __get_unaligned_map_ctrl = 0;				\
+	typeof(_Generic(__get_unaligned_map_ctrl,			\
+		____get_unaligned_type(short int),			\
+		____get_unaligned_type(unsigned short int),		\
+		____get_unaligned_type(int),				\
+		____get_unaligned_type(unsigned int),			\
+		____get_unaligned_type(long),				\
+		____get_unaligned_type(unsigned long),			\
+		____get_unaligned_type(long long),			\
+		____get_unaligned_type(unsigned long long),		\
+		default: (type)0					\
+		)) __get_unaligned_val;					\
+	(void)__get_unaligned_map_ctrl;					\
+	__builtin_memcpy(&__get_unaligned_val, (void *)(ptr),		\
+			 sizeof(__get_unaligned_val));			\
+	__get_unaligned_val;						\
 })
 
-#define __put_unaligned_t(type, val, ptr) do {						\
-	struct { type x; } __packed * __put_pptr = (typeof(__put_pptr))(ptr);		\
-	__put_pptr->x = (val);								\
+/**
+ * __put_unaligned_t - write an unaligned value to memory.
+ * @type:	the type of the value to store.
+ * @val:	the value to store.
+ * @ptr:	the pointer to store to.
+ *
+ * Use memcpy to affect an unaligned type sized store avoiding undefined
+ * behavior from approaches like type punning that require -fno-strict-aliasing
+ * in order to be correct. The void* cast silences ubsan warnings.
+ */
+#define __put_unaligned_t(type, val, ptr) do {				\
+	type __put_unaligned_val = (val);				\
+	__builtin_memcpy((void *)(ptr), &__put_unaligned_val,		\
+			 sizeof(__put_unaligned_val));			\
 } while (0)
 
 #endif /* __VDSO_UNALIGNED_H */
-- 
2.50.0.rc2.701.gf1e915cc24-goog

