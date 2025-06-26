Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A88992E973D
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945350; cv=none; b=ZBdvjRVwHt2axDps3YePMdVX96Xmov0DXbfol40t7oGGV7t1e4iib1yAkMZ7ocq+0E/nD+2D3JFofplPv/qUQQZRaHl/TT6D/H51F3urtwuoCnOi9IVXMWCzp3yVJG7SJpKemuNwRO/fPI5NOAB2CmfzouS228O6rrIDUpgInC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945350; c=relaxed/simple;
	bh=6fEu5xm2trEbRlj3pvMFD8BmZuIrIsPIDCm6Uq3X55M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LtbK/YCe9JFJUL2x1Y78QtO9CXEimnWmM2QLFHOMZYFGxlGZKSukU2fSA0JnZ8lSF5C7SeOn+CE8luWLbbPybcMkCShBcdt97uTLVJnFWCE5Vfp39/k9JAN52zlZ+POfGl8OKBnv0BdbctABVLZTRduBbewhsl6W5a2chyB14O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4km5mbwI; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4km5mbwI"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4530c186394so4466555e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945347; x=1751550147; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=aC+obdeMHn5fESAyhGJX79KJV5tcOZyYRgpJyGh+V2A=;
        b=4km5mbwIHgwPTw4+ZzYVNDaxcI7GRq4HMpe0ZFuaRqZ/7zEqamvtYn8ur2NDuvbvyh
         WZnoIqB2+wKGmLGu3e4q7/VJHva5Urh1qdLVc2fZVhDl8SiAOLDcCCXR+GSo4rCqBAa7
         BLwzhf3jzhEEnvZCbojRlsAHOxlIiGsXKSlfnaa0KehVuIN3VG0B/+ZcogrTuvWtRLEe
         qKUaPoS4J6nDgMmSDLUATWpwW0UDr5AXHLrw/a3dgoMOT4mICZAuaKsmXTUXD5D7Byp6
         T2OnSY4+Iv3j1a3vfqHtS4PhXX1Sc9jdQbuMV6Hv22tjZPRxR/6aOWAuljeVbTdLRcjy
         q/Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945347; x=1751550147;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aC+obdeMHn5fESAyhGJX79KJV5tcOZyYRgpJyGh+V2A=;
        b=v8syVBY32Y2ZeyaT3go3pSbsQ61BSK+4r09+rEZmi3JgiVolmr6DUDX4678CVejEOq
         HMipyjxyWXXz57wbKdLN6kYg1DlRovlQ5Ld6rmrUIw/uOr1opWebCAJwO9Kcmj0AYrfA
         CW5uj7nt6FjMzEn2P9m4HQh4TKgYJAPaFCdWRPjb2o6xOi5brczrTGFb9BA5ZBQGjYgN
         eGdlATTmLl1iBhF40nrGDwb0ha/VvCppXPucgvcqtxIty3C9WWkOytgvEEP5DCTsqVh7
         ypT4DvGxaFzfi/0rU/y4Bs7WshjW6f8sZ39KokDRV7L/Zy8tyxZb2vqcCeA4vsbuKHCV
         gD3A==
X-Forwarded-Encrypted: i=1; AJvYcCVomZWOMHCW6cIfE5QshRPJZCkuoPlUsCQ305bvPx7KJ7s9tLd8xr4pY5ZhL04Dmyo05tN64ipX6t+GD9s=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywh9HSb4zJ21eZtQdqxV2878bTcKO8K/VZ05YJRaWHMQvz1sXYx
	ic7iUrSOfjObXT0Ecpl0CidQ2UFOxy7xJCVdZDyfxMRgholTzerRbTmQJMT7krKySzbtDP3Oop6
	x4a5AXQ==
X-Google-Smtp-Source: AGHT+IGWO+HrAaqGj2gtoSP/kfGQbklHzcGbtW41p+3xOWzJKYf8BaOxWZt7gmFhkNW4P0nR4xu2cE6r/YY=
X-Received: from wmbhe15.prod.google.com ([2002:a05:600c:540f:b0:43c:ef7b:ffac])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:3590:b0:453:6ca:16a6
 with SMTP id 5b1f17b1804b1-45381ab7e02mr85005005e9.10.1750945347145; Thu, 26
 Jun 2025 06:42:27 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:56 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-10-glider@google.com>
