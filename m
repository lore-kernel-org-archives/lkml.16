Received: from mail-wr1-f68.google.com (mail-wr1-f68.google.com [209.85.221.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6A23171E49
	for <linux-kernel@vger.kernel.org>; Thu,  3 Apr 2025 18:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743703955; cv=none; b=VzGME9kCDMx4ZslUw34f6Bh5FSbA9lqVpLv9Puh3KsXHtFoFo6Abs6yzdrTUApFGp2RXzINdhU5MgRoxXTamMunrnUCdbyKwBLfdTS0LNB02QnbQHPTbEpBBL8flX1pnJUeYW7qAN5yXZn0xPB7yM7eUVDmVjGqrWpDptGca268=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743703955; c=relaxed/simple;
	bh=7f40mJ8LnqL7CspekV7TYFbVToX0I2pz85INXUfPxGs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=WTqOK8ZHq/UTyMxNBf+xou/zkBBVXCw3CiZOHDWUwsU3ZwxcUfzjxJ0Fw2hmT51onxH4D+FxBIW/JxizNvhzBG5Bcy09voo4IOUVfBgxamqXRfrK0iBKQeHSgJsYTHbVN/lENn1tG2JodH3quxPMYOuvK0Y9ijKuLmHpAV5lCVc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZTcG/Zcp; arc=none smtp.client-ip=209.85.221.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZTcG/Zcp"
Received: by mail-wr1-f68.google.com with SMTP id ffacd0b85a97d-3914aba1ce4so1037388f8f.2
        for <linux-kernel@vger.kernel.org>; Thu, 03 Apr 2025 11:12:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743703952; x=1744308752; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Cylaq/MJ4Q4v84obWEALM9f5r/Eyjhy9D/KWsJ7EmiM=;
        b=ZTcG/ZcpeCa5CZAqkGmGdozc3g7WOrCLODj8vgsq/10aijMv3Y7cWa2kRKvkJtxv5Z
         q4QirlLozUTl14ABXf2nfhTjkjq5c4bl09WUnD6jGj2eyh5U2YN9EnQXuhkJT454hNSM
         eCHkGDtW4mgCkiYRfpWmUtkqh1aZBwn7+jBOQqli3QbzefAgSFAymWp6hkDbCeDYkoL9
         3FSGPzG3NyH2kFA2YlZjsB4GAnnnU2wZ0SEWst0VjvBD97xLC0TzD2wcaE+EgBKBilC7
         kUFItrftAS12Q6lT2OCDZAFXveDe8+P85iQ+f5n7MvT2k1r/ipjRQocV4fxDwZVo9E1x
         GS2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743703952; x=1744308752;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Cylaq/MJ4Q4v84obWEALM9f5r/Eyjhy9D/KWsJ7EmiM=;
        b=u5lhe9w0gXxHaVDbyb6h8L11XzMIxYoc+LRWIJaxcraVzcY1ryt0q95/R/WWA766AJ
         j3FDaRpzGkZrI9hNnmzKAIuC/xArAk5ZbtG52Q0rOjmojEiTDT1ZQeyCDuIsR6S8JD2U
         Gt0p/4wOfpU/WjopP+kmjCmff8YH0f2oCn1iceP3GkzPA2U/aBRXfD+IUp6kJu03L+ZQ
         1QL6R0AFaanToLqBs2ibOUej7bDD9nYIoPfHA6zPdbZ0/oDdVQo9LOZBvEWRJahE4nBz
         0lP4SyDyGUKM71QLXHcAVq/mfmJhRTFNsKEmYpzKBmrOtlYrTMJX2zrvNQcPkn+RxlCg
         oFLA==
X-Forwarded-Encrypted: i=1; AJvYcCW5C+PmwlFWc3gSu0JXgzk9zU5d4Uf7p8lm8a4XUeo5PB//jhTtxqH9PSxt4Cym8zMe70FpMXgbc2x2vnQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywx9Q6PQpSdJIu+h8I7W/VvljAKl4xK0xhuXoq7CZ/K7hSoEfvj
	tHHg1oZK9DM5f6eAEOsdGM9LOYv1M8PSuVyTYhryHqhoYxieHwgq+pOlQxD5w+tGAx8rYtQ=
X-Gm-Gg: ASbGncv2vWwmDz9KkuZM73V0z16lRETUT3l04TNbHFsWZrJgJNvSKdAws9X6FR7WJkL
	d3PyKj/ulg3zThpAfB3oQrlGjeGYAqUlPcVvHhS6D5KWcFQbko6ITr1RG/jGiKnEst1mxCTOMd9
	A6BMgdFQDzr+c1LDjY+F6wz/FBW219xl4LFVI7vNpXGj+zbY00Gva9+OShVhAoxmmq49Ndn/+vz
	hfzEWK0+wHYhUv7tthj1Tr19vvWIuGHYYQqnAYTWd3s/NHKcAROIdme4G1w2ZXaPAPQg9gHzniS
	0JR7gTO+UDfnIFjOcIZIXzfFoEP3osJYw9KJFdhXyPV05K2b0hBd8YgjwcgZ3I97Hw==
X-Google-Smtp-Source: AGHT+IHyXAUeqGJBGFg7iPU2HIIZy892949Sn08g2mxKXvCfsycA+m0o+Md+hRj6Zysr32oFr5cyPQ==
X-Received: by 2002:a05:6000:184d:b0:390:f358:85db with SMTP id ffacd0b85a97d-39cba93531emr209714f8f.30.1743703951905;
        Thu, 03 Apr 2025 11:12:31 -0700 (PDT)
Received: from localhost.localdomain ([87.106.214.162])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39c3020d975sm2438079f8f.75.2025.04.03.11.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Apr 2025 11:12:31 -0700 (PDT)
From: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
To: geert@linux-m68k.org
Cc: linux-m68k@lists.linux-m68k.org,
	linux-kernel@vger.kernel.org,
	Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
Subject: [PATCH v2] m68k/kernel: replace strncpy() with strscpy()
Date: Thu,  3 Apr 2025 21:41:59 +0330
Message-ID: <20250403181200.34418-1-m.mahdianbaraki@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Swapped out strncpy() for strscpy() in parse_uboot_commandline() while
copying to commandp. strscpy() makes sure the string is properly null-
terminated and gives a more useful return value so it's just a safer 
choice overall.

Link: https://github.com/KSPP/linux/issues/90
Signed-off-by: Mohammad Mahdi Anbaraki <m.mahdianbaraki@gmail.com>
---
Changes in v2:
- s/m64/m68

 arch/m68k/kernel/uboot.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/m68k/kernel/uboot.c b/arch/m68k/kernel/uboot.c
index 5e52ea150..fa7c279ea 100644
--- a/arch/m68k/kernel/uboot.c
+++ b/arch/m68k/kernel/uboot.c
@@ -73,7 +73,7 @@ static void __init parse_uboot_commandline(char *commandp, int size)
 	uboot_cmd_end = sp[5];
 
 	if (uboot_cmd_start && uboot_cmd_end)
-		strncpy(commandp, (const char *)uboot_cmd_start, size);
+		strscpy(commandp, (const char *)uboot_cmd_start, size);
 
 #if defined(CONFIG_BLK_DEV_INITRD)
 	uboot_initrd_start = sp[2];
-- 
2.43.0

