Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E32C5194094
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:51:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864319; cv=none; b=na70eH1G0rhl3lFNlHuKi3wfilQk7XTZbGSpRz7bVoJN86rc/bUe9z/wpAAQUK+yzQ4HJvgrj9+r+cp5Mw7icZJCvahP24EmcEBEH3Chf41Ty7pPbPz/4KaUv/7VxTt9Fm4ug3K7Z9vgaIf0HpvzeXjwM8gZ5cBl3LHvzbvi39E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864319; c=relaxed/simple;
	bh=wxbjQtQtX8fLSr7iNlIYKxjBf3aHd2/Dvxt7JbRLvTA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=U2oUOaGaWIUoJd6gGpLbw64RFawQ6dm/3aMQUu3kb2/APy19X1cg8OYsiYYO0R6aw4sdBgBVUe1nsEoGOJchYiJh0Oqron3YlxQ2Lu5F9WJ7IARzxH/6csFiynszH1UHkk+/YU9HGYZpCb7fDuVY1pe2rfnqQI8jlu5FjKvcqIE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=zmAmxuiW; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="zmAmxuiW"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6P1ZNMzlgTyG;
	Thu,  6 Feb 2025 17:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864302; x=1741456303; bh=HwPpr
	LRUOkpF+tKeQG4OleE8tYtk+KNnPjV2TBsCN/4=; b=zmAmxuiWccNNVMv1p4AFm
	mpdEUR4b5qe1L+gTuSTs5fTcCt+Q9Jey0FDgWud6nY7TZUZXuU8Q1hEpKYaDti8B
	sxGYea/HstvBg7SpvGgwPaw/HqC22O55iOwnaQacl01JJqOU3phHNzwv8Kcrok6/
	PA4URNBGc4j+HEb6QVddC/5wYhbjllUBvitmTFlcTcNKWiR393YkG4vAPjqaod/X
	WrRhecxMHfZd3oshsa0svQI8rgm8nH2QL1gk4/8oZeb2cJ1EtaInNTt1LjwtyT/u
	hbFJWYJZfTZYHRFWrEDSuL/kXY8Zv+sqfw22MzulA6M/9zJH2mH1dFeQCsz2u4eo
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id DiXdzjiI6Mqd; Thu,  6 Feb 2025 17:51:42 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5q3RFZzlgTwl;
	Thu,  6 Feb 2025 17:51:27 +0000 (UTC)
From: Bart Van Assche <bvanassche@acm.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Marco Elver <elver@google.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Kees Cook <kees@kernel.org>,
	Jann Horn <jannh@google.com>,
	linux-kernel@vger.kernel.org,
	Bart Van Assche <bvanassche@acm.org>,
	Ingo Molnar <mingo@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>,
	Waiman Long <longman@redhat.com>
Subject: [PATCH RFC 03/33] locking: Introduce <linux/thread_safety.h>
Date: Thu,  6 Feb 2025 09:50:44 -0800
Message-ID: <20250206175114.1974171-4-bvanassche@acm.org>
X-Mailer: git-send-email 2.48.1.502.g6dc24dfdaf-goog
In-Reply-To: <20250206175114.1974171-1-bvanassche@acm.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Introduce a new kernel header with the Clang thread-safety attributes.
If:
- a struct that represents a synchronization object is annotated with the
  CAPABILITY() attribute,
- the operations on that synchronization object are annotated with the
  ACQUIRE() and RELEASE() attributes,
- if variables or members that should be guarded by a synchronization
  object are annotated with GUARDED_BY(),

then the Clang compiler verifies the following if -Wthread-safety is
enabled:
- Whether or not locking in a function implementation matches the
  thread-safety attributes in the function declaration. No annotation
  is necessary if a lock call is followed by an unlock call. For other
  patterns, annotation is required.
- Whether or not the requirements of the GUARDED_BY() annotations are
  met.

Some highlights from the Clang thread-safety attribute documentation:
- Alias analysis is not performed on thread-safety attribute arguments.
  Hence the expansion of some local variables in subsequent patches.
- Most thread-safety attributes affect the function interface.
  NO_THREAD_SAFETY_ANALYSIS only affects the function definition.
- If a private struct definition (in a .c file) includes a
  synchronization object, annotations of functions in .h files must
  not refer to the name of the private struct. A possible solution is
  to define a capability with DEFINE_CAPABILITY and to use the name of
  that capability in the thread-safety annotations.

A few notes from me:
- Thread-safety attributes are not included in function pointer types.
  In other words, when passing an annotated function as an argument to
  another function, the thread-safety attributes are discarded.
- Annotating conditional locking functions that return a pointer is not
  yet supported by Clang.

More information is available here:
https://clang.llvm.org/docs/ThreadSafetyAnalysis.html

In case anyone would be interested, the equivalent Qemu header file is
available here:
https://github.com/qemu/qemu/blob/master/include/qemu/clang-tsa.h

Cc: Ingo Molnar <mingo@redhat.com>
Cc: Will Deacon <will@kernel.org>
Cc: Boqun Feng <boqun.feng@gmail.com> (LOCKDEP & RUST)
Cc: Waiman Long <longman@redhat.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/thread_safety.h | 141 ++++++++++++++++++++++++++++++++++
 1 file changed, 141 insertions(+)
 create mode 100644 include/linux/thread_safety.h

