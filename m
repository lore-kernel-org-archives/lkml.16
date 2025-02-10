Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1AE35243374;
	Mon, 10 Feb 2025 12:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739189764; cv=none; b=G8rMV9d1aLgixOyNfvmUZHILAoJRmjPSSi9liT26KMMK9MGW2DZz6ErOTCDGspb8WmzWt2uHwghsM/la/4F/rbvuH0ozpGbhliumUnuQL/gfXgVm+U7OjS5PyhHz0xnD8JlhfpyDRawa2cBGN57/9S4tCFW3GTPE58Lz+yCsEIQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739189764; c=relaxed/simple;
	bh=F/7W3Ji5wIGnVHt8kCsM4GPtFrsjZvbfdVUG9QY1Gfg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=R/H9XX86tCMEMel5D1m/zsoEsOPE/qVPxDHfbjBAT3wEsEFPWEzmM8Qghm3tG0K6JxuLP7sHle3MvepwqMe6MnseQBXmcX29XyWJCJvrhEImSLRwtEt3KFiKC4ZVHCxuRoEMfipy1gyFDE8b0EmAhg4z46aSqKFVvHs6NW3CbAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dRKUtugI; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dRKUtugI"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-43934d6b155so9794745e9.1;
        Mon, 10 Feb 2025 04:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739189761; x=1739794561; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GAXwPLt1kFbd7E0TfRGbt8eT4WvsRFZwEWl1hPo7ppA=;
        b=dRKUtugIJbfhJieeNY9m64FoYBSz7OyTq97ZwF6/xoryyyfkH/KsD5/nxFv59yFu/L
         bHQ3gSygFu2gLaxKo2wBDXXNH38YwR/Kw2Vhif1BhzM+JtMY5aCyZCrv/KMG5uECNyC6
         ceccF6JvRJ0fF3fDPcbSCXWYx+yaLzyDPT0CDtY/SjWYYegkklGRNYAKxFYjwAle1qoc
         GbR7nqbJMZQloTqc1fPzts+5g5uKLA1n0ECQfstJ/wmikpafi659J2vOeJZKoL1LcgRq
         l3Pk/5oVKFlVidcIzHwOJZpjDd3/Hl3YCsyGQkjJaxNGkB3szYaVj3ER9Ad4mK+9Z30B
         OiDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739189761; x=1739794561;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GAXwPLt1kFbd7E0TfRGbt8eT4WvsRFZwEWl1hPo7ppA=;
        b=Z0FEgzNVSrvW4CSON9VC71FgesgZ6Bsr2kQ98T4jhnyBMPKysbenW0Kxq+A+8V5U4k
         VXtkv2XI2PFcuHZoVsDbCf0D3SxOXvLV1QTzYDZYJU3AH2H3tKDxDWbUihYqeNz/LPQR
         6l7mK/bL+THxfKTiNlQIKRdtj0+BDnA/0ud8d5wd6/ghU54R1c/NAXQwRglCjdWLj7WH
         vZYwuyjf7GEcsmNBFao6b7B4h+AMVS6tVjGRukFMhiZukgX3MnZNi0UtJApPPnWP7hRU
         h012o7tXX+I+rVxlBpGh7Z9mA51k6XeAZqzbrfBBX4cHvH9uy/MdOubeuDe9kd5wv3v9
         SeVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVEMuGWEI6Bzv53m72WjspTi2IBI4m5I5EGrdzNFbCmsyc63753ugnaUwY8bRAoLrZTsO35IEoVjaAX92g7A9s=@vger.kernel.org, AJvYcCVVFy02nZ+96vPlk7J09oCEElWPYvVJzxha/Wl5foikR1dbtEWgeJMt2pkMCZpCdsgmy8HkxEps962R/IvT@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/IEiXK4K7IVYktiQecSiLNnx77n29iMSY+PmT8p+iFFDdHVtp
	FsP2OZrLqlxLY2h5zpyEv+nnbMOVr3MIKEy1GgEPyBpe4aMLXqMJ
X-Gm-Gg: ASbGnct7wJetJ0KP3C0dt+woy+P3qjMos2ulps6jaz0tT/ESJlhQKBiJe7dGNqvMwtp
	GleEq32uLB3mi7AJ0oWlt4C19cOftrE2ysj/7K35/fC7q9kU89N6k6S9NyM7O16iaAK7RIdKZoO
	KG1Mc6DadB1LSQqcyHN6Sa+lznX1UXjuMY4L7gLJKSHxeE74BORS4BglSTaoHGpUrHWP5GCMyWz
	Y51u4XVfup4Q+hD9IkaGHRS181EJDnCE+l0p21XjUiMFgKT4P5E2slREpxf+gdDt8tsDpKBpXKL
	AZfm2zpSPqbl
X-Google-Smtp-Source: AGHT+IFFqjKPOWeR4uzaI/d56rTMNFQwNADYI+92fGS4ndChhBWmVDyZmS3pP6P5O2p8dpiIIPHwVA==
X-Received: by 2002:a05:600c:5351:b0:439:3159:c33d with SMTP id 5b1f17b1804b1-4393159c5abmr65837825e9.13.1739189760962;
        Mon, 10 Feb 2025 04:16:00 -0800 (PST)
Received: from void.void ([141.226.169.178])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-439377ba9c6sm68599335e9.36.2025.02.10.04.16.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Feb 2025 04:16:00 -0800 (PST)
From: Andrew Kreimer <algonell@gmail.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	kernel-janitors@vger.kernel.org,
	Andrew Kreimer <algonell@gmail.com>
Subject: [PATCH] staging: gpib: Fix typo in TTY_LOG message
Date: Mon, 10 Feb 2025 14:15:33 +0200
Message-ID: <20250210121552.33455-1-algonell@gmail.com>
X-Mailer: git-send-email 2.48.1.268.g9520f7d998
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There is a typo in TTY_LOG message:
 - sucesfully -> successfully

Fix it via codespell.

Signed-off-by: Andrew Kreimer <algonell@gmail.com>
---
 drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
index 85322af62c23..1c3e5dfcc9ec 100644
--- a/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
+++ b/drivers/staging/gpib/lpvo_usb_gpib/lpvo_usb_gpib.c
@@ -542,7 +542,7 @@ static int usb_gpib_attach(gpib_board_t *board, const gpib_board_config_t *confi
 		return -EIO;
 
 	SHOW_STATUS(board);
-	TTY_LOG("Module '%s' has been sucesfully configured\n", NAME);
+	TTY_LOG("Module '%s' has been successfully configured\n", NAME);
 	return 0;
 }
 
-- 
2.48.1.268.g9520f7d998

