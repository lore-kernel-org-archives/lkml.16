Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2123226656B
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744632593; cv=none; b=GfQ/ozXf6UHITI3XsGoG0RgMWFpHwEZVg7GzooxgcLw0/f4bJgWfdj2VXWSnhRFYMBeVwuL1rfRkFxjrbc5hu7b9QSBW1CPbcG+rO4OXUiHy18YgYNpWjynAAJRa7h3vqbiASTD6befPkbStJFaFkrHr3RksuXtB8sctY/Qo6vQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744632593; c=relaxed/simple;
	bh=AnZECDH63/Sx09OClwV5T1VAh2M07OMoa79dpLKTWJ4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=lXB4+zO2YklF4clmVEjcHpuPcErgNPV0PjwNob489jIJH4LjZpel3KLBqiT9nwcFzjTVmbuY9xgZ/eaWddIET/H3KIzvaL+0RpNxWVHgVuSsKGHaM4X3cG0INZ76XmVrhTMnENsl/kw4CxSF/2L5k6Yt8NcT22q3OiCTKdoyTB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=KrcWC2uP; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="KrcWC2uP"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-43edecbfb94so45455095e9.1
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1744632589; x=1745237389; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zE3/vIaDDm49Ow0awT1xfzab8Kaog4yG+YjbBkNm2n8=;
        b=KrcWC2uPGHuP9K2UaZG6txgp8vjhZLAOj0U2qzxwwDFcJymsxhe6mjRlvbhEFvXxCr
         NDFtRCo0wpaFMrH68hei50kcJYQrpFWAvffnbKiIt5wKjyfag1R/FLIYOL0ge5fBQApD
         8BgjEDX0LL/3yuJEFHaUGgMJMBKUVpqqtsYuH/Rc9IApsYMkJikcHF8iFQqXu/1K3CcO
         /S1uSvEA1VfRr7wDc3vlApj2aQPSL+gRHmz/X8gNK3DPmdSlIFSBL346ocAYtVFI+n2i
         wrT3sazkr9LLkz1OoJIMOBCwG4/DO4utfr3A24Ifsd7UB54xYGCqZ2e6pqv6a5pMRNSu
         H7NA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744632589; x=1745237389;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zE3/vIaDDm49Ow0awT1xfzab8Kaog4yG+YjbBkNm2n8=;
        b=UCLRfD2yieuPBkdwjnFSybB9ja8MxTZYUJ6jT2RJ2Abvs7R4nJp3gMu86j29152PrO
         UnyniaAqqT2B/J0q5xuAbHSqtUoYdY4+NsGczqOh6TNICgLTm6v/pgRmYKH8iqMYC38e
         ibUHfSnra6ZMMT/uj9DOiMup6iTZxXpzjSDdlFMiZS9+Myxek8ozAyLNxryOieoa5U06
         J8gYNoGjdrwhQg1xfvocONWHLNX0wNyM7xvaQp3qwXgAfIR5JGcFstpEOGjayd/9DMIS
         jPThDW1cGs/uF1pI45nOim9KyFvt1k6KeWWanLeLuphBJmV5pIXzAv/YepxHYaS8d1wl
         XBXQ==
X-Forwarded-Encrypted: i=1; AJvYcCUDGtHa+A78aYPSIq6fjeO5BYkrLICzG3WVP1d8/FG66nF0XvTJ2nvsGjMJaZVr1wTys3ThTUVRp5rlROg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxj1or1VDc6AUuRF3sOo7VjYwDgAXa6j8KounsrJo6OHJdlxo19
	fIF5EP96e6WhZVB3lV6/RKBf4C7mVnfXoBAm2p3p/SjQ3Emv2Qw7wgvgMBSQs6U=
X-Gm-Gg: ASbGncvMFpiZ8y+EkCQJ4zE+VhOFVex4eLdlVHqXBXGTY+o7NKbjW5CNt9TXbxsr7eW
	lwvFsQE+4HZtRNWVjBTZUTPjwMJw+B+dxlx4yD81R1w9vVhmr+KPCz81Fo/3uHVXgj+MHaQYCSy
	kMaakhnxaRkyUUDi9YUKXfaLzGXJ29pZ02HxV67k0ofE4qnP6exqnAyqc2d+8FrtEzK6GCk1/UK
	U18OHwVze+yxFLPlv6JdwiVLPRyMR9S8OIJCRo/q6+txcXKyaymRyiEQ3HVo6rCy0JWvYaHHu7m
	XN3qyGZuUU0YDrTKQ9M7Gw7IziVz
X-Google-Smtp-Source: AGHT+IFNxS0Xit/RMmUSHhm4BTUKEcgXGGkLi80tu1FflJzbof+IkBnb8Wny7dyxa/mkRZ1Jg7nFRw==
X-Received: by 2002:a05:600c:1da1:b0:43c:fb5b:84d8 with SMTP id 5b1f17b1804b1-43f3a95de2cmr125882165e9.16.1744632589124;
        Mon, 14 Apr 2025 05:09:49 -0700 (PDT)
Received: from localhost ([2a02:8308:a00c:e200::31af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43f233a2c46sm174308315e9.13.2025.04.14.05.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:09:48 -0700 (PDT)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	alex@ghiti.fr,
	conor.dooley@microchip.com,
	oe-kbuild-all@lists.linux.dev,
	charlie@rivosinc.com,
	samuel.holland@sifive.com,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] riscv: Provide all alternative macros all the time
Date: Mon, 14 Apr 2025 14:09:48 +0200
Message-ID: <20250414120947.135173-2-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We need to provide all six forms of the alternative macros
(ALTERNATIVE, ALTERNATIVE_2, _ALTERNATIVE_CFG, _ALTERNATIVE_CFG_2,
__ALTERNATIVE_CFG, __ALTERNATIVE_CFG_2) for all four cases derived
from the two ifdefs (RISCV_ALTERNATIVE, __ASSEMBLY__) in order to
ensure all configs can compile. Define this missing ones and ensure
all are defined to consume all parameters passed.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202504130710.3IKz6Ibs-lkp@intel.com/
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/include/asm/alternative-macros.h | 19 +++++++------------
 1 file changed, 7 insertions(+), 12 deletions(-)

diff --git a/arch/riscv/include/asm/alternative-macros.h b/arch/riscv/include/asm/alternative-macros.h
index 721ec275ce57..231d777d936c 100644
--- a/arch/riscv/include/asm/alternative-macros.h
+++ b/arch/riscv/include/asm/alternative-macros.h
@@ -115,24 +115,19 @@
 	\old_c
 .endm
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
-
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG(old_c, ...)		ALTERNATIVE_CFG old_c
+#define __ALTERNATIVE_CFG_2(old_c, ...)		ALTERNATIVE_CFG old_c
 
 #else /* !__ASSEMBLY__ */
 
-#define __ALTERNATIVE_CFG(old_c)	\
-	old_c "\n"
+#define __ALTERNATIVE_CFG(old_c, ...)		old_c "\n"
+#define __ALTERNATIVE_CFG_2(old_c, ...)		old_c "\n"
 
-#define _ALTERNATIVE_CFG(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#endif /* __ASSEMBLY__ */
 
-#define _ALTERNATIVE_CFG_2(old_c, ...)	\
-	__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG(old_c, ...)		__ALTERNATIVE_CFG(old_c)
+#define _ALTERNATIVE_CFG_2(old_c, ...)		__ALTERNATIVE_CFG_2(old_c)
 
-#endif /* __ASSEMBLY__ */
 #endif /* CONFIG_RISCV_ALTERNATIVE */
 
 /*
-- 
2.49.0

