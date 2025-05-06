Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 785FE28B517
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:49:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550167; cv=none; b=XONBMohvev/D4k+y69lBflf8pvB5sy+CertiwQ97wstZlDxoqLpFZ7isn35ZY38A5GhR2CuIJ0lckIufJKBaZXppz820QrqGQXqDaAwdosq1Y20SBvLNEDYftsAZqvFG3FviF5VbU12WPrv/s3KXgPXg01M8wADnJW7pskqQ0K0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550167; c=relaxed/simple;
	bh=RUCw8tASqS+xDOl6+m21B7MoC2GnYKahCqfxjmK6wVI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=d5DAeapJzyCDIIQNlkmU/a0C0HqiaHp3AnxMoEf3m4sH5v1tvCT0SkgFNGayt2PgGblH8k9PQRxxWU49YBBIZrTodKnl5ntXvCVom0qphFl7928VF8Qc/IGc2yKkcuNXbbTZoD9ZqUBhvcfOUmiVkpX/cWs2RKVGyuL/0UTKJpw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=2Nk/NPQB; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="2Nk/NPQB"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-39c30f26e31so3465775f8f.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:49:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550164; x=1747154964; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaqt2aF+R21ZLRZCmibO0BCKtkQEu5NrJjYtBghM3iU=;
        b=2Nk/NPQBZLGiLd+j1OMus+upc3opOayALg7QgdSZ0AURVrUJusoh0AfyhY9/mi+PCy
         9Gj1uKpudgiFLHmxjn7RQcaYz9JPnZPKg7qSyEsH8vwrPYKuPMCh9VXFUvKgI0EQ8n2l
         tYBzbjCHyIWChS9yJRyi4wWpJ2za/8KJSNP1VsZUjoUA10ifyx48vEeGJdM1PiXAnPLK
         w2fvuWVwF/pgK5VpQsw1bJMplUS3cIv3/Ph1QSt+3b75uBnxTlfVQRnQpknL+k6t/LvI
         xqeBW9keiJpHcliuC/TmvrGTdLYlht1e8f9KV/BH2t9uGvLvAa4G2F2MY66IqEoMOqnf
         h7QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550164; x=1747154964;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Zaqt2aF+R21ZLRZCmibO0BCKtkQEu5NrJjYtBghM3iU=;
        b=CoYtsLtAkjQIc3N1VTQd+bbs3jM7Rx30HAgtTYvgvhYv7fTrDI6vT+4clMIJ7qrCpK
         IsHG0RI9ucVLpoeKktBn5bmIfPecEz65xOwo7mTxLS/KtdEefW6Nlhh6M07lX1RUtnml
         XGd0JFxcnsOnOmRc5j4FQL4EZDYlcJ/y0JdfU8VauJkIrqQacdGfK5Y1g36PaJV3aVbb
         HpjQU74Kznf5hVSXXRJpRRcfPLWzCfPwXJ2p4vGkE/b8xcvQcF9LaRWv0wQyjF8y+N8R
         f+J5kw7D1A8BIRKUrhrVGpSts+OxZELvqfQOkkwE7s/0X2FKEwRufBFAPICeNuyV4xJ2
         Ig5g==
X-Forwarded-Encrypted: i=1; AJvYcCX5p3BPRnUhJispcs50+i68j0fRLXdxg/KVXcIlgD6etam8pZvH3DjQJubbmZa32mW42KFYsT4ux46WcAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWpYLk/l/xe/eoqKRPWaRbyoWfYf5lgfJZYK/44EkU/NOGqC6/
	YhdqVUYrBlr2/0dcoAMVdzBHpUICYyRSvesVa+tQaUCDgUDtCMpV7VcXNe+oY9vPkEW/nY9YT03
	FekYvu9VpHjgCAasijA==
X-Google-Smtp-Source: AGHT+IFrqd+H2SeGnXjM2S5QS5+AEOUz3d6c3+Xi+kOr44Ta+o3bbgik0UkwmDoNUTqqJhmyWDUfjboZeaZZM1Ft
X-Received: from wmrm12.prod.google.com ([2002:a05:600c:37cc:b0:440:68cb:bd4])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:22c2:b0:3a0:8098:b6c with SMTP id ffacd0b85a97d-3a0b4a186c4mr138331f8f.14.1746550164127;
 Tue, 06 May 2025 09:49:24 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:20 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-25-vdonnefort@google.com>
Subject: [PATCH v4 24/24] tracing: selftests: Add pKVM trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Run the trace remote selftests with the pKVM trace remote "hypervisor".

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc
new file mode 100644
index 000000000000..383ef7a84274
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/buffer_size.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing buffer size
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/buffer_size.tc
+
+set -e
+setup_remote "hypervisor"
+test_buffer_size
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
new file mode 100644
index 000000000000..679e31257d0b
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/reset.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing reset
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/reset.tc
+
+set -e
+setup_remote "hypervisor"
+test_reset
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
new file mode 100644
index 000000000000..4c77431e884f
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/trace_pipe.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing pipe
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/trace_pipe.tc
+
+set -e
+setup_remote "hypervisor"
+test_trace_pipe
diff --git a/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
new file mode 100644
index 000000000000..059c7ad1c008
--- /dev/null
+++ b/tools/testing/selftests/ftrace/test.d/remotes/pkvm/unloading.tc
@@ -0,0 +1,10 @@
+#!/bin/sh
+# SPDX-License-Identifier: GPL-2.0
+# description: Test pkvm hypervisor tracing buffer unloading
+
+SOURCE_REMOTE_TEST=1
+. $TEST_DIR/remotes/unloading.tc
+
+set -e
+setup_remote "hypervisor"
+test_unloading
-- 
2.49.0.967.g6a0df3ecc3-goog

