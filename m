Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338C42D541F
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 19:14:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749842077; cv=none; b=lRuq3HHkyWmBYshlgmuSwHiWxYLkzDSRcH4WhQ9Sr0B1Ikc32lWjhMV8VbNlGD9yEkICqXtK7R+U18w/nYhR+nZoJ3IzKSdmcxZGzptXvU9gj7iANT/yqJQjh1BhUCtLdkSalsFvuRt93EtzhRES8ShWpvw2uIyOJm3jpMr1qD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749842077; c=relaxed/simple;
	bh=XiUCLbM31t3A1Ia7PvUtd8HccsiSwrLOChGJmM4U9ME=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=miPNe6BzVU9x8/9bOC3WomLySAAe/QA7zeddW+AsprgTqQVcxszNXh160Vgvr+jPyagEg3e0OFY+S1qlkWF7YRRUf/nIS7FsgTofGCpatZAOVm6hDpya5lcnRKTFyZXvhN+uWINbm1qeDPCCXVu+6G79juQjGQEwKlYJwKpmftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=vICYqu6+; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vICYqu6+"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-31315427249so2484521a91.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 12:14:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1749842076; x=1750446876; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SP57h7voyy8pTBZCNH4MEMrCXCzzIc1ZMbh9qeY2Ibg=;
        b=vICYqu6+M6+2t3YdF/M1am1DaC8J2LrFFbnm+qpeyaTwU6YMwjPlTJ3Wbi8o8/4jZl
         yOFNDBxtpkB/4rmTJAOyK5jRrGMfp114AQavRcOpPbEZP1CgCh3WyW42Y3UhvFiA0rN1
         ohLJ0ZxTPlgjxKJYKr5lwlkUeznmBPwqNrCGv9gJPjAOmPQN0U0zzF9kt1m4z7JoXyV7
         bfxyqk1xs/KM9oslN4eH7/rxj/cbMXosuwIiMs/bfxEByq2Bl2BslvimYrZcWDdTCOGG
         cB/VQty5+ybBX5px9R+6vDPPMb9KV4OWMT9I8eUqd6mPzs1sN/ArwIUDH3LFHs9Wj7aG
         jP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749842076; x=1750446876;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SP57h7voyy8pTBZCNH4MEMrCXCzzIc1ZMbh9qeY2Ibg=;
        b=dgA58wlUXsWOx3ieG3GSxAX3iw7sgtJXzGULA3Fv3AgCx2v/OVry4V+t4PJofiV+CB
         vilzF69ijoLc53s00u5vOjjiImONljfB2gr68UrU1Xwublk82eaQSes8dTb4P7mmQ1Hx
         wN99yDQg0vDPg8DRoYFsUIaIYx4jdnkkQQtq9N4ASOOkhPZJlJv5tHMjb91OJzdm6ccL
         e345wLlTUNAXv3hfL5f9vfnS2yPAkYK/jduUJSdcKpPiaAADS1MXL6XhJl0kHRwtCMDp
         yPsMykx/ty88Su89HoR6quKp9dXmv+rYc9GUwQPxhwVUF8wAxhxfbAMF5QWcFXjzpb2M
         LCwQ==
X-Gm-Message-State: AOJu0Yyr5tBFDs3a52106xEJ7DczvzZvSr94vmXtDRUnPzFYresDwyZU
	ESzOqqBliphdSt1oP7I/4Fj6xpBS6Y0nb0EpR5ZJX4+Bg+9kDJP3El/Hz+uM2NPjbO1KcI8wFZE
	5RA==
X-Google-Smtp-Source: AGHT+IELUXbtKEDjBs5GY4fdlAQg/ZPL5N4QXKAYA2nCb54Nuv3VGNUPELE6Q2Lncwpw2i1IMtNM9J4b3g==
X-Received: from pjf7.prod.google.com ([2002:a17:90b:3f07:b0:311:ea2a:3919])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:e7c6:b0:313:2f45:2fc8
 with SMTP id 98e67ed59e1d1-313f1d5872amr1337825a91.18.1749842075331; Fri, 13
 Jun 2025 12:14:35 -0700 (PDT)
Date: Fri, 13 Jun 2025 12:13:42 -0700
In-Reply-To: <20250613191359.35078-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250613191359.35078-1-sagis@google.com>
X-Mailer: git-send-email 2.50.0.rc2.692.g299adb8693-goog
Message-ID: <20250613191359.35078-16-sagis@google.com>
Subject: [PATCH v7 15/30] KVM: selftests: TDX: Add TDX IO reads test
From: Sagi Shahar <sagis@google.com>
To: linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>, Roger Wang <runanwang@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

