Received: from mail-pf1-f201.google.com (mail-pf1-f201.google.com [209.85.210.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB860280CE5
	for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 17:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748365901; cv=none; b=nF8qDKuPKJcnACZS4eURMyXyEZAAY4CGqO4EpjSS4xEaJ8RfN0S7mFqLFqEVwJmuWX0bdwvT/kMX00BIzkEsMURGz3jSl/5du4bZkyd3cnIQkYvBSIUPqIdCvcFLhl8qQ7PVGkCkc7YUU4fZ4UbRWxIOdp4UdNDewrOH3Gxw9Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748365901; c=relaxed/simple;
	bh=awIVsMJIo6c6lxHwbHS1OrLq4nbMwYCl5k5skXygSzA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ILXbddNreEDZFcdc3b1l/tOarDPBcOJG4/MMPvlITPIvEztYvluEtTmqXv+LdfoVBzyTXSd4LDLVP+DeVCOxM7Fr0hS49CuReuVhO8F6l3aJE9kruQlJO1HeXCnD7jXm/4qRCQUiaNn8so8bLGHO42lVuf+tTd33vNGonA2E0Lw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OYT3hKmp; arc=none smtp.client-ip=209.85.210.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--ericflorin.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OYT3hKmp"
Received: by mail-pf1-f201.google.com with SMTP id d2e1a72fcca58-742c03c0272so4506489b3a.1
        for <linux-kernel@vger.kernel.org>; Tue, 27 May 2025 10:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1748365899; x=1748970699; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ErNNtp8tIhLsvXDOPpiWELLdI0K19IbrODKRiF2bcdE=;
        b=OYT3hKmpQFT1uRirWslkF9GEbm48sP1ufcXi6fQAhw7xEiuqIGILhA+qhw8cFdCgeC
         iuvbIoDNolexyx6UbNt8A4+bsgxnTmR+RRjOLzj5+Vdewc8sz/88VvCrdMBcYgk1p/AV
         gs8MHTIREsJ+fUoXP4XNo16NuN+t0RQXpBaxVT2lj6BsBH7VhSKsZ89N7V0UVuqvA3fm
         Nhy/A7GdREG+i27KotwVdr3aj9Vs2TKhvh/6XweRqE7QdITsMysn8h/nCI7Td6lCKN8d
         TtaYNJ4IwoJuuk1rS3O19q2VKBNLYJBdD2HTLBZd8ZRjfoyT0sv8EKP5MrAMcNPr9Jij
         zRUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748365899; x=1748970699;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ErNNtp8tIhLsvXDOPpiWELLdI0K19IbrODKRiF2bcdE=;
        b=cjXzPVe9yM8jiZkl19G/hVAWsWyryxz0XmEfMdn07KaF01pR0YRL+BPl1hrnDSn0G9
         dDr9InsUiFpnvwf4/EfkOAOZCbzjL41lwX1UhTpk2Z4U79gAyCLYpOWuINc6dJiV62gj
         JU9Zx+DVskTc4Oidd61EYY3/tcnjGxQEdTQPgMcKF6lON7l6nyBWut1ECzJ/K9q7GWDw
         X8cUjfCwqB7SSxZlRb3mfEQKfOiH6hJaAntdzEmsEJhVaOM9AwadQd8m8QISbBstgpmZ
         YQ0iPBKTlmVQAhV4IyMjfeL1trTnNri8kqawDEJWNG8Ew1SptkmeU/oWIeqBht0+wN8H
         wGZg==
X-Forwarded-Encrypted: i=1; AJvYcCVwZdTbm8f/I60i2rliXLl8JF9OBpSraWg2HTBRmrcxbz4tFqt+UEzMi7qneGWWJHOePbGv1TRUuGxHzaE=@vger.kernel.org
X-Gm-Message-State: AOJu0YwySQ4SGN9QC1Md+MbTT7yqcNV3w7FgBGXpwFrQ2UAPX6iv5qRc
	Sas1uD3h8EK7igeXV8M3tj/qb3Ya06ziF1v16WElJ1nPtnSw3AoUVNRO37/1+rixm4xwPE37n9C
	SOIGct22f6N3Ym5xRMfawWA==
X-Google-Smtp-Source: AGHT+IGxxnavX2uarCvCpcN0vhOLeB1NeqH4YORXOSXY3TONJqbGtIy/9hCvgy9XqCYcmWLwyURiyZ3IyPKV3G2i
X-Received: from pfwp49.prod.google.com ([2002:a05:6a00:26f1:b0:746:25af:51c4])
 (user=ericflorin job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6a00:3a1e:b0:736:43d6:f008 with SMTP id d2e1a72fcca58-745fdf77ab7mr21271166b3a.12.1748365899010;
 Tue, 27 May 2025 10:11:39 -0700 (PDT)
Date: Tue, 27 May 2025 10:11:27 -0700
In-Reply-To: <cover.1748365488.git.ericflorin@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <cover.1748365488.git.ericflorin@google.com>
X-Mailer: git-send-email 2.49.0.1164.gab81da1b16-goog
Message-ID: <5f9c28d0dc0f48151837f11d5f6e7b82f84978ef.1748365488.git.ericflorin@google.com>
Subject: [PATCH 5/6] staging: sm750fb: rename `Bpp` parameter
From: Eric Florin <ericflorin@google.com>
To: teddy.wang@siliconmotion.com
Cc: sudipm.mukherjee@gmail.com, gregkh@linuxfoundation.org, 
	linux-fbdev@vger.kernel.org, linux-staging@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Eric Florin <ericflorin@google.com>
Content-Type: text/plain; charset="UTF-8"

Rename `Bpp` to `bpp` in `sm750_hw_copyarea` to conform with kernel
style guidelines.

Signed-off-by: Eric Florin <ericflorin@google.com>
---
 drivers/staging/sm750fb/sm750_accel.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/staging/sm750fb/sm750_accel.c b/drivers/staging/sm750fb/sm750_accel.c
index ea64e10d4814..a34d8f6a033d 100644
--- a/drivers/staging/sm750fb/sm750_accel.c
+++ b/drivers/staging/sm750fb/sm750_accel.c
@@ -138,7 +138,7 @@ int sm750_hw_fillrect(struct lynx_accel *accel,
  * @sy: Starting y coordinate of source surface
  * @d_base: Address of destination: offset in frame buffer
  * @d_pitch: Pitch value of destination surface in BYTE
- * @Bpp: Color depth of destination surface
+ * @bpp: Color depth of destination surface
  * @dx: Starting x coordinate of destination surface
  * @dy: Starting y coordinate of destination surface
  * @width: width of rectangle in pixel value
@@ -149,7 +149,7 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 		      unsigned int s_base, unsigned int s_pitch,
 		      unsigned int sx, unsigned int sy,
 		      unsigned int d_base, unsigned int d_pitch,
-		      unsigned int Bpp, unsigned int dx, unsigned int dy,
+		      unsigned int bpp, unsigned int dx, unsigned int dy,
 		      unsigned int width, unsigned int height,
 		      unsigned int rop2)
 {
@@ -249,9 +249,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * pixel values. Need Byte to pixel conversion.
 	 */
 	write_dpr(accel, DE_PITCH,
-		  ((d_pitch / Bpp << DE_PITCH_DESTINATION_SHIFT) &
+		  ((d_pitch / bpp << DE_PITCH_DESTINATION_SHIFT) &
 		   DE_PITCH_DESTINATION_MASK) |
-		  (s_pitch / Bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
+		  (s_pitch / bpp & DE_PITCH_SOURCE_MASK)); /* dpr10 */
 
 	/*
 	 * Screen Window width in Pixels.
@@ -259,9 +259,9 @@ int sm750_hw_copyarea(struct lynx_accel *accel,
 	 * for a given point.
 	 */
 	write_dpr(accel, DE_WINDOW_WIDTH,
-		  ((d_pitch / Bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
+		  ((d_pitch / bpp << DE_WINDOW_WIDTH_DST_SHIFT) &
 		   DE_WINDOW_WIDTH_DST_MASK) |
-		  (s_pitch / Bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
+		  (s_pitch / bpp & DE_WINDOW_WIDTH_SRC_MASK)); /* dpr3c */
 
 	if (accel->de_wait() != 0)
 		return -1;
-- 
2.49.0.1151.ga128411c76-goog

