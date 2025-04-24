Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02AA874C14
	for <linux-kernel@vger.kernel.org>; Thu, 24 Apr 2025 00:28:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745454499; cv=none; b=UiXb6Fxt2+TxqojyluBupw2VzlPsnjTVX4Cg9XjZWCe7w19JwZspob8cVyVRoka62XfluC5RncwZAHtsFeRsZ+gbi8de0gUEp8gkhu4Nsd8sM831G0D60WCJGEiLsUuTl9zGmaaJCCNRvZLNxVS/6NcHym2RX0gl34/Qsjwdcqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745454499; c=relaxed/simple;
	bh=CC5P9PlTFOFYmpGkh+AgeMpeAfxK9NmmEpB4vEaUjMk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KRbjkHIBEiWCYiTxL5P8P/5oTyW7lPRWQfJnRV9a4mGozS6ZPuf+ACUSQ+qSuETqJ/4WLlDgJKR9QgE3VGn8yh7kPq5Yj/VRYu56JxynLm29SPJtBcStqxkpMLIeT+ZDyLY1duqhSOOfRbsEMtnDXQYYJlJ67XakoMnxt/368zY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=gi9Jco+a; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="gi9Jco+a"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-301302a328bso578722a91.2
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:28:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1745454497; x=1746059297; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K0pZyEyvgBt8oFD4ZrZQFJhXNyLvOB+O0xQ+Wcll9kk=;
        b=gi9Jco+aEqNtbuyDmscJmg9o5IK/DK1zy6puezcbPjsbBSPJKI+Meuy8cuotwPLx5Y
         UIPLcYZuj5PdAU25UiZdjQ1pKX6lzWIHfjAbLI6W8esUbXsxGM6o32Mh1dH9yWRhSZmZ
         aQZSpBl49lHIJz+HRB3PB3KFttNvWiZCkfEpw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745454497; x=1746059297;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K0pZyEyvgBt8oFD4ZrZQFJhXNyLvOB+O0xQ+Wcll9kk=;
        b=qgZEe5jm1Cj5XwhdwIyE4vEipgc6DECMZJdsVAQYY0IgYn7qnCh1bm1cQSn9kUxpUy
         bltT14Ut56VN6LeVAVfD3Ru7E9osyyCaNuNwralNecbYDVKtEClGBcH0PFKvB+gFVlTL
         ImUZ8lz1pni6lzGQL2qZkElzJho1MUeglzAUgTpB13IcwcWjaRM2n0FJS7IQH5jM4zz2
         3fHS5FDbZP9EwB5t52/8tRBlVo9nkNO6NOPiKjIvoNolrHM4uPbWX6gqZREypWVHgp1b
         452Z08DIUuFeJKsmpNevbAo/rNTr9+FL3cqtVmd4CPU0PtlaV4QKbfPzHMMYw+2OGBld
         xUSw==
X-Forwarded-Encrypted: i=1; AJvYcCW9cba5zaA8AQ5hbW4Ne8AnKJdqVHSmp9WDd1m2X88A3aD2im+jL14ezfXH+4j8MZNsrTlymJbTKoE33I4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAjvQoq9RJILKVzYv0u9TiGW6xKgQef+LA4xWlxHrmoxHqT/cw
	b1J0fnvg4evWLa1jMb5NKGCf6VqvYvTn+PSX6hQijcOZyOFepZp8t6xWYKQG58E=
X-Gm-Gg: ASbGnctL1WEhR7CL1/WJIHy5Ae0uni0WnlyX+YIG9ihlmtWUnHjXjsX9rPzHIfD6hhX
	OFZ/2ElTVwELGYebxhY+5wHuO5EMbUeV++T2hm/Ukw4P8K+KGFb+D3FVOyZmTKngCEc702PaNfk
	qQDWCqxKnU9+wr8Ol6BLgWgLa1wKf65iNOIxD8lPNy2APq5FM06vbshdvVaNNHPx0YLKxgvowA8
	5Egs0aDqRaz6vBtE3N30Zr3pVqHdnwsseKjgCpEbq7gpm/8medGHQWNe68Dc1V9E7n1yarDg1zt
	A6GEQCk3kLS/A9j9EQX8JE3sl+CiWL3NXTRQQEPEE0vKNcq8
X-Google-Smtp-Source: AGHT+IEAmg0XR+f+4dbbuaII7I/1Nj1o8g+oD7f7K+/8qFPWxrVWr1FeBq7fThzkgJQPYmfowLY1oQ==
X-Received: by 2002:a17:90a:f945:b0:2f6:be57:49d2 with SMTP id 98e67ed59e1d1-309ed29c8d8mr1097904a91.17.1745454497172;
        Wed, 23 Apr 2025 17:28:17 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-309ee7c4054sm83013a91.23.2025.04.23.17.28.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 17:28:16 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	shaw.leon@gmail.com,
	pabeni@redhat.com,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	bpf@vger.kernel.org (open list:XDP (eXpress Data Path):Keyword:(?:\b|_)xdp(?:\b|_))
