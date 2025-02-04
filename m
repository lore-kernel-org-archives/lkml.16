Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6465A158558
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 05:47:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738648063; cv=none; b=snEMDs29Gm1EPvNrR5nIS/0Rw7Kq4HeiPuKwmn+NLXNc5+g8VNFPUJ2YG/BfI1xcV1T5Xo/7Wz6RudwAzsrs9j2Ee7VLuvQdBXM3IJsdwDjIxCRwhX5pkAD/Aig32G4zNoSqJ4c12slji/9iCNBeh3iL9hLtBhfx1jioAiIukpo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738648063; c=relaxed/simple;
	bh=923m1OaOvrUsElaxEayAAsv3lhQ9oCupRlXkQZ3kQqQ=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=c3ozpDJCVTKn+r+XHbdM6//tIbAqPGfrL7GzPvqP0N7+BCDQZCZHk2ifydO4vdzhZP3NYczSrspXqc6UoezdCsygTAv/4CGcQzmhOo4d5wmY2aMLdUfgpMjwrWvnfFSZHre8vxf0MdjPjzYoG+yOnVWJYP3E+15HdSRefvUtFeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=KpwkwPIp; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="KpwkwPIp"
Received: by lichtman.org (Postfix, from userid 1000)
	id 555E91771E3; Tue,  4 Feb 2025 05:47:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1738648061; bh=923m1OaOvrUsElaxEayAAsv3lhQ9oCupRlXkQZ3kQqQ=;
	h=Date:From:To:Subject:From;
	b=KpwkwPIpF89C3cQvagLm+LePtt0xLac2sht/Lq36Ontk7av9W7LTmBfSfLgtWSYtq
	 MlK99z5mHbUPOmvkcjjsfi2cY5C1QZPgk07G4TFE1n9ZhxktO9LTe0Q0hjgXEjpaE5
	 ZYdk8tu6NZN9jVAZHcliWH2PET/YP//yGaZ85A5L4sPuFIY7NRzUty0XGWItgrB5vz
	 bYrwnoK+RIk9sRkAbFFO7/l//f+fAGLRu2N2icfE1P+mhn7fgitQMRC5uAaECG+nR5
	 E2gq8ERBYpscQlzCJ2zweSNPRsk9KHtBEHilLqM7MEtGfrOXSiwuLgRUl9ja8Tmc8E
	 4tWN+bWvhK6RA==
Date: Tue, 4 Feb 2025 05:47:41 +0000
From: Nir Lichtman <nir@lichtman.org>
To: dianders@chromium.org, jason.wessel@windriver.com, danielt@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kdb: remove usage of static environment buffer
Message-ID: <20250204054741.GB1219827@lichtman.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Problem: The set environment variable logic uses a static "heap" like
buffer to store the values of the variables, and they are never freed,
on top of that this is redundant since the kernel supplies allocation
facilities which are even used also in this file.

Solution: Remove the weird static buffer logic and use kmalloc instead,
call kfree when overriding an existing variable.

Signed-off-by: Nir Lichtman <nir@lichtman.org>
---

v2: Fixes following Doug's CR - use kmalloc_const instead of kmalloc &
rm redundant print in case of allocation error

 include/linux/kdb.h         |  2 +-
 kernel/debug/kdb/kdb_main.c | 48 +++++++------------------------------
 2 files changed, 9 insertions(+), 41 deletions(-)

diff --git a/include/linux/kdb.h b/include/linux/kdb.h
index 905a2e2f45f6..ecbf819deeca 100644
--- a/include/linux/kdb.h
+++ b/include/linux/kdb.h
@@ -104,7 +104,7 @@ extern int kdb_initial_cpu;
 #define KDB_NOENVVALUE	(-6)
 #define KDB_NOTIMP	(-7)
 #define KDB_ENVFULL	(-8)
-#define KDB_ENVBUFFULL	(-9)
+#define KDB_KMALLOCFAILED	(-9)
 #define KDB_TOOMANYBPT	(-10)
 #define KDB_TOOMANYDBREGS (-11)
 #define KDB_DUPBPT	(-12)
