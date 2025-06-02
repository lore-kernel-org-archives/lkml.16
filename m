Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A9F02C3253
	for <linux-kernel@vger.kernel.org>; Mon,  2 Jun 2025 19:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748893466; cv=none; b=DKjdjo3qBwY54JyuD8+v4s8GE9ASGjD95uWPgkxaGjfwvvp+3C2Kkhr8I0mtWcWV6CyW7NkkyzvkiZb9kQMu47B1kfki6ijeIBp+lRJsmDBswTYv7VvL5HhIsLTdDIVMoGHIy7PpeMbsWJjxZ5szbcVU1GXrnClfBaFw3XBZdg0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748893466; c=relaxed/simple;
	bh=Bp2fzcQk3mM4Q8panST8AmXAuEGrPvuQWGu5RDFL0TY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=JWnqbUfI7zMmx0R2r9afHhXPYkxWE7O9G/Nt9tdYHo+uJigSOrlkRFbXGgbUFIhhBb0Shk+ZN/NFA1dxfwV5KukzPyz0CVsbDTwM4LM/nQoAG6UGjx9nNOGSrCN0xiLo6Q01zLYnpiSUNwpdzWEyLd8zfDMAUvE3wb6KrPq1CnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=AaTMWrf8; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="AaTMWrf8"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2353a2bc210so30359955ad.2
        for <linux-kernel@vger.kernel.org>; Mon, 02 Jun 2025 12:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1748893464; x=1749498264; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qEp6s4mJMfBcwAEqOMhM3Y5rF5BuKFrDXF+odKAiT60=;
        b=AaTMWrf8xogIDR2f5X3Ue/Bplh72xr3Upreqv+FlifWnzQJYg40kuE0YwnVg1Ay8dY
         nL3E/GP9J994jSiD5TE81hljjNhaQmyDup5C1axdan+PL0iKhGBdt6+ULwgWwmqGe5Ui
         b3JBvttiUdFUcrSd5x9dZtIn7IGhxt5fTygXcQiJsahNXViZDz35v0vg9g/SGTNupNeU
         i9G1ZBWO5A2dgL2trfnNst34mwVGimnNFDKUGMcZvDSZqzgKpqFGjL51GOhSWgzXMETC
         KQsLk1TwzlWDGInO+U78C23m5WkBtMen0/6aM+GKOzYM6zsd7pCL5U1LapuBq8n8jfe4
         3YFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748893464; x=1749498264;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qEp6s4mJMfBcwAEqOMhM3Y5rF5BuKFrDXF+odKAiT60=;
        b=bwkjzIn8NUiZRfKJl8MhoqHrwD0fRgqx2SDiCzGcNW2f6LdlkHTm5glYu5JeMDR+VK
         xLrkCZys2ck8VW42TGzq73WDdGvkqVUbAktvIj0iW2zoS5prWUMhHjPeVjBveHsRpKI9
         6SXgF/pfPcPo4quYaT7zwwa2VwFE9Phqgs+/Xl3g46k8S+1Me0mHb6JGbL2eLHVbQhWJ
         re+BcAQyyW4UYUvBDvJCzlvUsWMIPQRPPnGedyuqT9Oo2An2UwiSKkWCimUjgO3MovRs
         NAmLMaqXi9NO1HMFXmXVUims/V9dSWdM1psyEBGHtAnTX8bqBXjDwP8Yyom3bPtTI4fX
         OhIg==
X-Forwarded-Encrypted: i=1; AJvYcCWxJeKpbc0xGCY5zz+rQ2gEVi1AXraHZirORJByi0sp3oDe5TyIwuQ7tH9Bv7pmcLDYnG05lKk6yLdLXM0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzN8R0BC5RRn8GWzSg7EefEWmkFTIzkwm2w+nUfMCbkZeXWlhdR
	XKIgVaTjqIkgqEjWTLfzGNIjSWBNIUgY5kzxnElvvhzcQIKy49YNCQ6nDKkSURAVt+c=
