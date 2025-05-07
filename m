Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBE42744E;
	Wed,  7 May 2025 10:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746614643; cv=none; b=GWC1xRhAOFsVwCbxNjc/s6GEKD0pvB615JivG21VpSQcqPG6aVTsqj7syyHc+Mqic3ZQr83wWaw6cDQ13Fmcfq6t89aPEZB5qkG6aF+yP2pArGGuOoKOL/xd+LhfjDcg4IF0qiC6PsuOavwoOuzY3BbbzNqkxB+DFy4OCVjoMKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746614643; c=relaxed/simple;
	bh=HFi+6saGj2XzkZ0BZnY0WRBXo0MnaeqWEtbw18D63IE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=bAv+Vq6a+/3AEBss8d5QmODEXYhDtpnUQFpPnHj/9xAjfUpgtaLyszCaFfg3C7j/JuOeitxICiveqwMK28kxlvZrcs9DH6NXqHJ4wrLorfFVhQxYgfiQUyUFIHYUs9zfYKXJ2kjARin35ZR2+5K4mdKZF0MCNTIo4KkkHAD68q4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IltRAHdz; arc=none smtp.client-ip=209.85.218.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IltRAHdz"
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-ace94273f0dso525827366b.3;
        Wed, 07 May 2025 03:44:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746614640; x=1747219440; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=X5BiF+obK77Q4Mt7wT43ch3emsGuKkwCPOShuFXZSoU=;
        b=IltRAHdzoUblYHpJ5VzGTkX7V5viFg5Pduv7SzhuBj1nwRsNzFoJz70619x0Sk6jaQ
         NbxSwa/tLQ8zGGbKgstjsmcmNKQJuinNOriYqOR//hFLIoHXBI665jU/rQ0kO4RHggm2
         Or1xysy13ZmHLxy1IUXOjv2mmFUrY5FnyC2L/dVAHTYOcxKLBUkNGjjRNr79ZT9qxsIG
         73VHiUQ1tVels7QUQVh210uXm2Vc9DFS+LDDJ9Ibqv5x00skaEKYZkpyBSQ+MwOSjdXs
         JvQGvXPXzhI/Vo8B8cTi31bs480rVfTjCCv5UKhNLY2A+Y13Ya/77htVAOnrIgu9Ai5N
         NwNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746614640; x=1747219440;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=X5BiF+obK77Q4Mt7wT43ch3emsGuKkwCPOShuFXZSoU=;
        b=tdx2k1VHAyeqfKwmUxoKDJ2Zoy8kqD34kp1Vj9lcPS+2HzDmg66dyTn7Wv4gTfOhiZ
         u1E1Z+cHCP75MZ5DRqkQGOe+4NDZ9fiAtl9aU/hAZTK1HNCyTWXXWnrRWFQVAnUlsxs5
         wDJFdaXmkjVVL663WCJ4dZK2p4myUb8fv7XajV3MlR1Yw/UhPhXNbyM89PQdPxy0TgK5
         WSj3JselcuShCoZEFpp55hg2GaTMD1sKLJkL1sZPDtjfKkN6bJptDrXCJy8StnoUhxGr
         0okL/p/U7PtFOgvmSOhZOMpcpPdF8Yb5EjPb0aiB6i7eJhgrEOjGRF55Z5S2KpNo+llL
         LNfw==
X-Forwarded-Encrypted: i=1; AJvYcCWcQDqItqjxwzi2Ao4PCatj7mtGloi+0hOPr+UC9GooxZOgCBDYxHhvrUHL7GIb3Ojb1/fmx90mPw2gXNI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxqGQdaS8ZgxfxxTEzYvaA/g5wSF//cBWKrFpnjoiiNkA/e7RyG
	1a/hhziZgXwaDB+2BuZvj1OBuG/w7297x7PFWmTOZvpCczRbecjlHfx/6XUWhWwv0g==
X-Gm-Gg: ASbGncve2y+VMjgo7mpLzjvdSJqJdngsesxPOLagWwO2n2sa0kPDX2bWXK9dyURHoqz
	w0qr3z/ZVVFMbOCH0iR+HZr6HJvbBcvTmA+yuYmq4wwNJ62qLJ6grpcRXeTj3vOGYOQxaf2O/d3
	Pg+5lKxnbeN2Xafp654gYZ9Uz/TB5kzsfLerrUdQlRnlEZWCa/4ANkGVW549R8el4sb+8d8cD3V
	rmqme2/n2ym+vYmJ5lAFTU88J9rawRK1EHSMO5xFzh7G9+p3RD+N4S+oSL1incQJnN7edrIvHii
	60N0AAVpnJkDbKYYXoQgE+AMg4NqXqG4BTjUVPY=
X-Google-Smtp-Source: AGHT+IHkq4eJWAWxiFp01qWIcmgv+HhQAeecubFhnLc304MQuXWevI6GcbIy3qwNBtMpLe5u39LKHQ==
X-Received: by 2002:a17:907:2d90:b0:acb:b966:3a7c with SMTP id a640c23a62f3a-ad1e8cd6b41mr286749566b.47.1746614629550;
        Wed, 07 May 2025 03:43:49 -0700 (PDT)
Received: from localhost ([87.254.1.131])
        by smtp.gmail.com with UTF8SMTPSA id a640c23a62f3a-ad189146fcbsm883780866b.34.2025.05.07.03.43.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 03:43:49 -0700 (PDT)
From: Colin Ian King <colin.i.king@gmail.com>
To: Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	kgdb-bugreport@lists.sourceforge.net
Cc: kernel-janitors@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH][next] kdb: remove redundant check for scancode 0xe0
Date: Wed,  7 May 2025 11:43:37 +0100
Message-ID: <20250507104337.201695-1-colin.i.king@gmail.com>
X-Mailer: git-send-email 2.49.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

The check for scancode 0xe0 is always false because earlier on
the scan code is masked with 0x7f so there are never going to
be values greater than 0x7f. Remove the redundant check.

Signed-off-by: Colin Ian King <colin.i.king@gmail.com>
---
 kernel/debug/kdb/kdb_keyboard.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/kernel/debug/kdb/kdb_keyboard.c b/kernel/debug/kdb/kdb_keyboard.c
index 3a74604fdb8a..386d30e530b7 100644
--- a/kernel/debug/kdb/kdb_keyboard.c
+++ b/kernel/debug/kdb/kdb_keyboard.c
@@ -145,9 +145,6 @@ int kdb_get_kbd_char(void)
 		return CTRL('F');
 	}
 
-	if (scancode == 0xe0)
-		return -1;
-
 	/*
 	 * For Japanese 86/106 keyboards
 	 * 	See comment in drivers/char/pc_keyb.c.
-- 
2.49.0

