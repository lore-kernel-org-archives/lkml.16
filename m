Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18E8823958C
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 21:36:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749591371; cv=none; b=Pp7I0X72lmtlQemMhMBJxJK4vQ6kr1JD/Vf55teoBxN/jWOVzRcC7rOCVNpyxHPoOnvQeNbQmO6cVE955C5lWL7C7pTJcsVkNw6lDhrScoPGOc4pnthbSXjeatvhzBH1o61Z+hmxYwyBtqG/WcvlEt4Kt+AgazpRk3j/yMNqDDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749591371; c=relaxed/simple;
	bh=I8UbiObQzNHlfgvyylxxAXl8H2Wx63FtZBMws33juYs=;
	h=Subject:Date:Message-Id:MIME-Version:Cc:From:To; b=uIBccNiJug/Y+G9UgjjyBx9HejxOEhzANPHLtADkZoDJ1SCvRK8W55B4700pPqZgTNx/0316o2p+80Zcxqx4FaI3mjpIp1txAo19hV70ZpZeNGZ7xEhSp6KxuZkXLjA2NInRrU4ie7/zyXmsl4C60hLQhnZfih8FfvOlTYBDUJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com; spf=pass smtp.mailfrom=dabbelt.com; dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b=1lRwEgFT; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=dabbelt.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20230601.gappssmtp.com header.i=@dabbelt-com.20230601.gappssmtp.com header.b="1lRwEgFT"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-311d27eb8bdso3715362a91.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 14:36:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20230601.gappssmtp.com; s=20230601; t=1749591369; x=1750196169; darn=vger.kernel.org;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:from:to:cc:subject:date:message-id:reply-to;
        bh=KaHHQEiupZ06D+yq5AKLPI1+m/XTQ4+XHbDcRMw88EU=;
        b=1lRwEgFTQqD8jL7mTbE6wec6lq4GMZEJy+Pm1s9DRb+VEogKu8jtEfAozl7SnogpZE
         N6vQb2qBu1/BRtxkMLu2tu9hj5Vjik1jnrbd3UeN+mLvpCqs8VlVBN8ApOSS2qFcNgFB
         CscPa4WvmPSDsCqZmrONFsIfppvZxV4J2tACOkdbaJ/s2JNm2vJsJGcRJ9NrGWyvXpP/
         MxMDbiTvKTrduXmupCe+pMgSxdaIndRZF4nOKMuArCY2bq49GfJmb6NqwKAil12/5HFR
         z3l5jZ6sbzOpl0dDKE5Hm0pwTGZs36jSBe8g1jWoRkijcmkfBTvEEkfCk9WBXCb9U3Dd
         3YEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749591369; x=1750196169;
        h=to:from:cc:content-transfer-encoding:mime-version:message-id:date
         :subject:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=KaHHQEiupZ06D+yq5AKLPI1+m/XTQ4+XHbDcRMw88EU=;
        b=rtlv6jnw+GdoypFdMGDo9312khYRmi6GjDYZijreLE5Cj1edbkAG3yAfMxOqhOLClR
         VjMG/qucXJMNTj4E6mU5dk8L3vHz979zbsDJYAGRql81LTVlHKE+4PZzXiCvQH8tO6hi
         z/BUaCArdlN5JpGPII30tBvjMQ7Smrq+zitRF2qHT5KypX02H5QDT7TDZxdmm/ldkgkg
         5LS18lBKSdTKivisomQ4g4teQwTFLpdopU5z4UBtmEx8dg/Nv9KxLS1tkPOkFUkjeIgO
         wG3kdz+ZFQkXNpyZyMK4cDbyDFMB29P45qtTMMn6RlY+FrRFs5f9/mSAH+r/pU99hFXy
         N5ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCW57ly1xR4SCfqauhz7PLCBvI03zqg49sTW6FiwuJlzxZCh4kDKdikGPdyIoUn7rI63CXYKtcTA/gfPgsc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6h5et9l92B/AA9xA+XS1c9OhLOzEW/YWg6OjQisqZl7UVi055
	jus3LcTmWs5nCKZlIhdJity/xLKj3xGVY104YCbHks4UEqnkbf23P8K6O1OXexw+/tg=
