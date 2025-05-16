Received: from mail-pg1-f201.google.com (mail-pg1-f201.google.com [209.85.215.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC1283C8E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431355; cv=none; b=GIu29NVucNbEQhaSHIkBstcn7bh0XCPUBoWGdYa9BkB0rhTH3WpJ/EmOR79foaaPicFKzEwqfb5sy0b+g5mZkgAke14J1/WMz99WZnmGSgHkxWuyGlY/C55lAhxTBQ3KUJ0y3Lj0mvgbGpdP5AqmEwLsl7RdlkN9Ey6Nbk4fOxk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431355; c=relaxed/simple;
	bh=Vec1LaJROunpusnyM0UhIbnSVhckBolPI8kAYzzwmlU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=XcAt9xbEyDwyYXVoQSjtwVlbHWx2ugRcXCLJZ9KzbY6Kw2Pta7K9eJ5koCFV9vzuOTgbaFSOupF4oNnmvzmFF2xCF5keeQPB0Ux6jd3NlUlrPSaBXxn3lttq5Zp4Z2kwMbIA1Od+pZhIr/xctUcY/lxP0M8F1G3EC9GkWiEyaWg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=38f3hyRU; arc=none smtp.client-ip=209.85.215.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="38f3hyRU"
Received: by mail-pg1-f201.google.com with SMTP id 41be03b00d2f7-b26e0fee459so1429053a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747431353; x=1748036153; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=4V663rFh0jkdB7SoksoChtdcIhj8HRg19/fZOy64aqQ=;
        b=38f3hyRUKv5Hktv2viVfMUFkesdhOkdcANjFyEK6njt3zMH4WSUnpREpUUYVAbb8Jt
         WQruqwkqTdDzb/YqclByShZ9gjUfPzQMXhAf9mjiYrxfS4PaNuTN2gF0aLQMXp0sjsOY
         sJPyiHpHDtlb7iVqwDv+N6DS/Z8juz1N/69lip4E70NgvQtB/X6DO6eaGoHtyQI457Al
         n6Pw1C7xa9L2lz4G0sZmlXZi0cO/Zm9TLNTNCZD1HPASBHp82WUyO46hClub/uI3p9Yl
         6QMnQ6MiTBvmIopqDn/YLIUrdLr/AgGkz96rcR2QIJD05iCbOu7k82D/uFV7houkpn9I
         9hLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431353; x=1748036153;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4V663rFh0jkdB7SoksoChtdcIhj8HRg19/fZOy64aqQ=;
        b=gLrF48D/gW03EwZpJUopAvZ4MgXC2Gmt5UCfIPTk3gCRUudpwMqDlO3FotfJnQi+1r
         l9DN60V6g3/H1lyn0XvN/OxTYiJ2Ydq2Rt7BbAa/o/70FpBGbPQ/e3SwtgVcOn0Uw/pM
         OdhyiyaaCFuNCcfj2YEB2zVNqAhB0+PIE4Nb+OTJkENqOHarsZoXoKzPu1dCskNCBv6o
         Z+GjZlKcWfgAIrkBnks0kwOHmLdfQUdPcyVLNtAM7CYjAaOs+1gExy/tIe61yazvowvd
         EGyhowwo24GP5ilSEu54LPgK1H0Dw+2DZsA7nEn5HXdBM7lpwRLsqZEKe4ieNVQ+Mo8G
         4drg==
X-Forwarded-Encrypted: i=1; AJvYcCVCshpksfVAH4tZxZZa7Naky8V8sJYpWJrt1YpX637f/d/nwMuFF+y2hQ/TvyqnjnAxi+6l9i+9o6gGNEA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyF8JZqSwxv+7TcecJzdHxj6xykwQ/lQd/eBwatUG8z6MPxae8u
	xZM3OhmejfJtJ3Rfk04PZsDcLuFqDuPEwJ2PAe/1rMivXuA4QI06LuRN3fbVtMnS2TFIYa+dIiR
	AuC/GnA==
X-Google-Smtp-Source: AGHT+IHTShpa0P01pbMtjz7mDDMOXo31hETLUMs1wvsmqDIdr8kGVg9NIsmrYu0AlJiKZALyAjJyizqyiqw=
X-Received: from pjbrs6.prod.google.com ([2002:a17:90b:2b86:b0:2fc:d77:541])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:2d50:b0:2fa:3174:e344
 with SMTP id 98e67ed59e1d1-30e4dbb700bmr12723672a91.14.1747431353067; Fri, 16
 May 2025 14:35:53 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:35:40 -0700
In-Reply-To: <20250516213540.2546077-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516213540.2546077-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516213540.2546077-7-seanjc@google.com>
Subject: [PATCH v3 6/6] KVM: Assert that slots_lock is held when resetting
 per-vCPU dirty rings
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	James Houghton <jthoughton@google.com>, Sean Christopherson <seanjc@google.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="UTF-8"

Assert that slots_lock is held in kvm_dirty_ring_reset() and add a comment
to explain _why_ slots needs to be held for the duration of the reset.

Link: https://lore.kernel.org/all/aCSns6Q5oTkdXUEe@google.com
Suggested-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/dirty_ring.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 54734025658a..1ba02a06378c 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -122,6 +122,14 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 	unsigned long mask = 0;
 	struct kvm_dirty_gfn *entry;
 
+	/*
+	 * Ensure concurrent calls to KVM_RESET_DIRTY_RINGS are serialized,
+	 * e.g. so that KVM fully resets all entries processed by a given call
+	 * before returning to userspace.  Holding slots_lock also protects
+	 * the various memslot accesses.
+	 */
+	lockdep_assert_held(&kvm->slots_lock);
+
 	while (likely((*nr_entries_reset) < INT_MAX)) {
 		if (signal_pending(current))
 			return -EINTR;
-- 
2.49.0.1112.g889b7c5bd8-goog

