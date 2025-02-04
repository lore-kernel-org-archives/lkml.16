Received: from mail-vs1-f73.google.com (mail-vs1-f73.google.com [209.85.217.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 190D886325
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 00:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738629663; cv=none; b=rBMyLM3FTOCiC6fglcpjTcGvUbkOJ7I8tg4Q3i6JLDudku+ttQRNp0/IE2G76bnBlP+6VdU4+qu69ErzmWW9CgGII7tmRyFQmT1fzQ8hieaIdgPQikdj5vk4HpQ71g2ZaSP6irmhK7Dp3DZFgzoh79F0XezALYPrZbuB6yFMIPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738629663; c=relaxed/simple;
	bh=a3TRDZM8x1fiiRZnJfYVD3hVEP1SNiDTsiq1Frcsqko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=HlcViYOwQiJxN0Rfw5gris35vy6anADWMW9X2zE/wLgByqgnR0jQqc7jaeRpYzVNZTrPDDOHQuBuI8LLKSAiPYwOEj/nUz8RgQUgrKUavvHle69LEgcXd697b+j90GpPvXaKMPxSGoQXr6X2hNEttjM32W6FzMiZZV/s12/RE0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ByVWq+xs; arc=none smtp.client-ip=209.85.217.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ByVWq+xs"
Received: by mail-vs1-f73.google.com with SMTP id ada2fe7eead31-4b053191e52so466924137.2
        for <linux-kernel@vger.kernel.org>; Mon, 03 Feb 2025 16:41:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738629660; x=1739234460; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KfdRry+BcOH3zeRQLxBsJjxeZnQGmGZoCLOL9+q/wCU=;
        b=ByVWq+xsGVzDqZ2q3JFj3OTiJbhFRdZwi+Va8ijflp//SCMs6C/zaea2EOX0dS4Yp/
         rdd0AxMLLuuRlxioi0P9wTxeyOgiskhcYbiDf6UbLZwNR+9uKii/ihaq9vhzhQGpIAZg
         dv9RxEHaN2oM8yTpn5CFFwJNEM05xFIb7Ht91m89FQkh6KYr1Jslf/c46JYkVCboPC1V
         DlFrbccx3UK31dYxoByFRQlmMdcmYtwFFrPSJSYlqFSMlaQ5LLdRE+b7IV15ymXo5pRu
         /kdNXKnbnqHNODr7gkJif2W7wxZsd17SOrNShjKBQqOqYkI/5aeL4wr7pCdbntUMfhLn
         sMlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738629660; x=1739234460;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KfdRry+BcOH3zeRQLxBsJjxeZnQGmGZoCLOL9+q/wCU=;
        b=WPrTM6d9794sS/lAX1zbJTsjQDWYVAGA/jcoNGsRXvaAxlsL7uky/o1O47OvlwNsqP
         Eu2tzlZn0EL76YzAXkCZDtw5s/NEIsLLKufBI67Wyye0zakh+KadlwDtPbdNjRhVsv/x
         YIVIG5KI6gkVtgOYKNDjn28oAO6KuChyCmm6Lzapo3R6Vy921xH0i/WrW6ESOnNU46Wl
         heS0AaB6/9dZz6wQipgKhzZubilNozyqBC273eAXotY6JGp3BJXrYIbrX3tpN7qHtjSM
         OcmqeXspXrZ7xiNTuWVawy3gT9jIASw8D554imdz4OcILeWcvFBr2Q58XcbH4wR7D0QH
         kuVg==
X-Forwarded-Encrypted: i=1; AJvYcCVdefR22VoHFtQpZcH6WD9Mm/JSBwGNTod//G7nKwx69nBZhBoPjqzU2qYmTw9zXQzOi2EjWnF3TDzhbMk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbXqRXL3MF/GvkcnlbaFl18ooBdjWOhZXcs9lR1CrYRQoJtb2r
	2QNz/79zVu5AF8Xe9Ddvzlht+PJhI+zRTQDHL1f3zRlWb2sopLoX7NnBIAH7juSmRRXjARIJioF
	qhkBE7Min4tL1tKBcJQ==
X-Google-Smtp-Source: AGHT+IEamuzx9s5qse7UsUK89rO9T79mCD2dXIbBlho6815iBfrQcz4XNUZNgGX5066o3jnMHhInIwduF5Gws1Iv
X-Received: from vsvj20.prod.google.com ([2002:a05:6102:3e14:b0:4b2:ae6d:7c1d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6102:226a:b0:4b9:bdd8:2091 with SMTP id ada2fe7eead31-4b9bdd82bf9mr9551814137.14.1738629660026;
 Mon, 03 Feb 2025 16:41:00 -0800 (PST)
Date: Tue,  4 Feb 2025 00:40:33 +0000
In-Reply-To: <20250204004038.1680123-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250204004038.1680123-1-jthoughton@google.com>
X-Mailer: git-send-email 2.48.1.362.g079036d154-goog
Message-ID: <20250204004038.1680123-7-jthoughton@google.com>
Subject: [PATCH v9 06/11] KVM: x86/mmu: Skip shadow MMU test_young if TDP MMU
 reports page as young
From: James Houghton <jthoughton@google.com>
To: Sean Christopherson <seanjc@google.com>, Paolo Bonzini <pbonzini@redhat.com>
Cc: David Matlack <dmatlack@google.com>, David Rientjes <rientjes@google.com>, 
	James Houghton <jthoughton@google.com>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Wei Xu <weixugc@google.com>, Yu Zhao <yuzhao@google.com>, 
	Axel Rasmussen <axelrasmussen@google.com>, kvm@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Reorder the processing of the TDP MMU versus the shadow MMU when aging
SPTEs, and skip the shadow MMU entirely in the test-only case if the TDP
MMU reports that the page is young, i.e. completely avoid taking mmu_lock
if the TDP MMU SPTE is young.  Swap the order for the test-and-age helper
as well for consistency.

Signed-off-by: James Houghton <jthoughton@google.com>
Acked-by: Yu Zhao <yuzhao@google.com>
---
 arch/x86/kvm/mmu/mmu.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 1fa0f47eb6a5..4a9de4b330d7 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -1592,15 +1592,15 @@ bool kvm_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
+	if (tdp_mmu_enabled)
+		young = kvm_tdp_mmu_age_gfn_range(kvm, range);
+
 	if (kvm_memslots_have_rmaps(kvm)) {
 		write_lock(&kvm->mmu_lock);
-		young = kvm_rmap_age_gfn_range(kvm, range, false);
+		young |= kvm_rmap_age_gfn_range(kvm, range, false);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-	if (tdp_mmu_enabled)
-		young |= kvm_tdp_mmu_age_gfn_range(kvm, range);
-
 	return young;
 }
 
@@ -1608,15 +1608,15 @@ bool kvm_test_age_gfn(struct kvm *kvm, struct kvm_gfn_range *range)
 {
 	bool young = false;
 
-	if (kvm_memslots_have_rmaps(kvm)) {
+	if (tdp_mmu_enabled)
+		young = kvm_tdp_mmu_test_age_gfn(kvm, range);
+
+	if (!young && kvm_memslots_have_rmaps(kvm)) {
 		write_lock(&kvm->mmu_lock);
-		young = kvm_rmap_age_gfn_range(kvm, range, true);
+		young |= kvm_rmap_age_gfn_range(kvm, range, true);
 		write_unlock(&kvm->mmu_lock);
 	}
 
-	if (tdp_mmu_enabled)
-		young |= kvm_tdp_mmu_test_age_gfn(kvm, range);
-
 	return young;
 }
 
-- 
2.48.1.362.g079036d154-goog