X-Gm-Gg: ASbGnctd9peD0Xl/mS9HEAv3tUA3pWBbdKuk5jHx4g/7gVE0E1NOqtM48PxfBP1P/i5
	X+xvk46ue3K6nzDHdYBpd3EvlHGugcQW5X4irqJnq5UNu3OwTtL2sCpWg1wfrvIQg3EEk58/EB8
	GUfErAJ5rAHOHzU1YDtKlvJY2zOMB36QeMjXvm1QUhHYqD7rISy1QeBMoIC92wcGcbO9xOHutvx
	TKdVidhchz9OjvEUWVJVGgFelBl6dKevkhj8CrWemj9hwYacsvyhuOTb6NJZwUz1eGg3x1LSL0a
	7pk4cfFcu6ye8bc8f2HuMbqrNH8VAvg7jSNGUeyUgUwnEy3R7YCXVvrClogC
X-Google-Smtp-Source: AGHT+IFYYIeiPz9kpoQxtEx9N1kGD9o1EkK/pKiuLs1MruLC/T69Bnqe3L89R/Uj9Yt0DTdGl5i/7g==
X-Received: by 2002:a17:90b:4a85:b0:311:f30b:c18 with SMTP id 98e67ed59e1d1-313af0f8588mr1387259a91.4.1749591369214;
        Tue, 10 Jun 2025 14:36:09 -0700 (PDT)
Received: from localhost ([2620:10d:c090:500::7:116a])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-313b1ff0fa8sm78207a91.8.2025.06.10.14.36.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Jun 2025 14:36:08 -0700 (PDT)
Subject: [PATCH] RISC-V: uaccess: Wrap the get_user_8 uaccess macro
Date: Tue, 10 Jun 2025 14:30:58 -0700
Message-Id: <20250610213058.24852-1-palmer@dabbelt.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
  aou@eecs.berkeley.edu, Alexandre Ghiti <alex@ghiti.fr>, cyrilbur@tenstorrent.com, jszhang@kernel.org,
  cleger@rivosinc.com, samuel.holland@sifive.com, linux-riscv@lists.infradead.org,
  linux-kernel@vger.kernel.org
From: Palmer Dabbelt <palmer@dabbelt.com>
To:         linux-riscv@lists.infradead.org

From: Palmer Dabbelt <palmer@dabbelt.com>

I must have lost this rebasing things during the merge window, I know I
got it at some point but it's not here now.  Without this I get warnings
along the lines of

    include/linux/fs.h:3975:15: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
     3975 |         if (unlikely(get_user(c, path)))
          |                      ^
    arch/riscv/include/asm/uaccess.h:274:3: note: expanded from macro 'get_user'
      274 |                 __get_user((x), __p) :                          \
          |                 ^
    arch/riscv/include/asm/uaccess.h:244:2: note: expanded from macro '__get_user'
      244 |         __get_user_error(__gu_val, __gu_ptr, __gu_err);         \
          |         ^
    arch/riscv/include/asm/uaccess.h:207:2: note: expanded from macro '__get_user_error'
      207 |         __ge  LD [M]  net/802/psnap.ko
    t_user_nocheck(x, ptr, __gu_failed);                        \
          |         ^
    arch/riscv/include/asm/uaccess.h:196:3: note: expanded from macro '__get_user_nocheck'
      196 |                 __get_user_8((x), __gu_ptr, label);             \
          |                 ^
    arch/riscv/include/asm/uaccess.h:130:2: note: expanded from macro '__get_user_8'
      130 |         u32 __user *__ptr = (u32 __user *)(ptr);                \
          |         ^

Signed-off-by: Palmer Dabbelt <palmer@dabbelt.com>
---
 arch/riscv/include/asm/uaccess.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/riscv/include/asm/uaccess.h b/arch/riscv/include/asm/uaccess.h
index d472da4450e6..525e50db24f7 100644
--- a/arch/riscv/include/asm/uaccess.h
+++ b/arch/riscv/include/asm/uaccess.h
@@ -127,6 +127,7 @@ do {								\
 
 #ifdef CONFIG_CC_HAS_ASM_GOTO_OUTPUT
 #define __get_user_8(x, ptr, label)				\
+do {								\
 	u32 __user *__ptr = (u32 __user *)(ptr);		\
 	u32 __lo, __hi;						\
 	asm_goto_output(					\
@@ -141,7 +142,7 @@ do {								\
 		: : label);                                     \
 	(x) = (__typeof__(x))((__typeof__((x) - (x)))(		\
 		(((u64)__hi << 32) | __lo)));			\
-
+} while (0)
 #else /* !CONFIG_CC_HAS_ASM_GOTO_OUTPUT */
 #define __get_user_8(x, ptr, label)				\
 do {								\
-- 
2.39.5 (Apple Git-154)

