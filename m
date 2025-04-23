Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE58828A3F2
	for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 17:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745428843; cv=none; b=Jz4rfZy7n9IrnAXHP7Ytmw++hlyW188BMh5E2fhR+WKvMCceqS992+S4xGuxV+KBVQ0U6U/q+1aKTqREQFxQv+BeGe6djtJ4arLRUYlRvkpBmPYoQpbW3/qSNwBv38Q6JK3i/FasESGiA84ifnjEZJLXfjYtd2D558OAtJZHaX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745428843; c=relaxed/simple;
	bh=o80nFA9ki1lj4fsMeet2lUWOP7Liqo/x1fkL1KJz1uE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aRcrsZxZLEZRw3lK/8V/QpQGL1LaZ5Bv3VA9UTNkTs43O/K9tLnCOvNFvC9NQiZ7u5m48veniknmOnE9NmImgpL1x+43W1ANUA3eQU9YJm6xFh3lk5lNprMvbYvAypaUNQbVLJULqCP4JPkOWrtVayhjMmI+e9X0ebGkpovRfqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com; spf=pass smtp.mailfrom=raspberrypi.com; dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b=OmyDzFzZ; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=raspberrypi.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=raspberrypi.com header.i=@raspberrypi.com header.b="OmyDzFzZ"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-43cfba466b2so699395e9.3
        for <linux-kernel@vger.kernel.org>; Wed, 23 Apr 2025 10:20:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=raspberrypi.com; s=google; t=1745428838; x=1746033638; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=OmyDzFzZUgiVaDgUbwKcwSfF5HnyjD0MYPKbj6XSNSA4GVzQjkToq/OVd75uM1dj0s
         hlkcYfXzncHRwPCtcXMtGG73I/Ic2rjC72TD596kk2wUfC78lsRlt7h6Zz7C0GqL4x/B
         899o+fn8XqfsbOe9x3j3R4RFAe+iY4BGmGB5Eh9ZfDXLGOVmAZ5rXHt0dXeLSSoMYntH
         d2ssR5qe4bNq3Amh4gqB7ND2KDAEay2Q15mePHDhnCubfVdUPJgJ4bNxmkDuQl+1btbX
         apxeDCXnDb7yLYdDfQ+r0rVgDafuMxnJbhDeHgwjLBvZUuU4tlTHoimbJlLbwBTt8Kuy
         L95Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745428838; x=1746033638;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dY5Z8v+X+nz1eokOU34c0ipWgG+WmjgO9GaqVuQeGj8=;
        b=KUl6RIIvX4Hwyhh5LNjbLfdaKxLW6caCuRUOig/ZRlc2FVswGctpLiEn2gmn1TUm/X
         U+SCiqSbZbzTYPySWTHs3MmHwXQ07+0KbRCYtvonh+XgHPU/dBZYlOFPTuox2bFATbfE
         spL9bd4REHOd+uTz7FfXd04++N6ViCvIaga+bk8rEcVleOv2ktqfuBcjZfrVch6Bd+KC
         vYYgWguPHTlPhU10noE81IgFaQOFuYlPMT7d+g6Fwx/55gkA/UyNYZHmZ8PbP0CcEAHD
         ZUk1KtT3ujcsnhMextgxbJeopFT6JLbtOztp3tS3YBqSVsluH+p6UAd4uFcmnWn0KFte
         10ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXvT3obmkB+8N6opilbFcnu6xtm7tWci/XA9BX2FJ0H54FxL7Qw7YxosFPkAOI80BwN0ubMAR0PCzHuQnY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxYjWD+NglEjgsTpzQIXpDqOPKKbq+dIyEdGeT0SUywFoWmmVc6
	HuhwW5Qwwlbp787wIapXpsl5Iu3KHywoTxNssorVOq7cqB6T1unesDWL5ypFZfE=
X-Gm-Gg: ASbGncsiMGChIEMS8GyvvC6Ksh/ro63CZbNbZ9GpbiZot45zuzT9QUGDzT5qMVhUkbe
	Ui8RFYHgkP/7Gr/xoEq3uqlHYLq2qvHNAD2SI329gx9WO251QatkTX9dwAuLgIZp3P+fmJTiIi0
	whhVliQr6Ruse21OB6JiwXP0Zqiu44rDNQa4pzhFYtxcgjDVgh3NMLvvM3mwhphdA9deFRnu2AD
	XGgDL0ZdZS21oIOx4gANcw5kM2gBvqMs+WxsV2k8ykVil5djAm/IRIiC/7t/PPL7ED9G1lznQAt
	unpfwCLrKNt+SVyUB7md5gQ8Bf6TlEAp
X-Google-Smtp-Source: AGHT+IFF1u6bufdbWvx/7orMXvGpO3G+M0zO/iTcUIR8n1s+97nA5E2rJNbe44Zk4+MMT8SNyCMZ4w==
X-Received: by 2002:a05:600c:1f13:b0:43c:ea36:9840 with SMTP id 5b1f17b1804b1-4406abf992amr161169035e9.22.1745428838219;
        Wed, 23 Apr 2025 10:20:38 -0700 (PDT)
Received: from [127.0.1.1] ([2a00:1098:3142:e::8])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-44092d18433sm32940945e9.1.2025.04.23.10.20.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Apr 2025 10:20:37 -0700 (PDT)
From: Dave Stevenson <dave.stevenson@raspberrypi.com>
Date: Wed, 23 Apr 2025 18:20:18 +0100
Subject: [PATCH v3 1/5] docs: uapi: media: Document Raspberry Pi NV12
 column format
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250423-media-rpi-hevc-dec-v3-1-8fd3fad1d6fb@raspberrypi.com>
References: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
In-Reply-To: <20250423-media-rpi-hevc-dec-v3-0-8fd3fad1d6fb@raspberrypi.com>
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

