Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC40269D1B
	for <linux-kernel@vger.kernel.org>; Mon, 28 Apr 2025 12:31:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745843520; cv=none; b=Uvq6RVT2iCGxeBYZsIiI76oiuhYQeazgl6FRFCpw0ERMN4IZ16Sng90V15Eac37gpgqCvlSryT/Sah7wE06kyI/je9893mvIL/2YSAkLENbKWlz7+AOg5sTo7tcDxdd48nI7ycO5gMdirogZjLSAUFn7JZX7J54QePSNK2JpFB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745843520; c=relaxed/simple;
	bh=fIsldRXJHtOduBXo5WJXIS0zF9dXfot0bSDlw/ZfcIE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Fg538CEhrEh0HIctRJkmU1ODHcF6C1iCvR5rqsxsllaAz3/9hbBn5u1Y63wEPNA9hEtFmBGj/cnuzV1yINvj4byp412F/mpnrE/xixgAe2a1R7a79ILxV5rht3AuQ2TSTDPz75Gki207V4Ip49F5XfQXc6jelGC7W5A2OuOkdpU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KPe374Ng; dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b=KPe374Ng; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KPe374Ng";
	dkim=pass (1024-bit key) header.d=suse.com header.i=@suse.com header.b="KPe374Ng"
Received: from pathway.suse.cz (unknown [10.100.208.146])
	by smtp-out2.suse.de (Postfix) with ESMTP id 461731F390;
	Mon, 28 Apr 2025 12:31:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1745843516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c32GfN1M6jy6lPZhfI3nWdiah8gmqNWObTWuqruve7M=;
	b=KPe374NgBy6SsaIHYLFji58sS3HaoXo2ZNo/GPjH4Qm+JwkKDauDkXFZ5X//OpZdL8r8Qa
	uPqvvJxa0J37jUn6Xvbj5cXxGnNFtQFGBH+45j0bNRXj7SHbuwkNCFdjWUvrymeJewQ6lP
	4uH/5g6fMP1iv2ntx45YTeNIASncDZ0=
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
	t=1745843516; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=c32GfN1M6jy6lPZhfI3nWdiah8gmqNWObTWuqruve7M=;
	b=KPe374NgBy6SsaIHYLFji58sS3HaoXo2ZNo/GPjH4Qm+JwkKDauDkXFZ5X//OpZdL8r8Qa
	uPqvvJxa0J37jUn6Xvbj5cXxGnNFtQFGBH+45j0bNRXj7SHbuwkNCFdjWUvrymeJewQ6lP
	4uH/5g6fMP1iv2ntx45YTeNIASncDZ0=
From: Petr Mladek <pmladek@suse.com>
To: alyssa@rosenzweig.io,
	Petr Mladek <pmladek@suse.com>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Sven Peter <sven@svenpeter.dev>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Aun-Ali Zaidi <admin@kodeit.net>,
	Maxime Ripard <mripard@kernel.org>,
	airlied@redhat.com,
	Simona Vetter <simona@ffwll.ch>,
	Steven Rostedt <rostedt@goodmis.org>,
	Rasmus Villemoes <linux@rasmusvillemoes.dk>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Morton <akpm@linux-foundation.org>,
	apw@canonical.com,
	joe@perches.com,
	dwaipayanray1@gmail.com,
	lukas.bulwahn@gmail.com,
	Kees Cook <kees@kernel.org>,
	tamird@gmail.com
Cc: Aditya Garg <gargaditya08@live.com>,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
	dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	Hector Martin <marcan@marcan.st>,
	Asahi Linux Mailing List <asahi@lists.linux.dev>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [PATCH] vsprintf: Use %p4chR instead of %p4cn for reading data in reversed host ordering
