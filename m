Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BACD2BE7C7
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 13:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745934450; cv=none; b=AF+e//H4q331IcbFYBMFKoNZShPoB03yR6zcZPB0WeSu/3hP1g+BioItqEYXO5b5pDdZ/+TstaZ97dCWcqojl2e4SNgHduMy+fno3Kr5DrxBJ+Q1ZkqQovXTWDbM9nKOCZ/APCN/CXt0vvsPQzJGaykLKItQYj4lCPxOcgTtLUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745934450; c=relaxed/simple;
	bh=tvXj/8rx64ijoXhOtmAnIb9Fi4Y6gjX35eb37RtSql4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=lfdcbnVUAzouVJ1GFecgRxQyhG5UtK0ILD2+azBF/ZzibfV01HaSyg4hwEXkpnyRrmD6d9QwadoKmnZdVq2BfajiMQWwOoh+Ysh2hr/i1itF9zGKp8HVs24On3A2DBJPg4VydmdyODzh7/naA1I1vt8+RoY6QoTZig8mPzWoObQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WgLUFuyH; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WgLUFuyH"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54d98aa5981so7744866e87.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 06:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1745934447; x=1746539247; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A3Hi0LYp5dyA1fp6qe7HoQbmwzewNO4kWw/hCtK7URU=;
        b=WgLUFuyH5LPbbXOB0WyRCTDsnfhJWZbBxC0Z1jJQHBsPibF7g3wwHhyNEBpxqdbPxh
         LCx0xZhhASHtrsV8RyjudFpOkaAuYWabHpmA8giT0BtjucMg/O5Aqi/gEhsUJ5uXCQWs
         I3jeQCbqQYdUGCwLlfRBcjBKg29AGLjyUCUUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745934447; x=1746539247;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=A3Hi0LYp5dyA1fp6qe7HoQbmwzewNO4kWw/hCtK7URU=;
        b=SPAkAbkFiKhvXh5ffEvJ6PlQx5vchr+QB/Ujp6OSR2ObrltCyN6HNVDvS9VOFcdL9H
         zxruVvVd9SF9NYuoSOlUamtl4Mi9OaZyrr2AxjfxjGCRobfJRsA/F2Fi0NMgyykS91q/
         5VbXMhMYxh+X/REJ+FRf9pFWQNDKEc6auBAVbiAaSrkijokWUeqqQWzIW2YG7VTm+W2L
         FZYl+uPD17DFuKyhao9tqvv2Ari6CuzHrWXsDRCyhhE4d3zO0aUeWgN06te9snx4Hrgy
         0MDRYZHFgcf5YrofAx4unKgyEFmuiH0BUvS5RrCRjGKeLWc9YSObhvAbNDzMi16GgNI1
         SCQg==
X-Forwarded-Encrypted: i=1; AJvYcCXfnQOMSe1zL/I1txkEKlhRNK1AuOsmWVj43tJ0kmABEt5M4FaQn860vBR92M0Zl7VewZhD7W3wTJp5VP4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyAKycTVWwhk+3GBDsYRVmL4qKn8snbsl/7dD0u8pkVGStVVZg
	slfCK3kdoq66U0u8orBqCAUH8fT26lR9SK1sJKvxcrrVLDFO0cnlCIHfo6Qvhg==
X-Gm-Gg: ASbGncsc49i2In9QrLzgjQRpYpdbXp2PswpR+JDnSPLagtPly5lV3XAGG5E2BHSx6zU
	7mwEA/uBTBezpPNqMpIOQUkfnmUFD8k0mwbzvGJOYYAStUYsc9sQ03wXhs9eHw/dEIpMTqE7PmF
	J5bASNTpf0cqJ0CFGD/oo1lgaQu86vfqJ5ZFL1TbUw5VrO6kdSruGoTij09FdPS7s6o0sPa+o7n
	oUofhkFdjUGcKnobTVB+F2/mtZbHYDjhw6UGI7ekmzhLcYMNFBGKrwg+lGg5PBvNxuDY3RjIGGg
	Ww2Q0COfMTy+OvWZu2I2MQDcGg8hokzacMruL/2/OGE3EVXH7VsTVCEBg0FS8z1kGKtXa8Y6vgH
	mOIc1DHNxHbBCPneim7HW
X-Google-Smtp-Source: AGHT+IE4Zb03U5eee3TPY4BPRFjLYpPyelIwBzJ9ysPxiJSxEPB080mVbDV3/bDpkBeg2i1IWc4j8w==
X-Received: by 2002:a05:6512:3d17:b0:54e:8172:fb6e with SMTP id 2adb3069b0e04-54e9db16893mr990549e87.54.1745934446615;
        Tue, 29 Apr 2025 06:47:26 -0700 (PDT)
Received: from ribalda.c.googlers.com (228.231.88.34.bc.googleusercontent.com. [34.88.231.228])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54e7cb2626fsm1902375e87.46.2025.04.29.06.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 06:47:26 -0700 (PDT)
From: Ricardo Ribalda <ribalda@chromium.org>
Subject: [PATCH 0/2] media: uvcvideo: Enable keep-sorted
Date: Tue, 29 Apr 2025 13:47:24 +0000
Message-Id: <20250429-keep-sorted-v1-0-2fa3538c0315@chromium.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGzYEGgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDEyNL3ezU1ALd4vyiktQUXaPEZLM0E3NLM3MjMyWgjoKi1LTMCrBp0bG
 1tQAy4N4RXQAAAA==
X-Change-ID: 20250429-keep-sorted-2ac6f4796726
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Hans de Goede <hdegoede@redhat.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Hans Verkuil <hans@jjverkuil.nl>, linux-media@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Ricardo Ribalda <ribalda@chromium.org>
X-Mailer: b4 0.14.2

When committers contribute quirks to the uvc driver, they usually add
them out of order.

We can automatically validate that their follow our guidelines with the
use of keep-sorted.

This patchset adds support for keep-sorted in the uvc driver. The two
patches can be squashed if needed.

Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
---
Ricardo Ribalda (2):
      media: uvcvideo: Rewrite uvc_ids for keep-sorted.
      media: uvcvideo: Add keep-sorted statement and sort uvc_ids

 drivers/media/usb/uvc/uvc_driver.c | 660 +++++++++++++++++++++++--------------
 1 file changed, 409 insertions(+), 251 deletions(-)
---
base-commit: 398a1b33f1479af35ca915c5efc9b00d6204f8fa
change-id: 20250429-keep-sorted-2ac6f4796726

Best regards,
-- 
Ricardo Ribalda <ribalda@chromium.org>

