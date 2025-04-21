Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 734DF13C3F6
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 08:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745224778; cv=none; b=SgqH5P3dpq714+iFQnz6VfPnxtZTCRpeSP1zFYlMa6d9LDOzkBQGGn02+AyZGW0rC88Sf3iZI/WSZ0at/kuPPKR4XhtKUrXXmEUZB76c21QGzvAfy6uJo0uNi5p2TCgganPyxJ0SEUiGjPRm3LyUaC8qUP8ebcOopsIIV5lKOGg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745224778; c=relaxed/simple;
	bh=ucJiMgexT4WXicbI52lS/Bb6ScZP0blnJkAdptLF+oM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Qyr4BIMQL5JmGxOIZMnhjKX/aiKdr8jM0zi4o5938gtAGN+zFrDyqKgXnfF3NH5AQqVNG/totvAh6coizHtGP/tRIP9MwCDx25Gtd+Ch9CxkroarCYqM5YGvPF/6FRFWEaut9i7USXJEJpnc5if8wJUtS6alrDpUnYn5J+B30H0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BBhek+hy; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BBhek+hy"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-736ab1c43c4so3830005b3a.1
        for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 01:39:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745224776; x=1745829576; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wR88YUOvRyxB0EwI3OjxUwHvwrBAXLgY8edQ+eCFxiI=;
        b=BBhek+hyS/eD46+JOAlZA9xiJEh+MIBeeFotN41l3pRQNdCkWkq65rIQCRf2aU/3Uo
         +K/wRvQObTrVWAlPAnM4QvMAcut9mjZWNZxaB19C+NXoUsFKOEfCPmaazUvn7RtKOPvU
         hGicPC7nBthrQp/fQUmtkg/oJIv0yrZK+NnCQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745224776; x=1745829576;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wR88YUOvRyxB0EwI3OjxUwHvwrBAXLgY8edQ+eCFxiI=;
        b=cP73Uh6DVSsnDOSuPAjRIp7Kg82t5PsNVJpCrFyipnPCrVo0rXXQbjuVeJep1XKOoV
         a9M0CN/pIYBPVOVs0hNQjVlE6nIPf+QYZrsxrqhA3nhFyXXu3edk/sDn/R4n93HUH3R8
         X0666ET2zLq2dFKikmPmxvAOAWD5dwoZTSpriY2a6TLkbugWQuHTjfkxYXKk/TGuaTa9
         92pxFV2pcNjdn1bcOcLnni39+CRfCaVwvqk1pVqQWH1CHmRoMyTrAMIhA9Us4FJ8W7GL
         djqVP/B93uak3Fr6w/+E5+s8r3PqmXFQHlQRW9aaVJXZIKJ2zS0ZYiJyA7/SmjdZ89Cs
         9Tew==
X-Forwarded-Encrypted: i=1; AJvYcCVf/1z1wYDvgb32S+yXNU/FRK1drJU3QJ4fOWnE62L+gjyIhzwDaYhNVt0C0SeTyPnVBRjlI/mLB1ViDXg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0m+PsludtwRd/qewTj+/bQm3CWGeliX+dojQxQH4CpkMApvm2
	VxFf26+Y7UcH0i3hkmhKDgM09jcVC3yo0J01s1j34ni8Trj/A9ye/qfG7Fez1WZePw4KJSJcysI
	=
X-Gm-Gg: ASbGncsnCK5K0BAd3kv39xG03UCIpFGKQvloEoqFcdkCz8N7Ot80xhx2w/BUgJg0ikE
	ZDDXx8gECA5os8QWIteqdMlEEBvSFBJr1flwR3igM97F2l3dvwgtCt07v63SKZOmGUhpvKH2OoO
	Dua+3eUtGsUy5cKxnFI+/L3sobar5RzhRL0E/qD+LhTcZiPpjmVtn31TXQwMfiqiN5jI3bXt8+s
	887gl0GDju6uZoyNhinYI96hvUtMvzD29pmFdrID96zMnWIctGtaFNQDDy76hKJc741d7/paxbo
	GesMetat2xciOfPoCbd9JTB9N6pZoqMO27b1GsmV7J56cSQaW5N6muAcAfQ=
X-Google-Smtp-Source: AGHT+IGolMsV0u0T3aFzWf6YoYJGw1Ia9H/TFYa361qcURhToyHlLB4nnuCsVqXLrz2gtvhYkG1A1g==
X-Received: by 2002:a05:6a20:158c:b0:1f3:47d6:aa05 with SMTP id adf61e73a8af0-203cba7ccc3mr17256403637.0.1745224775723;
        Mon, 21 Apr 2025 01:39:35 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2401:fa00:1:10:7633:f42a:d31d:3f9c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73dbf8e42b5sm6277328b3a.57.2025.04.21.01.39.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Apr 2025 01:39:35 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] dma-coherent: Warn if OF reserved memory is beyond current coherent DMA mask
Date: Mon, 21 Apr 2025 16:39:29 +0800
Message-ID: <20250421083930.374173-1-wenst@chromium.org>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

When a reserved memory region described in the device tree is attached
to a device, it is expected that the device's limitations are correctly
included in that description.

However, if the device driver failed to implement DMA address masking
or addressing beyond the default 32 bits (on arm64), then bad things
could happen because the DMA address was truncated, such as playing
back audio with no actual audio coming out, or DMA overwriting random
blocks of kernel memory.

Check against the coherent DMA mask when the memory regions are attached
to the device. Give a warning when the memory region can not be covered
by the mask.

A warning instead of a hard error was chosen, because it is possible
that existing drivers could be working fine even if they forgot to
extend the coherent DMA mask.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
I talked about this on IRC on 2025-04-15 [1].

It seems that printing a warning was the most acceptable thing to do.

[1] https://libera.irclog.whitequark.org/armlinux/2025-04-15

 kernel/dma/coherent.c | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/kernel/dma/coherent.c b/kernel/dma/coherent.c
index 3b2bdca9f1d4..77c8d9487a9a 100644
--- a/kernel/dma/coherent.c
+++ b/kernel/dma/coherent.c
@@ -336,16 +336,22 @@ static phys_addr_t dma_reserved_default_memory_size __initdata;
 
 static int rmem_dma_device_init(struct reserved_mem *rmem, struct device *dev)
 {
-	if (!rmem->priv) {
-		struct dma_coherent_mem *mem;
+	struct dma_coherent_mem *mem = rmem->priv;
 
+	if (!mem) {
 		mem = dma_init_coherent_memory(rmem->base, rmem->base,
 					       rmem->size, true);
 		if (IS_ERR(mem))
 			return PTR_ERR(mem);
 		rmem->priv = mem;
 	}
-	dma_assign_coherent_memory(dev, rmem->priv);
+
+	/* Warn if the device potentially can't use the reserved memory */
+	if (mem->device_base + rmem->size - 1 >
+	    min_not_zero(dev->coherent_dma_mask, dev->bus_dma_limit))
+		dev_warn(dev, "reserved memory is beyond device's set DMA address range\n");
+
+	dma_assign_coherent_memory(dev, mem);
 	return 0;
 }
 
-- 
2.49.0.805.g082f7c87e0-goog

