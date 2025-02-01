Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84C9F1C07ED
	for <linux-kernel@vger.kernel.org>; Sat,  1 Feb 2025 02:17:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738376275; cv=none; b=JXpiyJobW+KJVvs0uVmOt6iVILTC/dEsPfg/qhcs32dVmLN7rS9xZXRPAOMG+Mn8Hy5qXM5yghhz7y2ndF0ZB0S6c1paOESQ3cm4imrOIPN7CHF2vmU1U3iBpnaFa7Zw1cZVWF4w2k0jZc8DAO+L74m4dtVGStErRqc/L/ioyng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738376275; c=relaxed/simple;
	bh=OViTJZ+XBu7MgZ7inPoS/83nOvRpwHQF3rmoy13X/Q4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mfUeZJ8ylyLcwmurh6lfvJ6R8LR3v/V2IhlFTHOAIby3fvPkehIulddFrO9BbYy1jg0YlpyBcBD0SB0B23kNPA/KGxOyrrRrXp2kiw2tcHBGTaN7Z843e9fqSrEQ5uhVSdyGhdYpnRIWxrBMCkvM4wsXs3WPMeBSDagkRfVdwog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xLZck8sR; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xLZck8sR"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2f780a3d6e5so5221238a91.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 18:17:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738376272; x=1738981072; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=H8aoO3CAJ0dqDpElLUQaiYDlNJUSBbklsVcflcMYifM=;
        b=xLZck8sRCsh6ZzrmWOmjuk8Hv78zyuo0OOxOs2Hfusk5JnezTviP4BJBhZanyHrIzT
         nce3DJP5stu0uOgPy+pqp9EA/4AKr92j0GWQBnhmX3C1l+KwwgDNqTD9LaPyTpeYARpN
         A9c6pqT28q9cV2tBuqa9s6y4ytSkWGfwsPYCiqZyEk/+O5TdwZuPqzBioJqXHIv5CGAv
         8bURPC99UeSpwcj61g51IVOp5GNBGWizao0RoVSeB03/qy5WwNZDT9TXMKZGDlr2qAvV
         67QJ+8pa6A1RXgCJO3beZ9wnS10FqNApSBj+G5WP0ismTgeDYKXNbgmvFloaX2D74Jju
         p47w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738376272; x=1738981072;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H8aoO3CAJ0dqDpElLUQaiYDlNJUSBbklsVcflcMYifM=;
        b=Ux2wEUvlX3RHuzdUMY87zJXMdnmPz/VRzN0/2F4Vuu5XOA9wtWzGCHa/iXyfekBitF
         QcaeN9LBlabFS8Njd8HABPMTlXeXxDTO283Z3tty7XLP4RPLAERtQ0zN6DvBd/sdOEVs
         066sjJtZ/d29IilvuT+ugfzf74eH0HEKiGEvZCxdjRQgJ5zOHee0iw6eNw/tDCaPXizd
         ROlw0l/LqBFGGInYgTjWRMJjwcpwhhuG02Vh4Pzo+qaxx9iKBEPVj8Uz2P76lAtsE4sa
         sRnk26XdcheIATf1tPlUP3r5aGDcMgp/eAiE6jiaNpCdaNdGjfYdB0mrUah3U+wT/fGw
         t95g==
X-Gm-Message-State: AOJu0Yz37H9hKYP5R4eLDDXK8uPr5lq7V31gtgxERB/uBui85ZraYT6n
	UHDlZxcv9aGdvhwxtLL/3zpymW848w00vMLcFq4JpZtOC06qfElId9o3PNT3oeJdxLGaCDUZcPg
	aJA==
X-Google-Smtp-Source: AGHT+IFlM5iy+/YhDLhDvbxJ2kgMrd1qTg/6Z4sP06sibC0sgnf3CqMto9NWjotO4O8YEuu2B+OhUgsrUhU=
X-Received: from pjbsw14.prod.google.com ([2002:a17:90b:2c8e:b0:2f7:d453:e587])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:3d45:b0:2ee:8358:385
 with SMTP id 98e67ed59e1d1-2f83abb34bfmr19091952a91.4.1738376271854; Fri, 31
 Jan 2025 18:17:51 -0800 (PST)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 31 Jan 2025 18:17:16 -0800
In-Reply-To: <20250201021718.699411-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250201021718.699411-1-seanjc@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250201021718.699411-15-seanjc@google.com>
Subject: [PATCH 14/16] x86/kvmclock: Get TSC frequency from CPUID when its available
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

When kvmclock and CPUID.0x15 are both present, use the TSC frequency from
CPUID.0x15 instead of kvmclock's frequency.  Barring a misconfigured
setup, both sources should provide the same frequency, CPUID.0x15 is
arguably a better source when using the TSC over kvmclock, and most
importantly, using CPUID.0x15 will allow stuffing the local APIC timer
frequency based on the core crystal frequency, i.e. will allow skipping
APIC timer calibration.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 arch/x86/kernel/kvmclock.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/arch/x86/kernel/kvmclock.c b/arch/x86/kernel/kvmclock.c
index 66e53b15dd1d..0ec867807b84 100644
--- a/arch/x86/kernel/kvmclock.c
+++ b/arch/x86/kernel/kvmclock.c
@@ -102,6 +102,16 @@ static inline void kvm_sched_clock_init(bool stable)
 		sizeof(((struct pvclock_vcpu_time_info *)NULL)->system_time));
 }
 
+static unsigned long kvm_get_tsc_khz(void)
+{
+	unsigned int __tsc_khz, crystal_khz;
+
+	if (!cpuid_get_tsc_freq(&__tsc_khz, &crystal_khz))
+		return __tsc_khz;
+
+	return pvclock_tsc_khz(this_cpu_pvti());
+}
+
 static unsigned long kvm_get_cpu_khz(void)
 {
 	unsigned int cpu_khz;
@@ -125,11 +135,6 @@ static unsigned long kvm_get_cpu_khz(void)
  * poll of guests can be running and trouble each other. So we preset
  * lpj here
  */
-static unsigned long kvm_get_tsc_khz(void)
-{
-	return pvclock_tsc_khz(this_cpu_pvti());
-}
-
 static void __init kvm_get_preset_lpj(void)
 {
 	unsigned long khz;
-- 
2.48.1.362.g079036d154-goog

