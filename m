Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E52DD23A9B8
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 22:54:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747868054; cv=none; b=CL7oi1B0HBNqXU1opaDXiS1Iin2deN1tfiedzB56StfcN099FuZYX5x7NAOIRqexctg1DZwlhRPrHMxmREpp+eWKaOu9pIpmEULwVK7afGrBAUSzWtN38XpUGRmWTaEM/sn5QfiytRalYR18J5NcsTiNARDbMXjcrtjsTP8qvz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747868054; c=relaxed/simple;
	bh=i4qJcHC4AXmCz4+v5m4Aw3Tqwh0i/7XUMvLhkU4ocZg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=Pu29aOETUODLeLT0ltf1sOB/1RBMomPOcoeEjXEHH5ZK9fAEqnrEB2cqgIu2f/QjSDjtvjkLleHBLq2IGtenWS2KvcDIZIDw+eC+bnphEbLA45QNdQ3cYP4E4eoMW8CL+yQT3rtavVPp84wNLvUZWfub8yNotkxKsQ/tlIKJFKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mTzeFZxc; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--yuzhuo.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mTzeFZxc"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e9e81d4b0so6665392a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 15:54:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747868052; x=1748472852; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MTjLK1VK7KWwntnP1zRVvSaeiNRGhMUiu9M8vIKuSKI=;
        b=mTzeFZxcoYmGHDiOTWbMhb/A88Ce85Wa4fxnVOJmIbCIsnaMRHLMk9hLQqe5CcZ6aE
         bKaajKTz9rp7/Kn6TEiPF7dr1f7uoY0ojA65h7pz5m60woaw8/qH0v2PYYtXHR6S24ee
         fJURDcVsXYT4KFhaSYOhltdM3RCtJ+m2bzits018fjBbzlL3nNGRmWJgIIiq0cuRbLrB
         gx8aWvMJuHxFsp48jP5WXzghB8kI5pwBt9E9GTYxjvDFjf6tfm+1TtfaGkQQwwfqrZeG
         QB4rBN3NIZ2dqm6PIJ3CTFag+ZJj+DL1E+uZOY9khoQq/DrKa+BpfWv/8KUAoIT9wE6O
         jfWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747868052; x=1748472852;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MTjLK1VK7KWwntnP1zRVvSaeiNRGhMUiu9M8vIKuSKI=;
        b=IF33mBh+iiJ/Zo2ymoS43wZudHszprWS4CJ7ZZLYFrNS7oq0wwlsUqRCX0gwS4465x
         Jg1ZBx2Np4UlJCXRKErKztXfsQpXjo/Qqo7MutqO69LHf/4o45Qvyx6dcxKwAGwAUHWB
         9n8/0Zqoma8HZnN2KaHIXh1v5iUk8M84GxOUigTBA+8iCc+vkxZ6pp+P7fW+JJPXVOho
         ZXQtneb+xGHQOl63NMP/C+IMKS+7Hmg/0LNj2rNel3gOCiQShpZlaNgYIlmfLJDATDgL
         N98+dj92DFsvW08j4QHsN4uHgs/ednRpkjf/1tOlkvBocvjmVBdljOu8/WiM1pjiWTN0
         P0Lg==
X-Forwarded-Encrypted: i=1; AJvYcCXNQvt+CMzhbqIn/kbMORjgyYo2kPl6Qyw3sB5PODSL7p6PUgvhjbGJThhzOcRx8MQbRCD6D3i08vO3U3Y=@vger.kernel.org
X-Gm-Message-State: AOJu0YxdWbec2GscnjKMEGJ6kTRJUaEzs3XjW1MKYwe9YUqWmPOsVRQs
	QUEIBlCnZCk3uVzRk+0UUQjPjmch+Lgg5wrsY0OjmvSjzR8kB2ZWreWrpmIDrBxCsJuprXe3lLG
	af+w62w==
