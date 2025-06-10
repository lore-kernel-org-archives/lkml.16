Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1642D2FE4
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 22:58:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749596317; cv=none; b=hwCPO9sgRje3EsOKYPNzmP7fc2xPySd8SYivorZ4wMMKmZ+9efvIY0+fEKBTL2Qv9BbjWGadId0yrqPK4PQKnIfloOSBTzGqgyYlwTefuicoulVkoYftfD5ItuvFhQRquSXbPlZfzzXHzzECDBDYIK6prVmJvl1JWa7fW54S6nQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749596317; c=relaxed/simple;
	bh=DWYkexeKvSu7I+q/pf14+u2gmgqyLF3ul0cydoTKzVc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Nct2hw4twGYQKTFtWwVR3Qd8tsktZ+tM0u6ameekMlWjiI9QYIkCATSyjb/nQ/q9hp76WMFJxLYPxeewBDrPmrzXnacZEGfa1sFqr6ZltBEdMUHzyzuS4zHyI7xTRW3pDFKZfHFDwtcVuPpBiA5GJYWZUhAbeac7u9zL70xXZyI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=gEjK2GZ7; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="gEjK2GZ7"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-235f77f86f6so40080285ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749596315; x=1750201115; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=3MRV7X/T/wn0+SAUz4kSzbvtBEQulMMmWQ/PWJl9FfE=;
        b=gEjK2GZ7FBCVu4Z4r3wGgZgBvV67vph5bp9yZvmxwKIPHHr5fNKROr13ZOKsyL3XYO
         OUiUHurP604rAfTmviJIvJGvfWZvzkUXugngaS3q1qKdZeKEPvx584pdqyZwy7FZyzeR
         BhDZCH9eB6V0oll/lUL2fybq59IwHJkReMMldWVBK6F6hbZ4noFGIhRUw10bA5eAwddJ
         8YXNuEGmCfG5jxiPxTPJbV5XydZ7J1hl3F2zjfEqkazSQ1TPHGJSbiH4RQRQGpi+RHip
         gl6ylBQcrwdJsY+wXw4XMtdS1eSeA/dU6adwF1KppkHLovsqgIN24XSvtaBu/DCuXF87
         3i3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749596315; x=1750201115;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3MRV7X/T/wn0+SAUz4kSzbvtBEQulMMmWQ/PWJl9FfE=;
        b=TR5rgqXi70Q/o8NRbbJ9x+Vgdanc4Kh+oM2Yp3Z2EBOhJBqcIzvW0qDyNq70rsEhPC
         OFKxhiTNwjOtK5nFgK9I+W5rtUT64eKTLWO6/pMBnOj+65hbCQY51uJlmAitk93kZrl7
         jNli+GRK4Ui7k4TaSJPQoePBQGQO5+rPhHXB34IOaUX60PjdvqssWbqDfJ+Fz4BGleqt
         yJB8ObekZmlfi/jnPBvGLfdMezTqWh1svl2Th67i70DpHsN0J6hMUi0ExncPwa0yxfPx
         z8h2m3Er54a4WqeCJgXBUe5SiE9BLixiF5KyJVDiSTBDmQvEn+TiwpuhmXPgnf5kZkmS
         rykg==
X-Forwarded-Encrypted: i=1; AJvYcCX3TMvZEGc+s5iXuC5XUYcvKIFXakqnBf4meNjwz3Pmhn3h3JO4mnoK+y7gsZgWCfsWJ5mePkQPm+7WRpw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxmPLr7EHKjCLQ/vBPM7oijNrz4QXPO9Qz6gBDgeDgA2g9UYtqB
	WNQqryLuyBmLcQKXwI7DPeyn4dhvK4VVM2CxukBSK/6hNc/+fTHGmGqMyLALYfct2dM+O61oFE9
	9bZArvw==
X-Google-Smtp-Source: AGHT+IGiTLrz803hh++30xy8fSjN6gixKMJv7/AiyKAlh/XmQx+ffUbEPds8P01hoGQ+qsG4Qote79BJ1DE=
X-Received: from pldg6.prod.google.com ([2002:a17:903:3a86:b0:235:6d5:688b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:902:ecc1:b0:234:ed31:fc98
 with SMTP id d9443c01a7336-23641b14d61mr11802615ad.37.1749596315046; Tue, 10
 Jun 2025 15:58:35 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 10 Jun 2025 15:57:37 -0700
In-Reply-To: <20250610225737.156318-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250610225737.156318-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.rc0.642.g800a2b2222-goog
Message-ID: <20250610225737.156318-33-seanjc@google.com>
Subject: [PATCH v2 32/32] KVM: selftests: Verify KVM disable interception (for
 userspace) on filter change
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Chao Gao <chao.gao@intel.com>, Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>, Francesco Lavra <francescolavra.fl@gmail.com>, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

Re-read MSR_{FS,GS}_BASE after restoring the "allow everything" userspace
MSR filter to verify that KVM stops forwarding exits to userspace.  This
can also be used in conjunction with manual verification (e.g. printk) to
ensure KVM is correctly updating the MSR bitmaps consumed by hardware.

Tested-by: Dapeng Mi <dapeng1.mi@linux.intel.com>
Tested-by: Manali Shukla <Manali.Shukla@amd.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
index 32b2794b78fe..8463a9956410 100644
--- a/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
+++ b/tools/testing/selftests/kvm/x86/userspace_msr_exit_test.c
@@ -343,6 +343,12 @@ static void guest_code_permission_bitmap(void)
 	data = test_rdmsr(MSR_GS_BASE);
 	GUEST_ASSERT(data == MSR_GS_BASE);
 
+	/* Access the MSRs again to ensure KVM has disabled interception.*/
+	data = test_rdmsr(MSR_FS_BASE);
+	GUEST_ASSERT(data != MSR_FS_BASE);
+	data = test_rdmsr(MSR_GS_BASE);
+	GUEST_ASSERT(data != MSR_GS_BASE);
+
 	GUEST_DONE();
 }
 
@@ -682,6 +688,8 @@ KVM_ONE_VCPU_TEST(user_msr, msr_permission_bitmap, guest_code_permission_bitmap)
 		    "Expected ucall state to be UCALL_SYNC.");
 	vm_ioctl(vm, KVM_X86_SET_MSR_FILTER, &filter_gs);
 	run_guest_then_process_rdmsr(vcpu, MSR_GS_BASE);
+
+	vm_ioctl(vm, KVM_X86_SET_MSR_FILTER, &filter_allow);
 	run_guest_then_process_ucall_done(vcpu);
 }
 
-- 
2.50.0.rc0.642.g800a2b2222-goog

