Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1676D22422B
	for <linux-kernel@vger.kernel.org>; Sun, 29 Jun 2025 15:54:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751212447; cv=none; b=fYQBFB2FahFjJxNb9A+63qgSROLxIzKSFPq0vQ/30sn3Da5SSPGvgbe9XkJZYsK94UJowKUR9UR9xUnKEWfw6e39dH12eteix3y8yqoA8MhXM6vCuWRNZfclMnt4YfJLSweQBgwDkIOeh6JBIuRTercoVrgSkGrij8ErV+8yIhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751212447; c=relaxed/simple;
	bh=IDkB6//PjgG9k1gpJmrgm08BzSKVfd0DDTlRG2mxkGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RmdagD84BfDVPn1p7aeObSdrRtkQgH6JLphyrN1OZnaJdMpOaDis2nKSjzALQJbD1d1KUl2cpIaX4NBC22ckVmwVe+MWOgw+YnRTURVpYniLJLn3W/tEegvYCHxkU1PqH3UlM/8ir6PUnT0VpoMJTZX/iVHHjnXfWask8V3vhIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=aM7FTKNI; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="aM7FTKNI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1751212443;
	bh=IDkB6//PjgG9k1gpJmrgm08BzSKVfd0DDTlRG2mxkGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=aM7FTKNIqUwK3lBIFnNxPDVY3Xz6E15G5pBXecyLsM5wFt2dPxgy/RnsOIDy9iI84
	 3KcPZsiC/MHdffdo57Dw/uAizqhbRo4vyrsz2YT4Xyx88I8gObWg2jxs2vLeODGJpw
	 t1eKP1Keve1xRWY7JyX7PvNlxlhJfCB0xJ4jsjlM=
Date: Sun, 29 Jun 2025 17:54:02 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>
Cc: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] tools/nolibc: move FD_* definitions to sys/select.h
Message-ID: <e2513e72-5949-463d-a950-0778609141d7@t-8ch.de>
References: <25eb3144-d19e-43d2-af4f-b0251d28808c@t-8ch.de>
 <20250622071958.GA3384@1wt.eu>
 <07f5fdb4-2c5c-4723-b12a-abdb0c9f33b7@t-8ch.de>
 <20250623025618.GA29015@1wt.eu>
 <20250629084628.GA7992@1wt.eu>
 <d8d9ab91-0617-468e-a82d-9f271c5e6a7f@t-8ch.de>
 <20250629092552.GA30947@1wt.eu>
 <029f24fa-3512-4736-94a0-e158c158cc8e@t-8ch.de>
 <20250629094048.GA26861@1wt.eu>
 <20250629151006.GA16826@1wt.eu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250629151006.GA16826@1wt.eu>

