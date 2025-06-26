Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DD352E7187
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 13:42:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750945335; cv=none; b=deL3dQjOgH1jm0AbZinqmRcDiG66hy2n64rU0NMEIeESzU8/hDkX1bUNKpR72ZK93GrGNQOpgABioypYEEpAQxeo0mfyTPTclPBnFn/oCeMiwAmHwvwBSIxVY1kptzsJUsMgPoRPkfqit8Gsynv0P6jf9JED2fBgltM1DUTmrog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750945335; c=relaxed/simple;
	bh=PvyE1JdQBnLBc+VJ48KLaBuARDtzc9BomVMqIozi8gc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z4IPAEyAMQooD695upjLA7KpcT6I5S9uj63WRTdBn3KAa4SqoIHjzUfwXWY23rKksSjRwaGONyYgOt891RXYEp62KvedQ8I54pK9WW1g7ejaak3ELiunV19HE0/g08b3kWcjrTNtT4/zuEcYE7RqI9DbHWLrsyDO+CeeqCrokDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--glider.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nONcUsTH; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--glider.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nONcUsTH"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3a4fabcafecso529783f8f.0
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 06:42:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750945332; x=1751550132; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=H2gpzKqZL1lxRtkvI/RoX8Rqd5NtVf1Q/oJAS1UNweg=;
        b=nONcUsTHX1RY9pQwBy2gOMwHaz0qIiWF1TkCmxGnUfk03W7YegS00UZmd6mloGfAnd
         vNdP537fhnEXOATfCjuUFCsaZAkWz7C2iynFye+K3Bgq5v4Xi+PqQv70uijzA/cCzBzo
         tBO9RUUdVeYB5ZBn5sCzWi22SjH3zPtjQJPGybmKnoOwCjcnY/J9PTbnAoUjAqxwSc7Y
         E6btl+DETGuTU4NT8bo4AogzpCYUdukIcmg7Lnn4A3S3/Yjt57EvS+VAuxIeQKeseRjt
         Txjg+PZfDD7tSNnY/molgcqOvJOuiKW3kP99mQ4HaPo7YFJ21eIKTMKL9AmFdelBFE+J
         eKhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750945332; x=1751550132;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=H2gpzKqZL1lxRtkvI/RoX8Rqd5NtVf1Q/oJAS1UNweg=;
        b=q24B23aNLKDq6OYh2wsW5hEvzxaKsLBRNoobfS1+wLIuWz+rUYuJDbKqLvrDKeSVPy
         EqHuYZtsrM0U1J2UJkOSpmiboNXUYPOI2OSHiv/h83qHDq4LVciOeQ+mj+8yeXIKRzu7
         hosLPZtaxyrvn/KyX4Yxjw8OVyIU9qxfJKPgSTNcZ/DDJw3N21fpQf18GrAjt/FrtG+J
         +fmi3fqD/3MK7WaNIsq3CUzcO6eNuCF93aLIDUhbb0IDS2aLyrGs1OzxwTM+omPSzw6J
         iqCxxHJ3a6MsNz6pIoHG0ERzWtn4+0cUgnKyNXtpqe9RTFTUTKOKHMR+g8vCAn5AtGtS
         lVng==
X-Forwarded-Encrypted: i=1; AJvYcCVIz0WIgTeDsZ6wchPU+Je23auwGrbm73QNI+6p6fdbdBK8+6Cc0K/8GOU0trQ6iL/YgGk/lSnNby21UJw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWU05OMxVHEGDXfxgGppSEdcvwYKAsJOnVIbDQdwiD69QEuTXt
	D7ZsjqEGsqEP6tN10NE42dwC3ZYUHA27ciiQ9W0Oa+cMs64fdB7+cqv0g96h/BTe7qJeomVQuUN
	dbncopw==
