Received: from mail-yw1-f225.google.com (mail-yw1-f225.google.com [209.85.128.225])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C1CB276049
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 22:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.225
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745966474; cv=none; b=IqB3LyIPgvTKSnPB0lUY+Tp9gZX+5ybbIZU9n8b/ZMAK+WkD1DAZxri1dZUpsqFYbPWwEzIhM0rAtvRQRWEf/AfTPvJHuHT3X/zO8xUu/ai5QZfuD+TRZIkX1oPewHyfPSQ7GoZEyZcTx9R+KFgsYkpFi9O3ztJ0MowD1IAnxZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745966474; c=relaxed/simple;
	bh=ObuAsSl4WZHTMvFnPb6US5OeBMXHiIWBUHv3E4P+6ZE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SYE79cKVs57likwHYPt4YmBRpN+QWmvnNO/AF59wdvrAKPEmrq1UWiIVLoGroGXMKKof49YIBlriHadKZtUmJdOnd7ZJL37HecdzvFhAXV7uJU0FVE+W8EhRYazmjWNkeRyZx4E8pmrks9UmI3xuIkaSvq7o0dVj7Vdlo4b/UYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com; spf=fail smtp.mailfrom=purestorage.com; dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b=N2NuSz6v; arc=none smtp.client-ip=209.85.128.225
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=purestorage.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=purestorage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=purestorage.com header.i=@purestorage.com header.b="N2NuSz6v"
Received: by mail-yw1-f225.google.com with SMTP id 00721157ae682-6ff1e375a47so69538687b3.1
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 15:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=purestorage.com; s=google2022; t=1745966470; x=1746571270; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J5UBAAEMQRo7Cyw0R0b1FnwG+WPDkBuKLP1lc95VWmM=;
        b=N2NuSz6vDYXkot94vhK1O3n+L19mDGc0v7HKxKKWZrTpg/tAdQZnbIzn8RV1CxA24j
         WuQ6cbeKk0ROUFBxL3JyD6qARmTZ5n5DcZbHIaq3kdiM8JVNfrHafuRjWfgEVMG088Jz
         NYgaTEOCnMpqyP4znQz3lIuSKWglDu0N9pfM8cGvFLPihrQHknyYDma2INDwUHuMVUiX
         DYbNQ6TYvVrE9B+diMnlYYawe35uEKsPwryApNOwjoHBJsi+hui8XlbmuZ/t9Gwnne71
         xsOV+dirjfnykUK1Mt0Cwhf3skdEleiAEKyd3mQFbns3Sj9FinWd2WRoi2nRHwduZECB
         65hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745966470; x=1746571270;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J5UBAAEMQRo7Cyw0R0b1FnwG+WPDkBuKLP1lc95VWmM=;
        b=U8AWKkZ/Lda78/oFyCtK+3qYOPKZ1RD2ffAwkWmFMgE597jp8JI4ooXEw32oSGcRXN
         jG0HJ7wB2emjUb4QehriBIcSB/2sAnk6tJ76HJElX1kBRfyvdTfHrI0JjZBeexokSkcl
         8Uxaifp68RQBW3ka44Unh+NObjtsO1vGdaH3/Ucu2wxFKWF9yl4Zpb6LEOcEIRQuXTb7
         zKsMYWRIIs5sKwERicnwwLU4VIaKyu8CaAxlneRr3Guu7/1Gyn9zKBCw4lg9cv+/A3nv
         emmBw0TadXLLACmGVji5OhjDzc5dDNV/f2wXeP6375m5l8yVxczSaqORYtDlDvNe0xE8
         L0/g==
X-Forwarded-Encrypted: i=1; AJvYcCWuyeIUWmuxx/rAfTzqoWH3ch9MpWKNjZMhVRk9mGNhMqPYKFWm2n0k6eWUR9ssHWT44QDmRrIt76yY8ks=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywta0O13Cw3RrmeS0OdecYQpDP4NK1dxTBKRvidOik2N7vEr3ga
	03dl1S9VvR+CrBz74kVEZuL+HxyVKDgH972ESpmr6zGbBjt1ZPby+GksMcBbCHS9Hr+0sHB2JcR
	k72+H0daBq3erp+NqWaGKslrYJUMV2g2m
