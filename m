Received: from mail-pl1-f201.google.com (mail-pl1-f201.google.com [209.85.214.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8194521A452
	for <linux-kernel@vger.kernel.org>; Wed, 18 Jun 2025 04:24:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750220683; cv=none; b=U0RFZuL0QCnIvcPUK7anxv/sCLnTmusYMsxOVRnUl8q1l0TLy3xPUjNn6LjcDSCgoFvO3u77Zevp74jzn178LUR8DD3TJ3zk42wX1KjaKRkiDEFwd+xjlUzUIWuzzk6iIhWdEf0HRq1t0aiAX2aKNk+8U1JgoA0LVCk1TrME3BU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750220683; c=relaxed/simple;
	bh=2bZIqpioQGHINFU/EiphRLQAzeRmXnkDiiTDnIIiQmI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hOoidbKwEPnUM8YoVn42gO9aN+dxGEpX5vPhRijltdY0WrcA+m+msscJDb/sMhIoDjBe85KIVRUM4o/2on+v6Z++CGULogRStDOCLbdImPqiyscPq4/BdswbsiTwO+W6TI6MtOKQkJTtFJdZ/XV2tVaYJLTFSO1VHfanXFGzj+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1RqjUi/L; arc=none smtp.client-ip=209.85.214.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jthoughton.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1RqjUi/L"
Received: by mail-pl1-f201.google.com with SMTP id d9443c01a7336-23692793178so15514065ad.0
        for <linux-kernel@vger.kernel.org>; Tue, 17 Jun 2025 21:24:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750220681; x=1750825481; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mIb2ZAeP1IApX8KajcoQdMg+K+X03gdKKVOXgy4uxAM=;
        b=1RqjUi/Lqtf8B4bqGv8uCzLjMH/uxDca5PmvLJbmPWGSoNUIbvFxBXM/xCQmX/b7Ul
         N9qSh6HA1j67OsAvAXGEtxnGGMJIAN8EgFEXuZkyZ2dJ4ny0tu/h9W1Rpik9MuidSmI7
         uMseHRLO6OYF4RBZy9lX0COPgPKnG9WewduNITNRCRMzxTwwc8MEkVMnZSqMJGuRkH3U
         C88tWETm53Td1bEipIsQI4jlhUDcElNK4Sw+y7hYPITpACzNsRWAC2Nk1oBBHmHyH2KJ
         NCP69EKiyF1YfcU0eH/fLh9/xz6BO8S4j9lrXU+pJUxxjeU4HrEcIwlC/Zlgjj0ZA0br
         uvlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750220681; x=1750825481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mIb2ZAeP1IApX8KajcoQdMg+K+X03gdKKVOXgy4uxAM=;
        b=uVxSVQ1RVhUWxRU8zq1nKmg+dCh0o4clKdzZib5vXEr1LrcXiY+9l9SU8aggVqWtl3
         h44GD3m9BYmqSUu7i9RuMpa2d9e2vabtH6CjkiZwOOsq6iqtPf6mLq4lpLoWktVLCylQ
         70LAN1aw+8Ec2eov7F8XdBH5uxh5djtG7AoD211V43TS+FFWeWg3l25o47sJwFf7BS8e
         h8LpPGVsGwG67lHxdXa3zFxoW1qSCSMqgFrSd07lalRX2WEzb/CLLyGRug0rbhwJBtfQ
         IJeziuzCY+z8mMAe2Og2ve98CHlhY+nfoqsl7v2+6jxRgjlHJRZcUlbHwXprN6qwStLN
         ssPg==
X-Forwarded-Encrypted: i=1; AJvYcCVFO7+xf50DPY1DoYrylhi75KO/JP3It9BsAYexcPSAsfsS9Zs0zj++nbD23ilQnm9Zg5MS5B422XCGbJg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6VQpOvyabc77MX8GiX+SIhehJ+Xhc85fLTBJqqKGzx4saeChC
	SKiEnLotuMKqXiNflUIE5zxY24av1fSlZeZCCEoUT+rEs3MTEnXYuu3pfUY2DCMTgr2kYFLte/C
	Jf8U8VpYep4shFmkcGXN6lA==
X-Google-Smtp-Source: AGHT+IHIvgUZR0zBF5d+sewo95QOsT/HjDVkEn+tDLrOgLskqZ9xDvbZRR23CwdW2Cit9o8BMVaShYmHas3nnjqN
X-Received: from pjbmf13.prod.google.com ([2002:a17:90b:184d:b0:312:eaf7:aa0d])
 (user=jthoughton job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:903:228b:b0:235:655:11aa with SMTP id d9443c01a7336-2366b17b16bmr234970365ad.39.1750220680638;
 Tue, 17 Jun 2025 21:24:40 -0700 (PDT)
Date: Wed, 18 Jun 2025 04:24:18 +0000
In-Reply-To: <20250618042424.330664-1-jthoughton@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250618042424.330664-1-jthoughton@google.com>
X-Mailer: git-send-email 2.50.0.rc2.696.g1fc2a0284f-goog
Message-ID: <20250618042424.330664-10-jthoughton@google.com>
Subject: [PATCH v3 09/15] KVM: selftests: Fix prefault_mem logic
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

The previous logic didn't handle the case where memory was partitioned
AND we were using a single userfaultfd. It would only prefault the first
vCPU's memory and not the rest.

Signed-off-by: James Houghton <jthoughton@google.com>
---
 tools/testing/selftests/kvm/demand_paging_test.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/tools/testing/selftests/kvm/demand_paging_test.c b/tools/testing/selftests/kvm/demand_paging_test.c
index 0202b78f8680a..315f5c9037b40 100644
--- a/tools/testing/selftests/kvm/demand_paging_test.c
+++ b/tools/testing/selftests/kvm/demand_paging_test.c
@@ -172,11 +172,13 @@ static void run_test(enum vm_guest_mode mode, void *arg)
 	memset(guest_data_prototype, 0xAB, demand_paging_size);
 
 	if (p->uffd_mode == UFFDIO_REGISTER_MODE_MINOR) {
-		num_uffds = p->single_uffd ? 1 : nr_vcpus;
-		for (i = 0; i < num_uffds; i++) {
+		for (i = 0; i < nr_vcpus; i++) {
 			vcpu_args = &memstress_args.vcpu_args[i];
 			prefault_mem(addr_gpa2alias(vm, vcpu_args->gpa),
 				     vcpu_args->pages * memstress_args.guest_page_size);
+			if (!p->partition_vcpu_memory_access)
+				/* We prefaulted everything */
+				break;
 		}
 	}
 
-- 
2.50.0.rc2.692.g299adb8693-goog

