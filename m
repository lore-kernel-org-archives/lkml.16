Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19FC227C162
	for <linux-kernel@vger.kernel.org>; Tue,  1 Jul 2025 16:02:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751385724; cv=none; b=dBZXAqKc4kLrRL8Q1YBsHtiVa6EK8b17oDQya1FJKDHUjTx4r9ge8Kx8CqUHRSyilS+IMRXw3OjfZxL9Ys6xWlcOXCZjluFONGP4+auHoH29CmrPOxCEI7/xvxRALM/LYmMMV4oKotKqt+4QaxJxzHStPUwpMSXQgi+GAZbZblg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751385724; c=relaxed/simple;
	bh=Eb8wuovSBuSoIotj4pnFiy2j63/jKfYOw2hKqjPwOoI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=A9F+r6c9m5DabccL2kIsLdnkamGTbP34go58aSmej7GwWmbfBri51Yk/m8blXYMezDWCRGHsyfCmKTzJhH3978qObM9zOoP3cqZDMiS4wp57AZ8YuNWEHzQZqGVUlHvj9ggmfJaD7GnOfnvUl+d469k9OaXIeB0t/Aa2gZWAVzo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=tBw/LCHz; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="tBw/LCHz"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-3a575a988f9so3845767f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 01 Jul 2025 09:02:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1751385721; x=1751990521; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EOZP3BcptZSYROqm0ele75c0kFNzuWVKa5tBqUZYrLc=;
        b=tBw/LCHzRk4aNynL2Ar+OPkH99+QZdBE6O46mepYpVUqbD2F7f5p2IZNhlT7KZt+aH
         ksE7O7X7Seqwc0VpTaS3wmusUJMGd3Ywc3HNrIX9tYPXL3IvM2ndIPX47zNUKRGfxv82
         dD75toq+UpSWhKY5ZQKV0dyEEGrL+Q1A0lQuCcrU5ybGoJuloNRtRhFvCw2fi38rxrS1
         QTwucPUD9+EDMJAgCKe+4PA9gnXJwf9KoQwi2ivs1BbfE67zMBQ57Q/Uy4eh+YW2HTOl
         RwkWoyfLQpM4IT+a++VPz8DQUsJ3FCsatzVqlNFDA1sniRpQnKUb+NetqbLchgUbGLmD
         iF0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751385721; x=1751990521;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=EOZP3BcptZSYROqm0ele75c0kFNzuWVKa5tBqUZYrLc=;
        b=t5D5QvDkvQrADp2cO27lkn+PiecxvKE/Jy0x/xP9MhsLxIXT2U8kj0Vu8kKSBWdP3U
         F3pitTOvoyGpIlhdfqprNlD3onVeR9mXumhizBfmN5Ukh1MHEOkLbSQcfm6SyB3wR9Tr
         yQtZJPhi+dzlYkNQ7C2j0GluDUiXg5FMVGupDIdtK+3tfT5hGBlcvUXnST2jryulqJTU
         LxZnBV+jsY3CyBkGfKELJIa5n961O3Cg5zQUIYLdfM7Th82b82jcRvKtrr0Ajos59QIe
         vUsKCvzoacVkP2pcck4omdk3g1N88IiwG36qpWyS/TSAddNtE122eUF5eKWoxMVKDCgB
         nuiw==
X-Forwarded-Encrypted: i=1; AJvYcCV/XeSrAV8K9dmbkeJyPbYjQuryc1WDlOqrDo1c2QkteX/7R8hIxH+wdKP3MRqbjQg0cYDk5bZZ2121Ac0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwpnLHVEXv6pLAvAY1BrH68JK3fBtTdkHhBhOi0a0x8OTtVNM2C
	0Z/V5C4zibr8kRk7cIsH9qmSqiEexXfKcbee0H8d4DbHgkFwKAtvaaH89WIM+qMCvLc=
X-Gm-Gg: ASbGncsyqETDM2x48hX0p9Bkw5Oq8aszKpyhk/cobljZKsl5E+ySPJ/osV35Bil4XfF
	MWqexYQrniboJvoKM7Sboo+XRLwfV/Bf8Dvv6dxJviipOslkFDdphvZ5NtXk/ogeFW3exVpl7E7
	aFkeZ/5OaEheIcBoUSZ92p2hIU2fa4EcoS+cWEHoTvuTZ2jaPDNpcRcrTgrKk552U2BgCJ1SNJQ
	UE95UAJEFN0L3Z7yyYSUFAG9iSX+Ax97mJIs/QT2bOq/vZwej+YjK+Vjnf7sqP3uMs/TX2qyeh2
	/MIhughtZNT2Qt1cQts/i7ychXkGcWgHFM3zZ0UbgYhqOm1t+rsYxAqMRV90GHpk
X-Google-Smtp-Source: AGHT+IGrDuGREIKIk2nqkFoR8uzIUjeElqTk8BPXwPJayvJvDoPAeAcRb+gzpufKi2d4K71fEGSFzw==
X-Received: by 2002:a5d:530d:0:b0:3a5:27ba:47ba with SMTP id ffacd0b85a97d-3a900296715mr14744114f8f.44.1751385715670;
        Tue, 01 Jul 2025 09:01:55 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-45388888533sm182500995e9.21.2025.07.01.09.01.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 09:01:54 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Tue, 01 Jul 2025 17:01:36 +0100
Subject: [PATCH v4 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-media-rpi-hevc-dec-v4-1-057cfa541177@raspberrypi.com>
References: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
In-Reply-To: <20250701-media-rpi-hevc-dec-v4-0-057cfa541177@raspberrypi.com>
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
Cc: John Cox <jc@kynesim.co.uk>, Stefan Wahren <wahrenst@gmx.net>, 
 linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
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
index 6e4f399f1f88..84ec1dbcf41b 100644
--- a/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
+++ b/Documentation/userspace-api/media/v4l/pixfmt-yuv-planar.rst
@@ -955,6 +955,48 @@ Data in the 12 high bits, zeros in the 4 low bits, arranged in little endian ord
       - Cb\ :sub:`11`
       - Cr\ :sub:`11`
 
+V4L2_PIX_FMT_NV12MT_COL128 and V4L2_PIX_FMT_NV12MT_10_COL128
+------------------------------------------------------------
+
+``V4L2_PIX_FMT_NV12MT_COL128`` is a tiled version of
+``V4L2_PIX_FMT_NV12M`` where the two planes are split into 128 byte wide columns
+of Y or interleaved CbCr. The height is always aligned to a multiple of 8 lines.
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

