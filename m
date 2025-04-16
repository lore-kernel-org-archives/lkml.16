Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10D1A22FF59
	for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 23:06:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744844763; cv=none; b=LOFAHSQWmTVER5hno6iX4SSA4q/nKtzzLkAaO/XJxVOlDz49NiRxuMCRpbtEP1f/RuEgco/9rTbIVM/XCz2Au/KxZKcb0wj6vCOustGixNUVV3yi3ASbDC2rzvJdBDyCuomW2LiuFIit1GPSg0zKEqUWghx0cNfHNJGEutRFCRM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744844763; c=relaxed/simple;
	bh=4kyHN4UTIgjzUuq83z52M+ItyFPbuwZn0oMGTQl/rqE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VZYmfZ8mqX+2NinJiQSlpjHG3MiAM11TodN5h8he5ylqN+WKdeJSQ/feiHiuNVrTwHL1dFk57n+NT0U27tdnRNsS+FElWfPWxy3kgmGnkUEkT1Ry97TrkamfMGPokLbt6y2bcggd9VMGvhYosPBRBTPy8WO2JFo9eh8N6YHQZ9g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=di+gkxZW; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="di+gkxZW"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-223fd89d036so2260365ad.1
        for <linux-kernel@vger.kernel.org>; Wed, 16 Apr 2025 16:06:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744844761; x=1745449561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=CdmSSsvImzYo0cP+z7F0QmEv3k5MRXxXAzSzF8bX4M0=;
        b=di+gkxZWijGHX1tTqI3YNx/tL7unJn2+fvQpB3KezXhKCRrfv1Kri2LH95jLHbN8Hr
         MlduGuJ4uY7YNKXqFv0UCy3+j+h+8ce3VKymEl/1R3mmEfCzeJgoTWEPFhYJTb9Nt9Oc
         TiGrHeNYmT5RIrojoGQ9PuF478lKPS36XHvhyEK43pRslvm3nxdKoutsN0immx7+IllM
         lPyqdhP8A8yGnfobozkv62XUFYI2uJjf8V8SeHcX/7VerhMOkb11aFz9cYpxAyPz/IYS
         BLhtD5Rvu4JzXEWbQlJOuy1u+mm7H1gHma0fQl2Au4fTi5qB6X+V6gYIyfUbHT2LMCH+
         eAkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744844761; x=1745449561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CdmSSsvImzYo0cP+z7F0QmEv3k5MRXxXAzSzF8bX4M0=;
        b=vpRHz2HUnKAWyKVk/etDVwyKIfABGVuz6A9kVDDeS+ykU7unJJLtcg0+upp0f9P+F5
         DUbZI3G+bCqd6a8luuPvJTxzHtaoG7yI2VM2hSe7CXqoFwA9a9lpIJYO+ifLlKZlwj8R
         BlcXx6RmXoob0yhXqgFBl7UAlXrL8a44iBYr+YJfTx8hR9mK8j4F0La48C1h+sxS5clg
         zZV0sw1vh3Ef7WeUfcXXddtOy/IvSLWD1nZ1f1cbi5AgBi7oljEbxr3oIsHbo8/E+FFM
         JXrzAS+XZug81ZSwox3XL8cs/SxDNEZp40VfQ2ZGDrybu+tbcWjBdjL2p97TZQOs0zKE
         T7aw==
X-Forwarded-Encrypted: i=1; AJvYcCXjBoovf1fr7NR1xL/AbrGUFZPpwbyIE9Zahxk/MTOfJ3RzEdrDhbvQWMEnyp/V/ecWtxqUlya5nmWqGhw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxm1+Ubypfp6iLmkZUdFHHpVziJB7L6WCq+7MmtoL+Ws30am2Ty
	4uW6kVkn3eeKSeaC8pLztT0dBB5JI/WJSVA4RsEjH0mg58uwjMVt
X-Gm-Gg: ASbGncv2F7m7dK8bNAMkWm8W29AzM60DBu3s6be5pDGi5hgn+sDG/YXLa0E96eqNona
	+gczXHkjQcZLE//yFBQjTplNEYoWlFcp6lKSlCprVMJ3JOTgxDE/RCiN608GWoEHmuKcU3t58CK
	tRU0Tyc6/NAiiSrmMMZYt1TVcjmhr/pNELEhWvp939Vaur5tlT6a96FXsNfPfMNCYGAfuIkTzJa
	cuTiajCQzsTQAzXB3B3d6k6S9xtxT3Bawe80NtJpl3gLrPnBimhT+Zp1nEwtkcYvwd4VbuWV5VF
	eEY/3NBKS/PVXs2+t81Fb0pmNbhB7gbQtsfgXHWYcd1utwkfrWfYjQ==
X-Google-Smtp-Source: AGHT+IGb+iwZPvwFmGD/Bqht/JaCGGiq6oLImqQOCQMLbnS0CXsfrm1e96q4XIwZpdcLIdyCbRwIng==
X-Received: by 2002:a17:902:ea0a:b0:224:d72:920d with SMTP id d9443c01a7336-22c35973f3cmr44762605ad.37.1744844761237;
        Wed, 16 Apr 2025 16:06:01 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73bd2199d57sm11048561b3a.32.2025.04.16.16.06.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Apr 2025 16:06:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
To: Andrey Ryabinin <ryabinin.a.a@gmail.com>
Cc: Alexander Potapenko <glider@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	Dmitry Vyukov <dvyukov@google.com>,
	Vincenzo Frascino <vincenzo.frascino@arm.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	kasan-dev@googlegroups.com,
	linux-kernel@vger.kernel.org,
	Guenter Roeck <linux@roeck-us.net>,
	Linus Torvalds <torvalds@linux-foundation.org>
Subject: [PATCH v2] x86/Kconfig: Fix allyesconfig
Date: Wed, 16 Apr 2025 16:05:59 -0700
Message-ID: <20250416230559.2017012-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

64-bit allyesconfig builds fail with

x86_64-linux-ld: kernel image bigger than KERNEL_IMAGE_SIZE

Bisect points to commit 6f110a5e4f99 ("Disable SLUB_TINY for build
testing") as the responsible commit. Reverting that patch does indeed
fix the problem. Further analysis shows that disabling SLUB_TINY enables
KASAN, and that KASAN is responsible for the image size increase.

Solve the build problem by disabling KASAN for test builds.

Fixes: 6f110a5e4f99 ("Disable SLUB_TINY for build testing")
Cc: Linus Torvalds <torvalds@linux-foundation.org>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
v2: Disable KASAN unconditionally for test builds

 lib/Kconfig.kasan | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/Kconfig.kasan b/lib/Kconfig.kasan
index f82889a830fa..190297f2ff83 100644
--- a/lib/Kconfig.kasan
+++ b/lib/Kconfig.kasan
@@ -37,7 +37,7 @@ menuconfig KASAN
 		     (HAVE_ARCH_KASAN_SW_TAGS && CC_HAS_KASAN_SW_TAGS)) && \
 		    CC_HAS_WORKING_NOSANITIZE_ADDRESS) || \
 		   HAVE_ARCH_KASAN_HW_TAGS
-	depends on SYSFS && !SLUB_TINY
+	depends on SYSFS && !SLUB_TINY && !COMPILE_TEST
 	select STACKDEPOT_ALWAYS_INIT
 	help
 	  Enables KASAN (Kernel Address Sanitizer) - a dynamic memory safety
-- 
2.45.2

