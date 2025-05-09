Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B924A2951A1
	for <linux-kernel@vger.kernel.org>; Fri,  9 May 2025 13:17:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746796636; cv=none; b=fO/IBk1UtnOjOJEqQ/pcMhQuRi/gknLsyL8V85QIEj4XtdT2Drg7W3VzY/nlP/mcs2NNxbzeAwAiFkyRh7GyjM1zR2m1IWkuKcd2OjFFrKRmmkTw8boYVYptDjmYIRct+Aty6ii9dFicehJiqXJee7Tlg8qRdq57c31dEnNnh2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746796636; c=relaxed/simple;
	bh=1KIC4nYkrn3JhyQ1inoc70Z27yDXEBHxrexWlAto368=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=SD0Meb0R8JlblG39p7EAnJfgPx+ZEAmqXSHkasQ+9/dC5pDhD9aVqi1i2gQ7Kg8VBY0T5k4m+5rl+eOpRI0QwJQKyZVDR5D9RHweRItHmN+PlHD2pGRHLE4uNccV1aMATXJZPZjtCeUlApywrwM1Qu7l8Xgu+gnFiJLgoe76/8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=y7O4aWSR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="y7O4aWSR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43efa869b0aso14592215e9.3
        for <linux-kernel@vger.kernel.org>; Fri, 09 May 2025 06:17:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746796633; x=1747401433; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=IP6ztp/+QPDQJCJndD5+6IALkAYC7lh/LyjGCv4sMT4=;
        b=y7O4aWSR5fywvPyOWfbJZEJZ47LB+fSgRKuiLBiyAvToTV4itLobd+d9sqaGGBUv9I
         XfVnhPnVvDaI1ge5/i1ZaA7ipovtTOgasdrJeCELEXcw1uPypypApD4hAGph3KK75jj5
         CJLtt2wJme8qebnQPzq8SX8qPD6LBE8Kl74dW7H1D4omE8yk9yY9aTOQN/nu9BP/UlZl
         60akeVCXEEnuVsfz7RrqUaqm3HFIbjjqH6rqcUUVpG0r/ZDk3bKFFETAYq1gNQK9gGMn
         c+2fuEnh5zcqEWARt8zFadEtc7VGoL1x+x+Lm5hCgbRuHv5szPhU8BDTfpiITeCVhYUH
         3Aug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746796633; x=1747401433;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=IP6ztp/+QPDQJCJndD5+6IALkAYC7lh/LyjGCv4sMT4=;
        b=DN8LwlyCWeX+aBmKleFVpwxj9boM2XO7QYQP2W3QQbfw9lmeYriKj4abCXqSpiFMPp
         EQGfV0K4BKqKokTD/lxYPrIbq6C+yTBuc9GZRvgS5XytZ6bBkUeF8AQe6YtLqZOuwEkz
         FKBRuKlO/WWzMwpeIRnoHhJcAeYE6THRKQArv7qSmA1wx2SqQAAnpX27HAkjMR8w7N6P
         HRiW60PKVBxnfaktBntCgHrE/4BUis3uggIh+xhI1ZYgojzeE74W8BZoeI5lBGlZ6SFY
         4FvSB2ybvo/Sq325/eD5L+NfUvZkvfMFODZIIpXP+hHYwVI6qdtBdjk9SPkVWMuxDUt7
         oxsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVwYAZ41OFZjWzIZzSIgam0Dd5yYJO3RGsN/8ZQP44HRVYflKa8ebPZq1xqLQMijGJGjzxrMjdpJpRzt68=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMaAMd1EWtVgF05uAywVswJ2EQBDHvEXPY+xi9zNKKnQmE6qbQ
	vj9JAHdprQDdgaWdoOwADI/ELAybVFPrIpje7s7tG5lNe2EB6eld6hFS8rUoNawl31TGKbWQhyo
	X6joR0PnDBJvQkaTm2w==
X-Google-Smtp-Source: AGHT+IHLhslOxv//qelYYDwLSjir28eVrMuxSKOMq29v/O516ODc7zyiSCdmfJB48+QjIQHo3PdA4xoToUMrdg/4
X-Received: from wmbep11.prod.google.com ([2002:a05:600c:840b:b0:441:b3f0:c46])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1e02:b0:43c:eeee:b713 with SMTP id 5b1f17b1804b1-442d6db8d1bmr24441515e9.20.1746796633145;
 Fri, 09 May 2025 06:17:13 -0700 (PDT)
Date: Fri,  9 May 2025 14:16:57 +0100
In-Reply-To: <20250509131706.2336138-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250509131706.2336138-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1015.ga840276032-goog
Message-ID: <20250509131706.2336138-2-vdonnefort@google.com>
Subject: [PATCH v4 01/10] KVM: arm64: Handle huge mappings for np-guest CMOs
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
index 31173c694695..23544928a637 100644
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
2.49.0.1015.ga840276032-goog

