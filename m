Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FA624BC1C
	for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 20:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747947145; cv=none; b=ZNalyAPD+yUPN7c9uG+0qD6Y7DeKCX16KzuHPMST1Ilyl4gTskqlV9SGum1s2R5WSRr/nH4kPZcOqKR9+U3FVZbWoIE6qxPwnomPDSl0zuIMXV3JOXDSx08CFY+sL/JFAD4AQcOQZyfSl/HAjAmYmNxnd5+BJTraPKkOjgcuTGU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747947145; c=relaxed/simple;
	bh=tbPJgSIr/YhJdBnyaqqp97VKp6bOrOObJg8YK6VTBt4=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=Ty8f854lbL+jeKOkEWS2SDGn8uQKvjqWbg7hvHOc4RKwHU9rmee1CT4Dp6wPUpGqKH3d49byiru5pgG5WWodJXl+2DMxo1QXjZI3JQw1QfDxx3/917XVKiUcDYHR1kiaGQj46g0Tw8Vb6wDLYGakGNWOH7svoY7n/5j/hFdHxgQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YK1QFmJP; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YK1QFmJP"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742c620e236so4857245b3a.1
        for <linux-kernel@vger.kernel.org>; Thu, 22 May 2025 13:52:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747947142; x=1748551942; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=lh/Utffd02T/FBnV2lu48AGTTpPeHOAZMAviTbyobKM=;
        b=YK1QFmJPDKMdQSrADzvhMdZ1/XRJ4nRDgNBQlaZiqguD53+vToFWQ1nXwgIvIdDJz2
         om5Xzh4G4/km3DowOrGy5uPgXVKsAGGI+6bdWLGYc+Q9BoXywksSA1RSRg4aSObzXvln
         64wYOAopd3bB6NnJ83Xg0tBlg3vkqC2JWnWbWUl6W+7HFrEhzkib/cPaMwkaFLzOXbCk
         FiQKPFTjhNtu9e1uzWQDVOqcDDzL18wviRDBJGA2FTdegFSN31OYWYKFl2A2vIaKxLqy
         wmve2P2vYksb4kWebt5cWgpnWlvHLY5rAxZIG3B57Qp7uAJiOnOTrEFqV409doJ5C84/
         ZmKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747947142; x=1748551942;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lh/Utffd02T/FBnV2lu48AGTTpPeHOAZMAviTbyobKM=;
        b=N1GzrzOaPSJ9Qq1ZVMZyM/NOBTFpvXxJwRAagU4nVuvyqMLE16gWjIygUzeAmmJ4cA
         xN+LcqivMI72RhPb/LBLL4308prdFcGmo5kMSPuSoepBEH2QCrpZEx5dbFUhHEXWWlrp
         UiyQVdC2h41UlFbI4ktcQFL2oqimxV1xLJ/wHuCraPQi+QaEyr3HaE5iTkmw0GpShw6F
         OV7DsVwtwrDaVJyvNO38A1CgKR0LhUkzbGCN9bGJmGIuhKlsN3G5k3Byatu5PT2N2QFf
         hkebbcaooZ6ZhPsE+u9ogugtKW5FBmXbiBXDL3m07Q4ruS5NyhgnUUS7bA7V3K4S7IIp
         /LJw==
X-Forwarded-Encrypted: i=1; AJvYcCVzM1Yi1/9jUTfhraeJ4XY9QDRpncObVy4aSTlTT1OxGOxshaS7jL/QwgRmcK9p8S4Q++Fa5lYaC9COBG8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxn5/SwW+pvfXCmHRZsze50VsBxvvIGp8IheJp4G/6EX3b65gMi
	c+DRY+VnlEIwvKB0xu6D21ou32mY2nLsALEjb5Ryj43x1akv/Bxanp9OzV9+lp1ilFog1eacNep
	nFlPJPrhblPQmHu7DU6jXOAs8sw==
X-Google-Smtp-Source: AGHT+IGaQtir2ZcxSVyI64xvDdmjTxVFWoE0lsudMVLTodH3E4q06fZUd41aCTAVUHFHXDY94DC0IVeURvd0KoYhEA==
X-Received: from pfbgm7.prod.google.com ([2002:a05:6a00:6407:b0:741:8e1a:2d09])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a20:6a22:b0:216:1476:f71 with SMTP id adf61e73a8af0-2187a6f5113mr342227637.39.1747947141756;
 Thu, 22 May 2025 13:52:21 -0700 (PDT)
Date: Thu, 22 May 2025 20:52:03 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.1151.ga128411c76-goog
Message-ID: <20250522205205.3408764-1-dylanbhatch@google.com>
Subject: [PATCH v4 0/2] livepatch, arm64/module: Enable late module relocations.
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
	live-patching@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>, 
	Toshiyuki Sato <fj6611ie@aa.jp.fujitsu.com>
Content-Type: text/plain; charset="UTF-8"

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
support on arm64, and moves the text-poke locking into the core livepatch
code to reduce redundancy.

Dylan Hatch (2):
  livepatch, x86/module: Generalize late module relocation locking.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/kernel/module.c | 113 ++++++++++++++++++++++---------------
 arch/x86/kernel/module.c   |   8 +--
 kernel/livepatch/core.c    |  18 ++++--
 3 files changed, 84 insertions(+), 55 deletions(-)

-- 
2.49.0.1151.ga128411c76-goog

