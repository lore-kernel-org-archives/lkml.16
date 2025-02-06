Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128F0192D83
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 17:51:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738864317; cv=none; b=rhcG2ZUZu5g6dFhQq17AzZr9GtwEcuhxKdiyxGUFh121vD6AXgEK9wwINiWlf/ocV53TeDFhOsqIswBQ3eBLSGXoNfVELAcFMBC/qGrqKf9KojrSwKgzk3hJZztDZxX+qnaPEM4SkV4UYOzraViuqug4oqg38/lvrhqhtevRuk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738864317; c=relaxed/simple;
	bh=yvd40ayc4lt0VdMde0/G7GUyJrRdau2cQmg/1zBsTQc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DhSHQEjOT1Gq9EJlV65dhVxw9eGC5pMgcXT8zdiSFhL6P1R0PpmpA9Z1HrRjwmQLiwgCm+1F81nyYw5XZ5d/S5okZui8zKigsSpvcN9FlTfVulrWdWSkIPnet3RVz2VV6oQ0H2VkgGRaPQockqQoBH1kD8UOp/8YLu2KJw2bnkY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=qOnK9Sew; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="qOnK9Sew"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Ypl6M2j5CzlgTxr;
	Thu,  6 Feb 2025 17:51:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:mime-version:references:in-reply-to
	:x-mailer:message-id:date:date:subject:subject:from:from
	:received:received; s=mr01; t=1738864307; x=1741456308; bh=h54js
	8mdCmv6YKZaSfODTu+0+XwHbKqGesWQfSISX80=; b=qOnK9SewMSj+Y0XRWteIS
	eAkr9rqn/BycT4+16G5uo81N1Q27gTioVD8XVlpVy9GI74g0CYejoGGFKCh6++ft
	sHiMa0aC7zRZDxnwmJ/7ky2Xkh+nAY5khxTXUGmJ2fwq23zQOuRii+KGCTwJXV8R
	Awcyjeb2D/e87Mdv5KpYbnCTG/guwbHscV6ka/rf6Hho/oCWjlk7xGTn6LXC0miB
	F2z5XpTwaJRV5rusfmNG+uzzCse+hOJdNl+eMqxAkrDFWKgVAtfssJNFqV8c/KEY
	O9JiIglcCLaI5MiJ8hGMhV+rTb8iEtNWTd2K5MKIetucMqqRJUq+AC+YZaE20/Cg
	Q==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id CjARBNXoD-AC; Thu,  6 Feb 2025 17:51:47 +0000 (UTC)
Received: from bvanassche.mtv.corp.google.com (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4Ypl5t3lzyzlgTxg;
	Thu,  6 Feb 2025 17:51:30 +0000 (UTC)
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
	Bart Van Assche <bvanassche@acm.org>
Subject: [PATCH RFC 04/33] include/linux/cleanup.h: Support thread-safety analysis
Date: Thu,  6 Feb 2025 09:50:45 -0800
Message-ID: <20250206175114.1974171-5-bvanassche@acm.org>
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

Introduce variants of the DEFINE_CLASS(), DEFINE_GUARD() and
DEFINE_GUARD_COND() macros that support passing function attributes for t=
he
constructor functions.

Suppress thread-safety analysis for free functions because some free
functions change the state of synchronization objects. An example from
net/core/dev.h:

DEFINE_FREE(netdev_unlock, struct net_device *, if (_T) netdev_unlock(_T)=
);

Co-developed-by: Marco Elver <elver@google.com>
Signed-off-by: Bart Van Assche <bvanassche@acm.org>
---
 include/linux/cleanup.h | 34 ++++++++++++++++++++++++++--------
 1 file changed, 26 insertions(+), 8 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index ec00e3f7af2b..f6a42cac81c6 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -3,6 +3,7 @@
 #define _LINUX_CLEANUP_H
=20
 #include <linux/compiler.h>
+#include <linux/thread_safety.h>
=20
 /**
  * DOC: scope-based cleanup helpers
@@ -195,7 +196,8 @@
  */
=20
 #define DEFINE_FREE(_name, _type, _free) \
-	static inline void __free_##_name(void *p) { _type _T =3D *(_type *)p; =
_free; }
+	static inline void __free_##_name(void *p) NO_THREAD_SAFETY_ANALYSIS \
+	{ _type _T =3D *(_type *)p; _free; }
=20
 #define __free(_name)	__cleanup(__free_##_name)
