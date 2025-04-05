Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A662F3FC3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 08:03:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743840226; cv=none; b=Mten88O5QB41Wuj1ZjYYxVkIpbAHV3Nu+wNhb2gvgAc0FQR6dapiZk6jsRQl8QxyDRWM2jQAYZPiaTRsZOt9MZPUUGdb1pk7hU3Qlu2bpFamRq1TOFkUnq14oTWS/xYSnnEB4cRJ3+wEQlndP9e5xDz+s262IRELQ9bfOg/XDAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743840226; c=relaxed/simple;
	bh=9fRuxTFU5oLgs8XD26/uTt5ovEGzMUiT1mZ4PMzsLFM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CxMIXyYDx2Ehtq1+dnTeymWEyBleIUdJIxckHgyiTaLslEYDx9HV6Kcq9f7LaCq9IyBxQ74YRRsBykZue+ALFwsoFzWHU0H6aSbKCTCgb2bN4RSoTcUiQTnkMxYgyRwVanExynei5A5nFH4cXI4pe6fnhx6YlB6sR1U0lBltCvI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ndie5jla; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ndie5jla"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2255003f4c6so26240425ad.0
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 01:03:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743840223; x=1744445023; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=Ndie5jlaK+U5NVmPik85Hz2ahh6zgufWoJXVXBoAT5gqAtRrOsMNp+6xHo9FJNg9Am
         gtyRia321Tu/smJBg7MNXIZ3XE8jZRaLr+odHW93wXyMolxn46LyI5O6Y4QzAk50kmnq
         lPe4bcd61QBtlCcaZkoH9s6gvGYAW124WsAFoztpj0cl9wLmQHIi9gAr0fd0SXe8knGx
         W4Fn4KgHzRl2KPJYId0B5iZqefr6SAxQXdhklMII6FUYVyf6SjTsWVUsC4WYRi2lQSoK
         iaKg4VzI1QGcV7FZKufq9L/BzoduEGbpMWo4jbzR5nPpZL2Tbx9KboumV4XyD5bDPK8I
         jcTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743840223; x=1744445023;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tw71iD/nbizJYv4HCNdLTNaax1TiS5PV/IuJM3UEBzM=;
        b=A9DnbC5WfBQVu9yIw/CxtP1J2AOK/KWrP0nDpbj40Y6W3a013H6xpU5siuJ2Oy+Tko
         LDZx9TlG2B3v0b9BPysv1uhMqpBFEFwuB5GbANFTPrcDRotAR0QU0ZcIG5MpGtFNX8tU
         wJTlQCvwJNoXMK04Z8AEVj7nDLKbCQ4cGOjVvpxNZE14DU1WN8w8zAvETd2el/B6TcOl
         AYP8ykxH13wcI5vH3uI6q0DucKqiDSG5kFybe9GZ/OtMDljYjQi2OYqukWIrZNT0Lf0I
         RZSW7eGMDTxaEL0qhSo/78IDCoSgDhkNyMG2oqB2R/s0p3Y19CKLRdAUjg3j4za6kPp1
         HNPg==
X-Forwarded-Encrypted: i=1; AJvYcCWdnIpljiOcnMkE/6ksijXmmz4ILpEXR9h8NRQ5xbZ66Ri9mOz4/vRiYbapJuQ0sFbgDDOP7nrKlRvvs80=@vger.kernel.org
X-Gm-Message-State: AOJu0YyDLEltmTOkg0zLpuvNBIpQdRgqz7pYu3rtzioXsT87Hh572C8I
	a79ltbVgYb2JtL+kQnzxDIPcKe1daBPSigGbu0/CLTfU7DX4RQBo
X-Gm-Gg: ASbGncvkAZicaXRw5K8ncLv3GHfGwskLhH+uCh52S9yDiR34qo56FTc4rIhRuRdPOub
	fjU3QXIRj969Kr4DKhdc6RpZgkBDxoDhCcB7TCjZyxbXOaw+gm5qMwVIrrUAnb8Q1/8fwpwUl/n
	kpIOFxAZwgVbcZqBcM/Q+wLQ5fJLMJi4/pncTbycrPAKZJIwY8DIBJhM7orYpf6/GZ8jBBy3ehl
	2zfbLLg1lbJH0/o1MtzS0U4/s4+6FvUFxD2arkulCxHAdHfI6v3oQ2yVMoXStmPOwzPBZg6wHq8
	zdp4sHo+F/8Ywrmrnt8fwOugIeWiUyiOsIFrH3Q5fGTagMD9qJynqTpVKhArFZ2wmef8vp1H1Ik
	=
X-Google-Smtp-Source: AGHT+IHELtDjmVhehTzN0PLBsfVJPyr5+G1aWDxom++Jf+XDHklxb4Ty85aWMi1iLQ26hVJDrIe6XQ==
X-Received: by 2002:a17:902:cf07:b0:224:1935:fb91 with SMTP id d9443c01a7336-22a8a06cdd8mr77063855ad.27.1743840222873;
        Sat, 05 Apr 2025 01:03:42 -0700 (PDT)
Received: from vaxr-ASUSPRO-D840MB-M840MB.. ([2001:288:7001:2703:309d:74e8:7ab1:1579])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-739d98059d4sm4675544b3a.76.2025.04.05.01.03.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 05 Apr 2025 01:03:42 -0700 (PDT)
From: I Hsin Cheng <richard120310@gmail.com>
To: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Cc: --cc=anna-maria@linutronix.de,
	frederic@kernel.org,
	linux-kernel@vger.kernel.org,
	syzkaller-bugs@googlegroups.com,
	tglx@linutronix.de,
	linux-kernel-mentees@lists.linux.dev,
	skhan@linuxfoundation.org,
	I Hsin Cheng <richard120310@gmail.com>
Subject: [RFC PATCH] timerqueue: Complete rb_node initialization within timerqueue_init
Date: Sat,  5 Apr 2025 16:03:37 +0800
Message-ID: <20250405080337.519110-1-richard120310@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <67e52451.050a0220.2f068f.0027.GAE@google.com>
References: <67e52451.050a0220.2f068f.0027.GAE@google.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The children of "node" within "struct timerqueue_node" may be uninit
status after the initialization. Initialize them as NULL under
timerqueue_init to prevent the problem.

However, syzbot doesn't have any corresponding reproducer yet, please
let me know if it makes sense or not, or any test can help to further
validate it, thanks!

Fixes: '1f5a24794a545 ("timers: Rename timerlist infrastructure to
timerqueue")'
Reported-by: syzbot+d5e61dcfda08821a226d@syzkaller.appspotmail.com
Signed-off-by: I Hsin Cheng <richard120310@gmail.com>
---
 include/linux/timerqueue.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/timerqueue.h b/include/linux/timerqueue.h
index d306d9dd2207..a42fdc83f694 100644
--- a/include/linux/timerqueue.h
+++ b/include/linux/timerqueue.h
@@ -30,6 +30,8 @@ struct timerqueue_node *timerqueue_getnext(struct timerqueue_head *head)
 static inline void timerqueue_init(struct timerqueue_node *node)
 {
 	RB_CLEAR_NODE(&node->node);
+	node->node.rb_right = NULL;
+	node->node.rb_left = NULL;
 }
 
 static inline bool timerqueue_node_queued(struct timerqueue_node *node)
-- 
2.43.0

