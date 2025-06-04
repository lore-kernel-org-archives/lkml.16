Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 450D620F088
	for <linux-kernel@vger.kernel.org>; Wed,  4 Jun 2025 17:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749057878; cv=none; b=qr96mpyxfneGHoDxLE/CK4So9gKwWXDcZ5O9H/z7HgnJ2qIw72oqrH3aDaeQFrv/RTaaXMYW64We6qHjEDzVZXj6uv3t/xUiRX+UZ7ISTgnFWMF3gKxrTiFaMz/+V0LDveZ8h37shVPS8rcWk2sCZe+GVKn7TyKbaapX6CdGm20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749057878; c=relaxed/simple;
	bh=d1Kq88RwF6WpW/vWXpBCXVjml0oJ+qg5wUHOdtKysjM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=ZvEwkz1Lg7EIJ/OkCmk4hbOFcBWzTpk5nEbIS5w03M1IavbfKne0QBEhj/fDSQki/JbqpErDNxPQ8GAiRe/NkR4tjyK8yu4BwnY/aXlkVEaO/cB9Kc912TqJoMIKWGDhtxVG41Bxvrc3Rn+CPFLHQafnmJTpomTe0kvdwKmqJTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H6rpIk+R; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H6rpIk+R"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-235e1d4cba0so772265ad.2
        for <linux-kernel@vger.kernel.org>; Wed, 04 Jun 2025 10:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749057876; x=1749662676; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zhG1JhoXZUo1f3yXWr0+fS3M+qXdVl1plAhbPO0kUgA=;
        b=H6rpIk+RuvnApxZo5rr3vAdBJJ9CykulaV/jYYP1tJxxocsdEXLNxXgpTZe5e6RT7x
         gQO1e5Ot7USaXRiDMRtTUlhOnc5vWLBNWpuHV2dMRj3VE9FdedXDAwmTlNySBthVMkvQ
         eGCy44HdHYwdDgwJQHD2bchzeD6cXaZTkk4uEfVG+f/MH+UucUPw2o5/+hlQFHMYxMNj
         xy2f4tskG9DYg8vqnbSl2XHz4QNqY5X122Q40af725psDV46lXAZwVFPCHKRt/jV/GDe
         zWNpZurUe4InvneyCYWkmt5eJT7bgA7L1XnvCRMU1Ab69kzaiMmYFynq7edCFG7Uc483
         dJQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749057876; x=1749662676;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=zhG1JhoXZUo1f3yXWr0+fS3M+qXdVl1plAhbPO0kUgA=;
        b=XnxsQJYz9/0L9uhnwDG2IbcJ902dEcAR3lsq4s6YMyjvkxKrZo/BH7vMn3IsbFbtrt
         bG0EPrtH4d7f/yvnViuxx9Fj05ajfXLVD5jNxFxrWjm/WOlERXNOe/1ftFOqbpuy9DIh
         ijfXAeZa5D6LkIMRvAAZKl/6lBMJ21fplW98UL1/jxS1dAmXR4Iz/fg0owX+H6masptf
         oEGEFoyo6csO4r8oBLpFtz8Zs7cwMHGPJgdVffY8K0VUXsRfcYnq45zLMwda7WIdayWr
         Nh/eNg73/8I57eUvrH92e28lgiFA7mW3D8+leNLAMlN/rWv7W8Pzk5dwVXCNCwGG6NAe
         LaqQ==
X-Gm-Message-State: AOJu0YwWwh/1dvSJMOQ/lugX5c0M4DJhx33XtgmjfE+x79PWgOQ/VkNF
	BG8Tf0w3oFtEqfEXnR/dYIz6+YpYs8J6yAF6TOsYlfZ4ulcNmDmT585ATRGNJg==
X-Gm-Gg: ASbGncuX0bAhEk7D1eq0+ThwCUVJYSzPYhYXJAKddyDfCzD+lNt3cTVJ8Ky5AIXKlGV
	3kjsVc+hnZc9e3/NfAct2sBMX5y+4DeRY4zPiNBet4+Hp/V6Zapbv+D/hmbzqdD9ES2TlyGpCHQ
	YbFspAkA3oE/fZLAjPZEVvjjx+n8w5kej5y5qMZCVLyUjgsnxpeZOKFqhU4bbUFczRiTFp4vLmL
	6MOLeFeIfpn9RRyu1w2s6kDtaOcUtBjSZRqD5Bj52EFBwCZuLcOaU/joDS6N+Rk4ofnsFdSHxMT
	ypkkcHOKOo8P3+UC4esBoiKrkISYkG4zTA+UKYIxEkNJ6sTPix97e7DpdsAz0VAVykhsrAkXPu2
	skbNl8RAf5P3h/OscIQg1YgV4bjuEtkHcrKB0e9L7yw==
X-Google-Smtp-Source: AGHT+IFX+2C7dStz6l25B6CR114tcxl2LulaJZmZkforLWsc1A1k86t9Ufv4s0w9RWZANI/jnMPbPg==
X-Received: by 2002:a17:903:22c5:b0:235:779:edfa with SMTP id d9443c01a7336-235e11e3c77mr57450655ad.32.1749057876157;
        Wed, 04 Jun 2025 10:24:36 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com ([2a00:79e0:2e14:7:5d7a:a6c3:97d2:ecd])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b2eceb9d33csm8944908a12.47.2025.06.04.10.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Jun 2025 10:24:35 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net,
	kernel-team@android.com
Cc: Daeho Jeong <daehojeong@google.com>,
	Chao Yu <chao@kernel.org>
Subject: [PATCH] f2fs: turn off one_time when forcibly set to foreground GC
Date: Wed,  4 Jun 2025 10:24:26 -0700
Message-ID: <20250604172426.3683837-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1266.g31b7d2e469-goog
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Daeho Jeong <daehojeong@google.com>

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Fixes: 9748c2ddea4a ("f2fs: do FG_GC when GC boosting is required for zoned devices")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.49.0.1266.g31b7d2e469-goog

