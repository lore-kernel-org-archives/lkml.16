Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 799571EFFA6
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:49:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749786544; cv=none; b=e+XWvMSunQRjC1HZJVOfi34BGISp8kkwHSfefP9oZ6UQxyEYxokRelodIF6yR6+M/7WoUslX8iHLI9KYAnPxvwmcxd7ltI5aMvJyx73dTyieJU5ifjTH6u3n0DvpRgMY+tqVoq1W/K5AVaH3pjQCWy6VgqEx9osERUexhCCWVlw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749786544; c=relaxed/simple;
	bh=68tEN2dZo1tcrtx31a6qsgDBD/Bh/ugfqDRSZqkFmK8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hDneyBnaNpBHgO1+kxWTLbJveXdwNsy7nb5VY+y8hJAPi7odKfvR5OL5UeMWARlxgmllSqXpGvfZgvz3MlbAR+Mde/oM6nR43HWQuLx5VX3l3mVs4vVxv+q1khibd8gdM9qGdEYz+t4lQLSgTaHs7L7qCfG6mxPNmHh0Tm4L4hY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cbc89HHt; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cbc89HHt"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-b1396171fb1so1102366a12.2
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:49:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749786542; x=1750391342; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=hOV1CbIWien3pdSZwfL1WXU4HFPINY1VNUJGegt7uI0=;
        b=cbc89HHt7//cmHTyo1eu5QPM2yuICD+5Y81emUTlyJtQ8qfvwKHaTiyV9TslGXxrjk
         5XutYeiXZT72nH2It5XvLECix8YLq3v6FvgvtSNlqX38HKicreuAMryQlFF0+xfJoKk/
         LpQYa8+o/i0kY2NSMvmxl8p7cmdSm9ejAWYTQV45y5DkRbuIUyd8Wj7FcxWRR+KHtUHd
         t6G2n4AYSbssPnhWiNT2ycYU19m74NCplKMTVqJc0kRNVz8RD22BV5TbRzplZK+k23WC
         n+URAkS/vySpp1AbNgzhuW2AZ4GLijLLzaOW8bJSxClD9HLseTCSpQUfhXvSshx4cAVM
         4Lvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749786542; x=1750391342;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hOV1CbIWien3pdSZwfL1WXU4HFPINY1VNUJGegt7uI0=;
        b=bTaxWMywom73eEL7h6OQzBlsZZZJ4ceGcBI2bIxi91GmlbnagQBh4LxCDkmpg5zeNk
         bWkKsB6w2JSTGPhYkYfxCfYq3wmZ/LjsMclcDJuMKGZIXbGZYfIo95uGYr93bFjqDNLQ
         ISZCq+3fqOE9xs2+tE02QFTZldiP8hbfCh8nYiZr4cYZLqlwOLH/S8oVi9KDF2ppq3QB
         /dCI8itANQJcXjwhRZNxLciPEVKVO3UaZ/jrpqOI6NWyqY1rX0Xebiq1FRD6C4JqcxQ6
         +y27B8VDlkTSFTIzPIFEeB4rigO2uJ25aBEXIb4cqZ9AUEz3yACgLkxJg7LgK3+qQR2f
         DBSg==
X-Forwarded-Encrypted: i=1; AJvYcCWKOljKvbi9v/DhgCJSGKArb0UQW/U63jtmGg/GRlXjfGdOBP0uhpkpHRcFHZ7+/8+RyhNRVc9hz55EQE8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrYxYBbfIe4+BM+7o/v4Y8OBX1mCENMGEIGFHN5hxp76YkkGjN
	8cMwPgz5gHOc/Y2BUSEaoJoqt0R1AX52vP+bbmbXONIn2uUuJMjrl1bq
X-Gm-Gg: ASbGnct1cruqOM1bjEZzWYxeQNQpyEayW7VMyFjti8z2e+GjO/PHuAaDo8bm7ReNfSz
	BauWGyy5vtq8+bH68aIdvCSFigqMZoXtylo8mwQ5Rh6Yw0slbvIfN1ueAPv4vrfbpXweZ8KJg6G
	jl6DeNG42FBcEvWRTSd17uRNXfRIAkzfr0TsNKij2ITGQL/k6G2eF2fUcCJ2u4+DaW2uFBe6zpR
	v7s+e8pLb/Aj3xYN3H9Wp2geQ7bUz0Z3UVjtjD5iNmpxl2ovnnjfHQUlK2PLuNSkysQMI0qftEM
	dl70CH3VriqQcySyvU1Dw7k7s2Lg9Pho47IpL0oCh++8hLdXFHsDDrCFx2n71nKaUiItJ2XeIx+
	i5Uk4IGzRR54B9RA=
X-Google-Smtp-Source: AGHT+IGcCPbmzcZ4ZFmcQvKsoG8mD+Ad+sBXd7G1jj4p/pJan4whW0SJ9sBLXl3J2tSuwpMj7yia0A==
X-Received: by 2002:a17:903:1c9:b0:234:f4da:7ecf with SMTP id d9443c01a7336-2365d887fb5mr17476245ad.8.1749786541656;
        Thu, 12 Jun 2025 20:49:01 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:873:d810:9d97:1c69])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365d88bf78sm5090925ad.27.2025.06.12.20.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:49:01 -0700 (PDT)
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
Subject: [PATCH v4] clocksource: Replace loop within clocks_calc_mult_shift() with find_last_bit() for calculation of "sftacc"
Date: Fri, 13 Jun 2025 11:48:55 +0800
Message-ID: <20250613034855.3570641-1-richard120310@gmail.com>
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