X-Gm-Gg: ASbGncvPIQdnyG+zp8PDSkDpJ01p3nMpY8aj/WT9TRLKTSpe3/HjZsBAsLTBEqm9jtJ
	vUhk691Mp6JZeIHFLACXITJtZj2EwWtmYSnnJEdjJqaYmmCkxQsJFAywevi2ujCb7XxiOGwPr03
	bQfj910WXuVgUmZQDqM4i7vdOZgaXVrZktS2exrLcraHmcEAPXhTz+zTFTq0IogKLNykOAK+CkT
	5tH8tGikGUg2oxTKmWFWNJ3i1xuqIydXvaMNhi5RTujVzr277QL+MDS/fH0FWb4Y+u2yzRojBXg
	dAAdbBz0PxNuh715bqhcXbDR/2M6UW+jA8vDTXea6+pZm4rPXqm3IeXMnxVT45A=
X-Google-Smtp-Source: AGHT+IGD2HqrpkV1OTN2wI4y4q9I/M/RJTvbZGxdiPyPOVpVJFsIw9woqbqaTfcw13MkY7ZaQohTCw==
X-Received: by 2002:a17:902:e5c4:b0:234:9670:cc73 with SMTP id d9443c01a7336-2353942405bmr202413845ad.5.1748893463876;
        Mon, 02 Jun 2025 12:44:23 -0700 (PDT)
Received: from carbon-x1.. ([2a01:e0a:e17:9700:16d2:7456:6634:9626])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23506bd974asm74589615ad.97.2025.06.02.12.44.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Jun 2025 12:44:23 -0700 (PDT)
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
Subject: [PATCH v2 0/3] riscv: misaligned: fix misaligned accesses handling in put/get_user()
Date: Mon,  2 Jun 2025 21:39:13 +0200
Message-ID: <20250602193918.868962-1-cleger@rivosinc.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

While debugging a few problems with the misaligned access kselftest,
Alexandre discovered some crash with the current code. Indeed, some
misaligned access was done by the kernel using put_user(). This
was resulting in trap and a kernel crash since. The path was the
following:
user -> kernel -> access to user memory -> misaligned trap -> trap ->
kernel -> misaligned handling -> memcpy -> crash due to failed page fault
while in interrupt disabled section.

Last discussion about kernel misaligned handling and interrupt reenabling
were actually not to reenable interrupt when handling misaligned access
being done by kernel. The best solution being not to do any misaligned
accesses to userspace memory, we considered a few options:

- Remove any call to put/get_user() potentially doing misaligned
  accesses
- Do not do any misaligned accesses in put/get_user() itself

The second solution was the one chosen as there are too many callsites to
put/get_user() that could potentially do misaligned accesses. We tried
two approaches for that, either split access in two aligned accesses
(and do RMW for put_user()) or call copy_from/to_user() which does not
do any misaligned accesses. The later one was the simpler to implement
(although the performances are probably lower than split aligned
accesses but still way better than doing misaligned access emulation)
and allows to support what we wanted.

These commits are based on top of Alex dev/alex/get_user_misaligned_v1
branch.

---
v2:
 - Use __inttype instead of unsigned long for pointer cast
 - Add Alex patch to make unsafe func use existing assembly.
   - Add missing EXPORT_SYMBOL(__asm_copy_to_user_sum_enabled)

Alexandre Ghiti (1):
  riscv: make unsafe user copy routines use existing assembly routines

Clément Léger (2):
  riscv: process: use unsigned int instead of unsigned long for
    put_user()
  riscv: uaccess: do not do misaligned accesses in get/put_user()

 arch/riscv/include/asm/asm-prototypes.h |  2 +-
 arch/riscv/include/asm/uaccess.h        | 48 +++++++++++-------------
 arch/riscv/kernel/process.c             |  2 +-
 arch/riscv/lib/riscv_v_helpers.c        | 11 ++++--
 arch/riscv/lib/uaccess.S                | 50 +++++++++++++++++--------
 arch/riscv/lib/uaccess_vector.S         | 15 ++++++--
 6 files changed, 78 insertions(+), 50 deletions(-)

-- 
2.49.0

