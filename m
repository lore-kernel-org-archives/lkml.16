Received: from mail-pf1-f202.google.com (mail-pf1-f202.google.com [209.85.210.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C90B5274FF4
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:11:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365898; cv=none; b=VcKM/uaq0g7N7uib06KnLnJnz78tJLWhqGTTs2TjnqkLwx0kl7QkWlyHIySs3IPDvwStQw6lJMvLLZcUjdUSUXHtXV2MvFy16+aSzXmVKMZbQVo4KKf9k6Exe9pCrYrC6eUhtUvlD09Idn/SD6nh0WhgSn/7MgbP862INdFwPCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365898; c=relaxed/simple;
	bh=IxmY7857XxRCML+mmmkccQP5aewturlw2/qLm8OGYQY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=S2i0hAEfsc7JppUA3DJiioe4IyzqltRBCXlJHZfWA2AyNBH08bk88L6qftc0ThivitGqi2C8zKbfdOd6ju7CVaQud363i3nKcN3KX0VJgg418nHyP8mccRAoYwnX1HA6M3czG9dUk/65oGEdblzTW0X0g7WadeZ6x+Xrwy3ucH0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Yak367z1; arc=none smtp.client-ip=209.85.210.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Yak367z1"
Received: by mail-pf1-f202.google.com with SMTP id d2e1a72fcca58-7370e73f690so4320909b3a.3
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:11:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365896; x=1748970696; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=pdqg5XvDH208k/LZjDauOKrmgmkkgqZoXO6mZxQvsJE=;
        b=Yak367z1GuVZWG7nbaxCiCD0qTPfnqYCD1orYfLKwfpDl+k0u3MQ8QvvW8cC+DV/aN
         bKErgaqE+CxCNCrfXa+cUzleu50NVGiwE80/V3bv4UD000lLr0e+3QVL3QtetrKMHY92
         kIsmm9J8xw5oNeS8CuysnC3U8BlF7IGszMXL40OAPZ9nFCx1BC8HgOJ9DtBOYL4yewaP
         iK5EItxGeXZsWmy7YEDIvjNjiKPA/O3roMD90CswGZTNPDNaDVn5RK2V2ca1AyvAuXRw
         NhhtcADc9uq1d1/RtrpfGGYDfAV8yVeWAugoVWSH6cAbdFXpUH5pZvqrzdaJjY24fVVz
         gYLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365896; x=1748970696;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pdqg5XvDH208k/LZjDauOKrmgmkkgqZoXO6mZxQvsJE=;
        b=hWUP+xl2TBNKM2YVBh+kZd2vVyNYhYwD2mWNTJqgaY6/4ZrYYXknEEZdkW1ouj9mcu
         1uCmEuqsgPLTR9klOroQ+7Q4+Q5K2SUcikpLaPujWHiFY4ukTya9GjxioWJbSJ+IjpwR
         WFMgmqDY79rwEFibHej91DQXFdXfAicfFm3otHjBgUkbfzKcG4WM5bYtDq8Fo9R2fisp
         IGJj9+ZBihDyo5pGe4Rg7cc5gDy+yl1f8gWOJ0+pEO4r89LJoo2XOouyM36OQ43FNz5l
         ibNistAG/VhslqFQ7DJerOM5xXswWCb/aYdfDLL3qvyJRBfwivyuqRr43DXT/RNtWx9m
         eJkw==
X-Forwarded-Encrypted: i=1; AJvYcCWZkZJsobzTUjDtAO+Fo4lmADzvFaWBdkMpizBJMuR5tWHOiLzytOucIVHVr/pxERrjtDGZZDE5deh9D+8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxcgA3nc8/jsPaKxKN42W/QxgY3z9VMCZURJ2xFhWewYzYevCfG
	iQDoUN0ZP/tomXE6EnTJowrqBUy6rPj/4XGKhD4l0XlKXMDxT6CUJ4R6MMQ4ofwomk+eFiUUYJC
	m20ty+pul5aiSNiNU820bXQ==
X-Google-Smtp-Source: AGHT+IH5+jOjV6AZnNuwMZ9fasseQwb0SSCynSsK1tPRGYJuml66W1Zl/d64TGz0CjCDJYTLB9X2dGkAoxI8hH/Q
X-Received: from pfbim3.prod.google.com ([2002:a05:6a00:8d83:b0:746:3185:144e])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:1149:b0:73d:b1ff:c758 with SMTP id d2e1a72fcca58-745fe0515b7mr22869683b3a.18.1748365895953;
 Tue, 27 May 2025 10:11:35 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:25 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <b46e54ed9006f7a5b4439b8d4bb1fc36bd9c3ca0.1748365488.git.ericflorin@google.com>
Subject: [PATCH 3/6] staging: sm750fb: rename `dBase` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `dBase` to `d_base` in `sm750_hw_copyarea` to conform with kernel
style guidelines as reported by checkpatch.pl

CHECK: Avoid CamelCase: <dBase>

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index 029f5c013d91..e5f1f021768b 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -136,7 +136,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @s_pitch: Pitch value of source surface in BYTE
  * @sx: Starting x coordinate of source surface
  * @sy: Starting y coordinate of source surface
- * @dBase: Address of destination: offset in frame buffer
+ * @d_base: Address of destination: offset in frame buffer
  * @dPitch: Pitch value of destination surface in BYTE
  * @Bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
@@ -148,7 +148,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
 int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
-		      unsigned int dBase, unsigned int dPitch,
+		      unsigned int d_base, unsigned int dPitch,
 		      unsigned int Bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
@@ -160,7 +160,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	de_ctrl = 0;
 
 	/* If source and destination are the same surface, need to check for overlay cases */
-	if (s_base == dBase && s_pitch == dPitch) {
+	if (s_base == d_base && s_pitch == dPitch) {
 		/* Determine direction of operation */
 		if (sy < dy) {
 			/*  +----------+
@@ -241,7 +241,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * It is an address offset (128 bit aligned)
 	 * from the beginning of frame buffer.
 	 */
-	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, dBase); /* dpr44 */
+	write_dpr(accel, DE_WINDOW_DESTINATION_BASE, d_base); /* dpr44 */
 
 	/*
 	 * Program pitch (distance between the 1st points of two adjacent lines).
-- 
2.49.0.1151.ga128411c76-goog

