Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29A31B0413
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786767; cv=none; b=JS0/X8uP3jDS7FS9QR+mx8a6xBtqgPA1YligY28q/CQhCQ26iPTQ1xVP8GnfqMmLkBDBiQj+20dBzbupUrFZsC2SSvlFCFduWIIts2su5qze4hOesBd5GerW2hySFZdkF0/d6S118MOi1/bOiT5MOMJ3M6jjPSY795yp6+if7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786767; c=relaxed/simple;
	bh=PCnqi5sVLD/Rz88yz5R4xSG2M0Y9Jq4pzJDU3PPIIMk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ow38hr0aT103rZh1RZPpVG0ISB7n7H7zitdb5JK1nCkwsia0y0cQuANq2anrvW8z0zh/5nLZi7Rp4YKvM56BBJDnlzsbxdQJlccdPQYkgTZatstiMBsplQeIVagO3D6OC8c11SCVQec771fZZ264/HdFK8us3KsoHazRb999vvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LFmSxlnc; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LFmSxlnc"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b2fc93728b2so1329379a12.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:52:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749786765; x=1750391565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/BJcwG5cjEd6RoVlGatwHPsYMBzQlGVzeAkVl5gfwcA=;
        b=LFmSxlnc2DokWtbOVp0VAEq2ubn2zYuTXG2VJKlZUTn6pWtuuPudhWR43aXvu7JzEj
         j0rJnjTPix7JDb/A9TiTlMGXdElg8X6GpRBvEJi/nCOzNNaRLzgLzG4noNVyOlFOVY1W
         Ac7KUUJN5m0SshIyELpFO9coZgI9savELvj/R/g6ruaYvWFxm+NTMcLlD7uu7fZGjn4b
         +OFouP6QIu6oU4NG4//L6tb3yyfpcz0Mb4y7av/pCqv1H3gCPz7PIivIsqVBtSyeKZ+c
         LgZj0tnBTLdkRdbPRzZ0nBEWOvIrjfuzvoBr4Zf/11joVAze+8M/rfae7SmY3JwySHLm
         4xpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749786765; x=1750391565;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/BJcwG5cjEd6RoVlGatwHPsYMBzQlGVzeAkVl5gfwcA=;
        b=NkqKvkcJnsygBr7m4GTqFvlOQhepJUnYcHrsTLzBYaMvXYSxECD1w5Qn+S70z2UTdI
         +ZITy2o4c1TWULO8urCKTRQBaak9Ar//Jo+fvlmQozdIdNI1DlzVfxq+gPei9AR4b5sY
         dZEGu5s3Hp6Gv5zj0a+w1DLMMBClCj1a05cwcdYzIT6Mucut0Br09FirRRyC9aHMv3UM
         UIUNBTAbSPMPu/PNL+xyaBbhJVkODx0+sWghDEEzUkF1PsUHJCQJS5Jfd0e2v2k/VZmo
         lv6pvrynPA62nAOX35VFVaIiEOk+ovjAMycuF0B3GKzjD7uB+ApGhP4GBejxPcn82xjY
         e0Vg==
X-Forwarded-Encrypted: i=1; AJvYcCXsnvHFbP1r9ufv/iupgUNor93gFKgiCtX9zZoW2hb22Uy3MYythcydD9WBlREcOnhNhgFr601At3KF71w=@vger.kernel.org
X-Gm-Message-State: AOJu0YxhHv3NsTOfyrJFnsfZ3/WlL1d29q5xjwk7W7xDQKYqUABYJdz9
	iE+PRJZGk92lCs5Mf+8x31gABgYVGEbiJrpXVDnCKlKmNY/J21QVK2Sv
X-Gm-Gg: ASbGncsF0DqWVENUqAJMIdosN/eMEe4+nQAKpOxf1SzxTv6xp6xJOUSxxze8vtIEo2q
	CIo1g4N8dILQH+782tUwH8mw+vmTloZk4rANHNDAG0akFFIxJjlVy4Q47DLYiPbo81UHXtLpNR4
	i1DyEETvp6+9OzdihDYrVtx/2RK/COMUjE47eklG1cI6HCiqCQKvChT7lkmWiuYckyBuQ84TKy9
	XvgK1bmKAHMsaXjz3Xf5GGvwlo18dUZE/OX2puz6rjAMRdjmZiQsQ6fKftfXLcbkXzsHA9tEZ55
	h5mi/97iyv6BOSdggdPcYITLldjuwBZATTTYvHswseW/skgg281ZcHDaO2H5LaexYZ+ALdfiCdv
	9Kfowp0FsY0ad9KU=
X-Google-Smtp-Source: AGHT+IEMlMcFeu+56I8EdU4CSHOQVBz5TmparClkfG4A6JtMLI6BFWTm09zEB1uwzM3j/ltzKMrJ9w==
X-Received: by 2002:a17:903:3204:b0:22e:6cc6:cf77 with SMTP id d9443c01a7336-2365de40addmr22682765ad.53.1749786765169;
        Thu, 12 Jun 2025 20:52:45 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365dea7d82sm4982105ad.146.2025.06.12.20.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:52:44 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	yury.norov@gmail.com,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v5] clocksource: Replace loop within clocks_calc_mult_shift() with __fls() for calculation of "sftacc"
Date: Fri, 13 Jun 2025 11:52:39 +0800
Message-ID: <20250613035239.3571301-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize "__fls()" in replacement of while loop counting
for the decremenet of "sftacc". They're equivalent in computation result
but the former is more effective.

"__fls()" will return the bit number of the last set bit of
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

v3 -> v4:
	- Use "__fls()" since "tmp" is of type u64, not cpumask
	- Refine commit messages to match the current implementation

v4 -> v5:
	- Update commit header to mention the use of __fls()

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

Best regards,
I Hsin Cheng.
---
 kernel/time/clocksource.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..1e3dc68c696d 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -66,10 +66,19 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
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
+	 * Using "__fls(tmp) + 1" to get the bit width:
+	 * - __fls(tmp) returns the bit number of the last set bit
+	 * - Plus 1 to convert 0-based index into bit width as desired
+	 *
+	 * Note: Only the lowest 32 bits of "tmp" is taken into consideration,
+	 *		 since it was already shifted right by 32 bits, the topmost 32
+	 *		 bits are guaranteed to be 0.
+	 */
+	if (tmp)
+		sftacc -= __fls(tmp) + 1;
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

