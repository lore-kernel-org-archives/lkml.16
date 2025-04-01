Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 562841DF25C
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 14:17:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743517081; cv=none; b=EZp4tyLCx6fewgugcpiIYbthUhxauw/75rmOgi3wzYmQabslJ313Vj+aZg/Vq5RuwmcBU+TOujREVKOTzUnFJJrU3A+PtUv/S2YNpMPntPPAs0P+kg4q2mvP/vXYHbydQwlraIYFv5jOuCVKoUtXLZmHKpSY0pMnBacSbnu75hM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743517081; c=relaxed/simple;
	bh=FJlsgq2QzOzhVpe+zVW0YCghAx8UZtTofJGeg+Vorl4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=mkPU7Y3hOQeRgMDlS5b3jKEwLBrklTRhGqlVvqb5LP+tCusbTazTeStxwz9dW1mSbzzjwetVUhU+vqvIL4dRk4DoIHtFdHoKATXWGDNKx1K3fu25XQCHLZ5nBPPXHe5fgnshf+nGenD+QwlHbUBGl+a+54XTQ4FvBrHigoLCvCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gPKUVHb5; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gPKUVHb5"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-548409cd2a8so6045574e87.3
        for <linux-kernel@vger.kernel.org>; Tue, 01 Apr 2025 07:17:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1743517077; x=1744121877; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fMBJRbWhFak+sAV1ZffRRNyDINUZZx4eH4dy87DFJ8c=;
        b=gPKUVHb5VtTjwaz/PikMCdUN3+CqkjB4bOK0etWQhE5MUcB+Cv2mTyf5bh1N5sNkYu
         DoPBT4arcgbUDg3F/WNHeVV7bxRkeHmH4KemE2aLp3DvV5Qd8jncoDZ9kMriqoJjHWXU
         DzFJPiNqhzsNCtVUHZeQxctcZEZWnvYVQVIug=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743517077; x=1744121877;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fMBJRbWhFak+sAV1ZffRRNyDINUZZx4eH4dy87DFJ8c=;
        b=VyM9wR+VcTIL0oUdEMEdcxDoD2cCtwswj2S8gA8sMdbIhc9+SZTWVxz334fesxR9H0
         eyY5FsZe3jJ5Lq0b9ftxI/bSc51xWR2P5u+8w9DvqGAaPZEQwmqzmUrFsqdTgWnqQFal
         GjoC6asS+OP1CJlAPy6xdAeAs8mf7IpfVQQM6SWLAHuhUvGIum9IlzeDbalxcWWkLYN5
         LF0EG4d/DqLKdsde0FPrVw+v3UIUh65+P6YIQ74JW8hOMcTDhOYuTsYhxI/UObKdIigk
         Wrpe2ZEMly85eQ1rpQMNjYeAoFvO8hbk8zNPPHJWeH4ogEHt+5l9QBUvdZMT1XLGfWRL
         1luA==
X-Forwarded-Encrypted: i=1; AJvYcCVJu0j5bBwk/1KT6yc+o7Bu5djFwCY32RxvVomAunasLNKqgbCnguy9GD5YS0GN1tdA1isTBEDVGrnug00=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsVgREJoklqGZBM+Eic5WWcoEfjtXtVW1HXtqjZgDHpu3jVwxy
	uBdOONExHySe2qKZ9nkcL5XsaLvHuhd/Y+jGj/H7Ken9XAQ5a3X3J4t7AwAddA==
X-Gm-Gg: ASbGncsfRfQZ0IC+RAV9VbJxbgygwgW5PzJqByL7lrjCnt4xulSG3AsEtVsY9izReMi
	6U623A2rrwAKJ4hAJUKbG0q7mR24fr7PtIWQyVFI04zLM19eXm7mQPKHMwLUQAaUHaYobJlGDKB
	h/WDdxNQMAAf2VjGH8pb4ExN6KIanu65DRyr0IZSv6UeTbBp6l0wVQ75EiGz8oUX4j7ovEvmMGm
	j0ftyMPhvT/5i9/L41Rric2t0OtYYjbXmoUGZw9lz96aZG96BXFpBsQ3z2jMmwdJ7mrVXqVlLPJ
	J9IHCK7Wjzxz7gOAFWUx6Krx952v/gRNUufTPZd0H2qc64pyAHBX0FqBZzWyK0AZvrUDhgiaBas
	WsVkOpldIAGnJXV7bwAc3eCrr
X-Google-Smtp-Source: AGHT+IFJq5w2B0dugOC2Oo+nxGo04pCzcOgC1humRSBZ8othsPmNpBduKudyA9YdVBqoa7doalBKFA==
X-Received: by 2002:a05:6512:3d16:b0:544:ca1:da41 with SMTP id 2adb3069b0e04-54b11128170mr4067328e87.44.1743517077405;
        Tue, 01 Apr 2025 07:17:57 -0700 (PDT)
Received: from ribalda.c.googlers.com (216.148.88.34.bc.googleusercontent.com. [34.88.148.216])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54b094c19a3sm1377789e87.80.2025.04.01.07.17.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 07:17:56 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH v2 0/2] media: Fix gcc8 warnings
Date: Tue, 01 Apr 2025 14:17:53 +0000
Message-Id: <20250401-v614-v2-0-53024c4fcdc7@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJH162cC/13MSw6CMBSF4a2QO7amDwqtI/dhGGCp9A6g5FYbD
 enerQwd/icn3w7JE/oEl2YH8hkTxrWGPDXgwrjOnuFUGySXmislWO5Ey0xr9KSUkVZpqNeN/AP
 fB3MbagdMz0ifQ83it/4BWTDO7N11djS96iW/ukBxwddyjjTDUEr5ApzoCtybAAAA
X-Change-ID: 20250331-v614-8485d3382935
To: Hans Verkuil <hverkuil@xs4all.nl>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Andy Shevchenko <andy@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-staging@lists.linux.dev, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

Kernel 6.14 has increased its minimum gcc requirements. After bumping
the "ancient" test in media-ci 2 new warnings have been found. Let's try
to fix them.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Changes in v2:
- Incorporate Hans changes.
- Add comment (Thanks Andy).
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250331-v614-v1-0-9bc69a873720@chromium.org

---
Hans Verkuil (1):
      media: cec: extron-da-hd-4k-plus: Fix Wformat-truncation

Ricardo Ribalda (1):
      media: atomisp: Fix Wformat-truncation warning

 drivers/media/cec/usb/extron-da-hd-4k-plus/extron-da-hd-4k-plus.c  | 4 ++--
 drivers/staging/media/atomisp/pci/runtime/debug/src/ia_css_debug.c | 3 ++-
 2 files changed, 4 insertions(+), 3 deletions(-)
---
base-commit: 4e82c87058f45e79eeaa4d5bcc3b38dd3dce7209
change-id: 20250331-v614-8485d3382935

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