Subject: [PATCH net-next v4 2/3] selftests: drv-net: Factor out ksft C helpers
Date: Thu, 24 Apr 2025 00:27:32 +0000
Message-ID: <20250424002746.16891-3-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250424002746.16891-1-jdamato@fastly.com>
References: <20250424002746.16891-1-jdamato@fastly.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Factor ksft C helpers to a header so they can be used by other C-based
tests.

Signed-off-by: Joe Damato <jdamato@fastly.com>
---
 tools/testing/selftests/drivers/net/ksft.h    | 56 +++++++++++++++++++
 .../selftests/drivers/net/xdp_helper.c        | 49 +---------------
 2 files changed, 58 insertions(+), 47 deletions(-)
 create mode 100644 tools/testing/selftests/drivers/net/ksft.h

diff --git a/tools/testing/selftests/drivers/net/ksft.h b/tools/testing/selftests/drivers/net/ksft.h
new file mode 100644
index 000000000000..c30a02da903f
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/ksft.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(__NET_KSFT_H__)
+#define __NET_KSFT_H__
+
+#include <stdio.h>
+#include <stdlib.h>
+#include <unistd.h>
+
+static void ksft_ready(void)
+{
+	const char msg[7] = "ready\n";
+	char *env_str;
+	int fd;
+
+	env_str = getenv("KSFT_READY_FD");
+	if (env_str) {
+		fd = atoi(env_str);
+		if (!fd) {
+			fprintf(stderr, "invalid KSFT_READY_FD = '%s'\n",
+				env_str);
+			return;
+		}
+	} else {
+		fd = STDOUT_FILENO;
+	}
+
+	write(fd, msg, sizeof(msg));
+	if (fd != STDOUT_FILENO)
+		close(fd);
+}
+
+static void ksft_wait(void)
+{
+	char *env_str;
+	char byte;
+	int fd;
+
+	env_str = getenv("KSFT_WAIT_FD");
+	if (env_str) {
+		fd = atoi(env_str);
+		if (!fd) {
+			fprintf(stderr, "invalid KSFT_WAIT_FD = '%s'\n",
+				env_str);
+			return;
+		}
+	} else {
+		/* Not running in KSFT env, wait for input from STDIN instead */
+		fd = STDIN_FILENO;
+	}
+
+	read(fd, &byte, sizeof(byte));
+	if (fd != STDIN_FILENO)
+		close(fd);
+}
+
+#endif
diff --git a/tools/testing/selftests/drivers/net/xdp_helper.c b/tools/testing/selftests/drivers/net/xdp_helper.c
index aeed25914104..d5bb8ac33efa 100644
--- a/tools/testing/selftests/drivers/net/xdp_helper.c
+++ b/tools/testing/selftests/drivers/net/xdp_helper.c
@@ -11,56 +11,11 @@
 #include <net/if.h>
 #include <inttypes.h>
 
+#include "ksft.h"
+
 #define UMEM_SZ (1U << 16)
 #define NUM_DESC (UMEM_SZ / 2048)
 
-/* Move this to a common header when reused! */
-static void ksft_ready(void)
-{
-	const char msg[7] = "ready\n";
-	char *env_str;
-	int fd;
-
-	env_str = getenv("KSFT_READY_FD");
-	if (env_str) {
-		fd = atoi(env_str);
-		if (!fd) {
-			fprintf(stderr, "invalid KSFT_READY_FD = '%s'\n",
-				env_str);
-			return;
-		}
-	} else {
-		fd = STDOUT_FILENO;
-	}
-
-	write(fd, msg, sizeof(msg));
-	if (fd != STDOUT_FILENO)
-		close(fd);
-}
-
-static void ksft_wait(void)
-{
-	char *env_str;
-	char byte;
-	int fd;
-
-	env_str = getenv("KSFT_WAIT_FD");
-	if (env_str) {
-		fd = atoi(env_str);
-		if (!fd) {
-			fprintf(stderr, "invalid KSFT_WAIT_FD = '%s'\n",
-				env_str);
-			return;
-		}
-	} else {
-		/* Not running in KSFT env, wait for input from STDIN instead */
-		fd = STDIN_FILENO;
-	}
-
-	read(fd, &byte, sizeof(byte));
-	if (fd != STDIN_FILENO)
-		close(fd);
-}
 
 /* this is a simple helper program that creates an XDP socket and does the
  * minimum necessary to get bind() to succeed.
-- 
2.43.0

