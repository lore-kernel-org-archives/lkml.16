Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50F6F2D023
	for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 13:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747575542; cv=none; b=VnjyVjzJ47hwr5vY+6Kwb0NYtNwIC3fKHcFWuW6PxndoD/ux1+Ph0zI6yZmEAyiIUxTVpg9v6AoWTh83RP9iWmDqpA3Ja6mwBz4DYOO0cDLwKoGF1Jhz/eaddojoopHNoMlc1vpGgqz3H5eLo5fZwe6WSDC+n8y/m+tRd5a3+qI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747575542; c=relaxed/simple;
	bh=eH2EpwdFtqTfg4oyY9dj7hDqpl8SFrgx2wY+aGi69z4=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=tnH/tFfUQQJ+Mt/qmGdMlKHt1K2S4asnp+k8v6M841RSwEw/o1b2SK9HBfJujshOWqNfd3jaN2WQ7lYftLLVPSQOmFDDdSMtc5b1apMzoYEIY73lzRLJoyTYNChBmdueHVoS9uC9LfRFKKmvB2+q7pEsx846Pl912XJiq21NDwY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Gc5gCuXq; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Gc5gCuXq"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a1d8c0966fso2463324f8f.1
        for <linux-kernel@vger.kernel.org>; Sun, 18 May 2025 06:39:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747575539; x=1748180339; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=JwDs+xHDiTWAcE74HA+pSPAdKOHYibMMx1ABnC+HMCg=;
        b=Gc5gCuXqiMokhC0XH+yJ5hSy2Jyz4x7iORJP2AI63Aqb5NPqwrEI3A+bipRhzXu2qK
         G0X9wj4r9Ba2fr22Ze4/kY5jYQSu1xOC36ewz/1YYeSKfDREAt2EpB81fQuL1/w1DUMR
         aTStlMnXL1FKqSxA40QCw90EJF4CFG/AbbUd4x8QnVXatQjruMFXjtauXCYrSciwDzoT
         EO9MUklgPv7yojL6xhl+P9M1SKBSv6shTT2Xw7tQ+VXethLl6Nw3X21aGJo4iIlKe01z
         wgDgqiwNmGT9OKj+xRCOtsNp+jpPGFPGcYV6N4r494AGn5fkfGpNCpF6j3wEHU5tAn1W
         ViNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747575539; x=1748180339;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JwDs+xHDiTWAcE74HA+pSPAdKOHYibMMx1ABnC+HMCg=;
        b=g49RzkYRc6NrqVKZGhghm8QbRw/uqTNXfuztnunufhLwwR3Mf24LEbbQf97u4o6pIt
         SwDib+OW9mKNTfJB9aoHLWoU3RMUiLQIyThF2c0uSRhg35wp4NsAiifvxxZGSey/M8SG
         tjmwX7owIS8+5peTZss0wdaqECPhZNi/Kqnyynu+f2dffh10BpNzGbxfPBFIO3BC9QPB
         BGC+trrBJYPZIUv4oHD9PO3B+6a05lC6O0G8DlEAnthxcWcOEMPEZsIYQmlfmeeBPFvP
         YVqAw7T/18gFSpH64Bcgh9Ozx2WK9Ji2dNknb2i5sPl+9vVYTCGD5RFxEbKkw3lEbyXu
         5ndg==
X-Forwarded-Encrypted: i=1; AJvYcCXiOM43AIl80zq9vEla7+Bz1n2dbASeDcgvOOOGo9hyiQ9qWSjwVw1jEkoGEGgBwV0gG9UoC3IKCtp3KDE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyzVCYajWHI1oJ6Bl0YNsiR2fwQsStJb1toM2yq2Suu79VToVf+
	CyK9xisqLxL1h2kywRWrbC6Z5Nn9B+ECGNFMfabWe4hLiqF/LtH4gvqO
