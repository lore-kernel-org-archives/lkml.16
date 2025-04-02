Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3E320E00B
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 09:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743585023; cv=none; b=TJRVxNkOe8CI72pz6gKHplNVh0tDqBbpdJejJU/unFJFnJvAZYmZz5ZUHxff/0R7iNCBauS0J4KiZ6smKotbwFLVflnqxrPgkIDGyAs/lH6pwTlysWhSA2vD0WxI8ZfaMmzJmRnMMjgZySWjwXkrXVi9YElRt/QJrMohUIC1xs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743585023; c=relaxed/simple;
	bh=JXe9+MoAHNEbl3ShXRxAj4qmSQFLrbwr4XO8/clU/LU=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HMN/XP0s7VjapttEaQZYb0PCeyKYp02mb/nSobI5Qls6n1RI2vlpOvdPysG1jLjgmqUiCYMP7pgetjsMgwfnoZtIRlqz/w0aSvccGgg+/lSl3lDDZPaMJLREgFgNCplCeo77qE30Tfe41/lkNjcBgcUC0kjKzC/8zRM5G+vYlO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=j7Y5yx5s; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="j7Y5yx5s"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so47033495e9.1
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 02:10:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743585020; x=1744189820; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U7z/KlsKyhhnbH8XEsUbytOmm1NX0p4soUYAosgwOb4=;
        b=j7Y5yx5s63ojq7Us8NftaVp77aZTOclglZe2/Uw2ZbKEk4kgNvCICXx23fHz6FrALH
         C75s7lpSBmQolqOzSnD7pFMQAHcJse8fPVVB6aPdrMgqvlW5KdNAlHH+9kQUwrUNzI1u
         VrfiIGtrxRtVFFfZoSXxN0oWydJeNhulIR+34=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743585020; x=1744189820;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U7z/KlsKyhhnbH8XEsUbytOmm1NX0p4soUYAosgwOb4=;
        b=o4Rw00UA5Wyme9bSlBOuE2nglA71IXSRI3PW/NuSJswsKZH9YZdBCqYf9zgV5qXYY3
         69pav/mOvKPFKj+oujM6zVRtbr7yNYQNNQVFNjBMr+KYW0Sb+lyN5yI0Gy6a0Napd9ua
         su4GMeTjPmLXkMO8RZ4gJaC5KFQUPJSxTrvRAXBgO9JlWwYv/L/d066TvzaM0Sp7vb23
         moaF+jwUu1fXQDPKVq7+e+mu22BLclgGHno0ma+Tqs7mxroXNljzvJ9sZCmHKx/ylSZk
         CDv1x/SG8GJg8Dgn7PHl5P9+yIaoF/wwfut2u5LzcHwn33aF+u7st4xGr+dMwIOCxL7S
         7u/g==
X-Gm-Message-State: AOJu0YxFLa7V3HXSdqa2jMdc3uBWroGUJuBLQcqDkr39h0gvVoMV4oX2
	AtTpQEb25/bGs3F6m4C5W1jGWwoDvYMVQn7EfJpHK5OAEz3csjKgqYXOcmBepi7N9GvTMygsw0r
	o5TM=
X-Gm-Gg: ASbGncvgjHCENBzI5e+5LCFklyzq2QdE8Fbfh/IhFMSiVR4enKds4bT2eJ8F5a0kQPu
	Cc5F+3jGyPQdF93SQB0O3O54O3eKuW4X2PjaxHmdCSpIu430lm0vj09F1DOH11ByYN6+HpF5OLU
	HChMVD0vKt+gndlUDuFu3+X1WwCylPyg1HUVjbg1xjuT++1QnOl0UoQm55hPAvXojlUCZy2wvOA
	uGbyw8b0eGzsvSvTPW14YkFBZUxwks/QZ1cLlJ9J4VB9BX/NNObn1FJwTaDCWSGSoAD4eGm3zwU
	zFxxAMPDGs8FXJK9JeZ0qUCPofTO1GKznWpy/QjmPAqkUrkmKn9tuQORkflo3nUqR94Skn/ZRcT
	tkGqRX1o5pMm2LNcHWQ==
