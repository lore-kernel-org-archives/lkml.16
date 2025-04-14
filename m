Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27D2A1FF7A5
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 21:48:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744667332; cv=none; b=Hdy+UCUuYmfyifx4buMrseHnybos4C9Hf3gge67rEUBeVYYFwKQbVbZdtbU2qG/M9CUJwMCdYB0cMhMv9NLD+GfsiF42BXh0OhcOY2d/j0xF65ESM9c60t9DlRmQNQNDicaUccaheurvixcptYICYIdj/4w0xKyPTk4AT2AuUIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744667332; c=relaxed/simple;
	bh=ocxRN7xdwWLtr5hQHt+BZ4mkKFTanjb/oeVK5mDnB68=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tgRhHVepLmpkAIDWgI1m1kP0prijjRbIMgJTO1Z/ZhWP17mpqEU0bV9Z5BI8IvGzxlJP/ypi/oRfmvOLUYMapiESrZLtqa/4VgJBRsjHV1rEV4tzYb/IqoRP6W525tsyJn6BBSZsISL76PjgX7Qx74ke6Q6J/qA+hV4QpC8nzSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Kgx0xRY8; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--sagis.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Kgx0xRY8"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-736c89461d1so6668627b3a.3
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 14:48:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744667330; x=1745272130; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=HRhTODvisTfaiy4uFCxlPOQM9xPsqUOZrcKfVYCdQmc=;
        b=Kgx0xRY827sI1nxJaSfiKHrG/nL4NVkiDHxFdNUtWsTVlDQnJgTtzmhegA8xQNegl4
         yKfHOVsUs1UinK0jt7ZcTf+UK7j9TrjwdVRQfMRCMqxT/oHD4Tv/Hl6szM5lJNvAntX+
         ewGsnEqDlnbvgkpxOcda7XCCnq7lEzi+v7I8MTNz2Nn57TzMdrXGjuxCk7KSt96ivRxd
         ArZ42N4FdYHJ3JvBDcdlFlUtmnZISeB/vqYRfQUtQEu8ZffoX4sbOTMF+w6YlSW7Yf5D
         XXzQXG41vfwjqnjbN6krqMAThMkVOgc3TmFXXAUbfQJIA2JAoaiRTdlSzaCMYJHpinbp
         5ZSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744667330; x=1745272130;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HRhTODvisTfaiy4uFCxlPOQM9xPsqUOZrcKfVYCdQmc=;
        b=m1C5CWRAN3X0DRVdWdITQ6fBSLz0CilmUtgKwX+kaPvdbTJgLclA/Xk+LNuHYmSGaD
         egAME00TLMY6Of0mggmD+ju/LJce4vQv5mch4Hb+oLz5qG5lprZBAbOVrqDSySk7R+fT
         jqkM5+WQ0rIQJ8w6wM90ynczqkXD6xQnfBAufGfAk+DLL8l7KeQkqgf+Ci1/S/2ikJpY
         YACaBk15uRNCAmuI6l1o6hLSaoxHIgeRWjQEQe+dnbuYycOnnJ5N+nX47B7eZujVPec8
         0yo3Erzgg5oYxV6R+fUK0vCtjbKGvPUNJj4LnVzyPPNQgPPd/HudoNF1PRTscCO9Rm6+
         HEEQ==
X-Gm-Message-State: AOJu0YzpeNTPQwcZIBgvedReJu2ZkJeGQK/QYYeXU2gs0IE5UCFIye+8
	cdhz6aC2Q3qjEFs7m534jQ8aVerO3SiJcsaI8upzUgphgWtqNPlLFzy4hP+1m9jQxv2HPU4jRw=
	=
X-Google-Smtp-Source: AGHT+IH2ANqybdgPb08Zf42UrpVzKMTzNDhF/aTJYqnSLdF4VZx5xXyV/A/WViTs4yT1sBwJSAozJW64vw==
X-Received: from pfjf20.prod.google.com ([2002:a05:6a00:22d4:b0:739:8c87:ed18])
 (user=sagis job=prod-delivery.src-stubby-dispatcher) by 2002:a05:6a00:1907:b0:737:6e1f:29da
 with SMTP id d2e1a72fcca58-73bd12dc5e6mr18296407b3a.21.1744667330365; Mon, 14
 Apr 2025 14:48:50 -0700 (PDT)
