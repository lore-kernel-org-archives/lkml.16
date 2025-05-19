Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E980E21CC71
	for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 18:55:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747680938; cv=none; b=n+XTDhRNQqW6ve0LANDakOWq0GJDyKCgRqhGFLaqJxxEZLIloB/dNsK7GGH3xT5e9/JR/Ie4w4TjdRIdPfszzHdbtVcrQn8+CpaBD2tDl4NvGo9nU9mh9Lpn8hG5a1XxxhN3q8sHcNZmb8ROqYpG57VaF+zYFHHUnxu8sio1hm8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747680938; c=relaxed/simple;
	bh=lKEiDtco8Zjxw+6Ce1l/2Woozc6T4pKTzIMLnMhgjbo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jsWzUpiliOrjJMKToxyWY1atNSPDq2O0uUhUrT+d7EuKPi2VhYDWq8s02rX4BI7g8KLWgMzpOkrMXeN5K+C0JjbR4RppiCyePOvapK2eIZoVidrq4iap1Hm9La8VOM1fQA+tkOEDUWM1hS+kAwI/G59Gp6AUpwz6fKXJwkSjo9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C1qV5YPU; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C1qV5YPU"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b269789425bso5151439a12.0
        for <linux-kernel@vger.kernel.org>; Mon, 19 May 2025 11:55:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747680936; x=1748285736; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=svZAfnlSTeaMolfrtcaOq/xEYvu0qCBcCbJ0k6qFXts=;
        b=C1qV5YPUAoBNllBUn6ZmJFZwSzjmhIqiIJySHKb79Tv36ERidwG57S63kTJDt3AQJQ
         WbDYxChybdc/zKc6hQCRt0IBQpk9lL6LIHFOQks+x9EM/XyEAohpG2UkIr1hie/XTcLR
         s1q/P+i6/tMKZUlkqOAbPDKNuYVUOvXRmXIrMP34veqb13n5vFLwUIxP/fmoS7ALl5f6
         BKALDg/17qGA30pCUAR7ZEABHh/L5fVUWPI277D4SfjWHE+RspIbE7ZV1w2ZGIX5hm9/
         +96jzgkvEn6fKra598JqEIbsi0JWy5tLDzQ2Plnq/70OzKTYsckduq1vxbA7JNzehFt3
         2mBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747680936; x=1748285736;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=svZAfnlSTeaMolfrtcaOq/xEYvu0qCBcCbJ0k6qFXts=;
        b=oW1G1womQjMv0HNpNFkjpn4ZL756YLkKSdbvBw8HY4s+gfSl+NyXH4co3gOfPoVUep
         /Nhp6R8EwRWJicMv97ZpFasP4w1Nr81Xx5kA5h+0+0pbekktn6jQXK0ceDhLbi+ENwIi
         Ay3NbUaA8otqm9xnSrqsyMWYY3Wo5xToZ9aVYyMg6Jm//Yx9NC0dOvbrkwuHNfgTI1/v
         3As1M2Up0hIyfdC4K3h4KHkwaPb8whO4w4ErL3mH2Nrf4wLMabpxVk2S5bQY4tiJK8L0
         z8XF9XMfX5Wy1UM+cBbY1TLvMNlyR52Kbl7osyLB2v5PnQ55dC/+qT7EGijcoDa38waz
         vO4g==
X-Forwarded-Encrypted: i=1; AJvYcCWDdb6lhGqH9dL1/0/2dwb7vNeMPugccS+8lDKAkV/ex8TSNBUkO6Z9e0mVhmjYMt80m/oG4vcoSRHae9w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8p80Kccn5S3jTIAz7l1/Ms81ieTyFp9MdPACNWHwZ76H3BGSp
	NUBfpHe5LK6pyW0dJgaDHV50puMDJcoH8DUAOAyuE2rdveKox0MJTv5DcBa8Gkd9ZMkoyusKMR3
	leoWMwg==
X-Google-Smtp-Source: AGHT+IHFHSV2Ke7uVRMojNlgnegTrMTQP9GQqHVO1VwR0CTBk3daaqGT0xYoclFSkFU0/yQOifv0EZ0lYtM=
X-Received: from pjbsb5.prod.google.com ([2002:a17:90b:50c5:b0:301:2679:9d9])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90a:d604:b0:2fe:ba82:ca5
 with SMTP id 98e67ed59e1d1-30e7d52221bmr23752952a91.11.1747680936483; Mon, 19
 May 2025 11:55:36 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Mon, 19 May 2025 11:55:12 -0700
In-Reply-To: <20250519185514.2678456-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250519185514.2678456-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250519185514.2678456-11-seanjc@google.com>
Subject: [PATCH v2 10/12] KVM: selftests: Assert that eventfd() succeeds in
 Xen shinfo test
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Marc Zyngier <maz@kernel.org>, 
	Oliver Upton <oliver.upton@linux.dev>, Sean Christopherson <seanjc@google.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev, 
	K Prateek Nayak <kprateek.nayak@amd.com>, David Matlack <dmatlack@google.com>, 
	Juergen Gross <jgross@suse.com>, Stefano Stabellini <sstabellini@kernel.org>, 
	Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
Content-Type: text/plain; charset="UTF-8"

Assert that eventfd() succeeds in the Xen shinfo test instead of skipping
the associated testcase.  While eventfd() is outside the scope of KVM, KVM
unconditionally selects EVENTFD, i.e. the syscall should always succeed.

Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 tools/testing/selftests/kvm/x86/xen_shinfo_test.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
index 287829f850f7..34d180cf4eed 100644
--- a/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
+++ b/tools/testing/selftests/kvm/x86/xen_shinfo_test.c
@@ -548,14 +548,11 @@ int main(int argc, char *argv[])
 
 	if (do_eventfd_tests) {
 		irq_fd[0] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[0] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[0]));
+
 		irq_fd[1] = eventfd(0, 0);
+		TEST_ASSERT(irq_fd[1] >= 0, __KVM_SYSCALL_ERROR("eventfd()", irq_fd[1]));
 
-		/* Unexpected, but not a KVM failure */
-		if (irq_fd[0] == -1 || irq_fd[1] == -1)
-			do_evtchn_tests = do_eventfd_tests = false;
-	}
-
-	if (do_eventfd_tests) {
 		irq_routes.info.nr = 2;
 
 		irq_routes.entries[0].gsi = 32;
-- 
2.49.0.1101.gccaa498523-goog

