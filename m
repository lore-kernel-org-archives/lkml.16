Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4F26267B73
	for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 12:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747831868; cv=none; b=pd9YttX13q/FlVVRmR+AI5EU6eRCd2RrgpzciqvFCeoYg5pPGPoLVs1mdqTwqQL9QrkNH8HsOYD0fV3C0lkqx++2wNkqt0naSr90Zo+AVw2nqBZW9eKurSf/5ToiBiJ625tvcE6VWl2s0ez9y0EiPxAJelOqSSo7L3soi5ltQnk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747831868; c=relaxed/simple;
	bh=i60uoZKPYYZP5QG1SLs+Mxw0GCgSs0Z3YuYOlmJgTz0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Ws3ajTEIyMgOSAZuV8S83sMo78SykC6TeygyTbfXAYJWoWnA2mp52IxGNDW1ji6wzjD/wC/DpE+zwxwy0hloG4GbkTXg+j6CJdoegmEuybzsfdCR9VqZqULxg76Ug5q94nsXMKRNT5gd0awrAgEKAod+0cA8E11uX0xyikNDQ+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=D6in46YI; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="D6in46YI"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3a364394fa8so2314523f8f.0
        for <linux-kernel@vger.kernel.org>; Wed, 21 May 2025 05:51:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747831865; x=1748436665; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=mT8By12179daVSqWK2hMkVVh9hr6dmc7nTaRRdzemjw=;
        b=D6in46YILYHKclS0yRD2auEIeqZwKL/3gtxR0QD7vMtUq3K2VB/PorPjE9J7iLAulD
         IHIIoVrolbt/8k/xHhq8c6b/L7JtgedlFTGH/w69R62+tAyNRd8HERja+R5qfTkERmhT
         FRoiSnfJCG9PbhsfflQdNGv/4FgcAu77hk4Xy47F1679Z4bCWT9mKT2k4c3uvJctKM0/
         DNdAAnKYD+JapPsXWdoeBpposrwdIAhFq5esw3GxP2Co6onuDL2gdrewIHgxmhR4E2jf
         vFTcCw9tbNeDq0nSr7Omk7D3luL2/JILwP5N+issg2EnjSuTITRd5trNo6hQsDFb5qKg
         DaJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747831865; x=1748436665;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mT8By12179daVSqWK2hMkVVh9hr6dmc7nTaRRdzemjw=;
        b=czJWY73W4O34WqTs+p+FOEtEHeiFTLf+HDKcvSS4c4Gk7OXZuk+rfAYZ440m+yqu+C
         nbjViW84rZw68YTP0eM7oryY6vXjYLRl1fu1UEUenVTFuSL/QO2GFsqO1GspJ31mFvU3
         XhHA2mKjr4yhB+gK1O2wKnLy36iRGHH9tDNw9fQhP172B/2n0zUzRanBPW7AvLmZSP+R
         aH4zuqZotWtkQ+BAtDB8EYWGX2qj06SqjABQAicFVhDVGlboYF+wFrGYH7KPtcOPO5ww
         ikGGe0zNc+nEexd/nVV6RCKcpjAS4YSvfiL/DRrUeu1S0IL37Xe5QB0zd5DTUG1lHfrc
         85pw==
X-Forwarded-Encrypted: i=1; AJvYcCVBXGlTiigfw4pG8LwagXKF4x3PNFzbxSH7Jbw3adO2bpBJXupr6U5xMH2JjKa3+JPKu/yp9AAnUWa/w1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjGMijIDdO/HZ0gD/NrYHsBESzN/BU1ilrVJiIPnHKhSMSssp0
	Mj5UJRUtJMw9Pd4z/R2k3tVRyxAvu9r+qbH8AP/45uwfvTqDD/vhIgjM/zzkvvbfS8gGkskF83V
	NIXpznlca13QQJecoRgjk1A==
X-Google-Smtp-Source: AGHT+IFxvQXC5e2XyrcGIorm9ck7St5THzNwlwqWNw3VZYKE1iTJWfhId/APZ3vzvHKNI9cTFqGba3uEmZNIfYCd
X-Received: from wmbjg9.prod.google.com ([2002:a05:600c:a009:b0:43d:b30:d2df])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2384:b0:3a1:f684:39a7 with SMTP id ffacd0b85a97d-3a35fde361amr16068713f8f.0.1747831865060;
 Wed, 21 May 2025 05:51:05 -0700 (PDT)
Date: Wed, 21 May 2025 13:48:25 +0100
In-Reply-To: <20250521124834.1070650-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250521124834.1070650-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1112.g889b7c5bd8-goog
Message-ID: <20250521124834.1070650-2-vdonnefort@google.com>
Subject: [PATCH v6 01/10] KVM: arm64: Handle huge mappings for np-guest CMOs
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

clean_dcache_guest_page() and invalidate_icache_guest_page() accept a
size as an argument. But they also rely on fixmap, which can only map a
single PAGE_SIZE page.

With the upcoming stage-2 huge mappings for pKVM np-guests, those
callbacks will get size > PAGE_SIZE. Loop the CMOs on a PAGE_SIZE basis
until the whole range is done.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index d1488d4e5141..c18d4f691d2b 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,32 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
+
+	while (size) {
+		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					  PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 static void invalidate_icache_guest_page(void *va, size_t size)
 {
-	__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	size += va - PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	va = PTR_ALIGN_DOWN(va, PAGE_SIZE);
+	size = PAGE_ALIGN(size);
+
+	while (size) {
+		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
+					       PAGE_SIZE);
+		hyp_fixmap_unmap();
+		va += PAGE_SIZE;
+		size -= PAGE_SIZE;
+	}
 }
 
 int kvm_guest_prepare_stage2(struct pkvm_hyp_vm *vm, void *pgd)
-- 
2.49.0.1112.g889b7c5bd8-goog

