Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47251268FDD
	for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 23:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747266250; cv=none; b=AumH03buVTKMaX5z0N3K3+0yerSne2/8sDCEELRUCv5M5VkNGKDUjLBjioYMD/T18A+9JbtTZN2dfzvQD/n1M2s58VMUcs3Wx9eggdOYLxnteRjEC8q5VFsFqNPYffktXSUnsNsbngkaT5wsF+ohzucc154d1Ax8i4KCP5oCFpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747266250; c=relaxed/simple;
	bh=g2kEqW1Z21Xi73nWkW3r1kF6BUbvwrCvya4e/6PiEcw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TZyNgNuMygsKW5c/7exD3xSuVfr9+Q3sbi4M36Pc5BC1eN3aplgn/3UDByIrNpSY23unscwWU8fpf+ElXfTR6hprI6oTaPzLnJKmvWGv1ic1lYCN70gl/kRiEYufKp/uynuHFhgCjGmpxKToLiaQFhk4aySaHDMJbTJ2BeQk3YY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fBO29/j0; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ackerleytng.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fBO29/j0"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-7375e2642b4so250899b3a.2
        for <linux-kernel@vger.kernel.org>; Wed, 14 May 2025 16:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747266247; x=1747871047; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=8H4kuVjKe4FyXjhH122Og8e4/l1o3DJQcDfSdK/hCao=;
        b=fBO29/j03QNVCbMbvjUkh5oMcUQlhF8iBOy0wPAvhHssH2W8ovTT6cB9+um9b0Dp0l
         HY2lsSj99IMgkHNRVMSvbP7zwFvoF1ucX+ge9V/Ao8VVgmG1Q7ENuGpa/Dr64Oy7Gb+5
         ADCpjQzcFDtRgwPjqZlF2Wm1RUcIP4Px27y+sOOCnmz081NSkgDGLDYPDBjPD+GC/vKs
         iFCkiz3dsdrnzjiCqcQtL4sHwTTJZ/Xi0GN8BTTI7kZHmWMOJI56wd1MSWd8H+a7Do8A
         lZ5hkhiSWQLRyLVatzuGpkLI7J+fn8KAm3j9tBbsjYALiQV82oo78S2TfiFmeUcUNUVM
         y/tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747266247; x=1747871047;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8H4kuVjKe4FyXjhH122Og8e4/l1o3DJQcDfSdK/hCao=;
        b=iY1fd5ervL94KPxm3N2dcWvEMqg1e4a+s2y513+FiL26ajsKd/h5SKu15jSJYUJGSw
         7HGvYLHfqnO2rAjkaRBTKSSxaCR/Q8woqgR66AnVjgC6FfJfHKJNlAqV+hylk9Qy4i+X
         0LvklJAihJiNyo9+XfobfSNvM7w1ZeGkWdsXuT4J59Z3mlUkBaKAloqcjBjotQb8Ro0f
         rwIIvDTJI4GW9eJxa27mn/bTWYKkTdByte4+KgB7YKptL1/8jJ6yGZbd4UjIBAshitXP
         GvH72L7JWTJZIrUaFwKTBxfK5OxGxSKi7S1cOKwk6ginnngqZkqNw1joY5ggfMzcAv5T
         WIhg==
X-Forwarded-Encrypted: i=1; AJvYcCUphn+Y3d2H7EgyEXYeLy5IFrH5xnZO5ijwcJi6N03iUJeCZFIqZC8uXw6beSdplMlGlukKRoOcePfg9Gw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzrhr3x9Bb7VMxSzfLNIXKcqoUjH4CAl40nmf9lD8Jv9yRmeWCm
	Mn5DgFZvQ5SzkRAKHZcYgxXQ9HIhT1ip6FRIt58YNyLRQob4++qXbU/ZEaldso0Lv5VSrc2bNsh
	aTkMUa4hvBexRraxYUsxcYg==
