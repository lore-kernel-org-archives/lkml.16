Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BE9B1EB9EB
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 21:46:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743630418; cv=none; b=WobgREX4K3hDNE6KThs5e51JcQY8/j9X2EftYA+Z30tec+VKYRwWiAK2W8Oq4qzc8nm5nZygUsaRWiADC9eyHr6FmY/gYCUcmgme7nenctzxg0dGBf7ohtDeBlgG5eWQYdP1OriHHran5kHh3hvzA0+tlPPBMkvNaGpWrQwrMiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743630418; c=relaxed/simple;
	bh=BAjq9C9fRZjELJQ8Vrb12QIgx+28LxEWhkHuCxrYAes=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Uki9RIAcoPrt6AXKF+0ekHB6HiT7bjR/sNI/ew6obqu7jcp5dnu0JVa1Wlazhe3ViWsa9f59s3qAWjPmWwjhk/VjLJdXoCkclHHgmbtrUWDeWihdIpkl8oB6Yzs6T6clKashSqITaEUNWd4jUTrVo0KNA0mG6sEeFPbyvh+tqOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ky+Zcp0X; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ky+Zcp0X"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3912d2c89ecso242925f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 14:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743630415; x=1744235215; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1xRVm9klxaIdtAVf8mizHRMZsJy7B1VQj9wccFwe1a4=;
        b=Ky+Zcp0Xutl6QAU/00bKCMucjM3p2xYo7yAnNdmXTVbgCuzBqgQ8FfUKkwSwPEaw+u
         2ZR3dm46tpq6UOoG314vUWhXK6G8eGngHLQrWciwgO/eSTYdAwIAlbfMtKEksCfoN/C6
         vz1iJgfMHfoUzHQg4nfxghg+lqOQGREtY79HscPneK9EK5zwZwAV4PYodrQbJdaz94C+
         wJvVe9BEDPmEN2GAlpoh1idEAC748GEEzm5Ez2CVCOq7lSucx6Ksul+7eLkQJDpuakh+
         BpLvzS1JTlf6KUwO/OuktQzVoqxetjsEqiRecCQUWK7V0Ex4aVF2+e+6xoSEFBGjyKDs
         DWiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743630415; x=1744235215;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1xRVm9klxaIdtAVf8mizHRMZsJy7B1VQj9wccFwe1a4=;
        b=iydKUDmqaWwcmYfvkzi/XnQNxBRnWg0fVaemI1Ulaq7tunD7TEZ1GVjItwhTniy+gE
         Qzplq+DpqBKedvf9N3XVBUHUDxebZ2zT3t9hSlwh4ZxprkdMCC10HHgoRNd1sz0x1Vld
         Vl39QKKB2q37v7jH9yrmWUkIwu7/0N2FFM2GGk+ulqSjQe3pq+zB9sDcqTBjc43tYwPG
         bA7+sKQ3LSPOiFa1ECwgnmoyGfxJXjjaUB8I2DGjKBmG3sBPf1Fmfwl0o3I3hTjPXGuG
         u/FswT/M8dWrc7XMk1i/93ImYtKr3JMM0kb199+rag8DHYiq2wnPOdhd4Tea+zb4zjaE
         V34A==
X-Forwarded-Encrypted: i=1; AJvYcCXHEWR5HQ85NblU6B0Zqpd2mPt9oFvFEOb5u2qnxxkPKPUT3D8aM0Jjkg4o+3tnWAXcHqWHrYa1qs0/koQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHEUXGcSjfWXPZyj/GLxFaPgO4Pnf37hCpBoEniyIQo7u8gH/+
	Q+Izmkp5OX3XiOFdAxvZ46ZXRYGLD6P+0kuYwJYP9owkSZnlgcpS
