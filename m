Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83CC312E1CD
	for <linux-kernel@vger.kernel.org>; Fri,  7 Feb 2025 16:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738945186; cv=none; b=PZx31Z60lBeExFtTWnF0j8O73fxiEgzf2ZAM9XUvBQSuIiixNfrI/GrS13atMMnRRSHqiNchB/RPS1ZPUJMRI27ONsrsE1bCSCsefbOVAjivjH3nDKmMzC+m8ejGj7N5TzzM2pWCn/3kFNRabGz4xaif4mRMYbT82Pb30ywKEZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738945186; c=relaxed/simple;
	bh=6Sg0iRkE77uEJwAWh+ctgUflfxfA/frQx26CRg5IV6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IUb62bpCvg9972GIcbq20VzxUfYWeTtGY7r/XJ3iJ51LzKGEFcON+CfUsyF7cxhM9LcGF+jKwbA2djwk2kojfzI+tHbH84Df/avA3XB1JKUyAkfOTXS4zf584ngM1Cm4jzE4J7RR8RSOwcZ96jjrbCjwrMeWbi1Lywt4aVQMblo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=ohy+37Uh; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="ohy+37Uh"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-38daf09d37fso1595156f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 07 Feb 2025 08:19:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738945182; x=1739549982; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EJ4ryrichciX+8we7YNspMa7dFxICsmhpnN7TL2Ifkk=;
        b=ohy+37UhFq3vD0J5mrgwJhrPiL9Xhgys8IP9sXKk34p+HTZ4CwiLbuarrGyN+2TVJ0
         +lCKqKx/G5LV3V+zzy10Wq3ybcnJk6JQ4FX5EZ8KQlXyrrshyzDJx2cBN/KR9sqQiCpR
         GakrOqt28lbDfrhstZeUkg+JBPgVk0VNaJhNSKgzEhcKqTRwICx454tOCSwws1r5c1PQ
         AOeU0Moi1/wGJcxf5VZyL1vAymoL0X+tc29YQOT12kqR2ZVajJCPmKcj02J4IFN06lYT
         JmqwNA3dIJaY467gkT1ZhaHGkQWlCkTgwYvoR/6EOdTz2pESX/B/gep/9aDLRknip3Wd
         kv6A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738945182; x=1739549982;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EJ4ryrichciX+8we7YNspMa7dFxICsmhpnN7TL2Ifkk=;
        b=VnnzvmddoGyOciOrpk6SgghZFo9+E8bSnkAdojg4dablj8A1uVVe3g8qpnwX8+t1Rw
         ebjhFMiNtizQBGRffNfInS7GN7txaQW3qhVAUyMuRFxuVrI5BHXuJgHG7s5ALp9f5Rzt
         WKaVtKhX7/A38tMzMk1aFc03sv9DMiNjL8JGkzNtGTLS+7VBuZD4dmaJln7KDNa9E90b
         vyledFMA3ANVYRTMoRk/g/DDb4BHMGM8t1e5a4nMX5XWTUtuffCcfUcH6bIFBPeGa0Ja
         XXi6wU5wKOn7n4II6wr/4nnyhKh+tsPnMH/TIxQgtAry7O5qva5qj6xRL35WuPlDolzB
         MhHw==
X-Forwarded-Encrypted: i=1; AJvYcCU5IStJqXuLRvwla+fcbQedlsRIHiLDfBeoGzmpTEY+eSJqJJN+5xjfKLNj/5KdhM8EctVsnL4FXRbdRxo=@vger.kernel.org
X-Gm-Message-State: AOJu0YxFhZmlwmWCmmDwz2T7Zqgwjs4dilfreAUWih7vtOXDLdY90LiE
	4SnukcIahANwz/Ttgai9w90eMaOiccBw9lAcI0eJAs19+lLUVHhB8WtE3yzP4Ec=
X-Gm-Gg: ASbGnculbjqzZio7lXSYGLInbn4/EIh1g17dsu/8S+MI5UQ69CqCiGeaPeLblWIAumq
	UxeEH1x7C38hPNUVvBpJdZVjJDIvE6s8C8Cz7XfbRAk+O5GYZ1/RdVdjaH3NSQTftrhsd4G9C6b
	ydBY50UYHay+Gya//5SCezmFs/7Uz4/JgVKGJSvJpwGJqn5Xsa6uzqS8v6hmjJNLBrTpobiWGZc
	GAUbBB6O2IFmo8NIbSrLlvlvFTM53tH3aek3UrZm3JSCZj35WOtJIRdQJJi9Xp3WNMTICZjXFNe
	xWHbXkGMKOXEXKvbFU8X6EyAFtYuGsfkaCWsjdZ09ctoHt2uB0Rqzuy7rQ==
X-Google-Smtp-Source: AGHT+IG28/9nHMpwZ9zU27zLY3KJGdyebIQ/wWucUhOF2SL4GzfsWI7hZj8WoUxub6bn6kq2SBD4Aw==
X-Received: by 2002:a5d:47af:0:b0:38b:ed7b:f77d with SMTP id ffacd0b85a97d-38dc937c3b9mr2561178f8f.52.1738945182320;
        Fri, 07 Feb 2025 08:19:42 -0800 (PST)
Received: from localhost (089144193052.atnat0002.highway.a1.net. [89.144.193.52])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4390db110dfsm97904245e9.36.2025.02.07.08.19.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Feb 2025 08:19:41 -0800 (PST)
From: Andrew Jones <ajones@ventanamicro.com>
To: linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: paul.walmsley@sifive.com,
	palmer@dabbelt.com,
	charlie@rivosinc.com,
	jesse@rivosinc.com,
	Anup Patel <apatel@ventanamicro.com>
Subject: [PATCH 0/9] riscv: Unaligned access speed probing fixes and skipping
Date: Fri,  7 Feb 2025 17:19:40 +0100
Message-ID: <20250207161939.46139-11-ajones@ventanamicro.com>
X-Mailer: git-send-email 2.48.1
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The first six patches of this series are fixes and cleanups of the
unaligned access speed probing code. The next two patches introduce
support to skip probing by matching vendor/arch/imp ids and checking a
table for the access speed type. The last patch applies the new skip
support to Ventana harts.

(I'd be happy to split the fixes from the new skip support if we want to
discuss the skip support independently, but I want to base on the fixes
and I'm not sure if patchwork supports Based-on: $MESSAGE_ID/$LORE_URL
or not at the moment, so I'm just posting together for now in order to
be able to check for my patchwork green lights!)

Thanks,
drew

Andrew Jones (9):
  riscv: Annotate unaligned access init functions
  riscv: Fix riscv_online_cpu_vec
  riscv: Fix check_unaligned_access_all_cpus
  riscv: Change check_unaligned_access_speed_all_cpus to void
  riscv: Fix set up of cpu hotplug callbacks
  riscv: Fix set up of vector cpu hotplug callback
  riscv: Prepare for unaligned access type table lookups
  riscv: Implement check_unaligned_access_table
  riscv: Add Ventana unaligned access table entries

 arch/riscv/include/asm/cpufeature.h        |   4 +-
 arch/riscv/include/asm/vendorid_list.h     |   1 +
 arch/riscv/kernel/traps_misaligned.c       |  14 +-
 arch/riscv/kernel/unaligned_access_speed.c | 278 ++++++++++++++-------
 4 files changed, 200 insertions(+), 97 deletions(-)

-- 
2.48.1

