Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A7AA13D502
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376261; cv=none; b=n31DREjmPtY2I+f78ENDet8mE0KZeG2k2Tjm0jF20XeElus85zY8+i5UDqU4Pm68/FQQ4orvjcxScSOcc9SJhLPTmQRMeAmZE1EqdAjXbLQd/AtSfoGKGfOjbQLjmHxB/M6GMwwGQXmKgBjjBkbq3CB8B0acLm+E2TR/RpoKYR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376261; c=relaxed/simple;
	bh=E6Iy1BiM9FEEtqnIX6/l7kPa8oyhyUi3aCV4SUPddsQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sWFdgMHMRDkP3W67+Z3nNT+07aLVCNWuTcWTtQei0yRDAQZJYw7uOMQDhROaI7Zkz/IAAolRqMYEkz1k/pvdpHASXb5rHPFpJ2ODjBdfn14g6uLOdRRoqjZrZVzwVtJB54o0Y87nlfFLhA4//SwuQiJ262ezM3umeeaAKcKrhnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Lc4rnG6D; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Lc4rnG6D"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2ee8ced572eso5247952a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:17:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376259; x=1738981059; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=IW8kJcAcrKvt4c0vMOL7jWV1OXPEd6lfnHsLFZy4QXA=;
        b=Lc4rnG6Dm6msGUFDJy1doz8yyGyZL+0sW/L70hr/9AcdgDF+5ljhpV2WFFPRn59xG2
         JMdnkczVc3HsnISv79/GB/CFVO+fAEtoxVlJpu+kZF/gVUeb07RsEQ8nNNZfBAYosltb
         ZjFcPv6ISf6yg71vzNJ8W8xp5kUwNuFdgsrZiZWdwexHES8U+Lriigo1NV6MKdS2hmn6
         jdNhdPLfKyBJtILm3vcJMJgtyQybH50lEl5sRn78WFp376vxMXH4j3Kk41GdU1i9xYoV
         Dm3HaUG2Ig/4PLg+3w8X+jSA5loW/lZxaUezO2K+TY0aPfhsC+4yI73UpQjUpt3SCxKG
         L42A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376259; x=1738981059;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IW8kJcAcrKvt4c0vMOL7jWV1OXPEd6lfnHsLFZy4QXA=;
        b=BNalMpYmknJ2iPxvsfOBm/oyD7VffWUqbhtCC42UNkKZ/DDyzZnTPRPXZ4c4ke2PXv
         ZdrD4zMN7hntwQLkZctNk4kyDaWDNitC7gen7k973PjNM84cb+Ty2FdfuhwO+trLfCK4
         rfR4wbPhMNTQxGX4Tma80w9RzK5diRL4GFoVmpArQJx89x5llkklnBaECoqkMrWh1kBm
         26rrS6MjzNBHDVYZutEZabdd+F+W7pcb6ORfXrw9BL/8QALLArH5krU+7BfTLC2ykqxV
         XJtURv/xjHV1JQAFe2HF9E3bxr0+eyqRLSbsLDL82tjuuk9ZL/RXS/5nR6ylxMOq+QPt
         ZzCw==
X-Gm-Message-State: AOJu0YxH6nDXZdiPqQrA67LILK3jnLuHvRLQvNyYWVJxhLzeYVIPgmfG
	LknqTZxZX4r0wyOmaBklb07rHRBEMWmbhd/xNe65rTsD/u9pPRa1bGGtdUKIeHQsHWMBIf4KT15
	pVA==
X-Google-Smtp-Source: AGHT+IF5rIJ4SRqkvzrTVMPpN2jn4obzhnrXzWmKwhKWojp8QTZ0kuVpAxPsfycQKPuD0sAxN2zkeFmWkds=
X-Received: from pjbsb15.prod.google.com ([2002:a17:90b:50cf:b0:2ef:701e:21c1])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3a08:b0:2ea:37b4:5373
 with SMTP id 98e67ed59e1d1-2f83abe2135mr21011714a91.10.1738376259599; Fri, 31
 Jan 2025 18:17:39 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:09 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-8-seanjc@google.com>
Subject: [PATCH 07/16] x86/acrn: Mark TSC frequency as known when using ACRN
 for calibration
From: Sean Christopherson <seanjc@google.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>, Juergen Gross <jgross@suse.com>, 
	"K. Y. Srinivasan" <kys@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>, 
	Dexuan Cui <decui@microsoft.com>, Ajay Kaher <ajay.kaher@broadcom.com>, 
	Alexey Makhalov <alexey.amakhalov@broadcom.com>, Jan Kiszka <jan.kiszka@siemens.com>, 
	Paolo Bonzini <pbonzini@redhat.com>, Andy Lutomirski <luto@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>
Cc: linux-kernel@vger.kernel.org, linux-coco@lists.linux.dev, 
	virtualization@lists.linux.dev, linux-hyperv@vger.kernel.org, 
	jailhouse-dev@googlegroups.com, kvm@vger.kernel.org, 
	xen-devel@lists.xenproject.org, Sean Christopherson <seanjc@google.com>, 
	Nikunj A Dadhania <nikunj@amd.com>, Tom Lendacky <thomas.lendacky@amd.com>
Content-Type: text/plain; charset="UTF-8"

Mark the TSC frequency as known when using ACRN's PV CPUID information.
Per commit 81a71f51b89e ("x86/acrn: Set up timekeeping") and common sense,
the TSC freq is explicitly provided by the hypervisor.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/cpu/acrn.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/x86/kernel/cpu/acrn.c b/arch/x86/kernel/cpu/acrn.c
index c1506cb87d8c..2da3de4d470e 100644
--- a/arch/x86/kernel/cpu/acrn.c
+++ b/arch/x86/kernel/cpu/acrn.c
@@ -29,6 +29,7 @@ static void __init acrn_init_platform(void)
 	/* Install system interrupt handler for ACRN hypervisor callback */
 	sysvec_install(HYPERVISOR_CALLBACK_VECTOR, sysvec_acrn_hv_callback);
 
+	setup_force_cpu_cap(X86_FEATURE_TSC_KNOWN_FREQ);
 	tsc_register_calibration_routines(acrn_get_tsc_khz,
 					  acrn_get_tsc_khz);
 }
-- 
2.48.1.362.g079036d154-goog

