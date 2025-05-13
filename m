Received: from mail-wm1-f68.google.com (mail-wm1-f68.google.com [209.85.128.68])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 017082BE0EC
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:03:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.68
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148624; cv=none; b=CII/Qn+qPLP/fLeqrpW4JrLxFGw1jXLzAuP+l1MgIfS5+j3WUjkT6udj4+FpscVBfzteT20yiud/I9g4/yPl8nZoX8ovT+uAbY3Oamg3K/AqzaVpbqPilRqd8qVXIEzFJLd82mkOf0VHQ1TsHKxVZZTBI6SB35jou0oBiCmsJBs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148624; c=relaxed/simple;
	bh=OPoPn4GqlKNKnmfT+RpBvoHnjFL78UgPcPRPUpvI6RQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=deWAgsgvfnmq6NU+ufmLi9Ia8yJf6qBq75a4M5WfI8QAJKkKri/wtB84eAC4+sYvBF6TgYIPsCpo80mfFCn+/CArW6Zu+uJTHAQHpdgWdWqtf9E60QpQ7DYwEPLrraJYXEnLK0VQSxElV02vBs+p0tWMR7sG+gujbIANqkt3qdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=VVjGZvNW; arc=none smtp.client-ip=209.85.128.68
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="VVjGZvNW"
Received: by mail-wm1-f68.google.com with SMTP id 5b1f17b1804b1-43cf257158fso39761495e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:03:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747148618; x=1747753418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Db2aWyNP2LxWmcJ/JMP/pRSFXc//O8Zp66NOQ220IGQ=;
        b=VVjGZvNWFrF3+PKvfuRH3rBxv5f6j7NTsnx/Kwy0zY26y/HlqIs4VNNGI9DAtGyJX+
         V8WXUrVU/dp/t8vS5AXXq7EF13KgJ5M6hFTX1joFwylAiVQXsESL7J5CnZoifuPi0L0M
         ytjhC9mgXvrVOdGNFuTaRSbe91h+SydTFZq9ePp2vL5T3RiJ5exY3e0xC0XGAy4eQnyg
         lhX7ZSZ+/EZ7ZNHHY70aghzotkBECK8IyciAkr8bSTz5POe4fdVvXWfVs+yvwer03puN
         xBSmnhGebbbHL2RDCqLESWG637KnUNOjGo3h70+nBdMJ5MKgU3HYgZ7eyiBrv39IT+ln
         pIcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148618; x=1747753418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Db2aWyNP2LxWmcJ/JMP/pRSFXc//O8Zp66NOQ220IGQ=;
        b=OdJkmNhuVaiUkvuDcVEkBbvBy5s7cPqhu/tf6MO2pgqIzvILS7V0PgG0uYtCbJWkyS
         BD1eNdML+7pmlhukx0Rpqmscdvq6XFduoO9Zvx2IAXNCUrjs1rW6PAPSiIEOIudo2Xrx
         Daf1aiSJ9z5lHLIUzrRHh1doI/yMHkC5Dha23BDf4YOylMbegF7lhL93qWiCDspM2vnp
         ZZMHK4MeIxVve8uuFdh+csktjjzyP5bhlrbQq9ka6L38rPBi9ZLh9P458APH1bq7uTGB
         dqJZdi71yQH6K/KpYK6KrRgGNjRyuPkj2D+4vPcCQ2Dn8q36aS7Dkj7YCtTTrSDiUNZR
         q68A==
X-Forwarded-Encrypted: i=1; AJvYcCV9yn+pAUzdG8phEgIS/otqbS+CW6ni6HekQ0o3Ch0TcTpaRFK8kCtO0zFejT/SQBgoSJk2LhIQ0YRv6dY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzqynj110OhXKuhT7Tb2CpiEqcBqcmr2kG6Y8tUzYKD7rS3ZsAl
	smN4hPqQb9Fsv3tP4+QtGUql2CfIVa3bQPyfaaMHEoKvJHjaKi8X7ZajgIOCKw0=
X-Gm-Gg: ASbGnctK7r+YyMQACNeJzx5nvN54E/a2OgXFQHdwVAGzDNAPKYxmN0kqcnGhG7drDP3
	cKE1dnD7EBD3lJwmBFtdfHbZfpMHjhGqbYa4ZCnebEz05Aw4lm09IoSW/ewGsnoScrzC+rEZkP9
	oGWbtscxP15s7NEsMlBZXixUc9FbIMbYwRfnq8GRetxXKPWL/XZUIMhDEY2QlcZwSDAKJe+BOdZ
	P9IljJko4DStT014TjHvNh6AHUFiQRQZmEOVTGEm4RRfQxQiueDMPT/nPrM9dCl8NMBDyTDXEyw
	CPn8ZhvNaguEGZptz3GTpjXzgtnXh7ShqsfptMD0M12ZO7BWL4u309b+9+gVNm9edTe2drlquSA
	AEb10a8J3XYQ+0wZLIR1sNMRnlI0iFP7uLUwZVs9aFc4JOvBs9JE=
X-Google-Smtp-Source: AGHT+IGc+nZ62nfymS4OrutrGsR3feSgKZIQetLXYz32d1Zzau1u1NeuDlXW2cxVVdYZoFLjri83Lw==
X-Received: by 2002:a05:600c:1c8c:b0:442:dc6f:2f11 with SMTP id 5b1f17b1804b1-442de4a8ca9mr86448255e9.25.1747148617838;
        Tue, 13 May 2025 08:03:37 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bc2fsm106800805e9.20.2025.05.13.08.03.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:03:37 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 4/4] fs/read_write: make default_llseek() killable
Date: Tue, 13 May 2025 17:03:27 +0200
Message-ID: <20250513150327.1373061-4-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250513150327.1373061-1-max.kellermann@ionos.com>
References: <20250513150327.1373061-1-max.kellermann@ionos.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Allows killing processes that are waiting for the inode lock.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
v2: split into separate patches

TODO: review whether all callers can handle EINTR; see
 https://lore.kernel.org/linux-fsdevel/20250512-unrat-kapital-2122d3777c5d@brauner/
and
 https://lore.kernel.org/linux-fsdevel/hzrj5b7x3rvtxt4qgjxdihhi5vjoc5gw3i35pbyopa7ccucizo@q5c42kjlkly3/

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 fs/read_write.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/read_write.c b/fs/read_write.c
index bb0ed26a0b3a..0ef70e128c4a 100644
--- a/fs/read_write.c
+++ b/fs/read_write.c
@@ -332,7 +332,9 @@ loff_t default_llseek(struct file *file, loff_t offset, int whence)
 	struct inode *inode = file_inode(file);
 	loff_t retval;
 
-	inode_lock(inode);
+	retval = inode_lock_killable(inode);
+	if (retval)
+		return retval;
 	switch (whence) {
 		case SEEK_END:
 			offset += i_size_read(inode);
-- 
2.47.2

