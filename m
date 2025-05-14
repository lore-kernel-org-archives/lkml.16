Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BED2E2356A3
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:43:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266196; cv=none; b=QzBZ4/PJXh5hpVy/xPbBNiXd7tKb/VYN3ZizcptoZcAEnw9lwdmuuhNPfgamS363koXRpdeXIA249z7+h9hkfmLVojJUHdU0k6KgTeD4HtPBnmawXbnuL57McGgx065rDX6ybY8MH5PQBzdknjsga+Fe+2EYoGi+mQ/dxnd+i6M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266196; c=relaxed/simple;
	bh=LzJYk4b8YGsjuk791t5mKW865k0fPRkNXL8xs0fj9z0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iwa8XhfK97+F00JKXJLGVXbAP9pt4PS9Ewiqx/SAsga9TotUP9AVLz6xdmS0+hy2dGr+BXnpbap08/rISyu/2yDc34sv47JNkzximYfETcYo+VWZMuQAIbCTN6XEYBkBW3CeWfjOaUgUv87mk9ATlQKgU7EOmdZNZXXSlnMeY2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dB7tNBjE; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dB7tNBjE"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30abb33d1d2so654468a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266194; x=1747870994; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mGWGFLne1bJyu7laipcwQPaVQw6rHvasb6OTJEqGffc=;
        b=dB7tNBjEJawIvPmuM7S1FgBXGqOLhkGp0NooRcKZfKHaWFZ1OYviFEfSpa7T57Z2Qp
         CN0uy9+GkzqpodzUbEYb33YDDLRQtM2LgTG9JgSBXwfdrDPQ0Y5RSXBO91/pBOTksTYN
         rXzhtFhtZg+4vON2MK0ncyw5qKV94pKyHOaIbdZN4qNy5H14lCl4Nn5QyQu/8BX16/gY
         jZqdaywDpq64YSVaDgDQD/bbH2RjOBJZ2Jpv5IleZUbT+rqU53RW+VlaIjMSi+2//x+8
         ELyyPGaYNG4jEujDNIGxZgaLY3NmgnNxII8M/7i7FP0ljtwO/H3TpGoQuG9z/n8Hn2gb
         gsBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266194; x=1747870994;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGWGFLne1bJyu7laipcwQPaVQw6rHvasb6OTJEqGffc=;
        b=iDxJYmR/UcIDqWsRX00/rpegY5QneMbp+xgqMa4ZIaovFvmv7AHLMDDzY9JHhAiiOa
         jfjuxYXG6sM/GJGsGCpUbJIlZSphl+ald7aOtdQIPUHAqdBXZdDCI9+vH1ZxpGAJ4asV
         1sDocFTkSjrUAqcZTbP0n5506G7PfKku3vHzotR0235kTWrsCjaR5n/A7Q6g3Iyspmep
         uzYLqCBscszwGb8M5dus1lJ/xbFnrscx2vg+8UTq8Sm2QnqdPeRON/KmNipkviazTM2C
         guvMD8Kaq6N98nuMEMIlUqfyQsxDvkT0SFSdICKLEUDEOaQJ/Y9qwWGLAaOF1kPfMn8T
         r47g==
X-Forwarded-Encrypted: i=1; AJvYcCWelt+wnuLcJxANY2AmguHQBWOv5+ATs1YbrS0wLGEUDQSnLRufW6KsAAFngkXW7v/VmO1nv+c58Otm0CM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWqMPuKxYx79xJ+0uGaJIvlCfIyADaLA6Af3g6MZuiUFFqR10r
	E/E1dOQik6MK7+1awdqVtt8XfzrrmZFJt3ar8vnCFG5U/V6UAqzgmTs2swx5p1cZz5BtBoGRIIV
	PTSY8JxU+Ota1fbl8emRkgg==
X-Google-Smtp-Source: AGHT+IHW8Awj1az2kZDKXFyRTHzAsu7nHW73nuWNFHatSp354fmtn6egEeLp32OhYFxf0/BZ1Nce5gFMY5p11LmLng==
X-Received: from pjbee14.prod.google.com ([2002:a17:90a:fc4e:b0:301:1bf5:2f07])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:5788:b0:2fe:baa3:b8bc with SMTP id 98e67ed59e1d1-30e51930f95mr563390a91.23.1747266194209;
 Wed, 14 May 2025 16:43:14 -0700 (PDT)