X-Gm-Gg: ASbGnctsYkCoSPxUd2llqmvE3nkUTMJlO/K1wXOXL3/8pCPbhPOCcVPvowx3V29dGs+
	Vd6ErAvmqLGfMC59es4pWk4cBs6g1DcEbQ/94ydiVFMDV2hno0sVzYCsHWOtkPMJxx4ee5DU79Y
	FJ7lFA/eqRY346xNX5xPnrhO84FvjjswWjTGYdDTqmAQz5eXsPEtrLHjCLfu25QoXrxZ7Lnbp6Z
	KZV55iWNONIJo4eOLoWY9Xg1PYp5qh6edfFEzs674Yxbxu+ToIyRmc7Bw9LSCoIL7qajsBLfRol
	fuU/g5JY6uIwiLHC0iSteRkmoxP79MgKgkvBNKLCcrI3YvjZEHOjyaJwly4xAxEPp0wsw9YcqZY
	ERpkG6EY=
X-Google-Smtp-Source: AGHT+IHWXMwJiJM76P81B1uDs6kCZvMGAkHnd92MC9Wf02QNyFsF8jaLJNYYpN7u5CA4Ys8qdAexUg==
X-Received: by 2002:a5d:64ec:0:b0:39b:330d:9719 with SMTP id ffacd0b85a97d-39c120de108mr14226573f8f.17.1743630414449;
        Wed, 02 Apr 2025 14:46:54 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43ec1794efesm2857995e9.28.2025.04.02.14.46.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 14:46:53 -0700 (PDT)
Date: Wed, 2 Apr 2025 22:46:52 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Uwe =?UTF-8?B?S2xlaW5lLUvDtm5pZw==?= <u.kleine-koenig@baylibre.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Andrew Morton
 <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] math64: Provide an uprounding variant of
 mul_u64_u64_div_u64()
Message-ID: <20250402224652.1bb38f6b@pumpkin>
In-Reply-To: <gqqxuoz5jfrlsmrxdhwevfo7kflxjqhbkfy2ksnsdcadbk52hd@yaitrauy52xg>
References: <20250321131813.6a332944@pumpkin>
	<epuk3zijp2jt6jh72z3xi2wxneeunf5xx2h77kvim6xmzminwj@4saalgxu3enu>
	<20250331195357.012c221f@pumpkin>
	<mjqzvj6pujv3b3gnvo5rwgrb62gopysosg4r7su6hcssvys6sz@dzo7hpzqrgg2>
	<20250401202640.13342a97@pumpkin>
	<15qr98n0-q1q0-or1r-7r32-36rrq93p9oq6@onlyvoer.pbz>
	<46368602-13n7-s878-s7o2-76sr0q67n9q4@syhkavp.arg>
	<20250401223731.7102103d@pumpkin>
	<2wwrj6aid2elnnotzfkazierqmzmzpfywyf33ahqs36xh5xz32@rszeetrztsiz>
	<20250402135219.28b24e94@pumpkin>
	<gqqxuoz5jfrlsmrxdhwevfo7kflxjqhbkfy2ksnsdcadbk52hd@yaitrauy52xg>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2 Apr 2025 17:01:49 +0200
Uwe Kleine-K=C3=B6nig <u.kleine-koenig@baylibre.com> wrote:

How about (tab damaged):

Compile tested only, on x86-x64 (once with the local definitions removed).

Looking at the object code, if u128 is supported then checking n_hi
is always going to be better than a pre-check.
Remember multiply is cheap.

	David

diff --git a/arch/x86/include/asm/div64.h b/arch/x86/include/asm/div64.h
index 9931e4c7d73f..6115f3fcb975 100644
--- a/arch/x86/include/asm/div64.h
+++ b/arch/x86/include/asm/div64.h
@@ -84,21 +84,28 @@ static inline u64 mul_u32_u32(u32 a, u32 b)
  * Will generate an #DE when the result doesn't fit u64, could fix with an
  * __ex_table[] entry when it becomes an issue.
  */
-static inline u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div)
+static inline u64 mul_u64_add_u64_div_u64(u64 a, u64 mul, u64 add, u64 div)
 {
        u64 q;

-       asm ("mulq %2; divq %3" : "=3Da" (q)
-                               : "a" (a), "rm" (mul), "rm" (div)
-                               : "rdx");
+       if (statically_true(!add)) {
+               asm ("mulq %2; divq %3" : "=3Da" (q)
+                                       : "a" (a), "rm" (mul), "rm" (div)
+                                       : "rdx");
+       } else {
+               asm ("mulq %2; addq %4,%rax; addc $0,%rdx; divq %3"
+                       : "=3Da" (q)
+                       : "a" (a), "rm" (mul), "rm" (div), "rm" (add)
+                       : "rdx");
+       }

        return q;
 }
