Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3622820BA
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 19:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747423206; cv=none; b=iWY+mpVRqNg7+wvKShfqMp+rs0kCPHlOFez69fcgU+6kwG8XK+VpSibnEwxyVTaCQe97dFpQwXgc2btmlZ0eJr+L+qQxeUuANCIVT3msDQXzoH3RK+IDFVN5Hj3iUB7hgs5MK25fNpNax81A73rftoKXcyajKo7K8Mfzh0MxDeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747423206; c=relaxed/simple;
	bh=zI703iJCDbnk2s6d61LSt5o9bFxMF1iFazDfQ6c+5lo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fACpItGi7adDXc2OFomIxIUK0oERt/UpPiAWFSFH4gOMPhCR8HLoIElhpaJYQXqYfQHqfUsikqa4MUzOZ2KJdmVou+KRi9A8S3LtoSckteqehuiKCSdCk189RuWdwD1c8RkAPboMCJQNmvhRtTeEEZhWnETeNR+0vNXSIcr2AjI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kjBaW/fa; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--afranji.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kjBaW/fa"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-30e9e81d4b0so243873a91.3
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 12:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747423203; x=1748028003; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw0kwmlCHmpdsX/DiL844LcPhYI529J79EzDxXuX1+o=;
        b=kjBaW/faJLsmRpkYDLcpuE44pBFxM774oWFWGs/U/exePEWWfWzkgCyILUbXl0VE0m
         RiVmZymxIHz7xgF/RhaBIji8SNXkNa0GspmhXEd7gC4ZmnYJnLM/CQLytwtNuqBmoMb7
         24xrFyevRQ4MrIQDCfndBhBzF2DTo1K8Fx32xGJ6JORBiigVC9oHzC3z6vBm6qRVpejm
         TaQi7QWvqJtemLU56lf9CDA0BzwEMB0SjZ585RksO3a+VZ6Xbp5Wn0FBmPn5wV5o/bvN
         A9lgJH46+n8QXo0A13epSqB9XEO/+Q/bEDCJVkoFfdL4Uygplw6ehIoImmRYsZlQBKWK
         kqzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747423203; x=1748028003;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Xw0kwmlCHmpdsX/DiL844LcPhYI529J79EzDxXuX1+o=;
        b=XIiJWqPSZeJv+WyUf8czRFWCPrRJgYfoDoHC9v0dvWTToq33f6kvy70JCIfMvkC303
         QRcD6PU21xZvopkxMAE3x6X2GGF6obUMYQjy3U1S+m7k1TmBT5NUaUNkPGNCHVXED1E0
         CtSMhq1uOZI530uCNBsr5XsQiGqDHeg1mcmoLDq2h6tM+UkcmXHKpDSlfgDc4zlg5kDY
         LvH4G+49f0jAYkkVJFgaIvLAKX1f/ldFtOZpi7y7dtt7aLk4zJIs3n/4djRvCxEysQk/
         qoaCHkwrOHnnoHDz2b22nCIYjkCAEz/EJ0scflOreyeoYzWpqYm2/8hBT195g47SiZwe
         OlSg==
X-Forwarded-Encrypted: i=1; AJvYcCWk0N9+mBs9jW2sY+tM/oJDeREdnaQYWI0xkjLBJirC1J2lDAn0njs3cnhl0njZEONBz/7vNnHqQWT1+kI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPyrs1HzUsrqAlam6DSEdIPtT5RmZ11TibPQY0qRVbmekhprbd
	flfJ260VY2AoCPKLBciWIcQpfkMMBPrbCAvoimqhPUeU/b2rfyChC2EBSvTGI8m744M8Ke6aIue
	w3HmjQK7opnwaxYa8Rh9W+KE0peNyxP2wIVmSj9Hq11pCq50nW0bxEukCOmvJR/ZJIjIGqNOPp2
	c=