X-Google-Smtp-Source: AGHT+IGiAe2NB0jbTkTUU7WLr9Mqfo/T69az13j5YN1qfxr++PxmdC5TExfGFvvHcO1pRG98WRl0DEE4eI7872AoZw==
X-Received: from pfbbj12.prod.google.com ([2002:a05:6a00:318c:b0:730:76c4:7144])
 (user=ackerleytng job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:4327:b0:203:c29b:eb6c with SMTP id adf61e73a8af0-215ff0aaf6bmr8757671637.4.1747266247493;
 Wed, 14 May 2025 16:44:07 -0700 (PDT)
Date: Wed, 14 May 2025 16:42:24 -0700
In-Reply-To: <cover.1747264138.git.ackerleytng@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747264138.git.ackerleytng@google.com>
X-Mailer: git-send-email 2.49.0.1045.g170613ef41-goog
Message-ID: <b68e77305a8cf74a1d54c86e245c778154961f61.1747264138.git.ackerleytng@google.com>
Subject: [RFC PATCH v2 45/51] KVM: selftests: Test allocation and conversion
 of subfolios
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

This patch adds tests for allocation and conversion of subfolios in a
large folio.

Change-Id: I37035b2c24398e2c83a2ac5a46b4e6ceed2a8b53
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
---
 .../kvm/guest_memfd_conversions_test.c        | 88 +++++++++++++++++++
 1 file changed, 88 insertions(+)

diff --git a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
index 435f91424d5f..c31d1abd1b93 100644
--- a/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
+++ b/tools/testing/selftests/kvm/guest_memfd_conversions_test.c
@@ -672,6 +672,92 @@ static void test_close_with_pinning(size_t test_page_size)
 	__test_close_with_pinning(test_page_size, false);
 }
 
+static void test_allocate_subfolios(size_t test_page_size)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	size_t increment;
+	int guest_memfd;
+	size_t nr_pages;
+	char *mem;
+	int i;
+
+	if (test_page_size == PAGE_SIZE)
+		return;
+
+	vm = setup_test(test_page_size, /*init_private=*/false, &vcpu,
+			&guest_memfd, &mem);
+
+	nr_pages = test_page_size / PAGE_SIZE;
+
+	/*
+	 * Loop backwards to check allocation of the correct subfolio within the
+	 * huge folio. If it were allocated wrongly, the second loop would error
+	 * out because one or more of the checks would be wrong.
+	 */
+	increment = nr_pages >> 1;
+	for (i = nr_pages - 1; i >= 0; i -= increment)
+		host_use_memory(mem + i * PAGE_SIZE, 'X', 'A' + i);
+	for (i = nr_pages - 1; i >= 0; i -= increment)
+		host_use_memory(mem + i * PAGE_SIZE, 'A' + i, 'A' + i);
+
+	cleanup_test(test_page_size, vm, guest_memfd, mem);
+}
+
+static void test_convert_subfolios(size_t test_page_size)
+{
+	struct kvm_vcpu *vcpu;
+	struct kvm_vm *vm;
+	size_t increment;
+	int guest_memfd;
+	size_t nr_pages;
+	int to_convert;
+	char *mem;
+	int i;
+
+	if (test_page_size == PAGE_SIZE)
+		return;
+
+	vm = setup_test(test_page_size, /*init_private=*/true, &vcpu,
+			&guest_memfd, &mem);
+
+	nr_pages = test_page_size / PAGE_SIZE;
+
+	increment = nr_pages >> 1;
+	for (i = 0; i < nr_pages; i += increment) {
+		guest_use_memory(vcpu,
+				 GUEST_MEMFD_SHARING_TEST_GVA + i * PAGE_SIZE,
+				 'X', 'A', 0);
+		assert_host_cannot_fault(mem + i * PAGE_SIZE);
+	}
+
+	to_convert = round_up(nr_pages / 2, increment);
+	guest_memfd_convert_shared(guest_memfd, to_convert * PAGE_SIZE, PAGE_SIZE);
+
+
+	for (i = 0; i < nr_pages; i += increment) {
+		if (i == to_convert)
+			host_use_memory(mem + i * PAGE_SIZE, 'A', 'B');
+		else
+			assert_host_cannot_fault(mem + i * PAGE_SIZE);
+
+		guest_use_memory(vcpu,
+				 GUEST_MEMFD_SHARING_TEST_GVA + i * PAGE_SIZE,
+				 'X', 'B', 0);
+	}
+
+	guest_memfd_convert_private(guest_memfd, to_convert * PAGE_SIZE, PAGE_SIZE);
+
+	for (i = 0; i < nr_pages; i += increment) {
+		guest_use_memory(vcpu,
+				 GUEST_MEMFD_SHARING_TEST_GVA + i * PAGE_SIZE,
+				 'B', 'C', 0);
+		assert_host_cannot_fault(mem + i * PAGE_SIZE);
+	}
+
+	cleanup_test(test_page_size, vm, guest_memfd, mem);
+}
+
 static void test_with_size(size_t test_page_size)
 {
 	test_sharing(test_page_size);
@@ -685,6 +771,8 @@ static void test_with_size(size_t test_page_size)
 	test_truncate_shared_while_pinned(test_page_size);
 	test_truncate_private(test_page_size);
 	test_close_with_pinning(test_page_size);
+	test_allocate_subfolios(test_page_size);
+	test_convert_subfolios(test_page_size);
 }
 
 int main(int argc, char *argv[])
-- 
2.49.0.1045.g170613ef41-goog

