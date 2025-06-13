Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929DB1953BB
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 13:44:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749822300; cv=none; b=dIpNIxE/Ws26jNziTCO2oODtNlNTU8RTJ7xBb3by7CziqsiMMTCAJrszKWTab8XbJHFmeD22eVqGoroa1saj/xf226DBuEvAfvbHmn91qScrR14+lGzbxr6AVQwYa9Bf40dSSU2iYHp6X79fANnSKtqJ3d5etB6EGb0+kcTXYvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749822300; c=relaxed/simple;
	bh=q0NfNcDeaw2dkT7ssIvsVhJpYdlm29fY3PiCs47ExhY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tm1wM3pnOmm6qHXhOVBuUHKARAA3qwrykzfiqMnSV6YpilZ8fzI7qLCqKlSGeDqOwMD0BqC2lZ1a0DOU5hu6/wZgcnCh/H95RIdhcCY8cHl43+pTK+t68wJjjDEAl76aX2HPNcvjjnDdHhMaTPcXo40EiG12sSiVGBE0TjvGbRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MJ+xzy3v; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MJ+xzy3v"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235ea292956so20442275ad.1
        for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 06:44:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749822298; x=1750427098; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/NDaCbVF56xnPNvNjsdyRE5TUgx3SSgRAAlgm9SJ4O4=;
        b=MJ+xzy3vkAbj/+wOAVpPQ3Xq69Ny1cxETk/sNcAtek5rFz//HPJnHDO9ceEOCdEnC0
         P9p01XFAeUgWwr9lxMy/ZX8Le0VBO49SrRSNw2CQCuXkcX7IaxhL7ldsSrx2TGkCemEf
         IcFZvb5gnv7pzAGCgr+GPZfD39plZogayD7DXbryJKuBFT8yUnXerWDu+IfAjBTxW/Bq
         RxfzFCypHBe2fFQsDgodJUvRylsWkghCCfE+fht+D/ouqWWDhBXC7r/yiRwICC5vr4CJ
         C7uCEb0RyK2FUkgjt4Iwv8B9GAns/WTHdoTRf25Kb3IMMMQcAgqMp5y/3MlKTCEpG9SC
         f0tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749822298; x=1750427098;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/NDaCbVF56xnPNvNjsdyRE5TUgx3SSgRAAlgm9SJ4O4=;
        b=PVXCYPJ2E3kZrLXUsQFh+vjqky2CPL9xH87hi2WnkwAD5bFpHlsF07xplcw4vDAb8z
         o1wiK8OtFB8KjzSdP2qmNeEVrp4inUq0DVvs0GHV6G8+safq554K53Sk9Km+W9TdPXIe
         hbsMiediNh6/T9VZEmTD5M6a+oXyfTSqsc6Ca3W13uCGskYhzkj66FfiggwpBf9kLs7I
         gNslZIYXI0ilGXik9PHv6JitWMVE6+Dvm0vH2HLTIKP6S3TfvllYYcfQC2shCf/CtBcF
         aFmMnr7UEd46MR9PdxR8t6w1FjMGaFuZdXC7F15UnlcNifr/29gJJwuny/heelEGFTdI
         ytWA==
X-Gm-Message-State: AOJu0YyQh5fyLoN3WOKMqMHuBoH+3R+B6j6EciDlco61tZ9czmOCMsBF
	suHVY52VF3Qwujw99bODbZZEpXZaajCQ0/Mf6aAlsnvVE+VgcLN9gW0aNZT2xLZn
X-Gm-Gg: ASbGnctiiN8fubpJ9HYoGa5uF9tuKTy9H61+yK7NuG4vIauosYZk/e6/GXwcIZ1OnXU
	2zZ4VIa8nsOoW95I2dKZmyApqDDRGsQywnuLGfRUewXn6Kruh9yDsfdIEnDqLJcK905PsTEX5LM
	V4rE6+v1L/ygYMzYfVMUcM5FHWBXqRuH6gqP2W5qFffUrMjUEDUIMxXRKYQx80ZRmELGJLFlBOs
	Ts4efAdZuW/tI/LFiObztGPb0WoVxA1IzziKfV4eLaEiq8Q8EkGQZpMe3xazptutzLa2OK4YmQf
	DVtKSQkcTbC+zoRfJ8lXbL804Kw2jNi1nAwsO88pSmvuRYH6hPnRTaEo5hodjwjlQS81SM53cnu
	n2Xjqn8k=
X-Google-Smtp-Source: AGHT+IFOIz/HmbvARBQzrFmiPDNxw41TO9on4zitwpOQf33DCfHwlEI/HyXVAe5aSUG/GmDc9R/NLg==
X-Received: by 2002:a17:902:eccb:b0:234:eadc:c0b4 with SMTP id d9443c01a7336-2365dd3d482mr51958985ad.44.1749822298318;
        Fri, 13 Jun 2025 06:44:58 -0700 (PDT)
Received: from manjaro.domain.name ([2401:4900:1c30:6c31:49d8:cd52:9d21:df60])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365deca368sm14017475ad.201.2025.06.13.06.44.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jun 2025 06:44:57 -0700 (PDT)
From: Pranav Tyagi <pranav.tyagi03@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: gregkh@linuxfoundation.org,
	chentao@kylinos.cn,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev,
	Pranav Tyagi <pranav.tyagi03@gmail.com>
Subject: [PATCH] firmware/memmap: use scnprintf() in show funcs
Date: Fri, 13 Jun 2025 19:14:49 +0530
Message-ID: <20250613134449.7459-1-pranav.tyagi03@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Replace all snprintf() instances with scnprintf(). snprintf() returns
the number of bytes that would have been written had there been enough
space. For sysfs attributes, snprintf() should not be used for the
show() method. Instead use scnprintf() which returns the number of bytes
actually written.

Signed-off-by: Pranav Tyagi <pranav.tyagi03@gmail.com>
---
 drivers/firmware/memmap.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/firmware/memmap.c b/drivers/firmware/memmap.c
index 55b9cfad8a04..fef18f598ff8 100644
--- a/drivers/firmware/memmap.c
+++ b/drivers/firmware/memmap.c
@@ -369,19 +369,19 @@ int __meminit firmware_map_remove(u64 start, u64 end, const char *type)
 
 static ssize_t start_show(struct firmware_map_entry *entry, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "0x%llx\n",
+	return scnprintf(buf, PAGE_SIZE, "0x%llx\n",
 		(unsigned long long)entry->start);
 }
 
 static ssize_t end_show(struct firmware_map_entry *entry, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "0x%llx\n",
+	return scnprintf(buf, PAGE_SIZE, "0x%llx\n",
 		(unsigned long long)entry->end);
 }
 
 static ssize_t type_show(struct firmware_map_entry *entry, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%s\n", entry->type);
+	return scnprintf(buf, PAGE_SIZE, "%s\n", entry->type);
 }
 
 static inline struct memmap_attribute *to_memmap_attr(struct attribute *attr)
-- 
2.49.0

