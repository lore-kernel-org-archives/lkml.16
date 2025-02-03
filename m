Received: from lichtman.org (lichtman.org [149.28.33.109])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BF82139CE3
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 20:20:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.33.109
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738614037; cv=none; b=t4LanPFHcEABJC5gHr3SdO8eBx3CreEhnS5tbBLGFV9RwJXKBLusbqftP9C/fdcSvu1NWAvXAvPUxTZ6UH7OizBhz8ZeuPExXmlhlwssvfhtRvA2vR5fdhf9+8xH9ZeGh14JZFQrPLQE0TxF9D4faXueEmFdcRhci4DvTeIHO7Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738614037; c=relaxed/simple;
	bh=8KHIobV3zPr0sQvUJY3NRbQO9qT7GmYQBBetborR8h8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iazsSgVW8gAbifko3hEa6lxw8xUSW9UhqasSxctqZJzHq9/eiE/xHNU+8Z9UDwOHfONaMos/9jUMCcnu3nQK371pWGLrAAz08hgWBc/2aypixreIz/5iggYxvFKrlTqkLWYi/LodLR45vNKVq9SZRNEa7ngSCIXyUzsTqbtJjvo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org; spf=pass smtp.mailfrom=lichtman.org; dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b=FqNGgEiI; arc=none smtp.client-ip=149.28.33.109
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lichtman.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lichtman.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lichtman.org header.i=@lichtman.org header.b="FqNGgEiI"
Received: by lichtman.org (Postfix, from userid 1000)
	id 9E289177201; Mon,  3 Feb 2025 20:20:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=lichtman.org; s=mail;
	t=1738614028; bh=8KHIobV3zPr0sQvUJY3NRbQO9qT7GmYQBBetborR8h8=;
	h=Date:From:To:Subject:From;
	b=FqNGgEiITV3vpx2deiHtp5mAk/lsOuvf4dpMg+GrP3VZPRmTN0FaM1gTMpWTp5iiL
	 uuaQMspatkX4qyI75XhTjei2fjEonlpwgzXwjqKraSVaIWMUlstGjKM03IsMPcJtbm
	 Gy9X2gfntlIIpeUKGJhDKk4prgPGKsqe8vdkW6iiRZhojp0Xj9ylmVcdHRzKbg5zb+
	 i4wqGiCQdw2Ce0VElcPR2BfT3jgmVDFmA3DeDLE+taeFic5CBZPpwwfrCGJuDcSpDH
	 SePuJndUGBI8SAbOcbTWIcCGT5l+M6jWr/ooBngp7s/6d2IUHl3ht2/g6Q6+s8kWVG
	 gP76YT1v1sB9A==
Date: Mon, 3 Feb 2025 20:20:28 +0000
From: Nir Lichtman <nir@lichtman.org>
To: jason.wessel@windriver.com, danielt@kernel.org, dianders@chromium.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kdb: remove usage of static environment buffer
Message-ID: <20250203202028.GA1215122@lichtman.org>
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
 include/linux/kdb.h         |  2 +-
 kernel/debug/kdb/kdb_main.c | 51 ++++++++-----------------------------
 2 files changed, 12 insertions(+), 41 deletions(-)

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
index 5f4be507d79f..75b565886c0e 100644
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
@@ -348,9 +315,12 @@ static int kdb_setenv(const char *var, const char *val)
 
 	varlen = strlen(var);
 	vallen = strlen(val);
-	ep = kdballocenv(varlen + vallen + 2);
-	if (ep == (char *)0)
-		return KDB_ENVBUFFULL;
+	ep = kmalloc(varlen + vallen + 2, GFP_KDB);
+	if (!ep) {
+		kdb_printf("Could not allocate space for the env var: %s\n",
+				var);
+		return KDB_KMALLOCFAILED;
+	}
 
 	sprintf(ep, "%s=%s", var, val);
 
@@ -359,6 +329,7 @@ static int kdb_setenv(const char *var, const char *val)
 		 && ((strncmp(__env[i], var, varlen) == 0)
 		   && ((__env[i][varlen] == '\0')
 		    || (__env[i][varlen] == '=')))) {
+			kfree(__env[i]);
 			__env[i] = ep;
 			return 0;
 		}
-- 
2.39.5

