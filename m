Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F19E229B38
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 07:36:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627381; cv=none; b=Sln5I7IWBO8EFgOdvxjNcKfCN5Vb/EFR8lCoYE/QXzCgm0swDFovpY7rcsisc0VDpvfNR3yRHTsHGw+LA4RBVerKDIMueQUhQn6xP2PCxGlFUejV4Ijn6uvI/kElF0WanDQZeUjXrsE319b8eHtDi0CTXitCNv8jBRS3Ob8IzHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627381; c=relaxed/simple;
	bh=XfopYv8ohE728Xi2gCeSUZEs6u6N1lsc0va5XJdhNd4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bzByZ0XKZJQde37Omr0j578+CgfA0qO9x64wxsbJ2JHuwYfaiHW5lO5xXKqcYdQTo7ubHjOGYXr3J4FjQf8L5fdvr1lg6ZiXFfirA7cHhAehkT7EHMcEahbexRPeVtf2D035a4miVVW6T+aHfLyLGUvidP8YVbawkpiIk8sZIpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OQZIfjGz; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OQZIfjGz"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-23508d30142so79811465ad.0
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 00:36:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749627378; x=1750232178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=lP9LxI7qONcXoTdRe9p4EMny84r1sepaW6Yqj2XZ3xs=;
        b=OQZIfjGzIHAeH5qy5Yhy4fXsUb+29Hpg8Bofneqa12ytGnzj/fKNt8eOpohpcmKUq6
         0vqEMCdQpOvGzbwuWsspeGN5AEgek57mXUnKKuz6NM9pzMevCEAfabU50iSBPL35O5KX
         gUUHo+Syn/+WxR6pxvIOAWZQWMl6Qkcx3U0aWunxBk6kTu7D42wYg/x4IVmpT61FR04H
         NT/WqOQlKo4XwthjxauHhOmv2gAqhc1S0N+FPN9yIYZWAGhUX6Jou4d4TiM+Z9XHi6po
         E0uustQD6gj48tRVuPOI+pYpU/qWZCsh0kvAwBKr6XzzxBs2COUPa9AfLCbEMRKDCkW4
         pJXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749627378; x=1750232178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lP9LxI7qONcXoTdRe9p4EMny84r1sepaW6Yqj2XZ3xs=;
        b=VJE8yyFuo8KFIuf1/QlraPlhhK9hzcbeXh5kjTvlVUGjv9ooQ7x9mzH/qDu6E9syBu
         P+q06TlMXX8bfMBuW04fykyiRzwewDDE3bNkHT6ANMtlIBtVzuN/tWuWzdslOpsJsdQP
         uOdVfroxHomXxbQ/XWhUyn/6QT6k5onnBbafg1T+nvHtc3Oc72Dgz66g59C6BL/KCLdJ
         OvRKIZf7lmMHGrWO4BNjE3zniBdvYD9AN3RG38Tw4TffKUj/RESRpu4YW9BlR4JL30UM
         NdkWu/7OyWZq+qnzWhLE6GftsMV2qpykrYzUEelAqsrBAhgQwSgSBU9DgCJxVHxey50m
         Wuaw==
X-Forwarded-Encrypted: i=1; AJvYcCW4I4EgDrg/oyjiwxS6LCcCVdacrSLbctuuh+fxeFsQf+FsSeFDtf4q8uunsjv0vg+s8xYxqBFIpDp9vY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsdSZEv3q1cfftn+73dFw7An8BBWSKQu7hKkv7nvpVlWo+C3FI
	igpH+url0lYuTtX4Aqn32xOTo4dmn/dYX1xlVkPuVVuhdFiT9TkdUJsJ
X-Gm-Gg: ASbGncuM2xG/Qja7Nnq6PYevegAwyyr41JuuEMmh155g2n4WHSf3Ae/XKpjCm0jlrFX
	vRPnYEpMMMH/oDMpdOkwaMGsw+VByxl/hKoUNMYX8Z6PCrJxGTUsd7Nu0+/wDV5m1Zh7YEFJmlC
	UwjEEAKmn9GD/q+fQ1S/g6vd5zql4g+lFl4seOR/yIAGXW0PDt5FNVSKwCGWbSNOA29ZSZQMRHl
	tyOF3SNvD//KUhy/jgMMMhnoI+4/tp24E0W+ef9f1Mj2XgZqMpLjaM+J5rIduAE1zNzFjgtFl0q
	JNCE/j9l7KiNFbFuzB1rFuPntpWk1h4YOgoJucZJG5O1a+0cknPajEKy1bJtF/Ja/iyIOAXTC70
	dk8H6FYtu2yRZPnZV
