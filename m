Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AD0253F07
	for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 16:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739291062; cv=none; b=fx1LZ7Rgc/PvlicQOCadDeZjZx6e52lENWxReGvH8WO/ZcMPKmetquZkIRPwGa9D/hEZWc87u6JvQDOx1q+6hsWJxQN2HfbU0pBB3E5PaoL4AvO0tqu1JWDWCZ/V3Wt+FjLOYJsC7iko/Pq68GXJirWocTyXwfsTeUu18PIsslI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739291062; c=relaxed/simple;
	bh=uE8JjTcIS3X/dNRqD839btwDWNlnflLlkTmzPSnZr68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YV6fU5TRNOs/pmhCnYLx30yHATQyYdTTYpMvsjvebmCNn/gfx/fWly8V/YH7PPcOnRjRuEBIiBahLzx/jL76kAY4HR+C1JtgpQxM23HtjNorfMGyO5GnGpxAOFRCb4D9MLfqkp4Nif5xIamQ0lWG8Ms+zFsanyA0PUdalxA3OJ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jjVJGZRa; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jjVJGZRa"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-21f710c17baso56760375ad.1
        for <linux-kernel@vger.kernel.org>; Tue, 11 Feb 2025 08:24:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739291061; x=1739895861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uq2U7qEUxgGWSw1nLbg0P7s+1KtgudVmD1k4Y4MrMTk=;
        b=jjVJGZRaPM/Bqa8GsNZYrUIQO6mx30WwWbGck3EBwv4V5bVpWSrNwlTiy7tVGAyHog
         tr6SlAzhghbVGKmGM9aqaJnM/vPFGzC5uaUbCMKgaDaoH7RO8sMj+UDM7/QLZAZVtxmi
         wiicF0LK/sskEa7iDvUDs0UvREXdyPNnSr7+EXyOqnVXEm9IR784AQRueVWUdCcEZRPD
         cZiXSZ2sTk6p2rfitGExeQ5sjHlJUgMyt0Bl8U6Wkp0Eyo533eDFS/IHQ4+nIkyIsp39
         cTqiJXdOSbzOmqXlUdqIFoQV3EjCOAlxmlO0KabsE8NX7VsMEKBbM0x4BpSCO+IJVFdP
         aCVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739291061; x=1739895861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uq2U7qEUxgGWSw1nLbg0P7s+1KtgudVmD1k4Y4MrMTk=;
        b=KfTTNUkORHqJqZMPCAM6nD5o27StGbxaZTbOZWTcW3Axwtl5Yc+fj/J+fWVxDVe5j4
         744rm7kgeIS4Azqw4vUJlmn6qAB4f38GbnBXvV89GHrXWLyd7lHrn/6qcO3RKgLiTukQ
         F96ECwHpO9I8KRmmi2OTnAqV8x6rUvY717bllkMR/FWRbmCXkhuMmYoMxceQWSPStDPj
         x7w4XOgzenUdPHTRY5XpjfvjQOMdSnilZJO72hN8FF/YKXvZsp7NbHUnP3x71fVpvCEN
         s7Pu8sEgJdmYE25ktX1CXehsO1fXOXyldUxzNhMsTwDrBbcsVBKYFTQgjxVl7TuVizj/
         TnAQ==
X-Forwarded-Encrypted: i=1; AJvYcCUdyZtyBCnmlUr2lpta5BI8fLNq84hq13a5QVIC9wLU8Na/yaAec0+SERZq9BlQ5UHQdek4a60lUvX2Dzw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwkOImOtR7CVirERNkBxWTS+ltKvCvV8EG8mZGYTjugF0w/9Vtb
	atQHEP5N3wlYnl7x1vygf7L3+TaVvIqpLO7iQRwpPgcIKIwCJES9
