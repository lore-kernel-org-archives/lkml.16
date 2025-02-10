Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F9AB2505AE
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 21:36:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739223374; cv=none; b=JToUdTrOLmYrXkQV+GuFquDDaB84j9nb76kyfKby7T8vgfbJ29/rSem3Gwu0yNiz+rR0V/UZaC0X8oYAiyp8wqHKjpUiqSTSIXtm7nf0fCYsN3XTtMomik7oGH0Y1pTDmC37Zhk7ekIdmNOhkPJrea1Kloe4j76SKqgUm4wiLj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739223374; c=relaxed/simple;
	bh=xTCgvoJ3M6PEdl0c4FHPJfLCd4JS4VwrygYqNk3pK44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=d8fRQ1bkZX8v0PrAWhee69/ZlQ7Z4JBnCx4tbyRsxKK6/ImwZNV76NgXo3OJ27drXVG9GEZVcZhoVCMbl714kKs1ZiLSDTRFldyxuKkhCnNDHwWP1Tw6kkEmyoCcrynDVZyGDcOsM7Xx7xkTKbeQqMBGETD+1vFZ7jQEaXyNCgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=Zv2LhLjy; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="Zv2LhLjy"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-38dd0dc2226so2625089f8f.2
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 13:36:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1739223369; x=1739828169; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=Zv2LhLjy5DAB037KYpl74pELKR5wTjg5ENN3HT1W+gGDXFx7OCfG7HPhKEf6XSXSPR
         Vfu2bnfs4qylZjpMWp5LOmcReuKpeZlliX1s/+He0EfXpPBCdYPR0VKv/7vlRO73Qtxw
         fUwtiklYFaT6npCYnUeAVubZEwg4ncJjHGfjPT1VcpE+v6kSfSpusxsINFiv47wOEP2v
         vA6VlnsHSw621d9Qy2icftkD843LTtslRnaVJ6bIAzbwOupblO9v5fuwJ44gntnqkqkh
         d8C5K23FshLqMfl/e+RfgCxBHGLtuO89EOcZE5jfsPYEw34TMnev5kH/7+wiCI9cDFHg
         scWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739223369; x=1739828169;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8KnDLY3kffZnCGFmPEexJUKlO/NVt183lUvBn/SEPO0=;
        b=AbRm269IHxEWNACUyn4euKS2btwHuNb7+AX7BEex1IDmcScmnwpHlQNHGOcpgTJKdX
         8vVqf71Wr1DGoqd+sZPxhjvQgGr4mG6Qadv6t7pE99Cncf+yJt+X5Oz3TWHzakbEhCLx
         rMtt1xmYPJd01/PYhRbQhI5HlUoc7bXWCdqM/dXIWmKcazFEGB/rUG3N4tYrVXvtltqm
         GWkCanhKDG45OfV8faI148RcJ4a/T/oWAeB8pRUOoD3VBrZRfYCm7jPV8sWATQ0hKLfr
         ltkdfFbQgBtqPSyzBv7S/IVaRpbjclfcFbKKbws3Fe5oo4BJT2Wjb0jK8zM0l47TtOBo
         xhfA==
X-Forwarded-Encrypted: i=1; AJvYcCUqGzqswNrSPwZKXQBapiNQNUimUlEAGKrNTt1beWZ9hwM0z1Z2yfTDok7MVn8vkpPUGkCcsE8fpz1C4iQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyaFx4dPLuK1Fjunyb1noxUdrHWNFrrbsOBJZAalSmMBLRoAOyK
	5rkHJzV0I/Euwby/tzEd0oiPEge51H6AAZw8inUZVV6LSGl3UpO43OJx1cGwsMc=
X-Gm-Gg: ASbGncsoZitPm2LZyzZxBEMuXU0HKDZ8xrZM0GcM/wAFueoT67NvEBUCcW4O+ZNLKvi
	Fqg6TXvNwMLMaFNjaYYDjXrtIDK+cN/8+bGWLYKbX7pdwgAqtCqwgm8L9ecsGK9q4CHYnqFLlE6
	HTNPDPOfuRVqB90XjOMrcIFv4N+YnarfM2j1kjRo6YdstkvaGxeQ6qM5os2vXSAn/a1VKen8nvb
	yMr8AIavnROGjehTZC6DAb7VNf64K8CnZ/BB/vj/iLZlQKEqEXE4rRAbe/Q/JNgzDuxCzVWdCSW
	1JMSaqQAN849scGu
X-Google-Smtp-Source: AGHT+IEE/P9vsQR8DRZBtCxEbVJartmy037BYwcdFf30+Y++Re0XNH996Xl3DeOOL//RGxNKuAEJ9g==
X-Received: by 2002:a05:6000:1562:b0:38d:da11:df3c with SMTP id ffacd0b85a97d-38dda11e134mr7050032f8f.48.1739223368915;
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4394376118esm47541515e9.40.2025.02.10.13.36.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 13:36:08 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Anup Patel <anup@brainfault.org>,
	Atish Patra <atishp@atishpatra.org>,
	Shuah Khan <shuah@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	kvm@vger.kernel.org,
	kvm-riscv@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Samuel Holland <samuel.holland@sifive.com>
Subject: [PATCH v2 04/15] riscv: misaligned: use correct CONFIG_ ifdef for misaligned_access_speed
Date: Mon, 10 Feb 2025 22:35:37 +0100
Message-ID: <20250210213549.1867704-5-cleger@rivosinc.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250210213549.1867704-1-cleger@rivosinc.com>
References: <20250210213549.1867704-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

misaligned_access_speed is defined under CONFIG_RISCV_SCALAR_MISALIGNED
but was used under CONFIG_RISCV_PROBE_UNALIGNED_ACCESS. Fix that by
using the correct config option.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/traps_misaligned.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/traps_misaligned.c b/arch/riscv/kernel/traps_misaligned.c
index eb9157e3af73..57ded7e74dd8 100644
--- a/arch/riscv/kernel/traps_misaligned.c
+++ b/arch/riscv/kernel/traps_misaligned.c
@@ -362,7 +362,7 @@ static int handle_scalar_misaligned_load(struct pt_regs *regs)
 
 	perf_sw_event(PERF_COUNT_SW_ALIGNMENT_FAULTS, 1, regs, addr);
 
-#ifdef CONFIG_RISCV_PROBE_UNALIGNED_ACCESS
+#ifdef CONFIG_RISCV_SCALAR_MISALIGNED
 	*this_cpu_ptr(&misaligned_access_speed) = RISCV_HWPROBE_MISALIGNED_SCALAR_EMULATED;
 #endif
 
-- 
2.47.2