The test verifies IO reads of various sizes from the host to the guest.

Signed-off-by: Sagi Shahar <sagis@google.com>
---
 tools/testing/selftests/kvm/x86/tdx_vm_test.c | 76 ++++++++++++++++++-
 1 file changed, 75 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/tdx_vm_test.c b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
index f646da032004..ae5749e5c605 100644
--- a/tools/testing/selftests/kvm/x86/tdx_vm_test.c
+++ b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
@@ -383,6 +383,78 @@ void verify_guest_writes(void)
 	printf("\t ... PASSED\n");
 }
 
+#define TDX_IO_READS_TEST_PORT 0x52
+
+/*
+ * Verifies IO functionality by reading values of different sizes
+ * from the host.
+ */
+void guest_io_reads(void)
+{
+	uint64_t data;
+	uint64_t ret;
+
+	ret = tdg_vp_vmcall_instruction_io(TDX_IO_READS_TEST_PORT, 1,
+					   PORT_READ, &data);
+	tdx_assert_error(ret);
+	if (data != 0xAB)
+		tdx_test_fatal(1);
+
+	ret = tdg_vp_vmcall_instruction_io(TDX_IO_READS_TEST_PORT, 2,
+					   PORT_READ, &data);
+	tdx_assert_error(ret);
+	if (data != 0xABCD)
+		tdx_test_fatal(2);
+
+	ret = tdg_vp_vmcall_instruction_io(TDX_IO_READS_TEST_PORT, 4,
+					   PORT_READ, &data);
+	tdx_assert_error(ret);
+	if (data != 0xFFABCDEF)
+		tdx_test_fatal(4);
+
+	/* Read an invalid number of bytes. */
+	ret = tdg_vp_vmcall_instruction_io(TDX_IO_READS_TEST_PORT, 5,
+					   PORT_READ, &data);
+	tdx_assert_error(ret);
+
+	tdx_test_success();
+}
+
+void verify_guest_reads(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = td_create();
+	td_initialize(vm, VM_MEM_SRC_ANONYMOUS, 0);
+	vcpu = td_vcpu_add(vm, 0, guest_io_reads);
+	td_finalize(vm);
+
+	printf("Verifying guest reads:\n");
+
+	tdx_run(vcpu);
+	tdx_test_assert_io(vcpu, TDX_IO_READS_TEST_PORT, 1, PORT_READ);
+	*(uint8_t *)((void *)vcpu->run + vcpu->run->io.data_offset) = 0xAB;
+
+	tdx_run(vcpu);
+	tdx_test_assert_io(vcpu, TDX_IO_READS_TEST_PORT, 2, PORT_READ);
+	*(uint16_t *)((void *)vcpu->run + vcpu->run->io.data_offset) = 0xABCD;
+
+	tdx_run(vcpu);
+	tdx_test_assert_io(vcpu, TDX_IO_READS_TEST_PORT, 4, PORT_READ);
+	*(uint32_t *)((void *)vcpu->run + vcpu->run->io.data_offset) = 0xFFABCDEF;
+
+	td_vcpu_run(vcpu);
+	TEST_ASSERT_EQ(vcpu->run->exit_reason, KVM_EXIT_SYSTEM_EVENT);
+	TEST_ASSERT_EQ(vcpu->run->system_event.data[12], TDG_VP_VMCALL_INVALID_OPERAND);
+
+	tdx_run(vcpu);
+	tdx_test_assert_success(vcpu);
+
+	kvm_vm_free(vm);
+	printf("\t ... PASSED\n");
+}
+
 int main(int argc, char **argv)
 {
 	ksft_print_header();
@@ -390,7 +462,7 @@ int main(int argc, char **argv)
 	if (!is_tdx_enabled())
 		ksft_exit_skip("TDX is not supported by the KVM. Exiting.\n");
 
-	ksft_set_plan(6);
+	ksft_set_plan(7);
 	ksft_test_result(!run_in_new_process(&verify_td_lifecycle),
 			 "verify_td_lifecycle\n");
 	ksft_test_result(!run_in_new_process(&verify_report_fatal_error),
@@ -403,6 +475,8 @@ int main(int argc, char **argv)
 			 "verify_get_td_vmcall_info\n");
 	ksft_test_result(!run_in_new_process(&verify_guest_writes),
 			 "verify_guest_writes\n");
+	ksft_test_result(!run_in_new_process(&verify_guest_reads),
+			 "verify_guest_reads\n");
 
 	ksft_finished();
 	return 0;
-- 
2.50.0.rc2.692.g299adb8693-goog

