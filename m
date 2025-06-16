Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1040220DD42
	for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 18:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750099730; cv=none; b=D0mdWLRByero3Ioe+LDmkeyqsHEdzw8b0MMeBtwIzCxp7SRIM49nIrbVdHtMC43e27SwVayD28mJIDgEMVdtEp8thJxjdj1RmGC2dSBZLLxPy+wK6IqYpjfD79JT8hyo0bj93ar77jg7LoyUhrc0PKbjDM/AX5wj5Ql6Qg1FRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750099730; c=relaxed/simple;
	bh=GkW0VUcGDmNsRzv4Q3WU5tFF0zUEcSQwNeXXCVwO7nw=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=A0QHymqG4nRaXFvkoeHszhU3Qc9iEMowlYlyB7TpGzNiFBEaLVqAxXRaX+18lf2m6cfJuX6isGg8LHSmyuWjoCYDoimc/tmjubcm80cJw8MinzJpncVj5TdVV7OE8B3zED3+Laz2tTi4VEoNQ7ooyse5Sjtc8yuTJeDHFAcyZJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=J0BsquGL; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="J0BsquGL"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-6fafaa60889so32320566d6.3
        for <linux-kernel@vger.kernel.org>; Mon, 16 Jun 2025 11:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1750099726; x=1750704526; darn=vger.kernel.org;
        h=mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=dYNgnn+3ZVErHz8t4UCNz5uiPNzVYmO0UeK4IfvaqXQ=;
        b=J0BsquGLKx0bA0xO1W6WPzZY76Gk2BUfJlRhgCMj+wxPjBodm5MSsVz6WhncqgZFKT
         lhKxcEAl+R7p+0cUlsLC3H83BjEIopFE5NFelKxcB/vJe50h02DVOaRlj1cbDMiGZbEK
         toOYdClwxYhJ6xHKoCRIJ7cObMpogGje54x8yTyohnsqycIvmSlMXI6bNXEpl4t+rMFU
         t3H9NIetn164sxb+wQqUWVkw6ThgxUwMMHLoVI4r2O+T/rJcCsvDA2mNqUUP43NX8Y2I
         D9FsUJnyFaxy1brEmu6ET3ZMnRRu+DdBxSYQsZaVs5JHAonlkdeDfOO+aNIFvCPIX/zU
         0RTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750099726; x=1750704526;
        h=mime-version:message-id:subject:cc:to:from:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=dYNgnn+3ZVErHz8t4UCNz5uiPNzVYmO0UeK4IfvaqXQ=;
        b=pxKJmoIPbBw6KaHmq0qrCG8lD5QXoK4regiUnag/6xVdQmDoDYdm4c8lOU+Kr6wopq
         D4Gh30YRl2gkgzgOGfJz/UcfhZDHmi9qE+/P+uOME5IW1H4z4XWzG0epyS71ywSzFJgU
         OCYMT5RKI8ARxbwZue9/uRb7KZtQPiWMjENbJiXxd8q5oYdnVgBr4gt8TEFhzJhiwx13
         FsCSil6fQo1sVFG4TyENzG8WRjPcQJqCvX7FNnoYcCQf9E1QrNXj2OlknPqKgkBVk/rS
         asnOKExzXzTvd60k4PaZAcxOrE41jtCUP2MK5yjAcjH9YtG+DvyEX3Djy+9xVPcMpTna
         lkCA==
X-Forwarded-Encrypted: i=1; AJvYcCV1nVsfB2rNVKwVKw60QKsPiD5Jy1K+nCtI56EuSoUAwjL3SxrP4C5lly/PwogkPC6M1qFgOeDraIobfD4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwBgB2qlI+PmbA7XaHt8rGN66a2Dg3MffXoqV7Gc7138lmmP4kX
	H1U3hlJZ74wCkVQRAdjQPqwdmTRGuVt3/TN090dE26VJJRpY5bD1Hld05GBjfpRT/Qg=
X-Gm-Gg: ASbGncsA07LS46mAPtdn3/d6Frhvw3z4tEsfee6MwfZ41j+XorkLf3AVPOTNfwokztP
	h4PcUdHOIt30/E3rOwJDEp/U/Y6e3zHii8eYz/dDw9CdA/2FzlTBT3uuG2HP0J0u2N/KibpnsbX
	4j6Sz0N10TwjiEIun4jQXGqSTFWW7viC+JOyymg7kJbv+CGWlilXLUVlVuF2t/0Gcoyumy/eIMk
	pyFRWEv38bv818mWb2oA+VrPYM/WalD0vp+j+Xx0UOiy1lSzLq3KvO+2b2q4B1YuSYm3BQgJG3a
	0g2bFIeVjhWgvwbBsoSta9wxpylMAtTPULiw7hpcHC+8/uJW0z6buyD7QBmpCCNV5kNzU3zzJl0
	+g0H/4hPExwz08TMKGhvWAqKEYd/4mBLjszRg
X-Google-Smtp-Source: AGHT+IEvqCye8/PzYL6SITf5gFpwwPrYwLP5WCfJL9EkxuRZl97V6UQ2H0emYqKE8cFSzfUoCciJUQ==
X-Received: by 2002:a05:6214:5bc3:b0:6fa:facf:7b7a with SMTP id 6a1803df08f44-6fb477995dfmr184815186d6.42.1750099725967;
        Mon, 16 Jun 2025 11:48:45 -0700 (PDT)
Received: from xanadu (modemcable179.17-162-184.mc.videotron.ca. [184.162.17.179])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fb35b20eefsm54384206d6.4.2025.06.16.11.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Jun 2025 11:48:45 -0700 (PDT)
Date: Mon, 16 Jun 2025 14:48:44 -0400 (EDT)
From: Nicolas Pitre <npitre@baylibre.com>
To: Andrew Morton <akpm@linux-foundation.org>, 
    David Laight <david.laight.linux@gmail.com>
cc: Oleg Nesterov <oleg@redhat.com>, 
    =?ISO-8859-15?Q?Uwe_Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>, 
    Peter Zijlstra <peterz@infradead.org>, 
    Biju Das <biju.das.jz@bp.renesas.com>, linux-kernel@vger.kernel.org
Subject: [PATCH] mul_u64_u64_div_u64: fix the division-by-zero behavior
Message-ID: <q2o7r916-5601-11pn-30pn-8n5ns6p079o7@onlyvoer.pbz>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

The current implementation forces a compile-time 1/0 division, which
generates an undefined instruction (ud2 on x86) rather than a proper 
runtime division-by-zero exception.

Change to trigger an actual div-by-0 exception at runtime, consistent
with other division operations. Use a non-1 dividend to prevent the
compiler from optimizing the division into a comparison.

Signed-off-by: Nicolas Pitre <npitre@baylibre.com>

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..eaa0c7e8b974 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -212,12 +212,13 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
 
 #endif
 
-	/* make sure c is not zero, trigger exception otherwise */
-#pragma GCC diagnostic push
-#pragma GCC diagnostic ignored "-Wdiv-by-zero"
-	if (unlikely(c == 0))
-		return 1/0;
-#pragma GCC diagnostic pop
+	/* make sure c is not zero, trigger runtime exception otherwise */
+	if (unlikely(c == 0)) {
+		unsigned long zero = 0;
+
+		asm ("" : "+r" (zero)); /* hide actual value from the compiler */
+		return ~0UL/zero;
+	}
 
 	int shift = __builtin_ctzll(c);
 
