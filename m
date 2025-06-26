Received: from mail-pj1-f73.google.com (mail-pj1-f73.google.com [209.85.216.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A3C194A65
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 00:12:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750896759; cv=none; b=MLypoahL3Nkaz+HP3wbUe/ghpsbEqnt7pD5aI/vjiaEtmd69+G/eDTZZvMEJaeiajGPReaa1NKgNYQqGm1YHbqFaB1kpxKpzP2mN1o/MJ2n+JbMNTiubz/e/gUJHx8XoB+Vhm6cfp6C7AmdzBPfQ8auWIwhKqW3Xs3bhb1eSnFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750896759; c=relaxed/simple;
	bh=YYqdIgfs7prMRCqGJLkiae8o8yLiIzZye7Nt81y7N1s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i5v+UG0pYaetMdK9RZuboLKNew71Qdaz8jsmjcrGJcQFexQZqeCrXRRlZ3RF3N6xILMV4MlrHVVaKcoSLVggfOiiQ1DEZxBABnY8VHcbrtxI1QRXiWdcXT3LaVr32A4K50Jtrx6FA12gO1RBm7g+UhYoRgmwf2Si9toulNcJtA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RvJjAi32; arc=none smtp.client-ip=209.85.216.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RvJjAi32"
Received: by mail-pj1-f73.google.com with SMTP id 98e67ed59e1d1-3121cffd7e8so280223a91.0
        for <linux-kernel@vger.kernel.org>; Wed, 25 Jun 2025 17:12:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750896757; x=1751501557; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=TejvodaYmBPMcebcEQjSEKnmOuBSBKtSthLIMV0TmZs=;
        b=RvJjAi32HmWeZn8O8UTTG69t+NRplPkjjtN4hDaqzO4Z8AU8lvQV7+tft/dI24gavj
         QnF6yAeJgURax/+qb2tiRpKDW74cMSMNCEBLlKBqugut0ynsVKS64Ch8PUEPRcRylZfb
         3V29/q8J/Qf3TKdT4uioOJ+XKXcJa7qzssYwE/UdYPXXLfK6N3Bfl+f8qXhHfmTJEEiV
         osxG1oyZSWbMoazAAunz/Buba6hV70/Jw37BB8u6c2Yi5ORFKQLAXuslFvBPC0x+1Rtj
         wSLCkjJi8BXp0UcYlmmEQprMhgx3Owa/ow0sgYge6iFLgiId1/93D7PWuEPltWhCKtMv
         JghA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750896757; x=1751501557;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TejvodaYmBPMcebcEQjSEKnmOuBSBKtSthLIMV0TmZs=;
        b=DsAEhjBlP6YdMItHnB07gpWA8jczhd6gh34NeRTKb1YEqdJtxQCmOUD5382BbBploF
         XioTOsEmujwdYWa2f0mRkIUr7A5VxcnTpAeHxY/205C10YZQkNQB+8GFNJtwDxKbrmQ3
         ahHQtqkRB9s8PUmrCC7Wo1l71GWY59aNpI7H9+0JFbhDNfNHEmB/NK2ABO3QxyF382pf
         wb1uN7+e65YYqVzC+nLci8T5ligiIWkLe7/ICR/OoTv8kFPSReZmLmrCO54CeIGdrfYn
         IfQrhCq5+cBf5aKU4alEmwddhWtU36Lom9BwTqR9VyJ5rESkmzxJyyO9/wn5KV5y2JZu
         RWww==
X-Forwarded-Encrypted: i=1; AJvYcCUq5ZLyVo7sVTR6M1SF9jFvgxir9egP9dNcbJ8mF3ErjHorLxE5kqb3JTZqgQhpp/cSul2UMVyqLZmUjEA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcoz/NGqLth4zRmj9qpmktMfBSYVFPS7wl24tdrfOP/ae7HiVI
	4IQisI0sQKU5bah7zOsTOb7EyNagx5Hp+4XT6TMfMAiZb6kA8ydU00/6l4tv7erp3e1Mun49wGT
	ioqSK+Q==
X-Google-Smtp-Source: AGHT+IG+NlZ+68CsdHzgcIfwCRnU1b472g9YpYS5EpkOr0QdzQPPYC4WRVn9r71YvhtQ94AlekS4VDTCDtU=
X-Received: from pjbqo12.prod.google.com ([2002:a17:90b:3dcc:b0:311:f699:df0a])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1f90:b0:311:ea13:2e61
 with SMTP id 98e67ed59e1d1-315f26c1b74mr6093342a91.34.1750896757146; Wed, 25
 Jun 2025 17:12:37 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Wed, 25 Jun 2025 17:12:25 -0700
In-Reply-To: <20250626001225.744268-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250626001225.744268-1-seanjc@google.com>
X-Mailer: git-send-email 2.50.0.727.gbf7dc18ff4-goog
Message-ID: <20250626001225.744268-6-seanjc@google.com>
Subject: [PATCH v5 5/5] KVM: selftests: Convert arch_timer tests to common
 helpers to pin task
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Sean Christopherson <seanjc@google.com>, 
	Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>
Cc: kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Jim Mattson <jmattson@google.com>
Content-Type: text/plain; charset="UTF-8"

Convert the arch timer tests to use __pin_task_to_cpu() and
pin_self_to_cpu().

No functional change intended.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/arch_timer.c      |  7 +-----
 .../kvm/arm64/arch_timer_edge_cases.c         | 23 ++-----------------
 2 files changed, 3 insertions(+), 27 deletions(-)

diff --git a/tools/testing/selftests/kvm/arch_timer.c b/tools/testing/selftests/kvm/arch_timer.c
index acb2cb596332..cf8fb67104f1 100644
--- a/tools/testing/selftests/kvm/arch_timer.c
+++ b/tools/testing/selftests/kvm/arch_timer.c
@@ -98,16 +98,11 @@ static uint32_t test_get_pcpu(void)
 static int test_migrate_vcpu(unsigned int vcpu_idx)
 {
 	int ret;
-	cpu_set_t cpuset;
 	uint32_t new_pcpu = test_get_pcpu();
 
-	CPU_ZERO(&cpuset);
-	CPU_SET(new_pcpu, &cpuset);
-
 	pr_debug("Migrating vCPU: %u to pCPU: %u\n", vcpu_idx, new_pcpu);
 
-	ret = pthread_setaffinity_np(pt_vcpu_run[vcpu_idx],
-				     sizeof(cpuset), &cpuset);
+	ret = __pin_task_to_cpu(pt_vcpu_run[vcpu_idx], new_pcpu);
 
 	/* Allow the error where the vCPU thread is already finished */
 	TEST_ASSERT(ret == 0 || ret == ESRCH,
diff --git a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
index 4e71740a098b..ce74d069cb7b 100644
--- a/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
+++ b/tools/testing/selftests/kvm/arm64/arch_timer_edge_cases.c
@@ -862,25 +862,6 @@ static uint32_t next_pcpu(void)
 	return next;
 }
 
-static void migrate_self(uint32_t new_pcpu)
-{
-	int ret;
-	cpu_set_t cpuset;
-	pthread_t thread;
-
-	thread = pthread_self();
-
-	CPU_ZERO(&cpuset);
-	CPU_SET(new_pcpu, &cpuset);
-
-	pr_debug("Migrating from %u to %u\n", sched_getcpu(), new_pcpu);
-
-	ret = pthread_setaffinity_np(thread, sizeof(cpuset), &cpuset);
-
-	TEST_ASSERT(ret == 0, "Failed to migrate to pCPU: %u; ret: %d\n",
-		    new_pcpu, ret);
-}
-
 static void kvm_set_cntxct(struct kvm_vcpu *vcpu, uint64_t cnt,
 			   enum arch_timer timer)
 {
@@ -907,7 +888,7 @@ static void handle_sync(struct kvm_vcpu *vcpu, struct ucall *uc)
 		sched_yield();
 		break;
 	case USERSPACE_MIGRATE_SELF:
-		migrate_self(next_pcpu());
+		pin_self_to_cpu(next_pcpu());
 		break;
 	default:
 		break;
@@ -919,7 +900,7 @@ static void test_run(struct kvm_vm *vm, struct kvm_vcpu *vcpu)
 	struct ucall uc;
 
 	/* Start on CPU 0 */
-	migrate_self(0);
+	pin_self_to_cpu(0);
 
 	while (true) {
 		vcpu_run(vcpu);
-- 
2.50.0.727.gbf7dc18ff4-goog

