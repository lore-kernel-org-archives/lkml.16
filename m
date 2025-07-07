Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6360028935D
	for <linux-kernel@vger.kernel.org>; Mon,  7 Jul 2025 12:58:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751893115; cv=none; b=crypEjl5S8eg9v3tXZHOC951n8faLSCPtwsBXtqF+cn8Z+Y4NTWuWnnzk7tvUjHHTuHFR8gFEugVl9eoZory+wOKRTU715fMoHVxg4elQ6swNqwPak9/pWEuHzVAyGTDL0H78QrYQzFgY+4ZxqKYZ842iy6o1cC1TQjYS0W5nNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751893115; c=relaxed/simple;
	bh=yKJNh7Lnr1WIh3u7D+FrLbc255TwpZ5V/xE17d+JUwo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=R/Bv7UrJ/9Siq+QQy7OHK0/HGtD+WFvXl50bII6zyIqWaXcOJ/czOxdqPmOnsqaE4+msIYSwNjQMaZ432AZlX9E7KRRl4gp6IARjLKPC1ys4B+M187Q5Y6jUj4Pk+5hP9LVjXfJBTZWZXNoQNcCb8aKfrtRcO23mtkirA5ZhZVM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=Lzhb9LBY; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=YT/m0Qpp; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="Lzhb9LBY";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="YT/m0Qpp"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1751893105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LUN42cWiSUwI/rz+2Hn290BpUIUJUzByb2lKJbjzz1c=;
	b=Lzhb9LBYPUtX1LDWNNCHL25EaFVukLp+b2xTpwawig9bvEDQTI9yFd5H3tsXQpTwN6Ir4W
	Yjgx0XJ2L1/5j5WGiTGXpsE++hCnWM5GeoDQnvJPkfqppKcxsuP1I9neV7G2R27u57TMOe
	ZArAwDF4Ni32gw7f9Xih7vY3OM4hYxUfLJJI7aPNb8lK/MCiHImTDxXpvyItsNJPxI4g70
	CGHEbDcWhcxEy6nMHDIhdbMThfHaCQi6JYquDbrMv053ZclALjO6QbYLxIDiGgskHvbvrm
	4G/wYCRMLuZl6HnRwbYsODykhXjclg0XJrRu5YsQqRQXuucYn+mfQ2wBtjL91Q==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1751893105;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=LUN42cWiSUwI/rz+2Hn290BpUIUJUzByb2lKJbjzz1c=;
	b=YT/m0QppFQpTgb6pMq6eFbDwimZA0YAXi38Xx6soKXp5Xtz69Poh2lup+s9KdnqJuvY1bp
	OXjof4eGyGL4w8Aw==
Date: Mon, 07 Jul 2025 14:58:11 +0200
Subject: [PATCH] tools/nolibc: avoid false-positive -Wmaybe-uninitialized
 through waitpid()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250707-nolibc-waitpid-uninitialized-v1-1-dcd4e70bcd8f@linutronix.de>
X-B4-Tracking: v=1; b=H4sIAGLEa2gC/x3MTQqDMBAG0KvIrDuQiCWmVyldxGTUD2SUxP5Q8
 e4NXb7NO6hIhhS6NQdleaFg1Qp7aSjOQSdhpGpqTXs1zjjWdcEQ+R2wb0j8VCh2hAVfSRyt7by
 JvfcuUC22LCM+//7+OM8fe5R1bW4AAAA=
X-Change-ID: 20250707-nolibc-waitpid-uninitialized-c11490c8997a
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751893101; l=2239;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=yKJNh7Lnr1WIh3u7D+FrLbc255TwpZ5V/xE17d+JUwo=;
 b=m/7wEa4wlO3HnhXqiWoXADS+0xMFjvi43ssNsOMphEiVXhXlmIfxYwWKF8tcan+9ZrB97ly9N
 q5XHz1wRWyvDpXCPpzhQwtI0B4d9TW9cU4By2tZ/plwTTqhkgX8bJoe
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The compiler does not know that waitid() will only ever return 0 or -1.
If waitid() would return a positive value than waitpid() would return that
same value and *status would not be initialized.
However users calling waitpid() know that the only possible return values
of it are 0 or -1. They therefore might check for errors with
'ret == -1' or 'ret < 0' and use *status otherwise. The compiler will then
warn about the usage of a potentially uninitialized variable.

Example:

	$ cat test.c
	#include <stdio.h>
	#include <unistd.h>

	int main(void)
	{
		int ret, status;

		ret = waitpid(0, &status, 0);
		if (ret == -1)
			return 0;

		printf("status %x\n", status);

		return 0;
	}

	$ gcc --version
	gcc (GCC) 15.1.1 20250425

	$ gcc -Wall -Os -Werror -nostdlib -nostdinc -static -Iusr/include -Itools/include/nolibc/ -o /dev/null test.c
	test.c: In function ‘main’:
	test.c:12:9: error: ‘status’ may be used uninitialized [-Werror=maybe-uninitialized]
	   12 |         printf("status %x\n", status);
	      |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
	test.c:6:18: note: ‘status’ was declared here
	    6 |         int ret, status;
	      |                  ^~~~~~
	cc1: all warnings being treated as errors

Avoid the warning by normalizing waitid() errors to '-1' in waitpid().

Fixes: 0c89abf5ab3f ("tools/nolibc: implement waitpid() in terms of waitid()")
Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/include/nolibc/sys/wait.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/include/nolibc/sys/wait.h b/tools/include/nolibc/sys/wait.h
index 4d44e3da0ba814d00368027d893e2eb1155b86f3..56ddb806da7f2466be5523b52fd01480b711daec 100644
--- a/tools/include/nolibc/sys/wait.h
+++ b/tools/include/nolibc/sys/wait.h
@@ -78,7 +78,7 @@ pid_t waitpid(pid_t pid, int *status, int options)
 
 	ret = waitid(idtype, id, &info, options);
 	if (ret)
-		return ret;
+		return -1;
 
 	switch (info.si_code) {
 	case 0:

---
base-commit: 4a40129087a4c32135bb1177a57bbbe6ee646f1a
change-id: 20250707-nolibc-waitpid-uninitialized-c11490c8997a

Best regards,
-- 
Thomas Weißschuh <thomas.weissschuh@linutronix.de>

