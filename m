Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91EBC2D3237
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 22:47:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749682050; cv=none; b=bMKGr+itSF9EBBirjwD03UF2TDIMnw4MtCRrVqGqKJ3oXlU4HoyX/2b+Y974qY4L0sO578Axnn3CefO/iO7+ltRPVnXy42lT7OnT5Ie7G60KLA4rcziRG0y3OBzzFjDjgsja7/6Bd0W/TJPCKuMILVGVtFAuclexbyiZuKH8ubc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749682050; c=relaxed/simple;
	bh=J6zOinbkdgKylugz+qVBm+Q6AqKeqc/V4kq3h/NovvU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hTy/ErH6yoeUQaX3eZ+0hz5KZ6LmJOUFPNKxUSiNCf/AzE5LYENrhST859PXTmEUfo+mAAQlC653NkX1QjyeGV66HZ5s0KDFrZSA7lOSek7QJmqcWzhLgM2pNv5j7XjAhQinA/hcg4qA3kYlA3VRgUW5Gpk0Vk1wsl0vkp1lvCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vdhp2R6N; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vdhp2R6N"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31171a736b2so437422a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 15:47:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749682047; x=1750286847; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=trIKCr3BKTnnj1sqkKg+yTyCPFnaZ4cJOVW948+vsJc=;
        b=vdhp2R6NpU0yGZ6XlW4fm6oMNxjjpRR+osrTo6k3LExLWC0bk73EEkkuSaIkf+9PMv
         v/FNBOje5/87qsL5BC+pRcxfsewdSBR3DHIGAt2NSra+eUpCYOFr7eHmKQZ9OXKM7Oir
         WK78V/IEch2EcWK+xjQUvAn7uLkCkl6ImKryfX4StepRP2OcTvBaAl59JF6yXxpQ+w2w
         ANyD/DxsW0OU26x8QfeEXeEWeuH3z6uYm+yy4MqPPneETExxLi3cAyxaA4fFK/8Dcyt2
         oU/WQ+PKIt61vV5cQamD7zeJD12wYMiaZ+FwADG/uUt/MdNy+psf6vtXYS3I1IOt+6qx
         XtfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749682047; x=1750286847;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=trIKCr3BKTnnj1sqkKg+yTyCPFnaZ4cJOVW948+vsJc=;
        b=sa0XR74P/p2qG5uOQe+yANqVkkLkiczjl0/HnYa520Ohfz3zxHWbHHHFkXmLlKMH7t
         34D7xJtxBfqktiKHqAOcOuMLak3+PXM7xSaNdP777H4rQr0+k6KMVnRHNr7/x6jKmetR
         oqWJEED3K4ayuznkkAU0LMZA2gvVHBSO7u0cwdJ3Sud7ARWddQmymG5vRuAhDG/FWucw
         JYmIQz2MLkPqyHq9L7l3PXoqTnmiNESdX3Kriy1MJRxpatr6+sq2ukhadPOWhuW+qEmA
         l1QafQecVeqjKrvoY4agZEe7HVMMxgN+/rVxbEin5RmocAxIX3rx+Ju5geRVw6UVFws0
         M1Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXgpBgb8fd+0uFHjaJtww7rSO9ce3DSTi1iYU9t4xA9cDQm9AAUTBkolmy4dObqw6V3zV0W2aLPCRrziqk=@vger.kernel.org
X-Gm-Message-State: AOJu0YySVV6mxMcxdiEYKBdkB3tUFDptJ2XuASudz1GBz42LB89Tkp5I
	2lJshqA1+iALuO8JJgRpndidWOlrvo+U3oyiDjnkAqSMEUYtW0KNK6rg458vIcl8CeGphdRUmK4
	WPNoWHw==
