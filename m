Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B859226B0A9
	for <linux-kernel@vger.kernel.org>; Mon,  5 May 2025 17:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746466340; cv=none; b=ulh96CqHntwFOPsz4a2sSLec9vY3w4ugPI/5ofTCwlcEfyVouSRMY/z2jytyo6JtuPmle/WjSTtfs+Q9Q/8/+hAqRApVBoi9ytKTWTjOofTtzUvyoBpItmg6Wr+NcyunXv+Ymol/Sx6T6GRY7IPjfktGV6UitGMMSMClrToTtF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746466340; c=relaxed/simple;
	bh=Sirt4gr8r2sZgygHZ7WpIIJ0uwlYX2WulgE8mLU8plo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MZiSTXEwPGUrLTrHaG4BuJ+hwOwem7xpMaam+FSPSDeu10+E7wqBrJ6HeEznXdvoxyQ+8MpF5HXTT5hxQ+h2hAbAC9i/e+qYT+jqh5N+RLaECtSOqRRYWvch8jRqnZu3/ZNXuYP3EOMkyNeeld3U4hYldEU6w2rqBemb41Adg4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=VnKDC/kQ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="VnKDC/kQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1746466337;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=JjAxyTaB2HZtvewgEgyYKDE4ThQVrWuUNuivvsqnLN4=;
	b=VnKDC/kQEWL7ywPq6slUWFdLrlAgBb5Q1a2Xb28QFnTeuawMGw/dbDLxE7Gn1nCQysZnyH
	2cn8DQRAkM/2wa2ITAHW2++QJ0MIlKgBKkWEosBdoaXndUv+/Q62myddz6x9VZDpfuQ1dR
	1Bh+sSOQV8Tlqk2OvL+MZ2IQWHpMtnE=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-682-1hVR47jAMXWm7iOz7TjFrA-1; Mon, 05 May 2025 13:32:16 -0400
X-MC-Unique: 1hVR47jAMXWm7iOz7TjFrA-1
X-Mimecast-MFC-AGG-ID: 1hVR47jAMXWm7iOz7TjFrA_1746466335
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-43eea5a5d80so25208355e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 05 May 2025 10:32:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746466335; x=1747071135;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JjAxyTaB2HZtvewgEgyYKDE4ThQVrWuUNuivvsqnLN4=;
        b=nkCcEg0abqU/sXaBxVsaLrgZXCzzji9zLuelq97L3kSOg5ohDhu+3J6ZyC19FKcvmh
         eX2dibOUMXt0Y3vojTm+ctJdzR4twnOS1BnGWp65PEmE5dOp3nA50JOLQXARIUzME5N4
         pEGaE3woCV5t3eEvveCCXxK+GFxaLHcaQTI5ZiS1K1ROVO5PubuiJ9RFxLqG8JciE42u
         4+FGu2Mc0t3PkFNRoSojiVP449Ah/EkMrBSINXxypCl02Rmg1klycZ7JHq9QHR9WuHCi
         bKjpsAg9t80paczcgEFN/lMNBBrHQZzuLOzSfhaoPcPhe9eYei13EEHudy2qJlmqvPFo
         Jsbg==
X-Forwarded-Encrypted: i=1; AJvYcCXsfbBeWf0cE78dh8JfICENFnYvJpyOvz/+DlZdYnrdDvCaq+s1i+dMDxW+LsbiilvJaX4I2A2tFWANFfQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS8wX7yrw4RFZfH3CGQFyJbuJ0oTw64+IbzjdnUZgsCXK5dRP1
	jZgs5Mv9c74g1IugCjqRgwEqUe7NiObVfiham6ekwrJDG9QPqarH10xIYx0027cexLAnf1weIuP
	J/S4drfl5ir6ioj8L2w8LFBdIL1nRiF69gtVcV2c/9rrs/OhrftiZS43/Yg3Ngw==
