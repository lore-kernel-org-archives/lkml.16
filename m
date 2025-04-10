Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71AC8290098
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 20:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744315572; cv=none; b=WealWvMC+rx8LLVLvjp4OMpQSaFSYVi2VyWgXzFbcFW51V1Zc32VwHSRNpjOsKhKqhbUFFBvuuVP1YKQK5LvStHzCOiR0VENVkcfes1dNI7aRKGn7vVHBuPEIAGrHqMWyZ3ZxRIZ1KYvoiIuOw0sE+pTqkP5PDNykKIeM4HZYBM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744315572; c=relaxed/simple;
	bh=EfnchvG87jn0RpmHf+YHcDk4Bb3P5sSuFdjZkiH2FFM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=uiVxc+51AfIJl3mnJLkMIlQDEnaInyQUnF7KsrzvyzpvCpeXbfIuL3ho+kLIvjy3FpT+z1GUH+tIFFSjCuJlv9PqJwrJJcA1rt7JYVi1Dqlcrf8M/ZZkVpN3iw2YzzpNBSviKYhye+F4wtqzasUJ+tqh2BJ+268D3YAfZoo1xrg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oyIxQwww; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--dylanbhatch.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oyIxQwww"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-736cd27d51fso1042260b3a.2
        for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 13:06:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744315571; x=1744920371; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7pSUQeH5Lrvt0EMFJOLbDrvaxQumdeLy18J1Lf0zrkI=;
        b=oyIxQwwwehXoW3hOa0+SF2bE6yxSPO7X3eLRXvds+U7KkwY0L4svDM1jR1SlDTQ8Bg
         X+W0e27nzDHDDU3NKVnIpay9ut5P8Hw1vwuRlPw0LOEATHHmn042jNE+rQSX34QbAqYO
         PebA/yb6APOj0itPVH2231nFjjo6ftEkTuOf+Fd7scqySo9w44lrh+b2pf29Wp3F5gxZ
         rRsYFwsf13xKSPqeL/pfPHoycSrBPIx3veCPmbny/yV8FwasZn+sGtjpb1+FMgiPKXyG
         ArXspmnbI1HR5hK+j9SD6tBH69VBm0Cuz+qoDiKJw5O7/bvRl7xcmt12ve4XkJsInlqY
         ITDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744315571; x=1744920371;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7pSUQeH5Lrvt0EMFJOLbDrvaxQumdeLy18J1Lf0zrkI=;
        b=Nm6SS3P8koythyaglH74Bh6pzAlJ8fWMYm8rvttUPfNzWiDlqGN7dhWYNPvBPJW0ok
         InOcZWduHl2WV7dqtDOiqc943JBEXLECo/Iu5TswVWl2FjoeIsWgMDswh710A7WTLRN9
         Lkny0dfvJ5yVNI0Xidiw7l16mnXreUlHCDu6a/LAm0v0aHVHp2MmwVv7I5QtuFq5zJPU
         +8PIEorTitJlQY9+/Jl2cc9k9iG5p4lEgHdAQHasYHL5q22WhJmBubX9b8otWRFw9yqs
         aS6XHyCZMII3h7rYvDSSrL7iS2E5463YwQTRCTH+IDaHi7kIIK04fJvt/ThS6V5s5us8
         0heg==
X-Forwarded-Encrypted: i=1; AJvYcCVJGByLES/CYEoydDwc99qS95OunbKmUJjGHGSeIId20E22aKzCKsY7nSROUK3p/7yl3nOP36d3EY2sNcc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4XkR9Zq3UldXZIxv3An8pqY0WRKoFrVtE8HuFunfkdVbGVWOi
	KbP2Fl6W6ZC57WcC7S9Q7iHJysD/6EAO/fcA+HK4Q1zCaTfvSobuh/bnGKGByj4mODmiOQaF3XA
	e1nVM3SRvA3S3+MF7WMupPA==
X-Google-Smtp-Source: AGHT+IEFY0BUcANrZbjV5gltSeoBNFc21eX4KgKyp7o4ToqSuaxwepzIYnw9qq6LUoi355oYUCPoWXUNl7Jn10mExg==
X-Received: from pfhq17.prod.google.com ([2002:a62:e111:0:b0:732:858a:729f])
 (user=dylanbhatch job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:240b:b0:736:a694:1a0c with SMTP id d2e1a72fcca58-73bd12bef8dmr194135b3a.21.1744315570672;
 Thu, 10 Apr 2025 13:06:10 -0700 (PDT)
Date: Thu, 10 Apr 2025 20:06:04 +0000
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.49.0.604.gff1f9ca942-goog
Message-ID: <20250410200606.20318-1-dylanbhatch@google.com>
Subject: [PATCH 0/2] arm64/module: Enable late module relocations.
From: Dylan Hatch <dylanbhatch@google.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	"Mike Rapoport (Microsoft)" <rppt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Song Liu <song@kernel.org>, 
	Ard Biesheuvel <ardb@kernel.org>, Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Dylan Hatch <dylanbhatch@google.com>, Roman Gushchin <kfree@google.com>
Content-Type: text/plain; charset="UTF-8"

Late relocations (after the module is initially loaded) are needed when
livepatches change module code. This is supported by x86, ppc, and s390.
This series borrows the x86 methodology to reach the same level of
suuport on arm64.

Dylan Hatch (2):
  arm64: patching: Make text-poke src pointer const.
  arm64/module: Use text-poke API for late relocations.

 arch/arm64/include/asm/text-patching.h |   2 +-
 arch/arm64/kernel/module.c             | 129 ++++++++++++++++---------
 arch/arm64/kernel/patching.c           |  10 +-
 3 files changed, 89 insertions(+), 52 deletions(-)

-- 
2.49.0.604.gff1f9ca942-goog