X-Gm-Gg: ASbGncvuyPxSMJM8sDBasukDj8bpHr5wzqj31vqYimIqu4ahwDwGisY3pM8ts8BpVz+
	xhKxOMU+ts6X2Rv2tcDPfAHTk9FmSH3iVAtfu/wiVIQUHMOVD4pZ2oGhTL9KIAFrpFdjO/JYYSf
	1nMYHmlD4U0gfOIIPbcE/oOHdX1PuND+U35yHoxMmWF3GHaoH+H2GTxNqB6tNwF5kqsWhhpjr3N
	Vk56C4FplZJOWGlgQjYmBmXMTS+lVg1GHq4FFUZeOV2exAmNFagm3J2+5G3EGc510nuST1St/Vv
	rHWl0rj0lstFdicRbMpV88GKn0I2pg9JgJOIgYn9FkUYZcGBAE44VSus2vNoBNzNrgf73pTsFLx
	Iny27GruCMLNdlwoJ6HMnnMXStt1Zh9/jtH5irM623zc=
X-Google-Smtp-Source: AGHT+IFqWlT8cLv8iCttgul4w0D70n+1cFF04Uz9uxfu7+EhpHDpFzsVvdtHxsPN4XSB3ZY8hjcw5A==
X-Received: by 2002:adf:f1c2:0:b0:3a3:621a:d3c8 with SMTP id ffacd0b85a97d-3a3621ad491mr5529667f8f.19.1747575538454;
        Sun, 18 May 2025 06:38:58 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca5a7d6sm9429508f8f.30.2025.05.18.06.38.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 May 2025 06:38:58 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v2 next 0/4] Implement mul_u64_u64_div_u64_roundup()
Date: Sun, 18 May 2025 14:38:44 +0100
Message-Id: <20250518133848.5811-1-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pwm-stm32.c code wants a 'rounding up' version of mul_u64_u64_div_u64().
This can be done simply by adding 'divisor - 1' to the 128bit product.
Implement mul_u64_add_u64_div_u64(a, b, c, d) = (a * b + c)/d based on the
existing code.
Define mul_u64_u64_div_u64(a, b, d) as mul_u64_add_u64_div_u64(a, b, 0, d) and
mul_u64_u64_div_u64_roundup(a, b, d) as mul_u64_add_u64_div_u64(a, b, d-1, d).

Only x86-64 has an optimsed (asm) version of the function.
That is optimised to avoid the 'add c' when c is known to be zero.
In all other cases the extra code will be noise compared to the software
divide code.

I've updated the test module to test mul_u64_u64_div_u64_roundup() and
also enhanced it to verify the C division code on x86-64.

Changes for v2:
- Rename the 'divisor' parameter from 'c' to 'd'.
- Add an extra patch to use BUG_ON() to trap zero divisors.
- Remove the last patch that ran the C code on x86-64
  (I've a plan to do that differently).

Note that this code is slow, in userspace on a zen-5 220-250 clocks
in 64bit mode and 450-900 clocks in 32bit mode.
(Ignoring the fast path cases.)
Not helped by gcc making a 'pigs breakfast' of mixed 32/64 bit maths
(clang is a lot better).
But helped by the x86 sh[rl]d and cmov (enabled for my 32bit builds).

And I'm not at all sure the call in kernel/sched/cputime.c isn't in a
relatively common path (rather than just hardware initialisation).

I've a followup patch that reduces the clock counts to about 80 in
64bit mode and 130 in 32bit mode (pretty much data independant).

David Laight (4):
  lib: mul_u64_u64_div_u64() rename parameter 'c' to 'd'
  lib: mul_u64_u64_div_u64() Use BUG_ON() for divide by zero
  lib: Add mul_u64_add_u64_div_u64() and mul_u64_u64_div_u64_roundup()
  lib: Add tests for mul_u64_u64_div_u64_roundup()

 arch/x86/include/asm/div64.h        |  19 +++--
 include/linux/math64.h              |  45 ++++++++++-
 lib/math/div64.c                    |  43 ++++++-----
 lib/math/test_mul_u64_u64_div_u64.c | 116 +++++++++++++++++-----------
 4 files changed, 149 insertions(+), 74 deletions(-)

-- 
2.39.5