Subject: [PATCH v2 09/11] kcov: add ioctl(KCOV_RESET_TRACE)
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Provide a mechanism to reset the coverage for the current task
without writing directly to the coverage buffer.
This is slower, but allows the fuzzers to map the coverage buffer
as read-only, making it harder to corrupt.

Signed-off-by: Alexander Potapenko <glider@google.com>

---
v2:
 - Update code to match the new description of struct kcov_state
---
 Documentation/dev-tools/kcov.rst | 26 ++++++++++++++++++++++++++
 include/uapi/linux/kcov.h        |  1 +
 kernel/kcov.c                    | 15 +++++++++++++++
 3 files changed, 42 insertions(+)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 6446887cd1c92..e215c0651e16d 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -470,3 +470,29 @@ local tasks spawned by the process and the global task that handles USB bus #1:
 		perror("close"), exit(1);
 	return 0;
     }
+
+
+Resetting coverage with an KCOV_RESET_TRACE
+-------------------------------------------
+
+The ``KCOV_RESET_TRACE`` ioctl provides a mechanism to clear collected coverage
+data for the current task. It resets the program counter (PC) trace and, if
+``KCOV_UNIQUE_ENABLE`` mode is active, also zeroes the associated bitmap.
+
+The primary use case for this ioctl is to enhance safety during fuzzing.
+Normally, a user could map the kcov buffer with ``PROT_READ | PROT_WRITE`` and
+reset the trace from the user-space program. However, when fuzzing system calls,
+the kernel itself might inadvertently write to this shared buffer, corrupting
+the coverage data.
+
+To prevent this, a fuzzer can map the buffer with ``PROT_READ`` and use
+``ioctl(fd, KCOV_RESET_TRACE, 0)`` to safely clear the buffer from the kernel
+side before each fuzzing iteration.
+
+Note that:
+
+* This ioctl is safer but slower than directly writing to the shared memory
+  buffer due to the overhead of a system call.
+* ``KCOV_RESET_TRACE`` is itself a system call, and its execution will be traced
+  by kcov. Consequently, immediately after the ioctl returns, cover[0] will be
+  greater than 0.
diff --git a/include/uapi/linux/kcov.h b/include/uapi/linux/kcov.h
index e743ee011eeca..8ab77cc3afa76 100644
--- a/include/uapi/linux/kcov.h
+++ b/include/uapi/linux/kcov.h
@@ -23,6 +23,7 @@ struct kcov_remote_arg {
 #define KCOV_DISABLE			_IO('c', 101)
 #define KCOV_REMOTE_ENABLE		_IOW('c', 102, struct kcov_remote_arg)
 #define KCOV_UNIQUE_ENABLE		_IOW('c', 103, unsigned long)
+#define KCOV_RESET_TRACE		_IO('c', 104)
 
 enum {
 	/*
diff --git a/kernel/kcov.c b/kernel/kcov.c
index 2a4edbaad50d0..1693004d89764 100644
--- a/kernel/kcov.c
+++ b/kernel/kcov.c
@@ -740,6 +740,21 @@ static int kcov_ioctl_locked(struct kcov *kcov, unsigned int cmd,
 		return 0;
 	case KCOV_UNIQUE_ENABLE:
 		return kcov_handle_unique_enable(kcov, arg);
+	case KCOV_RESET_TRACE:
+		unused = arg;
+		if (unused != 0 || current->kcov != kcov)
+			return -EINVAL;
+		t = current;
+		if (WARN_ON(kcov->t != t))
+			return -EINVAL;
+		mode = kcov->mode;
+		if (mode < KCOV_MODE_TRACE_PC)
+			return -EINVAL;
+		if (kcov->state.bitmap)
+			bitmap_zero(kcov->state.bitmap,
+				    kcov->state.bitmap_size);
+		WRITE_ONCE(kcov->state.trace[0], 0);
+		return 0;
 	case KCOV_DISABLE:
 		/* Disable coverage for the current task. */
 		unused = arg;
-- 
2.50.0.727.gbf7dc18ff4-goog

