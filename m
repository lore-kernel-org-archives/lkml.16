Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911511CC8B0
	for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 01:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744853592; cv=none; b=s25+HukQ0awrCDFg6foZbdJWJO6BGbPPpVRWC6t5op2bhi6igrv0Hfemm/cYqY+rOOBvougi2eXttvtYTQrLKSIYKL3gTZrsoXkc6/aYqCbOWN9c+fbfvegxgoqmmknZiWH+J5EFGJbdqP12FWHeZ8CV4lkiZo9RPVVu2wwemBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744853592; c=relaxed/simple;
	bh=iC38gdoHa0iB1zJg2rOXQF/27QGDkW0uzWiTqqa4j3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AU543kNER2D7V8sFv1J8GvUgCS4b8nIze5kbMgwiE+clQIRm3pryXxqZPkTgkMOWdTDsDPHHtyBDYH+tlBNPM3nGueT6F5+dAeMvF6TcMEZq3A+oBfFJoN2KouIOJ/ZL5W5sKZbO9+X89Ddwfy+OjiLP7aMGpBAps2bYdKtVG2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=vSuxi/dE; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="vSuxi/dE"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-301d6cbbd5bso210758a91.3
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744853590; x=1745458390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZCFxUxzlk1WaRej7yGOb8bWsdrrxKB0c/PerPrAolw=;
        b=vSuxi/dEclKZP/Uw2HlGkujTqUsjwtcgulp4TI8gVBA0qXXl3BYAdL9Mz5dTEo/a4+
         2+LBJF+x26DlKumHooL/iPouP2w27utGceCOFB3ta5FwokuRCNsESkJP7Q1ROiuMqX83
         tmO6dYZ4OglgM9ncvu30Un7+EnAziLaQ0Rars=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744853590; x=1745458390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZCFxUxzlk1WaRej7yGOb8bWsdrrxKB0c/PerPrAolw=;
        b=Ar+3auVcr0jqgTX7pPa5Ic2lq4gJ4vF9o8RcvroECWSwbFhvOrRvNx4g+ZTfd5KuME
         mLCbF7YxkrpWB5GFhz0kEmA5O0UK1HzsM1/3z3ziPydwfI527TOPf5LzgKdndvBYpAA7
         T6lmFGwh8DVIYYmY1ZNJ8CUYSu/FSZVcdwvUUw8URADQvhaKUNVvWEec7D9G7DfC3hRc
         EvB0LBCf3VSNvVFIto0FMZ8jemoEdEadFAGNckUg6byC4eNIDO5XyqL+/5rtlnflbgdW
         +Jv0jDadLoqkp90i8ghlpsn0Aw5qQ2ySo4BVlzW4YWmFG3s39XQCL7pUODtg2loVOMG/
         jlpA==
X-Forwarded-Encrypted: i=1; AJvYcCXr1L6tJeJAbaR+WE6kheET9xpDS8kkbZurN1F0xtJakh+KX9FcG0yRl6v9UprPIgL8dX39a+Tqr9IDdTc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPXR20XTdNAEpRC28EvndP/RmCLvpeyvB7njfFlflPZe+MMQXZ
	fbcvv0mC3E+eHmcsJz1/MlAGDKoToq2qq47R/H3DZZoCabbdaC6BLBZH5AMqpgo=
X-Gm-Gg: ASbGncvJtBQDh+S+vIZg7iZSvD5eToY61GocXX+BnQjUfJJYDp7RgEqm62+IkcyThIx
	kzm79vLsVbsp4Rju3YFE98X+c2qTV9DeQh7TCOXgA7vReRg2IMas5hXXnbKkPOYiXNlu3l+u2ig
	qJLJVck7K/hKqV/b0AxJcCEoJRQHzPV/iV6D6uoDIBX2+jaQBjP4juJ8zhOlc7tCW19UFzCjxyY
	oM+tQao7/LBGddip/ORFLN6xLti0+P0cn5aX0luZ7yNSvoqp5Q7zveTnwmVsniUFcbLdWW51v+0
	r2/XPcv8ohxFxLwWuEYllSIzVUs+l5guzcfl9U9T1vKY47dD
X-Google-Smtp-Source: AGHT+IFURUTFYkzHYQIncz+BfKUAREfkEb0hfHFXyfz2gYFuInISIzikqK/QQxnSU1SXGYMuPoyaZA==
X-Received: by 2002:a17:90b:2f4e:b0:2ff:6167:e92d with SMTP id 98e67ed59e1d1-30864173b39mr5158528a91.32.1744853589813;
        Wed, 16 Apr 2025 18:33:09 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c33ef11c7sm21349505ad.37.2025.04.16.18.33.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 18:33:09 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	Joe Damato <jdamato@fastly.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Shuah Khan <shuah@kernel.org>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	John Fastabend <john.fastabend@gmail.com>,
	linux-kernel@vger.kernel.org (open list),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK),
	bpf@vger.kernel.org (open list:XDP (eXpress Data Path):Keyword:(?:\b|_)xdp(?:\b|_))
Subject: [PATCH net-next v2 2/4] selftests: drv-net: Factor out ksft C helpers
Date: Thu, 17 Apr 2025 01:32:40 +0000
Message-ID: <20250417013301.39228-3-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250417013301.39228-1-jdamato@fastly.com>
References: <20250417013301.39228-1-jdamato@fastly.com>
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
index 000000000000..3fd084006a16
--- /dev/null
+++ b/tools/testing/selftests/drivers/net/ksft.h
@@ -0,0 +1,56 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+#if !defined(__KSFT_H__)
+#define __KSFT_H__
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

