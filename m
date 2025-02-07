Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265A18DB04
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:19:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945193; cv=none; b=KUh9eeoRnKG/rIk2fN9IWYHRxHxSJx5EglZliMRRJfAWluTAxNx27PuPSlr9aFeBCKYq7uS2VrI4zy0wyKIRh2bp9h5WpqETlTo5AF9n7JnI/YXd48C9wtSX4T3y8kbC5Z/QX5K/QnKXsxlPgJ63ahevPq8pAkXOmFEJVWJ+liY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945193; c=relaxed/simple;
	bh=c9+jGsuHaZ58BvCwmZlEGmua3y5mogvp457gXg6onTM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UlJWwfC7OaWnEEVpURdeCJMreBrlcMHH/W9Y/D65GuJeGDiir5uFz94Uksfb267O+CDgAb+LRGi5OO0aSaZMsxA4lx00sRMS/ptj1+QEWE31ZQ9KFKE9/m+yYFUfkM2Cr89gqtGwmVMeJEr0dQwCWfLg9UbUSvUXEChTxPj0W/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=bcK40DDS; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="bcK40DDS"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-436a39e4891so15775495e9.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:19:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945190; x=1739549990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=voJ+wA65lTYRPtl00Mu/vMvJWZVBpxfrm7iohsFL00w=;
        b=bcK40DDSH4de9kkQ6GdKs1gzGf9R3llcem2KmMmEZClk67SWjqvcQDvYN7NepuywEa
         iygDJyvyPv/QXU7ujBIlIRF5UEQT5fPdBwLJUVnnX5ql1welT+clZzHofyKhQxyYnEla
         XQYgNRy9xuV6wBUj0WsBP2T/J0HZxJAGMivjFuvI0CIJuMIwZmCo0yjvm8XRMKsk1eOw
         /6/DY3WQmWld0MR5U+OXvxsDSOymxDR9L2rVX96XmKFb+lgSv+k6gAOaFUA1wt2MKhrI
         5WYT0xGmF71oicb1ozP2stHOTPPOX1U4UtEyK5k3wzjGSEEBciL79Quthd1Tex9p6WVO
         K9LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945190; x=1739549990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=voJ+wA65lTYRPtl00Mu/vMvJWZVBpxfrm7iohsFL00w=;
        b=CSs+QVbfLCpYLUXZT831JEjEeTFX9dODNY1VxgfdMFh4VTOKhy8O0t5WBfjSOT/2c5
         3B41Dhs9IzEWb8l6BrWaHNKkPZClbhlY3dtK01HdZZPJA8kWDjOBHlsovtjncqIBFm8J
         p2QINoakk83u0TjYN5ef1B7UFRfkB0FNcgg1Txql0nNdt0CK+m+BIAjMeC7taervRMRV
         058rym8OvjS4gqausdou0DjyDJ1TvqE0pXXIg99DICnj9Md4+ZcvTUByHuYRW/cg8PZH
         MnViWoyl5vXSwujgf8rvSTusFfuiae3grmFMw9o89GJGrTd8EghBFLA5G2BDYMfT8aNq
         vGeg==
X-Forwarded-Encrypted: i=1; AJvYcCUaqf1XUriGvQtB4Ly35bTJ5BmYJS1mG0EuzAYvEAOEOZ00dTGBI88WgUdUI1gjp1pyxkQwgRiQiUu0Log=@vger.kernel.org
X-Gm-Message-State: AOJu0YznSCzqgdAx81gAYA3ph3iJsH/DV69ElGzbi4wH/VqxWmI3ymum
	urDMP11JxtP4SRt5tzHD/BQ3/yMn4XAVFS3sjbiLz/RkpxasQWFGO++lVrlxoLM=
X-Gm-Gg: ASbGnct4PjE9mMMVHHiUF0qFxVBSfsqMYhEzpZRn8tGqJExU8MYYiprrIp15heR7c0k
	nzYaDeuHC9hkFgBwSJbbkoHA4vybRTRh/M/8rM6lbPO5P0mJfTwRZLV+LOuxtY8LNTBwK28jyQg
	g2t63BqREctjztd4Il3GsPWMzIjFjCwoNwgNPfDj6BGMkRvP95h6G9/IoVRniaIL7Iga+OCZpMJ
	aIj0ZpVK0CL9WLDrQp4zkPZy6sYyxUFzog6AXwV+FxqqaB11IC8Awb4K++frDu5l5ich8j0ItEd
	LUWDj1+y0LjsFgMsGt7mjIh7ajaOB0/g7IsRr7WhrwUaZfgTkH64xcVeIw==
X-Google-Smtp-Source: AGHT+IGx7QtVfT1JWtMIVcFCuUhUKogTMnYDmeTHogDn6k+cWvy1lOJNfmJ1oXM4MfFvDJRwJ1K8fg==
X-Received: by 2002:a05:600c:4687:b0:430:563a:b20a with SMTP id 5b1f17b1804b1-4392498b3b5mr43554075e9.11.1738945189904;
        Fri, 07 Feb 2025 08:19:49 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390d94db77sm94595135e9.15.2025.02.07.08.19.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:49 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 2/9] riscv: Fix riscv_online_cpu_vec
Date: Fri,  7 Feb 2025 17:19:42 +0100
Message-ID: <20250207161939.46139-13-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250207161939.46139-11-ajones@ventanamicro.com>
References: <20250207161939.46139-11-ajones@ventanamicro.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

We shouldn't probe when we already know vector is unsupported and
we should probe when we see we don't yet know whether it's supported.
Furthermore, we should ensure we've set the access type to
unsupported when we don't have vector at all.

Fixes: e7c9d66e313b ("RISC-V: Report vector unaligned access speed hwprobe")
Signed-off-by: Andrew Jones <ajones@ventanamicro.com>
---
 arch/riscv/kernel/unaligned_access_speed.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/arch/riscv/kernel/unaligned_access_speed.c b/arch/riscv/kernel/unaligned_access_speed.c
index b7a8ff7ba6df..161964cf2abc 100644
--- a/arch/riscv/kernel/unaligned_access_speed.c
+++ b/arch/riscv/kernel/unaligned_access_speed.c
@@ -367,10 +367,12 @@ static void check_vector_unaligned_access(struct work_struct *work __always_unus
 
 static int riscv_online_cpu_vec(unsigned int cpu)
 {
-	if (!has_vector())
+	if (!has_vector()) {
+		per_cpu(vector_misaligned_access, cpu) = RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED;
 		return 0;
+	}
 
-	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNSUPPORTED)
+	if (per_cpu(vector_misaligned_access, cpu) != RISCV_HWPROBE_MISALIGNED_VECTOR_UNKNOWN)
 		return 0;
 
 	check_vector_unaligned_access_emulated(NULL);
-- 
2.48.1

