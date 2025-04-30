Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08E01265CC4
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:27:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746030455; cv=none; b=gUfcXNBxRU23SXcjc+0Kd9MQ95LkCqchRzU1eA1TD5TWHlW/hMaPCP0lJV+1Ynp5zTrBB6E9Wzzx73MlggRqyfRg8XDY6eIGi/LY+7nh3+eY39JrQurKkU1i4/kZFNrf6C6EKoJA7054H/JkYiua//HVFhsL7ewmgFKGeI8z/3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746030455; c=relaxed/simple;
	bh=64gtqcGZ8wcy6/ozndo3lRwaVc9zcMKebNzxQK1wlWk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Z8dnQ3IZEr26Z9ylIgJ+J6vAdl6ktav+pqJdRqtKsme2TFS5XxCzPW8e+n05oydAi/3rFUEAiMRLFN/zfWZSKB7LvqHfeHTOtkUPUl4zhVRX+6JMpMYDmzfyAONTZPNCYpN4VFc9hx2yvp0nkIVw9uRs0416PnZcpbeCJ+kDpuA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y3nBgKPJ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--smostafa.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y3nBgKPJ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3912fc9861cso2235761f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746030452; x=1746635252; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=;
        b=y3nBgKPJhRIKLEh3t0hfUcliA8mfBdv9LEUtXQIWRhRfnBY5EHHNmTYXkYWSFjtxoU
         QQS4PYNUlVOQShV9s74e26kg01m0b7hUqKYJzySyL7+oce23Rpzg/ObOuIJzHAO5zUwP
         TnD3GuyDLwSSTUq5zeldd/Kgp2yRFCLxPC59XAg5cTxjdjxQdS07NhJAdJVisZyg9rol
         NYSGBqfomHCb8DiGQ5BqIrrMYYQ5UY78izesZlMFLr4NTuTcXU38jQ33V9XcvJuLZiG3
         XzDA1M3UN5G0CV3j7cg11K+LhUT5CtsvhrDeYrD5y0hHEibI1DY93cKzL6mVk+MiNMjl
         ufYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746030452; x=1746635252;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZqTf0w984hWi5llfvtlyawmZ56xQei2ohDzGa9Ujg2A=;
        b=jGf19rPgV0XXTpyRcH/n+GGIWeVrtNTIZIOk2Pi83UEp5BYhqZzLgQHhVjJbN/iqyi
         Z/R9OrJBRkW95cAxmp94z6cKQacRkGQBZZKHeCzHEMWagVX0sKDyaoXFSlG8yt1fUuDB
         b7J0SKAmU0snXqRv4/j/Ze8ZBXw3Z8FoRLjfOOlT4PxvY7gBC4ifwX0Xd40h62iuVO31
         coJ/YXjLHWLg+CnmIOaUwqZAr/5TbTa2pgwYDcABk8wgZzAtpXA8srvyjnnHMNBL3yv8
         uRWnpJIeZ76Dab9juzoqS5tLCzYS4nMGpc1MIbexrv9Esjdixxd0zzx+uojTxxilPfuy
         JFyQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVsbnE8X+/oDh5qeIqAzaB3JMnS6zA70OHoLF9gNKz0yXDCH97pUjjVQ92J91873Izth4qOyEe4Vcywv8=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywd0/5/TN0w14geXM48w0ILrEVOqqwkszvL1nX8JSG+2Qbm8BZI
	jRe2zreqygHedtm2nuRTNDumwJn0FbwzbVCBxSp6pRTHtCCgHfyzCBsIG7/T1440VKqouPCjHg0
	kR+5thmMA4g==
X-Google-Smtp-Source: AGHT+IElx2K4Ydzexiq6oj60bHV5vV1dfYGpgIOCHldmU1tuiZbYiGFH3YyV8uq6opoqtz/pcuka5AJ5zvQ7LQ==
X-Received: from wrp29.prod.google.com ([2002:a05:6000:41fd:b0:399:71d8:5e84])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5f4e:0:b0:3a0:8712:5983 with SMTP id ffacd0b85a97d-3a08f7d1a1bmr3354676f8f.51.1746030452526;
 Wed, 30 Apr 2025 09:27:32 -0700 (PDT)
Date: Wed, 30 Apr 2025 16:27:11 +0000
In-Reply-To: <20250430162713.1997569-1-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430162713.1997569-1-smostafa@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250430162713.1997569-5-smostafa@google.com>
Subject: [PATCH v2 4/4] KVM: arm64: Handle UBSAN faults
From: Mostafa Saleh <smostafa@google.com>
To: kvmarm@lists.linux.dev, kasan-dev@googlegroups.com, 
	linux-hardening@vger.kernel.org, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Cc: will@kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	broonie@kernel.org, catalin.marinas@arm.com, tglx@linutronix.de, 
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, x86@kernel.org, 
	hpa@zytor.com, kees@kernel.org, elver@google.com, andreyknvl@gmail.com, 
	ryabinin.a.a@gmail.com, akpm@linux-foundation.org, yuzenghui@huawei.com, 
	suzuki.poulose@arm.com, joey.gouly@arm.com, masahiroy@kernel.org, 
	nathan@kernel.org, nicolas.schier@linux.dev, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"

As now UBSAN can be enabled, handle brk64 exits from UBSAN.
Re-use the decoding code from the kernel, and panic with
UBSAN message.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/handle_exit.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/kvm/handle_exit.c b/arch/arm64/kvm/handle_exit.c
index b73dc26bc44b..5c49540883e3 100644
--- a/arch/arm64/kvm/handle_exit.c
+++ b/arch/arm64/kvm/handle_exit.c
@@ -10,6 +10,7 @@
 
 #include <linux/kvm.h>
 #include <linux/kvm_host.h>
+#include <linux/ubsan.h>
 
 #include <asm/esr.h>
 #include <asm/exception.h>
@@ -474,6 +475,11 @@ void __noreturn __cold nvhe_hyp_panic_handler(u64 esr, u64 spsr,
 			print_nvhe_hyp_panic("BUG", panic_addr);
 	} else if (IS_ENABLED(CONFIG_CFI_CLANG) && esr_is_cfi_brk(esr)) {
 		kvm_nvhe_report_cfi_failure(panic_addr);
+	} else if (IS_ENABLED(CONFIG_UBSAN_KVM_EL2) &&
+		   ESR_ELx_EC(esr) == ESR_ELx_EC_BRK64 &&
+		   esr_is_ubsan_brk(esr)) {
+		print_nvhe_hyp_panic(report_ubsan_failure(esr & UBSAN_BRK_MASK),
+				     panic_addr);
 	} else {
 		print_nvhe_hyp_panic("panic", panic_addr);
 	}
-- 
2.49.0.967.g6a0df3ecc3-goog