X-Google-Smtp-Source: AGHT+IHuWIFRKFYUeYZ/E0Mn4pw8FwJ4Uk8VOlO7RIg7ETTqbymvwLUfY9oGU3oIEt0b7BaEDlNyVDhXpsne
X-Received: from pjb12.prod.google.com ([2002:a17:90b:2f0c:b0:30a:a05c:6e7d])
 (user=afranji job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:558e:b0:2ee:8ea0:6b9c
 with SMTP id 98e67ed59e1d1-30e830fb83cmr6780268a91.12.1747423203424; Fri, 16
 May 2025 12:20:03 -0700 (PDT)
Date: Fri, 16 May 2025 19:19:30 +0000
In-Reply-To: <cover.1747368092.git.afranji@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1747368092.git.afranji@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <7c51d4ae251323ce8c224aa362a4be616b4cfeba.1747368093.git.afranji@google.com>
Subject: [RFC PATCH v2 10/13] KVM: x86: Let moving encryption context be configurable
From: Ryan Afranji <afranji@google.com>
To: afranji@google.com, ackerleytng@google.com, pbonzini@redhat.com, 
	seanjc@google.com, tglx@linutronix.de, x86@kernel.org, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	tabba@google.com
Cc: mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com, hpa@zytor.com, 
	shuah@kernel.org, andrew.jones@linux.dev, ricarkol@google.com, 
	chao.p.peng@linux.intel.com, jarkko@kernel.org, yu.c.zhang@linux.intel.com, 
	vannapurve@google.com, erdemaktas@google.com, mail@maciej.szmigiero.name, 
	vbabka@suse.cz, david@redhat.com, qperret@google.com, michael.roth@amd.com, 
	wei.w.wang@intel.com, liam.merwick@oracle.com, isaku.yamahata@gmail.com, 
	kirill.shutemov@linux.intel.com, sagis@google.com, jthoughton@google.com
Content-Type: text/plain; charset="UTF-8"
X-ccpol: medium

From: Ackerley Tng <ackerleytng@google.com>

SEV-capable VMs may also use the KVM_X86_SW_PROTECTED_VM type, but
they will still need architecture-specific handling to move encryption
context. Hence, we let moving of encryption context be configurable
and store that configuration in a flag.

Co-developed-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Vishal Annapurve <vannapurve@google.com>
Signed-off-by: Ackerley Tng <ackerleytng@google.com>
Signed-off-by: Ryan Afranji <afranji@google.com>
---
 arch/x86/include/asm/kvm_host.h | 1 +
 arch/x86/kvm/svm/sev.c          | 2 ++
 arch/x86/kvm/x86.c              | 9 ++++++++-
 3 files changed, 11 insertions(+), 1 deletion(-)

diff --git a/arch/x86/include/asm/kvm_host.h b/arch/x86/include/asm/kvm_host.h
index 179618300270..db37ce814611 100644
--- a/arch/x86/include/asm/kvm_host.h
+++ b/arch/x86/include/asm/kvm_host.h
@@ -1576,6 +1576,7 @@ struct kvm_arch {
 #define SPLIT_DESC_CACHE_MIN_NR_OBJECTS (SPTE_ENT_PER_PAGE + 1)
 	struct kvm_mmu_memory_cache split_desc_cache;
 
+	bool use_vm_enc_ctxt_op;
 	gfn_t gfn_direct_bits;
 
 	/*
diff --git a/arch/x86/kvm/svm/sev.c b/arch/x86/kvm/svm/sev.c
index 689521d9e26f..95083556d321 100644
--- a/arch/x86/kvm/svm/sev.c
+++ b/arch/x86/kvm/svm/sev.c
@@ -442,6 +442,8 @@ static int __sev_guest_init(struct kvm *kvm, struct kvm_sev_cmd *argp,
 	if (ret)
 		goto e_no_asid;
 
+	kvm->arch.use_vm_enc_ctxt_op = true;
+
 	init_args.probe = false;
 	ret = sev_platform_init(&init_args);
 	if (ret)
diff --git a/arch/x86/kvm/x86.c b/arch/x86/kvm/x86.c
index 637540309456..3a7e05c47aa8 100644
--- a/arch/x86/kvm/x86.c
+++ b/arch/x86/kvm/x86.c
@@ -6624,7 +6624,14 @@ static int kvm_vm_move_enc_context_from(struct kvm *kvm, unsigned int source_fd)
 	if (r)
 		goto out_mark_migration_done;
 
-	r = kvm_x86_call(vm_move_enc_context_from)(kvm, source_kvm);
+	/*
+	 * Different types of VMs will allow userspace to define if moving
+	 * encryption context should be required.
+	 */
+	if (kvm->arch.use_vm_enc_ctxt_op &&
+	    kvm_x86_ops.vm_move_enc_context_from) {
+		r = kvm_x86_call(vm_move_enc_context_from)(kvm, source_kvm);
+	}
 
 	kvm_unlock_two_vms(kvm, source_kvm);
 out_mark_migration_done:
-- 
2.49.0.1101.gccaa498523-goog

