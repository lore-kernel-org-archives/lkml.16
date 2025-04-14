Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0F92BEC43
	for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 12:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744634161; cv=none; b=Tjd10CQlyzAQUOlhWzOdJaD0zMRN1qTvKtQKJISorycRWoaV5saSDe0eKSiV3CSUjNzOKAAHjCYxTcrPsdf4Hpg8cLIAGIwHC/Z483nc8WjDdSF6lsMxMNyz3fYway0xTd+9dMmASA0UnMuWNyh6Ss1XWJQfVjx0y6hoq/p16yo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744634161; c=relaxed/simple;
	bh=uE/sTnOURFYBjUxUXNJbjUtsh/EN4ig5lh4+0R1IcfU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RwKcKWCYJkbytJ0ONfB4bnrcvOSmWSLxf0ahjl+CArdGmIye9R+lDqserF+Cp9b22v+XtKx1WCJd2kD5OK3PBzsqbigVdEneP9OxrXyK9pZMVRl4xaUtJUXSE/xe6FvLVuCarHvwpCpNRB2wNs+DYgaYdNERdkslEDL7gT/RLYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=z4X6OvGU; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="z4X6OvGU"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-43d0359b1fcso28293915e9.0
        for <linux-kernel@vger.kernel.org>; Mon, 14 Apr 2025 05:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1744634157; x=1745238957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZlJaR0rGQ7lkkTNY4tt/hV6uETrC0h2zoS/Msh9pgDk=;
        b=z4X6OvGUdN1cUflf6/Cn8Gv+xMdMma0fXjBuK+FUWi3F8arvmHSjcPGLay8D41N1cu
         /AIezttiM55vD9QwRFdoUUpOaVQBLWGYA+GrloTCLFQFitO80uoL7DEZHbi0CZRP+tYY
         5SELWDswpYMhUm2g5wHtYc0fLlCE8WX14As0H1iA5S3rI7E+jT5ZVr3oCod2O22OA7AH
         Pk9sIsSPkWVkTt93dkiRjAYarXGbXUQrr0t7z8wAprSazdHcIDLFZofonLiXNHVpWABM
         /e8nTKnwlGF6xwIWDoKoE7aKnov26Nfabf/rNhpUiARtscsPx1pvu3Xhjd3JCuU8y+CJ
         g0xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744634157; x=1745238957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZlJaR0rGQ7lkkTNY4tt/hV6uETrC0h2zoS/Msh9pgDk=;
        b=lVlPMuvZhK9igtXEqFJfT5fMmcPecMOhAjaihkuvTRdX0JhXSfgVLpu8ofimKzzrNB
         bo+LVi6an2LDsru3b2VNdXD4zikzoA7K3384H1RojHeS6l9FMy1P2UPun2oAMIgxOgMf
         7iIe+L13ZX2j0ypqKQ5LmyXAPJVImDKaYC31CCKgYZ1SzkEWwfUNzpjN+3DI99reYyG1
         uGGsYUmTpexOHTGNIShMGCVCh4GBKcJukO9YQ4TVCzGzUrbJbdTm6kV5/wpWr//K/Qqs
         5+I3DQ1UZ9OzshFnFylW8T1y2KUbVY3l8rY25S2RJwZaN/HHIA8DcUBfP0WR8XjiR7pK
         wWQw==
X-Forwarded-Encrypted: i=1; AJvYcCU1sGjIsbKELnCacL5uYjcnc+gr6CaO8+1651BuGebEcGxW6Ne2deVHMcEBeDMELnYTG28kZWq8i7baLro=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFtnVRX5c4xM3y1VuUVOdquZW69cxZ0Zei+U9mfNbaGz37Xm1k
	OAli0R3SfieJywLlpQLDybyN7vz/wtzF9Uyj/Qz7IYUl1rxRyhAecLnTbuQmEdA=
X-Gm-Gg: ASbGncvgv3wh4jLHsBN3WX4/o/G+lXw8j/mZcvu1CI5Jw2GLDQhBFfqL00ELdR8oqOm
	6Q8KX13w+N/9vEgyzv1C7qrtkrKZJ1rE2NAaH1R2Hz4uSDb3Y9XhzNLAFKGjKNxKJZj9OBoWYV3
	xYIrMdGGidopmw5uAIi1yZA6eFMQU2UhDzLJA6fuTLzEslVEGLrqnm4Usi6L0cvRiym7+YYCRDK
	/3vrGXZ3l3P9LHYjEwqSHtFKZ3Nykb1BsK4jR/VFrkexvd4eyRvLx8sNmsJ8/EDIA+9xXGHnr1R
	ke0IPTH1ioO9UrBrI5UxBlpsVasR2C0gBoIzsP9UAA==
X-Google-Smtp-Source: AGHT+IHgz33xrXrH2J/Kburuf5TLKxLzowtKebRllfEO38l1vRVBBETy1O1EuzOqnIGPlOtR1iyBng==
X-Received: by 2002:a05:600c:450a:b0:43b:ca8c:fca3 with SMTP id 5b1f17b1804b1-43f396e001dmr101919085e9.11.1744634156654;
        Mon, 14 Apr 2025 05:35:56 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39eae9780a0sm11003166f8f.50.2025.04.14.05.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Apr 2025 05:35:55 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kselftest@vger.kernel.org (open list:KERNEL SELFTEST FRAMEWORK)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Shuah Khan <shuah@kernel.org>,
	Andrew Jones <ajones@ventanamicro.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH 3/5] riscv: misaligned: use get_user() instead of __get_user()
Date: Mon, 14 Apr 2025 14:34:43 +0200
Message-ID: <20250414123543.1615478-4-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250414123543.1615478-1-cleger@rivosinc.com>
References: <20250414123543.1615478-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Now that we can safely handle user memory accesses while in the
misaligned access handlers, use get_user() instead of __get_user() to
have user memory access checks.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index 4354c87c0376..97c674d7d34f 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -268,7 +268,7 @@ static unsigned long get_f32_rs(unsigned long insn, u8 fp_reg_offset,
 	int __ret;					\
 							\
 	if (user_mode(regs)) {				\
-		__ret = __get_user(insn, (type __user *) insn_addr); \
+		__ret = get_user(insn, (type __user *) insn_addr); \
 	} else {					\
 		insn = *(type *)insn_addr;		\
 		__ret = 0;				\
-- 
2.49.0

