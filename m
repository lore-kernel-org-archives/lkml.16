Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07E45237701
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:49:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667366; cv=none; b=INvfyGiyVVsAs59XJ4Kqzn7Qu89y5FeCUnZ70Kq8hm5nz6sxqnFdI0oeA2HiiQrkZ4LWPEnLDCFm56r6hGWORXebHEhgdoxCrG8i0yu+GvWYl0o3MmsJwKJLtx/sB2btyAFgfF6ltNNcnnHBPcG1weTfRnHyljD7CCo2HmDKZpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667366; c=relaxed/simple;
	bh=0s0eRAzp79ZyqJlag/s9T0KZQwLlfgI5CTpQtvOBf1o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=sbwDGyGBoDTJup7KCJ7bkUyeIecIhod2qNypWuDyfg26gMgsHvChb4pR/9wUsgCx8D9SrugUWsUemBED4pEYPB4YSg4YudWGToJcI5JQCqqxB5Sa3xNwgKXxYYn9DqYZzttvmSqkkzEJY3oL3GUwf8NfsBs3ISDQ+EkAxbhbpgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RLxdKTY8; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RLxdKTY8"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-739515de999so4014511b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:49:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744667364; x=1745272164; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PBSumKkK0GopQQbf4kIGENs+zTxb+YbX4N+rBsmVgUU=;
        b=RLxdKTY8Kax25vuWCeEG7w9NP835NfPOog24dW4r0CUYdEQ8k8HYWsp9mj2Wulb1Xy
         UfOu8nDE1BRZCvc8rTRVNlHoRrhIzxu3S619npXswMfnDVfK/2woTnLBT7qJdShxYP0s
         hwD9PkN4IsgJLoB6MpoE1gm+hqd5Z75SZf1msf7UdjQdly4VPyRKJpnTwC5dUXaeExG8
         IqA+/KLQBR7Rq0O0ZlESYtAJHgAhJtgfrIsXBBO0xxu/uedkYKdyROJDhxHtuAjyW4Uc
         oY5gDtBiXk4H+IIyjPrj8UawxI1nyptQCSnLhsLoGTo8S+TNS8+IDRUkjIF9NN3BzYNX
         s94w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744667364; x=1745272164;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PBSumKkK0GopQQbf4kIGENs+zTxb+YbX4N+rBsmVgUU=;
        b=UtCM9MAKYKZZPGA4vxcA7gMOVQh2g3ZA7H7Ab2vyMjyMB+UZTZKfBXJkeREPA2cr+W
         3ufxrZfLgMNeN6hzP/LlVbGUlMz/aprESFOQVJ8uNaxjwwjMyQ4dcJhMsgLyaOqQWmwA
         BUnltVwMR1ljRZ5/CcBqBjeqffyyvPnZ7ClVEmmqPtS1Y8aykRU7L+2nhstSkV6TDAlf
         eZA4lxe9tevry7yKRvkRxjWKHNABTomP1TC1fLbG3IEKD8BkVQXVxt05KhoCzu1SD/cH
         7LVTjUkwFmP2r+G550z2EpjOkJGdakHqA/Y/SuXiu3HjO/7ct/kzCKU/5FhDZHMlyT7Z
         EZaw==
X-Gm-Message-State: AOJu0YxGiyDLT/+kaRmwcj5ojQ5gN6nsP9L3NXjI7AsU51KJiDJC/kt/
	uQzSr74beHDrkHNVlEb5RpzL7WxsJyKlWy/CgGduDv/gTmcgNSYALZRBuuIgMJdiO65f7LTUIw=
	=
X-Google-Smtp-Source: AGHT+IGAf9r8FGSlKp+K/4EeU8L9n+YGVWZYWn0f4xUb+jtnHNJ+DjWrf/1g8NbljgvPb7hNXCk6l26e0g==
X-Received: from pfbha18.prod.google.com ([2002:a05:6a00:8512:b0:736:59f0:d272])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:2286:b0:736:4110:5579
 with SMTP id d2e1a72fcca58-73bd119d755mr17279180b3a.2.1744667364222; Mon, 14
 Apr 2025 14:49:24 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:47:59 -0700
In-Reply-To: <20250414214801.2693294-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414214801.2693294-1-sagis@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250414214801.2693294-31-sagis@google.com>
Subject: [PATCH v6 30/30] KVM: selftests: TDX: Test LOG_DIRTY_PAGES flag to a
 non-GUEST_MEMFD memslot
From: Sagi Shahar <sagis@google.com>
To: linux-kselftest@vger.kernel.org, Paolo Bonzini <pbonzini@redhat.com>, 
	Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	Ackerley Tng <ackerleytng@google.com>, Ryan Afranji <afranji@google.com>, 
	Andrew Jones <ajones@ventanamicro.com>, Isaku Yamahata <isaku.yamahata@intel.com>, 
	Erdem Aktas <erdemaktas@google.com>, Rick Edgecombe <rick.p.edgecombe@intel.com>, 
	Sagi Shahar <sagis@google.com>, Roger Wang <runanwang@google.com>, 
	Binbin Wu <binbin.wu@linux.intel.com>, Oliver Upton <oliver.upton@linux.dev>, 
	"Pratik R. Sampat" <pratikrajesh.sampat@amd.com>, Reinette Chatre <reinette.chatre@intel.com>
