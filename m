Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527EB1FCFC0
	for <linux-kernel@vger.kernel.org>; Fri, 13 Jun 2025 03:25:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749785109; cv=none; b=Q1aMWy0QolqR1ayZ7lWz3+UhseYfEd3Eq67f0O9nD2oRDY2vg4MfOEyEdwF55LPNLQWfEHrWxab4XPPZc+rn9VK01/7HYMptP1+1nXYgnfc3i5OPvSjHHPyfwjMUHPED5xXqQubxKWW9jIC2bxsk0y6wJ5aNiuOcfFgIno8qxXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749785109; c=relaxed/simple;
	bh=FaPZa9IHzNOvH4bmqcBMC83mjoJKfAKPO/ztTFspTOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=TKmLmyixeQ0BQ0kZz4XZRQehC49StWtneJtJmU2f2qRkmvaUK8ntKrvsDW/gaTLwDV7WDeY2z9fi2ExZLjwO+YoDUWgydi3rPCdzJFCYaKiGhbvUoV/UTSKkHwzyoRg98HZthtMUjv3Ox3MRpeh792dNTJv0IWg5IwI8CfaX/vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=ggFghHLV; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="ggFghHLV"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4508287895dso17543595e9.1
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 20:25:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1749785105; x=1750389905; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2fREc+AJyXByCSx89CWeAOJxNBy6PYYGd7sGZkmHQ8=;
        b=ggFghHLVmYvut5sipTcSHSzxvHvG4bijx5r40UQBnAuZqCb9Ohw7LSb9ihp16dPIyY
         gJ7JIQzcD0XjaBHVeuaw8eQRgT+/OIf1XcSbK7qrVLb+w+87zaxehk4tffBJnZ2Kh4CV
         dW7OgDu76gD11go2GAcUw+uiQ0ZyndBv4c54ESJx/Ep/678uMljetJH8mPxAmhz32jP5
         bHAeTJX53HAwi51kULW1NxuhdrHOwxN2FDhdt6LBoQKG41BNi7ea6Gu2IByeN1kc1QiQ
         ikDvkUpD6ZKZE9QUm39VJ6AFlM5qYOtlHTlEv8TrgHQJ9JNr5AwdkvgDG4a5lY7HiDZG
         0PUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749785105; x=1750389905;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u2fREc+AJyXByCSx89CWeAOJxNBy6PYYGd7sGZkmHQ8=;
        b=Qj65ftWmcAv89aPqy440j372uBJrcMZZw7vADWEszYO/XP3cpZiY6oEh36yMYCBM1o
         jEPNIrwNodVWJ+0Aqqg0vRJVOAHijvq85/sIw4EsnPtt+yKsvIDSLZRIcMRX2Z/988TM
         bDZeX07dheB27TAVA3xtmBFAlWR9lDlUFVu5u/KJWcka7Tl2KxEHcBh1Ar9UvgoK6WX0
         LQm0YjLn91FddXmuX0g2JLzYz6cqVT1T7wMbKpMQBkkikbr8OQU1y6JsMuBeAY8vtrHK
         VaI6b6TykiyXjGvtD6AfAbj8H0G0HdVX2Ww7nVxUB6y+M3OVg1SaPM2bmGdolrirPUT7
         Fo2Q==
X-Forwarded-Encrypted: i=1; AJvYcCX/9gPrIsnPTUAI0hN5jcObQJ6INXwsWqUq3uANDNCLOgCelIXnLRWwSYllSFckWQKPzHAjsFdCq6JL3So=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiETb20dc8JIndk/uSYocV6KX544nsYEXT1plDcc2Q9aa5I7Ek
	SurFANDzF1rt/9ZDASbRzLMY5TzvVSt3yMWGP/jjYWeO/sHSQXW7HmWA/bclYpLs8g==
X-Gm-Gg: ASbGncsKQxXtrKHGfZ/Wtt4VbbK7vKAMPUEdT8sRr0STvYxU84cz7rkdc2qviSoqjzG
	0nTSLSALHIGIov7iH1TZVC+zqJsqXNsQMJ3xPatrcE6T9WHDWBv7Ax1tlq0jH8yjER8QU03TgGf
	ed/8MmqW5xDO1EzmjvUkm9FyYJI5j3kkZ/gK/PDFxunYzHSF4tMFJh05uakp/hcjSxVTjEnjovd
	UPgkmb1WnOk9Eo66QIXYtcCCkVp4ZqDqDO8kHCbeBQJ4lJe1DKJLrK3doZ8LusVaNwmP/gONwLq
	RhsPOrsGtwgDQ7uFPoqvlQB0/HazkYZmhPxU5VtZzGOjzM+f4RE=
X-Google-Smtp-Source: AGHT+IFF2MYUpmBOV7t6AV7qpogCCm7ZuPkeNrX1RdBwqDvurBf2ligtHScARmXgbcqtMwhmDQWkCQ==
X-Received: by 2002:a5d:5f88:0:b0:3a4:d685:3de7 with SMTP id ffacd0b85a97d-3a56a2c323dmr583210f8f.8.1749785105644;
        Thu, 12 Jun 2025 20:25:05 -0700 (PDT)
Received: from localhost ([202.127.77.110])
        by smtp.gmail.com with UTF8SMTPSA id d2e1a72fcca58-748900d0d90sm525256b3a.155.2025.06.12.20.25.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 20:25:05 -0700 (PDT)
From: Wei Gao <wegao@suse.com>
To: Jan Kara <jack@suse.cz>
Cc: Wei Gao <wegao@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-ext4@vger.kernel.org
Subject: [PATCH v2] ext2: Handle fiemap on empty files to prevent EINVAL
Date: Fri, 13 Jun 2025 11:18:38 -0400
Message-ID: <20250613152402.3432135-1-wegao@suse.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250612142855.2678267-1-wegao@suse.com>
References: <20250612142855.2678267-1-wegao@suse.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Previously, ext2_fiemap would unconditionally apply "len = min_t(u64, len,
i_size_read(inode));", When inode->i_size was 0 (for an empty file), this
would reduce the requested len to 0. Passing len = 0 to iomap_fiemap could
then result in an -EINVAL error, even for valid queries on empty files.

Link: https://github.com/linux-test-project/ltp/issues/1246
Signed-off-by: Wei Gao <wegao@suse.com>
---
 fs/ext2/inode.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/ext2/inode.c b/fs/ext2/inode.c
index 30f8201c155f..591db2b4390a 100644
--- a/fs/ext2/inode.c
+++ b/fs/ext2/inode.c
@@ -895,9 +895,15 @@ int ext2_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
 	int ret;
+	u64 i_size;
 
 	inode_lock(inode);
-	len = min_t(u64, len, i_size_read(inode));
+
+	i_size = i_size_read(inode);
+
+	if (i_size > 0)
+		len = min_t(u64, len, i_size_read(inode));
+
 	ret = iomap_fiemap(inode, fieinfo, start, len, &ext2_iomap_ops);
 	inode_unlock(inode);
 
-- 
2.49.0

