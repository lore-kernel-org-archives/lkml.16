Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D38F11D8DE1;
	Sat, 19 Apr 2025 10:46:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745059595; cv=none; b=SjHQzYDffo76iBTvXCHnPaSLksjpcojh48JJsSI5h8L9vXuKAQwRx2hIfwUsznykSCbG+4Q1ZLVv1r93g/0cc/WOQKNa/fYUPlOK1kNBHXkZmkinwGsKCumF00JOqW9pD9zH4IcO9UFODlSfQGEvbkgn3ZRcVVHaiEb6BlD3TMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745059595; c=relaxed/simple;
	bh=K8/JOiUEC1Un4wIBEvmCV0tkDDsaFdfktVZkJJkwMeM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XwHxO26rSwqnPWlAMuACuZ0Hw+CjoW+cUkFtEkWNt2ccD0CmQssyF0r/km1UlIdrXWsSinaYo9VCYoOaQ2bS2XfyTdjzI/ucPkCCtHvGkVQSmlUa5SuMC5NbFSB93TqZ23QsjzcKgOf09tbWur51WZkd3wYrFF5peJ7X4mfwb8s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=M0G2VliO; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="M0G2VliO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1745059587;
	bh=K8/JOiUEC1Un4wIBEvmCV0tkDDsaFdfktVZkJJkwMeM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=M0G2VliO1G7GeNPK9FzVnk6DnOsWOcthInLImQkj/hBvPDy0OY767ou7JLfc3t8Ss
	 86Fijh4GjW3d7EFnQ5ngqH91X8XpLSteIH6Xfo306ZsUOlNaIbEdQ/VlCNPth/tEoJ
	 FNcrK7KZil9me2ThcbUUV01gR/+lx3SXgm2rKpPw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Sat, 19 Apr 2025 12:46:20 +0200
Subject: [PATCH v2 3/7] tools/nolibc: disable function sanitizer for
 _start_c()
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250419-nolibc-ubsan-v2-3-060b8a016917@weissschuh.net>
References: <20250419-nolibc-ubsan-v2-0-060b8a016917@weissschuh.net>
In-Reply-To: <20250419-nolibc-ubsan-v2-0-060b8a016917@weissschuh.net>
To: Willy Tarreau <w@1wt.eu>, "Paul E. McKenney" <paulmck@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1745059587; l=1091;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=K8/JOiUEC1Un4wIBEvmCV0tkDDsaFdfktVZkJJkwMeM=;
 b=VZ9JP9/c/ljkA0CaiVksEheXdLEhdr81iwVlG69UOtGZ6pKU9/O3KzljWksjah1CYN3sJUStO
 EGEDh/QXBIwCxR0xuFZbcFd+eKESjRzEelzWbsXyB97/kvHNWZjD/Xx
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Both constructors and main() may be executed with different function
signatures than they are actually using.
This is intentional but trips up UBSAN.

Disable the function sanitizer of UBSAN in _start_c().

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 tools/include/nolibc/crt.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/tools/include/nolibc/crt.h b/tools/include/nolibc/crt.h
index c4b10103bbec50f1a3a0a4562e34fdbd1b43ce6f..961cfe777c3564e705dfdd581de828b374d05b0b 100644
--- a/tools/include/nolibc/crt.h
+++ b/tools/include/nolibc/crt.h
@@ -7,6 +7,8 @@
 #ifndef _NOLIBC_CRT_H
 #define _NOLIBC_CRT_H
 
+#include "compiler.h"
+
 char **environ __attribute__((weak));
 const unsigned long *_auxv __attribute__((weak));
 
@@ -25,6 +27,9 @@ extern void (*const __fini_array_end[])(void) __attribute__((weak));
 
 void _start_c(long *sp);
 __attribute__((weak,used))
+#if __nolibc_has_feature(undefined_behavior_sanitizer)
+	__attribute__((no_sanitize("function")))
+#endif
 void _start_c(long *sp)
 {
 	long argc;

-- 
2.49.0

