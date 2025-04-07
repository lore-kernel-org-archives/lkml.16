Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C8D226D0F
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744014456; cv=none; b=VsnqQIJb8NT4kYgoum3z73jVAU6I4R5RI+pe2JkOSCuLt1jM8R7wud16XxdMJEuW2ltXP0M/rPuD2Ja0MGF5VDr7tC6hBuA9Sj8gnn4L9L1WEsecdqBPJy91rfVKr+SsWWLCmxoWp+b6d/kST49VHvcUYe3T/zqEMPS+k9MRHGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744014456; c=relaxed/simple;
	bh=uyGJyVdm3PuN+alby9AYULNVVykMkqtNQdizjxSG9ko=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bWqD3r8p2J0Bgt/fmq3JUV5lLRzu1nGscMORgcPjsPZ3xBCM2rRmE3GgzslSGGDQFCqIP7QH919vdjMSjRhYtfgE83tHU76YpLG3kUgHk/kwePJgeJl/NMALGh4+3pc8K+VIczOBp5UOzLu/tOZXp8PxdZ5tZL0IbY5fgDdNkgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tajwix9h; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tajwix9h"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43d51bd9b41so35888005e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 07 Apr 2025 01:27:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014453; x=1744619253; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eamk+m6hItJvvYURRtivMfLvxKXUv+N3LqKXR7/o518=;
        b=tajwix9h8sXjuvYgo1ytOVgnafIlXSl0yI+r9ELNpHGD4XiCQQmGZmLW5TNlVw1EFq
         rbNay/95cUET0roLUvZ+mOLdLUiE/h7WR8eIkDuIaTt95193EtyrqKLn/dp/PwjRurmu
         pcH6ufh+7WnwWYjFDD6JFq4eJ0Cb7FSX9MjmtMclrnHkil9ci7+Bd/1hZcTjK13ln7rC
         ZFiieN22tq5sgERNAZ/oXO+ARZpXqAA3gmng8MCxhpb5EeI9yWEGIjQx8Z6o1ZWQm22V
         WAEoaKqpNvtqxI3LbihjFpnpR/jYFYns9RgXLH+46W7FxmrZa98lv7b1S0tYtnb5SAFx
         dEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014453; x=1744619253;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eamk+m6hItJvvYURRtivMfLvxKXUv+N3LqKXR7/o518=;
        b=mUACIXCJ7NuXB5b4KWvzXij/JwWSbPsaPeQ75noDMwUX/Ety6hMLPk6lZ1AhkwniNK
         BtpVnCeFkC9ljIQQ4HFML5EBRPcFQuSQ+9SQgVK6CSJO5Uh8Yw5+Vn5j6EYCQo+o9fta
         x9zdsG7VfpFv75vuHgn/GTvvq3MbV5eG3wSuLPazmRjUGoVqncizA04idSD4rnjZF4zB
         buzOzw/5NAQg/m2rc0gKiA6mOcuGSnq/LQuJQpLgyUT5340qeoCOJ7iVbmE+0OQ5CWzY
         G8kSZGq2g5MtmYlZQP6c+ModkAYXmBJTtyml6wFp+KZ3np/BvzcuoAFU8g/HGJ39/w/A
         DhKQ==
X-Forwarded-Encrypted: i=1; AJvYcCXAaJP5acC859b0j3ZbX1DRtf3sQYL7UB33zm4sVAM9jANtEqFzYJ1revxVOPgWrtES36+BOCrounE54uU=@vger.kernel.org
X-Gm-Message-State: AOJu0YyoyByqcZzZmzPj8jwMlXqncudDhwYcNDUNHPalAuPXOI94TlIK
	7//Bws/g8Mvt71eQ5BYLvXOS3e0ahI5F+hdZB7VrMGrnOzL0BuAqmFC081j5gwuFdMZr+7zYufk
	VRFLVvzjuXZ12HN3YPg==
X-Google-Smtp-Source: AGHT+IHEfDdtZEMKCFIiHPdGqbLmomiVEbcScZiVB7Z9bOtLoQQDsPDC5tGrnKssCX7IQ10njG1t/CVa1RWO127b
X-Received: from wmbep23.prod.google.com ([2002:a05:600c:8417:b0:43c:f6c0:3375])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46d0:b0:43c:e8a5:87a with SMTP id 5b1f17b1804b1-43ed0c6ba07mr107917445e9.16.1744014452806;
 Mon, 07 Apr 2025 01:27:32 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:26:58 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-2-vdonnefort@google.com>
Subject: [PATCH v3 1/9] KVM: arm64: Handle huge mappings for np-guest CMOs
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
index f34f11c720d7..6a90e7687f1f 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -219,14 +219,28 @@ static void guest_s2_put_page(void *addr)
 
 static void clean_dcache_guest_page(void *va, size_t size)
 {
-	__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)), size);
-	hyp_fixmap_unmap();
+	WARN_ON(!PAGE_ALIGNED(size));
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
+	WARN_ON(!PAGE_ALIGNED(size));
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
2.49.0.504.g3bcea36a83-goog

