Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A43275850
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 07:47:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746776839; cv=none; b=puGNlYtw5B72PgYjfU1FDRpvOEpmc/Lx2S/O7WcCjbCJdZ912nkj0JHVkaX+WsxVJm4dR86kt0AxeHWHtuiMGdDB5BsOqWtmzZArbqriX53gkYrBrF5tBs0Lji+ogyFi2uCGXPnhbSbc3NgEnR+tdxkIJtAW/IXt6A6AgSq4PCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746776839; c=relaxed/simple;
	bh=Z84jYmwZhLXEt0r4O0K8zDoo896G+vtguPEMdYlShqU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tZD8www3kFfsN2ySLPSSXWfISwKzBq8J/uCtbWWklXax96i7OqtaJT63elq6+bToTI6xh8OpRXVJyEJBD+9HNM6wvFZQ8fT/fnnSjzMvXeUmxn3tnKnXdC+J+nWAKk6aCg+GFwW4A4YBrqgLiGCb0aGkkT+FwADVEooYwbnsXCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DbB4sKf0; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DbB4sKf0"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-22c35bafdbdso30267605ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 00:47:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746776837; x=1747381637; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=+m4Z3dP+tM6YZb4FwYg8AZfxdm/iv45+PxfK9MWhRlE=;
        b=DbB4sKf0qIvUvklNapjm2TSnncUag+NfceL7y1uF5Mh5wI5MgSr3LPnDUmOxAqsZ7o
         jId/J2CqqmuzzWR1YnPNM0dlfHrIhZFhjB4DSTh3nSH217cEmFm18UBYqzPUl1VVAUjs
         2IUzljGylAjOjJYIkxcBPxSVUvbmLLYW81E4oZ2dZp/j6zAvxqmdH0UQRindcp8/x0N8
         e8fxOLqOIMcGnwF5AcUU3Z8wuMeiFGH+1ALSKJgoMzEwxDyNI+TFt02/144/ZCkAgZjT
         XtP8CogjfwqAG+IALtZR12ld3ymurkJj5SCmLSUXf1vnSONzcNgf4pSkaeyIuSc95Iwh
         3q+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746776837; x=1747381637;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+m4Z3dP+tM6YZb4FwYg8AZfxdm/iv45+PxfK9MWhRlE=;
        b=M24PsQh4758mApETJbvNU9LFWmYgwnpLPYTXjYVUSuTaDIVBCErDizfgdGQl1pUc+t
         OlkPckd1gfUWaSETemcw3nHX8Dqt/pPBj29W9yeohB39Z1eDVMxsbMcfIHMp7qKhw+Jv
         RoSeoR0P0iNMUPSmBPmV8cJ9ypvCfqZtPtfsH+tRn0OqMSLy6Zys5USeesjyin8VaL0x
         biqggYp6BKK5ogZkiaouBgnwq5ffeowssOpQ2q4wsBU5pKnI6MjU5uzpbF6joSedTGmJ
         i5pr+WjNYpvmY8Zoxh+QJFhU88pTU/90X3kWIeBpfFckgiixoqFG2IFb6Nb4NNHb02tV
         jbsQ==
X-Forwarded-Encrypted: i=1; AJvYcCWovYqI0E+ZlBXrs89Trtf5W1AHnLUHcVolO5qNtYS0NNmPnLZIoZxs62P1fYq1B4tNqh/IC4UYu6jPN3Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YynL6/IeY8yW2UbTU5SlhFKyljD93DNfvkzTsFxotzLJcBZbWzg
	aZXZEIPrSEo3sYLVWdDBVGxK9C366Xh8uFcMkQIlNXOnljnJx1WFPyNX8BxagFrcMiFQHhfrCKa
	4dK744gGNQCcAQW3uNw==
X-Google-Smtp-Source: AGHT+IHfR2VcOxe89TQQkgMURCMNF7WAQ9A5nVl3ln2Y/iICrUYXCipTIhMpc5lhLO0v/RkcE3tO5H+jCjQrIWm3
X-Received: from pljs4.prod.google.com ([2002:a17:903:3ba4:b0:21f:40e5:a651])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:18c:b0:21b:b3c9:38ff with SMTP id d9443c01a7336-22fc91a05e1mr34656295ad.37.1746776837245;
 Fri, 09 May 2025 00:47:17 -0700 (PDT)
Date: Fri,  9 May 2025 00:46:30 -0700
In-Reply-To: <20250509074635.3187114-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509074635.3187114-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509074635.3187114-13-changyuanl@google.com>
Subject: [PATCH v8 12/17] x86/e820: temporarily enable KHO scratch for memory
 below 1M
From: Changyuan Lyu <changyuanl@google.com>
To: akpm@linux-foundation.org, linux-kernel@vger.kernel.org
Cc: anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org, 
	Changyuan Lyu <changyuanl@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Alexander Graf <graf@amazon.com>

KHO kernels are special and use only scratch memory for memblock
allocations, but memory below 1M is ignored by kernel after early boot
and cannot be naturally marked as scratch.

To allow allocation of the real-mode trampoline and a few (if any) other
very early allocations from below 1M forcibly mark the memory below 1M
as scratch.

After real mode trampoline is allocated, clear that scratch marking.

Signed-off-by: Alexander Graf <graf@amazon.com>
Co-developed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
Co-developed-by: Changyuan Lyu <changyuanl@google.com>
Signed-off-by: Changyuan Lyu <changyuanl@google.com>
Acked-by: Dave Hansen <dave.hansen@linux.intel.com>
---
 arch/x86/kernel/e820.c   | 18 ++++++++++++++++++
 arch/x86/realmode/init.c |  2 ++
 2 files changed, 20 insertions(+)

diff --git a/arch/x86/kernel/e820.c b/arch/x86/kernel/e820.c
index 9920122018a0b..c3acbd26408ba 100644
--- a/arch/x86/kernel/e820.c
+++ b/arch/x86/kernel/e820.c
@@ -1299,6 +1299,24 @@ void __init e820__memblock_setup(void)
 		memblock_add(entry->addr, entry->size);
 	}
 
+	/*
+	 * At this point memblock is only allowed to allocate from memory
+	 * below 1M (aka ISA_END_ADDRESS) up until direct map is completely set
+	 * up in init_mem_mapping().
+	 *
+	 * KHO kernels are special and use only scratch memory for memblock
+	 * allocations, but memory below 1M is ignored by kernel after early
+	 * boot and cannot be naturally marked as scratch.
+	 *
+	 * To allow allocation of the real-mode trampoline and a few (if any)
+	 * other very early allocations from below 1M forcibly mark the memory
+	 * below 1M as scratch.
+	 *
+	 * After real mode trampoline is allocated, we clear that scratch
+	 * marking.
+	 */
+	memblock_mark_kho_scratch(0, SZ_1M);
+
 	/*
 	 * 32-bit systems are limited to 4BG of memory even with HIGHMEM and
 	 * to even less without it.
diff --git a/arch/x86/realmode/init.c b/arch/x86/realmode/init.c
index f9bc444a3064d..9b9f4534086d2 100644
--- a/arch/x86/realmode/init.c
+++ b/arch/x86/realmode/init.c
@@ -65,6 +65,8 @@ void __init reserve_real_mode(void)
 	 * setup_arch().
 	 */
 	memblock_reserve(0, SZ_1M);
+
+	memblock_clear_kho_scratch(0, SZ_1M);
 }
 
 static void __init sme_sev_setup_real_mode(struct trampoline_header *th)
-- 
2.49.0.1015.ga840276032-goog