Date: Mon, 28 Apr 2025 14:31:32 +0200
Message-ID: <20250428123132.578771-1-pmladek@suse.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Score: -1.30
X-Spamd-Result: default: False [-1.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	TAGGED_RCPT(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:mid,suse.com:email];
	RCPT_COUNT_TWELVE(0.00)[27];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	FREEMAIL_TO(0.00)[rosenzweig.io,suse.com,linux.intel.com,svenpeter.dev,suse.de,kodeit.net,kernel.org,redhat.com,ffwll.ch,goodmis.org,rasmusvillemoes.dk,chromium.org,lwn.net,linux-foundation.org,canonical.com,perches.com,gmail.com];
	FREEMAIL_CC(0.00)[live.com,vger.kernel.org,lists.freedesktop.org,marcan.st,lists.linux.dev,linux-m68k.org];
	FROM_HAS_DN(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	R_RATELIMIT(0.00)[to_ip_from(RL6udr6oaa7zotqtfep1wg7ccg)];
	DKIM_SIGNED(0.00)[suse.com:s=susede1];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,live.com]
X-Spam-Flag: NO
X-Spam-Level: 

The generic FourCC format always prints the data using the big endian
order. It is generic because it allows to read the data using a custom
ordering.

The current code uses "n" for reading data in the reverse host ordering.
It makes the 4 variants [hnbl] consistent with the generic printing
of IPv4 addresses.

Unfortunately, it creates confusion on big endian systems. For example,
it shows the data &(u32)0x67503030 as

	%p4cn	00Pg (0x30305067)

But people expect that the ordering stays the same. The network ordering
is a big-endian ordering.

The problem is that the semantic is not the same. The modifiers affect
the output ordering of IPv4 addresses while they affect the reading order
in case of FourCC code.

Avoid the confusion by replacing the "n" modifier with "hR", aka
reverse host ordering. It is inspired by the existing %p[mM]R printf
format.

Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
Closes: https://lore.kernel.org/r/CAMuHMdV9tX=TG7E_CrSF=2PY206tXf+_yYRuacG48EWEtJLo-Q@mail.gmail.com
Signed-off-by: Petr Mladek <pmladek@suse.com>
---
Hi,

I am sending this as a proper patch. It would be nice to queue it
together with the other patches adding the generic printf modifiers.

Best Regards,
Petr
---
Documentation/core-api/printk-formats.rst | 10 +++++-----
 lib/tests/printf_kunit.c                  |  4 ++--
 lib/vsprintf.c                            | 11 ++++++++---
 3 files changed, 15 insertions(+), 10 deletions(-)

diff --git a/Documentation/core-api/printk-formats.rst b/Documentation/core-api/printk-formats.rst
index 125fd0397510..f531873bb3c9 100644
--- a/Documentation/core-api/printk-formats.rst
+++ b/Documentation/core-api/printk-formats.rst
@@ -652,7 +652,7 @@ Generic FourCC code
 -------------------
 
 ::
-	%p4c[hnlb]	gP00 (0x67503030)
+	%p4c[h[R]lb]	gP00 (0x67503030)
 
 Print a generic FourCC code, as both ASCII characters and its numerical
 value as hexadecimal.
@@ -660,23 +660,23 @@ value as hexadecimal.
 The generic FourCC code is always printed in the big-endian format,
 the most significant byte first. This is the opposite of V4L/DRM FourCCs.
 
-The additional ``h``, ``n``, ``l``, and ``b`` specifiers define what
+The additional ``h``, ``hR``, ``l``, and ``b`` specifiers define what
 endianness is used to load the stored bytes. The data might be interpreted
-using the host byte order, network byte order, little-endian, or big-endian.
+using the host, reversed host byte order, little-endian, or big-endian.
 
 Passed by reference.
 
 Examples for a little-endian machine, given &(u32)0x67503030::
 
 	%p4ch	gP00 (0x67503030)
-	%p4cn	00Pg (0x30305067)
+	%p4chR	00Pg (0x30305067)
 	%p4cl	gP00 (0x67503030)
 	%p4cb	00Pg (0x30305067)
 
 Examples for a big-endian machine, given &(u32)0x67503030::
 
 	%p4ch	gP00 (0x67503030)
-	%p4cn	00Pg (0x30305067)
+	%p4chR	00Pg (0x30305067)
 	%p4cl	00Pg (0x30305067)
 	%p4cb	gP00 (0x67503030)
 
diff --git a/lib/tests/printf_kunit.c b/lib/tests/printf_kunit.c
index b1fa0dcea52f..bc54cca2d7a6 100644
--- a/lib/tests/printf_kunit.c
+++ b/lib/tests/printf_kunit.c
@@ -726,7 +726,7 @@ static void fourcc_pointer(struct kunit *kunittest)
 	static const struct fourcc_struct try_ch[] = {
 		{ 0x41424344, "ABCD (0x41424344)", },
 	};
-	static const struct fourcc_struct try_cn[] = {
+	static const struct fourcc_struct try_chR[] = {
 		{ 0x41424344, "DCBA (0x44434241)", },
 	};
 	static const struct fourcc_struct try_cl[] = {
@@ -738,7 +738,7 @@ static void fourcc_pointer(struct kunit *kunittest)
 
 	fourcc_pointer_test(kunittest, try_cc, ARRAY_SIZE(try_cc), "%p4cc");
 	fourcc_pointer_test(kunittest, try_ch, ARRAY_SIZE(try_ch), "%p4ch");
-	fourcc_pointer_test(kunittest, try_cn, ARRAY_SIZE(try_cn), "%p4cn");
+	fourcc_pointer_test(kunittest, try_chR, ARRAY_SIZE(try_chR), "%p4chR");
 	fourcc_pointer_test(kunittest, try_cl, ARRAY_SIZE(try_cl), "%p4cl");
 	fourcc_pointer_test(kunittest, try_cb, ARRAY_SIZE(try_cb), "%p4cb");
 }
diff --git a/lib/vsprintf.c b/lib/vsprintf.c
index 2c5de4216415..34587b2dbdb1 100644
--- a/lib/vsprintf.c
+++ b/lib/vsprintf.c
@@ -1804,9 +1804,8 @@ char *fourcc_string(char *buf, char *end, const u32 *fourcc,
 	orig = get_unaligned(fourcc);
 	switch (fmt[2]) {
 	case 'h':
-		break;
-	case 'n':
-		orig = swab32(orig);
+		if (fmt[3] == 'R')
+			orig = swab32(orig);
 		break;
 	case 'l':
 		orig = (__force u32)cpu_to_le32(orig);
@@ -2396,6 +2395,12 @@ early_param("no_hash_pointers", no_hash_pointers_enable);
  *       read the documentation (path below) first.
  * - 'NF' For a netdev_features_t
  * - '4cc' V4L2 or DRM FourCC code, with endianness and raw numerical value.
+ * - '4c[h[R]lb]' For generic FourCC code with raw numerical value. Both are
+ *	 displayed in the big-endian format. This is the opposite of V4L2 or
+ *	 DRM FourCCs.
+ *	 The additional specifiers define what endianness is used to load
+ *	 the stored bytes. The data might be interpreted using the host,
+ *	 reversed host byte order, little-endian, or big-endian.
  * - 'h[CDN]' For a variable-length buffer, it prints it as a hex string with
  *            a certain separator (' ' by default):
  *              C colon
-- 
2.49.0

