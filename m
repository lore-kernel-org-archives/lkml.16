Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC8CA1D2F42
	for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 09:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749894857; cv=none; b=pe8SZeIdjz5t7sXgLTb7YfAS/ZUOE56V7aINHPyl5FXKJpwhorrcNS9Kw7wAbWtRNIbbEMOoRjO+5OlxTqx+0n5Pg33HiSMd4O1pUKT+a1Rb27MzQPwiEInaEfbDc+l4q05n/EGOFVDm95a/fbArQr26sC1RPdEQxQJyJCauceE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749894857; c=relaxed/simple;
	bh=gNPWLk7bVGAvDlMuEwd7oZj30Q4/E6JcxEl7T/MFyqI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=ZvDCpApSV81/5tTubmUCQlZqprbRdEGFWzWaSO+psynp5DDGC3R8KMd673Ds85cOEkMbdZ/IPte/F3RpIMSKXnRBn6juQWmun/sfkrv027q4e5/JQPWeLQsIn3pL91D0Mmmv5L1g5dGXO3glAXaePuCImJ1K/rZeo0C65N432IU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F9YbXESq; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F9YbXESq"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-450cf0120cdso23752545e9.2
        for <linux-kernel@vger.kernel.org>; Sat, 14 Jun 2025 02:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749894854; x=1750499654; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oEoRmOROics9XZZ0dFappmfLDjCc2Jum5Eh7tphQmqA=;
        b=F9YbXESqczbrQOCWdRIZpS3Xa1HUpgXRxBuQmfR2wTSWUy9iIV2CQDJYWLrXHa22SL
         uCx8T3wEzvUxMq4ITTkukomtYxbM49HXqOha4s2TjESKjaur3NTGzx3r+fWKv5UwWVDG
         PwZP+noo6qQsMAFCpa35rFFaSPfVhLEO6DgSGHT6+qvM8ilUNPeO1SD7nVGcKZpyxQWK
         kloOrscFphsylWyzE7jTn1+jcaXm16LNiyFKqt7cNRjKSSuAx7NEHaakFDg5PvDhWKg4
         T43JeLC08CkM2KCLLo0Ln20FMbTOY1IGiltY9N+bn8yuRgn9NQFnfmEJSfAdHAsmpgOv
         Q2ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749894854; x=1750499654;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oEoRmOROics9XZZ0dFappmfLDjCc2Jum5Eh7tphQmqA=;
        b=I+nH5s4aLHi3UfPEAo+Ocs6a7kQMT5dsoRlO+o7+8lrZOt39ghXTVYyu9EmtgIiBSQ
         9qXCCLEQ8Nd2IHnsXwgDrQmzAMA3xO1U9dg0E8uQvhWmCgG0DszcLBhtX7YlWW/4iaUx
         uqiNqzwH9j1lycT82WVyokN41cqdtnSdMgObQCXIzCFhs4NBNE0YfHBWUTb6Y0xf3FZW
         /CmFhkq5ol6XEo6EX+1J4LmjGycvUSfGLsJrYh3edsT2XpWeXm+hyG+M78/BDXQ+NF6t
         5tG3h7Exxiwbk2ndEinRSlBVoE+5yCMNrEcbshCtSuGkPaLqCiLv1aqeyhOVIGhp8Xjs
         JW0w==
X-Forwarded-Encrypted: i=1; AJvYcCWgI8cRFiU2g4wBereCnYe95Ue9b4Lb2/FYlU0jjr1Ga2kXBvBFr8NEC0RHD0hKI0jsTN7Q3lDeoDjl0Wc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1/jz+cc7Dk3qCXk7lAfFXoBAG4sYbmzOEkPM06HH7ygJE7ptT
	TU68alcqn9pnMjTZuQ5p2qhtx7BYTlANYLRbD9Syuzie7fXs0mJNlQ0Q
