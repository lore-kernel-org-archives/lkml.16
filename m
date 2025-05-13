Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FDF71ADFFB
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 15:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747148618; cv=none; b=JuCvJnPiWlDg0kRjF6i2LTCW7RAi6JzcRs9u5nKU1zvXQp3q0iT+R7YbeBmRIAnTdthiSvV8KAv0YkB/V/r9JkcurFL6h98yyMUU0X1ZEvr2TSkLAxxhl0X2cn6+uVIF7IrE6iN51Nix+yPXghEBQw041D70IZtjWOoYxFsxSKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747148618; c=relaxed/simple;
	bh=7h6TDK9XO4vi8HAwbxlZy15xoNWwk+1COdubrAjH45o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LYjuEOizIBVEHT6JGLYfyUmOJuffuCc3Ki33mqow+ZtNEBkCavUCKZjJn42ZzropdJAqkLZa6Y9Uauh1JuNC6hmkQBSFyAdcWeWkPl8vC/95HI51ajbucok+iYSEHZbtZJluHSABPKAPsWwaQpOice3MPt5Bocjj1qqPBE+x0e8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=ZyEjKwWr; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="ZyEjKwWr"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-43cfe63c592so59585125e9.2
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 08:03:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1747148614; x=1747753414; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/khpT6y/LHVtwUJo6f8G8UANag+DTR3Iq07zRFJyCJk=;
        b=ZyEjKwWrsAnW2QYtYj32PxzL4lx/x3OofUPS7qiK7++XAsrRtdbWZ7mUCwmesvoHmI
         LPx+IZqLQ8o8K0e4vPf1Bs+gfee4Wuvf4hJALUMDUFHuioV0mu32jgdI8ba/iXZ8Sn0e
         3ysOx0xT9+T0rFv5sAiCPbiG5XISV8aKMnex0HlpsRt78RdD5T3BWzTmFCenMO0n15B5
         5G2ipFt52JMrEAiKAuGLhekvL0h0HJEpQKUvh0HYtiskBN9XIWBuZzHt2ArnT7aUY4OU
         9n8lc4aGfg7kNSDTWGaG/vzNqzxcncQ0DaHb77cFxikBcqLBaRoct4q9hzdFNmDPqrHv
         X7LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747148614; x=1747753414;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/khpT6y/LHVtwUJo6f8G8UANag+DTR3Iq07zRFJyCJk=;
        b=irbm2pi8IoR2ypNB/qKEQkbRNURfRWDTmUQuoVYy0H4/zoj2yafx+wbgcQwZdceLvY
         YbJhONIUhz9ciOfy+qhgxA4kuSrqzG0aqyHIJ0wE9WM2tdUPyOdOotuUTiSBJxlp83X2
         +wcFaTQeyjNRHXBqCyqI6FKemwFV7VEhWkMtRS8kam4hdl9LYsYlBwIzOUxXQHsE9RKc
         wBxjYbaVJEkjHWYuWgsTunbRj10YNfjzBauzTfWArIKUs7KHjhGyROn3HczoHYIzMaCN
         9IZWDeXI2DFTpzPvaFRp8B2Duurn1Q9gk3tn5OnsSoXt8WhGa95bKawTDE5PPku7YGjq
         Qwrw==
X-Forwarded-Encrypted: i=1; AJvYcCWvkibyZf9j9UaIiw4DRLd+x2Rx1u1l2mTZP35MtA9I0PuJ6ZjWahQchk0X97BoH4i1YhJWGDsB/nyMAw0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzi8/wE4H5YpLQXDKIUnjaAenXthm6w/OMheYzhm7uTN6Z6xXs8
	HmmFj7SV1kmeJCRZ0+30gGJzGpjziYTQz7IxEQoife19Ae0gd+yXcl5u+JG37CQ=
X-Gm-Gg: ASbGncuDaOh1AEYEhQKxIaKCJcmQUN+5WI05ACHxKBzEdP+/o6co3P65bFYrzj9TD8a
	SifXbZqRhSA5+N8KZVh9uIEGXrR2AeyrMsipc9+VaX3BY4f5p6fZTGowwueVDK1Gv/szj90adrv
	7Aw4LdJ76YxxM54p7F6Hslf9wMZKP3rjJpJ7/t5NPKchiibDiFj5GkOQZXcwlE4ypbcmVjikYfw
	lZjK5HLksWjLlrxugJ+JS7kEhTsOpvEpuuGc9U912cw3MEfVvVV9feds/rPBOXG+McYvUo/uhWW
	easlKZ+KzcC44IjrKWgU/gXbQ/IjBr0rpe/8ZbxJ98l/u9e488vhD2CGp2ZYDrnEHnxpGOQnEek
	89irP0cXCRKE1RkNoVxYDbrtIddoQnUY1JmgVW1evU6cuu7C6fdg=
X-Google-Smtp-Source: AGHT+IFEihMN3DpCrImIRC/9uCzJ+D24g5H8VE5PHrXwPAY3J3KM1oWCaSDbh+5QuPzDZpLQql8OBQ==
X-Received: by 2002:a05:600c:1d84:b0:441:d2d8:bd8b with SMTP id 5b1f17b1804b1-442eb3a33a1mr34112495e9.8.1747148614433;
        Tue, 13 May 2025 08:03:34 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-442cd34bc2fsm106800805e9.20.2025.05.13.08.03.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 May 2025 08:03:32 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH v2 1/4] include/linux/fs.h: add inode_lock_killable()
Date: Tue, 13 May 2025 17:03:24 +0200
Message-ID: <20250513150327.1373061-1-max.kellermann@ionos.com>
X-Mailer: git-send-email 2.47.2
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Prepare for making inode operations killable while they're waiting for
the lock.

Signed-off-by: Max Kellermann <max.kellermann@ionos.com>
---
 include/linux/fs.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index 016b0fe1536e..5e4ac873228d 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -867,6 +867,11 @@ static inline void inode_lock(struct inode *inode)
 	down_write(&inode->i_rwsem);
 }
 
+static inline __must_check int inode_lock_killable(struct inode *inode)
+{
+	return down_write_killable(&inode->i_rwsem);
+}
+
 static inline void inode_unlock(struct inode *inode)
 {
 	up_write(&inode->i_rwsem);
@@ -877,6 +882,11 @@ static inline void inode_lock_shared(struct inode *inode)
 	down_read(&inode->i_rwsem);
 }
 
+static inline __must_check int inode_lock_shared_killable(struct inode *inode)
+{
+	return down_read_killable(&inode->i_rwsem);
+}
+
 static inline void inode_unlock_shared(struct inode *inode)
 {
 	up_read(&inode->i_rwsem);
-- 
2.47.2

