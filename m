Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2376727FD6D
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 09:17:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750411051; cv=none; b=W/1z5o5FTdqReJ34tBNzGtc3PcfdRX18C30MFrlfWaGVdkd5uRi+lZb0I0VT9dyJB4Dmmwmv3RQP0F0CpdswsrYIhsCZCjPcPjvfqWt3Ax22lgYQhWzEMkUYynlZGIIUODjCqww91YT8zt2ar+F2JMtonhDN94rABLDcan1Cccg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750411051; c=relaxed/simple;
	bh=ixQNp5ANh6UfdRBKRrYl0UcGHfvIBMJLk6zo1If86DE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gFumlOVqDBkPrU2aMCvG/Sf4abYBVnx0KhlDgYU1obLhMdnz/g75qADYvfmhIOUINqtNB03jd/sOdCHYhbMHjHbrsyOEQmtbGuVzTDYPosOlo4ZKc407LJtJuz6I9bd55/goN9REW5G+cAnCGzdm/m4vtarOhnzz2NQEMA6X8tQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=BoPTQRvM; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="BoPTQRvM"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-73c17c770a7so1844141b3a.2
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 02:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1750411049; x=1751015849; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dNLJBKjnEtfhUDU8FDwmcm2NO13Gl9xrFkTR60m39TU=;
        b=BoPTQRvMiaVsA+UWQUH2P9nYxUe9LPYI7ycwAMzYnje1T4RAewcYY9ygI7E6PXhkC1
         ez/qgMsUnW2jAGIiFlgiUz9hrA/DHcYCBAqQSZcZxQ0nHO5tDnvVDqVW9eaSNEjhj4z3
         e5U13FIS7A21MckQBbxKbm5/ryOifWfJ4ix11Ey7PJB4Goqh1fH/5kFoac7VBXvDvdEd
         7rE6mTCRUOa2pnvCX91VnYltOo+9DmgatdCjGM1XkvhONxL8aR90KfI8X/I9jy4ialNo
         Uuy2gr4XvjZ6qB/w4mVvLd6U4aVYsj5kH+lUyg1aq0l83g/5D7PxZtzyUoMcN3jF+31T
         ZF5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750411049; x=1751015849;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dNLJBKjnEtfhUDU8FDwmcm2NO13Gl9xrFkTR60m39TU=;
        b=D4GtwmwFDZS8cADFPTpUlqxgyZOM/QFq5Dkxf258go+bQzTCn8OBS1vlcZB6aIXJHU
         zhEe8Obfs6jw4hq2jVsHAI8BMERFwZa+wCS/zy5vlTXZZTbdzsxvy/y9krypRHk267HB
         8ygPOFOHn5Pem3rox1C/Dq889IvHQwyDL/O3ntzQOpyLdHuESfJvSRVsBovwPPQYjX7F
         Gz+WatpApk1vCHPWAFOxQ6F9gAGhGfG8Cxesl2ygI3K5L9OHYIVJutQoqZMU2usqZbAk
         Zb8EnomAOWCyzNawFb46vIempPuIZmbvZiDoOxm28aa+kwBdi4+epn0+VRUN2toSL/b7
         1JqA==
X-Forwarded-Encrypted: i=1; AJvYcCUBTczU2rND1gkrC8HHgm6zzTguSl3Gs8jzIsFDAC6VdKWtZ4nvcCknX4fIg8YsuP9vC1aSVnp7ctfCVfw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0hJasKwvIcF6dHuYUAYLeh8/QxlKtQIfM73mWFW2mgUFfZBP7
	mFGXHuS3wx65ECgcRzRJB6v8o8OwSF2rg5e0QKP1VC+HWOm47yiHuhbS7fpHD1ClkEc=
X-Gm-Gg: ASbGnctDo43P4Iq1TZ1mdpr29t7EwqxnYKH/WOeL39ho643wiSyQXVBurTi09KwjFAX
	aukfyXtreNEA3zP65B9DFmQRRzSDleg4h1Is/5dL2dcQqY+A+ZjWKhGkttvvF60joUoilWgt1vP
	jwttUWuRpqErevh2Ih7EfqNMMpKOdMhfDd2Evompx1rbyl0MmWNVGpBLngqWmt7hf4M2Thldk13
	xQb4ALja0bY8eRX5l1LIC9EX4c7+aSysTgt7EO9P0CnVq8jMjj5VQi+6j/zzlIYTuK8rbp4fYfn
	Q4pv1scUQ2FG+STd53uGBqU8pu5QDm/0b1fS4JohRkh2/+RyeXKd7Pvy8gyopFjMPaQs5eUzhha
	In6HVFkNNOJaai5AyZleaxRKwEyfedTuVruPZivvvbgzI7JUnDZEbLTM=
X-Google-Smtp-Source: AGHT+IFl+mvsVS8E+myUXJyeRA0NPyQGQ4vLveBBEzuD3+Qemhmjod5mWIqNQeJQuwr4ZVik1pW6cw==
X-Received: by 2002:a05:6a00:2789:b0:730:95a6:3761 with SMTP id d2e1a72fcca58-7490d4f533amr4072727b3a.3.1750411049294;
        Fri, 20 Jun 2025 02:17:29 -0700 (PDT)
Received: from J9GPGXL7NT.bytedance.net ([61.213.176.56])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7490a4a488esm1643231b3a.63.2025.06.20.02.17.25
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 20 Jun 2025 02:17:28 -0700 (PDT)
From: Xu Lu <luxu.kernel@bytedance.com>
To: anup@brainfault.org,
	atish.patra@linux.dev,
	paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr
Cc: kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Xu Lu <luxu.kernel@bytedance.com>
Subject: [PATCH] RISC-V: KVM: Delegate illegal instruction fault
Date: Fri, 20 Jun 2025 17:17:20 +0800
Message-Id: <20250620091720.85633-1-luxu.kernel@bytedance.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Delegate illegal instruction fault to VS mode in default to avoid such
exceptions being trapped to HS and redirected back to VS.

Signed-off-by: Xu Lu <luxu.kernel@bytedance.com>
---
 arch/riscv/include/asm/kvm_host.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/riscv/include/asm/kvm_host.h b/arch/riscv/include/asm/kvm_host.h
index 85cfebc32e4cf..97cc2c0dba73a 100644
--- a/arch/riscv/include/asm/kvm_host.h
+++ b/arch/riscv/include/asm/kvm_host.h
@@ -48,6 +48,7 @@
 					 BIT(EXC_SYSCALL)         | \
 					 BIT(EXC_INST_PAGE_FAULT) | \
 					 BIT(EXC_LOAD_PAGE_FAULT) | \
+					 BIT(EXC_INST_ILLEGAL)    | \
 					 BIT(EXC_STORE_PAGE_FAULT))
 
 #define KVM_HIDELEG_DEFAULT		(BIT(IRQ_VS_SOFT)  | \
-- 
2.20.1