X-Gm-Gg: ASbGncucSufokolJe+BsvZ9Zxh1omOE3C+wu2KmGweYR7zRmmyS4Gqh55mBxWnJU1B7
	v4dpRXad0YK7dL79lDvmGLaCiW+Tu+u+OImo4T/yv36aqODcGYWIGnnqpifFGGuV7pwIBp03E4x
	0NQ5kfQo3e2k3mHOUgCSyYoXnw5o/8upvU2GbfYJym203BphLdsD3IIa9KejjpRE3Ub2G5YR3ji
	OuOM+QnhBbMJuteK6/M3fIeoNmJF6RJ+9HeC3cYKMsW4LwQ5fxd1D2ClMdsJ7g948r8LjnDEZYs
	WjugeVqOVqzih5Rj33ZAGNBtpA12ecIvsniL4wUfH5xAcg==
X-Google-Smtp-Source: AGHT+IF0yMWC+jrX3o7QqODqh/qL4kwwrsmmLtw5gv1rlU/mBGIQgXBbEeZPRzdVsm0dUCh6BJkRhAghKdmH
X-Received: by 2002:a05:690c:6c0c:b0:708:a686:7f04 with SMTP id 00721157ae682-708ad5c00d5mr9177577b3.2.1745966470249;
        Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
Received: from c7-smtp-2023.dev.purestorage.com ([208.88.159.128])
        by smtp-relay.gmail.com with ESMTPS id 00721157ae682-708ae0694a5sm75197b3.40.2025.04.29.15.41.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 15:41:10 -0700 (PDT)
X-Relaying-Domain: purestorage.com
Received: from dev-ushankar.dev.purestorage.com (dev-ushankar.dev.purestorage.com [IPv6:2620:125:9007:640:7:70:36:0])
	by c7-smtp-2023.dev.purestorage.com (Postfix) with ESMTP id 030583403AE;
	Tue, 29 Apr 2025 16:41:09 -0600 (MDT)
Received: by dev-ushankar.dev.purestorage.com (Postfix, from userid 1557716368)
	id EAB40E40ED5; Tue, 29 Apr 2025 16:41:08 -0600 (MDT)
From: Uday Shankar <ushankar@purestorage.com>
Date: Tue, 29 Apr 2025 16:41:05 -0600
Subject: [PATCH v2 3/3] selftests: ublk: kublk: fix include path
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250429-ublk_selftests-v2-3-e970b6d9e4f4@purestorage.com>
References: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
In-Reply-To: <20250429-ublk_selftests-v2-0-e970b6d9e4f4@purestorage.com>
To: Ming Lei <ming.lei@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: linux-block@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Uday Shankar <ushankar@purestorage.com>, 
 Caleb Sander Mateos <csander@purestorage.com>
X-Mailer: b4 0.14.2

Building kublk currently fails (with a "could not find linux/ublk_cmd.h"
error message) if kernel headers are not installed in a system-global
location (i.e. somewhere in the compiler's default include search path).
This failure is unnecessary, as make kselftest installs kernel headers
in the build tree - kublk's build just isn't looking for them properly.
There is an include path in kublk's CFLAGS which is probably intended to
find the kernel headers installed in the build tree; fix it so that it
can actually find them.

This introduces some macro redefinition issues between glibc-provided
headers and kernel headers; fix those by eliminating one include in
kublk.

Signed-off-by: Uday Shankar <ushankar@purestorage.com>
Reviewed-by: Caleb Sander Mateos <csander@purestorage.com>
Reviewed-by: Ming Lei <ming.lei@redhat.com>
---
 tools/testing/selftests/ublk/Makefile | 2 +-
 tools/testing/selftests/ublk/kublk.h  | 1 -
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/tools/testing/selftests/ublk/Makefile b/tools/testing/selftests/ublk/Makefile
index 529ab98a2633a2278bc0df8b26500905d60d2bec..aaf011520040d3e96912c876bf74e488e774e473 100644
--- a/tools/testing/selftests/ublk/Makefile
+++ b/tools/testing/selftests/ublk/Makefile
@@ -1,6 +1,6 @@
 # SPDX-License-Identifier: GPL-2.0
 
-CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)
+CFLAGS += -O3 -Wl,-no-as-needed -Wall -I $(top_srcdir)/usr/include
 ifneq ($(WERROR),0)
 	CFLAGS += -Werror
 endif
diff --git a/tools/testing/selftests/ublk/kublk.h b/tools/testing/selftests/ublk/kublk.h
index 918db5cd633fc1041e1e0805142f00e7e4f28bf7..4b943e57a890e5f14fa11dd19d67c4c8684c4417 100644
--- a/tools/testing/selftests/ublk/kublk.h
+++ b/tools/testing/selftests/ublk/kublk.h
@@ -19,7 +19,6 @@
 #include <sys/inotify.h>
 #include <sys/wait.h>
 #include <sys/eventfd.h>
-#include <sys/uio.h>
 #include <sys/ipc.h>
 #include <sys/shm.h>
 #include <linux/io_uring.h>

-- 
2.34.1

