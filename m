Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DDD1D5CE5
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 18:43:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747939408; cv=none; b=ml9SIG5vB67eropf0PWalwBnISqVkI10Hz8dbp7GKErez/8cc8l+fohaUZLPt35uk1Cy/B20E6cdI//FPTyIGxjyr5Z0fkGDP5leEV51ROwtDyPOUVfXxx8talxJKRBJhpThtLC1Aa61q+8UOSid+Yqs1N0MSgoJtVsRgrJfy+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747939408; c=relaxed/simple;
	bh=9PgnyaKfoiMCFCe7k0tzRnhS7quMdVuCiMUDEaqbaXo=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=GvbACRfA7Jp9fjAcg75UeLhcq5HmyG22nE1EgvZvJfmv5uV37awCzNeDFIcbeOrPSX9LCuHJ6sDF9pZXN8mZtsoL9kuzRuHQ1eaS4eowud4djGWONpR9CPRdFmUJQnRAT3Vb6ImJjTVT3m4oghHeoznop/EY6Gz3mKJDsF0sSWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=q+8wM6Mt; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="q+8wM6Mt"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-74299055c3dso11424299b3a.0
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 11:43:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747939407; x=1748544207; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=kJhW3AyBTwLj+5fICMaVOix+/q9TCuLWjAHHEUs+ZtM=;
        b=q+8wM6MtyOqINv/yop931jXYuRzUmfbPxhHfqPQnZWaiYLtJxOdI5qlvLOOWGve8dJ
         C5pd/EkHC1eZbgPSAWlAo/PIVeflcrygKwOQNROE3fTHgdnqEAWxaCqoXhIKkAeTwRvv
         r+/tZZpsTnwOi98OJObxsr64nbA+2tlbKMaCtyTtZ0WXxCeI4oaRyAcOt/Yg6KZyjQ6T
         BEniyTpEXXUoVx3QztY7nawY1g5HsMjkbSsFIAPPYd3vsL9q71UFOxmq5U3DPeXZ7QDn
         YEl1oJfPXO8YWwWcOSQFxWwzwMAkYY8L5FEAu6FDDQIv/66Lvew3bHsbB3qNxHyoBP4b
         VaXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747939407; x=1748544207;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=kJhW3AyBTwLj+5fICMaVOix+/q9TCuLWjAHHEUs+ZtM=;
        b=uWI9deJxV1eviYhU1Be/iPdJgSvk7lvd8OB36Thgxueu3UU0js3g+q5BCNr2tjgkAQ
         elh+7zo4csqJP8JgqH5jfCm0OiCKhk+dDwRC9mf+u91S/w79bryywoclszrt/wDjT49m
         LpNW+YBKNoDrwm58y6TZF3yeeSyg2Yl/ktMQG6n8MkT9CfdbOSJad5hdhhLrtl0qgKOd
         gOuVOYSdb22ugCKODDviD3dpnBFzbmzKt9PmqaeWkgV+Pl33qbCD8xWMAANDPBYmV29z
         19s8rBqDnro07BxAbSUWXAeTSlr8K2mWMDatnzpy7g1JK7Cwslv0uqGS5xyK/UklRVXL
         LmzA==
X-Forwarded-Encrypted: i=1; AJvYcCUzUt0WZTOFc1fCGNsTt8dIy5TGgpRauHs/l50h54sSW7+obStDdkfD8z70YoY7WWCYOnAFh7tfqSQfDlw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLCFP14Px1FgDckI21amJ4Dg2f9c7xUMi1mypdTLP8/pWAuZ05
	/wfjl+uptENZv2xbNRuzqM5I6oGjfN8nC6kR9W+owvd8ESVsB0zuRtdpSumIBKgzm35P5F8qpVd
	JtnhksPZp7xU9Xs5eYOYXatgN2g==
X-Google-Smtp-Source: AGHT+IEoHYQeMI2gttjWN9nuJgkrLE6pE1VViQG8vIffgAD4ufQc//tDtGttUcf0KhgAxWPRJDyiNtZL1pXHRY8ptA==
X-Received: from pfbjw12.prod.google.com ([2002:a05:6a00:928c:b0:736:b2a2:5bfe])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:10c6:b0:740:a52f:9652 with SMTP id d2e1a72fcca58-742a97aa35emr32848725b3a.6.1747939406599;
 Thu, 22 May 2025 11:43:26 -0700 (PDT)
Date: Thu, 22 May 2025 18:42:47 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522184249.3137187-1-dylanbhatch@google.com>
Subject: [PATCH v3 0/2] livepatch, arm64/module: Enable late module relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Josh Poimboeuf <jpoimboe@kernel.org>, Jiri Kosina <jikos@kernel.org>, 
	Miroslav Benes <mbenes@suse.cz>, Petr Mladek <pmladek@suse.com>, 
	Joe Lawrence <joe.lawrence@redhat.com>
Cc: Dylan Hatch <dylanbhatch@google.com>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Peter Zijlstra <peterz@infradead.org>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Dan Carpenter <dan.carpenter@linaro.org>, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	live-patching@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
support on arm64, and moves the text-poke locking into the core livepatch
code to reduce redundancy.

Dylan Hatch (2):
  livepatch, x86/module: Generalize late module relocation locking.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/kernel/module.c | 114 ++++++++++++++++++++++---------------
 arch/x86/kernel/module.c   |   8 +--
 kernel/livepatch/core.c    |  18 ++++--
 3 files changed, 84 insertions(+), 56 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog

