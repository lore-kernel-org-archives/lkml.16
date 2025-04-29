Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D12384D02
	for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 09:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745920010; cv=none; b=FAfCskaU/gUK50UX/1y45ohDagfocGTqNQ1m7SQGNMcXv26feP9HdG051hmPuXi8k0ZSgZ7m6KRP2QoEXkbWdzvDPz2m2GwrT0e53KXgFwLV9thkRv25gPf0Y4QQsCrDnJ5aEL00tDNvcwFQy0uOfi8YbpHCBAT7XqsXEZGcP2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745920010; c=relaxed/simple;
	bh=7h6TDK9XO4vi8HAwbxlZy15xoNWwk+1COdubrAjH45o=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KL9hMJAp1HMGaGwHf43bYtYT6eof3P5Z+zN9+QBRjXKZ3BetGXaY69Cl9Rzn2D8cU+oRIKcp1+vtl3Mjtigd3m+f2yWWEYsS5FXcFYEztGyPMwj1xzvOTlVCvHz4n64aP4Wevrf7cxw25BnHZepDd17EWvcCGQigIBrfCDkoCyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com; spf=pass smtp.mailfrom=ionos.com; dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b=fVR99dWh; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ionos.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ionos.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ionos.com header.i=@ionos.com header.b="fVR99dWh"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-43d0782d787so35400225e9.0
        for <linux-kernel@vger.kernel.org>; Tue, 29 Apr 2025 02:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ionos.com; s=google; t=1745920007; x=1746524807; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/khpT6y/LHVtwUJo6f8G8UANag+DTR3Iq07zRFJyCJk=;
        b=fVR99dWhT4ZmLV/m1Fy1r2GhgFtAdO8896BH/FSAQSb3Vi53RsatZd//UBQhOd1b3i
         tEdOb9S57/nTn9B9MM3tDMYgtpkxWugS01p5TKk0WJWdICd6vd+0PO3nrS/f1OSBtIbr
         2wKVsQzrZm3RmZ9/tMr217vvcBX3LWZ6HN61zXAoDL0p6FjOLwTcI3cDFPcamwF6EO/m
         KTZmZd7dQcbeSTB3YJazQfVdxkdmdo5akmsur/Ncx9/GgW4IGL6f+775FlMbK8nCQeXu
         p2M/bGjfWFZDbKJcO0fsQnp9AgTiQtLsht7wdtLtM0ug/C5w/16IaZW6+QvkThHpQ2jV
         owqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745920007; x=1746524807;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/khpT6y/LHVtwUJo6f8G8UANag+DTR3Iq07zRFJyCJk=;
        b=Yf8MwBI7p/pSpy+6B0RgGYxx4L8uQGIj+/bjHYK/ty/zO67QqSubpDxhlRzJWUzl9i
         ElYfWuaBjMXrDDZI7RE31RwH51qMsEp3GlBdhnER7jkEKNZnKjJn8Bj7wkWv/FwlJQTu
         nQim06kwM7s1XMO8sp7KwzF/BdqA1+whps3PLzTUxlPxlnaeFBPkfduQSNba54cB+5mU
         Ib4rkvq6E4FNl1jI5WWphgGzQaWFYOK0r530vjimfJsr0k9C7vkfadarXDS+G3zBdg04
         olnaEmzcEX6adPMciO7s7pkda7Mq+m2JOgIbFLN54COeavmqvrQbtGU6WhRyUTiEaLXu
         DnTA==
X-Forwarded-Encrypted: i=1; AJvYcCWYDKJhWZ4OpZzeZsLzhZRbvS1+tSZZ4kJ7XiQhexc0n8+pKtWHg3wDgtSRGt3TMho0gigyRnQ1/2OPrq4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx/c+bZJrsf/Lxmgt9IyGphoCAIYh5XBiId3MKbcXjh1o+aYkUw
	MkRSyu+DV6x/2oqoAq5SMM3S7wWHg5uInQVd3WuFGU3Nlk7tT9GIZ6zRtsQS4lDUd7XLlvbxkS9
	0
X-Gm-Gg: ASbGncuhhVIGqFfh8B8ItvoXiL5Xkd+sLZSJHZ16fOJfwyi7/beLwO2PHEEtsJvZgp3
	P3N3LFUyOrZjK8GYM1Sh/kh/Mpvo8JPwmuntafb+X6QNbFnVkJSP0XmDfLaAV7NcVhZ4G1/VMJK
	q6vO31Y1ZGpZt7a0PoEoAEp1OUghWat2fBqtPUjYuHs9WsWq5o7neGkTvBt5O8JrETzCgF8jgRn
	ubukVU09kr1FTKvf5jn7ZK1pDvYSPbWgjbesiWC9JL5Jll+9TfzfcThOOWwZSwq0Ur48dxReHsh
	UL/JZbNeJ8KKVaEokBw720JRc4Szle0FyFBzi4VvmMtwvUjIhrh/DqBYkAlJJpVlOiT43yt3fsz
	m8EqDN0oqRYXkjfOS1XX/6TrU2N6bPk49Kyeu2lpA
X-Google-Smtp-Source: AGHT+IGmkb10LLUhYY7LbhpZXzXXe/rQSihIzdVs5Dw8ilO8bgW8q/PStbCy/K14wLZtJipqod7ONA==
X-Received: by 2002:a05:600c:4e90:b0:43d:22d9:4b8e with SMTP id 5b1f17b1804b1-441ac856140mr28432375e9.10.1745920006689;
        Tue, 29 Apr 2025 02:46:46 -0700 (PDT)
Received: from raven.intern.cm-ag (p200300dc6f46c100023064fffe740809.dip0.t-ipconnect.de. [2003:dc:6f46:c100:230:64ff:fe74:809])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-440a0692a22sm169766855e9.2.2025.04.29.02.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Apr 2025 02:46:46 -0700 (PDT)
From: Max Kellermann <max.kellermann@ionos.com>
To: viro@zeniv.linux.org.uk,
	brauner@kernel.org,
	jack@suse.cz,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Max Kellermann <max.kellermann@ionos.com>
Subject: [PATCH 1/2] include/linux/fs.h: add inode_lock_killable()
Date: Tue, 29 Apr 2025 11:46:43 +0200
Message-ID: <20250429094644.3501450-1-max.kellermann@ionos.com>
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

