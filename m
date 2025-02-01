Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21BE71C3BF9
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:17:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376276; cv=none; b=Fimj80mdDnedegmFW/qsIrFpJFVAWR5/wSXoQKVKucp97FyGkl5xxfhD6zQrk2HpVRXMoctkbSOY/qreRpEuehA28a9JDI0Zyq4LzjbAYZ02Px5wRfhma6PxBframMIYWSUr7Brra31MKZP1VStH9a+IwHQg85WS7t+FxtcRuWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376276; c=relaxed/simple;
	bh=MHFjgcDixq+MEkE5s8mB+CTWIGx9I1EGKDIGAXqaNs4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Wm9g5/srGPDYAT/Dx+3KN0xROuHDv0fzAzrK+1+Y06Yz/2JYcy9x2c7OpYhhBlW2RxJS0bpKygmRysWLnKmjWT7gF6ZMeUCxSm3bcKOg0IBo8cd9xsJenHJdS1Y4BM0tqPqjprp0QJpDjvtSoG0yFvkE4ymrZfc/SrGKaMdYDJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=O5aMMLDS; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="O5aMMLDS"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-2efc3292021so7281613a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376273; x=1738981073; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MLts4lXwUIqNNu2uIA1UT+VV0O42NNK5wDATllLGuXo=;
        b=O5aMMLDSt8Kfql33/NVAoPicJA/J/uSh633yPyj0gx6E3+cXpQ3rtUEAVmtWbKueJZ
         +CKvLUoADHco7b7WZs0ISKAewa8jJ3vHUjN88Z3dkgVbHkaVGVT3f8UOGrpb0z8temPH
         WCTo9ldY9eIqo2jEEwpbiUz5E+qQT2P5M2tUMKGm1kqAnWFiGvrcXMt8hs9mPuofuRIP
         6BrrGFU6yzworAKIvmJVIGdmsU/MAwfe1TDnR7VpO+ZHkD1KFXsbyBY77sb85wu9G6Dq
         m0cZNHNGqfU8GKi76PtGW/pCkYMVQ2VxUEOuTqEIPzFjymmaknjkj8WJ7JhRhkna3p75
         pT4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376273; x=1738981073;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:reply-to:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=MLts4lXwUIqNNu2uIA1UT+VV0O42NNK5wDATllLGuXo=;
        b=k6nJ/2wtAFGHZJqulFBWrl41caNRYolxX8K26ZRMo64pgne8kla1W0bmoN6D2orNrW
         A+jI+SysImDl0KNjAFgxtSfNbq91ST7L73cfahgSroY/wfFerx1z0E3AkkHLNIt1PF69
         5B6TKouC8wzT3vllbH+KdRwZc5H0inzRHOTHMHkwXj3s1NeOJRoY8FazmMQVtGIpBCAn
         JubbcPwTyLu2P6PTaIzgolrYBafcAJNQiJ2UJxnxMdFP9H0oHYXxJGlukyob6LL4DAvZ
         NgeZWVR/qFImz2hm72dnuDtnl5OnOwmGveH10vX7DymckfNIwY4KeAj+vHSXpql6Jnef
         pCVA==
X-Gm-Message-State: AOJu0YygoWwO13uo71ZegaGtLypX4iW1YoQkqM+st3zWyO+budKESi8N
	6JWwB2RaQArEvHtKKjye7vXRfyN7brV3x/1fpA7tzdSmgk63KlAdQbzOEzwoIKpd2dygICgpQKD
	ShA==
X-Google-Smtp-Source: AGHT+IFZkSSDE4sQNSYE1P+oxZtfHJOA6RLwDBSraCmTI0kfGCTz9b39MqhkWv/tuyQdm2uggkOJw5pWH7U=
X-Received: from pjbfr16.prod.google.com ([2002:a17:90a:e2d0:b0:2ea:5c73:542c])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:53c4:b0:2ee:d63f:d77
 with SMTP id 98e67ed59e1d1-2f83abd7ccfmr20755900a91.9.1738376273601; Fri, 31
 Jan 2025 18:17:53 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:17 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-16-seanjc@google.com>
Subject: [PATCH 15/16] x86/kvmclock: Stuff local APIC bus period when core
 crystal freq comes from CPUID
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
Content-Transfer-Encoding: quoted-printable

When running as a KVM guest with kvmclock support enabled, stuff the APIC
timer period/frequency with the core crystal frequency from CPUID.0x15 (if
CPUID.0x15 is provided).  KVM's ABI adheres to Intel's SDM, which states
that the APIC timer runs at the core crystal frequency when said frequency
is enumerated via CPUID.0x15.

  The APIC timer frequency will be the processor=E2=80=99s bus clock or cor=
e
  crystal clock frequency (when TSC/core crystal clock ratio is enumerated
  in CPUID leaf 0x15).

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 0ec867807b84..9d05d070fe25 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -106,8 +106,18 @@ static unsigned long kvm_get_tsc_khz(void)
 {
 	unsigned int __tsc_khz, crystal_khz;
=20
-	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz))
+	/*
+	 * Prefer CPUID over kvmclock when possible, as CPUID also includes the
+	 * core crystal frequency, i.e. the APIC timer frequency.  When the core
+	 * crystal frequency is enumerated in CPUID.0x15, KVM's ABI is that the
+	 * (virtual) APIC BUS runs at the same frequency.
+	 */
+	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz)) {
+#ifdef CONFIG_X86_LOCAL_APIC
+		lapic_timer_period =3D crystal_khz * 1000 / HZ;
+#endif
 		return __tsc_khz;
+	}
=20
 	return pvclock_tsc_khz(this_cpu_pvti());
 }
--=20
2.48.1.362.g079036d154-goog