-#define mul_u64_u64_div_u64 mul_u64_u64_div_u64
+#define mul_u64_add_u64_div_u64 mul_u64_add_u64_div_u64

 static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 div)
 {
-       return mul_u64_u64_div_u64(a, mul, div);
+       return mul_u64_add_u64_div_u64(a, mul, 0, div);
 }
 #define mul_u64_u32_div        mul_u64_u32_div

diff --git a/include/linux/math64.h b/include/linux/math64.h
index 6aaccc1626ab..1544dc37e317 100644
--- a/include/linux/math64.h
+++ b/include/linux/math64.h
@@ -282,7 +282,10 @@ static inline u64 mul_u64_u32_div(u64 a, u32 mul, u32 =
divisor)
 }
 #endif /* mul_u64_u32_div */

-u64 mul_u64_u64_div_u64(u64 a, u64 mul, u64 div);
+u64 mul_u64_add_u64_div_u64(u64 a, u64 mul, u64 add, u64 div);
+#define mul_u64_u64_div_u64(a, mul, div) mul_u64_add_u64_div_u64(a, mul, 0=
, div)
+#define mul_u64_u64_div_u64_roundup(a, mul, div) \
+       ({ u64 _tmp =3D (div); mul_u64_add_u64_div_u64(a, mul, _tmp - 1, _t=
mp); })

 /**
  * DIV64_U64_ROUND_UP - unsigned 64bit divide with 64bit divisor rounded up
diff --git a/lib/math/div64.c b/lib/math/div64.c
index 5faa29208bdb..efcc8d729c74 100644
--- a/lib/math/div64.c
+++ b/lib/math/div64.c
@@ -183,16 +183,13 @@ u32 iter_div_u64_rem(u64 dividend, u32 divisor, u64 *=
remainder)
 }
 EXPORT_SYMBOL(iter_div_u64_rem);

-#ifndef mul_u64_u64_div_u64
-u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
+#ifndef mul_u64_add_u64_div_u64
+u64 mul_u64_add_u64_div_u64(u64 a, u64 b, u64 add, u64 c)
 {
-       if (ilog2(a) + ilog2(b) <=3D 62)
-               return div64_u64(a * b, c);
-
 #if defined(__SIZEOF_INT128__)

        /* native 64x64=3D128 bits multiplication */
-       u128 prod =3D (u128)a * b;
+       u128 prod =3D (u128)a * b + add;
        u64 n_lo =3D prod, n_hi =3D prod >> 64;

 #else
@@ -201,6 +198,11 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
        u32 a_lo =3D a, a_hi =3D a >> 32, b_lo =3D b, b_hi =3D b >> 32;
        u64 x, y, z;

+#if BITS_PER_LONG =3D=3D 32
+       if (!(a_hi | b_hi))
+               return div64_u64(a_lo * b_lo + add, c);
+#endif
+
        x =3D (u64)a_lo * b_lo;
        y =3D (u64)a_lo * b_hi + (u32)(x >> 32);
        z =3D (u64)a_hi * b_hi + (u32)(y >> 32);
@@ -208,10 +210,13 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)
        z +=3D (u32)(y >> 32);
        x =3D (y << 32) + (u32)x;

-       u64 n_lo =3D x, n_hi =3D z;
+       u64 n_lo =3D x + add, n_hi =3D z + (n_lo < x);

 #endif

+       if (!n_hi)
+               return div64_u64(n_lo, c);
+
        /* make sure c is not zero, trigger exception otherwise */
 #pragma GCC diagnostic push
 #pragma GCC diagnostic ignored "-Wdiv-by-zero"
@@ -265,5 +270,5 @@ u64 mul_u64_u64_div_u64(u64 a, u64 b, u64 c)

        return res;
 }
-EXPORT_SYMBOL(mul_u64_u64_div_u64);
+EXPORT_SYMBOL(mul_u64_add_u64_div_u64);
 #endif

