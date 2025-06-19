Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEC4B220689
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:08:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331314; cv=none; b=X8MzJbLb7Bc6Hpsf0V4epga0S0v7It39+v8BNb+mCA4JiXXDLu0itG4HTlBmcIX7y+kfVmvcRslBqzKfeUva6dim+s1PZ6FPb/rA0N1dAIx1vb7JAq2copKhgMZ7fXRQw2wYqRJlJ46A8wHuBqm2aFSpyQzOR46c9osLBCjr6Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331314; c=relaxed/simple;
	bh=sG/D2wcKMdw3nKMkdSRoFyZ/oTK8rB9+ZurLv082JOs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=M5bGy9OfXEhyDZ3khwLF8ZfclZKYMpq9QW5P26iVTZrG/IQ1qAthrZI2Dyvp+vyDcCX5jIIrnc2bd3sA5WVLDEn0ZKwS5ndfUNmApX9oBn+8OFtlvO1nmKB20+yUFHNQKdNJhdSdjcN6s330OONG/GzJts1pMKN8BGLvRrzRglg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OGKJiIqI; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OGKJiIqI"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-453442d3a15so302565e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:08:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750331311; x=1750936111; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=2sptUv90Fu1RCOT+t0bqupqhRJHg17pYUxs/MMMHORw=;
        b=OGKJiIqI7TbFeVUCtOqbkUif2oIcbQbcbMIIKFJow36ZlTGdLl3isnFakxqMwLakcU
         RGP7EBGf3isHumYD3vxLTjFmoQcQADdkhHIDfZqJulEACgV8guzJ+3oNBi/ksaZWbXMv
         C+CrD0TpdAYEpupWsNQKreZXt035pjr3VYfWZyGRYyfWN1XGdAkIm8CcrLX1PuIl2Enp
         nX/HTE9TCTJwM8TucN3HvveXeEnoYvqLrz32djxpvq34Lws6a3yuXNy/8lQhfAfcZFBW
         tvRzjHCBQYCoD1VXZjRMaYMjWPAGfww4eSQPSZPFKveLB5J0UpPr0tEie11h9VpCZkUR
         BhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331311; x=1750936111;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2sptUv90Fu1RCOT+t0bqupqhRJHg17pYUxs/MMMHORw=;
        b=BP4hrWHhjxEebt1Rt+2D2h3Hp8BLFUU5aM6PafTj7wIiRfOzothAWNX3LUKAyDSsh/
         OuUT4LWA6lDNSUYZFRoOBpGW5xwQQAu9TqEN3+oThqTNETszUSwfiJJou1uMoAUWpgor
         D9SdUj89+IFyVv+bNoueqvITYEtP+aWJG3e39IM71jrP0vYjUgx150YScE/jyyix9TwG
         Oyrlz/8njvdjmkUIN1lhCR41n6/irHcc/KeJWOC2+t1QaW2zBQXnnUm7GlvCErbBypUH
         VXHe9jPAbydxa9h+rjVOuCh8+o3XI7WPnlV0D3Xzk2fvBrg3mb+VX3fPW60NGY2SPfyo
         tfTw==
X-Forwarded-Encrypted: i=1; AJvYcCVnURpPhIuHVtErDyylAN76hXzYlKpCi75pgfGJ7wN3ILIZj+26i438rK701CeGhp1wQkSa79lZuGny24A=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd05gmrr+N3Waj2eSuMhMqQ3DlDodkszLLZLex9GOpV51w+7dA
	ENfzUWIgfpC5NON+gGybXnE0YjxvENUraj7wFlGFEUPxPhJ0yzzzBNGt
X-Gm-Gg: ASbGnctw6IoXwX14h/dQw2/LAF3dOtOpFfpYd4kTosrIsbJEapd0XlO5pEf1oP8fRvO
	TEOSz+HmgMMaZONOzOzlk4xFwD3oSPVLhcS1ejrC0u/cmxInpi/CzZAI46/IDgT/7KoZYtcmTTM
	iJMubaEbIf/siJsFvAtjjSTI0n7rcVSjx1wa+gHqaS+oCC2iv1dc789GIPbJVRe9ACksLMRTJbK
	Lw7pNa4C+DqSwWwoK1nw9QtlUrCMctBZL82mIbblAsw7tp87hU42k8tHlU5z/phrzyuZ+kx2igD
	a1eHmewIDLgwdTRmLi6drF0bryte9V1xI7NPjZ43MskLf9Um+TT/bs9cUXbfcvUXUKHmhwJJPHI
	v9lpa1ZXJ6oZzDzZg+Wk6EKdNzdBsb+9+MbgfmNrITY7RLxGToaQwyW45Btk9J9YT5zwzwJLS1A
	4=
X-Google-Smtp-Source: AGHT+IFa3VBVxPg1Sr4kO5htGYyd7iXmGzGqvNCGVsKWJR4wOuN+nsTIJI3I7p+624zgqmo0+17lYA==
X-Received: by 2002:a05:600c:1c19:b0:439:9a40:aa1a with SMTP id 5b1f17b1804b1-45352413330mr40213085e9.6.1750331310811;
        Thu, 19 Jun 2025 04:08:30 -0700 (PDT)
Received: from thomas-precision3591.home (2a01cb00014ec3008c7e3874bfd786a1.ipv6.abo.wanadoo.fr. [2a01:cb00:14e:c300:8c7e:3874:bfd7:86a1])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4535ead2a1bsm25528605e9.33.2025.06.19.04.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:08:30 -0700 (PDT)
From: Thomas Fourier <fourier.thomas@gmail.com>
To: 
Cc: Thomas Fourier <fourier.thomas@gmail.com>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <christophe.leroy@csgroup.eu>,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] powerpc: floppy: Add missing checks after DMA map
Date: Thu, 19 Jun 2025 13:07:33 +0200
Message-ID: <20250619110739.323202-2-fourier.thomas@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The DMA map functions can fail and should be tested for errors.

Signed-off-by: Thomas Fourier <fourier.thomas@gmail.com>
---
 arch/powerpc/include/asm/floppy.h | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/arch/powerpc/include/asm/floppy.h b/arch/powerpc/include/asm/floppy.h
index f8ce178b43b7..df8ce2ae636d 100644
--- a/arch/powerpc/include/asm/floppy.h
+++ b/arch/powerpc/include/asm/floppy.h
@@ -144,9 +144,14 @@ static int hard_dma_setup(char *addr, unsigned long size, int mode, int io)
 		bus_addr = 0;
 	}
 
-	if (!bus_addr)	/* need to map it */
+	if (!bus_addr) {	/* need to map it */
 		bus_addr = dma_map_single(&isa_bridge_pcidev->dev, addr, size,
 					  dir);
+		if (dma_mapping_error(&isa_bridge_pcidev->dev, bus_addr)) {
+			bus_addr = 0;
+			return -ENOMEM;
+		}
+	}
 
 	/* remember this one as prev */
 	prev_addr = addr;
-- 
2.43.0

