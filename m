Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2400B29CB3E
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 19:03:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747940637; cv=none; b=GTkE75+tNtvwHgcs4nt+7b5Y6emm1Q66QX1IjfgJ/HsT8JVsmSrbwnUVAu8cVkgOAfiU5rYKxQ+B8ktfcl7EH32J3MfTZ3/wmUYOpdpJbTHv3SDWue6qpaioxnpCT0yNppLxjNj90NxC5HOkzAh3nxI8NFwoHtVbyXXhzPcbuP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747940637; c=relaxed/simple;
	bh=+prUsGSfboQFhKZbNUw86ACE/0BQoa8YLYJgH17nChg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JMfD45HIZ9jQP+MnmFvadkWLkyDnb/I8Rc4iZcfO6Edy0788XeRNIbvg+yvG74WII+vArA915YXB+bbniZOPn8PRchnyT3jglvx/T4p5mUw9xWZN4gPJcq0zGeZ2n2d70r7LPVRU6kb86GQ9nsv/D3emyW1NTw/G4rPYFeLurYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=0p11iUaT; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="0p11iUaT"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-b26f5eb16a5so196167a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 12:03:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1747940634; x=1748545434; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=0p11iUaT8U4KfYVX4wsHjz+PP/4MPkc1EZ4dobSvBL2m+uaZJu3V0I0YtNCbn8UEXd
         k0hct8l550QR/JewSlGF284F6tyolOwrOyV6Tt3OGWEaQA8O61FLbybHclWBmV/vg9B+
         adUL+2a0H5wxZc6X45yaHisMnuBV7YLT2pH2NnK4ZEB6L3dqFjFSk4o+m6lKprpHSy1X
         pmrCByxvo/SYlKMwe785Z8WQB4guoCG6qZxhcOQDnMBlGV4FQXpqfG14XfUtTIr/oHzX
         LLJ6Myecm6QOtTtPpYAJHCaFexbvy6PCOoZcRFxgRkwJDRwN9744e6wXGFs8CQswXe8b
         T39Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747940634; x=1748545434;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NL+JjaCkPLIbpCFGEZpnZEqKtEvm89wxDo8gtW9i88g=;
        b=QtpXK/B/tVLHN1fbsgb+P2OuQpVVBay8UmKs8AOD14cJAGnfoVLdXznB/3hlALtFWI
         H74gRdayCES2MXCXzADaR7AEG92QPiY7PTFJrq/IAJs7PPS7KlzME/YjCbadaipa4xwf
         oWqfwKKedsGG98R82j4DPBlp4mGyt9CFOi64YMSE5LKNTvDv8DI1SPwIgDBdSeiKom9T
         xaRfps5wI0jnVs89wITZDPYBO+h+SxRy/krhH3ojbVlhYCkEl+lDSJUjymOPom14KsOE
         r64RE7jQjzrenaUfmLs7TuEf8X66n8FKslRTkU4L8rwW/KHxarGgCketJG+ppmARFO/t
         wL5g==
X-Forwarded-Encrypted: i=1; AJvYcCUC+3FF3yNGaPJFcmiF+hU08cT+kPmQ4KFC6cExS53tg4VzFXaAeomo9UhkP3iPMn85jNKck2JyM8yHOqI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwRNU5W4TctsOtxaGKF0V5aWlAMS+CQDTifOIRdVWQeAKahPRre
	5J5bzMTlt+cOhiozGf+uiN2sc5kLYkBMs1VthdeipQJ+nuzgWQL+6KD5U+/JDj7kTmM=
X-Gm-Gg: ASbGncuzafulX9RPJZwuLTXGH0jxuYGJlvSMchIEn2CIorDxC1Sp286ymjPyZXXX7Q9
	t/dZ3dmFTXERoTl6jQ6NGb3WTgxNHZCe36/Ckl/e5dVrQeUAYhAZWCoGkO+EFldVx057J/1AOs5
	4npphB9ww56c/QX+GAzBSDpDPwgFRWxQCHTUsKaK/h6zl8ZpCuiMmYdxBAqsuC0yCXTcRQ1a9Zz
	gqRbKVJ988P4kLe5dU6JAaLAIlYxkmVPXMClDQLNoVdrFIO5SEZVE5pq9APVHDwzWy+q+U8wuor
	yIcbFRinRUHKdy/7RJ4HMea8wLr5BNbWoPxq9BBxON2OZay2f1z3h2KuanCRVz9D
X-Google-Smtp-Source: AGHT+IE7MkEZajOwtulJ1pSoS+YJGY/C1JUznV8zU99zjbdE3O1pdB4nhaqsx7X0UH6Pko2Lha+e4w==
X-Received: by 2002:a17:902:e545:b0:232:1d89:722f with SMTP id d9443c01a7336-233f067c489mr6091775ad.15.1747940634357;
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
Received: from atishp.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4e9736esm111879155ad.149.2025.05.22.12.03.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 May 2025 12:03:54 -0700 (PDT)
From: Atish Patra <atishp@rivosinc.com>
Date: Thu, 22 May 2025 12:03:43 -0700
Subject: [PATCH v3 9/9] RISC-V: KVM: Upgrade the supported SBI version to
 3.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-pmu_event_info-v3-9-f7bba7fd9cfe@rivosinc.com>
References: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
In-Reply-To: <20250522-pmu_event_info-v3-0-f7bba7fd9cfe@rivosinc.com>
To: Anup Patel <anup@brainfault.org>, Will Deacon <will@kernel.org>, 
 Mark Rutland <mark.rutland@arm.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, 
 Mayuresh Chitale <mchitale@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Palmer Dabbelt <palmer@rivosinc.com>, 
 kvm@vger.kernel.org, kvm-riscv@lists.infradead.org, 
 Atish Patra <atishp@rivosinc.com>
X-Mailer: b4 0.15-dev-42535

Upgrade the SBI version to v3.0 so that corresponding features
can be enabled in the guest.

Signed-off-by: Atish Patra <atishp@rivosinc.com>
---
 arch/riscv/include/asm/kvm_vcpu_sbi.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/kvm_vcpu_sbi.h b/arch/riscv/include/asm/kvm_vcpu_sbi.h
index 4ed6203cdd30..194299e0ab0e 100644
--- a/arch/riscv/include/asm/kvm_vcpu_sbi.h
+++ b/arch/riscv/include/asm/kvm_vcpu_sbi.h
@@ -11,7 +11,7 @@
 
 #define KVM_SBI_IMPID 3
 
-#define KVM_SBI_VERSION_MAJOR 2
+#define KVM_SBI_VERSION_MAJOR 3
 #define KVM_SBI_VERSION_MINOR 0
 
 enum kvm_riscv_sbi_ext_status {

-- 
2.43.0