diff --git a/kernel/debug/kdb/kdb_main.c b/kernel/debug/kdb/kdb_main.c
index 5f4be507d79f..641481b19ada 100644
--- a/kernel/debug/kdb/kdb_main.c
+++ b/kernel/debug/kdb/kdb_main.c
@@ -105,7 +105,7 @@ static kdbmsg_t kdbmsgs[] = {
 	KDBMSG(NOENVVALUE, "Environment variable should have value"),
 	KDBMSG(NOTIMP, "Command not implemented"),
 	KDBMSG(ENVFULL, "Environment full"),
-	KDBMSG(ENVBUFFULL, "Environment buffer full"),
+	KDBMSG(KMALLOCFAILED, "Failed to allocate memory"),
 	KDBMSG(TOOMANYBPT, "Too many breakpoints defined"),
 #ifdef CONFIG_CPU_XSCALE
 	KDBMSG(TOOMANYDBREGS, "More breakpoints than ibcr registers defined"),
@@ -130,13 +130,9 @@ static const int __nkdb_err = ARRAY_SIZE(kdbmsgs);
 
 
 /*
- * Initial environment.   This is all kept static and local to
- * this file.   We don't want to rely on the memory allocation
- * mechanisms in the kernel, so we use a very limited allocate-only
- * heap for new and altered environment variables.  The entire
- * environment is limited to a fixed number of entries (add more
- * to __env[] if required) and a fixed amount of heap (add more to
- * KDB_ENVBUFSIZE if required).
+ * Initial environment. This is all kept static and local to this file.
+ * The entire environment is limited to a fixed number of entries
+ * (add more to __env[] if required)
  */
 
 static char *__env[31] = {
@@ -258,35 +254,6 @@ char *kdbgetenv(const char *match)
 	return NULL;
 }
 
-/*
- * kdballocenv - This function is used to allocate bytes for
- *	environment entries.
- * Parameters:
- *	bytes	The number of bytes to allocate in the static buffer.
- * Returns:
- *	A pointer to the allocated space in the buffer on success.
- *	NULL if bytes > size available in the envbuffer.
- * Remarks:
- *	We use a static environment buffer (envbuffer) to hold the values
- *	of dynamically generated environment variables (see kdb_set).  Buffer
- *	space once allocated is never free'd, so over time, the amount of space
- *	(currently 512 bytes) will be exhausted if env variables are changed
- *	frequently.
- */
-static char *kdballocenv(size_t bytes)
-{
-#define	KDB_ENVBUFSIZE	512
-	static char envbuffer[KDB_ENVBUFSIZE];
-	static int envbufsize;
-	char *ep = NULL;
-
-	if ((KDB_ENVBUFSIZE - envbufsize) >= bytes) {
-		ep = &envbuffer[envbufsize];
-		envbufsize += bytes;
-	}
-	return ep;
-}
-
 /*
  * kdbgetulenv - This function will return the value of an unsigned
  *	long-valued environment variable.
@@ -348,9 +315,9 @@ static int kdb_setenv(const char *var, const char *val)
 
 	varlen = strlen(var);
 	vallen = strlen(val);
-	ep = kdballocenv(varlen + vallen + 2);
-	if (ep == (char *)0)
-		return KDB_ENVBUFFULL;
+	ep = kmalloc(varlen + vallen + 2, GFP_KDB);
+	if (!ep)
+		return KDB_KMALLOCFAILED;
 
 	sprintf(ep, "%s=%s", var, val);
 
@@ -359,6 +326,7 @@ static int kdb_setenv(const char *var, const char *val)
 		 && ((strncmp(__env[i], var, varlen) == 0)
 		   && ((__env[i][varlen] == '\0')
 		    || (__env[i][varlen] == '=')))) {
+			kfree_const(__env[i]);
 			__env[i] = ep;
 			return 0;
 		}
-- 
2.39.5

