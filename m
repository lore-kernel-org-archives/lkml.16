Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00A682609C8
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 16:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746031064; cv=none; b=pjsqV7Zy30snvB/O4FxPasINGvJWc3qAmRxPPsZ2hpTsg8IRpeFsWymcSlUxneUacsfiDvunZzTrKPWe1sjwgvKnWkBs49ijkaF3yx2c1dVlv9TYqhaK+GYQK5pQdqW6OTpj6pW2p/MG51XxNIZFyE7UkM6sCwh9F6l5Mcoy0EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746031064; c=relaxed/simple;
	bh=DLQtM5PA9tnX4LJeaZa3hFR6w41lGFUSQFPETZ1b/x0=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=p4NHTAyhZFPpY0JRN2zqD2AkR5WtTRqnmyL7kQfB8sdDWQEYtr1XWXPAoJWL2p7sOIhHt6vFU5t0dsDbS/zSCdHXbX7VOEyE7Zq4rmoOCnQ8znZbV8ilBhLVvr/o5wUwM4L4z6eOdZCxSRByxhZIB8tOQwV/tMH6fjnakgMFFDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GuXCFgaE; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GuXCFgaE"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-306b6ae4fb3so125137a91.1
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:37:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746031062; x=1746635862; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qxjWOzCodYh6h91i+Fd4DO9wFsqHoGVnoY26/g1sEjk=;
        b=GuXCFgaEL5dxc4t1j91lRsivYKnbJWaF0Vkr2JWD+qRrm3N61E1WVoDNnHH85l/JUc
         JF7wD9H0ISHZ9fpJSagELHnrrpOQJJ9ik8H/dnJvH4Qps4VVD9Z5E3Ojg0mMsb5E0IAW
         cJjMLi7SXE6i6/rLRoSYucyzq4y6EoS68TlR/g2XpNb7vUS2uOEOb528ACg3fJ2aF85K
         s6alY8JvvqQ0r0qRZtQ8Pz8AEJPxSTyCZuHvELCRk+F+nw/fTqwlGXW1r6FjLKTp6Ue0
         0jCNeOECEB/gPYOQla81udqFIK9ad3eu1QwYQ/yjmUCz/W3OLBoznKgcrCDCX/akretX
         WQ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746031062; x=1746635862;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=qxjWOzCodYh6h91i+Fd4DO9wFsqHoGVnoY26/g1sEjk=;
        b=p5rMKTqa1AhlyCbPheukR+DtolnRoM8mJMN8r12ihMik50Q3LAdJ7qVR8LjEqZ6fay
         5ZOdvpJ+lUkbwuzH0UIJ42LUfM8befVzXLPGxDY1XP/jvEYpTknQ+6O3mbZBPQEld4WR
         pkIHigNyBs/093fSZoVsrZU1I2OQkkk4OZmI64Brdolg6Cxne78TvuNao7HOQ0zBE7Cd
         OIJgXDpVUePegWKwRfWjcf5EUwN4SAZx5ZR1H3eaBunGJdqrIou+4AvDCOEe9o/JY7Gu
         3nmF4ksrXueruPmmlRvwsuJFvPYUJRLzbdOmqvljG0OmkRwEGrzR5ydrLVJSFgoejGmr
         GZjw==
X-Gm-Message-State: AOJu0YwpxRu79+HJ679vb2MZvQoPczMqAD6/BmtxQkXg/QhWfKFgz4Mi
	p9co/mltgvzgAr4pHnkWiTVPSJEyxO7CJPhua3wPeFSgrrpr00H9
X-Gm-Gg: ASbGnctZbtXgNRypabkeP1/jNycRQIbFmVOmysqbTSnA91rmHQXqIsbh7zF9xTD4O9+
	mpgdaVX38yqnyoXxtKVeEOqrXI+T0QdtV8G2n/r1cPSUEte29p8TZbt0pCrrXesv7Dn/yS85krl
	VSecQeHehlkhCs9lwbppkT/MrAw0BKDr0AvJmUCa4vwv9N1qnzqqP6YBirhoLfaZi7EU/K13gpn
	vyy8YRiEWBi+OzC/YQtbN/+2YF2AWnQcM6GPaM4a5sJl7sDT00vzHcUMLfd/PAGZ6qJwCKy/5Sp
	EbGFC5Lg9XxD31CnnGz8bzynRTaramcQ4Ajd5GTrofD/dE5TAuSuGpKyUrjgjurySqHjMXaGM3e
	hJIWiItzpGO4o8gX4
X-Google-Smtp-Source: AGHT+IFZGcI74EhGKxPzzAuz4dRadRUA7d+g93mMYCaI9MFy924XUYPiyQ9WM8HNYOOlIamO7v3orQ==
X-Received: by 2002:a17:90a:ba98:b0:2ff:4f04:4261 with SMTP id 98e67ed59e1d1-30a344894fbmr3071328a91.34.1746031062097;
        Wed, 30 Apr 2025 09:37:42 -0700 (PDT)
Received: from localhost (i223-218-150-204.s42.a014.ap.plala.or.jp. [223.218.150.204])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-30a349e3c2csm2025308a91.2.2025.04.30.09.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Apr 2025 09:37:41 -0700 (PDT)
Date: Thu, 01 May 2025 01:37:37 +0900 (JST)
Message-Id: <20250501.013737.1960337608602672035.konishi.ryusuke@gmail.com>
To: syzbot+00f7f5b884b117ee6773@syzkaller.appspotmail.com
Cc: linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot] [nilfs?] possible deadlock in __nilfs_error (3)
From: Ryusuke Konishi <konishi.ryusuke@gmail.com>
In-Reply-To: <68118a52.050a0220.39e3a1.0cab.GAE@google.com>
References: <68118a52.050a0220.39e3a1.0cab.GAE@google.com>
X-Mailer: Mew version 6.8 on Emacs 29.3
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Try removing unnecessary ns_sem lock in init_nilfs() to eliminate lock
dependencies that were causing false positive deadlock warnings in
__nilfs_error() etc.

#syz test

diff --git a/fs/nilfs2/the_nilfs.c b/fs/nilfs2/the_nilfs.c
index cb01ea81724d..d0bcf744c553 100644
--- a/fs/nilfs2/the_nilfs.c
+++ b/fs/nilfs2/the_nilfs.c
@@ -705,8 +705,6 @@ int init_nilfs(struct the_nilfs *nilfs, struct super_block *sb)
 	int blocksize;
 	int err;
 
-	down_write(&nilfs->ns_sem);
-
 	blocksize = sb_min_blocksize(sb, NILFS_MIN_BLOCK_SIZE);
 	if (!blocksize) {
 		nilfs_err(sb, "unable to set blocksize");
@@ -779,7 +777,6 @@ int init_nilfs(struct the_nilfs *nilfs, struct super_block *sb)
 	set_nilfs_init(nilfs);
 	err = 0;
  out:
-	up_write(&nilfs->ns_sem);
 	return err;
 
  failed_sbh:
-- 
2.43.0

