Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8532E1F8F04
	for <linux-kernel@vger.kernel.org>; Thu, 15 May 2025 06:48:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747291693; cv=none; b=VhSX9DADqVjVOl6qGgPkODm+IGc+3LM7fHVbiQjegXdcF88Z9RSW5gVstwr5vEQiNZDDMG6ieOkjkQWxc7+HLaodFevL2/5GZwJkuAnZeVX0i2muB5tu+JJrGyRzK2fMgdTMyg2obVX22TSnhb4dmoihwxIkoPprPOdgcIzgFyQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747291693; c=relaxed/simple;
	bh=pCOKfqrUqerqVW/lrEibXtb97pPwyr9mufaH1jke1PE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=P0rDCeVqeIp7/z1Ly9vdfihhQanCSrxhC+QVPHb9pK6Unqlpn6eUTaz/fcgwlnnimLZG49+eDQ/WSkzubaHe6Q/DdvpNZLEMXQ5LJvFgD5QH7iytiNa2+7AJYdx4uiAYfYNJSqStcuZM6uI+ZtONvsnMcW8AU2wqAQXooagszdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=PeLUz3zw; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="PeLUz3zw"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-af548cb1f83so440228a12.3
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:48:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1747291691; x=1747896491; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=4O9Ag2+phgLJMMiW8a2CQx+t0xdJte/3dUf07UrWGag=;
        b=PeLUz3zwRPLpwxL0lPMWMzaEJUMMHZ0sDHyG3oUnfCPcC29+rOiGnBmtrEwPVUKtUc
         FbZB2PC9OiLAw5ealg2hPfiG7ztvy6QNUZnMhchateMkE1jaNrtdQROeZZcenNDgFvF8
         sGcN+x7EzTTKUR6BREMj2fUnDcydZJ1TaOjKM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747291691; x=1747896491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4O9Ag2+phgLJMMiW8a2CQx+t0xdJte/3dUf07UrWGag=;
        b=KprPY5zoK0HGrQS5MV0bsskNLe7KyGtiC2cm3+GG7eGPSjVV2dj99zY+E3mUm5b0h/
         sscUQLx3n/sr+5SLr4fiw+z/yo2r0r1L51wM3MH2ybF8qPJ32Kk9hrupKdjtG3KCL/cI
         qVIjArkhy9K2URQSNrYIbowYUCENoKQNdcQCOf/JvrpPJCbzzzyDm3saY14ARB825ndm
         KTDlv46uszIbEMfakzEO0Co48UPJtrR5vgz1FPUvrQIwH/BjVkfwGoYP3oktajK0Z3d/
         TzsYsCwvEmUf1R8cLA6PEDajm3zl5sZqL0c7cz7V4cFJjw01r+onfwCDTakYdi2yZB+h
         jKSg==
X-Forwarded-Encrypted: i=1; AJvYcCXoK3hctNV8Dwvl37NqSnWau2mdtMNLwIRFMFnQbQPyoIuAX2hInGTswBekyT7FVuAJ+otIfSf6SYevtWk=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5iLZ3BADzrORoXYmXJtxBGm4jL6rJRXIj24AVfRRGa0vIAELY
	Fbh7gO7Ca/+afUEDbuKmoCOjyiO+/KG31AmSfVKBGZFJV6UhYyfmBCTU9EyORg==
X-Gm-Gg: ASbGncuw4vBH4eX9aow8MHxVAHbvydbGoqS1u4YlRFfAeyyjjrHyKG6mHJxaUpEViIZ
	lZdoiWPDG7RnIYP2lDz/4/gKqYo9ekPnz3zwZGIU/+X99A0Nbz+D2hYKmC8zvkezdL4APDKLUl2
	mtjE0lKMZbgQWkl9WlA7838Hy30h/vM8utWlPVbLdaeDew0EzKEpE54R6iqt7aUVCk/FfF/QJio
	HkSyIAOvd+wx2WeACw+467HJ+q7A/YMpm2sheCZjOB6317XEeYSXoLrajqUb9MXwWKvke7ZLgsR
	36t5p+F5RTmy0sylkGA261y29Ozq6098WMru6NVhZyy5B7NftDrUDhQfA7Mnc/fMgHOvAEXs2nG
	Vrg==
X-Google-Smtp-Source: AGHT+IFd4TC3pjFpUh1gYRkIvDJD3J/aYbWd+r4NPLgxJSMSFO2ecsNHnoVnUUGCRYcQ9ui1VNtjIw==
X-Received: by 2002:a17:902:ec88:b0:220:c178:b2e with SMTP id d9443c01a7336-231b605b0afmr19562775ad.17.1747291690800;
        Wed, 14 May 2025 23:48:10 -0700 (PDT)
Received: from tigerii.tok.corp.google.com ([2401:fa00:8f:203:291c:c511:a135:fe23])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22fc7549200sm108636875ad.10.2025.05.14.23.48.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 23:48:10 -0700 (PDT)
From: Sergey Senozhatsky <senozhatsky@chromium.org>
To: Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>
Cc: Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Song Liu <song@kernel.org>,
	Matt Bobrowski <mattbobrowski@google.com>,
	Andrii Nakryiko <andrii.nakryiko@gmail.com>,
	bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Sergey Senozhatsky <senozhatsky@chromium.org>
Subject: [PATCHv2] bpf: add bpf_msleep_interruptible() kfunc
Date: Thu, 15 May 2025 15:47:40 +0900
Message-ID: <20250515064800.2201498-1-senozhatsky@chromium.org>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

bpf_msleep_interruptible() puts a calling context into an
interruptible sleep.  This function is expected to be used
for testing only (perhaps in conjunction with fault-injection)
to simulate various execution delays or timeouts.

Signed-off-by: Sergey Senozhatsky <senozhatsky@chromium.org>
---

v2:
-- switched to kfunc (Matt)

 kernel/bpf/helpers.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/kernel/bpf/helpers.c b/kernel/bpf/helpers.c
index fed53da75025..a7404ab3b0b8 100644
--- a/kernel/bpf/helpers.c
+++ b/kernel/bpf/helpers.c
@@ -24,6 +24,7 @@
 #include <linux/bpf_mem_alloc.h>
 #include <linux/kasan.h>
 #include <linux/bpf_verifier.h>
+#include <linux/delay.h>
 
 #include "../../lib/kstrtox.h"
 
@@ -3283,6 +3284,11 @@ __bpf_kfunc void bpf_local_irq_restore(unsigned long *flags__irq_flag)
 	local_irq_restore(*flags__irq_flag);
 }
 
+__bpf_kfunc unsigned long bpf_msleep_interruptible(unsigned int msecs)
+{
+	return msleep_interruptible(msecs);
+}
+
 __bpf_kfunc_end_defs();
 
 BTF_KFUNCS_START(generic_btf_ids)
@@ -3388,6 +3394,7 @@ BTF_ID_FLAGS(func, bpf_iter_kmem_cache_next, KF_ITER_NEXT | KF_RET_NULL | KF_SLE
 BTF_ID_FLAGS(func, bpf_iter_kmem_cache_destroy, KF_ITER_DESTROY | KF_SLEEPABLE)
 BTF_ID_FLAGS(func, bpf_local_irq_save)
 BTF_ID_FLAGS(func, bpf_local_irq_restore)
+BTF_ID_FLAGS(func, bpf_msleep_interruptible, KF_SLEEPABLE)
 BTF_KFUNCS_END(common_btf_ids)
 
 static const struct btf_kfunc_id_set common_kfunc_set = {
-- 
2.49.0.1101.gccaa498523-goog

