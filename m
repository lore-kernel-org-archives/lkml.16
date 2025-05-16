Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 054FA283140
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 21:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747431353; cv=none; b=Po0J1G73XpypOglOX6Y6hFwfEEVCb7aqA7fdKI/VwNa4AU4mf3WPJKlJgH09ViCnpv+rR0IcultwX3REDtvmjPhY9xC0IuL/KHUNoZGEKlmS3nRMOMFLEIKkZAnQ8izdv9hYffs2v+aCtjK82wa0ZGi+DLqKPwVUzfW1cn3Lrl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747431353; c=relaxed/simple;
	bh=it/UrIDf2OFvaNHNDtjuW+PbzU1ouQngBb1IuFpC9X4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=BuQL4zxRn7VEswqMn9ZsMlS5VQvA+csKuMA5ab8XokRL8J6x5ffznbTY9zA4AgrAtBBipGbrpWDelLjJ+t1+KS9tUYEskMpClPD6WUVgMc3ZJD3jEFYNDKQ8kfzz0CEaW0FNWT0J8btJNYWda3bb5Yn+sG4lKFuomma/7D7HMBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f1UEsmk6; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f1UEsmk6"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-b26e278dd1aso1288499a12.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:35:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747431351; x=1748036151; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:from:to:cc:subject:date:message-id:reply-to;
        bh=oH92jyyUzDF22FMyCs7nXQd1z4bypvI1sQANzrXDq1I=;
        b=f1UEsmk6U/aXewlUVnu06jrHYnYAdgeFZL+/RncLDQTi8ZDQj58lSxHS+JqR+lFdYq
         rWwSks1DxzPxNINp7VulAvlcUhrW68jfZkAFv46x13tcOp1LAihrPc1Gm0kdrMw9e6lT
         uiFQcOhAukYELpUs/SOj7ARBxS0cD2562p7Ynd0VVAzkwM+U1euMQM98eGnKfOT8hnnb
         FtUQOGcQi2Mxhy3nFrQmnJb2pIezE2x2Xqoz+n66VdS0kCfAuB45yA8XJUWYYaIBrMsl
         TO/AIiXXPDJW5heI/2dKNP9cSimzpk9PDr6GFL5kKt5Rx8CST3ybC4RvI6fbsE1WOZnY
         nMdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747431351; x=1748036151;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:reply-to:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oH92jyyUzDF22FMyCs7nXQd1z4bypvI1sQANzrXDq1I=;
        b=NyE4KdzZAd8nr0ExOBTYNsU3Epuubdu1uighnNPp2SAgd2tIMdsIVHEhYoWy8oLO7v
         YpwOPIeZ138Cw2LKN6pDzuxxxE/Dln34ifu0jVefqvcWUZgoMuy7w1h4zhFMyt+qgKoU
         9uaT5QK931DjyL/UpsPjRqtdI0cWc5bwsJCBaVMmviO2V5LjWr7TgU7GIDqOONgPkX3E
         oExBEYf2gdnyRvBDOGHLASJjd6OkIyiRsXGRlET2ZdNUcOUYxx/HREdLa9X3CNzEfiXL
         HniodFByX8L9yVee0VXc51kc5dfktJjJZv3iCtwtasvC4839UDB0wZGJbuO1QcBXe1vQ
         sfJA==
X-Forwarded-Encrypted: i=1; AJvYcCUa7jpaOa1Rjhi8yp9KNIqJQEpb9sJVWnNZ/GhNB9Vk4Jw1t5MC3Va4yxyxNBXQ8Q24pkIwCddt88kmtSY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyNf7vArIadIwTZHUgbDexRV3XTbuDoT+8vA1z3OVcTYUHPToy1
	dMYeeut2J6w2TV/pQ2evSYnZgvoOdmBA3APnU5aAzUWSMBxBLSMZjYcslcCV8gBxgNxOUUabV0j
	jtGQ9vA==
