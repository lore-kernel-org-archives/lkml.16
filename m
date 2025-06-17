Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C6BC2EF9DD
	for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 20:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750193696; cv=none; b=OcSxAcMBhVQvioai8Pg31j/vK8NtJXclsNYVDBCPK7mUFkqoGO+DUUsHZNKGGtEgNyYKyJd2kFizvWC/eqRZVj8cAnFwiyADvfiRGE4VFKokB0b2aPaOLHtyVTmEyH/o80ZyWPUpJpZbMwjod0DTfuQo0z8mC4vYKPDK7TgBJV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750193696; c=relaxed/simple;
	bh=k5HJSRWuV+1Mln/4BLkxqduXgXeG6WrJ7rZ+a26pUuI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sZ0dx0Smu2YY53amV2L4l1Bb5SAB1oV/At0EBfe8nw/b5ulIiWm4wIvJtexNbn3S4W2vN9rUFAff2mKqpv9GQoNKDOLSSB8hRF5rLBKzQhA5gypCEFiTvAhNQWxg5NC7RbMOV9dXQq9OdrifskRZE6C7ukKsS8ulgTLkFTbIO64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ohpAtdWI; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ohpAtdWI"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-3138e64b3f1so7419025a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 13:54:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750193694; x=1750798494; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=3xlQaSGpJbgGPPU4jLd2/c6BgEh1uTog2yg7MQ8roEE=;
        b=ohpAtdWIMsVPagMpTdEEqbqqGJEINACu8Ez32VvCIGk5A+AgpJJuYZhnJPE8pa3ndx
         yIO0vpR4sffKtd3c2QS3SCu7gFf59OqD74lvwoQPMSdmv+wEEoeC8PRjQPrA/IkC9ySc
         iUV2S87P080tR+6/Ky8iUARHW48TDM9VYQcAc8Shk24QFrOtogIm6k63ONgEXEcBItYQ
         2qvvfIK0GsWr9yb48s4krz9hCG9COM3TEUKPZe22CGDcab1pjY+8LmWZDuqyaCM5yU+m
         kKldg3mkL2WGm5Yk7j5wwf0Ji3dcFfr8VOFENb2KUePCcUFSMojba/c7H+Pwwyia0N6f
         qHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750193694; x=1750798494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xlQaSGpJbgGPPU4jLd2/c6BgEh1uTog2yg7MQ8roEE=;
        b=oaNQFPBLAQ40LhpCIMjObd0ZAHd7BoG1luw+VqrIvyuYQKnmXoA9/kxtNlQ8nw+E07
         o+1ZVB9mElqSu6Rycy0+/Ptk/AbNI8RyUFIwOkw5YgDJmDz/Zj5yUyMsYlE8ajXunaPU
         N5JvjGHWtGBZ+wshx/AuPlYbxykj3qgjyYuXO5q/GJM681z6JapWT6LykA60PTLfswCZ
         5LS4wsOXH2rY0QtIpe+7Dxh61KcIlK5/YCNAlkVyrgXBG0Qn8djfPTx+hOPX32+Ikjs2
         l4OL/jt9BLqSi+v5veqSmRHrkN0rvOao3DAwMGOMbKzT7MhJ8Maz1jyt1mgfQZmanwIB
         uqPQ==
X-Forwarded-Encrypted: i=1; AJvYcCVmI0bOyani8Whe7rmKiRLPrWj2VO+yNoaWG+DB7wS8/eAptBzxcQ4xEphffS2f9d+66ZSacjGNdxRKOX8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCBmWzHxEg2YZYXoldRnB8GuL/lCxY2piYJoKs4PkyxJufy3hF
	6/60TcMBT9Wk4aCJjpO5/zbax/4pZiheJq2ePjaXwPyj1y9uN1FJlPJGZRCMxzLkBnL64aoyclY
	m+baRSlWEew==
X-Google-Smtp-Source: AGHT+IHSVka4J5eAYOjalcWEI2+0Bl25UJzGl73fRn3zliqO43FS2CrU0+33Xsoa30I91krygdj+UOT9DaDG
X-Received: from pjbse12.prod.google.com ([2002:a17:90b:518c:b0:2fc:c98:ea47])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53ce:b0:313:23ed:6ff
 with SMTP id 98e67ed59e1d1-313f1ca7758mr19569857a91.1.1750193694031; Tue, 17
 Jun 2025 13:54:54 -0700 (PDT)
Date: Tue, 17 Jun 2025 13:53:20 -0700
In-Reply-To: <20250617205320.1580946-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250617205320.1580946-1-irogers@google.com>
X-Mailer: git-send-email 2.50.0.rc2.701.gf1e915cc24-goog
Message-ID: <20250617205320.1580946-4-irogers@google.com>
Subject: [PATCH v2 3/3] tools headers: Remove unneeded ignoring of warnings in unaligned.h
From: Ian Rogers <irogers@google.com>
To: Eric Biggers <ebiggers@google.com>, Yuzhuo Jing <yuzhuo@google.com>, 
	Andy Lutomirski <luto@kernel.org>, Thomas Gleixner <tglx@linutronix.de>, 
	Vincenzo Frascino <vincenzo.frascino@arm.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, 
	Al Viro <viro@zeniv.linux.org.uk>, Christophe Leroy <christophe.leroy@csgroup.eu>, 
	"Jason A. Donenfeld" <Jason@zx2c4.com>, linux-kernel@vger.kernel.org, 
	linux-perf-users@vger.kernel.org
Cc: Ian Rogers <irogers@google.com>
Content-Type: text/plain; charset="UTF-8"

Now the get/put unaligned use memcpy the -Wpacked and -Wattributes
warnings don't need disabling.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 tools/include/linux/unaligned.h | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/tools/include/linux/unaligned.h b/tools/include/linux/unaligned.h
index 395a4464fe73..d51ddafed138 100644
--- a/tools/include/linux/unaligned.h
+++ b/tools/include/linux/unaligned.h
@@ -6,9 +6,6 @@
  * This is the most generic implementation of unaligned accesses
  * and should work almost anywhere.
  */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wpacked"
-#pragma GCC diagnostic ignored "-Wattributes"
 #include <vdso/unaligned.h>
 
 #define get_unaligned(ptr)	__get_unaligned_t(typeof(*(ptr)), (ptr))
@@ -143,6 +140,5 @@ static inline u64 get_unaligned_be48(const void *p)
 {
 	return __get_unaligned_be48(p);
 }
-#pragma GCC diagnostic pop
 
 #endif /* __LINUX_UNALIGNED_H */
-- 
2.50.0.rc2.701.gf1e915cc24-goog

