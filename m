Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F23194C61
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 18:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738865013; cv=none; b=sdB+tHa6tDnEe0vPiy1L9HZZFjWgv8livgm87AvcmnFxwrvL0duIikpj7LyudF5lBfz68RA0sge+R9lV3B4QVjKJkgh1TlT0KwK0yxfE5Bdmv0UVQKcT1fMEoB+tsuZMTf4LgLgJle9xdbmsvmpJ2VkKCKRcBMa1kR71bpKKLOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738865013; c=relaxed/simple;
	bh=o80nFA9ki1lj4fsMeet2lUWOP7Liqo/x1fkL1KJz1uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YIxCJSqiIdlh+r5WQ3Dc8Cl/j+CfLHXFsOPBPpHRWRNqRXHsy5X6VEEjm6LeKWtD0iDADKmyNTn12hljiY4pbTEfX/b5/OzxynABcbBWCf5RL0qMy6ek/i0vM052lFLdTCJmgGQlN8GahR+6tRfgZQmthLhvcN7qbKa51MQsnjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=q4KZnT0K; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="q4KZnT0K"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-43626213fffso14434765e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 06 Feb 2025 10:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1738865008; x=1739469808; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=q4KZnT0K5Z8EnYcSKscifjoSBOkN8eweME8P7EaYQJsdkcuxJ4mm0WeBpamyWrYDHg
         6gU3IRV3nSnzJBtOQixOu27Us2SwlDl7bybpj8/nlxvna4+tWFdmoummsufw/GpjphUL
         HjmSGnRPAvaobwBUOOV5/vCFzO2L/i0gb5Rh5yQh3IbM/1/4AlbjSrYBqXRQfc2sicv8
         w8Dd2lGLrA2yxCC2z9ppAlhP7GZ1RKCuYZBxzYorP6wFF9eePAQyrRSzg1VHNmsQ3o7Q
         BpY1odUJNcrCNIO8RFLTRdfWnsR9jd0NBxZ90VlnwZQuppBcoTQfsrdQQaZ+9gqraBd8
         VZIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738865008; x=1739469808;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=caeqLl37aVTV9GHJeGPJDhTQJsrPtsed2e2vk/usEQ2LTml99idZnvn85t6Oo0DXpa
         w7uFSm+cDpXn1LhEyfjyxQdY1EnfUZ2ty4fc7kZ7fNSo+w2Sz1ezYcQFeREiUSY3fRb5
         VJCDuiGpBP0itVXhCdgt+M0hMvwpb+tqoumuHd0UQkCI3q20nL/gUSByiSpgoB08yyiF
         onqM5lNGt9fs75yjyecyTba5UJLxWWN0Of8amnH6ieuf/oCU3Ce8xaqA5Xca1sScQPTz
         lthTxcB9RLPgStJ4D+8m4bY9k3Hw5qrZxf9P1ukrNr5YhzFqzYkcSTlF7EPBiKDufLv2
         xaJg==
X-Forwarded-Encrypted: i=1; AJvYcCVUp/dYfNSAmXaajqpjwAdTLo9Vm+4c7gtGCMGRo/Juo9AfsDsCz4RXEJ/xZbqvTEIxGSbZp25xAeB80YQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywm6ORsuF44Y2gq8FtpkCWTRON/l9e6VDrLqMLI1LOaP4gp4DnX
	bFdlUgq03hTTx5cksfYLXnAQsAc2uPlN5JGfwYiE+P4mY159tOBTCn6fy3qei/1HsopuDRplRWv
	P
X-Gm-Gg: ASbGnctqVsZeci79ZOttmY9+aV6tdbavaBBazazDLQndWTqn3eecLqnFJpYTnkQBsBq
	t2w7Ba5mB/Omt1DQrNCChNrCTqVYt6kAaFtb+VQJr1/qNx+ipAhTXxClzjJQQtf7De1AbMpeU1T
	2m7M7I3Thsg4fdybYFJ5/EB3u2j4wNWR+gOKJsAqjBeOmsaqP/fCOWKfEb7r5L26WlD4FsUHz4I
	EsbdShaBFPNnKQr4V4ZC1Vvajq52L84fJ4DNMULuveyKzRxuoYzhyN9w0XT6NQAFwhAKJwpIf/0
	S3BP8Rs=