On 2025-06-29 17:10:06+0200, Willy Tarreau wrote:
> On Sun, Jun 29, 2025 at 11:40:48AM +0200, Willy Tarreau wrote:
> > On Sun, Jun 29, 2025 at 11:37:06AM +0200, Thomas Weißschuh wrote:
> > > On 2025-06-29 11:25:52+0200, Willy Tarreau wrote:
> > > > On Sun, Jun 29, 2025 at 10:53:34AM +0200, Thomas Weißschuh wrote:
> > > > > On 2025-06-29 10:46:28+0200, Willy Tarreau wrote:
> > > > > > On Mon, Jun 23, 2025 at 04:56:18AM +0200, Willy Tarreau wrote:
> > > 
> > > <snip>
> > > 
> > > > > > Trying it has reopened the circular dependencies can of worms :-(
> > > > > > It's the same problem as usual that we've worked around till now
> > > > > > by placing some types in types.h, except that this time fd_set is
> > > > > > defined based on the macros FD_* that I moved to sys/select.h.
> > > > > 
> > > > > Can't fd_set also move to sys/select.h? This is how I read fd_set(3).
> > > > 
> > > > That was what I did and precisely what was causing the problem. We
> > > > have sys.h defining select() with fd_set in it with sys/select not yet
> > > > being included. I moved sys.h after all sys/* and it broke something
> > > > else instead.
> > > 
> > > Ah. Then move select() also into sys/select.h; where it belongs. :-)
> > 
> > For an unknown reason I thought we avoided to move the syscall definitions
> > there and only used sys/*, but I was apparently confused as we have exactly
> > that in prctl or wait. I can give that one a try again.
> 
> So after one more hour on it, I'm admitting abandonning the battle.
> Adding the necessary includes there is causing "declared inside parameter"
> failures in random other totally unrelated stuff (e.g. in sys_getdents64()
> or msleep()). We'll have to really clear that circular includes mess again
> in a near future. For now I'll stay on the stub which works fine without
> affecting the rest.

I saw the same issue, but only because of the changes to types.h.
And these should not be necessary in the first place.

The below works nicely for me:

diff --git a/tools/include/nolibc/Makefile b/tools/include/nolibc/Makefile
index 3fcee9fe4ece..125dbb2f1388 100644
--- a/tools/include/nolibc/Makefile
+++ b/tools/include/nolibc/Makefile
@@ -56,6 +56,7 @@ all_files := \
 		sys/random.h \
 		sys/reboot.h \
 		sys/resource.h \
+		sys/select.h \
 		sys/stat.h \
 		sys/syscall.h \
 		sys/sysmacros.h \
diff --git a/tools/include/nolibc/nolibc.h b/tools/include/nolibc/nolibc.h
index c199ade200c2..6dc2f2a6cbde 100644
--- a/tools/include/nolibc/nolibc.h
+++ b/tools/include/nolibc/nolibc.h
@@ -104,6 +104,7 @@
 #include "sys/random.h"
 #include "sys/reboot.h"
 #include "sys/resource.h"
+#include "sys/select.h"
 #include "sys/stat.h"
 #include "sys/syscall.h"
 #include "sys/sysmacros.h"
diff --git a/tools/include/nolibc/sys.h b/tools/include/nolibc/sys.h
index 9556c69a6ae1..ae4b0970b570 100644
--- a/tools/include/nolibc/sys.h
+++ b/tools/include/nolibc/sys.h
@@ -745,53 +745,6 @@ int sched_yield(void)
 }
 
 
-/*
- * int select(int nfds, fd_set *read_fds, fd_set *write_fds,
- *            fd_set *except_fds, struct timeval *timeout);
- */
-
-static __attribute__((unused))
-int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeval *timeout)
-{
-#if defined(__ARCH_WANT_SYS_OLD_SELECT) && !defined(__NR__newselect)
-	struct sel_arg_struct {
-		unsigned long n;
-		fd_set *r, *w, *e;
-		struct timeval *t;
-	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
-	return my_syscall1(__NR_select, &arg);
-#elif defined(__NR__newselect)
-	return my_syscall5(__NR__newselect, nfds, rfds, wfds, efds, timeout);
-#elif defined(__NR_select)
-	return my_syscall5(__NR_select, nfds, rfds, wfds, efds, timeout);
-#elif defined(__NR_pselect6)
-	struct timespec t;
-
-	if (timeout) {
-		t.tv_sec  = timeout->tv_sec;
-		t.tv_nsec = timeout->tv_usec * 1000;
-	}
-	return my_syscall6(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
-#elif defined(__NR_pselect6_time64)
-	struct __kernel_timespec t;
-
-	if (timeout) {
-		t.tv_sec  = timeout->tv_sec;
-		t.tv_nsec = timeout->tv_usec * 1000;
-	}
-	return my_syscall6(__NR_pselect6_time64, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
-#else
-	return __nolibc_enosys(__func__, nfds, rfds, wfds, efds, timeout);
-#endif
-}
-
-static __attribute__((unused))
-int select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeval *timeout)
-{
-	return __sysret(sys_select(nfds, rfds, wfds, efds, timeout));
-}
-
-
 /*
  * int setpgid(pid_t pid, pid_t pgid);
  */
diff --git a/tools/include/nolibc/sys/select.h b/tools/include/nolibc/sys/select.h
new file mode 100644
index 000000000000..74d0e55e3157
--- /dev/null
+++ b/tools/include/nolibc/sys/select.h
@@ -0,0 +1,109 @@
+/* SPDX-License-Identifier: LGPL-2.1 OR MIT */
+
+/* make sure to include all global symbols */
+#include "../nolibc.h"
+
+#ifndef _NOLIBC_SYS_SELECT_H
+#define _NOLIBC_SYS_SELECT_H
+
+#include <linux/time.h>
+#include <linux/unistd.h>
+
+#include "../sys.h"
+
+/* commonly an fd_set represents 256 FDs */
+#ifndef FD_SETSIZE
+#define FD_SETSIZE     256
+#endif
+
+#define FD_SETIDXMASK (8 * sizeof(unsigned long))
+#define FD_SETBITMASK (8 * sizeof(unsigned long)-1)
+
+/* for select() */
+typedef struct {
+	unsigned long fds[(FD_SETSIZE + FD_SETBITMASK) / FD_SETIDXMASK];
+} fd_set;
+
+#define FD_CLR(fd, set) do {						\
+		fd_set *__set = (set);					\
+		int __fd = (fd);					\
+		if (__fd >= 0)						\
+			__set->fds[__fd / FD_SETIDXMASK] &=		\
+				~(1U << (__fd & FD_SETBITMASK));	\
+	} while (0)
+
+#define FD_SET(fd, set) do {						\
+		fd_set *__set = (set);					\
+		int __fd = (fd);					\
+		if (__fd >= 0)						\
+			__set->fds[__fd / FD_SETIDXMASK] |=		\
+				1 << (__fd & FD_SETBITMASK);		\
+	} while (0)
+
+#define FD_ISSET(fd, set) ({						\
+			fd_set *__set = (set);				\
+			int __fd = (fd);				\
+		int __r = 0;						\
+		if (__fd >= 0)						\
+			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
+1U << (__fd & FD_SETBITMASK));						\
+		__r;							\
+	})
+
+#define FD_ZERO(set) do {						\
+		fd_set *__set = (set);					\
+		int __idx;						\
+		int __size = (FD_SETSIZE+FD_SETBITMASK) / FD_SETIDXMASK;\
+		for (__idx = 0; __idx < __size; __idx++)		\
+			__set->fds[__idx] = 0;				\
+	} while (0)
+
+
+/*
+ * int select(int nfds, fd_set *read_fds, fd_set *write_fds,
+ *            fd_set *except_fds, struct timeval *timeout);
+ */
+
+static __attribute__((unused))
+int sys_select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeval *timeout)
+{
+#if defined(__ARCH_WANT_SYS_OLD_SELECT) && !defined(__NR__newselect)
+	struct sel_arg_struct {
+		unsigned long n;
+		fd_set *r, *w, *e;
+		struct timeval *t;
+	} arg = { .n = nfds, .r = rfds, .w = wfds, .e = efds, .t = timeout };
+	return my_syscall1(__NR_select, &arg);
+#elif defined(__NR__newselect)
+	return my_syscall5(__NR__newselect, nfds, rfds, wfds, efds, timeout);
+#elif defined(__NR_select)
+	return my_syscall5(__NR_select, nfds, rfds, wfds, efds, timeout);
+#elif defined(__NR_pselect6)
+	struct timespec t;
+
+	if (timeout) {
+		t.tv_sec  = timeout->tv_sec;
+		t.tv_nsec = timeout->tv_usec * 1000;
+	}
+	return my_syscall6(__NR_pselect6, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
+#elif defined(__NR_pselect6_time64)
+	struct __kernel_timespec t;
+
+	if (timeout) {
+		t.tv_sec  = timeout->tv_sec;
+		t.tv_nsec = timeout->tv_usec * 1000;
+	}
+	return my_syscall6(__NR_pselect6_time64, nfds, rfds, wfds, efds, timeout ? &t : NULL, NULL);
+#else
+	return __nolibc_enosys(__func__, nfds, rfds, wfds, efds, timeout);
+#endif
+}
+
+static __attribute__((unused))
+int select(int nfds, fd_set *rfds, fd_set *wfds, fd_set *efds, struct timeval *timeout)
+{
+	return __sysret(sys_select(nfds, rfds, wfds, efds, timeout));
+}
+
+
+#endif /* _NOLIBC_SYS_SELECT_H */
diff --git a/tools/include/nolibc/types.h b/tools/include/nolibc/types.h
index 16c6e9ec9451..470a5f77bc0f 100644
--- a/tools/include/nolibc/types.h
+++ b/tools/include/nolibc/types.h
@@ -70,11 +70,6 @@
 #define DT_LNK         0xa
 #define DT_SOCK        0xc
 
-/* commonly an fd_set represents 256 FDs */
-#ifndef FD_SETSIZE
-#define FD_SETSIZE     256
-#endif
-
 /* PATH_MAX and MAXPATHLEN are often used and found with plenty of different
  * values.
  */
@@ -115,48 +110,6 @@
 #define EXIT_SUCCESS 0
 #define EXIT_FAILURE 1
 
-#define FD_SETIDXMASK (8 * sizeof(unsigned long))
-#define FD_SETBITMASK (8 * sizeof(unsigned long)-1)
-
-/* for select() */
-typedef struct {
-	unsigned long fds[(FD_SETSIZE + FD_SETBITMASK) / FD_SETIDXMASK];
-} fd_set;
-
-#define FD_CLR(fd, set) do {						\
-		fd_set *__set = (set);					\
-		int __fd = (fd);					\
-		if (__fd >= 0)						\
-			__set->fds[__fd / FD_SETIDXMASK] &=		\
-				~(1U << (__fd & FD_SETBITMASK));	\
-	} while (0)
-
-#define FD_SET(fd, set) do {						\
-		fd_set *__set = (set);					\
-		int __fd = (fd);					\
-		if (__fd >= 0)						\
-			__set->fds[__fd / FD_SETIDXMASK] |=		\
-				1 << (__fd & FD_SETBITMASK);		\
-	} while (0)
-
-#define FD_ISSET(fd, set) ({						\
-			fd_set *__set = (set);				\
-			int __fd = (fd);				\
-		int __r = 0;						\
-		if (__fd >= 0)						\
-			__r = !!(__set->fds[__fd / FD_SETIDXMASK] &	\
-1U << (__fd & FD_SETBITMASK));						\
-		__r;							\
-	})
-
-#define FD_ZERO(set) do {						\
-		fd_set *__set = (set);					\
-		int __idx;						\
-		int __size = (FD_SETSIZE+FD_SETBITMASK) / FD_SETIDXMASK;\
-		for (__idx = 0; __idx < __size; __idx++)		\
-			__set->fds[__idx] = 0;				\
-	} while (0)
-
 /* for getdents64() */
 struct linux_dirent64 {
 	uint64_t       d_ino;