diff --git a/include/linux/thread_safety.h b/include/linux/thread_safety.=
h
new file mode 100644
index 000000000000..e23175223a18
--- /dev/null
+++ b/include/linux/thread_safety.h
@@ -0,0 +1,141 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#ifndef _THREAD_SAFETY_H_
+#define _THREAD_SAFETY_H_
+
+/* See also https://clang.llvm.org/docs/ThreadSafetyAnalysis.html */
+
+/*
+ * Enable thread safety attributes only for clang. The attributes can be=
 safely
+ * ignored when compiling with other compilers.
+ */
+#if defined(__clang__)
+#define THREAD_ANNOTATION_ATTRIBUTE_(...) __attribute__((__VA_ARGS__))
+#else
+#define THREAD_ANNOTATION_ATTRIBUTE_(...)
+#endif
+
+/*
+ * Macro for applying a capability as an attribute to a type definition.
+ * This macro can be used in struct definitions and also in typedefs.
+ * @x must be a string.
+ */
+#define CAPABILITY(x) THREAD_ANNOTATION_ATTRIBUTE_(capability(x))
+
+/*
+ * Macro for defining a capability name that is not tied to an existing =
type.
+ * @capability_name is declared as an external variable. Any attempt to
+ * read or modify that external variable will result in a linker error.
+ */
+#define DEFINE_CAPABILITY(capability_name)	      \
+	extern const struct {} CAPABILITY(#capability_name) capability_name
+
+/*
+ * Attribute for structure members that declares that the structure memb=
ers are
+ * protected by the given capability.
+ */
+#define GUARDED_BY(x) THREAD_ANNOTATION_ATTRIBUTE_(guarded_by(x))
+
+/*
+ * Attribute for pointer structure members that declares that the conten=
ts
+ * of these pointers are protected by the given capability.
+ */
+#define PT_GUARDED_BY(x) THREAD_ANNOTATION_ATTRIBUTE_(pt_guarded_by(x))
+
+/*
+ * Attribute for instances of data structures that declares that the giv=
en
+ * capabilities must be acquired before the annotated data structure.
+ */
+#define ACQUIRED_BEFORE(...)					\
+	THREAD_ANNOTATION_ATTRIBUTE_(acquired_before(__VA_ARGS__))
+
+/*
+ * Attribute for instances of data structures that declares that the giv=
en
+ * capabilities must be acquired after the annotated data structure.
+ */
+#define ACQUIRED_AFTER(...)					\
+	THREAD_ANNOTATION_ATTRIBUTE_(acquired_after(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that the caller must have exclusive =
access
+ * to the given capabilities.
+ */
+#define REQUIRES(...)							\
+	THREAD_ANNOTATION_ATTRIBUTE_(requires_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that the caller must have shared acc=
ess
+ * to the given capabilities.
+ */
+#define REQUIRES_SHARED(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(requires_shared_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that the function acquires the given
+ * capability.
+ */
+#define ACQUIRE(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(acquire_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that the function acquires the given
+ * shared capability.
+ */
+#define ACQUIRE_SHARED(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(acquire_shared_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that the function releases the given
+ * capability.
+ */
+#define RELEASE(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(release_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that the function releases the given
+ * shared capability.
+ */
+#define RELEASE_SHARED(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(release_shared_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that a function only acquires the gi=
ven
+ * capability (2nd argument) for a given return value (first argument).
+ */
+#define TRY_ACQUIRE(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(try_acquire_capability(__VA_ARGS__))
+
+/*
+ * Function attribute that declares that a function only acquires the gi=
ven
+ * shared capability (2nd argument) for a given return value (first argu=
ment).
+ */
+#define TRY_ACQUIRE_SHARED(...)						\
+	THREAD_ANNOTATION_ATTRIBUTE_(try_acquire_shared_capability(__VA_ARGS__)=
)
+
+/*
+ * Function attribute that declares that the caller must not hold the gi=
ven
+ * capabilities.
+ */
+#define EXCLUDES(...) THREAD_ANNOTATION_ATTRIBUTE_(locks_excluded(__VA_A=
RGS__))
+
+/*
+ * Tell the compiler that the given capability is held.
+ */
+#define ASSERT_CAPABILITY(x) THREAD_ANNOTATION_ATTRIBUTE_(assert_capabil=
ity(x))
+
+/*
+ * Tell the compiler that the given shared capability is held.
+ */
+#define ASSERT_SHARED_CAPABILITY(x)				\
+	THREAD_ANNOTATION_ATTRIBUTE_(assert_shared_capability(x))
+
+/*
+ * Function attribute that declares that a function returns a pointer to=
 a
+ * capability.
+ */
+#define RETURN_CAPABILITY(x) THREAD_ANNOTATION_ATTRIBUTE_(lock_returned(=
x))
+
+/* Function attribute that disables thread-safety analysis. */
+#define NO_THREAD_SAFETY_ANALYSIS				\
+	THREAD_ANNOTATION_ATTRIBUTE_(no_thread_safety_analysis)
+
+#endif /* _THREAD_SAFETY_H_ */