X-Google-Smtp-Source: AGHT+IGA7y0kPIv4lcDBe/6bTHHSSHeIsT4CR86PjP/yHXhvJVRneQ5HCkaklQwceTZaGwBvQ0G3HQ==
X-Received: by 2002:a05:600c:5782:b0:438:9280:61d5 with SMTP id 5b1f17b1804b1-43912d150fdmr30935075e9.5.1738865008121;
        Thu, 06 Feb 2025 10:03:28 -0800 (PST)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-38dbdd3856fsm2278858f8f.28.2025.02.06.10.03.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Feb 2025 10:03:27 -0800 (PST)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Thu, 06 Feb 2025 18:02:34 +0000
Subject: [PATCH v2 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250206-media-rpi-hevc-dec-v2-1-69353c8805b2@raspberrypi.com>
References: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
In-Reply-To: <20250206-media-rpi-hevc-dec-v2-0-69353c8805b2@raspberrypi.com>
To: Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 John Cox <john.cox@raspberrypi.com>, Dom Cobley <dom@raspberrypi.com>, 
 review list <kernel-list@raspberrypi.com>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: John Cox <jc@kynesim.co.uk>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-rpi-kernel@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>
X-Mailer: b4 0.14.1

The Raspberry Pi HEVC decoder uses a tiled format based on
columns for 8 and 10 bit YUV images, so document them as
NV12MT_COL128 and NV12MT_10_COL128.

Signed-off-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
 .../userspace-api/media/v4l/pixfmt-yuv-planar.rst  | 42 ++++++++++++++++++++++
 1 file changed, 42 insertions(+)

diff --git a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
index b788f6933855..b5b590f234b0 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -827,6 +827,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
+------------------------------------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr.
+
+V4L2_PIX_FMT_NV12MT_10_COL128 expands that as a 10 bit format where 3 10 bit
+values are packed into a 32bit word. A 128 byte wide column therefore holds 96
+samples (either Y or interleaved CrCb). That effectively makes it 6 values in a
+64 bit word for the CbCr plane, as the values always go in pairs.
+
+Bit-packed representation.
+
+.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 8 8 8 8
+
+    * - Y'\ :sub:`00[7:0]`
+      - Y'\ :sub:`01[5:0] (bits 7--2)` Y'\ :sub:`00[9:8]`\ (bits 1--0)
+      - Y'\ :sub:`02[3:0] (bits 7--4)` Y'\ :sub:`01[9:6]`\ (bits 3--0)
+      - unused (bits 7--6)` Y'\ :sub:`02[9:4]`\ (bits 5--0)
+
+.. tabularcolumns:: |p{1.2cm}||p{1.2cm}||p{1.2cm}||p{1.2cm}|p{3.2cm}|p{3.2cm}|
+
+.. flat-table::
+    :header-rows:  0
+    :stub-columns: 0
+    :widths: 12 12 12 12 12 12 12 12
+
+    * - Cb\ :sub:`00[7:0]`
+      - Cr\ :sub:`00[5:0]`\ (bits 7--2) Cb\ :sub:`00[9:8]`\ (bits 1--0)
+      - Cb\ :sub:`01[3:0]`\ (bits 7--4) Cr\ :sub:`00[9:6]`\ (bits 3--0)
+      - unused (bits 7--6) Cb\ :sub:`02[9:4]`\ (bits 5--0)
+      - Cr\ :sub:`01[7:0]`
+      - Cb\ :sub:`02[5:0]`\ (bits 7--2) Cr\ :sub:`01[9:8]`\ (bits 1--0)
+      - Cr\ :sub:`02[3:0]`\ (bits 7--4) Cb\ :sub:`02[9:6]`\ (bits 3--0)
+      - unused (bits 7--6) Cr\ :sub:`02[9:4]`\ (bits 5--0)
+
 
 Fully Planar YUV Formats
 ========================

-- 
2.34.1

