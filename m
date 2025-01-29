Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C0F0187325
	for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 20:57:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738184279; cv=none; b=Doj74dCSBDQT7R6DnDr4GsQO0QQ9mCYI9VKgkkIY0QjBbc3iFc/PnO5c2vqaSRIykh1NU05tRjt/QaEJzqg3wYuiEZz2tujrvYGliD3MqURbR+ImqAqKBUo6Xk/CdC1hVBigb8NxhP2nJnIRseZyH3nUE/V8Nw7vQPK0h+RC/VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738184279; c=relaxed/simple;
	bh=it0n6NcfBsB6pgC2uMPMnfru5aq5kH7QkLeRsDPQmuI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ytloi9VarXY2B3eTuZAfb/7xwETScaSXgjvlxPQ/XFf3FTUYW2kikRfYwE+K059HqSLnr3Jqk0z+hLpdWC6nypDkE7Hxw+PSoIVd2dSw79YfUyU5bhJSdfJpmr/UY8j8w7uhZJ6CNxuUHKRkaZelSNCR0Y/i7aK69AsFoHqFK0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IKrU+EwQ; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IKrU+EwQ"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5d3f57582a2so2343264a12.1
        for <linux-kernel@vger.kernel.org>; Wed, 29 Jan 2025 12:57:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738184275; x=1738789075; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Llvi45PxPMuQBtDcviepIixC4mSLcIOApyubc6kRfOA=;
        b=IKrU+EwQ/94CqZSu9vqIUpFSMEX2IYZhI8PV6eq8y8ALzodq6fa5ZzUlNKSAGHhkzK
         5nY87k63aw/K1jK23T+eBNkrXXZIs2IC35pgPYXnKYB1RxQeYScikLyl93TgDXuIp9Pd
         K3/g47uq7MVtE2okV+j9Xz4HIjT7OEcRuZs3rb0J9IGRn+ugbPteDcRxvtqa9FbX62vq
         27TGvFv2URdiho7rjJfJ3SAi0DZdApPJ2EpzR22/RL98D0PyjrGd4bexy/HDzbQTq5U2
         Rws830682xkDZmVfEoktrVBRqw/1kCCzPwwUETSl4gSekBQAG/JR680J6A3BJQVOnXIK
         BU/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738184275; x=1738789075;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Llvi45PxPMuQBtDcviepIixC4mSLcIOApyubc6kRfOA=;
        b=q2GuhgMWFpHY5lRHoeisQusFQRVw8BPmITONipq526N9G6bt5tlh5Ny9nx5+ehgzBp
         HmjWuWGnC2PHuiQfMs7MGE6uJrgNHJY2UV7mUCOrnPedlF+YT/W3hPdHBNcxZ/CiPUd5
         wE0JheBAKjmSaqUEkF3bOAZix7TKkc38fGXVsBvkznAIBCnIPmMoanNWFzSUNCmf9Lps
         smWmv5Y/QX0odKPAtEoDBqtts2JzoV0AsCVTsLnrT8KxLJDbBmwhHHJpgjaP6H9Ee896
         oGfMHOjSJn1Z5hlkPHuM1hlnJg7ZXmWndjDrq0Hg6WxobeZFV49Gm/0s4VkmmfdvrhF2
         5wIA==
X-Gm-Message-State: AOJu0YyHwuRmkGeklhT4THvPQ3xWoTD/VlY+bM/MtqQX692vLgL0umLb
	j2aznmCis808fR62zDuDxLp50ylONsVcBIGxn0dMrFIpSFNPLecLcBxNFg==
X-Gm-Gg: ASbGncvzvhyhsTpguTwE5ahP8N/RP5P1yAli1Ic3GACCLdxZbFwOewV38xWTsMARb8z
	WIjT45hp828ajcQlbOMYFbKcSltKBC/1FdRF+4pm2r37aFT2coRVIPT/yqjPqXQHpwvEeCGNEje
	CF/qK40YmDveEv4FpWIOql8847KbNVnik2XT+qFeWxKPKAPclpVGFxIhJlYAzPu/AgMx9UR5i13
	Hm8zI/9T3CGnUJh2qx/YhVKF2RA6Gg4quSihUzxr+1QPqFTriNoBkyU5Kmpa581O3kpqBBgOrl3
	g0FPQBvB9O2YiqaYDTs5lLqy
X-Google-Smtp-Source: AGHT+IEQGap5WNKI4uF1PFywHvb6hLn5LTFVwpkMOSGBY486OY63vwnmLSu2k6cTAs0MaCIGykjuXg==
X-Received: by 2002:a17:906:46d6:b0:ab6:d4ce:5674 with SMTP id a640c23a62f3a-ab6e0d8ef7amr69840366b.26.1738184274965;
        Wed, 29 Jan 2025 12:57:54 -0800 (PST)
Received: from localhost.localdomain ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e47a81adsm234666b.36.2025.01.29.12.57.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jan 2025 12:57:54 -0800 (PST)
From: Uros Bizjak <ubizjak@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: Uros Bizjak <ubizjak@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [PATCH] lib/bch.c: Use __builtin_parity() when available
Date: Wed, 29 Jan 2025 21:57:31 +0100
Message-ID: <20250129205746.10963-1-ubizjak@gmail.com>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Compilers (GCC and clang) provide optimized __builtin_parity() function
that returns the parity of X, i.e. the number of 1-bits in X modulo 2.

Use __builtin_parity() built-in function to optimize parity(). This
improves generated code on x86_64 from:

	movl    %edi, %edx
	shrl    %edx
	xorl    %edi, %edx
	movl    %edx, %eax
	shrl    $2, %eax
	xorl    %edx, %eax
	andl    $286331153, %eax
	imull   $286331153, %eax, %eax
	shrl    $28, %eax
	andl    $1, %eax

to an optimized:

	movl    %edi, %ecx
	shrl    $16, %ecx
	xorl    %edi, %ecx
	xorl    %eax, %eax
	xorb    %ch, %cl
	setnp   %al

Please note SETNP instruction that exercises hardware parity
calculation of x86 processors. When POPCNT instruction is
available, the generated code gets optimized even further:

	popcntl %edi, %eax
	andl    $1, %eax

Compile-tested only.

Signed-off-by: Uros Bizjak <ubizjak@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>
---
 lib/bch.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/lib/bch.c b/lib/bch.c
index 1c0cb07cdfeb..7a266c160839 100644
--- a/lib/bch.c
+++ b/lib/bch.c
@@ -313,6 +313,9 @@ static inline int deg(unsigned int poly)
 
 static inline int parity(unsigned int x)
 {
+#if __has_builtin(__builtin_parity)
+	return __builtin_parity(x);
+#else
 	/*
 	 * public domain code snippet, lifted from
 	 * http://www-graphics.stanford.edu/~seander/bithacks.html
@@ -321,6 +324,7 @@ static inline int parity(unsigned int x)
 	x ^= x >> 2;
 	x = (x & 0x11111111U) * 0x11111111U;
 	return (x >> 28) & 1;
+#endif
 }
 
 /* Galois field basic operations: multiply, divide, inverse, etc. */
-- 
2.42.0

