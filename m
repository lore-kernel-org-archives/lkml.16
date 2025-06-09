Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF0510E3
	for <linux-kernel@vger.kernel.org>; Mon,  9 Jun 2025 19:46:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749498380; cv=none; b=pWzhe5c+jAQhQ4tkOYD51JIJQ1JuRw4Q69YgGxLiJYEXvIa03HMbDKq0HAjL909OjNmrJQU+KoUjMh6UlZKpy7n0QIBumfLAPejfKlT/IXIN0NOuFuqbGsHA9BX8j+ypi0JRbDQil6LUTIy4WhonHhen7uMuT7Qkz9sKD9h9754=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749498380; c=relaxed/simple;
	bh=tsQS5vYjgoSyTwBOiFvqbFkiSsjkmILrOh0sxzhs/C8=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bXWLthhS7li+zMAFjJ1KCEfqUGreIjq7yHumpVshY6xW6R8+x9JU9h59v4QKNVjFuAqj3CGM+1mgd7f3mzItsUSviUdbebbpYE7G8ArS8SdjSJdvfSdJ+QwARo5dQNmB6nSShNCJxX1Wuz5jMEBcsLFUFPJHg7/ugBoe/TUy788=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RNAHKjyv; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RNAHKjyv"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-74800b81f1bso3599080b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 09 Jun 2025 12:46:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749498378; x=1750103178; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=3kuBPdet+hShSBLgDexOYKZ1NMt1ij//HP+eZ7EoV18=;
        b=RNAHKjyvFw9cGM//1wU+2auYoRRtaldzRV8Gux9JxsF/UM+DIZhnP3v9ws5QAHMLTV
         m7CP1N9GlqQO8Qme4OiOa80raa4tPbUReP6L2lC6aPRPIbYFSjsXFyHE+8MeLNS7BAgm
         /3XHJyw9ikYnF9/LwXjd+vqF9Hv27Dd6MmoBvjkj2ZNoUMnEkbxR7CVThWmOSpJK9BvV
         ofWcl7cTMkeOvg9RN+6ocFE1LIopd6tTpSSVaejJ3kYHwrLM1aN5M4rck+yuNx9mdemB
         BC7Wa1CxI0evjpjlBlXUVUW86XJRvy1HwqORUJR5DiBGdoNmXqid2k5AZ7aRyqhqA2Mx
         LBQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749498378; x=1750103178;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=3kuBPdet+hShSBLgDexOYKZ1NMt1ij//HP+eZ7EoV18=;
        b=leVDYsCMEzxITrocumVjOtnLALQT6nuPBGN86FwMyr0Hi/7SXNuWkVc9YcmkmfGB7V
         q2MH+QJgQri/iwUdi6G+hfB3dLC8yfd+5Jy5EcQiqnurvRGbzZMjNBFe2qm/KxWcaNNx
         YnuuL6XaeWa4tuCIlloQYUTyeG+kKa8ugyFQ25tPPkYVufoxtj9U/LzUTiPkBb6QCkYC
         mvoLjBOCdXNTaEi+uE5cxNhq+QjzBpPPzUWhGQ89Qw6wb6U74jCmTS9Pe/GxDmIkvn5G
         MGeAJQVq8lzKAuC1Hva6SEKT9ChmT3Zpy015z0f1pM/GihTq/uJuYTRxCbrbZYDeFFgx
         otUg==
X-Forwarded-Encrypted: i=1; AJvYcCUbjh5AIJEyYUnWlUN4YWwBv31qBTDS9kDBxnpMRXEu7D5o9UESfYZ7mK/yYx02zlod+KaS6eBCG8Y9bDQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy69PayDM4TPJQvQdtg5Swh10XCDbdUvEcSgww42AKQaAdQYyfB
	YFXzUDUaeYyp3NvI573qK0IBQmB5CUwnUKmJZ8SI8z9pFmuIkBxY4tfU
X-Gm-Gg: ASbGnctuLtWsSsvba/HAizlbKfabZyuh4QBtKl1rNq5oHhkhUsmfe+cLgJpaOe007TJ
	2CxdKwzkiOHDblrflVohsHfn2Oq/Cgn1D95XSYWnEfvmLnLD71vZWdajv5Lvzs9lENgwy1oBv9A
	upSqge9I5ddtsR0qn/fGWnWQLn//8IEG8uKJ4/ZI9VGWBdPscs3jQtiNcWcTO01MhUU69IpPJZ4
	0esEEL6tdq7mkemI6i4ANlybKUArC3MWZa1ru8AIUXFoa4ecl+kp8yEoU7JUy/HK3Ya1BWvKeIq
	DgN0YCK5zxwtcPU7byTYyFTE+BWzP6+hvCd09V0U9QDIPveXbFQUd4lxyGvHRWLmnrauGjK6lxo
	AWIArZA==
X-Google-Smtp-Source: AGHT+IHkRM4sw5qQkvn3TOI5WSvRdJnBiE1KCLyaJHjsxSsh1uf7TbYqdTfYkJQKUBorJhfzz96P2Q==
X-Received: by 2002:a05:6a21:495:b0:1f5:8cc8:9cbe with SMTP id adf61e73a8af0-21ee24fd675mr19260356637.5.1749498378028;
        Mon, 09 Jun 2025 12:46:18 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:e987:d76b:ffe6:6a43])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7482b0c7db7sm6299052b3a.138.2025.06.09.12.46.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jun 2025 12:46:17 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: sboyd@kernel.org
Cc: jstultz@google.com,
	tglx@linutronix.de,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	jserv@ccns.ncku.edu.tw,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] clocksource: Enhancement for clocks_calc_mult_shift()
Date: Tue, 10 Jun 2025 03:46:11 +0800
Message-ID: <20250609194611.690678-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, counting the value of "sftacc" within
"clocks_calc_mult_shift()" use a while loop to determine the amount of
decrement operation for "sftacc".
It's equivalent to the position of MSB of "tmp", for which we can
derive from (32 - __builtin_clz(tmp)). Use 32 instead of 31 here because
1UL should be treat as an amount of 1, not the index 0, and even though
"tmp" is of type u64, since it's already shifted right by 32, only the
lowest 32 bits will be possible to have non-zero value.

This change is tested against a test script [1].
Result shown that it can save a significant amount of execution overhead
for this function, which is invoked often, the whole system would likely
benefit from it.

-----------------------------
| old version | new version |
-----------------------------
|  11500.6 ns |       44 ns |
-----------------------------

The execution time is reduced around 99.7%

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
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
 kernel/time/clocksource.c | 5 +----
 1 file changed, 1 insertion(+), 4 deletions(-)

diff --git a/kernel/time/clocksource.c b/kernel/time/clocksource.c
index 2a7802ec480c..b4f8fffae847 100644
--- a/kernel/time/clocksource.c
+++ b/kernel/time/clocksource.c
@@ -66,10 +66,7 @@ clocks_calc_mult_shift(u32 *mult, u32 *shift, u32 from, u32 to, u32 maxsec)
 	 * range:
 	 */
 	tmp = ((u64)maxsec * from) >> 32;
-	while (tmp) {
-		tmp >>=1;
-		sftacc--;
-	}
+	sftacc -= (32 - __builtin_clz(tmp));
 
 	/*
 	 * Find the conversion shift/mult pair which has the best
-- 
2.43.0

