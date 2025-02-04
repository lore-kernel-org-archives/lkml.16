Received: from mblankhorst.nl (lankhorst.se [141.105.120.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E79525A657
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 13:01:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=141.105.120.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738674117; cv=none; b=puDwRu+QBzznj4JgcG24iLUaNF205YG0bjddJf8wGd+OXFYGcjf4IExp3zJm1tPORw8Gq7cb9EMYrAwGE6b25MuuVFkBo1ofaU/cOrPKEgQb2hqtMCxzu8O3b5W4baWJS1vf8UL/4YitX30RRn55juhpdn/GZtRlyav3rLwQo98=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738674117; c=relaxed/simple;
	bh=lLY7isZ2WSpKh9qUL9fRA9iy+6gQ/Zd09FdN8Dnhj9c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TdkcjEQrIb8zHbJqgLIQK3vkz+EjauB0btPRdGtD49ZjChUcBIIbOCLXDwR6c462lAFa/UlH1agzmnnYI826kFJ1sDTw5rHcMOQpdaP497b04RJIR0PvmR9wVT9RG1to8JT6yUg59ho4pjDdcNzGUopozoaaRqYu83evbn6WI8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se; spf=none smtp.mailfrom=mblankhorst.nl; arc=none smtp.client-ip=141.105.120.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=lankhorst.se
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=mblankhorst.nl
From: Maarten Lankhorst <dev@lankhorst.se>
To: intel-gfx@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	Maarten Lankhorst <dev@lankhorst.se>,
	Ingo Molnar <mingo@kernel.org>,
	David Lechner <dlechner@baylibre.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Boqun Feng <boqun.feng@gmail.com>
Subject: [PATCH 1/8] header/cleanup.h: Add _init_args to DEFINE_LOCK_GUARD_1(_COND)
Date: Tue,  4 Feb 2025 13:49:02 +0100
Message-ID: <20250204124909.158315-2-dev@lankhorst.se>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250204124909.158315-1-dev@lankhorst.se>
References: <20250204124909.158315-1-dev@lankhorst.se>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This makes it possible to use the lock guards for guards that need
extra arguments.

I've been attempting to add a guard to xe_force_wake handling, but that
required an extra argument specifying the domain. For nested spinlock
handling, it could also be beneficial to be able to do something like
this.

For example:
DEFINE_LOCK_GUARD_1_COND(spinlock_irqsave, _nested,
			 spin_lock_irqsave_nested(_T->lock, _T->flags, nest),
			 unsigned nest);

guard(spinlock_irqsave_nested, &lock, SINGLE_DEPTH_NESTING);

The first optional argument in DEFINE_LOCK_GUARD_1 is now used for the struct members,
the remainder goes to init_args to allow the same usage in the base case..

I'm abusing the preprocessor to add an extra meaning to the first optional
argument is done by creating a __DO_DEFINE_LOCK_GUARD_1, and passing
__VA_ARGS__ not ##__VA_ARGS__ to it to ensure _struct_members is empty
when not passed explicitly.

Cc: Ingo Molnar <mingo@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>
Cc: Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>
Cc: Waiman Long <longman@redhat.com>
Cc: Boqun Feng <boqun.feng@gmail.com>
---
 include/linux/cleanup.h | 30 +++++++++++++++++++-----------
 1 file changed, 19 insertions(+), 11 deletions(-)

diff --git a/include/linux/cleanup.h b/include/linux/cleanup.h
index ec00e3f7af2b3..dbaf02447f206 100644
--- a/include/linux/cleanup.h
+++ b/include/linux/cleanup.h
@@ -349,19 +349,23 @@ _label:									\
  * locks that don't have a native type (eg. RCU, preempt) or those that need a
  * 'fat' pointer (eg. spin_lock_irqsave).
  *
- * DEFINE_LOCK_GUARD_0(name, lock, unlock, ...)
- * DEFINE_LOCK_GUARD_1(name, type, lock, unlock, ...)
- * DEFINE_LOCK_GUARD_1_COND(name, ext, condlock)
+ * DEFINE_LOCK_GUARD_0(name, lock, unlock, _lock_members...)
+ * DEFINE_LOCK_GUARD_1(name, type, lock, unlock, (opt)_lock_members, _init_args...)
+ * DEFINE_LOCK_GUARD_1_COND(name, ext, condlock, _init_args...)
  *
  * will result in the following type:
  *
  *   typedef struct {
  *	type *lock;		// 'type := void' for the _0 variant
- *	__VA_ARGS__;
+ *	_lock_members;		// use ; as separator to add multiple members
  *   } class_##name##_t;
  *
  * As above, both _lock and _unlock are statements, except this time '_T' will
  * be a pointer to the above struct.
+ *
+ * For DEFINE_LOCK_GUARD_1 and DEFINE_LOCK_GUARD_1_COND, it adds all
+ * _init_args as local variables available to the lock statement.
+ * They need to be passed to all guard() functions as extra argument.
  */
 
 #define __DEFINE_UNLOCK_GUARD(_name, _type, _unlock, ...)		\
@@ -381,8 +385,8 @@ static inline void *class_##_name##_lock_ptr(class_##_name##_t *_T)	\
 }
 
 
-#define __DEFINE_LOCK_GUARD_1(_name, _type, _lock)			\
-static inline class_##_name##_t class_##_name##_constructor(_type *l)	\
+#define __DEFINE_LOCK_GUARD_1(_name, _type, _lock, ...)			\
+static inline class_##_name##_t class_##_name##_constructor(_type *l, ##__VA_ARGS__)	\
 {									\
 	class_##_name##_t _t = { .lock = l }, *_T = &_t;		\
 	_lock;								\
@@ -398,23 +402,27 @@ static inline class_##_name##_t class_##_name##_constructor(void)	\
 	return _t;							\
 }
 
-#define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
+#define __DO_DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, _lock_members, _init_args...) \
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
-__DEFINE_UNLOCK_GUARD(_name, _type, _unlock, __VA_ARGS__)		\
-__DEFINE_LOCK_GUARD_1(_name, _type, _lock)
+__DEFINE_UNLOCK_GUARD(_name, _type, _unlock, _lock_members)		\
+__DEFINE_LOCK_GUARD_1(_name, _type, _lock, ##_init_args)
+
+/* Call __DO_DEFINE_LOCK_GUARD_1 here because of the 2 optional arguments */
+#define DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, ...)		\
+	__DO_DEFINE_LOCK_GUARD_1(_name, _type, _lock, _unlock, __VA_ARGS__)
 
 #define DEFINE_LOCK_GUARD_0(_name, _lock, _unlock, ...)			\
 __DEFINE_CLASS_IS_CONDITIONAL(_name, false);				\
 __DEFINE_UNLOCK_GUARD(_name, void, _unlock, __VA_ARGS__)		\
 __DEFINE_LOCK_GUARD_0(_name, _lock)
 
-#define DEFINE_LOCK_GUARD_1_COND(_name, _ext, _condlock)		\
+#define DEFINE_LOCK_GUARD_1_COND(_name, _ext, _condlock, ...)		\
 	__DEFINE_CLASS_IS_CONDITIONAL(_name##_ext, true);		\
 	EXTEND_CLASS(_name, _ext,					\
 		     ({ class_##_name##_t _t = { .lock = l }, *_T = &_t;\
 		        if (_T->lock && !(_condlock)) _T->lock = NULL;	\
 			_t; }),						\
-		     typeof_member(class_##_name##_t, lock) l)		\
+		     typeof_member(class_##_name##_t, lock) l, ##__VA_ARGS__)		\
 	static inline void * class_##_name##_ext##_lock_ptr(class_##_name##_t *_T) \
 	{ return class_##_name##_lock_ptr(_T); }
 
-- 
2.47.1