X-Google-Smtp-Source: AGHT+IF+r3WoBv41JnZ3zMdtBzjsIX3MU1bEitF46j7ZacLy0t9sYOOvunU4WNhpDLaXzfE8bRA/KcgnWWk=
X-Received: from pji7.prod.google.com ([2002:a17:90b:3fc7:b0:312:3b05:5f44])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3508:b0:312:eaea:afa1
 with SMTP id 98e67ed59e1d1-313c08cfd2emr946409a91.29.1749682047052; Wed, 11
 Jun 2025 15:47:27 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 11 Jun 2025 15:45:21 -0700
In-Reply-To: <20250611224604.313496-2-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250611224604.313496-2-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc1.591.g9c95f17f64-goog
Message-ID: <20250611224604.313496-20-seanjc@google.com>
Subject: [PATCH v3 18/62] KVM: SVM: Disable (x2)AVIC IPI virtualization if CPU
 has erratum #1235
From: Sean Christopherson <seanjc@google.com>
To: Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>, 
	Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>, Joerg Roedel <joro@8bytes.org>, 
	David Woodhouse <dwmw2@infradead.org>, Lu Baolu <baolu.lu@linux.intel.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	kvm@vger.kernel.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Sairaj Kodilkar <sarunkod@amd.com>, Vasant Hegde <vasant.hegde@amd.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Joao Martins <joao.m.martins@oracle.com>, 
	Francesco Lavra <francescolavra.fl@gmail.com>, David Matlack <dmatlack@google.com>
Content-Type: text/plain; charset="UTF-8"

From: Maxim Levitsky <mlevitsk@redhat.com>

Disable IPI virtualization on AMD Family 17h CPUs (Zen2 and Zen1), as
hardware doesn't reliably detect changes to the 'IsRunning' bit during ICR
write emulation, and might fail to VM-Exit on the sending vCPU, if
IsRunning was recently cleared.

The absence of the VM-Exit leads to KVM not waking (or triggering nested
VM-Exit) of the target vCPU(s) of the IPI, which can lead to hung vCPUs,
unbounded delays in L2 execution, etc.

To workaround the erratum, simply disable IPI virtualization, which
prevents KVM from setting IsRunning and thus eliminates the race where
hardware sees a stale IsRunning=1.  As a result, all ICR writes (except
when "Self" shorthand is used) will VM-Exit and therefore be correctly
emulated by KVM.

Disabling IPI virtualization does carry a performance penalty, but
benchmarkng shows that enabling AVIC without IPI virtualization is still
much better than not using AVIC at all, because AVIC still accelerates
posted interrupts and the receiving end of the IPIs.

Note, when virtualizaing Self-IPIs, the CPU skips reading the physical ID
table and updates the vIRR directly (because the vCPU is by definition
actively running), i.e. Self-IPI isn't susceptible to the erratum *and*
is still accelerated by hardware.

Signed-off-by: Maxim Levitsky <mlevitsk@redhat.com>
[sean: rebase, massage changelog, disallow user override]
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kvm/svm/avic.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/x86/kvm/svm/avic.c b/arch/x86/kvm/svm/avic.c
index 48c737e1200a..bf8b59556373 100644
--- a/arch/x86/kvm/svm/avic.c
+++ b/arch/x86/kvm/svm/avic.c
@@ -1187,6 +1187,14 @@ bool avic_hardware_setup(void)
 	if (x2avic_enabled)
 		pr_info("x2AVIC enabled\n");
 
+	/*
+	 * Disable IPI virtualization for AMD Family 17h CPUs (Zen1 and Zen2)
+	 * due to erratum 1235, which results in missed GA log events and thus
+	 * missed wake events for blocking vCPUs due to the CPU failing to see
+	 * a software update to clear IsRunning.
+	 */
+	enable_ipiv = enable_ipiv && boot_cpu_data.x86 != 0x17;
+
 	amd_iommu_register_ga_log_notifier(&avic_ga_log_notifier);
 
 	return true;
-- 
2.50.0.rc1.591.g9c95f17f64-goog