X-Gm-Gg: ASbGncsTCfMNyKsy2yHx7ZbCPWwTGp9TdaapKXC2EV7eA6qb3nuPDM1wQNa/tWgL5JN
	A85sjcp7WI/aFSI3nZd/IC/ZW7s1Fhr57DQtzX6FNIHLtFkvPjnnYKLL+azBtiuT2PEDwVckMrv
	8YydMvILjm7TsUE4MYn4c2AZxP+2W8mjLmqtVpP0OyNxUyEc/1Qux7nEySnonEhuQdCJqCjwB8S
	Djs6F5m4K5HDeyGXdi6/JMZfeRXU+M6vE2PtTFR9uuyl/L49sSJZ//jv1ToOXCHn2cF0DE4MvFk
	eflpYJ/UHUbRMZ3xYEC58MTWC0EdGlqC7ziMwB/Tad3Ti3QoXR6K+hJTnRbaFAi5YO5zTD9oxw=
	=
X-Received: by 2002:a05:600c:a401:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-441c525facbmr56096285e9.21.1746466335025;
        Mon, 05 May 2025 10:32:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFILc2vKI3/xP04PnDAD0gBqfLoTJ7gk5HkYL4nRmV2jGTs1rwbkDQtRYRRFH+l5ESk0GD4dg==
X-Received: by 2002:a05:600c:a401:b0:43c:e2dd:98f3 with SMTP id 5b1f17b1804b1-441c525facbmr56096055e9.21.1746466334623;
        Mon, 05 May 2025 10:32:14 -0700 (PDT)
Received: from rh.fritz.box (p200300f6af1bce00e6fe5f11c0a7f4a1.dip0.t-ipconnect.de. [2003:f6:af1b:ce00:e6fe:5f11:c0a7:f4a1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a099ae0c3dsm11343310f8f.12.2025.05.05.10.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 05 May 2025 10:32:14 -0700 (PDT)
From: Sebastian Ott <sebott@redhat.com>
To: Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>
Cc: Quentin Perret <qperret@google.com>,
	Fuad Tabba <tabba@google.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	kvmarm@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Sebastian Ott <sebott@redhat.com>,
	stable@vger.kernel.org
Subject: [PATCH] KVM: arm64: Fix uninitialized memcache pointer in user_mem_abort()
Date: Mon,  5 May 2025 19:31:48 +0200
Message-ID: <20250505173148.33900-1-sebott@redhat.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM") made the
initialization of the local memcache variable in user_mem_abort()
conditional, leaving a codepath where it is used uninitialized via
kvm_pgtable_stage2_map().

This can fail on any path that requires a stage-2 allocation
without transition via a permission fault or dirty logging.

Fix this by making sure that memcache is always valid.

Fixes: fce886a60207 ("KVM: arm64: Plumb the pKVM MMU in KVM")
Signed-off-by: Sebastian Ott <sebott@redhat.com>
Reviewed-by: Marc Zyngier <maz@kernel.org>
Cc: stable@vger.kernel.org
Link: https://lore.kernel.org/kvmarm/3f5db4c7-ccce-fb95-595c-692fa7aad227@redhat.com/
---
 arch/arm64/kvm/mmu.c | 13 ++++++++-----
 1 file changed, 8 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
index 754f2fe0cc67..eeda92330ade 100644
--- a/arch/arm64/kvm/mmu.c
+++ b/arch/arm64/kvm/mmu.c
@@ -1501,6 +1501,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 		return -EFAULT;
 	}
 
+	if (!is_protected_kvm_enabled())
+		memcache = &vcpu->arch.mmu_page_cache;
+	else
+		memcache = &vcpu->arch.pkvm_memcache;
+
 	/*
 	 * Permission faults just need to update the existing leaf entry,
 	 * and so normally don't require allocations from the memcache. The
@@ -1510,13 +1515,11 @@ static int user_mem_abort(struct kvm_vcpu *vcpu, phys_addr_t fault_ipa,
 	if (!fault_is_perm || (logging_active && write_fault)) {
 		int min_pages = kvm_mmu_cache_min_pages(vcpu->arch.hw_mmu);
 
-		if (!is_protected_kvm_enabled()) {
-			memcache = &vcpu->arch.mmu_page_cache;
+		if (!is_protected_kvm_enabled())
 			ret = kvm_mmu_topup_memory_cache(memcache, min_pages);
-		} else {
-			memcache = &vcpu->arch.pkvm_memcache;
+		else
 			ret = topup_hyp_memcache(memcache, min_pages);
-		}
+
 		if (ret)
 			return ret;
 	}

base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
-- 
2.49.0

