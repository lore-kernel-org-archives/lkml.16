Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E1C1DC075
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 03:30:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749612608; cv=none; b=kkJEPcvlH4Req5g9a/OgZR+o6wnhB1MEgUnm3e9Aucf8+J1mscPzGagF4SGSouPFby2QRJzfmQtN7jrpW1sRU170ntCB/MZy+DB/7VcA6aHbb/wJ404zJT3ndC9hcwywhwo40PxNeHI1DkS8lJobySsbRpULVFWTJwgUCktBjCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749612608; c=relaxed/simple;
	bh=imFW4IVAwK25sxCBe37r/zhbuYFpu+JsPfSgg1qERHY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Wkxe50B93b/y6adaY+NPVyULL46yE4+A7O+cbfnUBEGs687vIuhkTEBfYPiNJ7Ymh+ilhJILrvSLIE07HW/QCOLrjRyCtvwfHTtkG9Ln4cxip3eM1t6/uOphu1EpxU5tt11Qs0eGS2aIO+9O/KzatQxrKBpJI6Ui/qQhkJu9dBY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=csVQcsXJ; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="csVQcsXJ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313a001d781so1230191a91.3
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 20:30:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749612606; x=1750217406; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqSs26f4pWYApxdp4s2SLF8oPpRm6z/KDbq/LNfibWk=;
        b=csVQcsXJAtHT5KTWY3x3+4SbDkfxiVJyP1LpAcE+lgZlhmWX61TxQAYQu3RH3kI0P0
         niijrD7+bCJwy5wOYCLmtIZ0Ajjo8UQA71o76rRuDzJCeF/mhL9KT6r0j1aaOiL27QPk
         K5A5F+cOzC1oK1uFWBzqKcH0TxD0WC53pOud78lJokmyX4+X/o6p2/t51tEU/Zzqe3Fw
         fHMi9AXQk1hdH2J+MAR9JEp8ZZG4zxRlf/2hV56gcwkSrRV0EBjLW3mBaI2VX4lO/bmE
         /ZFPjCrw/iJPXjD5BUDRICoHq+j3Tkg5g6+qv0yVKDf1p5VszRaurUsn5TXkV4zILLlQ
         pSwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749612606; x=1750217406;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EqSs26f4pWYApxdp4s2SLF8oPpRm6z/KDbq/LNfibWk=;
        b=NHKuiGidIax4x1fqqRaEVBNBGARTZOlhGvdqRas5cUGtMA9eu/fuq+M9s2egBCrB3E
         eOBBeiMhvemBbJ61sfwnw5gwxojjjdK9r2mD/gHys+N8ICc+RJieThMTf7pKS5dfCbGP
         1tgeUbWNusbTTSFewRZwVEb+cSjehW4xEqcyx83gDIZi/JHAvIEzZmgYcwLFzbzPqF4J
         SuUjoOTH7OtBrWnxr4HaL7bdD7yl+6GUYc7yGiu7YE7cqMgtyggJA/GwxgwDCAaOYGg0
         kEyYdpx26DNEeGocQryo86lh7p5MIc/usutD+hR+qQ2HsW0Apv5o569IY2WSb2bkmRBP
         Os+A==
X-Forwarded-Encrypted: i=1; AJvYcCXMSZ09oYaePdNONcJ86e2FZC5fuhlbQyp1sHfuH7yQBs/xoLbM2ob5McVn+n8duyHv4i/zm6LGX/nL5Mw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzp5HTPvdjqow+LKYsKOtJpTS8r0fLChRdzRfpV2mMJyXbwbSQZ
	11EgVaaeCInZamNunbCblggfHQ3v8HlMy//jtMzOmmVAvcLO8pB2DpY/
X-Gm-Gg: ASbGncsIUEc0cZAhHKpEAlUy7olwXUxfW/3PNqlIBDLnQMA92RE4bMgp9LeERBgXbBV
	BEQGBk85Xj0T6LEev008ouJDlTJpVRlCZQXWoFpv1eIGz0X+Z8KLviujaDSUXKd3aCoFa5Y3WwM
	03cNi9NUuipmPKccBZ50tbMK2dQgDqakDxGwKvXniFcEYo2wkhdB13BFUa/H7HNX6lZlgQG89lB
	Qaa3XIrcL+i1VAMLYHduMXx/habOs+U9NqKeQtToXkKppI6queUOQJyqxv+2kPgF+yLcVZRfBT0
	PeEObWf7kF7bzvHumQ94NyDAMAOKuseU/sxwRRNgDglO2UZ4oj62Lo2DHTABbXSWYHKRacjz2Op
	LJErbGCYuoJ+c9DgY
X-Google-Smtp-Source: AGHT+IHgU2Pp0OibXDfJ5GEXHjFB6R/DCOOvsnsDdMuw0OtMeleth8YXYWmzmVwgLt6uLhHXriVoEA==
X-Received: by 2002:a17:90a:f94d:b0:313:31ca:a69 with SMTP id 98e67ed59e1d1-313b1fbe765mr1688087a91.18.1749612606365;
        Tue, 10 Jun 2025 20:30:06 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:52f2:ddbc:f858:ca43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-313b20078a4sm328899a91.13.2025.06.10.20.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 20:30:05 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: jstultz@google.com
Cc: tglx@linutronix.de,
	sboyd@kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH v2] clocksource: Replace loop within clocks_calc_mult_shift() with clz-based calculation for sftacc
Date: Wed, 11 Jun 2025 11:30:01 +0800
Message-ID: <20250611033001.707396-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Utilize (32 - __builtin_clz(tmp)) in replacement of while loop counting
for the decremenet of "sftacc". They're equivalent in computation result
but the former is more effective.

Using 32 instead of 31 here because MSB position is 0-index, and the bit
width will be (MSB position + 1).

The case for "tmp == 0" should be handled separately since
__builtin_clz(0) has undefined behavior.

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
    - Experiment using ffs() but it's used for finding the LSB of
      a number, which isn't MSB as we want. It would still need
      looping when intended to use ffs() in this scenario

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
 kernel/time/clocksource.c | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..59145d762f1e 100644
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
+	 * Using (32 - __builtin_clz(tmp)) to ge the bit width:
+	 * - __builtin_clz(tmp) returns the count of leading zero bits
+	 * - (32 - __builtin_clz(tmp)) gives us the number of significant bits
+	 *
+	 * Note: It use 32 instead of 31 because we want bit width (0-index MSB
+	 * position + 1), not just the MSB position itself.
+	 *
+	 * Handle tmp == 0 separately since __builtin_clz(0) has undefined behavior.
+	 */
+	if (tmp)
+		sftacc -= (32 - __builtin_clz(tmp));
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

