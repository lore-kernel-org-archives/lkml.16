Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86C0D27C842
	for <linux-kernel@vger.kernel.org>; Thu,  1 May 2025 22:55:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746140140; cv=none; b=YJYA0ADH6hIOtvAR1BSNIc5nBuCy74rqtBBUDferSXcMjin3ulYo9qDgvQiEgjSaak4rjT0oMiRqgX2LjSczubpnqIolXSKPll/6uG1Q273tyrlMdRBeaTUCCipWBhUt2h9zfkvLWogCdtWSDYxboNoznE/8cNhKg+A/wQMRNRs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746140140; c=relaxed/simple;
	bh=6CEelcqc7Be/Y9b2UjlHA3na6nY4HZwgqtUvYQYDtKo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=RzKafCm9g9STARUQG+QxH8KJqRqnXxDscIIZiry8wZba+EVQUvwzSgnNQ02UsjM4IwBRiQ1EwHGiS3Jcc8M6d3TVmRTeeXXZdKYYgTd/XLnHp3Xzz8xQFsw7jo0ifGuQxHKu0F/ZC5yIz2tfND3mz3/LcXtH6VImb09ArG67L/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A5RM8FDl; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--changyuanl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A5RM8FDl"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-2254e500a73so9748805ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 01 May 2025 15:55:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746140135; x=1746744935; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VphvviRpGC2WLkYAjqaiyvIFs0ocuEHMIPdUSqAExnk=;
        b=A5RM8FDl+nKqfru7yReozhz/uubVGexmO4Rov958BxdhagnKWgWRCACnKB+xqHdKIX
         JlzaDsZPGrVNh8uaQZ/AvVDGdZ6ziPVYnxgJqT0QH7GVHnwk7nJ2kqM/F5U3qEACOBW6
         K+jRmVwxlJNSw+1LE3st9Nt+L0b7oqhQfwtXGiW5RXwb5nCjqO/hZIEx1/sJzQgVhXLx
         EInpALKRAuOWA/Bzd108o+Dw0SqXMt8semtrUFHUlNWN3Kav9Wk2Cq0Se4v7cbHqGB7A
         wrdI3wUben7D+JlHPrgvTI+lWXMfl652Aqtv1gT8OO3j6vG8dU97EH+MtzSsh/rp1ESH
         +4ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746140135; x=1746744935;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VphvviRpGC2WLkYAjqaiyvIFs0ocuEHMIPdUSqAExnk=;
        b=JZqc6LFQF3rJnQNNjo8oedNzDtxz/jq8m4EizG1eMYZGBWX+TnkctvNOFMLFAhBMhO
         67RHY4PFKHGGV8T03V7U70QoYppsaYUXjDyqsMmt2oHvT3h3Q/jkZmyBYK6RHZ0MqDpJ
         QBBjxaCkxFZEPzYzC1RP2qI2jz77WW5x+JPKAepbfucwudvTCgzAfAFEcXe5FoeC1SFW
         W6xFjJ+zOLmCoiqTqpTBhabmr02XQ2gAHV9IKc/g8htxHNFk3O5bJws/38v5ELMy9f4l
         uZew8v1+BYfnHsNQJMcehzwW4DkDtKDWC418nhNZfQpixi0ZYeuA/MLkcXz8sz2FIrHx
         MFJw==
X-Gm-Message-State: AOJu0YzSM5Ufo16nHKLIkjui4c0ZGhALsPqkrgDdNLYBcWjWCnZGnzq3
	UdHGPWflAHyQVf/SCrqaMlIL8zIUb99lmFpja3P+tqzxD51n0ox+eG5W+27i/twztVbxaonYG+d
	aGJ5k2uJ8burjGFfak+NGKWv/pbFNkH0kMBKNkFbB79UPGIx/va4axeNBWYp4xtOv1AvObTY0hD
	xDp+1RdKbOfTppIcRtWy0WtfdLFon57ctK3eLOV9AQwlhqi+rtvWLclCSdTAWTQQ==
X-Google-Smtp-Source: AGHT+IEUBELohUIuBjZuX1t4KvZ63Sn972imtSEYrAK4n9xeHQS/vygxbNUhLnD35SKxrJi1vU9ISpeHFRO3BtsZ
X-Received: from plou8.prod.google.com ([2002:a17:903:1ae8:b0:220:da6b:5d08])
 (user=changyuanl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:1ab0:b0:224:24d3:60f4 with SMTP id d9443c01a7336-22e102d05f6mr12139545ad.15.1746140134934;
 Thu, 01 May 2025 15:55:34 -0700 (PDT)
Date: Thu,  1 May 2025 15:54:20 -0700
In-Reply-To: <20250501225425.635167-1-changyuanl@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250501225425.635167-1-changyuanl@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250501225425.635167-14-changyuanl@google.com>
Subject: [PATCH v7 13/18] x86/e820: temporarily enable KHO scratch for memory
 below 1M
From: Changyuan Lyu <changyuanl@google.com>
To: linux-kernel@vger.kernel.org
Cc: changyuanl@google.com, akpm@linux-foundation.org, 
	anthony.yznaga@oracle.com, arnd@arndb.de, ashish.kalra@amd.com, 
	benh@kernel.crashing.org, bp@alien8.de, catalin.marinas@arm.com, 
	corbet@lwn.net, dave.hansen@linux.intel.com, devicetree@vger.kernel.org, 
	dwmw2@infradead.org, ebiederm@xmission.com, graf@amazon.com, hpa@zytor.com, 
	jgowans@amazon.com, kexec@lists.infradead.org, krzk@kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, luto@kernel.org, mark.rutland@arm.com, mingo@redhat.com, 
	pasha.tatashin@soleen.com, pbonzini@redhat.com, peterz@infradead.org, 
	ptyadav@amazon.de, robh@kernel.org, rostedt@goodmis.org, rppt@kernel.org, 
	saravanak@google.com, skinsburskii@linux.microsoft.com, tglx@linutronix.de, 
	thomas.lendacky@amd.com, will@kernel.org, x86@kernel.org
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
2.49.0.906.g1f30a19c02-goog