X-Gm-Gg: ASbGncv0ivi4f0w+hTOhJw2Aa/3iXOULleUoKX6/a0asXZyMZG9c91+gZQnMGbnO1LT
	AhgKzHU9WjCCE/63Uh/sr7h0xokMUVRj7MeoSCfEc/LyiT7YF2OGeZbFsnWO9UUNuy5oQqHGi6o
	s1QQ3ca+Ivi7QaPO2r2wlwAt5Rz8Xsk3XMdU1nQmKot60wDG8gcV6kA8njHoa/gnQJKbn0eAh6X
	h4XQ4njUnZihEDmMmLoGQs9TNRLKaQ1GDy9gKOfPOzB5CY+GjZxhbMo917e5+2Bm81/DGnWMUV8
	xT24wqKgTB8yUt8FYvs5F7INX6cx+mb4RrDKn7rSabzY
X-Google-Smtp-Source: AGHT+IFe/hUlbxjm8FGxmvfnIj31VsinrT+bwsZ1zpIXVKCYinHpEaR28zwKBfJm8YjZJ7U6bJmFNg==
X-Received: by 2002:a17:903:1c8:b0:216:59ed:1ab0 with SMTP id d9443c01a7336-21f4e702dd6mr284610865ad.27.1739291060676;
        Tue, 11 Feb 2025 08:24:20 -0800 (PST)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:e985:a3e9:17ea:8af])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21f3683d5b0sm98212385ad.109.2025.02.11.08.24.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Feb 2025 08:24:20 -0800 (PST)
From: I Hsin Cheng <richard120310@gmail.com>
To: yury.norov@gmail.com
Cc: anshuman.khandual@arm.com,
	arnd@arndb.de,
	linux-kernel@vger.kernel.org,
	jserv@ccns.ncku.edu.tw,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [PATCH 1/2] uapi: Refactor __GENMASK() for speed-up
Date: Wed, 12 Feb 2025 00:24:11 +0800
Message-ID: <20250211162412.477655-2-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250211162412.477655-1-richard120310@gmail.com>
References: <20250211162412.477655-1-richard120310@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The calculation of "((~_UL(0)) - (_UL(1) << (l)) + 1)" is to generate a
bitmask with "l" trailing zeroes, which is equivalent to
"(~_UL(0) << (l))".

Refactor the calculation so the number of arithmetic instruction will be
reduced from 3 to 1.

Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
Test is done to show the speed-up we can get from reducing the number of
instruction. The test machine runs with 6.9.0-0-generic kernel on x86_64
architecture with processor AMD Ryzen 7 5700X3D 8-Core Processor.

The test executes in the form of kernel module.

Test result:
[451675.644026] new __GENMASK() : 5985416
[451675.644030] old __GENMASK() : 6006406

Test script snippet:
/* switch to __BITS_PER_LONG_LONG when testing __GENMASK_ULL() */
\#define __GENMASK_NEW(h, l) \
        ((~_UL(0) << (l)) & \
         (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))

int init_module(void)
{
    ktime_t start, end, total1 = 0, total2 = 0;
    for (int k = 0; k < 100; k++) {
        for (int i = 0; i < __BITS_PER_LONG; i++) {
            for (int j = 0; j <= i; j++) {
                unsigned result1, result2;

                start = ktime_get();
                result1 = __GENMASK_NEW(i, j);
                end = ktime_get();
                total1 += (end - start);

                start = ktime_get();
                result2 = __GENMASK(i, j);
                end = ktime_get();
                total2 += (end - start);

                if (result1 != result2) {
                    pr_info("Wrong calculation of GENMASK_NEW()\n");
                    return 0;
                }
            }
        }
    }

    pr_info("new __GENMASK() : %lld\n", total1);
    pr_info("old __GENMASK() : %lld\n", total2);

    return 0;
}
---
 include/uapi/linux/bits.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/uapi/linux/bits.h b/include/uapi/linux/bits.h
index 5ee30f882736..8fc7fea65288 100644
--- a/include/uapi/linux/bits.h
+++ b/include/uapi/linux/bits.h
@@ -5,7 +5,7 @@
 #define _UAPI_LINUX_BITS_H
 
 #define __GENMASK(h, l) \
-        (((~_UL(0)) - (_UL(1) << (l)) + 1) & \
+	((~_UL(0) << (l)) & \
          (~_UL(0) >> (__BITS_PER_LONG - 1 - (h))))
 
 #define __GENMASK_ULL(h, l) \
-- 
2.43.0