X-Google-Smtp-Source: AGHT+IG2XVhlAOS9mgw1KfyR0RdP6DuXNaKfftHf9CchOumLAZ3MSmb/leSlBEVbaGW23ke+ZRQXGORc/mY=
X-Received: from plkb7.prod.google.com ([2002:a17:903:fa7:b0:22e:50c9:c04b])
 (user=seanjc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:320e:b0:22f:b69f:e7fc
 with SMTP id d9443c01a7336-231d45c1151mr65220685ad.49.1747431351295; Fri, 16
 May 2025 14:35:51 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Fri, 16 May 2025 14:35:39 -0700
In-Reply-To: <20250516213540.2546077-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516213540.2546077-1-seanjc@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250516213540.2546077-6-seanjc@google.com>
Subject: [PATCH v3 5/6] KVM: Use mask of harvested dirty ring entries to
 coalesce dirty ring resets
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Peter Xu <peterx@redhat.com>, Yan Zhao <yan.y.zhao@intel.com>, 
	Maxim Levitsky <mlevitsk@redhat.com>, Binbin Wu <binbin.wu@linux.intel.com>, 
	James Houghton <jthoughton@google.com>, Sean Christopherson <seanjc@google.com>, 
	Pankaj Gupta <pankaj.gupta@amd.com>
Content-Type: text/plain; charset="UTF-8"

Use "mask" instead of a dedicated boolean to track whether or not there
is at least one to-be-reset entry for the current slot+offset.  In the
body of the loop, mask is zero only on the first iteration, i.e. !mask is
equivalent to first_round.

Opportunistically combine the adjacent "if (mask)" statements into a single
if-statement.

No functional change intended.

Cc: Peter Xu <peterx@redhat.com>
Cc: Yan Zhao <yan.y.zhao@intel.com>
Cc: Maxim Levitsky <mlevitsk@redhat.com>
Reviewed-by: Pankaj Gupta <pankaj.gupta@amd.com>
Reviewed-by: James Houghton <jthoughton@google.com>
Signed-off-by: Sean Christopherson <seanjc@google.com>
---
 virt/kvm/dirty_ring.c | 60 +++++++++++++++++++++----------------------
 1 file changed, 29 insertions(+), 31 deletions(-)

diff --git a/virt/kvm/dirty_ring.c b/virt/kvm/dirty_ring.c
index 84c75483a089..54734025658a 100644
--- a/virt/kvm/dirty_ring.c
+++ b/virt/kvm/dirty_ring.c
@@ -121,7 +121,6 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 	u64 cur_offset, next_offset;
 	unsigned long mask = 0;
 	struct kvm_dirty_gfn *entry;
-	bool first_round = true;
 
 	while (likely((*nr_entries_reset) < INT_MAX)) {
 		if (signal_pending(current))
@@ -141,42 +140,42 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 		ring->reset_index++;
 		(*nr_entries_reset)++;
 
-		/*
-		 * While the size of each ring is fixed, it's possible for the
-		 * ring to be constantly re-dirtied/harvested while the reset
-		 * is in-progress (the hard limit exists only to guard against
-		 * wrapping the count into negative space).
-		 */
-		if (!first_round)
+		if (mask) {
+			/*
+			 * While the size of each ring is fixed, it's possible
+			 * for the ring to be constantly re-dirtied/harvested
+			 * while the reset is in-progress (the hard limit exists
+			 * only to guard against the count becoming negative).
+			 */
 			cond_resched();
 
-		/*
-		 * Try to coalesce the reset operations when the guest is
-		 * scanning pages in the same slot.
-		 */
-		if (!first_round && next_slot == cur_slot) {
-			s64 delta = next_offset - cur_offset;
+			/*
+			 * Try to coalesce the reset operations when the guest
+			 * is scanning pages in the same slot.
+			 */
+			if (next_slot == cur_slot) {
+				s64 delta = next_offset - cur_offset;
 
-			if (delta >= 0 && delta < BITS_PER_LONG) {
-				mask |= 1ull << delta;
-				continue;
-			}
+				if (delta >= 0 && delta < BITS_PER_LONG) {
+					mask |= 1ull << delta;
+					continue;
+				}
 
-			/* Backwards visit, careful about overflows!  */
-			if (delta > -BITS_PER_LONG && delta < 0 &&
-			    (mask << -delta >> -delta) == mask) {
-				cur_offset = next_offset;
-				mask = (mask << -delta) | 1;
-				continue;
+				/* Backwards visit, careful about overflows! */
+				if (delta > -BITS_PER_LONG && delta < 0 &&
+				(mask << -delta >> -delta) == mask) {
+					cur_offset = next_offset;
+					mask = (mask << -delta) | 1;
+					continue;
+				}
 			}
-		}
 
-		/*
-		 * Reset the slot for all the harvested entries that have been
-		 * gathered, but not yet fully processed.
-		 */
-		if (mask)
+			/*
+			 * Reset the slot for all the harvested entries that
+			 * have been gathered, but not yet fully processed.
+			 */
 			kvm_reset_dirty_gfn(kvm, cur_slot, cur_offset, mask);
+		}
 
 		/*
 		 * The current slot was reset or this is the first harvested
@@ -185,7 +184,6 @@ int kvm_dirty_ring_reset(struct kvm *kvm, struct kvm_dirty_ring *ring,
 		cur_slot = next_slot;
 		cur_offset = next_offset;
 		mask = 1;
-		first_round = false;
 	}
 
 	/*
-- 
2.49.0.1112.g889b7c5bd8-goog