=20
@@ -241,17 +243,25 @@ const volatile void * __must_check_fn(const volatil=
e void *val)
  */
=20
 #define DEFINE_CLASS(_name, _type, _exit, _init, _init_args...)		\
+	DEFINE_CLASS_ATTR(_name, _type, _exit,				\
+			  _init, NO_THREAD_SAFETY_ANALYSIS, _init_args)
+
+#define DEFINE_CLASS_ATTR(_name, _type, _exit, _init, _init_attr,	\
+			  _init_args...)				\
 typedef _type class_##_name##_t;					\
 static inline void class_##_name##_destructor(_type *p)			\
+	NO_THREAD_SAFETY_ANALYSIS					\
 { _type _T =3D *p; _exit; }						\
-static inline _type class_##_name##_constructor(_init_args)		\
+static inline _type class_##_name##_constructor(_init_args) _init_attr	\
 { _type t =3D _init; return t; }
=20
-#define EXTEND_CLASS(_name, ext, _init, _init_args...)			\
+#define EXTEND_CLASS(_name, ext, _init, _init_attr, _init_args...)	\
 typedef class_##_name##_t class_##_name##ext##_t;			\
 static inline void class_##_name##ext##_destructor(class_##_name##_t *p)=
\
+	NO_THREAD_SAFETY_ANALYSIS					\
 { class_##_name##_destructor(p); }					\
 static inline class_##_name##_t class_##_name##ext##_constructor(_init_a=
rgs) \
+	_init_attr							\
 { class_##_name##_t t =3D _init; return t; }
=20
 #define CLASS(_name, var)						\
@@ -291,17 +301,25 @@ static inline class_##_name##_t class_##_name##ext#=
#_constructor(_init_args) \
 #define __DEFINE_CLASS_IS_CONDITIONAL(_name, _is_cond)	\
 static __maybe_unused const bool class_##_name##_is_conditional =3D _is_=
cond
=20
-#define DEFINE_GUARD(_name, _type, _lock, _unlock) \
-	__DEFINE_CLASS_IS_CONDITIONAL(_name, false); \
-	DEFINE_CLASS(_name, _type, if (_T) { _unlock; }, ({ _lock; _T; }), _typ=
e _T); \
+#define DEFINE_GUARD(_name, _type, _lock, _unlock)			\
+	DEFINE_GUARD_ATTR(_name, _type, _lock, NO_THREAD_SAFETY_ANALYSIS,\
+			  _unlock)
+
+#define DEFINE_GUARD_ATTR(_name, _type, _lock, _lock_attr, _unlock)	\
+	__DEFINE_CLASS_IS_CONDITIONAL(_name, false);			\
+	DEFINE_CLASS_ATTR(_name, _type, if (_T) { _unlock; },		\
+		     ({ _lock; _T; }), _lock_attr, _type _T);		\
 	static inline void * class_##_name##_lock_ptr(class_##_name##_t *_T) \
 	{ return (void *)(__force unsigned long)*_T; }
=20
 #define DEFINE_GUARD_COND(_name, _ext, _condlock) \
+	DEFINE_GUARD_COND_ATTR(_name, _ext, _condlock, )
+
+#define DEFINE_GUARD_COND_ATTR(_name, _ext, _condlock, _condlock_attr)	 =
 \
 	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true); \
 	EXTEND_CLASS(_name, _ext, \
 		     ({ void *_t =3D _T; if (_T && !(_condlock)) _t =3D NULL; _t; }), =
\
-		     class_##_name##_t _T) \
+		     _condlock_attr, class_##_name##_t _T)		\
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *=
_T) \
 	{ return class_##_name##_lock_ptr(_T); }
=20
@@ -413,7 +431,7 @@ __DEFINE_LOCK_GUARD_0(_name, _lock)
 	EXTEND_CLASS(_name, _ext,					\
 		     ({ class_##_name##_t _t =3D { .lock =3D l }, *_T =3D &_t;\
 		        if (_T->lock && !(_condlock)) _T->lock =3D NULL;	\
-			_t; }),						\
+			_t; }),	,					\
 		     typeof_member(class_##_name##_t, lock) l)		\
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *=
_T) \
 	{ return class_##_name##_lock_ptr(_T); }
