Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 423BA2236F8
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 17:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750785048; cv=none; b=AJAa2H3cQAtDmfU1qNW/RyX8CkzS5CNm0gt8mtpOddVJxJzw8DVH7VyMsHjXBN/ust6cY2K4MGJJpLtIQ5Uqo2b1SuVvPlpdmsgducqj5YXLEyOWCGbLIIR6hTuEwAZvRcfoLQMxzeMW0amlH/szaKP3dKFxvY8OLnbEhtDnVjo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750785048; c=relaxed/simple;
	bh=hriUPBwFVyt1Tq0W1VH2vJm4lcXjMUMifo629zaOxYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=er1p1GiLm0LC68VhpOIwbUhhbIpJGivkP5Au+7OAiGsZw1RDBPr1LBTJi8aoVe13x35ow93iK628MdDME3yPtq9HpAk52I6LATadVZ3HkKkn08MmLvRNPu68101eD5k6dD2X7uOCqjvSTxja+B9OFluXHdbJ9dKKtt4lkeS2yn0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P+g0XZS9; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P+g0XZS9"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-235f9e87f78so61848905ad.2
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 10:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750785046; x=1751389846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lG+ZZuTebOcNyYjtmjeeFWTjaLvNrp0eyAHME7aTcJE=;
        b=P+g0XZS9wdPSwXgtBO5p40QJhWYTGUNEQcsnwwpbQkgLMHHyWG70UjgT+sSWWvv78F
         JfJiaE7nKSWxQYi2WEvc4UT4mgq5IJfu1xNXsjBZLJExXFqotIal9z1Sh+xlCbbLDe8D
         pgAE7AhYYXlaRiX+87ubaP47mz1BRphAGAp8CDWJHJAHkJ5F8iDnmJsRN1sb7liDqIdB
         K85Z9vsT6P4WKnUbj9k0/YyYvZshRS1SPu7QKGDrB5SbSCBGOxkegk2BGxGRI0OiWzqy
         76U/nuUaZZPbs7UWz+wvJxrwvci3qn5EXKMfepQdoInRz+CbHt22WynIeYgY+6wcIdv3
         Vg9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750785046; x=1751389846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lG+ZZuTebOcNyYjtmjeeFWTjaLvNrp0eyAHME7aTcJE=;
        b=Nha83vfjoqjuT2tg4uy3Q4ovtCN/f0Ij6eVBUpcP8NxxGM8ruKOi5AfjWQjIxvuzIB
         TvTR8WhPV0vc+ZG/vZ0IZrREivM7jueJ0ZMTD/3qOd8PCpTwdu0EyQwCQ31W1tW+3M05
         o0uypwRPMjGupvhM5eFFHAEcKv4E36HUWRBF05RHWtIReEBWwhT6id4111p5pM8aFnv4
         +XAwaqMPZ+WUKz+vVN+vbDQ59zeO34KCfOAaVwzwi9WFL5ZMEeWRTQWynAXDVNEOskSJ
         XceKeSmYI9faVStb7XbiSSkk4qRz2xYPs40elhSe+cScFTm04CTet5SYlnYzj4b1r3nZ
         Gyug==
X-Forwarded-Encrypted: i=1; AJvYcCVpvWYRJsoj02OFoEr3qmCj3nsck5rJ3ju7+d3GsTovD1FX4i8HRVpdOsUAlomAwY6NAV6uxGtkHVeIjRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YySJSMVoma0VlES0AhQUcEMj2N+Kd5CtkKhyolm+0y1xCrTIRj7
	AZ6a/mz3SWOonymKiCStCgbyM94E1QqC7YAGHQsBvyp44CYwNguJSRkJ
X-Gm-Gg: ASbGncs6dXFD3r84Nasz/CHHRQd++o2dSqhizhh6mBjD5hPD2WMByJwJNzW76vIcxG1
	CZyTi6WotYMfBNHSS5m0bXCzyhSf2V8CWftDoza4lOAGMaS3zNqiTBvC9YMLRx0lpplJuCzAyXG
	7uuagj6ymHdBRLaOawocXz1ApVGicDI0Gic4yVr9ThLHf1UVedffcTWli52TGGGjR+1+XYSIEtn
	jIC2xnSWosS0kwpIJUvZ9hMYaWNCMyeVQTD58k91qtr+K2hcn+OLNKN99ekmdmt74OmU1pnfLDh
	ShNGs7K2ZN2iQ4UJyrCzbEXV2rj2Iv0f3JBPZ6mE0YLj6mc01bT/+yU61CX4ybrWByDutpRO7nv
	mnPPvm97D4vX7AUW0GyMT
X-Google-Smtp-Source: AGHT+IHQ+kKtjXs47Z0CsvSOM6Q2xOutPeY6vjjbt/IWFEEiKukZaAkj6ZuCQOvD6igvW5iETOwfYw==
X-Received: by 2002:a17:903:b8c:b0:237:e3a0:9d63 with SMTP id d9443c01a7336-23824060224mr1267205ad.43.1750785046407;
        Tue, 24 Jun 2025 10:10:46 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88f7:9fa5:7c44:c012:b691:46c1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-237d83efa44sm112033045ad.77.2025.06.24.10.10.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:10:46 -0700 (PDT)
From: Abinash Singh <abinashlalotra@gmail.com>
X-Google-Original-From: Abinash Singh <abinashsinghlalotra@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: abinashlalotra@gmail.com,
	abinashsinghlalotra@gmail.com,
	chao@kernel.org,
	jaegeuk@kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Subject: [PATCH v3] f2fs: fix KMSAN uninit-value in extent_info usage
Date: Tue, 24 Jun 2025 22:39:48 +0530
Message-ID: <20250624170948.59013-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <1669c05c-7468-4347-a924-cfc4145c8c75@kernel.org>
References: <1669c05c-7468-4347-a924-cfc4145c8c75@kernel.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reported a use of uninitialized value in `__is_extent_mergeable()`
 and `__is_back_mergeable()` via the read extent tree path.

The root cause is that `get_read_extent_info()` only initializes three
fields (`fofs`, `blk`, `len`) of `struct extent_info`, leaving the
remaining fields uninitialized. This leads to undefined behavior
when those fields are accessed later, especially during 
extent merging.

Fix it by zero-initializing the `extent_info` struct before population.

Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=b8c1d60e95df65e827d4
Fixes: a28ef1f5aebe ("f2fs: maintain extent cache in separated file")
Signed-off-by: Abinash Singh <abinashsinghlalotra@gmail.com>
---
v3 : Added Fixes and Closes tags
---
 fs/f2fs/extent_cache.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index cfe925a3d555..4ce19a310f38 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -414,7 +414,7 @@ void f2fs_init_read_extent_tree(struct inode *inode, struct folio *ifolio)
 	struct f2fs_extent *i_ext = &F2FS_INODE(&ifolio->page)->i_ext;
 	struct extent_tree *et;
 	struct extent_node *en;
-	struct extent_info ei;
+	struct extent_info ei = {0};
 
 	if (!__may_extent_tree(inode, EX_READ)) {
 		/* drop largest read extent */
-- 
2.43.0