X-Google-Smtp-Source: AGHT+IFmnmxwO0MLdVfjk/jYioN8tCVaKs4uDbmfl+l9zYOM4srNZri9GV62ypwvXHSucke23gOipFD43Yk=
X-Received: from plkg8.prod.google.com ([2002:a17:903:19c8:b0:223:242b:480a])
 (user=yuzhuo job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:d543:b0:22f:af3f:bf22
 with SMTP id d9443c01a7336-231de3ba64fmr296480105ad.42.1747868052157; Wed, 21
 May 2025 15:54:12 -0700 (PDT)
Date: Wed, 21 May 2025 15:53:04 -0700
In-Reply-To: <20250521225307.743726-1-yuzhuo@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250521225307.743726-1-yuzhuo@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <20250521225307.743726-2-yuzhuo@google.com>
Subject: [PATCH v1 1/4] perf utils: Add support functions for sha1 utils
From: Yuzhuo Jing <yuzhuo@google.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	Liang Kan <kan.liang@linux.intel.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, "Steven Rostedt (Google)" <rostedt@goodmis.org>, 
	James Clark <james.clark@linaro.org>, Tomas Glozar <tglozar@redhat.com>, Leo Yan <leo.yan@arm.com>, 
	Guilherme Amadio <amadio@gentoo.org>, Yuzhuo Jing <yuzhuo@google.com>, 
	Yang Jihong <yangjihong@bytedance.com>, 
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>, Adhemerval Zanella <adhemerval.zanella@linaro.org>, 
	Wei Yang <richard.weiyang@gmail.com>, Ard Biesheuvel <ardb@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Athira Rajeev <atrajeev@linux.vnet.ibm.com>, 
	Kajol Jain <kjain@linux.ibm.com>, Aditya Gupta <adityag@linux.ibm.com>, 
	Charlie Jenkins <charlie@rivosinc.com>, "Steinar H. Gunderson" <sesse@google.com>, 
	"Dr. David Alan Gilbert" <linux@treblig.org>, Herbert Xu <herbert@gondor.apana.org.au>, 
	Jeff Johnson <jeff.johnson@oss.qualcomm.com>, Al Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Add missing functions to the shrunk down version tools headers from the
kernel headers to support sha1 utils.

Signed-off-by: Yuzhuo Jing <yuzhuo@google.com>
---
 tools/include/linux/bitops.h   | 10 ++++++++++
 tools/include/linux/compiler.h | 17 +++++++++++++++++
 tools/include/linux/string.h   | 22 ++++++++++++++++++++++
 3 files changed, 49 insertions(+)

diff --git a/tools/include/linux/bitops.h b/tools/include/linux/bitops.h
index b4e4cd071f8c..6a027031225c 100644
--- a/tools/include/linux/bitops.h
+++ b/tools/include/linux/bitops.h
@@ -89,6 +89,16 @@ static inline __u32 rol32(__u32 word, unsigned int shift)
 	return (word << shift) | (word >> ((-shift) & 31));
 }
 
+/**
+ * ror32 - rotate a 32-bit value right
+ * @word: value to rotate
+ * @shift: bits to roll
+ */
+static inline __u32 ror32(__u32 word, unsigned int shift)
+{
+	return (word >> (shift & 31)) | (word << ((-shift) & 31));
+}
+
 /**
  * sign_extend64 - sign extend a 64-bit value using specified bit as sign-bit
  * @value: value to sign extend
diff --git a/tools/include/linux/compiler.h b/tools/include/linux/compiler.h
index 9c05a59f0184..72e92b202976 100644
--- a/tools/include/linux/compiler.h
+++ b/tools/include/linux/compiler.h
@@ -40,6 +40,23 @@
 /* The "volatile" is due to gcc bugs */
 #define barrier() __asm__ __volatile__("": : :"memory")
 
+#ifndef barrier_data
+/*
+ * This version is i.e. to prevent dead stores elimination on @ptr
+ * where gcc and llvm may behave differently when otherwise using
+ * normal barrier(): while gcc behavior gets along with a normal
+ * barrier(), llvm needs an explicit input variable to be assumed
+ * clobbered. The issue is as follows: while the inline asm might
+ * access any memory it wants, the compiler could have fit all of
+ * @ptr into memory registers instead, and since @ptr never escaped
+ * from that, it proved that the inline asm wasn't touching any of
+ * it. This version works well with both compilers, i.e. we're telling
+ * the compiler that the inline asm absolutely may see the contents
+ * of @ptr. See also: https://llvm.org/bugs/show_bug.cgi?id=15495
+ */
+# define barrier_data(ptr) __asm__ __volatile__("": :"r"(ptr) :"memory")
+#endif
+
 #ifndef __always_inline
 # define __always_inline	inline __attribute__((always_inline))
 #endif
diff --git a/tools/include/linux/string.h b/tools/include/linux/string.h
index 8499f509f03e..df3c95792a51 100644
--- a/tools/include/linux/string.h
+++ b/tools/include/linux/string.h
@@ -3,6 +3,7 @@
 #define _TOOLS_LINUX_STRING_H_
 
 #include <linux/types.h>	/* for size_t */
+#include <linux/compiler.h>	/* for barrier_data */
 #include <string.h>
 
 void *memdup(const void *src, size_t len);
@@ -52,4 +53,25 @@ extern void remove_spaces(char *s);
 
 extern void *memchr_inv(const void *start, int c, size_t bytes);
 extern unsigned long long memparse(const char *ptr, char **retptr);
+
+/**
+ * memzero_explicit - Fill a region of memory (e.g. sensitive
+ *		      keying data) with 0s.
+ * @s: Pointer to the start of the area.
+ * @count: The size of the area.
+ *
+ * Note: usually using memset() is just fine (!), but in cases
+ * where clearing out _local_ data at the end of a scope is
+ * necessary, memzero_explicit() should be used instead in
+ * order to prevent the compiler from optimising away zeroing.
+ *
+ * memzero_explicit() doesn't need an arch-specific version as
+ * it just invokes the one of memset() implicitly.
+ */
+static inline void memzero_explicit(void *s, size_t count)
+{
+	memset(s, 0, count);
+	barrier_data(s);
+}
+
 #endif /* _TOOLS_LINUX_STRING_H_ */
-- 
2.49.0.1164.gab81da1b16-goog