X-Gm-Gg: ASbGncuE1kLS4F2otdGN2skmYEJeh8Ilhw3r5HIGfKo8VdSuT4g6LITgqppufZakDqL
	P2vAoNi+A9rVCB0K9hH0+sVJZswhIyz/tU8Q87Wb/sWCRJ2+FHiXBEjqlZIgVUrrVTd9XlZyeAl
	AaQOoA38sYL6KwoT/m6O2+y/x5bi/rc15JndQ6e04FurfaLh4YxlsGuF/4opeBID3FlvUdmfc2i
	QeBhki2yFwGuUyMdzgJBDS8CGBDfxH9i4wIVd+WsJc3fVcmwnrXgeZVWNXeEJFFckA9OHaZB/jS
	c4gOlGpMNWeV8dDDPN1o0TfaleF/+EVbKbaBa/00VCLWmUOO1xpwOlzvtaw15VPvZ1PsBS6M8bg
	TtfRPYbTu8yqUkD90TIsCJCYWbGslfshsm/nqrd9FEDY=
X-Google-Smtp-Source: AGHT+IGPHoMO7+RCfAgqwFmRqb4OO/WnTD2i72BVayXQxIoB4REUTtbCjI5Mlqa31tNkHVk2IqjKqQ==
X-Received: by 2002:a05:6000:2002:b0:3a4:f52d:8b11 with SMTP id ffacd0b85a97d-3a572373cbbmr2901003f8f.20.1749894854039;
        Sat, 14 Jun 2025 02:54:14 -0700 (PDT)
Received: from snowdrop.snailnet.com (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a568b19b32sm4869444f8f.67.2025.06.14.02.54.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Jun 2025 02:54:13 -0700 (PDT)
From: David Laight <david.laight.linux@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org
Cc: David Laight <david.laight.linux@gmail.com>,
	u.kleine-koenig@baylibre.com,
	Nicolas Pitre <npitre@baylibre.com>,
	Oleg Nesterov <oleg@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Biju Das <biju.das.jz@bp.renesas.com>
Subject: [PATCH v3 next 03/10] lib: mul_u64_u64_div_u64() simplify check for a 64bit product
Date: Sat, 14 Jun 2025 10:53:39 +0100
Message-Id: <20250614095346.69130-4-david.laight.linux@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250614095346.69130-1-david.laight.linux@gmail.com>
References: <20250614095346.69130-1-david.laight.linux@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If the product is only 64bits div64_u64() can be used for the divide.
Replace the pre-multiply check (ilog2(a) + ilog2(b) <= 62) with a
simple post-multiply check that the high 64bits are zero.

This has the advantage of being simpler, more accurate and less code.
It will always be faster when the product is larger than 64bits.

Most 64bit cpu have a native 64x64=128 bit multiply, this is needed
(for the low 64bits) even when div64_u64() is called - so the early
check gains nothing and is just extra code.

32bit cpu will need a compare (etc) to generate the 64bit ilog2()
from two 32bit bit scans - so that is non-trivial.
(Never mind the mess of x86's 'bsr' and any oddball cpu without
fast bit-scan instructions.)
Whereas the additional instructions for the 128bit multiply result
are pretty much one multiply and two adds (typically the 'adc $0,%reg'
can be run in parallel with the instruction that follows).

The only outliers are 64bit systems without 128bit mutiply and
simple in order 32bit ones with fast bit scan but needing extra
instructions to get the high bits of the multiply result.
I doubt it makes much difference to either, the latter is definitely
not mainsteam.

Split from patch 3 of v2 of this series.

If anyone is worried about the analysis they can look at the
generated code for x86 (especially when cmov isn't used).

Signed-off-by: David Laight <david.laight.linux@gmail.com>
---
 lib/math/div64.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/lib/math/div64.c b/lib/math/div64.c
index 397578dc9a0b..ed9475b9e1ef 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -196,9 +196,6 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 		return 0;
 	}
 
-	if (ilog2(a) + ilog2(b) <= 62)
-		return div64_u64(a * b, d);
-
 #if defined(__SIZEOF_INT128__)
 
 	/* native 64x64=128 bits multiplication */
@@ -222,6 +219,9 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 d)
 
 #endif
 
+	if (!n_hi)
+		return div64_u64(n_lo, d);
+
 	if (WARN_ONCE(n_hi >= d,
 		      "%s: division of (%#llx * %#llx = %#llx%016llx) by %#llx overflows, returning ~0",
 		      __func__, a, b, n_hi, n_lo, d))
-- 
2.39.5

