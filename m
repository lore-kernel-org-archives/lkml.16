Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F6BD19992D
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 16:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745600343; cv=none; b=LtmNsm5DOdyqImuXYZzx2pBe2DL7RdaeM/LRIy455fksw3KmJ/88jNd9TC3if6pr3dZhAN8tK60isEz+ADZ0Z5jct2skUJTQb5DpDjn5a032Twb/BeO76wkrrjp3bd4HMA7ErBSN16XuNoXpi6/PaRX6Uno/3gwANvswuJY0opc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745600343; c=relaxed/simple;
	bh=TsDiqqXHnav3HmyWG9emSnWWF24t9EmEsXuGzuIgaZY=;
	h=Date:Subject:CC:From:To:Message-ID; b=jyROWEvhI9nTwW9bETFlMfl7kXumsG7/5dZ39aZ8l8bSQciQvX5k5xR59Lt5FBribv2Cuuvw2ossd956DzLqPybeQD1cLYIvqymBim5+oXUNJw1g5kN3R4y06g39qRrYE8mMjNzadddaW/Y89KwjdfwR014MiTTNH6kQRYaGRWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=X68Z0D8S; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="X68Z0D8S"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-73bf1cef6ceso2654213b3a.0
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 09:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745600339; x=1746205139; darn=vger.kernel.org;
        h=message-id:to:from:cc:subject:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NefaNqk3RjvDYqaLH5irY4z1/htHyWmzbblLCF32TN0=;
        b=X68Z0D8S5n17+LGGvKvzDXxwelEtqBhySXMN/NtjW8TSjnw0P4dN0x2WAWUBk2jjpb
         /D3+bxeWfydm+XVrYqYV/mKDtFUarbu8uOZXSdVqlGbASlcUXeMo2KQVQvHF5003eJBh
         31bZ2b6gV5SKmQkDZg6ofnCAUv+HT2fb59nm9b98qhIyRnuBU3wVMZYETRA6Q7TeSC5Z
         BycEiHVa72qkbhyjH3Fg8mOz9LcnGvnWCHNdE4I1QFV93v7R1r6nWsdJNDT1/SFqbo+f
         URR0CmaXyceGAVW3sGDgQ2dA2FJUb5MguqmRccBYe6t2vd8ze185HOeQV6/miziQEoed
         3vcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745600339; x=1746205139;
        h=message-id:to:from:cc:subject:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NefaNqk3RjvDYqaLH5irY4z1/htHyWmzbblLCF32TN0=;
        b=MMrXktq01N7H3xhww5djuuBBb9slkpLc6Q4TV8KsCCk4pM+l3Ma8Kr8AfaEQWtgZBY
         Z2wYGuWYPHo03ybttLzG7jJ5medgTRTEZ7KMaL5Mpjej3t4T7F2lc1n+1ZEFfvz81tMq
         rpJL2540kLqrlbjN72lZfVNCcUTEgW//Eok0gfvgnQ4uqSVQenjObq8eMBnJ8fHU05x/
         QuroBIwqTEi9TLWbOaNW5+tRsmWxf5vvtL2onlTxOWw95Ooi2YpcRZJIqFngMP1MnTXW
         JSBkD2UhRFaH7bLM/C4DnvZXJKFp0Q8s/rDhpwKiYuRmVaDIEeP0L8YbWSEh+V8GtuLg
         I9Gw==
X-Forwarded-Encrypted: i=1; AJvYcCVQwU2vVdWzxoraC50Ql+sUSeZmsgU0CMl5eq4m9LRMn9QzlfkfRMTkSmUQ3ODHxkJ/ReJ7Rk0hfgWA8J0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx29Ajh22q9jzhkhpDuNU3qyq35+TitlpvSOmkrHS0prh//Fe2f
	Q+DhfmLbhXSXcQ/seJy6rd+vQ50wEsiOGj1t2W0cu5OLXyFAii/jWtcLvyMrATyKSI4oE5GAtrU
	W
X-Gm-Gg: ASbGncvLsNheGzz51c0MGdiTJ3WjyZKM0t2n/AwDET60UOREUajdjXoUAHHH9VzOHiH
	z3Tqsn2V7BbCcbpZjrQRBNc+a8N3Tm08otMT02l4nMAEcOx1GOpdngWzBpAO0uhNgu2zqCfYtqv
	8lkoq5LXx+3nDQzhyivi3G+/w2Cx1dqhr8tCH1m/9kK5AsaLFQyC2I+BYIf8V5ro437bm7ql2Th
	yi7J2bINbKoZ9/C3wsL4hwkrW4KRo4JQF1iFtvM5lyU33uVtulrrer3fHTM+P14rgAhrCt5tDdL
	BNf1fULkpipIF8i0iMmNXyaaAQJZfflKid58GzQ=
X-Google-Smtp-Source: AGHT+IGgerAE9R879YStm8v8913A0Xp7rZn5GkLYDKLRRvjK5Wu3uZuXtRRCHUx4nGLPZRzT4d2mrg==
X-Received: by 2002:a05:6a00:218c:b0:736:5753:12fd with SMTP id d2e1a72fcca58-73ff72553c3mr318817b3a.4.1745600339394;
        Fri, 25 Apr 2025 09:58:59 -0700 (PDT)
Received: from localhost ([192.184.165.199])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73e259135b6sm3408570b3a.9.2025.04.25.09.58.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Apr 2025 09:58:58 -0700 (PDT)
Date: Fri, 25 Apr 2025 09:58:58 -0700 (PDT)
X-Google-Original-Date: Fri, 25 Apr 2025 09:58:50 PDT (-0700)
Subject: [GIT PULL] RISC-V Fixes for 6.15-rc4
CC:         linux-riscv@lists.infradead.org,        linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@rivosinc.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Message-ID: <mhng-c76c6281-8851-4a75-8e4b-21762027369b@palmer-ri-x1c9>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>

The following changes since commit 9c32cda43eb78f78c73aee4aa344b777714e259b:

  Linux 6.15-rc3 (2025-04-20 13:43:47 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/riscv/linux.git tags/riscv-for-linus-6.15-rc4

for you to fetch changes up to 7d1d19a11cfbfd8bae1d89cc010b2cc397cd0c48:

  riscv: uprobes: Add missing fence.i after building the XOL buffer (2025-04-24 13:20:02 -0700)

----------------------------------------------------------------
RISC-V Fixes for 6.15-rc4

* A fix for a missing icache flush in uprobes, which manifests as at
  least a BFF selftest failure on the Spacemit X1.
* A workaround for build warnings in flush_icache_range().

----------------------------------------------------------------
rc3 has all the tree-wide fixes I'd stacked up locally, so things look pretty
clean on my end now.

----------------------------------------------------------------
Björn Töpel (2):
      riscv: Replace function-like macro by static inline function
      riscv: uprobes: Add missing fence.i after building the XOL buffer

 arch/riscv/include/asm/cacheflush.h | 15 ++++++++++-----
 arch/riscv/kernel/probes/uprobes.c  | 10 ++--------
 2 files changed, 12 insertions(+), 13 deletions(-)
