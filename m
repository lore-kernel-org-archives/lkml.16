Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3486928A3EF
	for <linux-kernel@vger.kernel.org>; Tue,  6 May 2025 16:49:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746550148; cv=none; b=u1PRjW0X2/W5mlX6SvYsZrc/WdTEbunnUxAvGrY6S3/syQKuVzPX5aHiZpspO9/EeStAKIlVCbUU1faNRJm4QAVR5LDRGIMLWvCiCz1ZXdHmKsABvrF8uw0ax/CKRbVsPREBhqh3edcE7tUI7PxahXbE4yZpkVO+HNvQhw1VuP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746550148; c=relaxed/simple;
	bh=6nhV7XpN3WZyy+/QohB9tJlpXsrab2K78OgulSH7QaM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LCOyg6QT1rq3CoCGATa4eEOCkiqiNhki5aEi/LnTu7MhlkAUE1dDc5/sqa1l5eHZgOvp+yaQyjC9DdT6p3ttIjzLTrJ+qYvAWFcdFDsIp69/spcaMI4jZGrvcRLM7OxDYXV4qoqv2DL03Fk9DkLCcKchJjBW+nFlF0UvJdpbgm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=z/vXQ5SG; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="z/vXQ5SG"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43cf172ffe1so37656725e9.3
        for <linux-kernel@vger.kernel.org>; Tue, 06 May 2025 09:49:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746550145; x=1747154945; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwe9TWcp7UhmX4oZw7S8iXQCB83ssWQWzCZsAER4ojM=;
        b=z/vXQ5SG2Lb5FFKKn4S6VlCJcTBsktJpLTo4sveARv1pIA8GS9+Ql075PF4DWp+lrF
         Hq7d4NcdYz9nfCZh0X0OZduTofy9NbG0czHwbaBEixnGxP6zjc7hpBYPQQ11UhXQnktl
         og/d/+1I+242Vooh3ZYJy2IpmR7ajfHT2pkIegNi/PKMp9hB0eF5vIHdRLvPcFLxrBaz
         oSeP/VYvNVp4K/6OV8K5d592mW5iCtowOF2khMEvS96vty50J5mgO3NhF3R2XJ2DCbMz
         DX77G0zwAk+vyBUGPUVCWDqwDO+zVcuIJ4447Xv9Hszr5T9bFtQPeXr65eVNF+ALi6k0
         U9sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746550145; x=1747154945;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uwe9TWcp7UhmX4oZw7S8iXQCB83ssWQWzCZsAER4ojM=;
        b=bxa+efWm0Ll+TEnBMzAvg0zKquUPrglh33jUsqCInq1UBlXcfXj2Cs0oD4j5JCShrL
         oyP/i+VPNcHJweR3FKhDUqKmlKm6ERIey7jw1ZkcJVew/Zqx3b83N+KBJFduoxkfBC3k
         LcInom8Mngywz26VJF8JaJc+Kb3bGO8L8ZRB08XmTtmFQ+iPCtGrCWBxMNzQj1EGwHQC
         g8qLjlbQOwX/xcJEWXuZ/bV00hGrrZKHvs6Eyq7Kbqq0dOH/GHUCu2NdzKyv2i5Q3S1h
         0NFombtMcpjaR2nYY4lS5AA3ZxG35dkHGK2taYZLZYMtcaAy/h90/EED1xM4AQzhKqb1
         2okg==
X-Forwarded-Encrypted: i=1; AJvYcCUelkVtHU89R0p0yGQoN4wD/wpeHamTr2yBeSwfKL8uS7sQeFLc7qs0QQn2N+l6glnjdY0pHqlsl3ndvJc=@vger.kernel.org
X-Gm-Message-State: AOJu0YxoHJS+MOwAR3w18Tnb0aVnUTneSrgcdeA58oxnAE8uVmx4DDCq
	WmtHu90e4oHxEeA8d+IUd28r626kpnSLCMwd3TFZj1CWRRN0z4QJHmPBFuoo/kRQBwn+nSgFwJg
	PXEJdC+s0cEg6QwcZdQ==
X-Google-Smtp-Source: AGHT+IFD0lWDGk03I/L52reS0E96znl56Cu/MfnVewrpbgBLyMFf/ajBPFdbrDJBI3q4GHyXoNdIe4tdhRJb9WFi
X-Received: from wmbz22.prod.google.com ([2002:a05:600c:c096:b0:43c:f6b3:fa10])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a03:b0:439:9424:1b70 with SMTP id 5b1f17b1804b1-441d054c884mr38006405e9.30.1746550144942;
 Tue, 06 May 2025 09:49:04 -0700 (PDT)
Date: Tue,  6 May 2025 17:48:10 +0100
In-Reply-To: <20250506164820.515876-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250506164820.515876-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.967.g6a0df3ecc3-goog
Message-ID: <20250506164820.515876-15-vdonnefort@google.com>
Subject: [PATCH v4 14/24] KVM: arm64: Support unaligned fixmap in the nVHE hyp
From: Vincent Donnefort <vdonnefort@google.com>
To: rostedt@goodmis.org, mhiramat@kernel.org, mathieu.desnoyers@efficios.com, 
	linux-trace-kernel@vger.kernel.org, maz@kernel.org, oliver.upton@linux.dev, 
	joey.gouly@arm.com, suzuki.poulose@arm.com, yuzenghui@huawei.com
Cc: kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	jstultz@google.com, qperret@google.com, will@kernel.org, 
	kernel-team@android.com, linux-kernel@vger.kernel.org, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"

Return the fixmap VA with the page offset, instead of the page base
address. This allows to use hyp_fixmap_map() seamlessly regardless of
the address alignment.

Signed-off-by: Vincent Donnefort <vdonnefort@google.com>

diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..720cc3b36596 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -240,7 +240,7 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	WRITE_ONCE(*ptep, pte);
 	dsb(ishst);
 
-	return (void *)slot->addr;
+	return (void *)slot->addr + offset_in_page(phys);
 }
 
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
-- 
2.49.0.967.g6a0df3ecc3-goog

