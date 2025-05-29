Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 787F226B946
	for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 23:41:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748562067; cv=none; b=gxGeIGV6gVHH0gGcngJk3+BeGQnZ8PhK/ZcJZU2CZA1oZdoPIash6rsmrlJ9jxHnkt/6kBjvxmBI4R/qAL/ByjPugZv1q7R3TLciEjJC6xlNL448zGI8l4OY+ur9CWB6HUN5CMr0QVJ6lYh2WvUNlK7yFki/Mxnw7gjtPeNBZUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748562067; c=relaxed/simple;
	bh=oPSfAtIATZQ8+qjKJYNi2UiBRx/9GSId3SQECpQ3XcM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kYlxqlJl+3B7cF1yz3UG4oY0IWTpr0IokgmB+DZv4PURUyKc4dN+X/+wUCPkKfxsBOcMQnd8Y0NmKsTR5d8wzEiSATil/vpIrtNm7Zx3/ew3l0ypqSaHTCTuTKF1lPUn6aMKnSjnijphUX+6pgBoeha4knwkt8OyrgvLt6N9Uno=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sWtxPjhy; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sWtxPjhy"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-745e89b0c32so2027839b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 29 May 2025 16:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748562065; x=1749166865; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=D1w9eruoa/+h1y+kxAKN4nRm8YX18Xo+mwrCh9wmFfY=;
        b=sWtxPjhy+90GwC16Zi7TyRC/+NOdShGwJDbqSiycPijQN7kEL+nMbh/1QD6cE9Tymd
         qsYwesgvbwpzU6V8SMTtdU3HIMtfxaHSZaHJ7TUYSOt0/pes1bg2eV4DvhfzMoEhKKvh
         8vN0TAJOT8LcO/tP+QfhrxqaxqCBdWry1/Eyou8EaOAWghG+Qn8vYylLvAPOE0OoqJZr
         pXQZfH1mXN38LZQqF7rNChTuSKJC8g1aW91dac15Duvo9Fh/7Rw0Gw/Bm2FJsI12AE9Q
         xCaGD5pso/2cO0pLJvfFeUOoRWS7ar8i5KL0aCjeS4SLBOfar8/Ld+JCrKqpsaluj9H8
         C11Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748562065; x=1749166865;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D1w9eruoa/+h1y+kxAKN4nRm8YX18Xo+mwrCh9wmFfY=;
        b=v7u5UCei/geD504GLTMyYF18Ffte37NI5H2m4FG3WJDdl75mru8otIB8Y7TmsOLbk1
         W3Qyp1k+8trdUvR42FcWERhMku0LF2rh7XUqn5cHwEbICnX6S9eqEerxXq/5cM1VLouu
         YB1S6IZfiPNf2iBhb7NT3rnp/Wd5nyOc5+4BRgBYOIi/OekosGMC+CKWeWeR7J01XTBb
         owLa/EyV7bWGowSb7NWv2ClDtre1oigrEjephoPQ9PTUXoR5voXqcd8ZuugHjPCCehiv
         YJh5XHMCjfSk6byo0tVp4vJb5MrN5u9BTnRW4+61ppo1vo7uKI05pp1mZJ6+MNXmR43Z
         6MPw==
X-Forwarded-Encrypted: i=1; AJvYcCVjnX3GupIQ4zxQYhm6pUkbONS56pZKfUXjKgKbA4NGvAhz6ACRBvIp2ehlOpSsx0ppu6c7rzzHdk4LccQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLEbIzYgJqC8bWqUqxnNk3QQJQxrwyLjn0/2jBeyiy+rtihGeo
	FwYM2Sc+T1Vsgi6LRG22BxrQuaCFXJv8UQQC4pDy1r4EyQUegcsadTHmrqUHF900RDAVRO0uf9q
	ZjGlhew==
X-Google-Smtp-Source: AGHT+IHW019t6bOh5r2+n8eqSR6m7pMK/T98B2/buD8Ya8XZUgrDevK8/xH/YgciZlXidl8e6363cIkMFQE=
X-Received: from pgbcs3.prod.google.com ([2002:a05:6a02:4183:b0:b2e:b47d:8dc])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a20:12c3:b0:215:f519:e2dc
 with SMTP id adf61e73a8af0-21adff8a5famr337694637.14.1748562064661; Thu, 29
 May 2025 16:41:04 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Thu, 29 May 2025 16:40:13 -0700
In-Reply-To: <20250529234013.3826933-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250529234013.3826933-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
Message-ID: <20250529234013.3826933-29-seanjc@google.com>
Subject: [PATCH 28/28] KVM: selftests: Verify KVM disable interception (for
 userspace) on filter change
From: Sean Christopherson <seanjc@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Borislav Petkov <bp@alien8.de>, Xin Li <xin@zytor.com>, Chao Gao <chao.gao@intel.com>, 
	Dapeng Mi <dapeng1.mi@linux.intel.com>
Content-Type: text/plain; charset="UTF-8"

Re-read MSR_{FS,GS}_BASE after restoring the "allow everything" userspace
MSR filter to verify that KVM stops forwarding exits to userspace.  This
can also be used in conjunction with manual verification (e.g. printk) to
ensure KVM is correctly updating the MSR bitmaps consumed by hardware.

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
2.49.0.1204.g71687c7c1d-goog

