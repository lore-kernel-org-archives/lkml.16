Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3F1A2676FE
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 17:15:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746033352; cv=none; b=QSGdBNNOdqPbJA4xM4ww7qlMpsCaZkfUEQ+K+Ov7vPKH/wZVgSu3vSMaymoJJ4Kv6sRDA7Ov7R7QDv1LqntSya165TuKEbBApIwFMyc98H//I1nZ1U/5N7oJCWWZ6rF+xHs6fLp+bIGKr96F3G93t5JwDZKwxWtMKA97obkkyys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746033352; c=relaxed/simple;
	bh=mAU7UddOSIuhHOgW0dcTHe2+YPpXYqGh56bzZQb4Iac=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=kUaaMb1+c82JZ+41RVGiai26jihkEVJ+s43kHtsddc9qanQQUkyxPmtpXXYUiUM7snfPqGYyk18MzLeQq69HcohKoAqYLlU3kUZkLvTwELS2/CtPbK73M6Vl07tbnno5Q5EmAJDA+yTu+S99bIPUO5xxeZLV0xWw08kZxnSw9mM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ppKhcx7S; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--irogers.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ppKhcx7S"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-224192ff68bso564575ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 10:15:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746033350; x=1746638150; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=WhBH53x+wqLHSip++JVbv92U64Pz0+iOyWwwIUecJ6E=;
        b=ppKhcx7Sp+v1WszhWVuLL3r8QHFclpXg3wjKDy2t8Cyjd/0KJLtuNIKJl4bfLDyK1l
         zUFXYO7YaxnuePFw6XuDR+83h0yBWVu3Ri4C78PqpZSI2MhOpP4xExeTQS0pCNTGydNp
         IjakmkXsXRD+++uNyKHzEAnQXFMJUtBruatI567QUrDTBdP5tj7/W88n/u3Z5L7w2QRD
         jDRUp4L7QEFSB5LE/NAtuLCGA7W68Qoytejy82A1exGfh4hOGPhYezqePKUJoX8CIR4B
         H53apjFSViNVMUugUyTRBTUov8AJV/1hFaHFdKM0bKvfbKU/HSUiBALg8iz2+3vOCV/8
         lzxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746033350; x=1746638150;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WhBH53x+wqLHSip++JVbv92U64Pz0+iOyWwwIUecJ6E=;
        b=pVvnDT9ZjDXsOCk8vlehwE1lNANvIVDEwC2b2KRRELCynnQVLPDDfjhczCm3F/+YSo
         atS1eq9At3MtTF9ziLxR62b6kwUsEGVGYKKFOrFtaD7T3doNJwBWr8lwdlOag/bK8LiK
         zQKyvlzg6d5YY3eaAf9eBNjtndC4ybl/nRcyF5LodFSKm7kKwG+oyZX2CAw1+BhcOXsJ
         hRjdelOmClCXihMEb0BLn8z0K8WRQwJ801EeTg2nwCigaF5OAWlnmTRiuNGBVv3ZsrJA
         nYoNIpDpC/VmraafR9Cy23Hz+soIQXEDu11+5X2cIrlW0Fpux9efLovEd1P4ogbRj+i9
         FZCw==
X-Forwarded-Encrypted: i=1; AJvYcCViD5hnEsSco0lbN+e7vyIgYv3aFpLFzjpz9ErZTh3JcEvtfg7vFATw0HoV8AeYglqW/2fY/LfXRiMkb0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzqcrqRrSZhcFp131v7y9bdBlbMOb+R/R/8sBACkapNhkGEuqv8
	gXbmDNxvJtJ0JKQVlbMtQisgklWomEHIC2LCqCzXzQysFnWyn2shHZ5AN528P2fEBeOIaIaO4nN
	VbQsgAw==
X-Google-Smtp-Source: AGHT+IEaapOgmoVRsKolxvo/uh0+Fje0GanC2UTPR9ZO79czz3tAeLom6ayGJKwoq/mQfddsskfR6kPqjVdO
X-Received: from pgmm35.prod.google.com ([2002:a05:6a02:5523:b0:af2:50f0:bc79])
 (user=irogers job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2d0:b0:223:325c:89f6
 with SMTP id d9443c01a7336-22df34aa393mr68396565ad.10.1746033350412; Wed, 30
 Apr 2025 10:15:50 -0700 (PDT)
Date: Wed, 30 Apr 2025 10:15:34 -0700
In-Reply-To: <20250430171534.132774-1-irogers@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430171534.132774-1-irogers@google.com>
X-Mailer: git-send-email 2.49.0.906.g1f30a19c02-goog
Message-ID: <20250430171534.132774-6-irogers@google.com>
Subject: [PATCH v2 5/5] hash.h: Silence a clang -Wshorten-64-to-32 warning
From: Ian Rogers <irogers@google.com>
To: Yury Norov <yury.norov@gmail.com>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Arnd Bergmann <arnd@arndb.de>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Ian Rogers <irogers@google.com>, 
	Adrian Hunter <adrian.hunter@intel.com>, Thomas Gleixner <tglx@linutronix.de>, 
	Jakub Kicinski <kuba@kernel.org>, Jacob Keller <jacob.e.keller@intel.com>, linux-arch@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev, Leo Yan <leo.yan@arm.com>
Content-Type: text/plain; charset="UTF-8"

The clang warning -Wshorten-64-to-32 can be useful to catch
inadvertent truncation. In some instances this truncation can lead to
changing the sign of a result, for example, truncation to return an
int to fit a sort routine. Silence the warning by making the implicit
truncation explicit. This isn't to say the code is currently incorrect
but without silencing the warning it is hard to spot the erroneous
cases.

Signed-off-by: Ian Rogers <irogers@google.com>
---
 include/linux/hash.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/hash.h b/include/linux/hash.h
index 38edaa08f862..ecc8296cb397 100644
--- a/include/linux/hash.h
+++ b/include/linux/hash.h
@@ -75,7 +75,7 @@ static __always_inline u32 hash_64_generic(u64 val, unsigned int bits)
 {
 #if BITS_PER_LONG == 64
 	/* 64x64-bit multiply is efficient on all 64-bit processors */
-	return val * GOLDEN_RATIO_64 >> (64 - bits);
+	return (u32)(val * GOLDEN_RATIO_64 >> (64 - bits));
 #else
 	/* Hash 64 bits using only 32x32-bit multiply. */
 	return hash_32((u32)val ^ __hash_32(val >> 32), bits);
-- 
2.49.0.906.g1f30a19c02-goog