Date: Wed, 14 May 2025 16:41:50 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <09e75529c3f844b1bb4dd5a096ed4160905fca7f.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 11/51] KVM: selftests: Allow cleanup of ucall_pool from host
From: Ackerley Tng <ackerleytng@google.com>
To: kvm@vger.kernel.org, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	x86@kernel.org, linux-fsdevel@vger.kernel.org
Cc: ackerleytng@google.com, aik@amd.com, ajones@ventanamicro.com, 
	akpm@linux-foundation.org, amoorthy@google.com, anthony.yznaga@oracle.com, 
	anup@brainfault.org, aou@eecs.berkeley.edu, bfoster@redhat.com, 
	binbin.wu@linux.intel.com, brauner@kernel.org, catalin.marinas@arm.com, 
	chao.p.peng@intel.com, chenhuacai@kernel.org, dave.hansen@intel.com, 
	david@redhat.com, dmatlack@google.com, dwmw@amazon.co.uk, 
	erdemaktas@google.com, fan.du@intel.com, fvdl@google.com, graf@amazon.com, 
	haibo1.xu@intel.com, hch@infradead.org, hughd@google.com, ira.weiny@intel.com, 
	isaku.yamahata@intel.com, jack@suse.cz, james.morse@arm.com, 
	jarkko@kernel.org, jgg@ziepe.ca, jgowans@amazon.com, jhubbard@nvidia.com, 
	jroedel@suse.de, jthoughton@google.com, jun.miao@intel.com, 
	kai.huang@intel.com, keirf@google.com, kent.overstreet@linux.dev, 
	kirill.shutemov@intel.com, liam.merwick@oracle.com, 
	maciej.wieczor-retman@intel.com, mail@maciej.szmigiero.name, maz@kernel.org, 
	mic@digikod.net, michael.roth@amd.com, mpe@ellerman.id.au, 
	muchun.song@linux.dev, nikunj@amd.com, nsaenz@amazon.es, 
	oliver.upton@linux.dev, palmer@dabbelt.com, pankaj.gupta@amd.com, 
	paul.walmsley@sifive.com, pbonzini@redhat.com, pdurrant@amazon.co.uk, 
	peterx@redhat.com, pgonda@google.com, pvorel@suse.cz, qperret@google.com, 
	quic_cvanscha@quicinc.com, quic_eberman@quicinc.com, 
	quic_mnalajal@quicinc.com, quic_pderrin@quicinc.com, quic_pheragu@quicinc.com, 
	quic_svaddagi@quicinc.com, quic_tsoni@quicinc.com, richard.weiyang@gmail.com, 
	rick.p.edgecombe@intel.com, rientjes@google.com, roypat@amazon.co.uk, 
	rppt@kernel.org, seanjc@google.com, shuah@kernel.org, steven.price@arm.com, 
	steven.sistare@oracle.com, suzuki.poulose@arm.com, tabba@google.com, 
	thomas.lendacky@amd.com, usama.arif@bytedance.com, vannapurve@google.com, 
	vbabka@suse.cz, viro@zeniv.linux.org.uk, vkuznets@redhat.com, 
	wei.w.wang@intel.com, will@kernel.org, willy@infradead.org, 
	xiaoyao.li@intel.com, yan.y.zhao@intel.com, yilun.xu@intel.com, 
	yuzenghui@huawei.com, zhiquan1.li@intel.com
Content-Type: text/plain; charset="UTF-8"

Many selftests use GUEST_DONE() to signal the end of guest code, which
is handled in userspace. In most tests, the test exits and there is no
need to clean up the ucall_pool->in_use bitmap.

If there are many guest code functions using GUEST_DONE(), or of guest
code functions are run many times, the ucall_pool->in_use bitmap will
fill up, causing later runs of the same guest code function to fail.

This patch allows ucall_free() to be called from userspace on uc.hva,
which will unset and free the correct struct ucall in the pool,
allowing ucalls to continue being used.

Change-Id: I2cb2aeed4b291b1bfb2bece001d09c509cd10446
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/include/ucall_common.h |  1 +
 tools/testing/selftests/kvm/lib/ucall_common.c   | 16 ++++++++--------
 2 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/tools/testing/selftests/kvm/include/ucall_common.h b/tools/testing/selftests/kvm/include/ucall_common.h
index d9d6581b8d4f..b6b850d0319a 100644
--- a/tools/testing/selftests/kvm/include/ucall_common.h
+++ b/tools/testing/selftests/kvm/include/ucall_common.h
@@ -40,6 +40,7 @@ __printf(5, 6) void ucall_assert(uint64_t cmd, const char *exp,
 				 const char *fmt, ...);
 uint64_t get_ucall(struct kvm_vcpu *vcpu, struct ucall *uc);
 void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa);
+void ucall_free(struct ucall *uc);
 int ucall_nr_pages_required(uint64_t page_size);
 
 /*
diff --git a/tools/testing/selftests/kvm/lib/ucall_common.c b/tools/testing/selftests/kvm/lib/ucall_common.c
index 42151e571953..9b6865c39ea7 100644
--- a/tools/testing/selftests/kvm/lib/ucall_common.c
+++ b/tools/testing/selftests/kvm/lib/ucall_common.c
@@ -21,24 +21,24 @@ int ucall_nr_pages_required(uint64_t page_size)
 
 /*
  * ucall_pool holds per-VM values (global data is duplicated by each VM), it
- * must not be accessed from host code.
+ * should generally not be accessed from host code other than via ucall_free(),
+ * to cleanup after using GUEST_DONE()
  */
 static struct ucall_header *ucall_pool;
 
 void ucall_init(struct kvm_vm *vm, vm_paddr_t mmio_gpa)
 {
-	struct ucall_header *hdr;
 	struct ucall *uc;
 	vm_vaddr_t vaddr;
 	int i;
 
-	vaddr = vm_vaddr_alloc_shared(vm, sizeof(*hdr), KVM_UTIL_MIN_VADDR,
-				      MEM_REGION_DATA);
-	hdr = (struct ucall_header *)addr_gva2hva(vm, vaddr);
-	memset(hdr, 0, sizeof(*hdr));
+	vaddr = vm_vaddr_alloc_shared(vm, sizeof(*ucall_pool),
+				      KVM_UTIL_MIN_VADDR, MEM_REGION_DATA);
+	ucall_pool = (struct ucall_header *)addr_gva2hva(vm, vaddr);
+	memset(ucall_pool, 0, sizeof(*ucall_pool));
 
 	for (i = 0; i < KVM_MAX_VCPUS; ++i) {
-		uc = &hdr->ucalls[i];
+		uc = &ucall_pool->ucalls[i];
 		uc->hva = uc;
 	}
 
@@ -73,7 +73,7 @@ static struct ucall *ucall_alloc(void)
 	return NULL;
 }
 
-static void ucall_free(struct ucall *uc)
+void ucall_free(struct ucall *uc)
 {
 	/* Beware, here be pointer arithmetic.  */
 	clear_bit(uc - ucall_pool->ucalls, ucall_pool->in_use);
-- 
2.49.0.1045.g170613ef41-goog

