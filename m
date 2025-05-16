Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F07C1DB92E
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 13:41:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747402865; cv=none; b=KpoF1GxrfoK4wnIUBfDoJrrN05Q/h4PhjAjc9ZcyoMfGzq1MQC9kGVg332rblPEM2L5we3DdXtcj8q9rzk17Vj3DHOQsy3XnK0SpElKnGb0sgFPZyXoKk1quW32GOVUzPvcFRje2vLd0i2PklI8cEgmXVXhpbaTa/LuGWpQdj4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747402865; c=relaxed/simple;
	bh=oIK25k9bycvTVzsTkwmIx1RZPV+DV84Nx1oo308pa9M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UuqT2osqQAaiRylw9bZ6WqtGkOpxjHR2RZU2Vjzcbbh/+PeIWDXCLcvXACZsTt72ZVN3OnojZpkxkw7v49d/RKUZkvZppF2SX+R1X+wcxUYInRRHomVuklpWB2uK4jO4SztNzNuM27IdJTksO7Jgg/D5TAdS8UGdTM5uTSY/z6I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=S1RqXikK; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--vdonnefort.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="S1RqXikK"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-442cd12d151so15587165e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 06:41:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747402862; x=1748007662; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ROhVGMzsFKUKcbl+uc4M+NtezlfJHXVXpAYtpBvAgk4=;
        b=S1RqXikKZ24dnAKx8gKpDZRlzPHmIzqJDg9r8RCPkgLy5mh39YuCpKUdsUA8jpqimv
         wjb/ymzRSdhKo2cioir+RpfOelMkcrp9OXYyWb3PEHmOGW+chbG9lIQo8wYl0kPbsStG
         DmFjM80IGGR1JPknV1mPKCWeUj43ViDNqJ2gGbcLJTksqawPpIUR6znrcfsFx3FK6Lbm
         9AniZON9P3TK1NUqu4XziKE1rpZvhn0LTpvyZ9Pn566kb+ZhjdjOemZyHR0Crh54jbYy
         UUsenm9cr1tD/8weYvEhQIFJeslMrONs7qWCJdD6edsayEKtV56Oe0UwDGzoNQbGBZ8R
         ljGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747402862; x=1748007662;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ROhVGMzsFKUKcbl+uc4M+NtezlfJHXVXpAYtpBvAgk4=;
        b=rRmAOdLlWH8dp8liTLgKr1CNuiveOpMSKrXWCSNsWBkqnhrK+6ja+RyhTJGZxARbqa
         qWrlrALWl8ylG6NQqYDUQ+B5qyBypm6pPUVGm/qF8vGj9s9gv8UY2D8U0KQr0jBKaO2p
         NeuIQIY7CeYTkPqKMeHCz2jjCdVICfco0RakaBNnxJuxd3qWbTv+KRdVDG8AdMmcXNaP
         M1EbJYYHpoFrnoMYZMqIDBJwtu3fEkcJMNY2sgdOF/1z25KRAFFMBK9Kz2NmdFtzEId2
         jBoQK1Yon1JVCBdrYTuPrSDV4PGpSq3W1YH01ZCeUC1OCSYaM1uTFe0g100SlNQrJpJ8
         hb6g==
X-Forwarded-Encrypted: i=1; AJvYcCX8P0JjQDn7AF7HL/hshlwm/Z8DdXrFsJgfqQJNo2K2F9ISSyFHGUGteSwwgKiaY3ldx1QPjX7oXiP9Uhg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5uP3ApLL/7wuVc6TOXDUyTLmexBF+uZifuVEA7+yuKu1aVUSm
	Ek3VfSGfz+wjQes+8nBAxbEL2LtLOV2oXmagIGwJqcElTqggcUJ/KRutiaagNFlACJKYBVjG333
	wtSFOU7h8CSEzECyT6tD1uA==
X-Google-Smtp-Source: AGHT+IE25G0/BjDIzRGhaY+tUE0a1T8as9PDGc7bUXR9TD/pYwUJpZs3atjTMCsK34rjbeQcFKFoizPiNPQFaZsH
X-Received: from wmbfm27.prod.google.com ([2002:a05:600c:c1b:b0:442:cd25:eed8])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:83c3:b0:441:a715:664a with SMTP id 5b1f17b1804b1-442fd6607c9mr27539065e9.20.1747402862237;
 Fri, 16 May 2025 06:41:02 -0700 (PDT)
Date: Fri, 16 May 2025 14:40:21 +0100
In-Reply-To: <20250516134031.661124-1-vdonnefort@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250516134031.661124-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.1101.gccaa498523-goog
Message-ID: <20250516134031.661124-16-vdonnefort@google.com>
Subject: [PATCH v5 15/25] KVM: arm64: Support unaligned fixmap in the pKVM hyp
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
2.49.0.1101.gccaa498523-goog

