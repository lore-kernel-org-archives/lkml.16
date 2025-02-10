Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64F2A23645A
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 15:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739202982; cv=none; b=TgG+dJC0tk15YCm3mesP1a00GEYHeYPSWtJ0Z1kKxNDZ1St72Zzmoj8P+Zg3rw9lE5g2RIH9yujovRl6XxHuj0jpW69hBx3KetXu9LULWkXaeYD5aVhqn98IwiCP2MvT613C7uZ0f/k3AoRuZRMhpEjJHERucdrletDDefdOh4M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739202982; c=relaxed/simple;
	bh=QTK660jHPxvWpe4DiJjXjBt8c30/AClWzLEoYIE5ts8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=haJ15hOmCapiJnDNEZaKxJmnig/dJNjtsK4slLv0/Ga5rkcmzp/1HAz2SigRJIzC7Sm4nR00n+h97elGBeAhQ7RlrQbhhczCia0We3Y9+ACAluYL8hQf2/R84IOuAl0uJNanEsTHRCvMmwJRCRLCFStUTbJqmZqBbH3koN8P0PI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=fOylWNBY; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="fOylWNBY"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4393dc02b78so9631895e9.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 07:56:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739202979; x=1739807779; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=dwvpqgCc60HMle4gfhwGXC+m016RdUxEz0jvpf/EWvY=;
        b=fOylWNBYfoHT/yFk6anVfTtx5AP1IvIre/moWFTQLtdS9YYmdpzTHYcPGoljSGdLWD
         EhKj1F8v28jqcs2AY5yXxepeonNS8H47/neEYwkN0I1/R5UFux+V7oOMeJlgERRM8Lr6
         pEp4c1TSHVbiGBWs4YQ+RI+WrJX5SMSWE3ibx47PkDYShKq6CF1wgn0bdOfFn95dQuXU
         WYYKoT/6CVnHYB22Wnaba9Vo7aQA/xLHyEr8MS7a+0HmG3X6PswYj7mncxIrOBFSFCKD
         GPvQptcg9zFqFFtE0flZc1WpjoiYZzh9i0bDp8lu5oj/asJn2kEH95xbxmx0LZbbqfr3
         p3Aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739202979; x=1739807779;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dwvpqgCc60HMle4gfhwGXC+m016RdUxEz0jvpf/EWvY=;
        b=p+SW5ixp7a7eqng0QbZgB/llgPDY6lo5gvF51g6DnX1y+yEdeCVEJ/sYspnsUdZjZh
         CR/wuseNNrOfENkFOse1Ajnyp8IDAeI15pEvl12p1/d1lEYSNrlrL9xXXZIO6hPzYsIc
         Lo0CHn+Zzo2RPTnLT81otXWCEeXZBCyXEwERjNqEFutVy0cPSf/3Gg9hrHWq/EVubXJw
         6UImHIFJO0LthPyHMmNM2s86egYjd4ILdsb5tsUVpaH0WyifqHMJGKrsgBQl3LL64/vK
         hiWV939DewNAEddAx+Vbfhm4Pr6LUDMHeaTFCZTd81ZM15j31rKILLnOsX1B1IGmnO7b
         yyJQ==
X-Forwarded-Encrypted: i=1; AJvYcCV9dqOYjV0UP8mh+f1mWvnYjEv8M5s3YsnWstyPNWX7U6bXipf8N8w+mzf/TtLSNFFYlkiX1IVSVfAoVAo=@vger.kernel.org
X-Gm-Message-State: AOJu0YycacD45mGD1igImOQ5FJbB07NCk7GVGz8HNpfzLNessbVF//IK
	pMrrJRdpwelS4XxR7W4sLCcFZIQ/cggt96yHdTnZRz1wMASMMKIlY7vybdHn424=
X-Gm-Gg: ASbGncvRPJSTDjDjQUbEcZaX35iX/d9qYVaxsK+CpokNCqrm7iIJfsuko0kYNt7pMid
	oN5AgXYBEas+2ge0vWccEnkcJIZHZAkJXRrLoggSVJEv3TkKNPZPMFIbtaQ8Ys/Vsgkvgd78yij
	wfhGmz4uRCzcYUSTpBD6dsKQpwE3BejsbBp8paWCvmOLhtRHhvAnlIkT2c3O08lLx1GG0JWygDZ
	fduZO74bFFkFCshiH2YqeLjB+vQlUaGaiB8OVR/jkicspfOcX+ZZQGMjsyz1J3pw5M1lv1UHMgF
	5hzwqvAxcWdUNSiC
X-Google-Smtp-Source: AGHT+IF60Nrg56AuVmMzOdpuxKpb48uNb4fjvgwNZgYIhjdvOfRQGICperZSi1yz93HUq9t/Mg45tQ==
X-Received: by 2002:a05:6000:154d:b0:385:e17a:ce61 with SMTP id ffacd0b85a97d-38de41c5b79mr78637f8f.53.1739202978665;
        Mon, 10 Feb 2025 07:56:18 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38ddbfbb4ffsm4521649f8f.94.2025.02.10.07.56.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 07:56:18 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	linux-riscv@lists.infradead.org (open list:RISC-V ARCHITECTURE),
	linux-kernel@vger.kernel.org (open list)
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Alexandre Ghiti <alexghiti@rivosinc.com>
Subject: [PATCH] riscv: cpufeature: use bitmap_equal() instead of memcmp()
Date: Mon, 10 Feb 2025 16:56:14 +0100
Message-ID: <20250210155615.1545738-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Comparison of bitmaps should be done using bitmap_equal(), not memcmp(),
use the former one to compare isa bitmaps.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/cpufeature.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index c6ba750536c3..40ac72e407b6 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -479,7 +479,7 @@ static void __init riscv_resolve_isa(unsigned long *source_isa,
 			if (bit < RISCV_ISA_EXT_BASE)
 				*this_hwcap |= isa2hwcap[bit];
 		}
-	} while (loop && memcmp(prev_resolved_isa, resolved_isa, sizeof(prev_resolved_isa)));
+	} while (loop && !bitmap_equal(prev_resolved_isa, resolved_isa, RISCV_ISA_EXT_MAX));
 }
 
 static void __init match_isa_ext(const char *name, const char *name_end, unsigned long *bitmap)
-- 
2.47.2

