Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A34F227EA7
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:44:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893479; cv=none; b=OM6+0TSycExLoIa9dGMghh6ycK1aS1RUmSe+2GU4uadSq2Zqr5zkc2502C/Ndl+iX3OZb0I5SYnTBm247C7qvyyKZvHDOcmBQ4tvqc5jlmBoEmpj4ljsIN7upKi76melIevHL29Z4DZeDCJFiFQYZuJMwHzKvI3MlFk46wSkPbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893479; c=relaxed/simple;
	bh=m86mWweeA9Ak95YLUpC+nPRlhYzIdQ5qKntHnCrwvDI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JCzZWQWwk23zMN5qPvPkQcJxq3pe5GNgqDLkOsdoebu+FpzSXLYuxWMuXQLR8EZ7urPU2M/sjfgkaCLPOTeNAZw5RXnd+RvdprV/8Z0bvH5zwj5U8cZP3NYH2ZYRHTmDgVDnvyez7vh73N0UGU0M+0c98fVqVB17ZSThUv3QWRk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=eVcbuEab; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="eVcbuEab"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-234f17910d8so45717935ad.3
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:44:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893477; x=1749498277; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=60pgDrU15Q1dZJENX35Q0Xke0F/FZ5IdLg55ZZD51Ko=;
        b=eVcbuEabe94zDwJT5AiR4wuS2/jmsSijdBWOOwqrx+k85LMJfuPUmJgxYTQF9hJ9bH
         2qe8UCNjAy0kCjgk5+/IpIPPgJisYgaqAiakoOalO9HtLbZglHmvsuF1ItLLQnvwhxUr
         AyVnLd4W0OrbV57kr10Vlnm+RCgbv8ZyfHLtAslb32xtwVrRSkNv5fK9CA/pl7EI24id
         ze5Ag89bo0Bus75G5ZA+swP92LnH1QfUdC5z99re7izE5YYhRz5CkPAjEAQNQVeJB5Vp
         crleo12bureDeYZweFz1YbM+pnAWEa+demW8xGYTFX5y42e3rzLL2aG0HbDzYu/J43+n
         mzXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893477; x=1749498277;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=60pgDrU15Q1dZJENX35Q0Xke0F/FZ5IdLg55ZZD51Ko=;
        b=Y9UTbP32K9XAR5VVnXf6hAjYYngjh2mLJxO9SC9rJrHusrPZ4IzIHQ5HBD+Fq0/+87
         l9PmYO6uqUb+0xs4eSn1sAetzSkwyrRvpj1nn5chjTex3l8mhjP5vPa1MNBdOGYUWFA4
         K2KPYEujhDnUFOj6UrLEsjeZcvD5Xl+aOeLVqkEiHWT6SU7my+34RbB4oTh/J4hQHgHx
         KnLdlNFNuWhTkcpCQe74STwfqMxWWHDWw159qsL1aCsJSg4skYhxup5GzR7nuBZPbCHq
         AuH5J+oOGyWGkC6yhpUgzkPmyTBIbKT1rSHTk0wDqDdiS+LOeioFQXxU+QHt6b1rUlrb
         fz2w==
X-Forwarded-Encrypted: i=1; AJvYcCXPcH/t4Fty2/mcC2pGaPg6byPOqhjhAWYPGzpuqDHC0W3vE8q9X2dNmIdVoB9zj8lQ7Vj/KknFxHnicgs=@vger.kernel.org
X-Gm-Message-State: AOJu0YztXNh+L/+NMsVutyYXlGV+KN9SPtkx3s3IZrxcq0stSDhqAjab
	U56HeJpBficZOMXHVcrx1OH7sGXjbQThPckK2/PJHfzeoVGbGXi+/E/P5Qni5Y0ozPDqhdJJJth
	P3IXcIgs=
X-Gm-Gg: ASbGnctFmB7RQe1EWidyjID5/H/+NgvbSGRU46YRBnrrBMzLw5xmHVwT0BYU5QeXGcz
	1Gq33jbFQn6KqVKDEa+ICF2kQRpKi4xeFYvVcWuPQpZp0Meq02bcjmGKFfwXhqPurbZCLbOJTlu
	IGJjVOjd/5+X1uvFYWwfJx4ajR4cuNhlwKvxbuhDO5eVHmjJUAB76DHnqfOuk/FZrAaWyZDsw8F
	v0jv4QD7HGkrzdpOPGVJcfQRhOxy42C7hjeiOGt2I/U9avruDNRq7P4JjY7jJJNkLsxKYrtvXNF
	4T0AM6wL7z76QNxnQMAOWSfglGz4m3ZyK0+mnze2JiR+/GYC/jEo
X-Google-Smtp-Source: AGHT+IEIHHsZjf4J0ml+6mpE8+yLkKp4H4vo8G9A6uKjKuNPrdkWTI2+f9FxJdyW+FDKO7b9LwW15A==
X-Received: by 2002:a17:903:185:b0:234:986c:66c4 with SMTP id d9443c01a7336-23538ed95c2mr178422005ad.1.1748893476789;
        Mon, 02 Jun 2025 12:44:36 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:36 -0700 (PDT)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	"Maciej W . Rozycki" <macro@orcam.me.uk>,
	David Laight <david.laight.linux@gmail.com>
Subject: [PATCH v2 2/3] riscv: process: use unsigned int instead of unsigned long for put_user()
Date: Mon,  2 Jun 2025 21:39:15 +0200
Message-ID: <20250602193918.868962-3-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250602193918.868962-1-cleger@rivosinc.com>
References: <20250602193918.868962-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

The specification of prctl() for GET_UNALIGN_CTL states that the value is
returned in an unsigned int * address passed as an unsigned long. Change
the type to match that and avoid an unaligned access as well.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/kernel/process.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/riscv/kernel/process.c b/arch/riscv/kernel/process.c
index 15d8f75902f8..9ee6d816b98b 100644
--- a/arch/riscv/kernel/process.c
+++ b/arch/riscv/kernel/process.c
@@ -57,7 +57,7 @@ int get_unalign_ctl(struct task_struct *tsk, unsigned long adr)
 	if (!unaligned_ctl_available())
 		return -EINVAL;
 
-	return put_user(tsk->thread.align_ctl, (unsigned long __user *)adr);
+	return put_user(tsk->thread.align_ctl, (unsigned int __user *)adr);
 }
 
 void __show_regs(struct pt_regs *regs)
-- 
2.49.0

