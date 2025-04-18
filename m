Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78C181E0DE3
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 01:37:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744940269; cv=none; b=AFf3/OBytvVr7sNj1sk6xdVOadB/BXTuPYiqbJr+eXU0Io7gEg83PpQ6oOH6RWGPmId8rEGcXuywaKoSbnq4xFc8rDiNzPgeWppy7Jo7fP/DakuuD5GLD7FH741tbZGFZNfkYg1/dSrBaK2/8AYrrsOeQB7bEbAxkdx2+CTGy34=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744940269; c=relaxed/simple;
	bh=iC38gdoHa0iB1zJg2rOXQF/27QGDkW0uzWiTqqa4j3U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Dr+eB85eS3P00T7KgVvDp57SK/2kxWItibMxknIvdb0gApvNcYbtnCaGkxduRpY4GriaIuyj/btvy/chvYwIl4wFLBDxcP3M9UArufuE32ZSJJK0LpiWjRmMR22U+7Dg7/ddcarJHzJnGOpRSjnPqwjCl4MdcK8WKuMzHxrqObk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com; spf=pass smtp.mailfrom=fastly.com; dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b=opMN1Kwh; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=fastly.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fastly.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=fastly.com header.i=@fastly.com header.b="opMN1Kwh"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-30549dacd53so1182322a91.1
        for <linux-kernel@vger.kernel.org>; Thu, 17 Apr 2025 18:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=fastly.com; s=google; t=1744940267; x=1745545067; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qZCFxUxzlk1WaRej7yGOb8bWsdrrxKB0c/PerPrAolw=;
        b=opMN1KwhIaWU1GzcTYmUXxoJC8rurkK8X1R8q6eooMpfwoLVFyw03dFeMNtCsXcYi9
         8r7yryOtdkhKYWSjkPz5cpO7g2btCfruXOouGJ7whu62zbyfN4+slOyUoupLxPDRBFOx
         kQp7N5QdK5g8M4KatnHgsRxMqqNNrM6Mgcoyg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744940267; x=1745545067;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qZCFxUxzlk1WaRej7yGOb8bWsdrrxKB0c/PerPrAolw=;
        b=XQa8t3vDZkws3EHEZwMovD4nTg4FliJdtYZ0Pvt1KtLTIAvMv/ISnPD1lTvTy2n6Ex
         zbyrduFduvOVj8bBC4yDJC+yTZspl+emGr8Shpa6XGpI+TrQ/0iCnz2jDni0e8+8qENT
         u+A3ie7kvgB9xDEHwAtbHBGS3atbMfhxB1qWPNWfmIxtLsp4r9+WQ4jGfDZfj2QMQSwO
         S5e5TKyEONjvQRR6iMrpCaDmAQ/UbH73Fqchww/oEjNw0o5Vs4WeMZ6nBwEd+EulpUl1
         VESwQsd1Nlp6rf/HbOl+XL+7duQmqdp4XYnKzX/eM8YkN3kWJ/454bV3o+Ryiv0uQ9/9
         pEgQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4xEOFlCuchVVXJLPoSHi8JRzDKZM0T4G/A8xKogaHkF4QwyvAmuO4lQoVbR/Ocqmrnp/1GGaLG6BCo2A=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLf4QJwB9SfYK9Ia6nyhX/B5vhrqqyuH3hNUoE98PuKin06GtE
	UduCVjaP+uGAo82S4ufZguwEWyg6ZLLlLD6fi+qxnF4K7H7H6cSwbTZ6/wBQvAo=
X-Gm-Gg: ASbGnctJ5Oy8BxHvr7IE4uofms7zWmcNqO8PzA4hpFTCtvdAia1fhY685ZESLY4W0Eg
	D1PDLsrNWO3uaQHZb9UcsCwDRWUD+RVi5lZvw0I3kqTtY3WnLzovMKxzEFP7aFCbDq8RQLhbrG0
	WwCCq0/dr0pK95T9T5qZr6veDZzeFcstyF2YtvdzfUMpEolPuNTxYgtBAqm6gM1VhC989fOBdia
	wDInnJF9ZRT3QJ9lR6AT5OVF7sTBFiCbY0l37MPVVsYo1SPXa3vYFecp+hPfdbDSlVwcDluw+0f
	CexvvjRfqEyLdJx2F6+UebRNwa3ACu6XIifIA2SnunH9m+e3kqUCB7NqUVI=
X-Google-Smtp-Source: AGHT+IHIkIzzR3zj4vrpbAECLpfActXjD6z6qbXH+bYM/RSwRzcQMcmuncyRDhW0LSmFSuyKKHckLA==
X-Received: by 2002:a17:90b:58c8:b0:2fa:21d3:4332 with SMTP id 98e67ed59e1d1-30879c02c19mr2566560a91.12.1744940266767;
        Thu, 17 Apr 2025 18:37:46 -0700 (PDT)
Received: from localhost.localdomain ([2620:11a:c019:0:65e:3115:2f58:c5fd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3087df21278sm131772a91.29.2025.04.17.18.37.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Apr 2025 18:37:46 -0700 (PDT)
From: Joe Damato <jdamato@fastly.com>
To: netdev@vger.kernel.org
Cc: kuba@kernel.org,
	pabeni@redhat.com,
	shaw.leon@gmail.com,
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
Subject: [PATCH net-next v3 2/3] selftests: drv-net: Factor out ksft C helpers
Date: Fri, 18 Apr 2025 01:37:04 +0000
Message-ID: <20250418013719.12094-3-jdamato@fastly.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250418013719.12094-1-jdamato@fastly.com>
References: <20250418013719.12094-1-jdamato@fastly.com>
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

