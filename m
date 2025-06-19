Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 998C33085BA
	for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 11:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750331805; cv=none; b=a7Jwo2cfL5kvpvilyxHO8s3PAybQNXSaz/KGx/4gE9goROAiq8TmulzU3bVUXeoU+wam9oYRTtyBTnrgGsDbwfcpJCWvGRMFuTeIfEO/jKGCMa2ogxd7jDwTQ0jAsBCZ/S3LLGjkudHlsyZTvAp+iLrZpBgrkC41S4f4WHka2Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750331805; c=relaxed/simple;
	bh=sFmFBWjCt9UQqe8cCkOcRLUstxK+3Slx2d40xk7W120=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Lg4zmL/AY6XilmaNsd5KhhZNMraAOXj2r3KClnfcMP20kgektenNyicz9D/f4w7KODuhi+9Pwux/UgMDeXXpgo9fOuiBtdWengiF8ZvyDDF0qRfl2CccUzC75xF6vip3dp96g3Pc+Mh7xhXJRpWTiQ2qXACjHgJdPnAGUX32waA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LSYQZxXZ; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LSYQZxXZ"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-235a3dd4f0dso4314755ad.0
        for <linux-kernel@vger.kernel.org>; Thu, 19 Jun 2025 04:16:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750331803; x=1750936603; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GuFM1YbwpAAAQMd/gx8Z2BVa5dBU8bXNQwjwSquZUvk=;
        b=LSYQZxXZtHl6lyO50AD2QHiGGtyBZthKEMltHoxKhKyaPK1M/KAg6+52T9s5LkiAOz
         2XQAev87uZq3qOu4tgyYb8dBgiV04xrg5846lO2wBIMv0K5WKi3dT58Iw9ry85GADM+q
         LYyzcb7TEFrmzht0yUU5w9sQwfgu/7dYnzToRyi9UVyLVCC3mPz3d/wTau6j28O+fo+7
         poKaB1fUiAtL4S+vIbD1EtzbHIwTw/XZF9O3lLltK6z5LTVlmmicFFA/LWhYhL8v1dof
         rjgr/K87O+eSleE8yp++qMoV7uSakE1SKCrYrTK/LL+OWhFFtFaK0UG4JKn/1EOYi2at
         n73A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750331803; x=1750936603;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuFM1YbwpAAAQMd/gx8Z2BVa5dBU8bXNQwjwSquZUvk=;
        b=r5yfwnR5yATBDsOwFHOepDR80gPOiUrYeFFfkuHbpB/iDLznvUjXAXD8i2INX/ej8b
         Gj0OQZJusVHJra9BpJtfN6Y01JfC6SFQdJbxx4uW2kIVfSFfkRk/Masuk5gFS/SDAhuQ
         clkTZcP3D8rEEM7GtkpNktJ2f2Q+qDsSYQkTZ7xfFtBQUWt5V9fcEHZUJA/C66e4Wrgn
         hBAyC6lr+e7MIqpgfpE9S8sJCp5xCzY3GytwgngQI9ixJta1AykmTSB0NzsNFBBfHwOO
         SZJbT7YQ0UR5fGRmUxAMO78XTcRKI1rw+Yz9hTnUX0xEFBD3gSnMALqkP3xBzxgKrGfX
         3RXA==
X-Forwarded-Encrypted: i=1; AJvYcCXTMihMgzsWsO9I51ODhI80wIGjIPZBtP0izyFv+LiH2zaokIZlKb1OR7QINrTzRjLeGtcHYtezcXWmfRc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzf4oTQ+dMkTJl0RfkKaMEYgRmKGo94gNAHZZtHNt+pyEYGxrgw
	SwvyeKq08neUXLb5RyqmYm16PHL759vvAReifrF0qlUJCoMFsTpTp3cpG0BbFtR9
X-Gm-Gg: ASbGncuJTubI9gUu7+xOr0E3rdGnPCsZ+iVNe5sEYYgR0n2HmMeo3c4vGI5zGQhO+ww
	HPE1mz7lAfK2rRELVobG5+Ud3JRSJyhu06Cz+kLj8Ynay4gJ1WBaM2qgqHVBVWdBdp+quS4ZhM1
	ECH22tv0KW+1oOLXTvVTQI+fSCjE2bmU2y/l00FAOuah7eBUcA/OwpGcmD3y0TK/Nz3/SjlTpJT
	7j//EHgXSWzChAke+c2FwzJtOnpp8N8par4IbAfsOxZG79Kztx0RFLeRv0NEqXH0bZYyGobc+DD
	VX8XeWLAskO99W9373R61tHb5zubOi42rnIE/pwWn63YkXMJ0A5n+L+qwCw+ClMxaaXgFWhgGq8
	z9Gv8iHvP1ApjHDIWSI5j
X-Google-Smtp-Source: AGHT+IFr10DL/nrTOrnxO5gYYxx6P2P4jBT1kZ85cwerLt6/BLpP5KnnBr5Y4XQvn0r/OdAjaAEGwg==
X-Received: by 2002:a17:903:40cf:b0:234:ba37:87a5 with SMTP id d9443c01a7336-2366b1224b4mr319180945ad.25.1750331802869;
        Thu, 19 Jun 2025 04:16:42 -0700 (PDT)
Received: from avinash-INBOOK-Y2-PLUS.. ([2401:4900:88e2:4433:2a7d:bb88:9d3c:be74])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2365e0d22edsm117422515ad.240.2025.06.19.04.16.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jun 2025 04:16:42 -0700 (PDT)
From: avinashlalotra <abinashlalotra@gmail.com>
X-Google-Original-From: avinashlalotra <abinashsinghlalotra@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Cc: jaegeuk@kernel.org,
	chao@kernel.org,
	linux-kernel@vger.kernel.org,
	avinashlalotra <abinashsinghlalotra@gmail.com>,
	syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Subject: [PATCH] f2fs: fix KMSAN uninit-value in extent_info usage
Date: Thu, 19 Jun 2025 16:44:07 +0530
Message-ID: <20250619111407.113334-1-abinashsinghlalotra@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

KMSAN reported a use of uninitialized value in `__is_extent_mergeable()` and
`__is_back_mergeable()` via the read extent tree path.

The root cause is that `get_read_extent_info()` only initializes three fields
(`fofs`, `blk`, `len`) of `struct extent_info`, leaving the remaining fields
uninitialized. This leads to undefined behavior when those fields are accessed
later, especially during extent merging.

Fix it by zero-initializing the `extent_info` struct before population.

Reported-by: syzbot+b8c1d60e95df65e827d4@syzkaller.appspotmail.com
Signed-off-by: avinashlalotra <abinashsinghlalotra@gmail.com>
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

