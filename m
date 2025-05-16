Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2F06200B9B
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402883; cv=none; b=HFuhId7n0kywZdr0XjfwYjLde32ZtnZ55QaGggSSiAjWYkPFkPBObvmJhaKm/wLgxPAfUb8s+UjqwDvjM52o62FNg7KS2vKS0CXGgQumegYh28WpgC9NnK8VMW2qR2fOJNHa4RbRTHeqPP3b574zoS2CpiapB1O/wbdtDw2UcBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402883; c=relaxed/simple;
	bh=uJWI89wvuu58ssW9qPj7mRyoSGLNQzk4PZd/GC7Hv54=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=cLSt4qccHR9MKc6S3LOq7PYwY52ygxoQn15yEjEbkrMGQo7N2ZSIfepkwV+EaUdolCXVDWqAHydXql5gLrHp39gVdeupzfLXhGoq+T/9fkvDFRarsFsIwzD7nprbr0uXv09hkG04rNxLtFcE5TOGvFhQ3Vul8mFhR/MNdXvE1qU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oCBS1o02; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oCBS1o02"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a0b570a73eso1393954f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:41:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402880; x=1748007680; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P7GVxU0/r+w5zLWT8gZSbiy4WliZZRj39MPigOv2RvQ=;
        b=oCBS1o02JWuLlxLVHuSLTSRdLb9z6FcUCDF20hjE0sPvvRVQG/uhXCSyEBmQ/ajAHj
         LE2sZ3c37fnIYC4QlU5uwKWxhZhVM/70wOXou+jf/Q57L5kvDSlOutPhI/alMVvWV5yH
         VfWn+SUEfmzBqjf5NGcImMhcoB6s5UjKpGkFGTubZnFIgs3nXDbCIY84Jj/iq+k1qt1X
         q1tHDCJHV5c80wdceKmrZvyIK3HjTLg6QCVYNlQBnSqpllkI2ZGT0YuoiQtqQzd458ZY
         MP0l3pz9vH2nzY9gKGlU8LZ/siM4f6AgqC1/yST+s0WUnHwbrMgdM5Cp0jKDQHla9epj
         oOcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402880; x=1748007680;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P7GVxU0/r+w5zLWT8gZSbiy4WliZZRj39MPigOv2RvQ=;
        b=MD+D1EyzDVhNfZ2Fl4mNUjJ074g4c3vskpVf22m70OcgR+9V0RyWlHeXISKod8Fpcd
         5pj1KxiTM6+vuyefXz5SJtOfHQXy9E443kturtxTG1zgqDkhq3KtpO0x6FwqI6T5Wgcd
         IZSjFZXLp79i4GtRx0305593y5I9kMffaOenshy+XKxGabSq9LDWOakp/lYvX1pDIgCX
         aZLcVuLzKhvq0zs2oMvHXBTZv5p+CG7scYHuF2BW6AA/iW5h0RkKpO4x/bubb2pmwXWz
         clMuxuESuIKKZY6kqRc/fg+43UsRP1WbsgCDi2vMfusuKuxYPwEwlMy1l3q6peJ3xIor
         EzOw==
X-Forwarded-Encrypted: i=1; AJvYcCU0TdhsVVIV1oXsakMzTbgFjixnNPExvThosjFsC8zAL6a1TdyHP+CVcoD19hP/mtjfYcyM2TYiajY5iLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwtaPsTiJ/GW5xSB8330S0WwKZQPrL6V7sPgDXXitsXll90ZGxb
	L/zXDUFu3sJoDUS0aRga+WvtALxJoXIbdi0ELvmAMKVf4L7vyI7sZMASTsnIj9/6fi91Yib+XlP
	jzGfQ0lfb/IAf77VvfOGPUQ==
X-Google-Smtp-Source: AGHT+IF5jgzJGfaBS/UHJ3X8WaZX+60Zli0llPdcw+b0LDQXYJrpjyQFz+/w5KLRHR1Rt2m4D1p45WOPNgP2H7ul
X-Received: from wmbhg17.prod.google.com ([2002:a05:600c:5391:b0:43d:58c9:bb51])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2289:b0:3a0:bcb1:fc02 with SMTP id ffacd0b85a97d-3a35c84ae4dmr3449099f8f.54.1747402880322;
 Fri, 16 May 2025 06:41:20 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:31 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-26-vdonnefort@google.com>
Subject: [PATCH v5 25/25] tracing: selftests: Add pKVM trace remote tests
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Run the trace remote selftests with the pKVM trace remote "hypervisor".

Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kselftest@vger.kernel.org
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
2.49.0.1101.gccaa498523-goog