X-Google-Smtp-Source: AGHT+IFNNhUjT+1QGSmPE5NgvvbvJ89c2dVTR659nK9UjRNnj478EreDAn07W7AdN0zsj4rdNl59mg==
X-Received: by 2002:a17:903:22ce:b0:234:d679:72e9 with SMTP id d9443c01a7336-2364261fa43mr28896165ad.12.1749627377692;
        Wed, 11 Jun 2025 00:36:17 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:52f2:ddbc:f858:ca43])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2360340fbffsm81526305ad.197.2025.06.11.00.36.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 00:36:17 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	yurynorov@gmail.com,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v3] clocksource: Replace loop within clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Date: Wed, 11 Jun 2025 15:36:08 +0800
Message-ID: <20250611073608.2049793-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize "find_last_bit()" in replacement of while loop counting
for the decremenet of "sftacc". They're equivalent in computation result
but the former is more effective.

"find_last_bit()" will return the bit number of the last set bit of
"tmp", which is 0-based index. Plus 1 to convert it into bit width as
desired.

Note that only the lowest 32 bits of "tmp" is taken into consideration
of the operation, since it was already shifted right by 32 bits, the
topmost 32 bits should remain 0, only the lowest 32 bits are possible to
be non-zero.

This change is tested against a test script [1].
Run the test 10 times for each version of implementation and take the
average. The result shown that with this change, the operation overhead
of "clocks_calc_mult_shift()" can be reduced around 99.7% .

-----------------------------
| old version | new version |
-----------------------------
|  11500.6 ns |       44 ns |
-----------------------------

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Changelog:

v1 -> v2:
	- Refine commit message to explain more about "why"
	- Check the frequency of "clocks_calc_mult_shift()" get called,
	  it's not in hotpath on my machine, refine the commit message
to avoid overselling it
	- Add comments for the code to explain the implementation in
	  more detail
	- Handle case for "tmp == 0" to avoid undefined behavior
v2 -> v3:
	- Use "find_last_bit()" instead of "__builtin_clz()"
	- Convert the type of "tmp" to "const unsigned long *" when
	  sending into the function
	- Highlight in the comment that only the lowest 32 bits part
	  of "tmp" is taken into consideration

[1]:
static int __init test_init(void)
{
    u32 mult, shift;
    u32 from, to, maxsec;
    ktime_t start_time, end_time, total_time;
    pr_info("Starting clocks_calc_mult_shift simple test\n");

    start_time = ktime_get();
    // Test with parameters from 1 to 1000
    for (from = 1; from <= 1000; from += 100) {
        for (to = 1; to <= 1000; to += 100) {
            for (maxsec = 1; maxsec <= 10; maxsec++) {

                clocks_calc_mult_shift(&mult, &shift, from, to, maxsec);
            }
        }
    }

    end_time = ktime_get();
    total_time = ktime_to_ns(ktime_sub(end_time, start_time));

    pr_info("Test completed\n");
    pr_info("Total execution time: %lld ns \n", total_time);
    return 0;
}

The test is running in the form of kernel module.
The test machine is running ubuntu 24.04 on x86_64 machine with kernel
version of v6.14.0, CPU type is AMD Ryzen 7 5700X3D 8-Core Processor.

Hi John, Yury,

Would you be so kind to give some suggestion/comments on how should the
usage of "find_last_bit()" be here ? I'm not sure about whether the type
conversion of "tmp" is appropriate, though compiler will pop out warnings
if not doing so.

Plus I'm thinking converting to another pointer type might might be correct
when the endianess isn't guaranteed ? (or this endianess problem should be
address and solved in filesystem layer ?)

Best regards,
I Hsin Cheng.
---
 kernel/time/clocksource.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..651bed1a53e7 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -66,10 +66,20 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
 	 * range:
 	 */
 	tmp = ((u64)maxsec * from) >> 32;
-	while (tmp) {
-		tmp >>=1;
-		sftacc--;
-	}
+
+	/*
+	 * Decrement "sftacc" by the number of bits needed to represent "tmp".
+	 * Using "find_last_bit(&tmp, 32) + 1" to get the bit width:
+	 * - find_last_bit(&tmp, 32) returns the bit number of the last set bit
+	 * - Plus 1 to convert 0-based index into bit width as desired
+	 *
+	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
+	 *		 since it was already shifted right by 32 bits, the topmost 32
+	 *		 bits are guaranteed to be 0.
+	 *
+	 */
+	if (sftacc)
+		sftacc -= (find_last_bit((const unsigned long *)&tmp, 32) + 1);
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