Cc: linux-kernel@vger.kernel.org, kvm@vger.kernel.org, 
	Yan Zhao <yan.y.zhao@intel.com>
Content-Type: text/plain; charset="UTF-8"

From: Yan Zhao <yan.y.zhao@intel.com>

Add a selftest to verify that adding flag KVM_MEM_LOG_DIRTY_PAGES to a
!KVM_MEM_GUEST_MEMFD memslot does not produce host errors in TDX.

Signed-off-by: Yan Zhao <yan.y.zhao@intel.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 tools/testing/selftests/kvm/x86/tdx_vm_test.c | 45 ++++++++++++++++++-
 1 file changed, 44 insertions(+), 1 deletion(-)

diff --git a/tools/testing/selftests/kvm/x86/tdx_vm_test.c b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
index 82acc17a66ab..410d814dd39a 100644
--- a/tools/testing/selftests/kvm/x86/tdx_vm_test.c
+++ b/tools/testing/selftests/kvm/x86/tdx_vm_test.c
@@ -1167,6 +1167,47 @@ void verify_tdcall_vp_info(void)
 	printf("\t ... PASSED\n");
 }
 
+#define TDX_LOG_DIRTY_PAGES_FLAG_TEST_GPA (0xc0000000)
+#define TDX_LOG_DIRTY_PAGES_FLAG_TEST_GVA_SHARED (0x90000000)
+#define TDX_LOG_DIRTY_PAGES_FLAG_REGION_SLOT 10
+#define TDX_LOG_DIRTY_PAGES_FLAG_REGION_NR_PAGES (0x1000 / getpagesize())
+
+void guest_code_log_dirty_flag(void)
+{
+	memset((void *)TDX_LOG_DIRTY_PAGES_FLAG_TEST_GVA_SHARED, 1, 8);
+	tdx_test_success();
+}
+
+/*
+ * Verify adding flag KVM_MEM_LOG_DIRTY_PAGES to a !KVM_MEM_GUEST_MEMFD memslot
+ * in a TD does not produce host errors.
+ */
+void verify_log_dirty_pages_flag_on_non_gmemfd_slot(void)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+
+	vm = td_create();
+	td_initialize(vm, VM_MEM_SRC_ANONYMOUS, 0);
+	vcpu = td_vcpu_add(vm, 0, guest_code_log_dirty_flag);
+
+	vm_userspace_mem_region_add(vm, VM_MEM_SRC_ANONYMOUS,
+				    TDX_LOG_DIRTY_PAGES_FLAG_TEST_GPA,
+				    TDX_LOG_DIRTY_PAGES_FLAG_REGION_SLOT,
+				    TDX_LOG_DIRTY_PAGES_FLAG_REGION_NR_PAGES,
+				    KVM_MEM_LOG_DIRTY_PAGES);
+	virt_map_shared(vm, TDX_LOG_DIRTY_PAGES_FLAG_TEST_GVA_SHARED,
+			(uint64_t)TDX_LOG_DIRTY_PAGES_FLAG_TEST_GPA,
+			TDX_LOG_DIRTY_PAGES_FLAG_REGION_NR_PAGES);
+	td_finalize(vm);
+
+	printf("Verifying Log dirty flag:\n");
+	vcpu_run(vcpu);
+	tdx_test_assert_success(vcpu);
+	kvm_vm_free(vm);
+	printf("\t ... PASSED\n");
+}
+
 int main(int argc, char **argv)
 {
 	ksft_print_header();
@@ -1174,7 +1215,7 @@ int main(int argc, char **argv)
 	if (!is_tdx_enabled())
 		ksft_exit_skip("TDX is not supported by the KVM. Exiting.\n");
 
-	ksft_set_plan(15);
+	ksft_set_plan(16);
 	ksft_test_result(!run_in_new_process(&verify_td_lifecycle),
 			 "verify_td_lifecycle\n");
 	ksft_test_result(!run_in_new_process(&verify_report_fatal_error),
@@ -1205,6 +1246,8 @@ int main(int argc, char **argv)
 			 "verify_host_reading_private_mem\n");
 	ksft_test_result(!run_in_new_process(&verify_tdcall_vp_info),
 			 "verify_tdcall_vp_info\n");
+	ksft_test_result(!run_in_new_process(&verify_log_dirty_pages_flag_on_non_gmemfd_slot),
+			 "verify_log_dirty_pages_flag_on_non_gmemfd_slot\n");
 
 	ksft_finished();
 	return 0;
-- 
2.49.0.504.g3bcea36a83-goog