X-Google-Smtp-Source: AGHT+IHOpP7+XElh9h0a7yzDlbl+mIW4gb/1D/GB9XeXT/yGolnUvCQhMsQ75cHNc2+ZUOdmZWmTT7Nff24=
X-Received: from wrae8.prod.google.com ([2002:adf:a448:0:b0:3a5:7c42:1583])
 (user=glider job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6000:3103:b0:3a4:f7ae:77e8
 with SMTP id ffacd0b85a97d-3a6f2e8e297mr3438599f8f.15.1750945331958; Thu, 26
 Jun 2025 06:42:11 -0700 (PDT)
Date: Thu, 26 Jun 2025 15:41:50 +0200
In-Reply-To: <20250626134158.3385080-1-glider@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626134158.3385080-1-glider@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626134158.3385080-4-glider@google.com>
Subject: [PATCH v2 03/11] kcov: elaborate on using the shared buffer
From: Alexander Potapenko <glider@google.com>
To: glider@google.com
Cc: quic_jiangenj@quicinc.com, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, Aleksandr Nogikh <nogikh@google.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Ingo Molnar <mingo@redhat.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Marco Elver <elver@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Add a paragraph about the shared buffer usage to kcov.rst.

Signed-off-by: Alexander Potapenko <glider@google.com>
---
Change-Id: Ia47ef7c3fcc74789fe57a6e1d93e29a42dbc0a97
---
 Documentation/dev-tools/kcov.rst | 55 ++++++++++++++++++++++++++++++++
 1 file changed, 55 insertions(+)

diff --git a/Documentation/dev-tools/kcov.rst b/Documentation/dev-tools/kcov.rst
index 6611434e2dd24..abf3ad2e784e8 100644
--- a/Documentation/dev-tools/kcov.rst
+++ b/Documentation/dev-tools/kcov.rst
@@ -137,6 +137,61 @@ mmaps coverage buffer, and then forks child processes in a loop. The child
 processes only need to enable coverage (it gets disabled automatically when
 a thread exits).
 
+Shared buffer for coverage collection
+-------------------------------------
+KCOV employs a shared memory buffer as a central mechanism for efficient and
+direct transfer of code coverage information between the kernel and userspace
+applications.
+
+Calling ``ioctl(fd, KCOV_INIT_TRACE, size)`` initializes coverage collection for
+the current thread associated with the file descriptor ``fd``. The buffer
+allocated will hold ``size`` unsigned long values, as interpreted by the kernel.
+Notably, even in a 32-bit userspace program on a 64-bit kernel, each entry will
+occupy 64 bits.
+
+Following initialization, the actual shared memory buffer is created using::
+
+    mmap(NULL, size * sizeof(unsigned long), PROT_READ | PROT_WRITE, MAP_SHARED, fd, 0)
+
+The size of this memory mapping, calculated as ``size * sizeof(unsigned long)``,
+must be a multiple of ``PAGE_SIZE``.
+
+This buffer is then shared between the kernel and the userspace. The first
+element of the buffer contains the number of PCs stored in it.
+Both the userspace and the kernel may write to the shared buffer, so to avoid
+race conditions each userspace thread should only update its own buffer.
+
+Normally the shared buffer is used as follows::
+
+              Userspace                                         Kernel
+    -----------------------------------------+-------------------------------------------
+    ioctl(fd, KCOV_INIT_TRACE, size)         |
+                                             |    Initialize coverage for current thread
+    mmap(..., MAP_SHARED, fd, 0)             |
+                                             |    Allocate the buffer, initialize it
+                                             |    with zeroes
+    ioctl(fd, KCOV_ENABLE, KCOV_TRACE_PC)    |
+                                             |    Enable PC collection for current thread
+                                             |    starting at buffer[1] (KCOV_ENABLE will
+                                             |    already write some coverage)
+    Atomically write 0 to buffer[0] to       |
+    reset the coverage                       |
+                                             |
+    Execute some syscall(s)                  |
+                                             |    Write new coverage starting at
+                                             |    buffer[1]
+    Atomically read buffer[0] to get the     |
+    total coverage size at this point in     |
+    time                                     |
+                                             |
+    ioctl(fd, KCOV_DISABLE, 0)               |
+                                             |    Write some more coverage for ioctl(),
+                                             |    then disable PC collection for current
+                                             |    thread
+    Safely read and process the coverage     |
+    up to the buffer[0] value saved above    |
+
+
 Comparison operands collection
 ------------------------------
 
-- 
2.50.0.727.gbf7dc18ff4-goog