Date: Mon, 14 Apr 2025 14:47:37 -0700
In-Reply-To: <20250414214801.2693294-1-sagis@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250414214801.2693294-1-sagis@google.com>
X-Mailer: git-send-email 2.49.0.777.g153de2bbd5-goog
Message-ID: <20250414214801.2693294-9-sagis@google.com>
Subject: [PATCH v6 08/30] KVM: selftests: TDX: Update load_td_memory_region()
 for VM memory backed by guest memfd
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

From: Ackerley Tng <ackerleytng@google.com>

If guest memory is backed by restricted memfd

+ UPM is being used, hence encrypted memory region has to be
  registered
+ Can avoid making a copy of guest memory before getting TDX to
  initialize the memory region

Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Sagi Shahar <sagis@google.com>
---
 .../selftests/kvm/lib/x86/tdx/tdx_util.c      | 38 +++++++++++++++----
 1 file changed, 30 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
index bb074af4a476..e2bf9766dc03 100644
--- a/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
+++ b/tools/testing/selftests/kvm/lib/x86/tdx/tdx_util.c
@@ -324,6 +324,21 @@ static void tdx_td_finalize_mr(struct kvm_vm *vm)
 	tdx_ioctl(vm->fd, KVM_TDX_FINALIZE_VM, 0, NULL);
 }
 
+/*
+ * Other ioctls
+ */
+
+/*
+ * Register a memory region that may contain encrypted data in KVM.
+ */
+static void register_encrypted_memory_region(struct kvm_vm *vm,
+					     struct userspace_mem_region *region)
+{
+	vm_set_memory_attributes(vm, region->region.guest_phys_addr,
+				 region->region.memory_size,
+				 KVM_MEMORY_ATTRIBUTE_PRIVATE);
+}
+
 /*
  * TD creation/setup/finalization
  */
@@ -459,28 +474,35 @@ static void load_td_memory_region(struct kvm_vm *vm,
 	if (!sparsebit_any_set(pages))
 		return;
 
+	if (region->region.guest_memfd != -1)
+		register_encrypted_memory_region(vm, region);
+
 	sparsebit_for_each_set_range(pages, i, j) {
 		const uint64_t size_to_load = (j - i + 1) * vm->page_size;
 		const uint64_t offset =
 			(i - lowest_page_in_region) * vm->page_size;
 		const uint64_t hva = hva_base + offset;
 		const uint64_t gpa = gpa_base + offset;
-		void *source_addr;
+		void *source_addr = (void *)hva;
 
 		/*
 		 * KVM_TDX_INIT_MEM_REGION ioctl cannot encrypt memory in place.
 		 * Make a copy if there's only one backing memory source.
 		 */
-		source_addr = mmap(NULL, size_to_load, PROT_READ | PROT_WRITE,
-				   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
-		TEST_ASSERT(source_addr,
-			    "Could not allocate memory for loading memory region");
-
-		memcpy(source_addr, (void *)hva, size_to_load);
+		if (region->region.guest_memfd == -1) {
+			source_addr = mmap(NULL, size_to_load, PROT_READ | PROT_WRITE,
+					   MAP_ANONYMOUS | MAP_PRIVATE, -1, 0);
+			TEST_ASSERT(source_addr,
+				    "Could not allocate memory for loading memory region");
+
+			memcpy(source_addr, (void *)hva, size_to_load);
+			memset((void *)hva, 0, size_to_load);
+		}
 
 		tdx_init_mem_region(vm, source_addr, gpa, size_to_load);
 
-		munmap(source_addr, size_to_load);
+		if (region->region.guest_memfd == -1)
+			munmap(source_addr, size_to_load);
 	}
 }
 
-- 
2.49.0.504.g3bcea36a83-goog

