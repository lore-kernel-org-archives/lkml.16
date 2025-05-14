Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0F0927A451;
	Wed, 14 May 2025 13:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747230084; cv=none; b=jf1ASiMUO8mqcNjGfStnPWBJVnsis6DhEgdebI8Df+Yj71DRD0+3J6/lmaqaxBRoUAkFWSlXNUdJvmDc1UfQF1GqtAmibFJfpAlTeHFasSw2Zusr6PSFvRZHRaIKWHwpsEP2pbTmf/3wHNelBTG2nJZYlQA2x1mjzsc3p5F05jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747230084; c=relaxed/simple;
	bh=H/N51E0LqMl7HeehbCHJuuOwqwUbhjnbjpt/f0tR828=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=D48H/IipBQ6xyWoflMfzpgsVO+fiTVG5q+pnU2D2KxKBMeXXE3D7Ef0jIyfdLsLpbUcrCgQNdPAhTknAQrzbUhlLHKQkNe3m+131goaysM0tATGFEwhnb5CvvSVQB8OzXtvZ7AbsScG3opmIJpNcLcNRiJ7dLqc7CZhhkm+upfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Etg9//1p; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Etg9//1p"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7423df563d6so5484246b3a.0;
        Wed, 14 May 2025 06:41:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747230082; x=1747834882; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=rivdPuEvC6CEZBUy2Q25Rs7NDnkf11vHyvHzOhnGBpU=;
        b=Etg9//1px8J5vEjRjbUpQ8SiiHsaeiXpvu50gTLsgtkig7FpcH92yOAA6taWISMO8A
         8S2Ygyr0yFTopMz44RolI7cl8Q/IvZwLB0TlM/fwNsGAB+EgBlNqWyL+jJulxilVzwmH
         vigmnpqsH18Y1iftgL21aWJsEvBPz2wNVmt0fZH0ubtR9HqILD7T4le209UpeyOWbHZI
         ahF6UdWMSF1JY+oHTTA0JxwvbBRvhJ4bdO/6QVEd/nvYSnQgnnxBl+Nixi7Fo2dsciHr
         Tj/XRwrgI/Ng8SvJHpvyYKM2YYZYkt+Cbmld4iZLlC8sfacBpdwN4I1QgYztoWUz/kP/
         08rA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747230082; x=1747834882;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rivdPuEvC6CEZBUy2Q25Rs7NDnkf11vHyvHzOhnGBpU=;
        b=SZomALA4Sl6tXx6WQuOKgK68tYRy2VJqxbUKl80YLBqVPG/hYmU/0r2am6DaMunRos
         wvhxBw3ZLJlUJGyMMoXd12bNULh1Unfz8Ze3l2I3rhrqQyn/tLibgAbgnrh0ywdxT+bS
         LBAXcnCslBdXF0Xslsn6TH7wKQ8OjDmxYaDXF2eEjKHijz1CmjRRsI5nrJCjR+ihvB/1
         Q1o7vA/oaPhRhp3e3uTt1pbnb1wjTbMReiwlmrwFf7tt6X6OHGSJU6xVMp0K/dI7XmtN
         on7qr1vviVyquzW3XKTwQKHtlu6OEOQWUvgFeV2s2ZcRRBNvMfJrLJz1lbaxOdrJxZJM
         shUQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdGsnbfKnL38EyHbqelNtu8oOEvJICubyfnZzZjmduibmYeC/7N3E1xLMN7UeF3EdyXr9c25HSWxkcYeo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3+znSOPK8Pvgsm+dhToYPlywUeU+EQUjF1N5qiTIkALfQA1Vw
	ttFkYNX28IS0phi+r1jV4/rJoj4HnqyhTeSYXC10WhXvHwc0iYMp
X-Gm-Gg: ASbGncs3YhP+SwptVI9Xq0AdXpVM8Otc46jtiFOsnZqhwjRHF5tSgKAE3DszeZfzmG2
	MpuO/EZwziD2FEkXEqo6tgTrwjxgSXp+3KkSHNmywkANyPvmAK6Nw7rZGxAzkWEQvXCw4a1rabz
	sS8T5GKDQP1I+U0lftsCOEgnSATEIbHKzX56UBpGYqdDSJbqF9FPv3JABJkU1vvxriDAXeP5D2f
	HIe9hCENzNVwbARojEn7zRZYoM/p2HMclTcuv10ULKP9aT868NFxewaxkGetnb2EPiVP0WQ4k7a
	YIs8Wn+dLhTvmcf/rh7xqByb/hUqn1o1VXXbiS0eT8uVsfZQ81v93eM0YJG2gX9Q33/gOqf4kIW
	jF2baWA9MhXcSwEHI/15QF/MtELElIg/wtBAuce4/eT7I
X-Google-Smtp-Source: AGHT+IG7v5XjeboOI0O4h15ehtIlHLg82qIQw27/8YEWo2PzF+Jzb+j/iJWgUCU2QE1pyY8DnHYUKA==
X-Received: by 2002:a05:6a21:b94:b0:215:eca3:c146 with SMTP id adf61e73a8af0-215ff1910fbmr5898909637.29.1747230081951;
        Wed, 14 May 2025 06:41:21 -0700 (PDT)
Received: from localhost.localdomain (123-194-189-72.dynamic.kbronet.com.tw. [123.194.189.72])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74237a0cde3sm9784501b3a.94.2025.05.14.06.41.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 14 May 2025 06:41:21 -0700 (PDT)
From: "jay.chen" <shawn2000100@gmail.com>
To: mathias.nyman@intel.com,
	gregkh@linuxfoundation.org
Cc: linux-usb@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"jay.chen" <shawn2000100@gmail.com>
Subject: [PATCH] usb: xhci: Set avg_trb_len = 8 for EP0 during Address Device Command
Date: Wed, 14 May 2025 21:40:08 +0800
Message-ID: <20250514134011.16285-1-shawn2000100@gmail.com>
X-Mailer: git-send-email 2.43.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

According to the xHCI 1.2 spec (Section 6.2.3, p.454), the Average
TRB Length (avg_trb_len) for control endpoints should be set to 8.

Currently, during the Address Device Command, EP0's avg_trb_len remains 0,
which may cause some xHCI hardware to reject the Input Context, resulting
in device enumeration failures. In extreme cases, using a zero avg_trb_len
in calculations may lead to division-by-zero errors and unexpected system
crashes.

This patch sets avg_trb_len to 8 for EP0 in
xhci_setup_addressable_virt_dev(), ensuring compliance with the spec
and improving compatibility across various host controller implementations.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220033
Signed-off-by: jay.chen <shawn2000100@gmail.com>
---
 drivers/usb/host/xhci-mem.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/host/xhci-mem.c b/drivers/usb/host/xhci-mem.c
index d698095fc88d..fed9e9d1990c 100644
--- a/drivers/usb/host/xhci-mem.c
+++ b/drivers/usb/host/xhci-mem.c
@@ -1166,6 +1166,8 @@ int xhci_setup_addressable_virt_dev(struct xhci_hcd *xhci, struct usb_device *ud
 	ep0_ctx->deq = cpu_to_le64(dev->eps[0].ring->first_seg->dma |
 				   dev->eps[0].ring->cycle_state);
 
+	ep0_ctx->tx_info |= cpu_to_le32(EP_AVG_TRB_LENGTH(8));
+
 	trace_xhci_setup_addressable_virt_device(dev);
 
 	/* Steps 7 and 8 were done in xhci_alloc_virt_device() */
-- 
2.43.5

