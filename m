Received: from mail-pj1-f65.google.com (mail-pj1-f65.google.com [209.85.216.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45BBA2F2F;
	Wed,  2 Apr 2025 02:05:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.65
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743559524; cv=none; b=nsgsHP9Iz4CEGCojdXLlIEC475StB94cnCv2n1OxqGpCDFfyRv8vrkYLkyd5JUxHVTuaLtd7x2q4Wxoxi4/CesLJAvm11RWkpv0L5yWJSZx2PBg/kXFuiucjcDXwhN6FuF/MFLnZgBrbuZQTuZq/yQ326LwTfVxb8hgq1uape9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743559524; c=relaxed/simple;
	bh=KwOStQJgvwxaqYcjYPCg+Mn4Qj/DCcvvszq3gqIf2gs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=MW4J9KUtR6cjIG8vrXR+9hd/TvdafSFY8ZQhaxvA+pyayFfwkSilKYB5ZXpaY3on9jm4i0ne+BkvAb8jNrVT6UfqNfbrFCQRwPqGyP9iP+lmTiYxmkbEYwlma/SXFz01mOSyXR/Jvc8es4DW4hvyA5H3zNSknjyvuArztUGwixo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DQID1boG; arc=none smtp.client-ip=209.85.216.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DQID1boG"
Received: by mail-pj1-f65.google.com with SMTP id 98e67ed59e1d1-30362ee1312so10968736a91.0;
        Tue, 01 Apr 2025 19:05:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743559522; x=1744164322; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=o9gVv0/lFUKCYB76B/uhhr7mW5D0FE05CDx8S7RsfxM=;
        b=DQID1boGoR449LwT+BaErQW2MT6NeId2bWJhH/AGyfcL8Vir8wTrhDzUOYjZZ1z1IE
         CGNtSLrLtQqzyHAExctYrfzdMA7saM0Mz0fydQ7MrQJrHhSjpFwq78LPPsgs4WmjfHlF
         +eo0n34mUYVQbxdzjdJip9wpppZInfKBfMHAhBYzyEMx9L3G9/c42xCqtm1ayA+oc6G9
         jyMF6VehLkin3+P44FuEo7I77mwa5HYBcbZ/u86K3VrwkK3z9McKEpZuDZHrnyLcZqiq
         bKxcJ0u+7wHIPB7TwvxyfDkQHoUu07/y/VVdwmw0bqZFa97ID+7hT76TNjFZncRtGi7h
         7Ipg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743559522; x=1744164322;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o9gVv0/lFUKCYB76B/uhhr7mW5D0FE05CDx8S7RsfxM=;
        b=C/+uXqPR0dpzfcLO5xjWIUkuFZLsAgtljNJZBW6wzEFsGDpuKb6+QmVE7MYK2WO9AT
         BDJW+O3yg+aCc85MlUELnDYywX6/qDQDUOpeINh+yR3Ye7TyXbsPBvHeZ9bmCKH0vp1K
         GxNxSxfAbmfDW7renHlGTTI5F8A5MK3P5Byz0VnEsRYibJq1GfK3sD0ULnR5IevKDWNO
         61QnT+P2gJfG7hkCqp52l9izeIwTHwmStRV+ON+f0eTXirfyFqbaBCxnLEa9xCovrefl
         sLRdMPfl2j66BBg3pk2tTsLnJ9UjH4Thqwjt87l6HCT7+L7GRbpbKl5yarrr2zLkEuAs
         v7Qw==
X-Forwarded-Encrypted: i=1; AJvYcCVWngUOUvdeOeJnKEE9sGAKmOMA91QcfMm1Pr7DbE9P1UvYaWoksVZPiX1Z+S1fy/nf5FIBVo5NQZ3biBl9@vger.kernel.org, AJvYcCWK/VT7DAkgZUSaEKuX6LM2jkJCx4JMM4leLB1qokO01p5zzebHwv7Xi0wTbJHXIWzmSDW1ZOTnTmk=@vger.kernel.org
X-Gm-Message-State: AOJu0YyERWw7+6E0z6/hHLxURczgQ4jpDIRksf6/eETkdTn2UYonTzzV
	Pq2dCp3lm/b0Hlm72DutZlrgNE5/VT66ypQEHIZCTCrrJQf0zBd2
X-Gm-Gg: ASbGncveLslXSjutIHasEZQxLWcqzudMOYF3a5x1EfzgphuYObvZuN4XLH+mSZv7VTE
	44XdAfBVYUMFB5Vc+upS6Ix2ePQJv1vokdYpbJlZsR0tGTOM9C2DW9ZESoE6iJ8IPQiN6RE4pyL
	7dx61jSXzgt/5jSrtL9M4SE1vELwKWPDO5v00CDmBLHyZqwOLQt+FTEszeFSfSxMd2z3cX3hVNO
	uBVO0qxsmnualSXhXNJ2J5povlDFLNw7YWXN1k450BLk3vWWc70Y2kg3bJhyxe8ESFr/B5isGKq
	b7N0X+1gUT49LZgozvB/9v+yXDMs4MF+j48hGiy6rgJ8gPMIzTgqZLobTh4eNA53P57hsI0=
X-Google-Smtp-Source: AGHT+IGYOTfs8itG/9LV0cKs2C451I86DIdU7xhHpNkIKc6/RhBynUFKMtIV+3x5zV3ZEehIEE3Ehw==
X-Received: by 2002:a17:90b:518d:b0:2ee:e945:5355 with SMTP id 98e67ed59e1d1-3056ee5bb27mr1165789a91.19.1743559522249;
        Tue, 01 Apr 2025 19:05:22 -0700 (PDT)
Received: from henry.localdomain ([111.202.148.167])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2291f1cf51asm96808645ad.151.2025.04.01.19.05.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Apr 2025 19:05:21 -0700 (PDT)
From: Henry Martin <bsdhenrymartin@gmail.com>
To: dave.stevenson@raspberrypi.com
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	popcornmix@gmail.com,
	mripard@kernel.org,
	u.kleine-koenig@baylibre.com,
	linux-clk@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	nathan@kernel.org,
	Henry Martin <bsdhenrymartin@gmail.com>
Subject: [PATCH v2] clk: bcm: rpi: Add NULL check in raspberrypi_clk_register()
Date: Wed,  2 Apr 2025 10:05:13 +0800
Message-Id: <20250402020513.42628-1-bsdhenrymartin@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
References: <CAPY8ntAFHW3kiqCnXjFtzL9FnRoQ69v8+3yJ+jR8_W8Bb+6d8A@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

devm_kasprintf() returns NULL when memory allocation fails. Currently,
raspberrypi_clk_register() does not check for this case, which results
in a NULL pointer dereference.

Add NULL check after devm_kasprintf() to prevent this issue.

Fixes: 93d2725affd6 ("clk: bcm: rpi: Discover the firmware clocks")
Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
Reviewed-by: Dave Stevenson <dave.stevenson@raspberrypi.com>
---
V1 -> V2: Correct the commit hash in the Fixes: tag.

 drivers/clk/bcm/clk-raspberrypi.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/bcm/clk-raspberrypi.c b/drivers/clk/bcm/clk-raspberrypi.c
index 0e1fe3759530..720acc10f8aa 100644
--- a/drivers/clk/bcm/clk-raspberrypi.c
+++ b/drivers/clk/bcm/clk-raspberrypi.c
@@ -286,6 +286,8 @@ static struct clk_hw *raspberrypi_clk_register(struct raspberrypi_clk *rpi,
 	init.name = devm_kasprintf(rpi->dev, GFP_KERNEL,
 				   "fw-clk-%s",
 				   rpi_firmware_clk_names[id]);
+	if (!init.name)
+		return ERR_PTR(-ENOMEM);
 	init.ops = &raspberrypi_firmware_clk_ops;
 	init.flags = CLK_GET_RATE_NOCACHE;
 
-- 
2.34.1

