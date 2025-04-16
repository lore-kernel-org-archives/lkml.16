Received: from smtp-42ae.mail.infomaniak.ch (smtp-42ae.mail.infomaniak.ch [84.16.66.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 878641A3178
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 15:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=84.16.66.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744818453; cv=none; b=LpfbyB/z7S6g6ZHdUn9NK+AR0Eo/83HvCMMJ72om88+AYdQvc3tgzeUZHgH/hXf+9sNi2p9+Iy80ThTbgXkrfr947CtHwKndt10G64+wwv1uk41F5KJTvbdKXkrWMKs7lCNnNM435pjVzW5YoVze/N7svGLwedDDERz8zzkVRbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744818453; c=relaxed/simple;
	bh=/t7zi7W5MnM3aezDK42mrtqpBH5BECfU2Qm1L2hCkVU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=TYbQU7dodSzFlC6EwMUwOGr+SaKytCy1RRzXFMqeCH+Ku5by4GMonVfpOMDv050vlWeDR8O/fiqPzAAmUvbnPwNzO1VLBzDYCExLvBd3GmPSqwwgN1yg6uv2/JoIZoosmI1uytq34aIS88FraDffsrOgkdfhvDN5daDXsx4mRRo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net; spf=pass smtp.mailfrom=digikod.net; dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b=cKjQDgYu; arc=none smtp.client-ip=84.16.66.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=digikod.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=digikod.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=digikod.net header.i=@digikod.net header.b="cKjQDgYu"
Received: from smtp-3-0001.mail.infomaniak.ch (unknown [IPv6:2001:1600:4:17::246c])
	by smtp-3-3000.mail.infomaniak.ch (Postfix) with ESMTPS id 4Zd54v4MyFzYSS;
	Wed, 16 Apr 2025 17:47:27 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=digikod.net;
	s=20191114; t=1744818447;
	bh=qOAwZ0d5pf1XWzOHa2a243qOkDeO0hPUMoUtrvmWtko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=cKjQDgYurF6JwjptZqp6l5j7BcjP89dAGgz+W9VPzzdaDPOhpb9wWtWFA5g6eTl/b
	 Zb2YvUgk5eXdZFvDatuFAqiCgM9sY+uDmEn8w0wZH06Xz6q2H07hw6IKUBCj0bLK8J
	 gngUVt7hwg5ZaiktWny7IB2P6zzGKBineEGHqTy0=
Received: from unknown by smtp-3-0001.mail.infomaniak.ch (Postfix) with ESMTPA id 4Zd54v0T9hzpJQ;
	Wed, 16 Apr 2025 17:47:27 +0200 (CEST)
From: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>
To: =?UTF-8?q?G=C3=BCnther=20Noack?= <gnoack@google.com>
Cc: =?UTF-8?q?Micka=C3=ABl=20Sala=C3=BCn?= <mic@digikod.net>,
	linux-security-module@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Paul Moore <paul@paul-moore.com>
Subject: [PATCH v1 2/3] landlock: Fix documentation for landlock_restrict_self(2)
Date: Wed, 16 Apr 2025 17:47:12 +0200
Message-ID: <20250416154716.1799902-2-mic@digikod.net>
In-Reply-To: <20250416154716.1799902-1-mic@digikod.net>
References: <20250416154716.1799902-1-mic@digikod.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Infomaniak-Routing: alpha

Fix, deduplicate, and improve rendering of landlock_restrict_self(2)'s
flags documentation.

The flags are now rendered like the syscall's parameters and
description.

Cc: Günther Noack <gnoack@google.com>
Cc: Paul Moore <paul@paul-moore.com>
Signed-off-by: Mickaël Salaün <mic@digikod.net>
---
 include/uapi/linux/landlock.h | 61 +++++++++++++++++++++--------------
 security/landlock/syscalls.c  | 12 +++----
 2 files changed, 42 insertions(+), 31 deletions(-)

diff --git a/include/uapi/linux/landlock.h b/include/uapi/linux/landlock.h
index 9a4b64be9869..8b2a1dc5c70b 100644
--- a/include/uapi/linux/landlock.h
+++ b/include/uapi/linux/landlock.h
@@ -69,31 +69,42 @@ struct landlock_ruleset_attr {
 #define LANDLOCK_CREATE_RULESET_ERRATA			(1U << 1)
 /* clang-format on */
 
-/*
- * sys_landlock_restrict_self() flags:
- *
- * - %LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF: Do not create any log related to the
- *   enforced restrictions.  This should only be set by tools launching unknown
- *   or untrusted programs (e.g. a sandbox tool, container runtime, system
- *   service manager).  Because programs sandboxing themselves should fix any
- *   denied access, they should not set this flag to be aware of potential
- *   issues reported by system's logs (i.e. audit).
- * - %LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON: Explicitly ask to continue
- *   logging denied access requests even after an :manpage:`execve(2)` call.
- *   This flag should only be set if all the programs than can legitimately be
- *   executed will not try to request a denied access (which could spam audit
- *   logs).
- * - %LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF: Do not create any log related
- *   to the enforced restrictions coming from future nested domains created by
- *   the caller or its descendants.  This should only be set according to a
- *   runtime configuration (i.e. not hardcoded) by programs launching other
- *   unknown or untrusted programs that may create their own Landlock domains
- *   and spam logs.  The main use case is for container runtimes to enable users
- *   to mute buggy sandboxed programs for a specific container image.  Other use
- *   cases include sandboxer tools and init systems.  Unlike
- *   %LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF,
- *   %LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF does not impact the requested
- *   restriction (if any) but only the future nested domains.
+/**
+ * DOC: landlock_restrict_self_flags
+ *
+ * **Flags**
+ *
+ * %LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF
+ *     Do not create any log related to the enforced restrictions.  This should
+ *     only be set by tools launching unknown or untrusted programs (e.g. a
+ *     sandbox tool, container runtime, system service manager).  Because
+ *     programs sandboxing themselves should fix any denied access, they should
+ *     not set this flag to be aware of potential issues reported by system's
+ *     logs (i.e. audit).
+ *
+ * %LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON
+ *     Explicitly ask to continue logging denied access requests even after an
+ *     :manpage:`execve(2)` call.  This flag should only be set if all the
+ *     programs than can legitimately be executed will not try to request a
+ *     denied access (which could spam audit logs).
+ *
+ * %LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF
+ *     Do not create any log related to the enforced restrictions coming from
+ *     future nested domains created by the caller or its descendants.  This
+ *     should only be set according to a runtime configuration (i.e. not
+ *     hardcoded) by programs launching other unknown or untrusted programs that
+ *     may create their own Landlock domains and spam logs.  The main use case
+ *     is for container runtimes to enable users to mute buggy sandboxed
+ *     programs for a specific container image.  Other use cases include
+ *     sandboxer tools and init systems.  Unlike
+ *     ``LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF``,
+ *     ``LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF`` does not impact the
+ *     requested restriction (if any) but only the future nested domains.
+ *
+ *     It is allowed to only pass the
+ *     ``LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF`` flag with a @ruleset_fd
+ *     value of -1.
+ *
  */
 /* clang-format off */
 #define LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF		(1U << 0)
diff --git a/security/landlock/syscalls.c b/security/landlock/syscalls.c
index 9515dc92b99f..b9561e3417ae 100644
--- a/security/landlock/syscalls.c
+++ b/security/landlock/syscalls.c
@@ -451,18 +451,15 @@ SYSCALL_DEFINE4(landlock_add_rule, const int, ruleset_fd,
  * @ruleset_fd: File descriptor tied to the ruleset to merge with the target.
  * @flags: Supported values:
  *
- * - %LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF
- * - %LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON
- * - %LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF
+ *         - %LANDLOCK_RESTRICT_SELF_LOG_SAME_EXEC_OFF
+ *         - %LANDLOCK_RESTRICT_SELF_LOG_NEW_EXEC_ON
+ *         - %LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF
  *
  * This system call enables to enforce a Landlock ruleset on the current
  * thread.  Enforcing a ruleset requires that the task has %CAP_SYS_ADMIN in its
  * namespace or is running with no_new_privs.  This avoids scenarios where
  * unprivileged tasks can affect the behavior of privileged children.
  *
- * It is allowed to only pass the %LANDLOCK_RESTRICT_SELF_LOG_SUBDOMAINS_OFF
- * flag with a @ruleset_fd value of -1.
- *
  * Possible returned errors are:
  *
  * - %EOPNOTSUPP: Landlock is supported by the kernel but disabled at boot time;
@@ -474,6 +471,9 @@ SYSCALL_DEFINE4(landlock_add_rule, const int, ruleset_fd,
  *   %CAP_SYS_ADMIN in its namespace.
  * - %E2BIG: The maximum number of stacked rulesets is reached for the current
  *   thread.
+ *
+ * .. kernel-doc:: include/uapi/linux/landlock.h
+ *     :identifiers: landlock_restrict_self_flags
  */
 SYSCALL_DEFINE2(landlock_restrict_self, const int, ruleset_fd, const __u32,
 		flags)
-- 
2.49.0

