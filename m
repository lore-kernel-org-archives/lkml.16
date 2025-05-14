Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C60E22ACF7
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:43:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266184; cv=none; b=nQ/3IOFyetaRW+cDgJetqFEPr/LX4Gt3TtWEtSim804UvcrEB5wH9odKlen62bbIA+NxO0nHoiAXf4KUV6rO04M1q99gmwHsrIjghyoCt2IwY0QlFpt30OOAE/KsAWtaN2FXC45+0UeidSqW1zq+9XFu98JtVR1hpxFpSy4Hj3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266184; c=relaxed/simple;
	bh=TvFIoSrzCO8w1cNFBdYkZGoalAviBLZzlcndl+DTNy8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=kVq9HtGcJi9xCDLaR6Dpga8YqbgE0fPovPqvn/W+4mtIau2nnRJyMCbAuBfCokyLeQ5ew2jPYmzDJY99z+K+mzSYJO9samMxOWZWGs9JpYb27HW1DLfD5MoqcQLoz4zcwnkAtsp5xLZZsg5rg8lXkvLSEl2xP/o04JJye0m6/YI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BiNbP0Qw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BiNbP0Qw"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-30c06465976so356559a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:43:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266182; x=1747870982; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OB4Vu62B2E9k02apRztGbb6VkHGr4YYVx8kY72Oa8kw=;
        b=BiNbP0QwsKUTY3eJ6SPfDiWMirDwi3gw6Fs+ZhqjZYiOptLU/e7aIYLrT53sOfwHhp
         MMd4Xk/T6i5xjQxm+dx3tbUsUPMmavAh37ntntjyGvpXee9y5fglIoZPJXo9Sb90/Q5o
         s1Y1VdRSl0MtoBrar5Begj5636x4SSkLDLm3Q8wNOMfIQJwQtDIEpiPkc+kyfRQ8PHVZ
         IGNBF5Z+jR18s566s9tvwhW/L3MD4yYXxFZcX/LtghTsEEivAB6uciaf76pKQwwa0ISA
         SbCb0gzsZXeYUn1psouKGOfpMomLSGmfo6kg2Q1ei+5TYXuBdyL97UzNzXGGLZZD4aJN
         Rl8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266182; x=1747870982;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OB4Vu62B2E9k02apRztGbb6VkHGr4YYVx8kY72Oa8kw=;
        b=KbKTAntSa1KqBpikU/SzPgKeIqn8k++UYNoeBgYpTiqXIqr310IhLsgS0yUNyqzbpu
         GkGHMZchMcWFfiClVbagjwfu24+fRuZu3O1v1u2W8xJJWw7FuxfD8cMslPoG2j/cx4gg
         YZ7lhpJKnX2gzMk7Y5f4RZI08ER+mprluIg9vLfiQvzrLiSoqJpDGUuVdhc+6UKhmV6Z
         FeC6iL9Y1NDev5Wk8VFwj8SjXx4fPybLq5sOJS4YQxFCu+C/YcWBxsakw5P/m46R6KWr
         7BNkYTVMfmsxgHvywazACGZqVtnnf/QDKQ5Wevl/sO4egs2J7N/pTg6RAeiGYNDgKL4/
         2aQg==
X-Forwarded-Encrypted: i=1; AJvYcCU6l8ZA/kSgpLWNzkhZxFRBvUKvktoj/DvPHLrtsR4SgqktH3ezpDXNrR+/3pEUOugzJMJJN788BL0C1FA=@vger.kernel.org
X-Gm-Message-State: AOJu0YzzH5Z9+6Rrg4ECtNqR4V9Ou4zOpr19Emqn5+b+z8iI6EN9kDZh
	TzCvi7G9c1wURvpMoceTFRHc1eNx8c242iajoeKx7WBLWYm9GYj/uv0hzwFPs+bFD3p/97mB8Gm
	bbuXYiu78Y5N29qB35I3Ppw==
X-Google-Smtp-Source: AGHT+IF+adSlhp7zDJmm2A5yYOEU8SOORDatD26qz6M1m2iFgXS5k7ij7O/H0tkK9p9BEbICVXUoFAXr3q9vRCbvwQ==
X-Received: from pjbsb11.prod.google.com ([2002:a17:90b:50cb:b0:2fc:13d6:b4cb])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:90b:4a86:b0:305:5f28:2d5c with SMTP id 98e67ed59e1d1-30e2e5d6aa8mr8073892a91.15.1747266181709;
 Wed, 14 May 2025 16:43:01 -0700 (PDT)
Date: Wed, 14 May 2025 16:41:42 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <65afac3b13851c442c72652904db6d5755299615.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 03/51] KVM: selftests: Update guest_memfd_test for
 INIT_PRIVATE flag
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

Test that GUEST_MEMFD_FLAG_INIT_PRIVATE is only valid when
GUEST_MEMFD_FLAG_SUPPORT_SHARED is set.

Change-Id: I506e236a232047cfaee17bcaed02ee14c8d25bbb
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../testing/selftests/kvm/guest_memfd_test.c  | 36 ++++++++++++-------
 1 file changed, 24 insertions(+), 12 deletions(-)

diff --git a/tools/testing/selftests/kvm/guest_memfd_test.c b/tools/testing/selftests/kvm/guest_memfd_test.c
index 60aaba5808a5..bf2876cbd711 100644
--- a/tools/testing/selftests/kvm/guest_memfd_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_test.c
@@ -401,13 +401,31 @@ static void test_with_type(unsigned long vm_type, uint64_t guest_memfd_flags,
 	kvm_vm_release(vm);
 }
 
+static void test_vm_with_gmem_flag(struct kvm_vm *vm, uint64_t flag,
+				   bool expect_valid)
+{
+	size_t page_size = getpagesize();
+	int fd;
+
+	fd = __vm_create_guest_memfd(vm, page_size, flag);
+
+	if (expect_valid) {
+		TEST_ASSERT(fd > 0,
+			    "guest_memfd() with flag '0x%lx' should be valid",
+			    flag);
+		close(fd);
+	} else {
+		TEST_ASSERT(fd == -1 && errno == EINVAL,
+			    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
+			    flag);
+	}
+}
+
 static void test_vm_type_gmem_flag_validity(unsigned long vm_type,
 					    uint64_t expected_valid_flags)
 {
-	size_t page_size = getpagesize();
 	struct kvm_vm *vm;
 	uint64_t flag = 0;
-	int fd;
 
 	if (!(kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(vm_type)))
 		return;
@@ -415,17 +433,11 @@ static void test_vm_type_gmem_flag_validity(unsigned long vm_type,
 	vm = vm_create_barebones_type(vm_type);
 
 	for (flag = BIT(0); flag; flag <<= 1) {
-		fd = __vm_create_guest_memfd(vm, page_size, flag);
+		test_vm_with_gmem_flag(vm, flag, flag & expected_valid_flags);
 
-		if (flag & expected_valid_flags) {
-			TEST_ASSERT(fd > 0,
-				    "guest_memfd() with flag '0x%lx' should be valid",
-				    flag);
-			close(fd);
-		} else {
-			TEST_ASSERT(fd == -1 && errno == EINVAL,
-				    "guest_memfd() with flag '0x%lx' should fail with EINVAL",
-				    flag);
+		if (flag == GUEST_MEMFD_FLAG_SUPPORT_SHARED) {
+			test_vm_with_gmem_flag(
+				vm, flag | GUEST_MEMFD_FLAG_INIT_PRIVATE, true);
 		}
 	}
 
-- 
2.49.0.1045.g170613ef41-goog