X-Google-Smtp-Source: AGHT+IHaT2jIGzrZL2WfHszAPwDWfxKqNuAXnqoprQT/S0V/rRcapqWZ9joJ1OyHcV4WCfVLYdjkAw==
X-Received: by 2002:a05:600c:1c1c:b0:43c:fd72:f028 with SMTP id 5b1f17b1804b1-43db62b5d7emr131469375e9.29.1743585019725;
        Wed, 02 Apr 2025 02:10:19 -0700 (PDT)
Received: from localhost.localdomain (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb613aabesm14292515e9.39.2025.04.02.02.10.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 02:10:19 -0700 (PDT)
From: Andrew Cooper <andrew.cooper3@citrix.com>
To: LKML <linux-kernel@vger.kernel.org>
Cc: Andrew Cooper <andrew.cooper3@citrix.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>
Subject: x86/idle: Remove barriers for X86_BUG_CLFLUSH_MONITOR
Date: Wed,  2 Apr 2025 10:10:17 +0100
Message-Id: <20250402091017.1249019-1-andrew.cooper3@citrix.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH
workaround, add barriers") adds barriers, justified with:

  ... and add memory barriers around it since the documentation is explicit
  that CLFLUSH is only ordered with respect to MFENCE.

The SDM currently states:

  Executions of the CLFLUSH instruction are ordered with respect to each
  other and with respect to writes, locked read-modify-write instructions,
  and fence instructions[1].

With footnote 1 reading:

  Earlier versions of this manual specified that executions of the CLFLUSH
  instruction were ordered only by the MFENCE instruction.  All processors
  implementing the CLFLUSH instruction also order it relative to the other
  operations enumerated above.

i.e. The SDM was incorrect at the time, and barriers should not have been
inserted.  Double checking the original AAI65 errata (not available from
intel.com any more) shows no mention of barriers either.

Additionally, drop the static_cpu_has_bug() and use a plain alternative.
The workaround is a single instruction, with identical address setup to the
MONITOR instruction.

Link: https://web.archive.org/web/20090219054841/http://download.intel.com/design/xeon/specupdt/32033601.pdf
Fixes: 7e98b7192046 ("x86, idle: Use static_cpu_has() for CLFLUSH workaround, add barriers")
Signed-off-by: Andrew Cooper <andrew.cooper3@citrix.com>
---
CC: Thomas Gleixner <tglx@linutronix.de>
CC: Ingo Molnar <mingo@redhat.com>
CC: Borislav Petkov <bp@alien8.de>
CC: Dave Hansen <dave.hansen@linux.intel.com>
CC: x86@kernel.org
CC: "H. Peter Anvin" <hpa@zytor.com>
CC: linux-kernel@vger.kernel.org

diff --git a/arch/x86/include/asm/mwait.h b/arch/x86/include/asm/mwait.h
index ce857ef54cf1..dff9e7d854ed 100644
--- a/arch/x86/include/asm/mwait.h
+++ b/arch/x86/include/asm/mwait.h
@@ -116,13 +116,11 @@ static __always_inline void __sti_mwait(unsigned long eax, unsigned long ecx)
 static __always_inline void mwait_idle_with_hints(unsigned long eax, unsigned long ecx)
 {
 	if (static_cpu_has_bug(X86_BUG_MONITOR) || !current_set_polling_and_test()) {
-		if (static_cpu_has_bug(X86_BUG_CLFLUSH_MONITOR)) {
-			mb();
-			clflush((void *)&current_thread_info()->flags);
-			mb();
-		}
+		const void *addr = &current_thread_info()->flags;
 
-		__monitor((void *)&current_thread_info()->flags, 0, 0);
+		alternative_input("", "clflush (%[addr])", X86_BUG_CLFLUSH_MONITOR,
+				  [addr] "a" (addr));
+		__monitor(addr, 0, 0);
 
 		if (!need_resched()) {
 			if (ecx & 1) {
