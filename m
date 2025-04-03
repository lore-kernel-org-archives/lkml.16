Received: from mail-pj1-f74.google.com (mail-pj1-f74.google.com [209.85.216.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4314D2528F2
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 16:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743699437; cv=none; b=lZ5WWaxtERlIwrzfvcV9O3OOJPRfZqlwQMjP1E4wYEoi3PR87c34SlgJjl9h9W52AZ1mEH78Y48p47eHow75Ep1UjAWNc2Cka0qjmu3UruiBQ/6zY8GuX5hEYfDRTvvYCn5qXPQ0L29Ze8ZJbrIhBuftmOxlD/9JU6O+fprnCio=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743699437; c=relaxed/simple;
	bh=Qz0QomEC//r00eQAz30vgB3K0BsSHU+UqMrkppYie2E=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=CxkqhtHJ+E7rnnLace5MtnqlCe3fTifP+Yrx0CDreP/IZKRf7RljxPPVQPIyFxSx0/d9iYLDWfy7SrcZMM9IEJkSMDQwnBZrW5RoQHiRKm5MBarPkLsDb6VJEwd72HJGDMMEEZAZY+PrlPORfnTMq/AuuPpqySgLieWUpWpiPlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=B1o3lMzw; arc=none smtp.client-ip=209.85.216.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="B1o3lMzw"
Received: by mail-pj1-f74.google.com with SMTP id 98e67ed59e1d1-2ff854a2541so1051048a91.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 09:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1743699433; x=1744304233; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qW8HptWxtTGnb+NyUFSz4Rsqb7n3gW/Agd38GBuyPl4=;
        b=B1o3lMzwD14k3bQAZ1MkTFtPfdRm57m0XkwJqZ56pieytS+1MjjhvMb7ZdPIUxJs2a
         cz82DsWEbendEHhSFmw+048SMdpzyZBBc97CSh07M9o3nEevDV9fC5kuboK8XTTJG2Tb
         e5wS4UniK/VCDtThybyK7zLV/NVEGEmKAVRAJ1FE7MRnmPbw7lZ+iory8vrslXWYRnvH
         BmhO0fSiBeq9s220qz29hVGwzZ+EnU5EhDyTzyGxd+YRrHH2MJvELwMtgcS4R3mjHMLX
         jysuxpCKJA0F5o9Rx4zuh2MOIMtHiQ/+msHugU26XdY9lvbNBWd7Luqcnv+FWr+IWwWZ
         24vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743699433; x=1744304233;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qW8HptWxtTGnb+NyUFSz4Rsqb7n3gW/Agd38GBuyPl4=;
        b=vgVDjtndF3+9dG3dBjB5Ihn5XYKUhUETVEoi1/rypRZiU+sVND4rVnooM/z31mJMym
         3MJ06Kk+0uHRNCNHNNdHZoH4m3Z6Yd2ZEtOak30MCss/AQ+VTEiuK8xSjPnFMwTOkFu9
         jNYyrS+En37xe7GQz8sFl0VTE/YSE+/JFsCxsYyTXLwJlLbwI3S32IHzjZCMk0VjPxwz
         ZMoAKnv2Bo6KdraiHCUtCkNlFvBddH5gzN6weDrOvyAldoVXgsNhb6huxOwZDmgMk9nE
         k9Uw1paQyDOibq/swFbQG12qznRB7VqA0SySQoerPzQn43kjzIhiaW7IwrgggEjG+zbi
         +qbw==
X-Forwarded-Encrypted: i=1; AJvYcCW/DjO2xvLm1hRt0THVlcTKzhQ+OjE1n4GRtzaJp0jl4OrK5nZT8KtEL45IjGKoVR8mQUDWsf/4zLyP9M8=@vger.kernel.org
X-Gm-Message-State: AOJu0YweKG43Ob45qZ7oWFZG9r9I7RMHPAfuSRqXDoeDsUlliNHpat+0
	FItXsKvVKPg88XbcbKG8x3ud28l37yWtzhuv72+TBSHnaPI5DzvkvnEm6EiKKM/hCDFjHS0hhSD
	oa0dx3Q==
X-Google-Smtp-Source: AGHT+IF0CIOoJJeJRQHOUC3EpHHqa58y0n4/IbXEbLHpY4GALdcPXwOZpF/CmwFTc4V9Kvparfq+Lmxq0y9x
X-Received: from pjd11.prod.google.com ([2002:a17:90b:54cb:b0:2ff:5752:a78f])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:90b:1b0d:b0:2ff:52e1:c4b4
 with SMTP id 98e67ed59e1d1-306a4b8597emr236433a91.32.1743699433573; Thu, 03
 Apr 2025 09:57:13 -0700 (PDT)
Date: Thu,  3 Apr 2025 09:57:00 -0700
In-Reply-To: <20250403165702.396388-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250403165702.396388-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250403165702.396388-4-irogers@google.com>
Subject: [PATCH v1 3/5] bitops: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/asm-generic/bitops/fls64.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/asm-generic/bitops/fls64.h b/include/asm-generic/bitops/fls64.h
index 866f2b2304ff..9ad3ff12f454 100644
--- a/include/asm-generic/bitops/fls64.h
+++ b/include/asm-generic/bitops/fls64.h
@@ -21,7 +21,7 @@ static __always_inline int fls64(__u64 x)
 	__u32 h = x >> 32;
 	if (h)
 		return fls(h) + 32;
-	return fls(x);
+	return fls((__u32)x);
 }
 #elif BITS_PER_LONG == 64
 static __always_inline int fls64(__u64 x)
-- 
2.49.0.504.g3bcea36a83-goog

