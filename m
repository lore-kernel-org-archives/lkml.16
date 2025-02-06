Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A978248184
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 13:20:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738848028; cv=none; b=ObEdMo2b+8Aterud9Hm9zJUOTpTAzFPa33OwTORETk9rfRg5f459pQqbcjcjCVPMp2JGiIAzLUGw8WEyqLur8BpYYk2Q5HPMTBL0jK9fzk6f2hUNyN2V1CYhaFL5AOQRgEQgFrWkCvYgVCT8fSOjwlElFzGmpGbvbUfq3RSTh6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738848028; c=relaxed/simple;
	bh=/8yDtOhiTSdR/J3JnQgABqnDOPtJ5A90copPotre4SA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=mFYVAtKWagbO0b9hqh7F0KllEpUQsFjOmT1KVDsON4YNAkTSJtvOhfeKw/d6fx0bq5Y5pPpM9S3hgI3IPzHt+O3YELm4SEqicBypf91nuLhUYxNNuvJPSF5tscUMorhXKb3Lf/iq2EZAAtBm9LrELdHrQ8L8BFAkec0M7frWcQI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=OTShSsiU; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="OTShSsiU"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21661be2c2dso16224455ad.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 05:20:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1738848025; x=1739452825; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xce49/BY9vfXB35z8CeRZ6MSP3HJqpKyFsN4Gqyc7dc=;
        b=OTShSsiUIG0spRMll8phJSoMy2YnBIKT52PySrZSXQGBfSBizhbax4N8RZTyX0WWRE
         P3bjyjwtpdrpP5tIo3oD8sCh1vROHPd2nh0gEVOxUy8F8MtnBo2MEbefIff5KuyJWNyx
         itUNEYwym67Lx6hwo4YINDES0RftGwJJLcZCGnLC6qT3dz1ThwMyJNPRA5NSysEYIoxi
         RC1mFRSK2rqAwgs0TXXYx8VUZqzRdUYXUV262J0+64TxeocBhEUOPxOXwglSKf37ZXpb
         VyZ5ILFLB3LtvMqsu5q2GTanJOMVtQFt+eaEq9Kpfm08NJnvDkP21vjWEm1HoQi1adY5
         5xhg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738848025; x=1739452825;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xce49/BY9vfXB35z8CeRZ6MSP3HJqpKyFsN4Gqyc7dc=;
        b=d+dKLHo9tEKUQNcjB0c01n+adLOhqhlmkF1OX91mfxY+nEiXaRhRLe4bYY9rUiT1v6
         UBiCFHtYKLl4NfR2+D4ltY5p29peWsBGbu4K27CdDJGMfsgh/mIzKHVU+CYVkPlfP8qY
         LRgtsKKtv/YwPlh/cqs+ioEAhaBLn1ynOslgnx7YXtkU3a97x8PHAzr7iY59rCpu1Vec
         zHIuVcVanoiPKjeSumT+xhgxrlo5TtHbNnUixg9c3V+YS7btGyUprSUY7frxMJVX0jDI
         f6F7WCq6RaNCSYJ4HMURlGeAg5FfU6xaOqsHxkKXR7J2dZ7mkYzck659YgZP/562SImp
         PDMw==
X-Forwarded-Encrypted: i=1; AJvYcCVkEVJhzW7QKMXkhWrMXoei2ifxatxAyYGtbcarmS2wRuHlweWNZbDAnrrGABsY1ufHFsuVGMt4u8rS3os=@vger.kernel.org
X-Gm-Message-State: AOJu0YybBaoAqNEm1yEusy9tWFyq5k2zh6+KMpU5BTBOygG0tN2nRT42
	dqrvcGCiTL+p+x6PCq0tCQNlHcc5dtqot1hETzuPfKDbQbz3UePqnpc9NwWjZ2o=
X-Gm-Gg: ASbGnct14yzgB01FLdBYkQojrVKe23xAnUvW/JYgM4SXu7nxhDnJ0EnmWVzfQIuitFA
	jgHJYcURf8E8J5cF0aohGmNgHQrkNk7bkovJBbUPgiEkjpgeou2ar3MaRCvz3JHrWJUAQKudL6b
	dbsfLk5cLBOFRUG4FbhrqfJQNE1ivTwNVHvH6kXpdigsr6Zjia1k5IWcaGqeeIUECO8QoHaMPOK
	+WYIeWvuoEELHPNrLy48siySAnQPrJXWPPtmYeLMtpVVU/K6XpZ0e7ihum016/Oy6D5S4LAxiNd
	hQUcgWHds3EZt0AQWA==
X-Google-Smtp-Source: AGHT+IFcNT/rNgI2uCAPNRIwNCrMXf037u5qAVa3V5iSa1fu7wy92g99/HkKLyrbAq4szqQ1+3GzCQ==
X-Received: by 2002:a17:902:eccc:b0:21f:1af3:b318 with SMTP id d9443c01a7336-21f1af3b387mr108852145ad.53.1738848025272;
        Thu, 06 Feb 2025 05:20:25 -0800 (PST)
Received: from L4CR4519N7.bytedance.net ([203.208.189.11])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d987sm12170775ad.120.2025.02.06.05.20.20
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 06 Feb 2025 05:20:25 -0800 (PST)
From: Rui Qi <qirui.001@bytedance.com>
X-Google-Original-From: Rui Qi
To: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	ardb@kernel.org,
	haibo1.xu@intel.com,
	guohanjun@huawei.com,
	sunilvl@ventanamicro.com,
	samuel.holland@sifive.com,
	parri.andrea@gmail.com,
	ericchancf@google.com
Cc: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-efi@vger.kernel.org,
	Rui Qi <qirui.001@bytedance.com>
Subject: [RFC 5/5] RISC-V: define ioremap_cache
Date: Thu,  6 Feb 2025 21:19:26 +0800
Message-Id: <20250206131926.91289-6-qirui.001@bytedance.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250206131926.91289-1-qirui.001@bytedance.com>
References: <20250206131926.91289-1-qirui.001@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Rui Qi <qirui.001@bytedance.com>

Define ioremap_cache for riscv, otherwise it will
cause compile errors for bert.c and einj.c

Signed-off-by: Rui Qi <qirui.001@bytedance.com>
---
 arch/riscv/include/asm/io.h | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/arch/riscv/include/asm/io.h b/arch/riscv/include/asm/io.h
index 1c5c641075d2..c81d2de007bc 100644
--- a/arch/riscv/include/asm/io.h
+++ b/arch/riscv/include/asm/io.h
@@ -134,6 +134,11 @@ __io_writes_outs(outs, u64, q, __io_pbr(), __io_paw())
 #endif
 
 #include <asm-generic/io.h>
+#define ioremap_cache ioremap_cache
+static inline void __iomem *ioremap_cache(phys_addr_t addr, size_t size)
+{
+	return (__force void *)ioremap_prot(addr, size, _PAGE_KERNEL);
+}
 
 #ifdef CONFIG_MMU
 #define arch_memremap_wb(addr, size)	\
-- 
2.20.1

