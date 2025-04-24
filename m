Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4451122577D;
	Thu, 24 Apr 2025 11:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745495300; cv=none; b=uci9Tn9ZE75QeQRqQ9GytkOuK5Gn8l/tEyuI85ZxImae4CvRRaMlGGLT6DpWzKbWdIxqGBBBkbpadRcGlxJM+rRhv2YyrQUIzFMQyO5c9RRFtQzdJjbHUv3m8JUgEDc94ESMigiiH8ZXGuV7t+9oDVEC8OmTFnnSJR/1uVLJlKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745495300; c=relaxed/simple;
	bh=C+1D7R75jEC58jOR/Yqz3KgquUzsYptXPbHIO1u4B1o=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUvmnzwDZE2fS8fvLs1NXWriPXgWcT9K6wYfI5Y5Mg4JIk3YGz0Dn63w9MPLIaWaXDmAevbeV1QvWctucF1ACP9TbV3MMBWAzFcw0wC4ttSZs00NQOO1hnBLKsLwmE6HAnKwURxKmyTf4CxK9H/1heAd4uh7UFh+tNbq/9eJ73o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=TorOVnQd; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=EQyldH/K; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="TorOVnQd";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="EQyldH/K"
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1745495297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pTunsNZTf1GYNEw0PoHmf2OJAl/C/kA5v9wUIBqoHs=;
	b=TorOVnQd8sB9X8s9Jqi7s53+nOfoXkBmJlExwlGZODSHWB+TGhgSzH7mLwvP6jPqNWV6WR
	Qf46SVZQt9suyQppb4dkrGxoeHK28ui0E2fq8jMcdtCAz0yz3Zes0G7BNwGytZxuDk6VUe
	LkHatAk2VDe+DENtMSA7gpWORiVswAPVCriK3CAOs90pEvNPFHUzQ2UZDvZ9T3XUAmpKHF
	oMjNz6EQU4FwfVF4BouVlwLxN+rV9igDwcTtmNKggsKFLpLC8BoU9ofv6OVIT2IbP0z0OC
	5pFCnDvoVgNdt6bFRlZGf2kgyeLgQ7+PNsxKbZWeqsB9wI6deIZEHBfPbOIBnw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1745495297;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4pTunsNZTf1GYNEw0PoHmf2OJAl/C/kA5v9wUIBqoHs=;
	b=EQyldH/KGtiKOmjEWR9ukCL7GAn8mMzOcDunZQ+17+DljnwjaRwBtEIHcrRFM3AltIIdxz
	Xv/cTySMT5RA+OCg==
Date: Thu, 24 Apr 2025 13:48:13 +0200
Subject: [PATCH 3/3] selftests/nolibc: always run nolibc header check
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250424-nolibc-header-check-v1-3-011576b6ed6f@linutronix.de>
References: <20250424-nolibc-header-check-v1-0-011576b6ed6f@linutronix.de>
In-Reply-To: <20250424-nolibc-header-check-v1-0-011576b6ed6f@linutronix.de>
To: Willy Tarreau <w@1wt.eu>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745495292; l=1070;
 i=thomas.weissschuh@linutronix.de; s=20240209; h=from:subject:message-id;
 bh=C+1D7R75jEC58jOR/Yqz3KgquUzsYptXPbHIO1u4B1o=;
 b=FTM/8BjgFZUV0ReGkM5KXSWsYHgNoPqSWHNWl+yDaanP3jpt+9lmEvkfKYe9AWv25DP7P27yF
 UAJZpdoPXQtC4OOL+v7WmVnkAZO7rJvnDBN1Vp0zUSfj2kp6aedmlQ7
X-Developer-Key: i=thomas.weissschuh@linutronix.de; a=ed25519;
 pk=pfvxvpFUDJV2h2nY0FidLUml22uGLSjByFbM6aqQQws=

Prevent regressions of issues validates by the header check by always
running it together with the nolibc selftests.

Signed-off-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
---
 tools/testing/selftests/nolibc/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/testing/selftests/nolibc/Makefile b/tools/testing/selftests/nolibc/Makefile
index 94f3e8be7a68f63ecd639c4f283b3cd10764ce74..d17750761d9f418b27c571de1cf3d0f4954877fd 100644
--- a/tools/testing/selftests/nolibc/Makefile
+++ b/tools/testing/selftests/nolibc/Makefile
@@ -251,7 +251,7 @@ sysroot/$(ARCH)/include:
 	$(Q)rm -rf sysroot/$(ARCH) sysroot/sysroot
 	$(QUIET_MKDIR)mkdir -p sysroot
 	$(Q)$(MAKE) -C $(srctree) outputmakefile
-	$(Q)$(MAKE) -C $(srctree)/tools/include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone
+	$(Q)$(MAKE) -C $(srctree)/tools/include/nolibc ARCH=$(ARCH) OUTPUT=$(CURDIR)/sysroot/ headers_standalone headers_check
 	$(Q)mv sysroot/sysroot sysroot/$(ARCH)
 
 ifneq ($(NOLIBC_SYSROOT),0)

-- 
2.49.0

