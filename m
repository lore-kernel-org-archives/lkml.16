Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F19D21D3F1
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220689; cv=none; b=fQZ2ubzHJJZs9SWNPU6/nxgC3yShb7CPepT5o6G6ettb7juORXST03ceSPTedmpMfwbELr9hktI7EqNbkYELKbcF70pQQO5L4q6ZwUob8MRs4n5Q87TgqkaTDHS8IaDEraqgRjr9bOIdlh+pRIlJ//0rAOhKWwPy6Dexin12qW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220689; c=relaxed/simple;
	bh=pBsXSmQz4NiPuEOYLkwfwEN5cJ0gqQwNFVp5scXJ8tE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=QuTgMnJBQMwixbpzcOGlBg82KWhXQlDRVktHKO5WCwrMHvvAQrdViaK83Njfi3gbPihF7auZ1mW0mspYulMe1uACAEZ07OPhA18RkkkO+0UezHS8SpoX7BtkESM7CxqocVP7jFv3xHcFvAwqtO89z7SVZR99Zn+9dvc31MB8swk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NqWonq7V; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NqWonq7V"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b2f4c436301so300638a12.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220687; x=1750825487; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=;
        b=NqWonq7VmobhJY6B8Pahfi9r8ORcLnWhWSkGVdhdHb/NzeRnhzTL9TZAj3LBIEnGDO
         PyoIU5ZLbGzQyCoOeSUJqleOL5xMKr0/iKwJzqB+3lKorvTJFk2owbIQS7nPTn2ahsuu
         EENef+MVjqufiUzhAdhebe9p2S77nVA3ghYOsuEOqdum6GAcgRj1BVEKhQi9nL1Bu7Qv
         VEyxd9L8mBfhU4CGRAQietErjL+cws3rDceIVY2a6GOZ2tL+InTKSXzw4VHVo0wRSt2L
         YJ1JDMs0Z/PS+y1hgLNOVMRvK2YLJ5qbxqdAHVNW99FoQGZDxej+h644q5c/x+qTkzon
         B5EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220687; x=1750825487;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IPfdrb3qNj0vF7Vvj49qyj4bUirkHon/mzHMR4ThfgQ=;
        b=XhO1EiFToT1xAhXPlmuHjU3iI9doo6bXedWig6Xk34JkSQhtwIAXc2pqP6wTq2rzdz
         fzSvR3WkXtbqDQxxLjHfXnBwrdxcXdWiHCMSwT+HvwvObXxWunF/rkweHHJ7OwRuugt0
         OR9/KI80d8yEH3UE+FbP2OAsxmBnQg5VHvt3PKo4QLnpgVSzS16jZQcPzW6//GxkAWn2
         hzwixJP9sJK+ae8pfoI52LdH1/D96lNXJ+H6waLpEYlySAUgrPwddqseQsRd617ckP4g
         l2fACwrgEpA3LCM0Fb6lki1yktq+OkR9C+KVH+fA6ZCTHEiwmfXVnQf2ax2wOSD+xXiF
         ++Jg==
X-Forwarded-Encrypted: i=1; AJvYcCUniBxmtLAA9ekzfm5uHjNWIunnxoVC8atTzv6YbX6iwCWbfFdcanlz3BJeQtA1hac4/TpQ/CDQgXikOIA=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhdcHkZ4wyQmkqQcVcEFX2UMGZvtvxhL7O5w2tnHYydHHwIi1w
	VAKYycFmZyJTuoB8UGNPy8JhCqjdtR2kpkxbpJP8yBTwT/5FDRUoCmYjB9Xq3kEJRon7kKX7WaI
	g4hEKkNh8K8WiDGyKiCCe/Q==
X-Google-Smtp-Source: AGHT+IEwWie/mYOzWzkPEMzzYrHW7iM/BMlWT3ZNJE+z50G+eg48u4nBoLAfK8Q5b1sDwPdBgQjlTM5R7I81KayS
X-Received: from pfbgt12.prod.google.com ([2002:a05:6a00:4e0c:b0:746:2524:8aab])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:7492:b0:215:d1dd:df4c with SMTP id adf61e73a8af0-22003686bacmr2081008637.6.1750220686708;
 Tue, 17 Jun 2025 21:24:46 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:22 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-14-jthoughton@google.com>
Subject: [PATCH v3 13/15] KVM: selftests: Add KVM_MEM_USERFAULT + guest_memfd
 toggle tests
From: James Houghton <jthoughton@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Oliver Upton <oliver.upton@linux.dev>
Cc: Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>, Yan Zhao <yan.y.zhao@intel.com>, 
	James Houghton <jthoughton@google.com>, Nikita Kalyazin <kalyazin@amazon.com>, 
	Anish Moorthy <amoorthy@google.com>, Peter Gonda <pgonda@google.com>, Peter Xu <peterx@redhat.com>, 
	David Matlack <dmatlack@google.com>, wei.w.wang@intel.com, kvm@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

Make sure KVM_MEM_USERFAULT can be toggled on and off for
KVM_MEM_GUEST_MEMFD memslots.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 .../selftests/kvm/set_memory_region_test.c    | 30 +++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/tools/testing/selftests/kvm/set_memory_region_test.c b/tools/testing/selftests/kvm/set_memory_region_test.c
index ba3fe8a53b33e..3f77abb257601 100644
--- a/tools/testing/selftests/kvm/set_memory_region_test.c
+++ b/tools/testing/selftests/kvm/set_memory_region_test.c
@@ -606,6 +606,35 @@ static void test_mmio_during_vectoring(void)
 
 	kvm_vm_free(vm);
 }
+
+static void test_private_memory_region_userfault(void)
+{
+	struct kvm_vm *vm;
+	int memfd;
+
+	pr_info("Testing toggling KVM_MEM_USERFAULT on KVM_MEM_GUEST_MEMFD memory regions\n");
+
+	vm = vm_create_barebones_type(KVM_X86_SW_PROTECTED_VM);
+
+	test_invalid_guest_memfd(vm, vm->kvm_fd, 0, "KVM fd should fail");
+	test_invalid_guest_memfd(vm, vm->fd, 0, "VM's fd should fail");
+
+	memfd = vm_create_guest_memfd(vm, MEM_REGION_SIZE, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT,
+				   KVM_MEM_GUEST_MEMFD | KVM_MEM_USERFAULT,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	vm_set_user_memory_region2(vm, MEM_REGION_SLOT, KVM_MEM_GUEST_MEMFD,
+				   MEM_REGION_GPA, MEM_REGION_SIZE, 0, memfd, 0);
+
+	close(memfd);
+
+	kvm_vm_free(vm);
+}
 #endif
 
 int main(int argc, char *argv[])
@@ -633,6 +662,7 @@ int main(int argc, char *argv[])
 	    (kvm_check_cap(KVM_CAP_VM_TYPES) & BIT(KVM_X86_SW_PROTECTED_VM))) {
 		test_add_private_memory_region();
 		test_add_overlapping_private_memory_regions();
+		test_private_memory_region_userfault();
 	} else {
 		pr_info("Skipping tests for KVM_MEM_GUEST_MEMFD memory regions\n");
 	}
-- 
2.50.0.rc2.692.g299adb8693-goog

