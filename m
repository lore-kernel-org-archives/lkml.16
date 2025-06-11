Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8C1A25A344;
	Wed, 11 Jun 2025 10:34:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749638050; cv=none; b=oqVuhdUq8/6+eddkGu8/PvKLF+PWZwdQms2+pqNqU0bBi5z9W0ZMCiPN/gPqz1PKpeVpfnOMcXUBslFmtdKG9KAFDmO06JEiRCj2ocRyYsBjq4R8z9JUmrS63iRpybBjVHYeGP+DRQGAhgahvsa8Tgm1uBB6U5AuzROWP29oLHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749638050; c=relaxed/simple;
	bh=V01m4shBLAsX/OjVRCn2HdvbjOXNjSAp3eQ+3KwX6is=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZmFqvaTzbLY9k9jQK5a7PtVMfM4s57JcqUsgpD7oMx1MOvoaV7xSljOKvtLr+XFqjmRYOYNkrptJuraVcOhO0xTBc+px8OBJZLXhcvQpWZmDrWriJB46mVy1+zFPPicvJHGyJdpsRguYQbEJIvmKOY3kWaLJYK3vSiWEgI5vR8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=DReeW8yt; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=ScZLBlgr; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="DReeW8yt";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="ScZLBlgr"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1749638046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrTXAPhkZ9+e0KUJ47HvOra46bzqWMhwXTsxq2IMoaw=;
	b=DReeW8ytWKxN7kXy7ZGL6P+hGHzoC8W1nUczwZ+PY1KgMRYgA0cbeZrg1SYM4AqGUW4104
	rIGpeudYz38tvawDUMn5QSLQS8JkucqD1zVDpCpfK556MqwQibqqZPGWoxOmRB75ctMrp/
	jkSQvMHi254Imx4jzZ2s4qnUO7Q/Yxylxn6g7XIdSoR5WDJKwEblu+BUbPXIjldgjw6xmc
	Hyl5MmHkKLFzNaJKNUOnLXxlDmlm7STzSoEaSJz0SIhtMvJGBuHWZSIORxRZcPcOswmC8g
	Ii7HwMRs3Bblq+cBeN/OLDLF84yGDY6xOwoSggokx59g4mDoGkYi0ZDTW841Gg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1749638046;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GrTXAPhkZ9+e0KUJ47HvOra46bzqWMhwXTsxq2IMoaw=;
	b=ScZLBlgr6sOjHw4rQxvMJcygeWbruWkkbqIM3B5OLW0TLhCiWjhwMWAXVKgAOC0CuBQvee
	T9It73zaqndyCJCA==
Date: Wed, 11 Jun 2025 12:33:58 +0200
Subject: [PATCH v3 8/9] selftests: vDSO: vdso_test_getrandom: Always print
 TAP header
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250611-selftests-vdso-fixes-v3-8-e62e37a6bcf5@linutronix.de>
References: <20250611-selftests-vdso-fixes-v3-0-e62e37a6bcf5@linutronix.de>
In-Reply-To: <20250611-selftests-vdso-fixes-v3-0-e62e37a6bcf5@linutronix.de>
To: Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
 Vincenzo Frascino <vincenzo.frascino@arm.com>, 
 Shuah Khan <shuah@kernel.org>, "Jason A. Donenfeld" <Jason@zx2c4.com>
Cc: Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, 
 Muhammad Usama Anjum <usama.anjum@collabora.com>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749638036; l=1385;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=V01m4shBLAsX/OjVRCn2HdvbjOXNjSAp3eQ+3KwX6is=;
 b=sQ2Q2FsJDoHWze/cAvUyDNkUeJQd+Rcf02SD88++vxw6diOrORKRk5YZ+eK0skZ6EaurlQb+B
 H9dEbuxFJ3TDGYxZAZ+pRI8SUBoGErSOjyI3uyX0aVrkYfr7Hv96ZLN
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

The TAP specification requires that the output begins with a header line.
If vgetrandom_init() fails and skips the test, that header line is missing.

Call vgetrandom_init() after ksft_print_header().

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Reviewed-by: Muhammad Usama Anjum <usama.anjum@collabora.com>
---
 tools/testing/selftests/vDSO/vdso_test_getrandom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/vDSO/vdso_test_getrandom.c b/tools/testing/selftests/vDSO/vdso_test_getrandom.c
index 389ead4e1fe3761f265f7b589b417b6d9f25c565..dd1132508a0db29a32ec977b30f64b20aa43e03d 100644
--- a/tools/testing/selftests/vDSO/vdso_test_getrandom.c
+++ b/tools/testing/selftests/vDSO/vdso_test_getrandom.c
@@ -242,6 +242,7 @@ static void kselftest(void)
 	pid_t child;
 
 	ksft_print_header();
+	vgetrandom_init();
 	ksft_set_plan(2);
 
 	for (size_t i = 0; i < 1000; ++i) {
@@ -295,8 +296,6 @@ static void usage(const char *argv0)
 
 int main(int argc, char *argv[])
 {
-	vgetrandom_init();
-
 	if (argc == 1) {
 		kselftest();
 		return 0;
@@ -306,6 +305,9 @@ int main(int argc, char *argv[])
 		usage(argv[0]);
 		return 1;
 	}
+
+	vgetrandom_init();
+
 	if (!strcmp(argv[1], "bench-single"))
 		bench_single();
 	else if (!strcmp(argv[1], "bench-multi"))

-- 
2.49.0

